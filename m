Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1F16CCFA04
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 23:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:From:Subject
	:Message-ID:Date:MIME-Version:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AdyO4gh7iAlQFSoy5CIG4DgiFWF/85SRrg5mDm9g9P0=; b=kAqsjksaLI0r99ClJvm0qNEHjc
	XWr1y4SNiTCMv9q67PCrXN87ZSYclwmKF5Qq7t3+r/XoM3Pc7GonOeJawZK6ziullejbt3TlvuCZP
	MeK1ANe/U8G87oVfvst3mTAN7SrE2b18cmufNkJ3j5V6djMrJEWlEeamoEDBZEx93Xyew1rVZ78Ha
	wGHuVwH6rIkqaHvZIfr72kA21ecAXqWfCceCOAyqb5Q03HGkD4FOUY8pK+WszlhiYFHo7o8U6I/vx
	1UyUEZT9SShag1678B+JMCZvwD2dRo0LK9T2AMuwZxQH+rqkilRpbeF2H97cqbGNQZBv+sIuXe9qw
	rl9Nm5Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGQYp-0000000Cky4-1T5G;
	Tue, 04 Nov 2025 23:35:35 +0000
Received: from mail-il1-f206.google.com ([209.85.166.206])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGQYm-0000000Ckxi-3FVA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 23:35:34 +0000
Received: by mail-il1-f206.google.com with SMTP id e9e14a558f8ab-43323ffc26bso23872495ab.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Nov 2025 15:35:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762299331; x=1762904131;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AdyO4gh7iAlQFSoy5CIG4DgiFWF/85SRrg5mDm9g9P0=;
        b=PGea4Opfkv0yD5gwbLZdft8GXycbAw3+utWGgGFgS5/6rFGkRYKJVH6YTvKjspizuB
         vldKEHpNaaxws9LL7wtZ1x7Q0HVMblzYmQzNcX68e7CQNpLawtAzzgJzxUkWNkTVPFBF
         GDU7z7qsbWkVNAhr2k9x99BwBj8eyS9D/M7uFexBcAm60DeNEpH1XtsTxXCnvrJYaqit
         ugZ9Y8cYhSLWh4JztktAiDv9EMh7qgJN1wOqHe+bruzx6pHX/y383dwSHsthP4sna2n6
         OI62sqxuOhhT3jNz48bJuuCcp7JY6CnTcgSXTUi5PVsdFza+urT42g9PI5rkx64AHQUn
         wH4A==
X-Forwarded-Encrypted: i=1; AJvYcCVa84lvF6HTdvhITgdKBLYHAWTdwuZm/cKDUfLmL9BNpVN7NoysPG/wN390Aa3TCorJVBapTLgg8bcsneTKokLX@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1LRaQO6i/4VBpsY5J3IyF0vuR4fVyTzjAQR+WVen0ZGtXviBl
	/L3iPVbVGxO+b8+8eRs1HNVnfQI2uvA+Wah4TV0kKGIsRGnedM/tZBb5Trnhc9vGXtkIS5TJjn/
	hCB7q0Anmz6SnRMrssbv28AgoYgFlqsVcPWHIr7PE72lpzJfvbF0HTN8Tw2Y=
X-Google-Smtp-Source: AGHT+IH6T+lKfQ6V0XGJrssHrVvl4K2lTnnaX2x+LBqWLou2vuLX+a7xgEa7XLvHl76HJdP0qxUDo2d0Xg7vLWcsNbDALNxYcSFU
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1a8b:b0:433:2dd5:f571 with SMTP id
 e9e14a558f8ab-433407eb3bcmr17291995ab.25.1762299330934; Tue, 04 Nov 2025
 15:35:30 -0800 (PST)
Date: Tue, 04 Nov 2025 15:35:30 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <690a8dc2.050a0220.3d0d33.0018.GAE@google.com>
Subject: [syzbot] [arm?] WARNING in fpsimd_restore_current_state
From: syzbot <syzbot+d4ab35af21e99d07ce67@syzkaller.appspotmail.com>
To: catalin.marinas@arm.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com, 
	will@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_153532_823133_83BE9F5D 
X-CRM114-Status: UNSURE (   8.28  )
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

