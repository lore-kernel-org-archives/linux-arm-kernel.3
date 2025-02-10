Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CB8EC02198
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 11:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zt7j3x8KoQP2n7T6mKrXInP6Cx2lOaK2DNIO3RWt2sA=; b=X7jUiXlXbhcR2swDgQjbxMT0Z7
	p95eDpwu9/MeX/8Rm5YZe8+tLjNGlvgrcFmhgiTTGMkwlz9ilOEdgCFspjCQqizVDIGqPAr4xufWw
	BukNSRf76XCh+oGOnLaKKiBiWkCAJyW6ak3tL17JnpEK2D2WDbXgX9HGPPaDXWr8qAbFBhR3vJUP8
	45oi0uZ5TgducMG7j/7rQC02LFLM5qWPlpvKuKb6gG0H3lJss43NlkPUgFVbN7s9IEawy8kJpuFPc
	RuWeyA3nhYQhRSMdrUwcVSQYTFqeRov2e/17ILX5wktr4XL9bRfuZbDxx5WO5nepAU/1RN0z5S6N1
	UYayP+yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thSAF-0000000HGlp-3SO6;
	Mon, 10 Feb 2025 11:41:23 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thRwU-0000000HDAe-0c2O
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 11:27:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 815791007;
	Mon, 10 Feb 2025 03:27:19 -0800 (PST)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 03A833F5A1;
	Mon, 10 Feb 2025 03:26:50 -0800 (PST)
Date: Mon, 10 Feb 2025 11:26:48 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Jinjie Ruan <ruanjinjie@huawei.com>, tglx@linutronix.de
Cc: catalin.marinas@arm.com, will@kernel.org, oleg@redhat.com,
	sstabellini@kernel.org, peterz@infradead.org, luto@kernel.org,
	mingo@redhat.com, juri.lelli@redhat.com, vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
	mgorman@suse.de, vschneid@redhat.com, kees@kernel.org,
	wad@chromium.org, akpm@linux-foundation.org,
	samitolvanen@google.com, masahiroy@kernel.org, hca@linux.ibm.com,
	aliceryhl@google.com, rppt@kernel.org, xur@google.com,
	paulmck@kernel.org, arnd@arndb.de, mbenes@suse.cz,
	puranjay@kernel.org, pcc@google.com, ardb@kernel.org,
	sudeep.holla@arm.com, guohanjun@huawei.com, rafael@kernel.org,
	liuwei09@cestc.cn, dwmw@amazon.co.uk, Jonathan.Cameron@huawei.com,
	liaochang1@huawei.com, kristina.martsenko@arm.com, ptosi@google.com,
	broonie@kernel.org, thiago.bauermann@linaro.org,
	kevin.brodsky@arm.com, joey.gouly@arm.com, liuyuntao12@huawei.com,
	leobras@redhat.com, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH -next v5 03/22] arm64: entry: Move
 arm64_preempt_schedule_irq() into __exit_to_kernel_mode()
Message-ID: <Z6nieJ2M6Ro7CeO_@J2N7QTR9R3>
References: <20241206101744.4161990-1-ruanjinjie@huawei.com>
 <20241206101744.4161990-4-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241206101744.4161990-4-ruanjinjie@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_032710_268528_0D7FB7A0 
X-CRM114-Status: GOOD (  44.96  )
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

On Fri, Dec 06, 2024 at 06:17:25PM +0800, Jinjie Ruan wrote:
> The generic entry code try to reschedule every time when the kernel
> mode non-NMI exception return. At the moment, arm64 only reschedule every
> time when EL1 irq exception return;

I think this is a bit unclear, and should say something like:
  
| The arm64 entry code only preempts a kernel context upon a return from
| a regular IRQ exception. The generic entry code may preempt a kernel
| context for any exception return where irqentry_exit() is used, and so
| may preempt other exceptions such as faults.

Thomas, can you confirm that's the *intent* of the generic entry code?

> In preparation for moving arm64 over to the generic entry code, move
> arm64_preempt_schedule_irq() into exit_to_kernel_mode(), so not
> only EL1 irq but also all EL1 non-NMI exception return, there is a chance
> to reschedule. And only if irqs are enabled when the exception trapped,
> there may be a chance to reschedule after the exceptions have been handled,
> so move arm64_preempt_schedule_irq() into regs_irqs_disabled()
> check false block, but it will try to reschedule only when TINY_RCU is
> enabled or current is not an idle task.

I think the detail is confusing here, and it would be better to say:

| In preparation for moving arm64 over to the generic entry code, align
| arm64 with the generic behaviour by calling
| arm64_preempt_schedule_irq() from exit_to_kernel_mode(). To make this
| possible, arm64_preempt_schedule_irq() and need_irq_preemption() are
| moved earlier in the file, with no changes.

Mark.

