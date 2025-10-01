Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24087CCA470
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Oct 2025 21:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:From:Subject
	:Message-ID:Date:MIME-Version:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1xa3U68yYOKHDPpIJxyjQuvshkNBKqLyHda+ZM1Ox+M=; b=XRp/T3TonAj9SOWUPnos26xhhN
	cc4X0k1vonq2ovk+hgavhKmHMHEPqTtF8htt9skN8c+UVgrrO9dJPPYh9NCq4iRoUiVOrdOwHpCtR
	0wZMTipZlDST3NQM77p452SUOXQuXr7M83hZbYlYTEZLg9oGdaPdSpqiKC4LV6DbQSwlLrGjRHDwf
	y6aDfj/hTCc+LdiRqETDqbF2mSb+01d0BFwrNUPJn6T5sZmvlpcBEFW0eXCsZWHTS6R/AnhVpzdEv
	T3Pk9tLFxdWdIl0FJMdP1Ur8Onds/wkdHxvXsywto+XP+bvWeOJqd3c7VFsq9pSUcH2rzDyMTvSgU
	bYFEvzyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v44gd-000000095Ov-2iRV;
	Wed, 01 Oct 2025 21:48:35 +0000
Received: from mail-il1-f208.google.com ([209.85.166.208])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v44ga-000000095Ob-2t22
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Oct 2025 21:48:33 +0000
Received: by mail-il1-f208.google.com with SMTP id e9e14a558f8ab-42d8a33a27aso8406465ab.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Oct 2025 14:48:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759355311; x=1759960111;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1xa3U68yYOKHDPpIJxyjQuvshkNBKqLyHda+ZM1Ox+M=;
        b=newtKMjQbd+TjEioNz/cHIgaTF2847SXPoNu9LAe4ID/sNyJTg4Sqm1x5oVbRTIn5M
         dx3pK+YUw1ain4pRSBy203wGe7TmTJHdlheBkS/3XjkryUtKyy5LZDOB1smTKjdtE2zq
         ty1zhhipwiGC/G0FZYD9PzrSs8yaoDZorQZ8xsbk5avbrCfjzcIrJlyFGZfXMUmAerSe
         OVgCzJTG9Mk6eE1xvaNV/+dCvzYXqolqgakACuGucLGUY7dUB5G0xuj6BvqT/5R+F44u
         8f3wPhcSQPyHk8PmjNxk9u2KRHxCKJnkrfbvNvkB89Qma32kSfE+JhnUWmed2it1hx40
         tJ/Q==
X-Forwarded-Encrypted: i=1; AJvYcCV6fzmO4eUd3iyOlCJVbcezDkYVpgCRLlC2bAhNCKSy5iWY+X5WXqSItAuEAiWr7PmE2bzlxhXg6RvX4avNJyrf@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1SGYS0QxhlxLGMElZul4AKCHCSvVcjxBRMmJy+ah1qdmpTbjI
	fAPdotsZ0j3uPmmVnNyf0d4nfUcxkQVAZSpFfaXdzAv7I4BpqYKmLlZ5oTqgPSTCJ3sEtbPVl2X
	gHxXPF2UBuN+jvGqKZGU1qKDGJFXbjRIZynpAV8HUIJEhTPdY1syaQTWP39s=
X-Google-Smtp-Source: AGHT+IE5wIakhy9YKOvGa4bItMlG+QqKT5ISj5Gtsed52/sYxurOGRNJvjOCqe0+edpB/pU6Trd6c1gaRWScAELTJYj6aQy/Ow/o
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1aa7:b0:428:f19b:2947 with SMTP id
 e9e14a558f8ab-42d8159ea64mr82287515ab.6.1759355310914; Wed, 01 Oct 2025
 14:48:30 -0700 (PDT)
Date: Wed, 01 Oct 2025 14:48:30 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68dda1ae.a00a0220.102ee.0065.GAE@google.com>
Subject: [syzbot] [arm?] WARNING in copy_highpage
From: syzbot <syzbot+d1974fc28545a3e6218b@syzkaller.appspotmail.com>
To: catalin.marinas@arm.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com, 
	will@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_144832_732813_27F247FB 
X-CRM114-Status: UNSURE (   8.21  )
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

Hello,

syzbot found the following issue on:

HEAD commit:    fec734e8d564 Merge tag 'riscv-for-linus-v6.17-rc8' of git:..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=12187d34580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=13bd892ec3b155a2
dashboard link: https://syzkaller.appspot.com/bug?extid=d1974fc28545a3e6218b
compiler:       aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
userspace arch: arm64

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/fa3fbcfdac58/non_bootable_disk-fec734e8.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/d7e18b408aea/vmlinux-fec734e8.xz
kernel image: https://storage.googleapis.com/syzbot-assets/9b7984f47117/Image-fec734e8.gz.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+d1974fc28545a3e6218b@syzkaller.appspotmail.com

------------[ cut here ]------------
WARNING: CPU: 1 PID: 25189 at arch/arm64/mm/copypage.c:55 try_page_mte_tagging arch/arm64/include/asm/mte.h:93 [inline]
WARNING: CPU: 1 PID: 25189 at arch/arm64/mm/copypage.c:55 copy_highpage+0x150/0x334 arch/arm64/mm/copypage.c:55
Modules linked in:
CPU: 1 UID: 0 PID: 25189 Comm: syz.2.7336 Not tainted syzkaller #0 PREEMPT 
Hardware name: linux,dummy-virt (DT)
pstate: 00402009 (nzcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
pc : copy_highpage+0x150/0x334 arch/arm64/mm/copypage.c:55
lr : copy_highpage+0xb4/0x334 arch/arm64/mm/copypage.c:25
sp : ffff800088053940
x29: ffff800088053940 x28: ffffc1ffc0acf800 x27: ffff800088053b10
x26: ffffc1ffc0acf808 x25: ffffc1ffc037b1c0 x24: ffffc1ffc037b1c0
x23: ffffc1ffc0acf800 x22: ffffc1ffc0acf800 x21: fff000002b3e0000
x20: fff000000dec7000 x19: ffffc1ffc037b1c0 x18: 0000000000000000
x17: fff07ffffcffa000 x16: ffff800080008000 x15: 0000000000000001
x14: 0000000000000000 x13: 0000000000000003 x12: 000000000006d9ad
x11: 0000000000000000 x10: 0000000000000010 x9 : 0000000000000000
x8 : 0000000000000000 x7 : 0000000000000000 x6 : 0000000000000000
x5 : ffff800088053b18 x4 : ffff80008032df94 x3 : 00000000ff000000
x2 : 01ffc00003000001 x1 : 01ffc00003000001 x0 : 01ffc00003000001
Call trace:
 try_page_mte_tagging arch/arm64/include/asm/mte.h:93 [inline] (P)
 copy_highpage+0x150/0x334 arch/arm64/mm/copypage.c:55 (P)
 copy_mc_highpage include/linux/highmem.h:383 [inline]
 folio_mc_copy+0x44/0x6c mm/util.c:740
 __migrate_folio.constprop.0+0xc4/0x23c mm/migrate.c:851
 migrate_folio+0x1c/0x2c mm/migrate.c:882
 move_to_new_folio+0x58/0x144 mm/migrate.c:1097
 migrate_folio_move mm/migrate.c:1370 [inline]
 migrate_folios_move mm/migrate.c:1719 [inline]
 migrate_pages_batch+0xaf4/0x1024 mm/migrate.c:1966
 migrate_pages_sync mm/migrate.c:2023 [inline]
 migrate_pages+0xb9c/0xcdc mm/migrate.c:2105
 do_mbind+0x20c/0x4a4 mm/mempolicy.c:1539
 kernel_mbind mm/mempolicy.c:1682 [inline]
 __do_sys_mbind mm/mempolicy.c:1756 [inline]
 __se_sys_mbind mm/mempolicy.c:1752 [inline]
 __arm64_sys_mbind+0xd0/0xd8 mm/mempolicy.c:1752
 __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
 invoke_syscall+0x48/0x110 arch/arm64/kernel/syscall.c:49
 el0_svc_common.constprop.0+0x40/0xe0 arch/arm64/kernel/syscall.c:132
 do_el0_svc+0x1c/0x28 arch/arm64/kernel/syscall.c:151
 el0_svc+0x34/0x10c arch/arm64/kernel/entry-common.c:879
 el0t_64_sync_handler+0xa0/0xe4 arch/arm64/kernel/entry-common.c:898
 el0t_64_sync+0x1a4/0x1a8 arch/arm64/kernel/entry.S:596
---[ end trace 0000000000000000 ]---


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup

