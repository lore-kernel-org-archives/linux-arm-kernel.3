Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B19A4C531C7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 10:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zoDshx/L8A4gybf85qsK4YcI8tLFfw4i87t17r27dH0=; b=lY3mLFMwHI0q+w
	eFg28iehIWq0sx7sC5zB6v9tjXAmcg2FAaAfArf7uIlOgfwbDwcLP2GuH0didZmLIEFUjN31XqRyB
	nbvfn0ow8f1uoLNNs5C7yhVndrQvd++XPV2P+a7xDViXhp1WdFP4giePYhXBzK5JwqgwFIjldNxmB
	2CD+aF0N5KJ42/hTzpQOW3odETydjeaLpG6RAYX4/GZmoddZyWA5DivY+ftKwNmICehUuAq74Xc3z
	0oxuVC7Jf17vvpqdDVGPoYlpERdjD5bFOQHmpceOQWnh9yo7l/Hl8nLVuXr9ehf2gLUdbXTaJ1Nra
	/X4UQCLwVkUanYStCisw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmqgK-0000000E2CK-17fK;
	Thu, 23 Jul 2026 10:29:36 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmqgH-0000000E2Bv-1BbN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 10:29:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F139C1477;
	Thu, 23 Jul 2026 03:29:27 -0700 (PDT)
Received: from [10.1.34.163] (e121487-lin.cambridge.arm.com [10.1.34.163])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A35ED3F99C;
	Thu, 23 Jul 2026 03:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784802572; bh=7IeqYTLekg9+0yMqtFibP9kZ3n398kcqplKkZW3lK2U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=s3RSBXBqIkDyRptuCF23MDSPtE2wVsCC+mnIUqkkcxDvN0mzk8/yQ/UljddpQ1hqC
	 OJKo39UVHXGgefn6t1kR77NV+c1QnCl/2Qr/yZqvj/141ihKoBIhRWOJgsqBfyr6MG
	 IMH78SR717gcp6kaPklt/7wfEZVFausLUUkxwUn8=
Message-ID: <dc3ec3b0-a066-475d-af57-342b20f000aa@arm.com>
Date: Thu, 23 Jul 2026 11:29:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 31/36] arm64: nmi: Add handling of superpriority
 interrupts as NMIs
To: Jinjie Ruan <ruanjinjie@huawei.com>, linux-arm-kernel@lists.infradead.org
References: <20260709121333.23507-1-vladimir.murzin@arm.com>
 <20260709121333.23507-32-vladimir.murzin@arm.com>
 <39ce4d9f-e2bd-426d-894f-886784173be1@huawei.com>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <39ce4d9f-e2bd-426d-894f-886784173be1@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_032933_419908_39AE5989 
X-CRM114-Status: GOOD (  31.58  )
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

