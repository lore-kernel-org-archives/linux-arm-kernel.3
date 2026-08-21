Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5CBCC5DF89
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 10:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g7Ag3f/lB2XNWTlVN35HrurwX7fpT/KF8zKBG133ajE=; b=FjNYR3NxiMQxULk8Gh3f2DpTik
	VPNJpEerxvsCUC4hnuK6PwWr9ZjxRc145HG/08ObcZtDNQyF8jKR7mnn12FqyYliasKHRh59tWDMx
	sAn83XWysAi1dQ9/S4P342625FLZKbAwwIpeo8rykvNaWZzGWNNVMtTfcK7R2Vk6CBMMoNRsJEdnC
	+w+63iz1/znZ76OrZ8gFtX+ZXQdqJM7sU+Bx6pgAsuMr4HsltQYhyxOwZzbHEtIsWWWq8yc7h3jE9
	q2sj/jBxb7DWdnvnp7S8CS38qT1AwNVeRkCFWt81sqLHlVIsrEyaYxNaOu9jglWFXSX6o1kgyXtAN
	dEpPu3/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxMq0-0000000D7OH-2RoX;
	Fri, 21 Aug 2026 10:51:04 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxMpy-0000000D7Nm-0wFx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 10:51:03 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 75370153B;
	Fri, 21 Aug 2026 03:50:57 -0700 (PDT)
Received: from [10.57.68.59] (unknown [10.57.68.59])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CB4CB3F66F;
	Fri, 21 Aug 2026 03:50:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787309461; bh=ujaPpWhw7P5SdZ0RwuNm60RH8ZxwweX7L99YE79nac4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jGpeA/XjrDUUHgj+HytkADnb50ZAQTL1VeKeCPHWbGtJZbPpmGlk9TuQyzknOHIUa
	 qPjWahFzGGBXLWCHZZCXlnVfpPi9tuMKSTiyZ3ODM5y4DV3Ju7mUg+/c9/CPuNonmA
	 6jDUzA7EgYpMyq8d+T4Ix7mUr1GWfD0IzJtymk+I=
Message-ID: <a94c8d26-9f54-4df4-98bc-8e7272102a87@arm.com>
Date: Fri, 21 Aug 2026 11:50:53 +0100
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
 <174d12f9-2404-4c21-951f-0666adaa3f4a@arm.com>
 <fea87282-737c-47d3-a40f-e71c7b3228e0@huawei.com>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <fea87282-737c-47d3-a40f-e71c7b3228e0@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_035102_337434_0E57B3D9 
X-CRM114-Status: GOOD (  24.19  )
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

