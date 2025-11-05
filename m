Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 260F3CCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 11:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pIob/dX5mgk3n3+LFWiTOuc1GpuGs0NX7VNlSJZOyyA=; b=SoW5+ZB479+0uDtoQ/VcjDb4cc
	aNkk4cns1UHvL6yr36IvP3nOE9GYK1xXjlRkWKCp+5NpJUSZBPr5j0SexEJcWYfcA4QzaGGJoky9f
	DukTY0LkslLB4pvbg+k2d8FONJVkHPqB5U1ZqHomZ15Rta2YOeybUJStz3UVa8f0Oa+Gic35cUMne
	r8ZQbtQqJSW6mgJX234bcU2lw6HV+kw17Qy+7bya6HnhbzL1Qvr7yvH5WbjnqhVYTE64/NscYDKC4
	IjObNK9CUbKcd3PTAcUAK/gXZzkYCdKUZB+DNpvJgwxSsa7XqO9fsFshLs0F7JX1M7R7jbfyU+njF
	0lS4tdyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGbdS-0000000DXb1-1Wxm;
	Wed, 05 Nov 2025 11:25:06 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGbdP-0000000DXa9-2qXI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Nov 2025 11:25:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E44B0169C;
	Wed,  5 Nov 2025 03:24:52 -0800 (PST)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B7DC23F63F;
	Wed,  5 Nov 2025 03:24:59 -0800 (PST)
Date: Wed, 5 Nov 2025 11:24:54 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: syzbot <syzbot+d4ab35af21e99d07ce67@syzkaller.appspotmail.com>
Cc: catalin.marinas@arm.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com,
	will@kernel.org
Subject: Re: [syzbot] [arm?] WARNING in fpsimd_restore_current_state
Message-ID: <aQs0Bkrbnqinlqss@J2N7QTR9R3>
References: <690a8dc2.050a0220.3d0d33.0018.GAE@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <690a8dc2.050a0220.3d0d33.0018.GAE@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_032503_835780_71FBBCA2 
X-CRM114-Status: GOOD (  18.93  )
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

On Tue, Nov 04, 2025 at 03:35:30PM -0800, syzbot wrote:
> Hello,

Hi,

Initial analysis / holding-reply below.

> syzbot found the following issue on:
> 
> HEAD commit:    dcb6fa37fd7b Linux 6.18-rc3
> git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
> console output: https://syzkaller.appspot.com/x/log.txt?x=11a79704580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=b8b659f0cab27b22
> dashboard link: https://syzkaller.appspot.com/bug?extid=d4ab35af21e99d07ce67
> compiler:       Debian clang version 20.1.8 (++20250708063551+0c9f909b7976-1~exp1~20250708183702.136), Debian LLD 20.1.8
> userspace arch: arm64
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=115fdf34580000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1441d258580000
> 
> Downloadable assets:
> disk image: https://storage.googleapis.com/syzbot-assets/ae6bec0d0398/disk-dcb6fa37.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/dcc732da66c3/vmlinux-dcb6fa37.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/301d1bbdecc2/Image-dcb6fa37.gz.xz
> 
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+d4ab35af21e99d07ce67@syzkaller.appspotmail.com
> 
> ------------[ cut here ]------------
> WARNING: CPU: 0 PID: 6720 at arch/arm64/kernel/fpsimd.c:370 task_fpsimd_load arch/arm64/kernel/fpsimd.c:370 [inline]
> WARNING: CPU: 0 PID: 6720 at arch/arm64/kernel/fpsimd.c:370 fpsimd_restore_current_state+0x4cc/0x708 arch/arm64/kernel/fpsimd.c:1746