On 7/21/26 09:33, Jinjie Ruan wrote:
> 
> On 7/9/2026 8:13 PM, Vladimir Murzin wrote:
>> From: Mark Brown <broonie@kernel.org>
>>
>> Our goal with superpriority interrupts is to use them as NMIs, taking
>> advantage of the much smaller regions where they are masked to allow
>> prompt handling of the most time-critical interrupts.
>>
>> When an interrupt is configured with superpriority, we enter EL1 as we
>> do for any other interrupt. The presence of a superpriority interrupt
>> is indicated by a status bit in ISR_EL1. We check this bit before
>> unmasking interrupts in elX_interrupt(), and if a superpriority
>> interrupt is pending, we handle it as an NMI. Otherwise, normal
>> interrupts are handled as usual.
>>
>> Since superpriority interrupts are always handled as NMIs, the
>> interrupt controller can rely on in_nmi() to distinguish them from
>> ordinary interrupts.
>>
>> Enable IPIs to use superpriority interrupts as NMIs, matching the
>> existing pseudo-NMI behaviour.
>> Signed-off-by: Mark Brown <broonie@kernel.org>
>> Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
>> Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
>> ---
>>  arch/arm64/include/asm/entry-common.h |  7 ++++
>>  arch/arm64/kernel/entry-common.c      | 59 ++++++++++++++++++---------
>>  arch/arm64/kernel/smp.c               |  2 +-
>>  3 files changed, 48 insertions(+), 20 deletions(-)
>>
>> diff --git a/arch/arm64/include/asm/entry-common.h b/arch/arm64/include/asm/entry-common.h
>> index 73d82a8d8e95..0681ba91ac3b 100644
>> --- a/arch/arm64/include/asm/entry-common.h
>> +++ b/arch/arm64/include/asm/entry-common.h
>> @@ -37,6 +37,13 @@ static inline bool arch_irqentry_exit_need_resched(void)
>>  	if (system_uses_irq_prio_masking() && read_sysreg(daif))
>>  		return false;
>>  
>> +	/*
>> +	 * If AllInt is set then we must have handled an NMI, so skip
>> +	 * preemption
>> +	 */
>> +	if (system_uses_nmi() && read_sysreg_s(SYS_ALLINT))
>> +		return false;
>> +
>>  	/*
>>  	 * Preempting a task from an IRQ means we leave copies of PSTATE
>>  	 * on the stack. cpufeature's enable calls may modify PSTATE, but
>> diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
>> index a13653b228b7..de71d5a3a6a1 100644
>> --- a/arch/arm64/kernel/entry-common.c
>> +++ b/arch/arm64/kernel/entry-common.c
>> @@ -525,8 +525,8 @@ asmlinkage void noinstr el1h_64_sync_handler(struct pt_regs *regs)
>>  	arm64_debug_exc_context(CRITICAL_CONTEXT);
>>  }
>>  
>> -static __always_inline void __el1_pnmi(struct pt_regs *regs,
>> -				       void (*handler)(struct pt_regs *))
>> +static __always_inline void __el1_nmi(struct pt_regs *regs,
>> +				      void (*handler)(struct pt_regs *))
>>  {
>>  	arm64_exc_hwstate_t hwstate;
>>  	irqentry_state_t state;
>> @@ -545,7 +545,10 @@ static __always_inline void __el1_irq(struct pt_regs *regs,
>>  
>>  	state = arm64_enter_from_kernel_mode(regs);
>>  
>> -	arm64_unmask_exc_context(NONMI_CONTEXT);
>> +	if (system_uses_nmi())
>> +		arm64_unmask_exc_context(NOIRQ_CONTEXT);
>> +	else
>> +		arm64_unmask_exc_context(NONMI_CONTEXT);
> if (gic_supports_pseudo_nmis())
> 	arm64_unmask_exc_context(NONMI_CONTEXT);
> else
> 	arm64_unmask_exc_context(NOIRQ_CONTEXT);
> 
>>  
>>  	irq_enter_rcu();
>>  	do_interrupt_handler(regs, handler);
>> @@ -565,8 +568,11 @@ static __always_inline void __el1_irq(struct pt_regs *regs,
>>  static void noinstr el1_interrupt(struct pt_regs *regs,
>>  				  void (*handler)(struct pt_regs *))
>>  {
>> -	if (IS_ENABLED(CONFIG_ARM64_PSEUDO_NMI) && regs_irqs_disabled(regs))
>> -		__el1_pnmi(regs, handler);
>> +	/* Is there a NMI to handle? */
>> +	if (regs_irqs_disabled(regs))
>> +		__el1_nmi(regs, handler);
>> +	else if (system_uses_nmi() && (read_sysreg(isr_el1) & (ISR_EL1_IS | ISR_EL1_FS)))
>> +		__el1_nmi(regs, handler);
> I think it would be more readable to add a helper below.
> 
> static inline bool is_nmi(regs)
> {
> 	if (regs_irqs_disabled(regs))
> 		return true;
> 
> 	if (system_uses_nmi())
> 		return read_sysreg(isr_el1) & (ISR_EL1_IS | ISR_EL1_FS);
> 
> 	return false;
> }
> 

Makes sense, yet I would keep regs_irqs_disabled() limited to EL1,
since it is very tempting to reuse the helper for EL0 interrupts,
where the regs_irqs_disabled() check is redundant.

