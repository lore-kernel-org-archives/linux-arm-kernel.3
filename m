Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9594BCA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 21:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E+9f45GM4pXzPuGA6R17FODe6k4Z6hXoC5UsvXOKaHM=; b=0cLHWW4aZOxyzTrV25F60rg574
	UcU5ib8QaIMksFMOe31V4o40OB+j759aoKSEJgCzvYaPDEuj3E/xVTlCatzBIP3nk/BfL6fbPlw9U
	GsQwzMdcVzVZnnYrmbrzT6kVmEyf6C7gojRN7sZaGkJuo6vzeyqEDvfpsVRzPLZHtRviBhAbi3/nb
	RDMhZGEfE8NNEEsbwmI2LuyvroCiPl2fOcrAk8CnoIDwbB5L92k+qtzXp4i4/WAYKcTOu1UBv4oYT
	57jxLeV3trj2Pw/UYZxX0kJdQiU5Sjz8fD8x1R9hd9jOoLOLqJc5M4hz0uvky/ma3twyWQ0gyk1A0
	6RijKDUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw5oB-0000000AMbR-0GSe;
	Tue, 09 Sep 2025 21:23:23 +0000
Received: from out-183.mta0.migadu.com ([91.218.175.183])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw5o7-0000000AMaJ-3npa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 21:23:21 +0000
Date: Tue, 9 Sep 2025 14:23:10 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1757452995;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=E+9f45GM4pXzPuGA6R17FODe6k4Z6hXoC5UsvXOKaHM=;
	b=v1/Fz8iKRvrOPlvbksOV54C9bEO5rTj+ATc1KRPFjEPpmGmqqW4okyvW/r1uPzSXDOUFMC
	GPj8RNhWAXbktpXeYNQBoLbckry/gE72vo7eLAHY4kIYu0ZT63CzHBee+Xe21TyblZzbsJ
	AlqRmK21IIcRPXG7X9P0Q8CQlnAnyyU=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: syzbot <syzbot+cef594105ac7e60c6d93@syzkaller.appspotmail.com>
Cc: catalin.marinas@arm.com, joey.gouly@arm.com, kvm@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, maz@kernel.org,
	suzuki.poulose@arm.com, syzkaller-bugs@googlegroups.com,
	will@kernel.org, yuzenghui@huawei.com
Subject: Re: [syzbot] [kvmarm?] [kvm?] WARNING: locking bug in vgic_put_irq
Message-ID: <aMCaviNcIeaB9SLV@linux.dev>
References: <68acd0d9.a00a0220.33401d.048b.GAE@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <68acd0d9.a00a0220.33401d.048b.GAE@google.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_142320_228207_BC862269 
X-CRM114-Status: GOOD (  16.21  )
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