This warning is due to the saved state being in SVE format unexpectedly (with
TIF_SVE clear and PSTATE.SM clear). Within task_fpsimd_load() we have:

	switch (current->thread.fp_type) {
	...
	case FP_STATE_SVE:
		if (!thread_sm_enabled(&current->thread))
			WARN_ON_ONCE(!test_and_set_thread_flag(TIF_SVE));

There's definitely some bug that allowed the task to get into a state that
should be forbidden.

I see that the repro has:

	ptrace$setregset(0x4205, r0, 0x405, &(0x7f0000000000)={0x0, 0x300})

... which looks to be a write to NT_ARM_SVE.

That suggests there's some path through sve_set_common() that leaves the task
in an inconsistent state.

From a qucik look, it appears that's possible as a result of a partial SVE
write; I'll go check and see what we can do to fix that.

Mark.

> Modules linked in:
> CPU: 0 UID: 0 PID: 6720 Comm: syz.0.17 Not tainted syzkaller #0 PREEMPT 
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/03/2025
> pstate: 83400005 (Nzcv daif +PAN -UAO +TCO +DIT -SSBS BTYPE=--)
> pc : task_fpsimd_load arch/arm64/kernel/fpsimd.c:370 [inline]
> pc : fpsimd_restore_current_state+0x4cc/0x708 arch/arm64/kernel/fpsimd.c:1746
> lr : task_fpsimd_load arch/arm64/kernel/fpsimd.c:370 [inline]
> lr : fpsimd_restore_current_state+0x4cc/0x708 arch/arm64/kernel/fpsimd.c:1746
> sp : ffff8000a1047de0
> x29: ffff8000a1047de0 x28: ffff0000dcfd9ec0 x27: 0000000000000000
> x26: 0000000000000000 x25: 0000000000000008 x24: 0000000000000040
> x23: 00000000000020ff x22: dfff800000000000 x21: 1fffe0001b9fb3d8
> x20: 0000000000000000 x19: ffff0000dcfd9ec0 x18: 1fffe000337db690
> x17: ffff80008ae011f8 x16: ffff80008052ae04 x15: 0000000000000001
> x14: 1fffe0001b9fb3d8 x13: 0000000000000000 x12: 0000000000000000
> x11: ffff60001b9fb3d9 x10: 0000000000ff0100 x9 : 0000000000000000
> x8 : ffff0000dcfd9ec0 x7 : 0000000000000000 x6 : 0000000000000000
> x5 : 0000000000000001 x4 : 0000000000000008 x3 : ffff8000801f8344
> x2 : 0000000000000001 x1 : 0000000000000000 x0 : 0000000000000000
> Call trace:
>  task_fpsimd_load arch/arm64/kernel/fpsimd.c:370 [inline] (P)
>  fpsimd_restore_current_state+0x4cc/0x708 arch/arm64/kernel/fpsimd.c:1746 (P)
>  arch_exit_to_user_mode_work arch/arm64/include/asm/entry-common.h:25 [inline]
>  exit_to_user_mode_loop+0xe4/0x178 kernel/entry/common.c:46
>  exit_to_user_mode_prepare include/linux/irq-entry-common.h:225 [inline]
>  arm64_exit_to_user_mode arch/arm64/kernel/entry-common.c:103 [inline]
>  el0_svc+0x170/0x254 arch/arm64/kernel/entry-common.c:747
>  el0t_64_sync_handler+0x84/0x12c arch/arm64/kernel/entry-common.c:765
>  el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:596
> irq event stamp: 129
> hardirqs last  enabled at (127): [<ffff80008ae151bc>] __raw_spin_unlock_irq include/linux/spinlock_api_smp.h:159 [inline]
> hardirqs last  enabled at (127): [<ffff80008ae151bc>] _raw_spin_unlock_irq+0x30/0x80 kernel/locking/spinlock.c:202
> hardirqs last disabled at (129): [<ffff80008adecb80>] el1_brk64+0x20/0x54 arch/arm64/kernel/entry-common.c:434
> softirqs last  enabled at (8): [<ffff8000801f95fc>] local_bh_enable+0x10/0x34 include/linux/bottom_half.h:32
> softirqs last disabled at (128): [<ffff8000801f95c8>] local_bh_disable+0x10/0x34 include/linux/bottom_half.h:19
> ---[ end trace 0000000000000000 ]---
> 
> 
> ---
> This report is generated by a bot. It may contain errors.
> See https://goo.gl/tpsmEJ for more information about syzbot.
> syzbot engineers can be reached at syzkaller@googlegroups.com.
> 
> syzbot will keep track of this issue. See:
> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
> 
> If the report is already addressed, let syzbot know by replying with:
> #syz fix: exact-commit-title
> 
> If you want syzbot to run the reproducer, reply with:
> #syz test: git://repo/address.git branch-or-commit-hash
> If you attach or paste a git patch, syzbot will apply it before testing.
> 
> If you want to overwrite report's subsystems, reply with:
> #syz set subsystems: new-subsystem
> (See the list of subsystem names on the web dashboard)
> 
> If the report is a duplicate of another one, reply with:
> #syz dup: exact-subject-of-another-report
> 
> If you want to undo deduplication, reply with:
> #syz undup
> 