On 8/11/26 09:46, Jinjie Ruan wrote:
> 
> 在 2026/8/11 16:37, Vladimir Murzin 写道:
>> On 8/11/26 09:13, Jinjie Ruan wrote:
>>> 在 2026/8/3 20:21, Vladimir Murzin 写道:
>>>> On 7/28/26 10:18, Jinjie Ruan wrote:
>>>>> 在 2026/7/28 0:34, Vladimir Murzin 写道:
>>>>>> From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
>>>>>>
>>>>>> The entry code handles interrupt masking differently from the rest of
>>>>>> the kernel. Exception handlers enter and exit with all exceptions
>>>>>> masked, but they must temporarily unmask the appropriate set of
>>>>>> exceptions so that the rest of the handler executes with the expected
>>>>>> exception state.
>>>>>>
>>>>>> For EL0 handlers, this means dropping to masking context appropriate
>>>>>> for the work to be performed. For EL1 handlers, this means restoring
>>>>>> the masking context of the interrupted task. In both cases, all
>>>>>> exceptions must be masked again before returning from the exception
>>>>>> handler.
>>>>>>
>>>>>> The rest of the kernel typically follows the opposite pattern: it
>>>>>> raises the masking context to protect a critical section and later
>>>>>> restores the previous context.
>>>>>>
>>>>>> Given these different usage patterns, introduce a dedicated set of
>>>>>> exception masking helpers for the entry code. Keeping these helpers
>>>>>> separate from the generic interrupt masking APIs makes the intended
>>>>>> usage explicit and helps avoid mixing the two masking models.
>>>>>>
>>>>>> Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
>>>>>> Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
>>>>>> ---
>>>>>>  arch/arm64/include/asm/interrupts/entry.h | 113 ++++++++++++++++++++++
>>>>>>  1 file changed, 113 insertions(+)
>>>>>>  create mode 100644 arch/arm64/include/asm/interrupts/entry.h
>>>>>>
>>>>>> diff --git a/arch/arm64/include/asm/interrupts/entry.h b/arch/arm64/include/asm/interrupts/entry.h
>>>>>> new file mode 100644
>>>>>> index 000000000000..d66eb5d633f0
>>>>>> --- /dev/null
>>>>>> +++ b/arch/arm64/include/asm/interrupts/entry.h
>>>>>> @@ -0,0 +1,113 @@
>>>>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>>>>> +/*
>>>>>> + * Copyright (C) 2025 Arm Ltd.
>>>>>> + */
>>>>>> +#ifndef __ASM_INTERRUPTS_ENTRY_H
>>>>>> +#define __ASM_INTERRUPTS_ENTRY_H
>>>>>> +
>>>>>> +#include <asm/arch_gicv3.h>
>>>>>> +#include <asm/bug.h>
>>>>>> +#include <asm/cpufeature.h>
>>>>>> +#include <asm/interrupts/common_flags.h>
>>>>>> +
>>>>>> +
>>>>>> +static __always_inline
>>>>>> +arm64_exc_hwstate_t __arm64_switch_exc_hwstate_to(arm64_exc_hwstate_t prev,
>>>>>> +						  arm64_exc_hwstate_t next)
>>>>>> +{
>>>>>> +	bool irqs_disabled = arch_irqs_disabled_flags(next.flags);
>>>>>> +	bool force;
>>>>>> +
>>>>>> +	arm64_debug_exc_hwstate(prev);
>>>>>> +
>>>>>> +	if (prev.flags == next.flags)
>>>>>> +		return next;
>>>>>> +
>>>>>> +	if (!irqs_disabled)
>>>>>> +		trace_hardirqs_on();
>>>>>> +
>>>>>> +	force = system_uses_irq_prio_masking() && prev.pmr != next.pmr;
>>>>>> +
>>>>>> +	__arm64_update_exc_hwstate(next, force);
>>>>>> +
>>>>>> +	if (irqs_disabled)
>>>>>> +		trace_hardirqs_off();
>>>>>> +
>>>>>> +	return next;
>>>>>> +}
>>>>>> +
>>>>>> +static __always_inline
>>>>>> +arm64_exc_hwstate_t arm64_inherit_exc_context(struct pt_regs *regs)
>>>>>> +{
>>>>>> +	arm64_exc_hwstate_t prev = arm64_exc_hwstate_of_context(CRITICAL_CONTEXT);
>>>>>> +	arm64_exc_hwstate_t next = arm64_inherit_exc_hwstate(regs);
>>>>>> +
>>>>>> +	return __arm64_switch_exc_hwstate_to(prev, next);
>>>>>> +}
>>>>>> +
>>>>>> +static __always_inline
>>>>>> +arm64_exc_hwstate_t arm64_drop_exc_context(arm64_exc_hwstate_t prev, arm64_exc_context_t context)
>>>>>> +{
>>>>>> +	arm64_exc_hwstate_t next = arm64_exc_hwstate_of_context(context);
>>>>>> +
>>>>>> +	if (IS_ENABLED(CONFIG_DEBUG_IRQFLAGS)) {
>>>>>> +		bool pnmi = system_uses_irq_prio_masking();
>>>>>> +
>>>>>> +		WARN_ON_ONCE(context > ERROR_CONTEXT &&
>>>>>> +			     prev.daif == DAIF_ERRCTX);
>>>>>> +
>>>>>> +		WARN_ON_ONCE(context > NONMI_CONTEXT &&
>>>>>> +			     prev.daif == DAIF_PROCCTX_NOIRQ);
>>>>> For daif, we can directly compare next and prev because, as the context
>>>>> drops, the value of daif decreases.
>>>>>
>>>>> This is also the opposite of the meanings of "drop" and "lift" in the
>>>>> function names, which is easy to understand.
>>>>>
>>>>> WARN_ON_ONCE(prev.daif < next.daif);
>>>> That's a very good point! I was too focused on checking the hardware
>>>> state against the logical exception context, so I missed that we could
>>>> perform the checks using the hardware state alone.
>>>>
>>>> What do you think about:
>>>>
>>>>         if (IS_ENABLED(CONFIG_DEBUG_IRQFLAGS)) {
>>>>                 WARN_ON_ONCE(prev.daif < next.daif);
>>>>
>>>>                 if (prev.daif == next.daif) {
>>>>                         /*
>>>>                          * GIC_PRIO_IRQON is larger that GIC_PRIO_IRQOFF so larger PMR value is weaker
>>>>                          */
>>>>                         WARN_ON_ONCE(system_uses_irq_prio_masking() && prev.pmr > next.pmr);
>>>>                         WARN_ON_ONCE(system_uses_nmi() && prev.allint < next.allint);
>> Hi Jinjie,
>>
>>> Hi Vladimir,
>>>
>>> I have come up with what I think is a more comprehensible debugging method.
>>>
>>> Could we define a function that is the reverse of
>>> arm64_exc_hwstate_of_context(), such that we can derive the previous
>>> context from the previous hardware state? That would allow us to
>>> directly compare below enum types, making the logic significantly easier
>>> to follow. Any thoughts?
>>>
>> I used to have such reverse mapping in my internal version and feedback I
>> got off-list is to avoid that at all cost. Since I needed it only for debug
>> I open-coded checks in relevant functions (and that the reason I was focused
>> on logical exception context rather than using hardware state alone).
> I believe it would be cleaner to define and use this only when
> CONFIG_DEBUG_IRQFLAGS is enabled; this would not introduce any overhead
> in production kernels, correct?
> 

It is not about overhead - there is no use of such helpers
outside of debug code anyway. Reverse mapping, in general,
comes with a few complications:

- For DAIF-only, NMI and IRQ contexts are represented by the same
  hardware state, so special handling would be required. Using
  hardware state for the DAIF-only case and logical context for
  NMI cases would be unlikely to be acceptable, since it would
  not be uniform.

- We might encounter cases where the hardware state temporarily
  cannot be directly mapped to a logical context. I do not know
  if we have such cases right now, but that would need to be
  somehow handled by helpers performing reverse mapping.

- Lastly, such a facility has already been deemed undesirable
  once, so I would rather not reintroduce it.

IMO, performing checks using the hardware state alone is a good
compromise between clarity and functionality.

Thanks
Vladimir


