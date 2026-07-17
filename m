Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3E4DC44507
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 10:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PvD5qzugNa/+9F2N07ZM+JzfXI5/FOEBgI8hFqaVygI=; b=4tIf+0qp4SzPqW
	V7fHXZ/x2fe4ruKZhkP/WYRd7JgP+mpm0Rnjp/cD2BEJKgStaXwWkGzquiqYHCT+bLhKEgMn04QUH
	yvlIRyYl8yBkq5N6NL4Xcx1N70fT2uZICtKzcLc4u89k/+iKxdstZjhe39yrw6/EE1SK9WOT8nno6
	fHJZdeDIwFS7NSs6xtPcVjMkY6By/jVTfGBgu2qc1ZZSYYA1s2/Pk8bxEgX2wtEEFHR0vYFFFqyug
	PEWRSv1RssYO6X+AebQWb/Z4e3ZsthsQ8cJsa2ZNcbjPaNN3xjKEyuXpUY1MXYs4AiogFhZ1l2rjI
	axr3LFFYJEE5Jmh2Fj6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkfoa-00000001xva-3BCF;
	Fri, 17 Jul 2026 10:29:08 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkfoY-00000001xtq-05OW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 10:29:07 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CE2F51476;
	Fri, 17 Jul 2026 03:28:58 -0700 (PDT)
Received: from [10.1.34.162] (e121487-lin.cambridge.arm.com [10.1.34.162])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 42FE53F7D8;
	Fri, 17 Jul 2026 03:29:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784284142; bh=FKjheZSmV4oiNq3J45v9YMynJqhfh3BCT1jXo+vh9Xw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=anzKG6ySObGODkjpZUZ8+17/EiSf8zJ6HvFrQpzrh8IbFpQDkcLGzIstAYBNpZBPd
	 rZr8j2bu/Rn2XabLHjRFE0a+BTVmV/ihojOyj9pZVttsUkWUWhhQ3Y4bbiRfKkglNo
	 /BqdELwJ1XTgTIfjZYNAL+w1fqKZIFk0Z1UAn2to=
Message-ID: <fedf2b3e-14ed-4483-8cdf-d31f1ac97b84@arm.com>
Date: Fri, 17 Jul 2026 11:28:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 10/36] arm64: irqflags: save and use both DAIF and PMR
To: Jinjie Ruan <ruanjinjie@huawei.com>, linux-arm-kernel@lists.infradead.org
References: <20260709121333.23507-1-vladimir.murzin@arm.com>
 <20260709121333.23507-11-vladimir.murzin@arm.com>
 <793f5269-783c-46b6-847e-b943cf3e2a70@huawei.com>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <793f5269-783c-46b6-847e-b943cf3e2a70@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_032906_147505_15C3C9A8 