On Mon, Aug 25, 2025 at 02:08:41PM -0700, syzbot wrote:
> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    7b8346bd9fce KVM: arm64: Don't attempt vLPI mappings when ..
> git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm.git next
> console output: https://syzkaller.appspot.com/x/log.txt?x=17b4e862580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=7c53d3478750eda0
> dashboard link: https://syzkaller.appspot.com/bug?extid=cef594105ac7e60c6d93
> compiler:       Debian clang version 20.1.7 (++20250616065708+6146a88f6049-1~exp1~20250616065826.132), Debian LLD 20.1.7
> userspace arch: arm64
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=15860634580000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1074e862580000
> 
> Downloadable assets:
> disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/fa3fbcfdac58/non_bootable_disk-7b8346bd.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/74f545807499/vmlinux-7b8346bd.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/d83062566dc7/Image-7b8346bd.gz.xz
> 
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+cef594105ac7e60c6d93@syzkaller.appspotmail.com
> 
> =============================
> [ BUG: Invalid wait context ]
> 6.16.0-rc3-syzkaller-g7b8346bd9fce #0 Not tainted
> -----------------------------
> syz.0.29/3743 is trying to lock:
> a3ff80008e2e9e18 (&xa->xa_lock#20){....}-{3:3}, at: vgic_put_irq+0xb4/0x190 arch/arm64/kvm/vgic/vgic.c:137
> other info that might help us debug this:
> context-{5:5}
> 3 locks held by syz.0.29/3743:
>  #0: a3ff80008e2e90a8 (&kvm->slots_lock){+.+.}-{4:4}, at: kvm_vgic_destroy+0x50/0x624 arch/arm64/kvm/vgic/vgic-init.c:499
>  #1: a3ff80008e2e9fa0 (&kvm->arch.config_lock){+.+.}-{4:4}, at: kvm_vgic_destroy+0x5c/0x624 arch/arm64/kvm/vgic/vgic-init.c:500
>  #2: 58f0000021be1428 (&vgic_cpu->ap_list_lock){....}-{2:2}, at: vgic_flush_pending_lpis+0x3c/0x31c arch/arm64/kvm/vgic/vgic.c:150
> stack backtrace:
> CPU: 0 UID: 0 PID: 3743 Comm: syz.0.29 Not tainted 6.16.0-rc3-syzkaller-g7b8346bd9fce #0 PREEMPT 
> Hardware name: linux,dummy-virt (DT)
> Call trace:
>  show_stack+0x2c/0x3c arch/arm64/kernel/stacktrace.c:466 (C)
>  __dump_stack+0x30/0x40 lib/dump_stack.c:94
>  dump_stack_lvl+0xd8/0x12c lib/dump_stack.c:120
>  dump_stack+0x1c/0x28 lib/dump_stack.c:129
>  print_lock_invalid_wait_context kernel/locking/lockdep.c:4833 [inline]
>  check_wait_context kernel/locking/lockdep.c:4905 [inline]
>  __lock_acquire+0x978/0x299c kernel/locking/lockdep.c:5190
>  lock_acquire+0x14c/0x2e0 kernel/locking/lockdep.c:5871
>  __raw_spin_lock_irqsave include/linux/spinlock_api_smp.h:110 [inline]
>  _raw_spin_lock_irqsave+0x5c/0x7c kernel/locking/spinlock.c:162
>  vgic_put_irq+0xb4/0x190 arch/arm64/kvm/vgic/vgic.c:137
>  vgic_flush_pending_lpis+0x24c/0x31c arch/arm64/kvm/vgic/vgic.c:158
>  __kvm_vgic_vcpu_destroy+0x44/0x500 arch/arm64/kvm/vgic/vgic-init.c:455
>  kvm_vgic_destroy+0x100/0x624 arch/arm64/kvm/vgic/vgic-init.c:505
>  kvm_arch_destroy_vm+0x80/0x138 arch/arm64/kvm/arm.c:244
>  kvm_destroy_vm virt/kvm/kvm_main.c:1308 [inline]
>  kvm_put_kvm+0x800/0xff8 virt/kvm/kvm_main.c:1344
>  kvm_vm_release+0x58/0x78 virt/kvm/kvm_main.c:1367
>  __fput+0x4ac/0x980 fs/file_table.c:465
>  ____fput+0x20/0x58 fs/file_table.c:493
>  task_work_run+0x1bc/0x254 kernel/task_work.c:227
>  resume_user_mode_work include/linux/resume_user_mode.h:50 [inline]
>  do_notify_resume+0x1b4/0x270 arch/arm64/kernel/entry-common.c:151
>  exit_to_user_mode_prepare arch/arm64/kernel/entry-common.c:169 [inline]
>  exit_to_user_mode arch/arm64/kernel/entry-common.c:178 [inline]
>  el0_svc+0xb4/0x160 arch/arm64/kernel/entry-common.c:768
>  el0t_64_sync_handler+0x78/0x108 arch/arm64/kernel/entry-common.c:786
>  el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:600
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

#syz test git://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm.git fixes

