#!/bin/bash

echo "Do you want to push data (from local to remote) or pull data (from remote to local)?"
echo "Enter 'push' to push data or 'pull' to pull data:"
read action

if [ "$action" = "push" ]; then
    rsync -av --exclude ".*" -e ssh /home/ sysop@10.0.2.2::NetBackup/Arch --password-file ~/rsync.password
    elif [ "$action" = "pull" ]; then
    rsync -av --exclude ".*" -e ssh sysop@10.0.2.2::NetBackup/Arch/ /home/ --password-file ~/rsync.password
else
    echo "Invalid choice. Please enter either 'push' or 'pull'."
fi
