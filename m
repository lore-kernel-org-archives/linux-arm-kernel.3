Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B4B1CAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Sep 2025 22:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:From:Subject
	:Message-ID:Date:MIME-Version:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=skU/vYmvoIGL8QnH64Wc2Vz3FYqQnJfrcQBRqXYYRXs=; b=tXFK1vg2u2kqcODJ/ZmIqvYzbR
	duoCULIDBKf5pjDMjRx8nMWJOn6ChGVBed4m/RRt6mc1Es8qu0ue9u4ocyTS4FxrMowr+m0zMCuME
	UE1+MBMbD+/fw3L2KIsA6Ufv3WJXwuA3ZRUvWparGPHJCO2+N8DcSPkYM960JlYs8SE1lN4M6e7wH
	pe5YnWxqM5KeienI7EokP+EvXgkg9Iwc1RANkYmr0FEg56+6ixvhAG9Y9jjbatUlibcwqSy1x4Tsg
	lumQSw2rDtL539nEmijlKKRc2BP2gqurldfToYhZP1a4ex1WIGyy56hBELDt+I30r3/DAvGtf+FcF
	01kXBWZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0S8h-00000008IrD-00Z6;
	Sun, 21 Sep 2025 22:02:35 +0000
Received: from mail-io1-f72.google.com ([209.85.166.72])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0S8d-00000008IqR-1EUr
	for linux-arm-kernel@lists.infradead.org;
	Sun, 21 Sep 2025 22:02:33 +0000
Received: by mail-io1-f72.google.com with SMTP id ca18e2360f4ac-8870219dce3so393086039f.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 21 Sep 2025 15:02:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758492150; x=1759096950;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=skU/vYmvoIGL8QnH64Wc2Vz3FYqQnJfrcQBRqXYYRXs=;
        b=wxmHkr00rviJ52binUkbUvRBf4HVCbRPH6np/1Bkc1RuVo2OUjimpw7L+C4Z+pmIvf
         Q6DncDRsLwEaS6v6SeBLrUr36bwx4tl2zLp+I5KgxVTJhiM9PVMuz5e7uI+7qtRKnUfm
         KEu5USX0yntIHIV/A5preZZnMsGZ5GsaFi09QO6sx3c8/ZgZdbNHy6MwVHKxW6hq2Xy+
         MiuBy9Fk8z5F7Rea1VXb25/0212iobHRv8GUkkQ1YP0Xac/NwSmt+tmqxh3Hd7lZWXHG
         rphiOtRwmVGaoz/+zxhwCBl91KUwZcz27Y/X/7xeDih+WjZFCrf6+0zK6dCrnzaxg2u+
         m/Qg==
X-Gm-Message-State: AOJu0YwuLIqbqhA7blG54vDgbAy64k1uBusNUhIu7mSk3cy4CFnzcIgH
	01KdsPLXuWoxO6wkiZWE1gsTajO0Aqyg2NbQvz7mifk45O2yupvPDp1E0Em4yeiPYV4ezq9Yz73
	cAAgjfsiZEIRt8rvJqqg49krm0siFLj4fwGskd0QCXqQhxUGYbSjQQtVOgOo=
X-Google-Smtp-Source: AGHT+IGi8Bp/WVBn+SQUOchEZBtkSoRc62fX9ItZ9YXTcXRaCeLvXeJBuZ8CSM9XyY1h6rykCpbkHPBxNIBrCd7GhbtoKCb7bZCt
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1746:b0:424:6fe:43c1 with SMTP id
 e9e14a558f8ab-42481968974mr151196685ab.19.1758492149962; Sun, 21 Sep 2025
 15:02:29 -0700 (PDT)
Date: Sun, 21 Sep 2025 15:02:29 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68d075f5.a00a0220.37dadf.0042.GAE@google.com>
Subject: [syzbot] Monthly arm report (Sep 2025)
From: syzbot <syzbot+liste38cfc5b51935cc7deeb@syzkaller.appspotmail.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250921_150231_336506_EF3F8C3B 
X-CRM114-Status: UNSURE (   4.45  )
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

During the period, 0 new issues were detected and 0 were fixed.
In total, 4 issues are still open and 6 have already been fixed.

Some of the still happening issues:

Ref Crashes Repro Title
<1> 13406   Yes   BUG: workqueue lockup (5)
                  https://syzkaller.appspot.com/bug?extid=f0b66b520b54883d4b9d
<2> 232     Yes   WARNING in delayed_work_timer_fn
                  https://syzkaller.appspot.com/bug?extid=e13e654d315d4da1277c
<3> 29      Yes   INFO: task hung in truncate_inode_pages_final (2)
                  https://syzkaller.appspot.com/bug?extid=760777ae7038cad77437

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.

