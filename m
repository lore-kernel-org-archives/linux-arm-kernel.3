Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A591EC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Jul 2025 13:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vTNJHZnQMol4aO4zEt9JIbjczrtk+VPb1WQ/UQwTUi8=; b=Iint51QVsarWlxrGkiOIgrf136
	An7Jf3IA1/dHNFPK1Cym6cfqwtfFerdpoaA2Cimxw84S1b6dM910uZGdk9qq0rLhaTlypqq5fvb5B
	BjnpHEO/EJ0vGFkqRsRQ5oEffA2LSASz+hAo44ipsbSN7N8mG3Q0BX/q6JCaDDwNNHSMyBFetVgcp
	OpK+fwn3Cdl9JXTAgoQ4p+G/1h463rojRFjghFtRbyWnMgWLWDtXfDCQS18+9HYjZdc/4Se5EaPGB
	iUEyj63m47xwhvpGflNggFwfV5OJAUHeDWJzauGf3z41FMVjMobmQwtxPZ39M5sQsuKypwNsHJ8wV
	dSis1uTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueZBE-00000004zE8-3YjJ;
	Wed, 23 Jul 2025 13:06:44 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueYhA-00000004vQ5-0u54
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Jul 2025 12:35:42 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F02BA22C7;
	Wed, 23 Jul 2025 05:35:32 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 859613F6A8;
	Wed, 23 Jul 2025 05:35:37 -0700 (PDT)
Date: Wed, 23 Jul 2025 13:35:31 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Yunseong Kim <ysk@kzalloc.com>
Cc: Will Deacon <will@kernel.org>, Austin Kim <austindh.kim@gmail.com>,
	Michelle Jin <shjy180909@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
	Yeoreum Yun <yeoreum.yun@arm.com>, syzkaller@googlegroups.com
Subject: Re: [PATCH] perf: arm_pmuv3: Fix kernel panic on UBSAN from negative
 hw.idx in armv8pmu_enable/disable_event()
Message-ID: <aIDXE3GsRVUbPmaz@J2N7QTR9R3>
References: <20250723104359.364547-5-ysk@kzalloc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250723104359.364547-5-ysk@kzalloc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_053540_344033_BB944652 
X-CRM114-Status: GOOD (  31.41  )
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

