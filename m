Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3098CC87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 16:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UpB2GIUgkfPcnRjs3ARqM9F7ZHPJ2zjE6ameQ16EUwI=; b=JOEAOIJITGG3GuYfuMlSIE5Ycx
	XJHWsICrOTpxxTe4uFgPrX/G4VIr6P/w7mI3Bn7YAkwQm1FnS7tHZwJOMJZJY2NvwKvHLI45YuAVq
	xyNIDBOjFwW9e0oGvCPy+uyVLVdwIjoNccWVukLIbmhbBAfV5bWd5+SLbUVREAGgb30wu2cVnfo09
	NfdOIGtzHRB8VXGoFuoZDsYD/2F/XIzSCTIqo6tbVaPoqfWpwZqbDmKQ0Slh352Mj/gFFkxw+nBOa
	RJIOIIQbAi0anLQ8FitNlgShLVh5FTTaZ2eGfCcwuWFVouQwJLKlQfBYjU0/zTCNRAAz67z+Lel6T
	EfG0vxOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulrjj-0000000BK10-3a97;
	Tue, 12 Aug 2025 16:20:31 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulmww-0000000AaCK-0fkP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 11:13:51 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0FE5225E1;
	Tue, 12 Aug 2025 04:13:41 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5BB453F63F;
	Tue, 12 Aug 2025 04:13:45 -0700 (PDT)
Date: Tue, 12 Aug 2025 12:13:42 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Subject: Re: [PATCH -next v7 5/7] arm64: entry: Refactor
 preempt_schedule_irq() check code
Message-ID: <aJsh5oM3CoUELkvY@J2N7QTR9R3>
References: <20250729015456.3411143-1-ruanjinjie@huawei.com>
 <20250729015456.3411143-6-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250729015456.3411143-6-ruanjinjie@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_041350_285922_8135084D 
X-CRM114-Status: GOOD (  26.64  )
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
Cc: sstabellini@kernel.org, puranjay@kernel.org, anshuman.khandual@arm.com, catalin.marinas@arm.com, liaochang1@huawei.com, oleg@redhat.com, kristina.martsenko@arm.com, linux-kernel@vger.kernel.org, broonie@kernel.org, chenl311@chinatelecom.cn, xen-devel@lists.xenproject.org, leitao@debian.org, ryan.roberts@arm.com, akpm@linux-foundation.org, mbenes@suse.cz, will@kernel.org, ardb@kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Tue, Jul 29, 2025 at 09:54:54AM +0800, Jinjie Ruan wrote:
> ARM64 requires an additional check whether to reschedule on return
> from interrupt. So add arch_irqentry_exit_need_resched() as the default
> NOP implementation and hook it up into the need_resched() condition in
> raw_irqentry_exit_cond_resched(). This allows ARM64 to implement
> the architecture specific version for switching over to
> the generic entry code.
> 
> To align the structure of the code with irqentry_exit_cond_resched()
> from the generic entry code, hoist the need_irq_preemption()
> and IS_ENABLED() check earlier. And different preemption check functions
> are defined based on whether dynamic preemption is enabled.
> 
> Suggested-by: Mark Rutland <mark.rutland@arm.com>
> Suggested-by: Kevin Brodsky <kevin.brodsky@arm.com>
> Suggested-by: Thomas Gleixner <tglx@linutronix.de>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>  arch/arm64/include/asm/preempt.h |  4 ++++
>  arch/arm64/kernel/entry-common.c | 35 ++++++++++++++++++--------------
>  kernel/entry/common.c            | 16 ++++++++++++++-
>  3 files changed, 39 insertions(+), 16 deletions(-)

Can you please split the change to kernel/entry/common.c into a separate
patch? That doesn't depend on the arm64-specific changes, and it'll make
it easier to handle any conflcits when merging this.

Mark.

> 
> diff --git a/arch/arm64/include/asm/preempt.h b/arch/arm64/include/asm/preempt.h
> index 0159b625cc7f..0f0ba250efe8 100644
> --- a/arch/arm64/include/asm/preempt.h
> +++ b/arch/arm64/include/asm/preempt.h
> @@ -85,6 +85,7 @@ static inline bool should_resched(int preempt_offset)
>  void preempt_schedule(void);
>  void preempt_schedule_notrace(void);
>  
> +void raw_irqentry_exit_cond_resched(void);
>  #ifdef CONFIG_PREEMPT_DYNAMIC
>  
>  DECLARE_STATIC_KEY_TRUE(sk_dynamic_irqentry_exit_cond_resched);
> @@ -92,11 +93,14 @@ void dynamic_preempt_schedule(void);
>  #define __preempt_schedule()		dynamic_preempt_schedule()
>  void dynamic_preempt_schedule_notrace(void);
>  #define __preempt_schedule_notrace()	dynamic_preempt_schedule_notrace()
> +void dynamic_irqentry_exit_cond_resched(void);
> +#define irqentry_exit_cond_resched()	dynamic_irqentry_exit_cond_resched()
>  
>  #else /* CONFIG_PREEMPT_DYNAMIC */
>  
>  #define __preempt_schedule()		preempt_schedule()
>  #define __preempt_schedule_notrace()	preempt_schedule_notrace()
> +#define irqentry_exit_cond_resched()	raw_irqentry_exit_cond_resched()
>  
>  #endif /* CONFIG_PREEMPT_DYNAMIC */
>  #endif /* CONFIG_PREEMPTION */
> diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
> index 7c2299c1ba79..4f92664fd46c 100644
> --- a/arch/arm64/kernel/entry-common.c
> +++ b/arch/arm64/kernel/entry-common.c
> @@ -285,19 +285,8 @@ static void noinstr arm64_exit_el1_dbg(struct pt_regs *regs,
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
>  static inline bool arm64_preempt_schedule_irq(void)
>  {
> -	if (!need_irq_preemption())
> -		return false;
> -
>  	/*
>  	 * DAIF.DA are cleared at the start of IRQ/FIQ handling, and when GIC
>  	 * priority masking is used the GIC irqchip driver will clear DAIF.IF
> @@ -672,6 +661,24 @@ static __always_inline void __el1_pnmi(struct pt_regs *regs,
>  	arm64_exit_nmi(regs, state);
>  }
>  
> +void raw_irqentry_exit_cond_resched(void)
> +{
> +	if (!preempt_count()) {
> +		if (need_resched() && arm64_preempt_schedule_irq())
> +			preempt_schedule_irq();
> +	}
> +}
> +
> +#ifdef CONFIG_PREEMPT_DYNAMIC
> +DEFINE_STATIC_KEY_TRUE(sk_dynamic_irqentry_exit_cond_resched);
> +void dynamic_irqentry_exit_cond_resched(void)
> +{
> +	if (!static_branch_unlikely(&sk_dynamic_irqentry_exit_cond_resched))
> +		return;
> +	raw_irqentry_exit_cond_resched();
> +}
> +#endif
> +
>  static __always_inline void __el1_irq(struct pt_regs *regs,
>  				      void (*handler)(struct pt_regs *))
>  {
> @@ -681,10 +688,8 @@ static __always_inline void __el1_irq(struct pt_regs *regs,
>  	do_interrupt_handler(regs, handler);
>  	irq_exit_rcu();
>  
> -	if (!preempt_count() && need_resched()) {
> -		if (arm64_preempt_schedule_irq())
> -			preempt_schedule_irq();
> -	}
> +	if (IS_ENABLED(CONFIG_PREEMPTION))
> +		irqentry_exit_cond_resched();
>  
>  	exit_to_kernel_mode(regs, state);
>  }
> diff --git a/kernel/entry/common.c b/kernel/entry/common.c
> index b82032777310..4aa9656fa1b4 100644
> --- a/kernel/entry/common.c
> +++ b/kernel/entry/common.c
> @@ -142,6 +142,20 @@ noinstr irqentry_state_t irqentry_enter(struct pt_regs *regs)
>  	return ret;
>  }
>  
> +/**
> + * arch_irqentry_exit_need_resched - Architecture specific need resched function
> + *
> + * Invoked from raw_irqentry_exit_cond_resched() to check if need resched.
> + * Defaults return true.
> + *
> + * The main purpose is to permit arch to skip preempt a task from an IRQ.
> + */
> +static inline bool arch_irqentry_exit_need_resched(void);
> +
> +#ifndef arch_irqentry_exit_need_resched
> +static inline bool arch_irqentry_exit_need_resched(void) { return true; }
> +#endif
> +
>  void raw_irqentry_exit_cond_resched(void)
>  {
>  	if (!preempt_count()) {
> @@ -149,7 +163,7 @@ void raw_irqentry_exit_cond_resched(void)
>  		rcu_irq_exit_check_preempt();
>  		if (IS_ENABLED(CONFIG_DEBUG_ENTRY))
>  			WARN_ON_ONCE(!on_thread_stack());
> -		if (need_resched())
> +		if (need_resched() && arch_irqentry_exit_need_resched())
>  			preempt_schedule_irq();
>  	}
>  }
> -- 
> 2.34.1
> 

