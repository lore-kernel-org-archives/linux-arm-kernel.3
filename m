Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 744D4E77180
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 08:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:From:Subject
	:Message-ID:Date:MIME-Version:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Ycfgc8QgugyriqRVXVSDYX2PyQfiPiYWZslUUpz5tsQ=; b=Sj/32Z10dJqoQbZSojfjw2oTTw
	SvWvo6TxEC54o1blPG/FnGHSbhs25f8TCO8FPENyqHf+YL5Xe7fXI0VbuEnSaVoeMwc+m75gHfDFD
	3gq9nuYHnFZrF5Xz+6CI+UzIXHYvugEch5bVx5HgsSx3VhIUdDw8JF1CRkXo3CBW5jO6y35RCFA1I
	i6eiS76eJOpNHvXryjUJms18xkcMNYUevhsZ16xqyMD4nOJeIBunprJC40VaW+V7iYJKyoGoZlGb5
	cqQP1PJmzIMBumW55bxsBwaTmUzjLUC7UhxuQfeApzzBBphwhOIahQFPt+i56BELD7TalM4Q989Pi
	OkmBH1Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLesw-0000000HN13-0GZc;
	Thu, 12 Dec 2024 08:49:26 +0000
Received: from mail-il1-f207.google.com ([209.85.166.207])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLers-0000000HMmr-1BHT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 08:48:21 +0000
Received: by mail-il1-f207.google.com with SMTP id e9e14a558f8ab-3a814c7d58eso3472455ab.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Dec 2024 00:48:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733993298; x=1734598098;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ycfgc8QgugyriqRVXVSDYX2PyQfiPiYWZslUUpz5tsQ=;
        b=WzNtYJiwKpxNyfNlNSD0J5Zocy742FcvLXDy6LiaMQK7jeXG5wTVMSba0awi86o29W
         tmVjnkPCFmAShitMLuCjkxUdvBVRZCAH7tEYPO6KTr4HxP2THhtRrv+F8Da/wW9fn1HN
         l4FPngYY59veHiJx89fxYBi3nujhOoLve5OZ4ISQDkt8tWgaSDAukn487mscnsyhfx9i
         xWoi1pUycciGLZ8p6kiFvRxXBe1bjDgXSqj5GTtoJLy2rvtAyYhJ8KMv3NIRCp6mZJ2X
         KidTo/zseWYkaIHmiTw6MN2Lc1NTLuLmB/YJSmte8/5O4hdOBwiVoo6Y42Yy4I1vc1Qg
         zOWg==
X-Forwarded-Encrypted: i=1; AJvYcCVfiWIy1ALhWy8kPUG1kypMSvrC5BcII2QqquCnLliuu9nEAcqoptNcSrpTEiVVAjDDqOBiSqGpS/A2MZUs3d+4@lists.infradead.org
X-Gm-Message-State: AOJu0YxcQCPoZytNs97sR+jT0zCPhokeKu8mVVjwdxJvGdX9LqJnJGos
	Za9XXvWB3N/nJmaGB7PbMAW2Qu6Nen2zji7HvWRqZMBk17g1PgwlwFIrO093dsU4PW0ZrXjHHbQ
	4zUMY/WtkMAoH7cjaNaq+HgM3TxusxsbpJUVLE5NqAqGsvj2+P4b0Uy4=
X-Google-Smtp-Source: AGHT+IEYh/r9P3Q2d590TMg1aUem7Xugr7uvi7+uIQXGql0+VotmkVmcnbxilKgnIKn53sCV1Elnx8Lm494WyNGaIYBb+5zjsXrV
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1c01:b0:3a7:172f:1299 with SMTP id
 e9e14a558f8ab-3ac4b434e57mr27238975ab.12.1733993298165; Thu, 12 Dec 2024
 00:48:18 -0800 (PST)
Date: Thu, 12 Dec 2024 00:48:18 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <675aa352.050a0220.1ac542.0018.GAE@google.com>
Subject: [syzbot] [kvmarm?] BUG: unable to handle kernel paging request in __hwasan_check_x0_ADDR
From: syzbot <syzbot+67a9ec5b1706e0184581@syzkaller.appspotmail.com>
To: catalin.marinas@arm.com, joey.gouly@arm.com, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	maz@kernel.org, oliver.upton@linux.dev, suzuki.poulose@arm.com, 
	syzkaller-bugs@googlegroups.com, will@kernel.org, yuzenghui@huawei.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_004820_318219_081360E6 
X-CRM114-Status: UNSURE (   8.04  )
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

HEAD commit:    5db899a34f75 Merge remote-tracking branch 'kernel/kvmarm/n..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm.git fuzzme
console output: https://syzkaller.appspot.com/x/log.txt?x=16db78f8580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=fde68ab6d6c8c8ab
dashboard link: https://syzkaller.appspot.com/bug?extid=67a9ec5b1706e0184581
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
userspace arch: arm64

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/384ffdcca292/non_bootable_disk-5db899a3.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/4938b757ff4a/vmlinux-5db899a3.xz
kernel image: https://storage.googleapis.com/syzbot-assets/936938b47987/Image-5db899a3.gz.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+67a9ec5b1706e0184581@syzkaller.appspotmail.com

