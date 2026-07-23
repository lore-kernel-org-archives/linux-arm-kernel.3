Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4383C531C7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 09:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eSvH81kWBhywTBl7olyMhEUCt2uv+QQ8S7xF5dfOa3c=; b=pv+ZQt/bKNKGo5
	DKwQDYduQC0O6cKD8Uc/HPQlsyQHWWXE0sDv927DhqrWAHAiORtwIY8ZDvsbsPQ5GEGhXCrKL5XPR
	FxX4b2mmnuEtufyEWfM9G5/UUuRq8s/U0vZoNpIwIrlLHc/pdEWQ0+++evAHo2+j844ryggOYWUXD
	x+7bCLBC0sLgA/8lhFvDePGzmDh77CzgK39xm3hGDIWdtZTPuxSsXaIso1PxUZSeyFyE5mLa0MAxZ
	U0fNRW4wAXiPzBVvob/1qCYhXWVpn9bsGE1V1XmTVaCYTHkcTasDkNonsPYrDqR7UGCqMlSykrrjU
	eeiIrolPadx8M4y+6KIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmqBR-0000000Dxdi-189Z;
	Thu, 23 Jul 2026 09:57:41 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmqBP-0000000Dxct-0Enr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 09:57:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BAA391595;
	Thu, 23 Jul 2026 02:57:33 -0700 (PDT)
Received: from [10.1.34.163] (e121487-lin.cambridge.arm.com [10.1.34.163])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A95343F66F;
	Thu, 23 Jul 2026 02:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784800657; bh=zAwgiOaG95AkQcLsWPDdQMK0O3G33wktNg4T+8Zt1ec=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MzwatQvNsy2GcjPT2GnCWb7ze87PjPhuPY3kX4ilIs7utgUHl9u/gnnAWjkIIeZ8c
	 oVhlfkNcqC3RWIjEbOHnekKUrhejMobyra3+OlUx1V+tTHos4bs9YNQBcTjv3gJvsZ
	 ZeSVSZHT2PW8B94PsrmecrBGHi1UilVWj7o5GYEQ=
Message-ID: <f8ef76be-67f4-48bb-aa97-96ea78ff7bc5@arm.com>
Date: Thu, 23 Jul 2026 10:57:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 16/36] arm64: cpuidle: use new helpers to bypass
 interrupt priority masking
To: Jinjie Ruan <ruanjinjie@huawei.com>, linux-arm-kernel@lists.infradead.org
References: <20260709121333.23507-1-vladimir.murzin@arm.com>
 <20260709121333.23507-17-vladimir.murzin@arm.com>
 <a8e3e9da-feca-4876-84f7-ddbb1e3d34c8@huawei.com>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <a8e3e9da-feca-4876-84f7-ddbb1e3d34c8@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_025739_183743_309C8162 
X-CRM114-Status: GOOD (  24.72  )
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

