Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36E9CC43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 10:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DnVokXZyq6CcxYycOZdA3NEVXIYhxoLpML5+qWvUVso=; b=ag/p9BlB+sZ9aK
	Pn99/Bk7wibim0/En8A2hhOHhCX3EwJH/yC+LwUCh0TSMRTNS7HsZSBLqkJkD+XkxPnVnHUn5svV5
	DqfknceM7sQp+FXwweYs7I9Clxdi0GGQP+/nbpCkwzEAYg8WX79xpp6pjXxUYXsPs6iqJFGl+pLD5
	uU0ZOwzk5KPO6mheDxHhDulf/qeoqVDXuXQ53/zVYGkIgADhB6G9Hr2EvA+T7w4AKsdin/9nRbggf
	h63Ic9d+qHGXa8DQF4Vr/TlGBsakfZchUVdPuLrVPM+XI1hHhvCCA/qfNzYhrzK3S9efZWTfZggzq
	peHNOQJBYfH+mRRdv44A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi8EK-00000004g2Y-0kJ2;
	Fri, 10 Jul 2026 10:13:12 +0000
Received: from canpmsgout11.his.huawei.com ([113.46.200.226])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi8EG-00000004g1V-2bnk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 10:13:10 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=DnVokXZyq6CcxYycOZdA3NEVXIYhxoLpML5+qWvUVso=;
	b=OWXOuFTqG/GyKGI1Hi+JTQGxTVrUyz8BQML5h0MjASTqs7HNBAntO82gnlbw5GKUu+rDUbfwK
	RgJNkRMGhksZf0TXr5jr6gPIZIi2OZJrGrUQU+bCXYxeBjmqlwdkTNcqJA8Amdun4olJB5xXW/x
	rYgnCp9e2NFDkEW+25VC09U=
Received: from mail.maildlp.com (unknown [172.19.163.214])
	by canpmsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4gxS8g6y0hzKm5j;
	Fri, 10 Jul 2026 18:03:47 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id C02634056C;
	Fri, 10 Jul 2026 18:13:05 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 10 Jul 2026 18:13:04 +0800
Message-ID: <88a31062-f898-474f-b3a6-1a0b8586d5e3@huawei.com>
Date: Fri, 10 Jul 2026 18:13:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 31/36] arm64: nmi: Add handling of superpriority
 interrupts as NMIs
To: Vladimir Murzin <vladimir.murzin@arm.com>,
	<linux-arm-kernel@lists.infradead.org>
References: <20260709121333.23507-1-vladimir.murzin@arm.com>
 <20260709121333.23507-32-vladimir.murzin@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260709121333.23507-32-vladimir.murzin@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_031309_334948_A2DA6F63 
X-CRM114-Status: GOOD (  27.09  )
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
Cc: mark.rutland@arm.com, maz@kernel.org, Mark Brown <broonie@kernel.org>, catalin.marinas@arm.com, will@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org



On 7/9/2026 8:13 PM, Vladimir Murzin wrote:
> From: Mark Brown <broonie@kernel.org>
> 
> Our goal with superpriority interrupts is to use them as NMIs, taking
> advantage of the much smaller regions where they are masked to allow
> prompt handling of the most time-critical interrupts.
> 
> When an interrupt is configured with superpriority, we enter EL1 as we
> do for any other interrupt. The presence of a superpriority interrupt
> is indicated by a status bit in ISR_EL1. We check this bit before
> unmasking interrupts in elX_interrupt(), and if a superpriority
> interrupt is pending, we handle it as an NMI. Otherwise, normal
> interrupts are handled as usual.
> 
> Since superpriority interrupts are always handled as NMIs, the
> interrupt controller can rely on in_nmi() to distinguish them from
> ordinary interrupts.
> 
> Enable IPIs to use superpriority interrupts as NMIs, matching the
> existing pseudo-NMI behaviour.
> Signed-off-by: Mark Brown <broonie@kernel.org>
> Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
> Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
> ---
>  arch/arm64/include/asm/entry-common.h |  7 ++++
>  arch/arm64/kernel/entry-common.c      | 59 ++++++++++++++++++---------
>  arch/arm64/kernel/smp.c               |  2 +-
>  3 files changed, 48 insertions(+), 20 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/entry-common.h b/arch/arm64/include/asm/entry-common.h
> index 73d82a8d8e95..0681ba91ac3b 100644
> --- a/arch/arm64/include/asm/entry-common.h
> +++ b/arch/arm64/include/asm/entry-common.h
> @@ -37,6 +37,13 @@ static inline bool arch_irqentry_exit_need_resched(void)
>  	if (system_uses_irq_prio_masking() && read_sysreg(daif))
>  		return false;
>  
> +	/*
> +	 * If AllInt is set then we must have handled an NMI, so skip
> +	 * preemption
> +	 */
> +	if (system_uses_nmi() && read_sysreg_s(SYS_ALLINT))
> +		return false;
> +
>  	/*
>  	 * Preempting a task from an IRQ means we leave copies of PSTATE
>  	 * on the stack. cpufeature's enable calls may modify PSTATE, but
> diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
> index a13653b228b7..de71d5a3a6a1 100644
> --- a/arch/arm64/kernel/entry-common.c
> +++ b/arch/arm64/kernel/entry-common.c
> @@ -525,8 +525,8 @@ asmlinkage void noinstr el1h_64_sync_handler(struct pt_regs *regs)
>  	arm64_debug_exc_context(CRITICAL_CONTEXT);
>  }
>  
> -static __always_inline void __el1_pnmi(struct pt_regs *regs,
> -				       void (*handler)(struct pt_regs *))
> +static __always_inline void __el1_nmi(struct pt_regs *regs,
> +				      void (*handler)(struct pt_regs *))
>  {
>  	arm64_exc_hwstate_t hwstate;
>  	irqentry_state_t state;
> @@ -545,7 +545,10 @@ static __always_inline void __el1_irq(struct pt_regs *regs,
>  
>  	state = arm64_enter_from_kernel_mode(regs);
>  
> -	arm64_unmask_exc_context(NONMI_CONTEXT);
> +	if (system_uses_nmi())
> +		arm64_unmask_exc_context(NOIRQ_CONTEXT);
> +	else
> +		arm64_unmask_exc_context(NONMI_CONTEXT);

This looks strange; whether it's a pseudo NMI or FEAT_NMI, the behavior
should be consistent.

>  
>  	irq_enter_rcu();
>  	do_interrupt_handler(regs, handler);
> @@ -565,8 +568,11 @@ static __always_inline void __el1_irq(struct pt_regs *regs,
>  static void noinstr el1_interrupt(struct pt_regs *regs,
>  				  void (*handler)(struct pt_regs *))
>  {
> -	if (IS_ENABLED(CONFIG_ARM64_PSEUDO_NMI) && regs_irqs_disabled(regs))
> -		__el1_pnmi(regs, handler);
> +	/* Is there a NMI to handle? */
> +	if (regs_irqs_disabled(regs))
> +		__el1_nmi(regs, handler);
> +	else if (system_uses_nmi() && (read_sysreg(isr_el1) & (ISR_EL1_IS | ISR_EL1_FS)))
> +		__el1_nmi(regs, handler);
>  	else
>  		__el1_irq(regs, handler);
>  
> @@ -906,24 +912,39 @@ asmlinkage void noinstr el0t_64_sync_handler(struct pt_regs *regs)
>  static void noinstr el0_interrupt(struct pt_regs *regs,
>  				  void (*handler)(struct pt_regs *))
>  {
> -	arm64_enter_from_user_mode(regs);
> -
> -	arm64_unmask_exc_context(NONMI_CONTEXT);
> -
>  	if (regs->pc & BIT(55))
>  		arm64_apply_bp_hardening();
>  
> -	irq_enter_rcu();
> -	do_interrupt_handler(regs, handler);
> -	irq_exit_rcu();
> +	/* Is there a NMI to handle? */
> +	if (system_uses_nmi() && (read_sysreg(isr_el1) & (ISR_EL1_IS | ISR_EL1_FS))) {
> +		irqentry_state_t state;
> +		arm64_exc_hwstate_t hwstate;
> +
> +		state = irqentry_nmi_enter(regs);
> +		hwstate = arm64_unmask_exc_context(NONMI_CONTEXT);
> +		do_interrupt_handler(regs, handler);
> +		arm64_mask_exc_context(hwstate);
> +		irqentry_nmi_exit(regs, state);
> +	} else {
> +		arm64_enter_from_user_mode(regs);
> +
> +		if (system_uses_nmi())
> +			arm64_unmask_exc_context(NOIRQ_CONTEXT);
> +		else
> +			arm64_unmask_exc_context(NONMI_CONTEXT);
> +
> +		irq_enter_rcu();
> +		do_interrupt_handler(regs, handler);
> +		irq_exit_rcu();
> +		/*
> +		 * For the same reason as in el1_irq() we effectivly
> +		 * have NOIRQ_CONTEXT on return from handler - keep
> +		 * track of it
> +		 */
> +		arm64_debug_exc_context(NOIRQ_CONTEXT);
> +		arm64_exit_to_user_mode(regs, arm64_exc_hwstate_of_context(NOIRQ_CONTEXT));
> +	}
>  
> -	/*
> -	 * For the same reason as in el1_irq() we effectivly
> -	 * have NOIRQ_CONTEXT on return from handler - keep
> -	 * track of it
> -	 */
> -	arm64_debug_exc_context(NOIRQ_CONTEXT);
> -	arm64_exit_to_user_mode(regs, arm64_exc_hwstate_of_context(NOIRQ_CONTEXT));
>  	arm64_debug_exc_context(CRITICAL_CONTEXT);
>  }
>  
> diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
> index 257d50529d14..80e35a8e5c8f 100644
> --- a/arch/arm64/kernel/smp.c
> +++ b/arch/arm64/kernel/smp.c
> @@ -1035,7 +1035,7 @@ static void smp_cross_call(const struct cpumask *target, unsigned int ipinr)
>  
>  static bool ipi_should_be_nmi(enum ipi_msg_type ipi)
>  {
> -	if (!system_uses_irq_prio_masking())
> +	if (!system_uses_nmi() && !system_uses_irq_prio_masking())
>  		return false;
>  
>  	switch (ipi) {


