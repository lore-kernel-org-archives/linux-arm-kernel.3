Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3113DCCF2C7
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Oct 2026 02:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:From:Subject
	:Message-ID:Date:MIME-Version:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=s0staK1toosvVTYdUZvQImybVckAdiMM5CzJz98ALkE=; b=JKLcMSD0jcSXPFlhewHGihJOnS
	Ssiu+jWod0ObgdASmbnFNwdsIjYXTq/OsLVfaXbaC6sliINpe2VBGDl4D7BRX0qJ8vdpvdmmOgPAX
	6xLglPKhKtPevtDjLGT+Qw7RGpsc/lrV5Mk/9q2ykyL2g3MvhNW67oXgnVzRxBDn56oYaXBFxwTHP
	0sN3t8PhEByfzJo5f8NZnV3hvUb0LJ7CsH911eZbn4ZququhJPd9d8KOV75mzsxY9hV7OlnJ32MX4
	m91v/0waLvPSrb9kBXDveK5aCJ21WCu6zdgy1/x4Oo0E4q9aFDp+HaJlQnAN0MVp/vKNTaBKGluUD
	aSk0W9Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIGJB-00000005R2d-28bn;
	Sun, 18 Oct 2026 02:07:33 +0000
Received: from mail-oi1-f198.google.com ([209.85.167.198])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIGJ6-00000005R2A-1mrG
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 Oct 2026 02:07:31 +0000
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4dc57e2a3f2so1821411b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 17 Oct 2026 19:07:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792289246; x=1792894046;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s0staK1toosvVTYdUZvQImybVckAdiMM5CzJz98ALkE=;
        b=WO6Nk0Oj1GOCPNYBq+GsrJYFWOpFGzpZUCNJrCrNTKvPMhmbMClIn6CNhg5Ucz60JQ
         Hw42V084qKTMaIorr56bxHHlfaXo5J19n8aQ4rm8BakkfENwXcqKUJIyv914EF1kkvSt
         RxwyP1+eUjfZVnKqe1gzOVGuioOSAevLlwFDA2P/FiY098uWgYQ4Za05wJQAYx4MR/el
         xCnHCoB+gmPQP16FSYSb8jpkwi00KszEGY9KSm7OUVw40CkYHB04Lq0MZiE4hilkKRhC
         ZZbc5GsQM+CuhO7p8L1HjSTwfz3laOAbD/YEOqVXiJG7WxWvgc6IF6K5By5/8zy0X21F
         KvnQ==
X-Gm-Message-State: AFq9FYI4k0V/OmlNrGx1wR4omsb0s0hXmbsA+xpggA2pKdeU9Ocrtvsj
	hSIFR5epVEGksOlly/QCnF0Efp3P1ww3AIfB6LekpWZyvgXRfGC3cTmVR9dN44WrQipyj4T6VYe
	w3Fy0w7J2/ju4mWpLCIy+e5zeGqTw6lACykoVqyO5GwQzR9WmKbMYZraFGkE=
MIME-Version: 1.0
X-Received: by 2002:a05:6808:199b:b0:4f3:e931:9f27 with SMTP id
 5614622812f47-53cd1202ba2mr4493923b6e.53.1792289246314; Sat, 17 Oct 2026
 19:07:26 -0700 (PDT)
Date: Sat, 17 Oct 2026 19:07:26 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ad429de.7f4e89eb.3d59aa.00a9.GAE@google.com>
Subject: [syzbot] [arm?] WARNING in __run_timer_base (3)
From: syzbot <syzbot+c4582e7bc680cba1fcfb@syzkaller.appspotmail.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_190728_475511_408C23E3 
X-CRM114-Status: UNSURE (   6.58  )
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

HEAD commit:    7a19f0cc94ad Merge branch 'for-next/core' into for-kernelci
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
console output: https://syzkaller.appspot.com/x/log.txt?x=128d8121580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=26d6221a572842ac
dashboard link: https://syzkaller.appspot.com/bug?extid=c4582e7bc680cba1fcfb
compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8
userspace arch: arm64
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=11904895580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=113a2621580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/296cd4b77dbf/disk-7a19f0cc.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/e57669ed895f/vmlinux-7a19f0cc.xz
kernel image: https://storage.googleapis.com/syzbot-assets/c679c1ad76d4/Image-7a19f0cc.gz.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+c4582e7bc680cba1fcfb@syzkaller.appspotmail.com

