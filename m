Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB162CD3427
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 03:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XCvSTEjCOYEmY0eytTTIRnXZbs/A9bXSVn9+vYOCfiM=; b=SbfZx65eB6o35LXBP15K0X4muh
	DVrkwDCxdN+JnYX4j8dgVwKbUQo7hlOkNPf69mjmZdvcwifqFTpTA1EJTYdBUESOavQ1c3k81xcBZ
	kUjvRQ7SSJK6X5orsoEs5duBwOdwVEI+C7TjSGVy2ZPpocWG65aHsrBD0n43iHE6bOUGVaNmkg98p
	XzwUMUOFeMtGdbc6/ZVv3DoplBHR/ukPvMshYOrG4F8MezxP72yC6+vRxbYqjjyoRS22At6Roc9D3
	6bFmZYFRowD9B4ClwJLnMgSPYwu3RPSXQXCa/sCD7N2TjbgLkK/2+opgRv89WVmQRWjIJa5mvadAx
	n6mXWt5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMHAH-0000000C9fZ-2t63;
	Mon, 11 May 2026 03:18:41 +0000
Received: from canpmsgout04.his.huawei.com ([113.46.200.219])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMHAE-0000000C9df-1KOV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 03:18:40 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=XCvSTEjCOYEmY0eytTTIRnXZbs/A9bXSVn9+vYOCfiM=;
	b=OD3Pg+lveGRtHLEsb8h+RiK9poIiBwxtrSBg3CeRa2T3mhjkdWiVgqEEpfkPcxJJ5//1KbwYD
	DtPusXqr3365LHD7UmIuUEuFGCMvE8FB1ZBgy49Pr2WdzVeQ9IA2wYoNTxaArfhNL3lvCo973sj
	P96qW5N3W7rX5JxLSwtOiPg=
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4gDPqx5L5gz1prxP;
	Mon, 11 May 2026 11:10:53 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 0627A40537;
	Mon, 11 May 2026 11:18:32 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 11 May 2026 11:18:31 +0800
Message-ID: <54ffcf73-dfc5-417c-b9d5-6dee551f8d39@huawei.com>
Date: Mon, 11 May 2026 11:18:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv2] arm64/entry: Fix arm64-specific rseq brokenness
To: Mark Rutland <mark.rutland@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, Catalin Marinas
	<catalin.marinas@arm.com>, Peter Zijlstra <peterz@infradead.org>, Thomas
 Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>
CC: <ckennelly@google.com>, <dvyukov@google.com>,
	<linux-kernel@vger.kernel.org>, <mathias@mongodb.com>,
	<mathieu.desnoyers@efficios.com>
References: <20260508142023.3268622-1-mark.rutland@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260508142023.3268622-1-mark.rutland@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260510_201838_674105_B7DD22B7 
X-CRM114-Status: GOOD (  40.92  )
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