>>  static void noinstr el1_interrupt(struct pt_regs *regs,
>>  				  void (*handler)(struct pt_regs *))
>>  {
>> -	if (IS_ENABLED(CONFIG_ARM64_PSEUDO_NMI) && regs_irqs_disabled(regs))
>> -		__el1_pnmi(regs, handler);
>> +	/* Is there a NMI to handle? */
>> +	if (is_nmi(regs))
>> +		__el1_nmi(regs, handler);
>>  	else
>>  		__el1_irq(regs, handler);
>>  
>> @@ -906,24 +912,39 @@ asmlinkage void noinstr el0t_64_sync_handler(struct pt_regs *regs)
>>  static void noinstr el0_interrupt(struct pt_regs *regs,
>>  				  void (*handler)(struct pt_regs *))
>>  {
>> -	arm64_enter_from_user_mode(regs);
>> -
>> -	arm64_unmask_exc_context(NONMI_CONTEXT);
>> -
>>  	if (regs->pc & BIT(55))
>>  		arm64_apply_bp_hardening();
>>  
>> -	irq_enter_rcu();
>> -	do_interrupt_handler(regs, handler);
>> -	irq_exit_rcu();
>> +	/* Is there a NMI to handle? */
>> +	if (system_uses_nmi() && (read_sysreg(isr_el1) & (ISR_EL1_IS | ISR_EL1_FS))) {
>> +		irqentry_state_t state;
>> +		arm64_exc_hwstate_t hwstate;
>> +
>> +		state = irqentry_nmi_enter(regs);
>> +		hwstate = arm64_unmask_exc_context(NONMI_CONTEXT);
>> +		do_interrupt_handler(regs, handler);
>> +		arm64_mask_exc_context(hwstate);
>> +		irqentry_nmi_exit(regs, state);
>> +	} else {
>> +		arm64_enter_from_user_mode(regs);
>> +
>> +		if (system_uses_nmi())
>> +			arm64_unmask_exc_context(NOIRQ_CONTEXT);
>> +		else
>> +			arm64_unmask_exc_context(NONMI_CONTEXT);
> if (gic_supports_pseudo_nmis())
> 	arm64_unmask_exc_context(NONMI_CONTEXT);
> else
> 	arm64_unmask_exc_context(NOIRQ_CONTEXT);
> 
>> +
>> +		irq_enter_rcu();
>> +		do_interrupt_handler(regs, handler);
>> +		irq_exit_rcu();
>> +		/*
>> +		 * For the same reason as in el1_irq() we effectivly
>> +		 * have NOIRQ_CONTEXT on return from handler - keep
>> +		 * track of it
>> +		 */
>> +		arm64_debug_exc_context(NOIRQ_CONTEXT);
>> +		arm64_exit_to_user_mode(regs, arm64_exc_hwstate_of_context(NOIRQ_CONTEXT));
> Here we assert that we are in NOIRQ_CONTEXT, and then we switch to
> NOIRQ_CONTEXT again. Is this redundant?
> 

Well, it is redundant prior to the whole rework, but after the rework
it becomes a no-op because both the previous and next exception states
are the same, so no real work is done. :)

>> +	}
> Can you split them into two sub-functions, such as el0_nmi and el0_irq
> as shown below, so that it looks clearer?
> 

Works for me, I'll update in the next iteration.

> static inline void el0_nmi(struct pt_regs *regs, void (*handler)(struct
> pt_regs *))
> {
> 	arm64_exc_hwstate_t hwstate;
> 	irqentry_state_t state;
> 	
> 	state = irqentry_nmi_enter(regs);
> 	hwstate = arm64_unmask_exc_context(NONMI_CONTEXT);
> 	do_interrupt_handler(regs, handler);
> 	arm64_mask_exc_context(hwstate);
> 	irqentry_nmi_exit(regs, state);
> }
> 
> static inline void el0_irq(struct pt_regs *regs, void (*handler)(struct
> pt_regs *))
> {
> 	arm64_enter_from_user_mode(regs);
> 
> 	if (gic_supports_pseudo_nmis())
> 		arm64_unmask_exc_context(NONMI_CONTEXT);
> 	else
> 		arm64_unmask_exc_context(NOIRQ_CONTEXT);
> 
> 	irq_enter_rcu();
> 	do_interrupt_handler(regs, handler);
> 	irq_exit_rcu();
> 	/*
> 	 * For the same reason as in el1_irq() we effectivly
>     	 * have NOIRQ_CONTEXT on return from handler - keep
>          * track of it
>       	 */
> 	arm64_debug_exc_context(NOIRQ_CONTEXT);			
> 	arm64_exit_to_user_mode(regs, 	
> arm64_exc_hwstate_of_context(NOIRQ_CONTEXT));
> }
> 
> static void noinstr el0_interrupt(struct pt_regs *regs,
>  				  void (*handler)(struct pt_regs *))
> {
> 	if (is_nmi(regs))
> 		el0_nmi(regs);
> 	else
> 		el0_irq(regs);
> }
> 
> otherwise, LGTM
> Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>
> 
> 

Cheers
Vladimir

>>  
>> -	/*
>> -	 * For the same reason as in el1_irq() we effectivly
>> -	 * have NOIRQ_CONTEXT on return from handler - keep
>> -	 * track of it
>> -	 */
>> -	arm64_debug_exc_context(NOIRQ_CONTEXT);
>> -	arm64_exit_to_user_mode(regs, arm64_exc_hwstate_of_context(NOIRQ_CONTEXT));
>>  	arm64_debug_exc_context(CRITICAL_CONTEXT);
>>  }
>>  
>> diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
>> index 257d50529d14..80e35a8e5c8f 100644
>> --- a/arch/arm64/kernel/smp.c
>> +++ b/arch/arm64/kernel/smp.c
>> @@ -1035,7 +1035,7 @@ static void smp_cross_call(const struct cpumask *target, unsigned int ipinr)
>>  
>>  static bool ipi_should_be_nmi(enum ipi_msg_type ipi)
>>  {
>> -	if (!system_uses_irq_prio_masking())
>> +	if (!system_uses_nmi() && !system_uses_irq_prio_masking())
>>  		return false;
>>  
>>  	switch (ipi) {
> 