X-CRM114-Status: GOOD (  25.09  )
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
Cc: mark.rutland@arm.com, maz@kernel.org, will@kernel.org, catalin.marinas@arm.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On 7/10/26 10:02, Jinjie Ruan wrote:
> 
> On 7/9/2026 8:13 PM, Vladimir Murzin wrote:
>> From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
>>
>> With pseudo-NMIs enabled, both DAIF and the PMR affect interrupt masking.
>> Now that we have a type which can track both of them at the same time,
>> update our irqflags implementation to use it.
>>
>> Save DAIF flags in all cases, as they can be manipulated directly by other
>> code, and the PMR if it is in use.
>>
>> When checking if IRQs are disabled, now that we always save DAIF we can
>> check that the I flag is set and bypass checking the PMR if it is.
>> We can also properly check if PMR masks interrupts (PMR < GIC_PRIO_IRQON),
>> now that we don't need to rely on the GIC_PRIO_PSR_I_SET bit being set in
>> the PMR to know if DAIF is already masking interrupts.
>> Update `irqs_priority_unmasked()` to align with this change.
>>
>> This allows us to remove the `__daif_...` and `__pmr_...` versions
>> of the save and check functions, as they are now unified.
>>
>> We can reasonably merge the two `__{daif,pmr}_irq_restore()` functions
>> in the main one, as the DAIF and PMR values are properly split now.
>>
>> Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
>> Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
>> ---
>>  arch/arm64/include/asm/irqflags.h | 110 ++++++------------------------
>>  arch/arm64/include/asm/ptrace.h   |   2 +-
>>  2 files changed, 23 insertions(+), 89 deletions(-)
>>
>> diff --git a/arch/arm64/include/asm/irqflags.h b/arch/arm64/include/asm/irqflags.h
>> index 7775904ba6a9..62f047702493 100644
>> --- a/arch/arm64/include/asm/irqflags.h
>> +++ b/arch/arm64/include/asm/irqflags.h
>> @@ -95,117 +95,48 @@ static __always_inline void arch_local_irq_disable(void)
>>  	}
>>  }
>>  
>> -static __always_inline arm64_exc_hwstate_t __daif_local_save_flags(void)
>> -{
>> -	return (arm64_exc_hwstate_t){ .daif = read_sysreg(daif) };
>> -}
>> -
>> -static __always_inline arm64_exc_hwstate_t __pmr_local_save_flags(void)
>> -{
>> -	return (arm64_exc_hwstate_t){ .pmr = read_sysreg_s(SYS_ICC_PMR_EL1) };
>> -}
>> -
>>  /*
>>   * Save the current interrupt enable state.
>>   */
>>  static __always_inline unsigned long arch_local_save_flags(void)
>>  {
>> -	if (system_uses_irq_prio_masking()) {
>> -		return __pmr_local_save_flags().flags;
>> -	} else {
>> -		return __daif_local_save_flags().flags;
>> -	}
>> -}
>> +	arm64_exc_hwstate_t hwstate = { .daif = read_sysreg(daif) };
>>  
>> -static __always_inline
>> -bool __daif_irqs_disabled_flags(arm64_exc_hwstate_t hwstate)
>> -{
>> -	return hwstate.daif & PSR_I_BIT;
>> -}
>> +	if (system_uses_irq_prio_masking())
>> +		hwstate.pmr = read_sysreg_s(SYS_ICC_PMR_EL1);
>>  
>> -static __always_inline
>> -bool __pmr_irqs_disabled_flags(arm64_exc_hwstate_t hwstate)
>> -{
>> -	return hwstate.pmr != GIC_PRIO_IRQON;
>> +	return hwstate.flags;
>>  }
>>  
>>  static __always_inline bool arch_irqs_disabled_flags(unsigned long flags)
>>  {
>>  	arm64_exc_hwstate_t hwstate = { .flags = flags };
>>  
>> -	if (system_uses_irq_prio_masking()) {
>> -		return __pmr_irqs_disabled_flags(hwstate);
>> -	} else {
>> -		return __daif_irqs_disabled_flags(hwstate);
>> -	}
>> -}
>> +	/* If I is set, the PMR doesn't matter: interrupts will not be taken. */
>> +	if (hwstate.daif & PSR_I_BIT)
>> +		return true;
>>  
>> -static __always_inline bool __daif_irqs_disabled(void)
>> -{
>> -	return __daif_irqs_disabled_flags(__daif_local_save_flags());
>> -}
>> +	if (system_uses_irq_prio_masking() && hwstate.pmr < GIC_PRIO_IRQON)
> I think "hwstate.pmr == GIC_PRIO_IRQOFF" is fine, Besides DAIF.I bit set
> and pmr is GIC_PRIO_IRQOFF, are there any other possible cases?
> 

Numerically, PMR can hold values ordered as:

  IRQOFF < IRQON < IRQON | GIC_PRIO_PSR_I_SET

So hwstate.pmr < GIC_PRIO_IRQON is indeed IRQOFF.

The only other possibility would be a buggy case with the DAIF.I bit
clear and PMR set to IRQON | GIC_PRIO_PSR_I_SET.

So I think we can temporarily add a debug check for that, which would
disappear together with GIC_PRIO_PSR_I_SET. Something like:

static __always_inline bool arch_irqs_disabled_flags(unsigned long flags)
{
	arm64_exc_hwstate_t hwstate = { .flags = flags };

	if (hwstate.daif & PSR_I_BIT)
		return true;

	if (system_uses_irq_prio_masking()) {
		WARN_ON_ONCE(IS_ENABLED(CONFIG_DEBUG_IRQFLAGS) &&
			     hwstate.pmr == GIC_PRIO_IRQON | GIC_PRIO_PSR_I_SET);

		return hwstate.pmr != GIC_PRIO_IRQON;
	}

	return false;
}