On 7/22/26 09:38, Jinjie Ruan wrote:
> 
> On 7/9/2026 8:13 PM, Vladimir Murzin wrote:
>> From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
>>
>> When the CPU goes into WFI and pseudo-NMIs are in use, we need to make
>> sure that interrupts are not masked by the PMR otherwise they would not
>> reach the CPU and wake it up.
>>
>> Now that we have a proper API that handles both DAIF and PMR, extend it
>> to provide helpers allowing to temporarily switch to masking interrupts
>> via DAIF only when interrupt priorities are in use.
>> This could allow other parts of the code to make use of it and makes it
>> easier to check for proper use.
>>
>> Replace the custom cpuidle helper with those new helpers.
>>
>> Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
>> Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
>> ---
>>  arch/arm64/include/asm/cpuidle.h            | 14 ++---
>>  arch/arm64/include/asm/interrupts/masking.h | 58 +++++++++++++++++++++
>>  2 files changed, 62 insertions(+), 10 deletions(-)
>>
>> diff --git a/arch/arm64/include/asm/cpuidle.h b/arch/arm64/include/asm/cpuidle.h
>> index 2047713e097d..0c7ccdaf1832 100644
>> --- a/arch/arm64/include/asm/cpuidle.h
>> +++ b/arch/arm64/include/asm/cpuidle.h
>> @@ -5,22 +5,17 @@
>>  #include <asm/proc-fns.h>
>>  
>>  #ifdef CONFIG_ARM64_PSEUDO_NMI
>> -#include <asm/arch_gicv3.h>
>> +#include <asm/interrupts/masking.h>
>>  
>>  struct arm_cpuidle_irq_context {
>> -	unsigned long pmr;
>> -	unsigned long daif_bits;
>> +	arm64_exc_hwstates_t arm64_context;
>>  };
>>  
>>  #define arm_cpuidle_save_irq_context(__c)				\
>>  	do {								\
>>  		struct arm_cpuidle_irq_context *c = __c;		\
>>  		if (system_uses_irq_prio_masking()) {			\
>> -			c->daif_bits = read_sysreg(daif);		\
>> -			write_sysreg(c->daif_bits | PSR_I_BIT | PSR_F_BIT, \
>> -				     daif);				\
>> -			c->pmr = gic_read_pmr();			\
>> -			gic_write_pmr(GIC_PRIO_IRQON | GIC_PRIO_PSR_I_SET); \
>> +			c->arm64_context = local_all_irqs_force_daif_save(); \
>>  		}							\
>>  	} while (0)
>>  
>> @@ -28,8 +23,7 @@ struct arm_cpuidle_irq_context {
>>  	do {								\
>>  		struct arm_cpuidle_irq_context *c = __c;		\
>>  		if (system_uses_irq_prio_masking()) {			\
>> -			gic_write_pmr(c->pmr);				\
>> -			write_sysreg(c->daif_bits, daif);		\
>> +			local_all_irqs_force_daif_restore(c->arm64_context); \
>>  		}							\
>>  	} while (0)
>>  #else
>> diff --git a/arch/arm64/include/asm/interrupts/masking.h b/arch/arm64/include/asm/interrupts/masking.h
>> index 19d32618b2b9..9dc37a571094 100644
>> --- a/arch/arm64/include/asm/interrupts/masking.h
>> +++ b/arch/arm64/include/asm/interrupts/masking.h
>> @@ -99,6 +99,64 @@ static inline void local_all_irqs_final_mask(void)
>>  }
>>  #endif /* CONFIG_DEBUG_IRQFLAGS */
>>  
>> +/*
>> + * In some cases, WFI or guest entry for example, we always want interrupts
>> + * to reach the CPU even if masked. Masking via the PMR prevents them from
>> + * reaching the CPU and waking it up.
>> + * Force IRQ masking using DAIF by raising the priority mask
>> + * and setting the IF flags.
>> + *
>> + * Should only be called when IRQs are already masked.
>> + */
>> +static inline arm64_exc_hwstates_t local_all_irqs_force_daif_save(void)
>> +{
>> +	arm64_exc_hwstates_t states = {};
>> +	/*
>> +	 * Cannot use lockdep_assert here as idle entry enables hardirqs
>> +	 * while keeping interrupts masked.
>> +	 */
>> +	WARN_ON_ONCE(!irqs_disabled());
>> +
>> +	if (system_uses_irq_prio_masking()) {
>> +	        states.saved.daif = read_sysreg(daif);
>> +	        states.saved.pmr = read_sysreg_s(SYS_ICC_PMR_EL1);
>> +		/*
>> +		 * We might have IF set or unset. In case IF already set orring with IF
>> +		 * won't change anything, combined with PMR set to IRQON we might become
>> +		 * one of contexts: CRITICAL, ERROR or NONMI. In case IF is unset (which
>> +		 * also implies that DA is unset) orring with IF and combining with PMR
>> +		 * set to IRQON would effectively gives us NONMI context.
>> +		 */
>> +		states.expected.daif = states.saved.daif | DAIF_PROCCTX_NOIRQ;
>> +		states.expected.pmr = GIC_PRIO_IRQON;
>> +
>> +		arm64_update_exc_hwstate(states.expected, true);
>> +	}
>> +
>> +	return states;
>> +}
>> +
>> +/*
>> + * Return to masking with the PMR, restoring previously saved DAIF and PMR.
>> + *
>> + * IRQs or interrupt priority masking should not have been re-enabled in between
>> + * the save and restore.
>> + */
>> +static inline
>> +void local_all_irqs_force_daif_restore(arm64_exc_hwstates_t states)
>> +{
>> +	/*
>> +	 * Cannot use lockdep_assert here as idle entry enables hardirqs
>> +	 * while keeping interrupts masked.
>> +	 */
>> +	WARN_ON_ONCE(!irqs_disabled());
>> +
>> +	if (system_uses_irq_prio_masking()) {
>> +		arm64_debug_exc_hwstate(states.expected);
>> +		arm64_update_exc_hwstate(states.saved, true);
>> +	}
>> +}
> The newly introduced two helper functions seem to have been used only
> once in the end, and they do not update ALLINT. So, is it necessary to
> introduce these two helpers?
> 

I reckon the general approach is to consolidate hardware exception
state manipulation in a few places and leave it elsewhere only when
strictly necessary.

Cheers
Vladimir

>> +
>>  /*
>>   * During early boot, we unmask PSR.DA before the GIC has been set up.
>>   * If we use IRQ priority masking, the PMR and PSR will be out of sync
> 


