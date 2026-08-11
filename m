Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD935C5CFDB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 08:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZNGnpRfNuzAnXwltV1H5U9YVA/VDc10HTld+BTPtBYs=; b=2ZKYihqwpaSHIcsGg4DyXc+/Oh
	91pSMbkahgo/zDvfMV7W/te0pEygYQ0Wty3uDLoGrAaH44b1lMDwaEPLawvtPEeWVfIu0HPA7iNTD
	vRfoK34ud0ESCvSaaGsLTjd3vz/+nbW9WPsrIJ729gNmRxvZcMZq/z2E0OuU7mHCoKYOn0NHb8JCy
	6MBZG7s4IipWP1uvnFG1DyUmnjO2TKmZ7Y1NTVcBEIcgEyRNJFnVSh7+PzvxLO7mCx7YO3MDbIsEa
	v88bdwSSK6KubmLxfqSVJPgbkRr0ulfGZnePgUbapPxxUsOnfDkNLz13S+wZDzGH5iCDjUDkIpeL7
	FoN2bZBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wthzZ-0000000Dcsz-1XX3;
	Tue, 11 Aug 2026 08:37:49 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wthzX-0000000Dcsc-0o0x
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 08:37:48 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1312C1516;
	Tue, 11 Aug 2026 01:37:42 -0700 (PDT)
Received: from [10.57.68.120] (unknown [10.57.68.120])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5B06F3F673;
	Tue, 11 Aug 2026 01:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786437466; bh=jvq0CrlYAD6BR2fcMTjGy0xnKP7COhkot2EtSEbI5Ik=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PIDb1muuP8H7Ie9Lru5Bn5qsqchF2D6fFUoidQH1NZc6eUDV79gZ5FaQ5oazTQ2pt
	 x183HArmsERoWHsVYzEWbyXdhnO7J9mriBSNWqabnu/Dh/t84sRqLBKU3TYULnjSWO
	 WKg2/z74OrCU2emFq3KjsikqcWC5ZmPZRzUV0eUg=
Message-ID: <174d12f9-2404-4c21-951f-0666adaa3f4a@arm.com>
Date: Tue, 11 Aug 2026 09:37:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 14/45] arm64: entry: Introduce entry specific
 exception masking helpers
To: Jinjie Ruan <ruanjinjie@huawei.com>, linux-arm-kernel@lists.infradead.org
Cc: mark.rutland@arm.com, maz@kernel.org, will@kernel.org,
 catalin.marinas@arm.com, liaochang1@huawei.com
References: <20260727163453.7969-1-vladimir.murzin@arm.com>
 <20260727163453.7969-15-vladimir.murzin@arm.com>
 <349f178a-9eba-4353-96ab-91fd50ce87da@huawei.com>
 <6b0a4c25-6e5a-4ff9-b87a-1d12636df08c@arm.com>
 <e228c980-9e08-46be-9760-1586c3f3fa9e@huawei.com>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <e228c980-9e08-46be-9760-1586c3f3fa9e@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_013747_611800_C500FB37 
X-CRM114-Status: GOOD (  26.08  )
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