On 5/8/2026 10:20 PM, Mark Rutland wrote:
> Hi,
> 
> In all the confusion with the rseq fixes, it looks like the arm64 patch
> didn't get picked up into the tip tree. That was queued up in Thomas's
> devel/core/rseq branch, but it didn't get reposted and picked up into
> tip.
> 
> Thomas, Peter, are you happy to pick the below into the tip sched/urgent
> branch? It's the same as what what in Thomas's devel/core/rseq branch:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git/commit/?h=core/rseq&id=04db289d5633dad546a0778537f0f0e52ebfc88b
> 
> ... which was taken from my arm64/rseq branch:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git/commit/?h=arm64/rseq&id=05bce437d4f2fd14a7be4706c684a618e2fcc82f
> 
> It applies cleanly and passes all tests.
> 
> Catalin, Will, you both mentioned off-list that you were happy for this
> to go via tip with the rest of the rseq fixes. Can either of you please
> confirm with an ack?
> 
> Mark.
> 
> ---->8----
> Mathias Stearn reports that since v6.19, there are two big issues
> affecting rseq:
> 
> (1) On arm64 specifically, rseq critical sections aren't aborted when
>     they should be.
> 
> (2) The 'cpu_id_start' field is no longer written by the kernel in all
>     cases it used to be, including some cases where TCMalloc depends on
>     the kernel clobbering the field.
> 
> This patch fixes issue #1. This patch DOES NOT fix issue #2, which will
> need to be addressed by other patches.
> 
> The arm64-specific brokenness is a result of commits:
> 
>   2fc0e4b4126c ("rseq: Record interrupt from user space")
>   39a167560a61 ("rseq: Optimize event setting")
> 
> The first commit failed to add a call to rseq_note_user_irq_entry() on
> arm64. Thus arm64 never sets rseq_event::user_irq to record that it may
> be necessary to abort an active rseq critical section upon return to
> userspace. On its own, this commit had no functional impact as the value
> of rseq_event::user_irq was not consumed.
> 
> The second commit relied upon rseq_event::user_irq to determine whether
> or not to bother to perform rseq work when returning to userspace. As
> rseq_event::user_irq wasn't set on arm64, this work would be skipped,
> and consequently an active rseq critical section would not be aborted.
> 
> Fix this by giving arm64 syscall-specific entry/exit paths, and
> performing the relevant logic in syscall and non-syscall paths,
> including calling rseq_note_user_irq_entry() for non-syscall entry.
> 
> Currently arm64 cannot use syscall_enter_from_user_mode(),
> syscall_exit_to_user_mode(), and irqentry_exit_to_user_mode(), due to
> ordering constraints with exception masking, and risk of ABI breakage
> for syscall tracing/audit/etc. For the moment the entry/exit logic is
> left as arm64-specific, directly using enter_from_user_mode() and
> exit_to_user_mode(), but mirroring the generic code.
> 
> I intend to follow up with refactoring/cleanup, as we did for kernel
> mode entry paths in commit:
> 
>   041aa7a85390 ("entry: Split preemption from irqentry_exit_to_kernel_mode()")
> 
> ... which will allow arm64 to use the GENERIC_IRQ_ENTRY functions directly.
> 
> Fixes: 39a167560a61 ("rseq: Optimize event setting")
> Reported-by: Mathias Stearn <mathias@mongodb.com>
> Link: https://lore.kernel.org/regressions/CAHnCjA25b+nO2n5CeifknSKHssJpPrjnf+dtr7UgzRw4Zgu=oA@mail.gmail.com/
> Signed-off-by: Mark Rutland <mark.rutland@arm.com>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Chris Kennelly <ckennelly@google.com>
> Cc: Dmitry Vyukov <dvyukov@google.com>
> Cc: Jinjie Ruan <ruanjinjie@huawei.com>
> Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Will Deacon <will@kernel.org>
> ---
>  arch/arm64/kernel/entry-common.c | 31 ++++++++++++++++++++++++-------
>  include/linux/irq-entry-common.h |  8 --------
>  include/linux/rseq_entry.h       | 19 -------------------
>  3 files changed, 24 insertions(+), 34 deletions(-)
> 
> Since v1 [1]:
> * Restore sme_{enter_from,exit_to}_user_mode()
> * Describe use of enter_from_user_mode() in commit message

Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>