Unable to handle kernel paging request at virtual address efff800000000137
KASAN: probably user-memory-access in range [0x0000000000001370-0x000000000000137f]
Mem abort info:
  ESR = 0x0000000096000005
  EC = 0x25: DABT (current EL), IL = 32 bits
  SET = 0, FnV = 0
  EA = 0, S1PTW = 0
  FSC = 0x05: level 1 translation fault
Data abort info:
  ISV = 0, ISS = 0x00000005, ISS2 = 0x00000000
  CM = 0, WnR = 0, TnD = 0, TagAccess = 0
  GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
swapper pgtable: 4k pages, 52-bit VAs, pgdp=0000000044a53000
[efff800000000137] pgd=1000000049992003, p4d=1000000049993003, pud=0000000000000000
Internal error: Oops: 0000000096000005 [#1] PREEMPT SMP
Modules linked in:
CPU: 0 UID: 0 PID: 6560 Comm: syz.2.929 Not tainted 6.12.0-rc7-syzkaller-g5db899a34f75 #0
Hardware name: linux,dummy-virt (DT)
pstate: 80402009 (Nzcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
pc : __hwasan_check_x0_67043363+0x4/0x30
lr : vgic_get_irq+0x7c/0x3d4 arch/arm64/kvm/vgic/vgic.c:93
sp : ffff80008c597650
x29: ffff80008c597660 x28: 00000000000000e0 x27: 0000000000000004
x26: 0000000000000002 x25: ffff800083a7fe20 x24: 16f0000014accd90
x23: 16f0000014acb9a0 x22: 0000000000000000 x21: a9ff80008c583000
x20: 0000000000000001 x19: efff800000000000 x18: 0000000000000005
x17: 0000000000000000 x16: 0000000000000137 x15: 0000000000000000
x14: 0000000000000002 x13: 0000000000000003 x12: 70f000000a33ba80
x11: 0000000000080000 x10: 0000000000001378 x9 : efff800000000000
x8 : 0000000000000001 x7 : 0000000000000001 x6 : 0000000000000001
x5 : ffff80008c597858 x4 : ffff8000800f2b38 x3 : ffff8000800f7a00
x2 : 0000000000000001 x1 : 0000000000000001 x0 : 0000000000001378
Call trace:
 __hwasan_check_x0_67043363+0x4/0x30
 vgic_mmio_write_invlpi+0xb0/0x174 arch/arm64/kvm/vgic/vgic-mmio-v3.c:546
 dispatch_mmio_write+0x2a4/0x308
 kvm_iodevice_write include/kvm/iodev.h:54 [inline]
 __kvm_io_bus_write+0x290/0x340 virt/kvm/kvm_main.c:5852
 kvm_io_bus_write+0x100/0x1bc virt/kvm/kvm_main.c:5877
 io_mem_abort+0x4b8/0x7a0 arch/arm64/kvm/mmio.c:204
 kvm_handle_guest_abort+0xb4c/0x1c64 arch/arm64/kvm/mmu.c:1880
 handle_trap_exceptions arch/arm64/kvm/handle_exit.c:351 [inline]
 handle_exit+0x1a0/0x274 arch/arm64/kvm/handle_exit.c:381
 kvm_arch_vcpu_ioctl_run+0xbc0/0x15b0 arch/arm64/kvm/arm.c:1279
 kvm_vcpu_ioctl+0x660/0xf78 virt/kvm/kvm_main.c:4475
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:907 [inline]
 __se_sys_ioctl fs/ioctl.c:893 [inline]
 __arm64_sys_ioctl+0x108/0x184 fs/ioctl.c:893
 __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
 invoke_syscall+0x78/0x1b8 arch/arm64/kernel/syscall.c:49
 el0_svc_common+0xe8/0x1b0 arch/arm64/kernel/syscall.c:132
 do_el0_svc+0x40/0x50 arch/arm64/kernel/syscall.c:151
 el0_svc+0x54/0x14c arch/arm64/kernel/entry-common.c:712
 el0t_64_sync_handler+0x84/0xfc arch/arm64/kernel/entry-common.c:730
 el0t_64_sync+0x190/0x194 arch/arm64/kernel/entry.S:598
Code: a90efbfd d2800441 143a3ed3 9344dc10 (38706930) 
---[ end trace 0000000000000000 ]---
----------------
Code disassembly (best guess):
   0:	a90efbfd 	stp	x29, x30, [sp, #232]
   4:	d2800441 	mov	x1, #0x22                  	// #34
   8:	143a3ed3 	b	0xe8fb54
   c:	9344dc10 	sbfx	x16, x0, #4, #52
* 10:	38706930 	ldrb	w16, [x9, x16] <-- trapping instruction


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