>> +		return true;
>>  
>> -static __always_inline bool __pmr_irqs_disabled(void)
>> -{
>> -	return __pmr_irqs_disabled_flags(__pmr_local_save_flags());
>> +	return false;
>>  }
>>  
>>  static __always_inline bool arch_irqs_disabled(void)
>>  {
>> -	if (system_uses_irq_prio_masking()) {
>> -		return __pmr_irqs_disabled();
>> -	} else {
>> -		return __daif_irqs_disabled();
>> -	}
>> -}
>> -
>> -static __always_inline arm64_exc_hwstate_t __daif_local_irq_save(void)
>> -{
>> -	arm64_exc_hwstate_t hwstate = __daif_local_save_flags();
>> -
>> -	__daif_local_irq_disable();
>> -
>> -	return hwstate;
>> -}
>> -
>> -static __always_inline arm64_exc_hwstate_t __pmr_local_irq_save(void)
>> -{
>> -	arm64_exc_hwstate_t hwstate = __pmr_local_save_flags();
>> -
>> -	/*
>> -	 * There are too many states with IRQs disabled, just keep the current
>> -	 * state if interrupts are already disabled/masked.
>> -	 */
>> -	if (!__pmr_irqs_disabled_flags(hwstate))
>> -		__pmr_local_irq_disable();
>> -
>> -	return hwstate;
>> +	return arch_irqs_disabled_flags(arch_local_save_flags());
>>  }
>>  
>>  static __always_inline unsigned long arch_local_irq_save(void)
>>  {
>> -	if (system_uses_irq_prio_masking()) {
>> -		return __pmr_local_irq_save().flags;
>> -	} else {
>> -		return __daif_local_irq_save().flags;
>> -	}
>> -}
>> +	unsigned long flags = arch_local_save_flags();
>>  
>> -static __always_inline
>> -void __daif_local_irq_restore(arm64_exc_hwstate_t hwstate)
>> -{
>> -	barrier();
>> -	write_sysreg(hwstate.daif, daif);
>> -	barrier();
>> -}
>> +	if (system_uses_irq_prio_masking())
>> +		__pmr_local_irq_disable();
>> +	else
>> +		__daif_local_irq_disable();
>>  
>> -static __always_inline
>> -void __pmr_local_irq_restore(arm64_exc_hwstate_t hwstate)
>> -{
>> -	barrier();
>> -	write_sysreg_s(hwstate.pmr, SYS_ICC_PMR_EL1);
>> -	pmr_sync();
>> -	barrier();
>> +	return flags;
>>  }
>>  
>>  /*
>> @@ -215,11 +146,14 @@ static __always_inline void arch_local_irq_restore(unsigned long flags)
>>  {
>>  	arm64_exc_hwstate_t hwstate = { .flags = flags };
>>  
>> +	barrier();
>>  	if (system_uses_irq_prio_masking()) {
>> -		__pmr_local_irq_restore(hwstate);
>> +		write_sysreg_s(hwstate.pmr, SYS_ICC_PMR_EL1);
>> +		pmr_sync();
>>  	} else {
>> -		__daif_local_irq_restore(hwstate);
>> +		write_sysreg(hwstate.daif, daif);
>>  	}
>> +	barrier();
>>  }
>>  
>>  #endif /* __ASM_IRQFLAGS_H */
>> diff --git a/arch/arm64/include/asm/ptrace.h b/arch/arm64/include/asm/ptrace.h
>> index f7dc5fb9427d..192eb97cd50b 100644
>> --- a/arch/arm64/include/asm/ptrace.h
>> +++ b/arch/arm64/include/asm/ptrace.h
>> @@ -205,7 +205,7 @@ static inline void forget_syscall(struct pt_regs *regs)
>>  
>>  #define irqs_priority_unmasked(regs)					\
>>  	(system_uses_irq_prio_masking() ?				\
>> -		(regs)->pmr == GIC_PRIO_IRQON :				\
>> +		(regs)->pmr >= GIC_PRIO_IRQON :				\
> I think "=== GIC_PRIO_IRQON" is fine.
> 

Agree. This can be aligned to arch_irqs_disabled_flags() (maybe as a separate
patch):

static __always_inline bool regs_irqs_disabled(const struct pt_regs *regs)
{
	if (regs->pstate & PSR_I_BIT)
		return true;

	if (system_uses_irq_prio_masking()) {
		WARN_ON_ONCE(IS_ENABLED(CONFIG_DEBUG_IRQFLAGS) &&
			     regs->pmr == GIC_PRIO_IRQON | GIC_PRIO_PSR_I_SET);

		return regs->pmr != GIC_PRIO_IRQON;
	}

	return false;
}

What do you reckon?

> otherwise, LGTM
> Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>
> 
>>  		true)
>>  
>>  static __always_inline bool regs_irqs_disabled(const struct pt_regs *regs)
> 

Cheers
Vladimir