> As Mark pointed out, this change will have the following 2 key impact:
> 
> - " We'll preempt even without taking a "real" interrupt. That
>     shouldn't result in preemption that wasn't possible before,
>     but it does change the probability of preempting at certain points,
>     and might have a performance impact, so probably warrants a
>     benchmark."
> 
> - " We will not preempt when taking interrupts from a region of kernel
>     code where IRQs are enabled but RCU is not watching, matching the
>     behaviour of the generic entry code.
> 
>     This has the potential to introduce livelock if we can ever have a
>     screaming interrupt in such a region, so we'll need to go figure out
>     whether that's actually a problem.
> 
>     Having this as a separate patch will make it easier to test/bisect
>     for that specifically."
> 
> Suggested-by: Mark Rutland <mark.rutland@arm.com>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>  arch/arm64/kernel/entry-common.c | 88 ++++++++++++++++----------------
>  1 file changed, 44 insertions(+), 44 deletions(-)
> 
> diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
> index 1687627b2ecf..7a588515ee07 100644
> --- a/arch/arm64/kernel/entry-common.c
> +++ b/arch/arm64/kernel/entry-common.c
> @@ -75,6 +75,48 @@ static noinstr irqentry_state_t enter_from_kernel_mode(struct pt_regs *regs)
>  	return state;
>  }
>  
> +#ifdef CONFIG_PREEMPT_DYNAMIC
> +DEFINE_STATIC_KEY_TRUE(sk_dynamic_irqentry_exit_cond_resched);
> +#define need_irq_preemption() \
> +	(static_branch_unlikely(&sk_dynamic_irqentry_exit_cond_resched))
> +#else
> +#define need_irq_preemption()	(IS_ENABLED(CONFIG_PREEMPTION))
> +#endif
> +
> +static void __sched arm64_preempt_schedule_irq(void)
> +{
> +	if (!need_irq_preemption())
> +		return;
> +
> +	/*
> +	 * Note: thread_info::preempt_count includes both thread_info::count
> +	 * and thread_info::need_resched, and is not equivalent to
> +	 * preempt_count().
> +	 */
> +	if (READ_ONCE(current_thread_info()->preempt_count) != 0)
> +		return;
> +
> +	/*
> +	 * DAIF.DA are cleared at the start of IRQ/FIQ handling, and when GIC
> +	 * priority masking is used the GIC irqchip driver will clear DAIF.IF
> +	 * using gic_arch_enable_irqs() for normal IRQs. If anything is set in
> +	 * DAIF we must have handled an NMI, so skip preemption.
> +	 */
> +	if (system_uses_irq_prio_masking() && read_sysreg(daif))
> +		return;
> +
> +	/*
> +	 * Preempting a task from an IRQ means we leave copies of PSTATE
> +	 * on the stack. cpufeature's enable calls may modify PSTATE, but
> +	 * resuming one of these preempted tasks would undo those changes.
> +	 *
> +	 * Only allow a task to be preempted once cpufeatures have been
> +	 * enabled.
> +	 */
> +	if (system_capabilities_finalized())
> +		preempt_schedule_irq();
> +}
> +
>  /*
>   * Handle IRQ/context state management when exiting to kernel mode.
>   * After this function returns it is not safe to call regular kernel code,
> @@ -97,6 +139,8 @@ static __always_inline void __exit_to_kernel_mode(struct pt_regs *regs,
>  			return;
>  		}
>  
> +		arm64_preempt_schedule_irq();
> +
>  		trace_hardirqs_on();
>  	} else {
>  		if (state.exit_rcu)
> @@ -281,48 +325,6 @@ static void noinstr arm64_exit_el1_dbg(struct pt_regs *regs,
>  		lockdep_hardirqs_on(CALLER_ADDR0);
>  }
>  
> -#ifdef CONFIG_PREEMPT_DYNAMIC
> -DEFINE_STATIC_KEY_TRUE(sk_dynamic_irqentry_exit_cond_resched);
> -#define need_irq_preemption() \
> -	(static_branch_unlikely(&sk_dynamic_irqentry_exit_cond_resched))
> -#else
> -#define need_irq_preemption()	(IS_ENABLED(CONFIG_PREEMPTION))
> -#endif
> -
> -static void __sched arm64_preempt_schedule_irq(void)
> -{
> -	if (!need_irq_preemption())
> -		return;
> -
> -	/*
> -	 * Note: thread_info::preempt_count includes both thread_info::count
> -	 * and thread_info::need_resched, and is not equivalent to
> -	 * preempt_count().
> -	 */
> -	if (READ_ONCE(current_thread_info()->preempt_count) != 0)
> -		return;
> -
> -	/*
> -	 * DAIF.DA are cleared at the start of IRQ/FIQ handling, and when GIC
> -	 * priority masking is used the GIC irqchip driver will clear DAIF.IF
> -	 * using gic_arch_enable_irqs() for normal IRQs. If anything is set in
> -	 * DAIF we must have handled an NMI, so skip preemption.
> -	 */
> -	if (system_uses_irq_prio_masking() && read_sysreg(daif))
> -		return;
> -
> -	/*
> -	 * Preempting a task from an IRQ means we leave copies of PSTATE
> -	 * on the stack. cpufeature's enable calls may modify PSTATE, but
> -	 * resuming one of these preempted tasks would undo those changes.
> -	 *
> -	 * Only allow a task to be preempted once cpufeatures have been
> -	 * enabled.
> -	 */
> -	if (system_capabilities_finalized())
> -		preempt_schedule_irq();
> -}
> -
>  static void do_interrupt_handler(struct pt_regs *regs,
>  				 void (*handler)(struct pt_regs *))
>  {
> @@ -591,8 +593,6 @@ static __always_inline void __el1_irq(struct pt_regs *regs,
>  	do_interrupt_handler(regs, handler);
>  	irq_exit_rcu();
>  
> -	arm64_preempt_schedule_irq();
> -
>  	exit_to_kernel_mode(regs, state);
>  }
>  static void noinstr el1_interrupt(struct pt_regs *regs,
> -- 
> 2.34.1
> 