> 
> [1] https://lore.kernel.org/linux-arm-kernel/aeueE1I1OuVkOcEZ@J2N7QTR9R3/
> 
> diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
> index cb54335465f66..c7a23f7c22122 100644
> --- a/arch/arm64/kernel/entry-common.c
> +++ b/arch/arm64/kernel/entry-common.c
> @@ -62,6 +62,13 @@ static void noinstr arm64_exit_to_kernel_mode(struct pt_regs *regs,
>  	irqentry_exit_to_kernel_mode_after_preempt(regs, state);
>  }
>  
> +static __always_inline void arm64_syscall_enter_from_user_mode(struct pt_regs *regs)
> +{
> +	enter_from_user_mode(regs);
> +	mte_disable_tco_entry(current);
> +	sme_enter_from_user_mode();
> +}
> +
>  /*
>   * Handle IRQ/context state management when entering from user mode.
>   * Before this function is called it is not safe to call regular kernel code,
> @@ -70,20 +77,30 @@ static void noinstr arm64_exit_to_kernel_mode(struct pt_regs *regs,
>  static __always_inline void arm64_enter_from_user_mode(struct pt_regs *regs)
>  {
>  	enter_from_user_mode(regs);
> +	rseq_note_user_irq_entry();
>  	mte_disable_tco_entry(current);
>  	sme_enter_from_user_mode();
>  }
>  
> +static __always_inline void arm64_syscall_exit_to_user_mode(struct pt_regs *regs)
> +{
> +	local_irq_disable();
> +	syscall_exit_to_user_mode_prepare(regs);
> +	local_daif_mask();
> +	sme_exit_to_user_mode();
> +	mte_check_tfsr_exit();
> +	exit_to_user_mode();
> +}
> +
>  /*
>   * Handle IRQ/context state management when exiting to user mode.
>   * After this function returns it is not safe to call regular kernel code,
>   * instrumentable code, or any code which may trigger an exception.
>   */
> -
>  static __always_inline void arm64_exit_to_user_mode(struct pt_regs *regs)
>  {
>  	local_irq_disable();
> -	exit_to_user_mode_prepare_legacy(regs);
> +	irqentry_exit_to_user_mode_prepare(regs);
>  	local_daif_mask();
>  	sme_exit_to_user_mode();
>  	mte_check_tfsr_exit();
> @@ -92,7 +109,7 @@ static __always_inline void arm64_exit_to_user_mode(struct pt_regs *regs)
>  
>  asmlinkage void noinstr asm_exit_to_user_mode(struct pt_regs *regs)
>  {
> -	arm64_exit_to_user_mode(regs);
> +	arm64_syscall_exit_to_user_mode(regs);
>  }
>  
>  /*
> @@ -716,12 +733,12 @@ static void noinstr el0_brk64(struct pt_regs *regs, unsigned long esr)
>  
>  static void noinstr el0_svc(struct pt_regs *regs)
>  {
> -	arm64_enter_from_user_mode(regs);
> +	arm64_syscall_enter_from_user_mode(regs);
>  	cortex_a76_erratum_1463225_svc_handler();
>  	fpsimd_syscall_enter();
>  	local_daif_restore(DAIF_PROCCTX);
>  	do_el0_svc(regs);
> -	arm64_exit_to_user_mode(regs);
> +	arm64_syscall_exit_to_user_mode(regs);
>  	fpsimd_syscall_exit();
>  }
>  
> @@ -868,11 +885,11 @@ static void noinstr el0_cp15(struct pt_regs *regs, unsigned long esr)
>  
>  static void noinstr el0_svc_compat(struct pt_regs *regs)
>  {
> -	arm64_enter_from_user_mode(regs);
> +	arm64_syscall_enter_from_user_mode(regs);
>  	cortex_a76_erratum_1463225_svc_handler();
>  	local_daif_restore(DAIF_PROCCTX);
>  	do_el0_svc_compat(regs);
> -	arm64_exit_to_user_mode(regs);
> +	arm64_syscall_exit_to_user_mode(regs);
>  }
>  
>  static void noinstr el0_bkpt32(struct pt_regs *regs, unsigned long esr)
> diff --git a/include/linux/irq-entry-common.h b/include/linux/irq-entry-common.h
> index 167fba7dbf043..1fabf0f5ea8e7 100644
> --- a/include/linux/irq-entry-common.h
> +++ b/include/linux/irq-entry-common.h
> @@ -218,14 +218,6 @@ static __always_inline void __exit_to_user_mode_validate(void)
>  	lockdep_sys_exit();
>  }
>  
> -/* Temporary workaround to keep ARM64 alive */
> -static __always_inline void exit_to_user_mode_prepare_legacy(struct pt_regs *regs)
> -{
> -	__exit_to_user_mode_prepare(regs, EXIT_TO_USER_MODE_WORK);
> -	rseq_exit_to_user_mode_legacy();
> -	__exit_to_user_mode_validate();
> -}
> -
>  /**
>   * syscall_exit_to_user_mode_prepare - call exit_to_user_mode_loop() if required
>   * @regs:	Pointer to pt_regs on entry stack
> diff --git a/include/linux/rseq_entry.h b/include/linux/rseq_entry.h
> index 2d0295df5107c..63bc72086e75b 100644
> --- a/include/linux/rseq_entry.h
> +++ b/include/linux/rseq_entry.h
> @@ -749,24 +749,6 @@ static __always_inline void rseq_irqentry_exit_to_user_mode(void)
>  	ev->events = 0;
>  }
>  
> -/* Required to keep ARM64 working */
> -static __always_inline void rseq_exit_to_user_mode_legacy(void)
> -{
> -	struct rseq_event *ev = &current->rseq.event;
> -
> -	rseq_stat_inc(rseq_stats.exit);
> -
> -	if (static_branch_unlikely(&rseq_debug_enabled))
> -		WARN_ON_ONCE(ev->sched_switch);
> -
> -	/*
> -	 * Ensure that event (especially user_irq) is cleared when the
> -	 * interrupt did not result in a schedule and therefore the
> -	 * rseq processing did not clear it.
> -	 */
> -	ev->events = 0;
> -}
> -
>  void __rseq_debug_syscall_return(struct pt_regs *regs);
>  
>  static __always_inline void rseq_debug_syscall_return(struct pt_regs *regs)
> @@ -782,7 +764,6 @@ static inline bool rseq_exit_to_user_mode_restart(struct pt_regs *regs, unsigned
>  }
>  static inline void rseq_syscall_exit_to_user_mode(void) { }
>  static inline void rseq_irqentry_exit_to_user_mode(void) { }
> -static inline void rseq_exit_to_user_mode_legacy(void) { }
>  static inline void rseq_debug_syscall_return(struct pt_regs *regs) { }
>  static inline bool rseq_grant_slice_extension(unsigned long ti_work, unsigned long mask) { return false; }
>  #endif /* !CONFIG_RSEQ */


