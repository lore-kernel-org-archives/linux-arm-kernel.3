Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01C36C5DF87
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 10:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hn0VpViHSUXbo0OAPhJ/l6JlVHnXlmlNBFKMqUtXlxI=; b=qgSQ6spzVymww0Y+GEZ+PGBirm
	Ubz5miWTctIHiuDPOOoCi0J6VYqWNllrBctzlyy8ggKZquq1MEZ72AyAW5Q2MKexOC7ZUwIBxFbvy
	anwH+ArGOwwU+CljVkqPEG/+LqnQkiAv9MUmS44HE9Cd4OblV8UryNV2r/BbqhR2/WxXzAqKT0CPj
	y6exySAXmTcDvgVKem1h66HhkKlHoz1MEHAPMV2T25HrYEtSlRgaCP/c/m+xlVZk5ZJvhTYdBKat4
	JjQETB4fQDbiWKfGqW15YCWoUd+ReHKYnOG8qxzYxaghh6g4931pjo4HSluH3x9Q2kkbUd81/42vp
	eeL7wT9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxMTm-0000000D5kX-3hl6;
	Fri, 21 Aug 2026 10:28:06 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxMTj-0000000D5kB-3Osy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 10:28:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E791A153B;
	Fri, 21 Aug 2026 03:27:58 -0700 (PDT)
Received: from [10.57.68.59] (unknown [10.57.68.59])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 68AD73F66F;
	Fri, 21 Aug 2026 03:28:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787308082; bh=n62r1vVURYSYUJA2KTrPsVIHbY3/AStUVQ5HdQuNlHo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=R+Is0Cj+buE9teZSWiADaI2uxbW62vVg5Et+0iYMsi9ugOGouK+4MQPpo3OaiR0tq
	 lUoo2Fbz6gCyU5oTKbv9CZJYghBAhWYtC8ih7XYiS37HZRbGQ0kMXWfGqEue0VYsiw
	 Q82turrlUzZRZVSQZ+XhWZqheBwm31Yw4gWHI6rM=
Message-ID: <c0a3f909-5680-4edc-958e-3bc50916a21d@arm.com>
Date: Fri, 21 Aug 2026 11:27:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 19/45] arm64: cpuidle: use new helpers to bypass
 interrupt priority masking
To: Jinjie Ruan <ruanjinjie@huawei.com>, linux-arm-kernel@lists.infradead.org
Cc: mark.rutland@arm.com, maz@kernel.org, will@kernel.org,
 catalin.marinas@arm.com, liaochang1@huawei.com
References: <20260727163453.7969-1-vladimir.murzin@arm.com>
 <20260727163453.7969-20-vladimir.murzin@arm.com>
 <39b86a06-291f-46b3-8bef-4c0835b9a8bd@huawei.com>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <39b86a06-291f-46b3-8bef-4c0835b9a8bd@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_032803_955548_6DC45867 
X-CRM114-Status: GOOD (  23.71  )
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

On 8/11/26 09:59, Jinjie Ruan wrote:
> 
> 在 2026/7/28 0:34, Vladimir Murzin 写道:
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
>>  arch/arm64/include/asm/cpuidle.h            | 18 ++----
>>  arch/arm64/include/asm/interrupts/masking.h | 61 +++++++++++++++++++++
>>  2 files changed, 65 insertions(+), 14 deletions(-)
>>
>> diff --git a/arch/arm64/include/asm/cpuidle.h b/arch/arm64/include/asm/cpuidle.h
>> index 2047713e097d..b70ef5fd5e57 100644
>> --- a/arch/arm64/include/asm/cpuidle.h
>> +++ b/arch/arm64/include/asm/cpuidle.h
>> @@ -5,32 +5,22 @@
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
>> -		if (system_uses_irq_prio_masking()) {			\
>> -			c->daif_bits = read_sysreg(daif);		\
>> -			write_sysreg(c->daif_bits | PSR_I_BIT | PSR_F_BIT, \
>> -				     daif);				\
>> -			c->pmr = gic_read_pmr();			\
>> -			gic_write_pmr(GIC_PRIO_IRQON | GIC_PRIO_PSR_I_SET); \
>> -		}							\
>> +		c->arm64_context = local_exceptions_force_daif_save(); 	\
>>  	} while (0)
>>  
>>  #define arm_cpuidle_restore_irq_context(__c)				\
>>  	do {								\
>>  		struct arm_cpuidle_irq_context *c = __c;		\
>> -		if (system_uses_irq_prio_masking()) {			\
>> -			gic_write_pmr(c->pmr);				\
>> -			write_sysreg(c->daif_bits, daif);		\
>> -		}							\
>> +		local_exceptions_force_daif_restore(c->arm64_context);	\
>>  	} while (0)
>>  #else
>>  struct arm_cpuidle_irq_context { };
>> diff --git a/arch/arm64/include/asm/interrupts/masking.h b/arch/arm64/include/asm/interrupts/masking.h
>> index 193089fda252..e13852442062 100644
>> --- a/arch/arm64/include/asm/interrupts/masking.h
>> +++ b/arch/arm64/include/asm/interrupts/masking.h
>> @@ -89,6 +89,67 @@ static inline void local_exceptions_final_mask(void)
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
>> +static inline arm64_exc_hwstates_t local_exceptions_force_daif_save(void)
>> +{
>> +	arm64_exc_hwstates_t states = {};
>> +
>> +	if (!system_uses_irq_prio_masking())
>> +		return states;
>> +
>> +	/*
>> +	 * Cannot use lockdep_assert here as idle entry enables hardirqs
>> +	 * while keeping interrupts masked.
>> +	 */
>> +	WARN_ON_ONCE(!irqs_disabled());
>> +
>> +	states.saved.daif = read_sysreg(daif);
>> +	states.saved.pmr = read_sysreg_s(SYS_ICC_PMR_EL1);
> I'd suggest using gic_read_pmr() as it aligns better with the original
> implementation.
> 

IIUC, the reason gic_read_pmr() exists is to be used in code shared between
arm64 and arm32. Since we are entirely in arm64, IMO, we better use sysreg
directly.

>> +	/*
>> +	 * We might have IF set or unset. In case IF already set orring with IF
>> +	 * won't change anything, combined with PMR set to IRQON we might become
>> +	 * one of contexts: CRITICAL, ERROR or NONMI. In case IF is unset (which
>> +	 * also implies that DA is unset) orring with IF and combining with PMR
>> +	 * set to IRQON would effectively gives us NONMI context.
>> +	 */
> The comment seems redundant to me, because __arm64_update_exc_hwstate()
> only needs the hwstate parameter and has no dependency on the context type.
> 

Ok. I'll drop it in the next version.

> Otherwise, LGTM
> Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>
> 

Cheers
Vladimir