[ dropping Hemendra, since he doens't need to be spammed with ML traffic ]

On Wed, Jul 23, 2025 at 10:44:03AM +0000, Yunseong Kim wrote:
> When 'event->hw.idx' was negative in armv8pmu_enable/disable_event().
> 
>   UBSAN: shift-out-of-bounds in drivers/perf/arm_pmuv3.c:716:25
>   shift exponent -1 is negative
> 
>   UBSAN: shift-out-of-bounds in drivers/perf/arm_pmuv3.c:658:13
>   shift exponent -1 is negative
> 
> This occurred because a perf_event could reach armv8pmu event with a
> negative idx, typically when a valid counter could not be allocated.

These functions are never supposed to be called for an event with a
negative idx. For that to happen there must either be an earlier bug (at
the time of pmu::add()) or there's a concurrency bug.

> This issue was observed when running KVM on Radxa's Orion6 platform.

Do you mean that you see this on the host, or in a guest?

Are you using pseudo-NMI?

> The issue was previously guarded indirectly by armv8pmu_event_is_chained(),
> which internally warned and returned false for idx < 0. But since the
> commit 29227d6ea157 ("arm64: perf: Clean up enable/disable calls"), this
> check was removed.

The warning there was because this case *should not happen*, and
returning false was a way of minimizing the risk of a crash before the
warning was logged. 

I don't think that armv8pmu_event_is_chained() would avoid the UBSAN
splat. Prior to commit 29227d6ea157 we had:

| static inline void armv8pmu_enable_event_counter(struct perf_event *event)
| {
|         struct perf_event_attr *attr = &event->attr;
|         int idx = event->hw.idx;
| 
| 	...
| 
|         if (!kvm_pmu_counter_deferred(attr)) {
|                 armv8pmu_enable_counter(idx);
|                 if (armv8pmu_event_is_chained(event))
|                         armv8pmu_enable_counter(idx - 1);
|         }
| }

Note the first call to armv8pmu_enable_counter(idx), so this wouldn't
help for an event with event->hw.idx==-1, and the only other way we
could get here is with a chained event with event->hw.idx==0, which is
not valid.

> To prevent undefined behavior, add an explicit guard to early return from
> armv8pmu event if hw.idx < 0, 

That is not a correct fix, and simply hides the real bug. It should not
be possible to reach this code when hw.idx < 0, and idx should be >= 0
whenever pmu::add() succeeds.

> similar to handling in other PMU drivers.
> (e.g. intel_pmu_disable_event() on arch/x86/events/intel/core.c)

I think what you're saying here is that intel_pmu_disable_event() will
pr_warn() and return early in this case. As above, that is because this
case is not expected to occur, and indicates a bug elsewhere.

> $ ./syz-execprog -executor=./syz-executor -repeat=0  -sandbox=none \
>   -disable=binfmt_misc,cgroups,close_fds,devlink_pci,ieee802154,net_dev,net_reset,nic_vf,swap,sysctl,tun,usb,vhci,wifi \
>   -procs=8 perf.syz
> 
> r0 = perf_event_open(&(0x7f0000000240)={
>         0x0, 0x80, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0,
>         0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0,
>         0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0,
>         0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0,
>         0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0,
>         @perf_config_ext
>     }, 0x0, 0x0, 0xffffffffffffffff, 0x0)
> 
> perf_event_open(&(0x7f0000000280)={
>         0x0, 0x80, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0,
>         0x1, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0,
>         0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0,
>         0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0,
>         0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0,
>         @perf_config_ext
>     }, 0x0, 0x0, r0, 0x0)
> 
> perf_event_open(&(0x7f0000000540)={
>         0x3, 0x80, 0x0, 0x0, 0x0, 0x0, 0x0, 0x4, 0x0, 0x0,
>         0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0,
>         0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0,
>         0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0,
>         0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x4,
>         @perf_bp={0x0, 0x2}, 0x20, 0x0, 0x0, 0x0, 0x2,
>         0x0, 0x0, 0x0, 0x0, 0x0, 0x81
>     }, 0x0, 0x0, r0, 0x0)

This isn't all that helpful for reproducing the issue. Are the later
lines the contents of 'perf.syz'? My local build of syz-execprog can't
seem to parse this and prints help/usage.

Has your syzkaller instance managed to generate a C reproducer that you
can share?

It should be possible to manually build a test from the above, but
that's rather tedious.

> ------------[ cut here ]------------
> UBSAN: shift-out-of-bounds in drivers/perf/arm_pmuv3.c:716:25
> shift exponent -1 is negative
> CPU: 0 UID: 0 PID: 8405 Comm: syz.3.19 Tainted: G        W           6.16.0-rc2-g5982a539cdce #3 PREEMPT
> Tainted: [W]=WARN
> Hardware name: QEMU KVM Virtual Machine, BIOS 2025.02-8 05/13/2025
> Call trace:
>  show_stack+0x2c/0x3c (C)
>  __dump_stack+0x30/0x40
>  dump_stack_lvl+0xd8/0x12c
>  dump_stack+0x1c/0x28
>  ubsan_epilogue+0x14/0x48
>  __ubsan_handle_shift_out_of_bounds+0x2b0/0x34c
>  armv8pmu_enable_event+0x3c4/0x4b0
>  armpmu_start+0xc4/0x118
>  perf_event_unthrottle_group+0x3a8/0x50c
>  perf_adjust_freq_unthr_events+0x2f4/0x578
>  perf_adjust_freq_unthr_context+0x278/0x46c
>  perf_event_task_tick+0x394/0x5b0

AFAICT perf_event_task_tick() is called with IRQs masked, and
perf_adjust_freq_unthr_context() disables the PMU for the duration of
the state manipulation, so this shouldn't be able to race with anything
that's using appropriate IRQ masking.

This might be able to race with a pNMI though, and it looks like we're
not entirely robust.

>  sched_tick+0x314/0x6cc
>  update_process_times+0x374/0x4b0
>  tick_nohz_handler+0x334/0x480
>  __hrtimer_run_queues+0x3ec/0xb78
>  hrtimer_interrupt+0x2b8/0xb50
>  arch_timer_handler_virt+0x74/0x88
>  handle_percpu_devid_irq+0x174/0x308
>  generic_handle_domain_irq+0xe0/0x140
>  gic_handle_irq+0x6c/0x190
>  call_on_irq_stack+0x24/0x30
>  do_interrupt_handler+0xd4/0x138
>  el1_interrupt+0x34/0x54
>  el1h_64_irq_handler+0x18/0x24
>  el1h_64_irq+0x6c/0x70
>  generic_exec_single+0x2dc/0x304 (P)
>  smp_call_function_single+0x308/0x530
>  perf_install_in_context+0x4a0/0x798
>  __arm64_sys_perf_event_open+0x184c/0x1d50
>  invoke_syscall+0x98/0x2b8
>  el0_svc_common+0x130/0x23c
>  do_el0_svc+0x48/0x58
>  el0_svc+0x58/0x17c
>  el0t_64_sync_handler+0x78/0x108
>  el0t_64_sync+0x198/0x19c
> ---[ end trace ]---
> ------------[ cut here ]------------
> UBSAN: shift-out-of-bounds in drivers/perf/arm_pmuv3.c:658:13
> shift exponent -1 is negative
> CPU: 0 UID: 0 PID: 8006 Comm: syz.0.19 Not tainted 6.16.0-rc2-g5982a539cdce #3 PREEMPT
> Hardware name: QEMU KVM Virtual Machine, BIOS 2025.02-8 05/13/2025
> Call trace:
>  show_stack+0x2c/0x3c (C)
>  __dump_stack+0x30/0x40
>  dump_stack_lvl+0xd8/0x12c
>  dump_stack+0x1c/0x28
>  ubsan_epilogue+0x14/0x48
>  __ubsan_handle_shift_out_of_bounds+0x2b0/0x34c
>  armv8pmu_disable_event+0x228/0x2f8
>  armpmu_stop+0xa0/0x104
>  perf_event_throttle_group+0x354/0x4cc
>  __perf_event_account_interrupt+0x26c/0x290
>  __perf_event_overflow+0xe8/0xd28
>  perf_event_overflow+0x38/0x4c
>  armv8pmu_handle_irq+0x244/0x320
>  armpmu_dispatch_irq+0x6c/0x9c
>  handle_percpu_devid_irq+0x174/0x308
>  generic_handle_domain_irq+0xe0/0x140
>  gic_handle_irq+0x6c/0x190
>  call_on_irq_stack+0x24/0x30
>  do_interrupt_handler+0xd4/0x138
>  el1_interrupt+0x34/0x54
>  el1h_64_irq_handler+0x18/0x24
>  el1h_64_irq+0x6c/0x70

This indicates a regular IRQ rather than a pNMI.

>  generic_exec_single+0x2dc/0x304 (P)
>  smp_call_function_single+0x308/0x530
>  perf_install_in_context+0x4a0/0x798
>  __arm64_sys_perf_event_open+0x184c/0x1d50
>  invoke_syscall+0x98/0x2b8
>  el0_svc_common+0x130/0x23c
>  do_el0_svc+0x48/0x58
>  el0_svc+0x58/0x17c
>  el0t_64_sync_handler+0x78/0x108
>  el0t_64_sync+0x198/0x19c
> ---[ end trace ]---
> ------------[ cut here ]------------
> UBSAN: shift-out-of-bounds in drivers/perf/arm_pmuv3.c:730:26
> shift exponent -1 is negative
> CPU: 0 UID: 0 PID: 8006 Comm: syz.0.19 Not tainted 6.16.0-rc2-g5982a539cdce #3 PREEMPT
> Hardware name: QEMU KVM Virtual Machine, BIOS 2025.02-8 05/13/2025
> Call trace:
>  show_stack+0x2c/0x3c (C)
>  __dump_stack+0x30/0x40
>  dump_stack_lvl+0xd8/0x12c
>  dump_stack+0x1c/0x28
>  ubsan_epilogue+0x14/0x48
>  __ubsan_handle_shift_out_of_bounds+0x2b0/0x34c
>  armv8pmu_disable_event+0x298/0x2f8
>  armpmu_stop+0xa0/0x104
>  perf_event_throttle_group+0x354/0x4cc
>  __perf_event_account_interrupt+0x26c/0x290
>  __perf_event_overflow+0xe8/0xd28
>  perf_event_overflow+0x38/0x4c
>  armv8pmu_handle_irq+0x244/0x320
>  armpmu_dispatch_irq+0x6c/0x9c
>  handle_percpu_devid_irq+0x174/0x308
>  generic_handle_domain_irq+0xe0/0x140
>  gic_handle_irq+0x6c/0x190
>  call_on_irq_stack+0x24/0x30
>  do_interrupt_handler+0xd4/0x138
>  el1_interrupt+0x34/0x54
>  el1h_64_irq_handler+0x18/0x24
>  el1h_64_irq+0x6c/0x70
>  generic_exec_single+0x2dc/0x304 (P)
>  smp_call_function_single+0x308/0x530
>  perf_install_in_context+0x4a0/0x798
>  __arm64_sys_perf_event_open+0x184c/0x1d50
>  invoke_syscall+0x98/0x2b8
>  el0_svc_common+0x130/0x23c
>  do_el0_svc+0x48/0x58
>  el0_svc+0x58/0x17c
>  el0t_64_sync_handler+0x78/0x108
>  el0t_64_sync+0x198/0x19c
> ---[ end trace ]---
> 
> Fixes: 29227d6ea157 ("arm64: perf: Clean up enable/disable calls")

As above, I do not believe that this fixes tag is accurate.

> Signed-off-by: Yunseong Kim <ysk@kzalloc.com>
> Tested-by: Yunseong Kim <ysk@kzalloc.com>
> Cc: Yeoreum Yun <yeoreum.yun@arm.com>
> Cc: syzkaller@googlegroups.com
> ---
>  drivers/perf/arm_pmuv3.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/perf/arm_pmuv3.c b/drivers/perf/arm_pmuv3.c
> index 3db9f4ed17e8..846d69643fd8 100644
> --- a/drivers/perf/arm_pmuv3.c
> +++ b/drivers/perf/arm_pmuv3.c
> @@ -795,6 +795,9 @@ static void armv8pmu_enable_user_access(struct arm_pmu *cpu_pmu)
>  
>  static void armv8pmu_enable_event(struct perf_event *event)
>  {
> +	if (unlikely(event->hw.idx < 0))
> +		return;
> +
>  	armv8pmu_write_event_type(event);
>  	armv8pmu_enable_event_irq(event);
>  	armv8pmu_enable_event_counter(event);
> @@ -802,6 +805,9 @@ static void armv8pmu_enable_event(struct perf_event *event)
>  
>  static void armv8pmu_disable_event(struct perf_event *event)
>  {
> +	if (unlikely(event->hw.idx < 0))
> +		return;
> +
>  	armv8pmu_disable_event_counter(event);
>  	armv8pmu_disable_event_irq(event);

As above, this is not a correct fix, and NAK to silently ignoring an
invalid idx.

Mark.

