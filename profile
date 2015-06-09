# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

#clear files for new session
/usr/bin/rsync -a --delete --exclude=".*" --exclude=".*/" --exclude="PlayOnLinux\'s\ virtual\ drives*" /etc/skel/guest-pref/ /home/guest-pref/
rm ~/.mozilla/firefox/*.default/cookies.*;
rm ~/.mozilla/firefox/*.default/*.sqlite ~/.mozilla/firefox/*default/sessionstore.js;
rm -r ~/.cache/mozilla/firefox/*.default/*
rm -r ~/.config/google-chrome

#empty trash
/usr/bin/trash-empty

#allow notification popups
/usr/bin/xhost local:$LOGNAME > /dev/null

#set volume at start
/usr/bin/pactl set-sink-volume 0 25%