On 8/11/26 09:13, Jinjie Ruan wrote:
> 
> 在 2026/8/3 20:21, Vladimir Murzin 写道:
>> On 7/28/26 10:18, Jinjie Ruan wrote:
>>> 在 2026/7/28 0:34, Vladimir Murzin 写道:
>>>> From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
>>>>
>>>> The entry code handles interrupt masking differently from the rest of
>>>> the kernel. Exception handlers enter and exit with all exceptions
>>>> masked, but they must temporarily unmask the appropriate set of
>>>> exceptions so that the rest of the handler executes with the expected
>>>> exception state.
>>>>
>>>> For EL0 handlers, this means dropping to masking context appropriate
>>>> for the work to be performed. For EL1 handlers, this means restoring
>>>> the masking context of the interrupted task. In both cases, all
>>>> exceptions must be masked again before returning from the exception
>>>> handler.
>>>>
>>>> The rest of the kernel typically follows the opposite pattern: it
>>>> raises the masking context to protect a critical section and later
>>>> restores the previous context.
>>>>
>>>> Given these different usage patterns, introduce a dedicated set of
>>>> exception masking helpers for the entry code. Keeping these helpers
>>>> separate from the generic interrupt masking APIs makes the intended
>>>> usage explicit and helps avoid mixing the two masking models.
>>>>
>>>> Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
>>>> Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
>>>> ---
>>>>  arch/arm64/include/asm/interrupts/entry.h | 113 ++++++++++++++++++++++
>>>>  1 file changed, 113 insertions(+)
>>>>  create mode 100644 arch/arm64/include/asm/interrupts/entry.h
>>>>
>>>> diff --git a/arch/arm64/include/asm/interrupts/entry.h b/arch/arm64/include/asm/interrupts/entry.h
>>>> new file mode 100644
>>>> index 000000000000..d66eb5d633f0
>>>> --- /dev/null
>>>> +++ b/arch/arm64/include/asm/interrupts/entry.h
>>>> @@ -0,0 +1,113 @@
>>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>>> +/*
>>>> + * Copyright (C) 2025 Arm Ltd.
>>>> + */
>>>> +#ifndef __ASM_INTERRUPTS_ENTRY_H
>>>> +#define __ASM_INTERRUPTS_ENTRY_H
>>>> +
>>>> +#include <asm/arch_gicv3.h>
>>>> +#include <asm/bug.h>
>>>> +#include <asm/cpufeature.h>
>>>> +#include <asm/interrupts/common_flags.h>
>>>> +
>>>> +
>>>> +static __always_inline
>>>> +arm64_exc_hwstate_t __arm64_switch_exc_hwstate_to(arm64_exc_hwstate_t prev,
>>>> +						  arm64_exc_hwstate_t next)
>>>> +{
>>>> +	bool irqs_disabled = arch_irqs_disabled_flags(next.flags);
>>>> +	bool force;
>>>> +
>>>> +	arm64_debug_exc_hwstate(prev);
>>>> +
>>>> +	if (prev.flags == next.flags)
>>>> +		return next;
>>>> +
>>>> +	if (!irqs_disabled)
>>>> +		trace_hardirqs_on();
>>>> +
>>>> +	force = system_uses_irq_prio_masking() && prev.pmr != next.pmr;
>>>> +
>>>> +	__arm64_update_exc_hwstate(next, force);
>>>> +
>>>> +	if (irqs_disabled)
>>>> +		trace_hardirqs_off();
>>>> +
>>>> +	return next;
>>>> +}
>>>> +
>>>> +static __always_inline
>>>> +arm64_exc_hwstate_t arm64_inherit_exc_context(struct pt_regs *regs)
>>>> +{
>>>> +	arm64_exc_hwstate_t prev = arm64_exc_hwstate_of_context(CRITICAL_CONTEXT);
>>>> +	arm64_exc_hwstate_t next = arm64_inherit_exc_hwstate(regs);
>>>> +
>>>> +	return __arm64_switch_exc_hwstate_to(prev, next);
>>>> +}
>>>> +
>>>> +static __always_inline
>>>> +arm64_exc_hwstate_t arm64_drop_exc_context(arm64_exc_hwstate_t prev, arm64_exc_context_t context)
>>>> +{
>>>> +	arm64_exc_hwstate_t next = arm64_exc_hwstate_of_context(context);
>>>> +
>>>> +	if (IS_ENABLED(CONFIG_DEBUG_IRQFLAGS)) {
>>>> +		bool pnmi = system_uses_irq_prio_masking();
>>>> +
>>>> +		WARN_ON_ONCE(context > ERROR_CONTEXT &&
>>>> +			     prev.daif == DAIF_ERRCTX);
>>>> +
>>>> +		WARN_ON_ONCE(context > NONMI_CONTEXT &&
>>>> +			     prev.daif == DAIF_PROCCTX_NOIRQ);
>>> For daif, we can directly compare next and prev because, as the context
>>> drops, the value of daif decreases.
>>>
>>> This is also the opposite of the meanings of "drop" and "lift" in the
>>> function names, which is easy to understand.
>>>
>>> WARN_ON_ONCE(prev.daif < next.daif);
>> That's a very good point! I was too focused on checking the hardware
>> state against the logical exception context, so I missed that we could
>> perform the checks using the hardware state alone.
>>
>> What do you think about:
>>
>>         if (IS_ENABLED(CONFIG_DEBUG_IRQFLAGS)) {
>>                 WARN_ON_ONCE(prev.daif < next.daif);
>>
>>                 if (prev.daif == next.daif) {
>>                         /*
>>                          * GIC_PRIO_IRQON is larger that GIC_PRIO_IRQOFF so larger PMR value is weaker
>>                          */
>>                         WARN_ON_ONCE(system_uses_irq_prio_masking() && prev.pmr > next.pmr);
>>                         WARN_ON_ONCE(system_uses_nmi() && prev.allint < next.allint);

Hi Jinjie,

> Hi Vladimir,
> 
> I have come up with what I think is a more comprehensible debugging method.
> 
> Could we define a function that is the reverse of
> arm64_exc_hwstate_of_context(), such that we can derive the previous
> context from the previous hardware state? That would allow us to
> directly compare below enum types, making the logic significantly easier
> to follow. Any thoughts?
> 

I used to have such reverse mapping in my internal version and feedback I
got off-list is to avoid that at all cost. Since I needed it only for debug
I open-coded checks in relevant functions (and that the reason I was focused
on logical exception context rather than using hardware state alone).

Cheers
Vladimir

> This way, we don't even need to distinguish between pseudo-NMI and FEAT_NMI.
> 
> +typedef enum arm64_exc_context {
> +	PROCESS_CONTEXT,
> +	NOIRQ_CONTEXT,
> +	NONMI_CONTEXT,
> +	ERROR_CONTEXT,
> +	CRITICAL_CONTEXT,
> +} arm64_exc_context_t;
> 
> Best regards,
> Jinjie
> 
>>                 }
>>         }
>>
>>>> +
>>>> +		WARN_ON_ONCE(context > NOIRQ_CONTEXT &&
>>>> +			     pnmi && prev.pmr == GIC_PRIO_IRQOFF);
>>>> +
>>>> +		WARN_ON_ONCE(context > PROCESS_CONTEXT &&
>>>> +			     ((pnmi && prev.daif == DAIF_PROCCTX && prev.pmr == GIC_PRIO_IRQON) ||
>>>> +			      (!pnmi && prev.daif == DAIF_PROCCTX)));
>>>> +	}
>>>> +
>>>> +	return __arm64_switch_exc_hwstate_to(prev, next);
>>>> +}
>>>> +
>>>> +static __always_inline
>>>> +arm64_exc_hwstate_t arm64_lift_exc_context(arm64_exc_hwstate_t prev, arm64_exc_context_t context)
>>>> +{
>>>> +	arm64_exc_hwstate_t next = arm64_exc_hwstate_of_context(context);
>>>> +
>>>> +	if (IS_ENABLED(CONFIG_DEBUG_IRQFLAGS)) {
>>>> +		bool pnmi = system_uses_irq_prio_masking();
>>>> +
>>>> +		WARN_ON_ONCE(context < CRITICAL_CONTEXT &&
>>>> +			     prev.daif == DAIF_MASK);
>>>> +
>>>> +		WARN_ON_ONCE(context < ERROR_CONTEXT &&
>>>> +			     prev.daif == DAIF_ERRCTX);
>>> WARN_ON_ONCE(prev.daif > next.daif);
>>>
>> ... and
>>
>>         if (IS_ENABLED(CONFIG_DEBUG_IRQFLAGS)) {
>>                 WARN_ON_ONCE(prev.daif > next.daif);
>>
>>                 if (prev.daif == next.daif) {
>>                         /*
>>                          * GIC_PRIO_IRQON is larger that GIC_PRIO_IRQOFF so smaller PMR value is stronger
>>                          */
>>                         WARN_ON_ONCE(system_uses_irq_prio_masking() && prev.pmr < next.pmr);
>>                         WARN_ON_ONCE(system_uses_nmi() && prev.allint > next.allint);
>>                 }
>>         }
>>
>>
>> Cheers
>> Vladimir
>>
>>>> +
>>>> +		WARN_ON_ONCE(context < NONMI_CONTEXT &&
>>>> +			     pnmi && prev.daif == DAIF_PROCCTX_NOIRQ);
>>>> +
>>>> +		WARN_ON_ONCE(context < NOIRQ_CONTEXT &&
>>>> +			     ((pnmi && prev.pmr == GIC_PRIO_IRQOFF) ||
>>>> +			      (!pnmi && prev.daif == DAIF_PROCCTX_NOIRQ)));
>>>> +	}
>>>> +
>>>> +	return __arm64_switch_exc_hwstate_to(prev, next);
>>>> +}
>>>> +
>>>> +
>>>> +static __always_inline
>>>> +arm64_exc_hwstate_t arm64_unmask_exc_context(arm64_exc_context_t context)
>>>> +{
>>>> +	arm64_exc_hwstate_t prev = arm64_exc_hwstate_of_context(CRITICAL_CONTEXT);
>>>> +
>>>> +	return arm64_drop_exc_context(prev, context);
>>>> +}
>>>> +
>>>> +static __always_inline
>>>> +arm64_exc_hwstate_t arm64_mask_exc_context(arm64_exc_hwstate_t prev)
>>>> +{
>>>> +	return arm64_lift_exc_context(prev, CRITICAL_CONTEXT);
>>>> +}
>>>> +
>>>> +#endif /* __ASM_INTERRUPTS_ENTRY_H */
>>