------------[ cut here ]------------
WARNING: kernel/time/timer.c:1786 at expire_timers kernel/time/timer.c:1786 [inline], CPU#1: swapper/1/0
WARNING: kernel/time/timer.c:1786 at __run_timers kernel/time/timer.c:2374 [inline], CPU#1: swapper/1/0
WARNING: kernel/time/timer.c:1786 at __run_timer_base+0x598/0x744 kernel/time/timer.c:2386, CPU#1: swapper/1/0
Modules linked in:
CPU: 1 UID: 0 PID: 0 Comm: swapper/1 Tainted: G   M                syzkaller #0 PREEMPT 
Tainted: [M]=MACHINE_CHECK
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 09/23/2026
pstate: 434000c5 (nZcv daIF +PAN -UAO +TCO +DIT -SSBS BTYPE=--)
pc : expire_timers kernel/time/timer.c:1786 [inline]
pc : __run_timers kernel/time/timer.c:2374 [inline]
pc : __run_timer_base+0x598/0x744 kernel/time/timer.c:2386
lr : expire_timers kernel/time/timer.c:1786 [inline]
lr : __run_timers kernel/time/timer.c:2374 [inline]
lr : __run_timer_base+0x598/0x744 kernel/time/timer.c:2386
sp : ffff80008f7f7d40
x29: ffff80008f7f7e50 x28: ffff0001a4fdfd00 x27: 0000000000000000
x26: ffff0000c8d96970 x25: 00000000ffff98f0 x24: ffff80008f7f7dc8
x23: ffff0000c8d96988 x22: 1fffe000349fbfa0 x21: 1ffff00011efefb9
x20: dfff800000000000 x19: ffff0001a4fdfcc0 x18: 1fffe000349fbc28
x17: ffff80011b89c000 x16: ffff80008f7f0000 x15: 0000000000000000
x14: 00000000001e00c1 x13: 0000000000000001 x12: 0000000000000003
x11: 0000000000000000 x10: 0000000000000003 x9 : 0000000000000102
x8 : 0000000000000000 x7 : ffff8000819951c0 x6 : 0000000000000000
x5 : 0000000000000001 x4 : 0000000000000001 x3 : ffff800080538560
x2 : 0000000000000002 x1 : ffff0000c1aa8000 x0 : 0000000000000000
Call trace:
 expire_timers kernel/time/timer.c:1786 [inline] (P)
 __run_timers kernel/time/timer.c:2374 [inline] (P)
 __run_timer_base+0x598/0x744 kernel/time/timer.c:2386 (P)
 run_timer_base+0x84/0x1b8 kernel/time/timer.c:2395
 run_timer_softirq+0x20/0x48 kernel/time/timer.c:2405
 handle_softirqs+0x324/0xcbc kernel/softirq.c:645
 __do_softirq+0x14/0x20 kernel/softirq.c:679
 ____do_softirq+0x10/0x1c arch/arm64/kernel/irq.c:78
 call_on_irq_stack+0x30/0x48 arch/arm64/kernel/entry.S:901
 do_softirq_own_stack+0x1c/0x28 arch/arm64/kernel/irq.c:83
 invoke_softirq kernel/softirq.c:526 [inline]
 __irq_exit_rcu+0x10c/0x318 kernel/softirq.c:758
 irq_exit_rcu+0x14/0x84 kernel/softirq.c:775
 __el1_irq arch/arm64/kernel/entry-common.c:569 [inline]
 el1_interrupt+0x40/0x60 arch/arm64/kernel/entry-common.c:581
 el1h_64_irq_handler+0x18/0x24 arch/arm64/kernel/entry-common.c:586
 el1h_64_irq+0x78/0x7c arch/arm64/kernel/entry.S:602
 __daif_local_irq_enable arch/arm64/include/asm/irqflags.h:26 [inline] (P)
 arch_local_irq_enable arch/arm64/include/asm/irqflags.h:48 [inline] (P)
 default_idle_call+0xa0/0xb8 kernel/sched/idle.c:129 (P)
 cpuidle_idle_call kernel/sched/idle.c:199 [inline]
 do_idle+0x1ec/0x450 kernel/sched/idle.c:355
 cpu_startup_entry+0x5c/0x74 kernel/sched/idle.c:454
 secondary_start_kernel+0x1d8/0x1fc arch/arm64/kernel/smp.c:275
 __secondary_switched+0xc0/0xc4 arch/arm64/kernel/head.S:400
irq event stamp: 286461
hardirqs last  enabled at (286460): [<ffff80008030a4e0>] handle_softirqs+0x1e8/0xcbc kernel/softirq.c:629
hardirqs last disabled at (286461): [<ffff8000868a164c>] __raw_spin_lock_irq include/linux/spinlock_api_smp.h:163 [inline]
hardirqs last disabled at (286461): [<ffff8000868a164c>] _raw_spin_lock_irq+0x28/0x70 kernel/locking/spinlock.c:189
softirqs last  enabled at (283904): [<ffff80008030ae24>] softirq_handle_end kernel/softirq.c:491 [inline]
softirqs last  enabled at (283904): [<ffff80008030ae24>] handle_softirqs+0xb2c/0xcbc kernel/softirq.c:673
softirqs last disabled at (286459): [<ffff8000800203f0>] __do_softirq+0x14/0x20 kernel/softirq.c:679
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