HEAD commit:    dcb6fa37fd7b Linux 6.18-rc3
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
console output: https://syzkaller.appspot.com/x/log.txt?x=11a79704580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=b8b659f0cab27b22
dashboard link: https://syzkaller.appspot.com/bug?extid=d4ab35af21e99d07ce67
compiler:       Debian clang version 20.1.8 (++20250708063551+0c9f909b7976-1~exp1~20250708183702.136), Debian LLD 20.1.8
userspace arch: arm64
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=115fdf34580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1441d258580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/ae6bec0d0398/disk-dcb6fa37.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/dcc732da66c3/vmlinux-dcb6fa37.xz
kernel image: https://storage.googleapis.com/syzbot-assets/301d1bbdecc2/Image-dcb6fa37.gz.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+d4ab35af21e99d07ce67@syzkaller.appspotmail.com

------------[ cut here ]------------
WARNING: CPU: 0 PID: 6720 at arch/arm64/kernel/fpsimd.c:370 task_fpsimd_load arch/arm64/kernel/fpsimd.c:370 [inline]
WARNING: CPU: 0 PID: 6720 at arch/arm64/kernel/fpsimd.c:370 fpsimd_restore_current_state+0x4cc/0x708 arch/arm64/kernel/fpsimd.c:1746
Modules linked in:
CPU: 0 UID: 0 PID: 6720 Comm: syz.0.17 Not tainted syzkaller #0 PREEMPT 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/03/2025
pstate: 83400005 (Nzcv daif +PAN -UAO +TCO +DIT -SSBS BTYPE=--)
pc : task_fpsimd_load arch/arm64/kernel/fpsimd.c:370 [inline]
pc : fpsimd_restore_current_state+0x4cc/0x708 arch/arm64/kernel/fpsimd.c:1746
lr : task_fpsimd_load arch/arm64/kernel/fpsimd.c:370 [inline]
lr : fpsimd_restore_current_state+0x4cc/0x708 arch/arm64/kernel/fpsimd.c:1746
sp : ffff8000a1047de0
x29: ffff8000a1047de0 x28: ffff0000dcfd9ec0 x27: 0000000000000000
x26: 0000000000000000 x25: 0000000000000008 x24: 0000000000000040
x23: 00000000000020ff x22: dfff800000000000 x21: 1fffe0001b9fb3d8
x20: 0000000000000000 x19: ffff0000dcfd9ec0 x18: 1fffe000337db690
x17: ffff80008ae011f8 x16: ffff80008052ae04 x15: 0000000000000001
x14: 1fffe0001b9fb3d8 x13: 0000000000000000 x12: 0000000000000000
x11: ffff60001b9fb3d9 x10: 0000000000ff0100 x9 : 0000000000000000
x8 : ffff0000dcfd9ec0 x7 : 0000000000000000 x6 : 0000000000000000
x5 : 0000000000000001 x4 : 0000000000000008 x3 : ffff8000801f8344
x2 : 0000000000000001 x1 : 0000000000000000 x0 : 0000000000000000
Call trace:
 task_fpsimd_load arch/arm64/kernel/fpsimd.c:370 [inline] (P)
 fpsimd_restore_current_state+0x4cc/0x708 arch/arm64/kernel/fpsimd.c:1746 (P)
 arch_exit_to_user_mode_work arch/arm64/include/asm/entry-common.h:25 [inline]
 exit_to_user_mode_loop+0xe4/0x178 kernel/entry/common.c:46
 exit_to_user_mode_prepare include/linux/irq-entry-common.h:225 [inline]
 arm64_exit_to_user_mode arch/arm64/kernel/entry-common.c:103 [inline]
 el0_svc+0x170/0x254 arch/arm64/kernel/entry-common.c:747
 el0t_64_sync_handler+0x84/0x12c arch/arm64/kernel/entry-common.c:765
 el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:596
irq event stamp: 129
hardirqs last  enabled at (127): [<ffff80008ae151bc>] __raw_spin_unlock_irq include/linux/spinlock_api_smp.h:159 [inline]
hardirqs last  enabled at (127): [<ffff80008ae151bc>] _raw_spin_unlock_irq+0x30/0x80 kernel/locking/spinlock.c:202
hardirqs last disabled at (129): [<ffff80008adecb80>] el1_brk64+0x20/0x54 arch/arm64/kernel/entry-common.c:434
softirqs last  enabled at (8): [<ffff8000801f95fc>] local_bh_enable+0x10/0x34 include/linux/bottom_half.h:32
softirqs last disabled at (128): [<ffff8000801f95c8>] local_bh_disable+0x10/0x34 include/linux/bottom_half.h:19
---[ end trace 0000000000000000 ]---


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup

