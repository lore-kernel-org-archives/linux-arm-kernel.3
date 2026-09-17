Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEF00C982CF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 11:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GZHnTxDLmsV1Ik0LXAY2OVhvjInQef2sNtLEkTJfJG8=; b=K3b9IzcGpKGGeUxn/5p+vtYrrW
	SFGeIR0ZkMXwWxRzlzSbr/Eg3FaeiLVlXd9t/0o4kAgdFFFL5jvdvNntwSLdHxsjqRGy7ertlNLmC
	eSdOJhk8XZxIF4PFpStpSRKbtUB87CYp4JcxDzQQodJI/4o2BP9KbGik95EK9+S83MD2egX0Ttthj
	5yYCGSQrv9lORqNkSykIypCWkL4x1/0rR6UoIBUblMbswLTB+XZ6Aef0kiAA1nZz2Wp/LDmWYYZp/
	N3eUOTB7+OUdA7cRF7pTqA/m+C2NvDgAE/2Mkn0L09pLXNhqFJ7QVp927oRY3/bxiAO71uPORfw2Z
	WE8iT2JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7ARM-0000000BCGM-1ZRX;
	Thu, 17 Sep 2026 11:38:08 +0000
Received: from canpmsgout05.his.huawei.com ([113.46.200.220])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7ARI-0000000BCFg-1YbF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 11:38:06 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=GZHnTxDLmsV1Ik0LXAY2OVhvjInQef2sNtLEkTJfJG8=;
	b=M7ElGLIR3uHMpLo3q6HeTcin/rEI0lxskVgMRK2h8yiuBloYxr0G0nL6t1zw+M3t5KsbaTKqF
	XR5P3vnuGh3Bxl+KHeKdgcUiKk5p7/a3gkCd+uzORkZbH2zROsV9u2yEMdCCcSMheG6LFV2pbG/
	GzraQVxVtm4MuljzQw4SH6w=
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4hltkW3Mv5z12LHf;
	Thu, 17 Sep 2026 19:26:43 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 0C47040561;
	Thu, 17 Sep 2026 19:37:51 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemk200008.china.huawei.com (7.202.194.74) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 17 Sep 2026 19:37:50 +0800
Message-ID: <d2ea770e-baf4-4578-9dea-b3c7a5113df4@huawei.com>
Date: Thu, 17 Sep 2026 19:37:49 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 26/38] arm64: nmi: Add handling of superpriority
 interrupts as NMIs
To: Vladimir Murzin <vladimir.murzin@arm.com>,
	<linux-arm-kernel@lists.infradead.org>
CC: <catalin.marinas@arm.com>, <will@kernel.org>, <mark.rutland@arm.com>,
	<maz@kernel.org>, <lpieralisi@kernel.org>, <liaochang1@huawei.com>
References: <20260914102102.68597-1-vladimir.murzin@arm.com>
 <20260914102102.68597-27-vladimir.murzin@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260914102102.68597-27-vladimir.murzin@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemk200008.china.huawei.com (7.202.194.74)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_043805_104891_86100C7E 
X-CRM114-Status: GOOD (  29.00  )
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



在 2026/9/14 18:20, Vladimir Murzin 写道:
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
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>
> Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
> Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
> Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>  arch/arm64/include/asm/entry-common.h |  7 +++
>  arch/arm64/kernel/entry-common.c      | 83 +++++++++++++++++++++++----
>  arch/arm64/kernel/smp.c               |  2 +-
>  3 files changed, 79 insertions(+), 13 deletions(-)
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

if (system_uses_nmi() && (read_sysreg_s(SYS_ALLINT) & ALLINT_ALLINT))

> +		return false;
> +
>  	/*
>  	 * Preempting a task from an IRQ means we leave copies of PSTATE
>  	 * on the stack. cpufeature's enable calls may modify PSTATE, but
> diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
> index fd0bfead6e70..31dae3b48f23 100644
> --- a/arch/arm64/kernel/entry-common.c
> +++ b/arch/arm64/kernel/entry-common.c
> @@ -31,6 +31,14 @@
>  #include <asm/sysreg.h>
>  #include <asm/system_misc.h>
>  
> +static __always_inline bool is_nmi(void)
> +{
> +	if (!system_uses_nmi())
> +		return false;
> +
> +	return !!(read_sysreg(isr_el1) & ISR_EL1_IS);
> +}
> +
>  /*
>   * Handle IRQ/context state management when entering from kernel mode.
>   * Before this function is called it is not safe to call regular kernel code,
> @@ -525,8 +533,8 @@ asmlinkage void noinstr el1h_64_sync_handler(struct pt_regs *regs)
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
> @@ -545,7 +553,23 @@ static __always_inline void __el1_irq(struct pt_regs *regs,
>  
>  	state = arm64_enter_from_kernel_mode(regs);
>  
> -	arm64_unmask_exc_context(NONMI_CONTEXT);
> +	/*
> +	 * For non-NMI systems, we can switch to NOIRQ context since
> +	 * NMIs cannot occur.
> +	 *
> +	 * For pseudo-NMI, we must keep NONMI context until we can
> +	 * determine the interrupt priority, which is done by the IRQ
> +	 * handler.
> +	 *
> +	 * For FEAT_NMI, we already know the interrupt is an IRQ, so we
> +	 * can switch to NOIRQ context immediately. NMIs do not
> +	 * interfere because they follow a separate handling path and do
> +	 * not share the IRQ handling state.
> +	 */
> +	if (system_uses_irq_prio_masking())
> +		arm64_unmask_exc_context(NONMI_CONTEXT);
> +	else
> +		arm64_unmask_exc_context(NOIRQ_CONTEXT);
>  
>  	irq_enter_rcu();
>  	do_interrupt_handler(regs, handler);
> @@ -565,8 +589,9 @@ static __always_inline void __el1_irq(struct pt_regs *regs,
>  static void noinstr el1_interrupt(struct pt_regs *regs,
>  				  void (*handler)(struct pt_regs *))
>  {
> -	if (IS_ENABLED(CONFIG_ARM64_PSEUDO_NMI) && regs_irqs_disabled(regs))
> -		__el1_pnmi(regs, handler);
> +	/* Is there a NMI to handle? */
> +	if (regs_irqs_disabled(regs) || is_nmi())
> +		__el1_nmi(regs, handler);
>  	else
>  		__el1_irq(regs, handler);
>  
> @@ -580,6 +605,8 @@ asmlinkage void noinstr el1h_64_irq_handler(struct pt_regs *regs)
>  
>  asmlinkage void noinstr el1h_64_fiq_handler(struct pt_regs *regs)
>  {
> +	WARN_ON_ONCE(system_uses_nmi() && (read_sysreg(isr_el1) & ISR_EL1_FS));
> +
>  	el1_interrupt(regs, handle_arch_fiq);
>  }
>  
> @@ -903,20 +930,36 @@ asmlinkage void noinstr el0t_64_sync_handler(struct pt_regs *regs)
>  	arm64_debug_exc_context(CRITICAL_CONTEXT);
>  }
>  
> -static void noinstr el0_interrupt(struct pt_regs *regs,
> -				  void (*handler)(struct pt_regs *))
> +static __always_inline void __el0_nmi(struct pt_regs *regs,
> +				      void (*handler)(struct pt_regs *))
>  {
> -	arm64_enter_from_user_mode(regs);
> +	irqentry_state_t state;
> +	arm64_exc_hwstate_t hwstate;
>  
> -	arm64_unmask_exc_context(NONMI_CONTEXT);
> +	state = irqentry_nmi_enter(regs);
> +	hwstate = arm64_unmask_exc_context(NONMI_CONTEXT);
> +	do_interrupt_handler(regs, handler);
> +	arm64_mask_exc_context(hwstate);
> +	irqentry_nmi_exit(regs, state);
> +}
>  
> -	if (regs->pc & BIT(55))
> -		arm64_apply_bp_hardening();
> +static __always_inline void __el0_irq(struct pt_regs *regs,
> +				      void (*handler)(struct pt_regs *))
> +{
> +	arm64_enter_from_user_mode(regs);
> +	/*
> +	 * For the same reason as in el1_irq() keep NONMI
> +	 * context for pesudo-NMI, and switch to NOIRQ
> +	 * otherwise
> +	 */
> +	if (system_uses_irq_prio_masking())
> +		arm64_unmask_exc_context(NONMI_CONTEXT);
> +	else
> +		arm64_unmask_exc_context(NOIRQ_CONTEXT);
>  
>  	irq_enter_rcu();
>  	do_interrupt_handler(regs, handler);
>  	irq_exit_rcu();
> -
>  	/*
>  	 * For the same reason as in el1_irq() we effectivly
>  	 * have NOIRQ_CONTEXT on return from handler - keep
> @@ -924,6 +967,20 @@ static void noinstr el0_interrupt(struct pt_regs *regs,
>  	 */
>  	arm64_debug_exc_context(NOIRQ_CONTEXT);
>  	arm64_exit_to_user_mode(regs, arm64_exc_hwstate_of_context(NOIRQ_CONTEXT));
> +}
> +
> +static void noinstr el0_interrupt(struct pt_regs *regs,
> +				  void (*handler)(struct pt_regs *))
> +{
> +	if (regs->pc & BIT(55))
> +		arm64_apply_bp_hardening();
> +
> +	/* Is there a NMI to handle? */
> +	if (is_nmi())
> +		__el0_nmi(regs, handler);
> +	else
> +		__el0_irq(regs, handler);
> +
>  	arm64_debug_exc_context(CRITICAL_CONTEXT);
>  }
>  
> @@ -939,6 +996,8 @@ asmlinkage void noinstr el0t_64_irq_handler(struct pt_regs *regs)
>  
>  static void noinstr __el0_fiq_handler_common(struct pt_regs *regs)
>  {
> +	WARN_ON_ONCE(system_uses_nmi() && (read_sysreg(isr_el1) & ISR_EL1_FS));
> +
>  	el0_interrupt(regs, handle_arch_fiq);
>  }
>  
> diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
> index f29094ec3843..3d7060aedd66 100644
> --- a/arch/arm64/kernel/smp.c
> +++ b/arch/arm64/kernel/smp.c
> @@ -1061,7 +1061,7 @@ static void smp_cross_call(const struct cpumask *target, unsigned int ipinr)
>  
>  static bool ipi_should_be_nmi(enum ipi_msg_type ipi)
>  {
> -	if (!system_uses_irq_prio_masking())
> +	if (!system_uses_nmi() && !system_uses_irq_prio_masking())
>  		return false;
>  
>  	switch (ipi) {

-- 
Best regards,
Jinjie


