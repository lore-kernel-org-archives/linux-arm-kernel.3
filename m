Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40A7BCFB422
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 08:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:From:Subject
	:Message-ID:Date:MIME-Version:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=947uRC0q402UiUvSswI3BE0lGbPT4GjfN2hTdWXxB1g=; b=ripnVW28BvfhYov1brs6QVm3Yp
	exNm4AMdW29uuidDc1EPCabVOzQzydzGZF5cYq0gJoC8mCOsnAnimaGxxiSS6xK+rklMDvWDyS6WF
	nk1jQO+ZUAXcixRcQ5ba90lC1O2ATdQaETpXmXK5DJ54J+r0ggRa6XqWxQGCLaJOWDXz5SCtbA0Am
	iyiBoanpzwMqEnb2gnkLmQZXrCBsGYHhO+3u4XP7npDkzcp1MNwFvPp7n7x9gcO2pBDxRHQUFqwYI
	iIDY4x6aZqghiVqnmBG8dfXCh7vEgMIA4hctHdgT8SP/wvURCIDF+/LC+kikBzPlx3qEWrPIKrDwk
	fWLb6yIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7snr-0000000D1yI-3xHQ;
	Mon, 04 Nov 2024 08:51:15 +0000
Received: from mail-il1-f199.google.com ([209.85.166.199])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7sm9-0000000D1f7-2fF3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 08:49:31 +0000
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3a6c427e1b0so11514125ab.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 Nov 2024 00:49:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730710168; x=1731314968;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=947uRC0q402UiUvSswI3BE0lGbPT4GjfN2hTdWXxB1g=;
        b=bntEvmJF/f3W2TKQ9lVSsQGDdqKqi5Ao9LU9VhhRJFc96isA45ppewbPw1Nx63n9T8
         F1NURzQLcdWgmvUlNE7M81RzryBarxev8EHVqfY0hASCUBa+ev9NDhUu02QhaJiY/ecA
         Vc0gkC5kZM2yeOj1ygMpPg371/tZAP9bMSnMQt7bo2wEIJsqUl4KksPIAaxDjwKwQ0Kh
         FQvXChAe1GHvN1zOMncgs/lwZKZz8OQXLmrvPM/DraRfNKLiaFX0OFJZvOP3I7ZUp/PY
         mpZZBUjTz3x4U29swOqv4gAcKpB3zwPCH4RpJMFniibbnUjwBiCjfuO5W3WbdB4fMLb5
         XA/Q==
X-Gm-Message-State: AOJu0YxCIyps6tMNeIw/Irisf3F5kt+dLl7lr3+zvPwnFGu6fUb7vEZk
	U9KadNHDRSlMGrsAjicacd30VnGN/sCZRQsrP0ha75S4YDeJVSGQGSN5G4eGs8+Sj9ARj1b7VPY
	//Pftl60y3Eh/LGsZCnYUrQ2NarB8uiC4vgxwzEKT0KU+K+2EEy46Elc=
X-Google-Smtp-Source: AGHT+IEraG8UYTtPnu608+FJ+QAnn13yFAeB99aFB+ak6LqIkI+897kGnsZ07OQ1O3rdIeRzGAAnQM/PmJfPK6tR/0xqKeF/+K53
MIME-Version: 1.0
X-Received: by 2002:a92:cd8d:0:b0:3a6:b26f:a5c4 with SMTP id
 e9e14a558f8ab-3a6b26fa5efmr85140975ab.8.1730710168042; Mon, 04 Nov 2024
 00:49:28 -0800 (PST)
Date: Mon, 04 Nov 2024 00:49:28 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67288a98.050a0220.35b515.01b5.GAE@google.com>
Subject: [syzbot] Monthly arm report (Nov 2024)
From: syzbot <syzbot+list51e520114d625491a66d@syzkaller.appspotmail.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_004929_698626_90D5A8D7 
X-CRM114-Status: UNSURE (   5.68  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hello arm maintainers/developers,

This is a 31-day syzbot report for the arm subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/arm

During the period, 0 new issues were detected and 1 were fixed.
In total, 5 issues are still open and 5 have been fixed so far.

Some of the still happening issues:

Ref Crashes Repro Title
<1> 3052    Yes   BUG: bad usercopy in fpa_set
                  https://syzkaller.appspot.com/bug?extid=cb76c2983557a07cdb14
<2> 661     Yes   BUG: unable to handle kernel paging request in trans_pgd_create_copy
                  https://syzkaller.appspot.com/bug?extid=2d1f5a94167d430a3bd7
<3> 94      No    WARNING in delayed_work_timer_fn
                  https://syzkaller.appspot.com/bug?extid=e13e654d315d4da1277c

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.

