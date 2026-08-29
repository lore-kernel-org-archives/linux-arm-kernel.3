Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 478B9C61DB9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 29 Aug 2026 01:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CsaYto4rPR7UqOZMM0da/LeaRPrrU6t3n0uk+Upn+ho=; b=OfoKyO/7VBudB5G8SUc5EXyh1z
	3PXQHNigUVCloC++lG4SWH5dmEIyExKF2FTpZe2uHpHslqajVV1XOFCf/XONRNfNBqi2NEKs0+/Dm
	Okj5nLEvFqcFWDzYNPGFU7+JwadBEJi1FWR95XLrAEs7Vv88fNmS0bqSanlaErewP4u9T9efNl0Nb
	uRz0MNty3iCVVcpkj9fTB6hd7Sz8albOezWbiVBubxjUCxaJFbKxijg+gB2iKvekDwVEwp88ttqNO
	l+28Mse0Mr6BltAgmAWLpioJTDyttVTtRx5YCdxE1Oeiuzy9XMmruNh4Ifuw7aZLsXYkjjm5wwBHv
	Oy4WLfOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x08Fx-00000006ao9-3KTz;
	Sat, 29 Aug 2026 01:53:17 +0000
Received: from canpmsgout02.his.huawei.com ([113.46.200.217])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x08Fu-00000006amo-2eZy
	for linux-arm-kernel@lists.infradead.org;
	Sat, 29 Aug 2026 01:53:17 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=CsaYto4rPR7UqOZMM0da/LeaRPrrU6t3n0uk+Upn+ho=;
	b=s+PUbgdxxXolcc2aVbuBVJjADpE6a0Ln876RKEK/HJo5OIutduI+M9FkdSeX91rQNs1dc1EwA
	ANo1gBSfcEDy/7loEEWo0j7bP8UdKuLIaZeAO4kYYyKbj/DF63nPyeMefVrwyF4Bgn/D3qKAnqY
	fGZf38TiCtyaJ7mcQ47JqFU=
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4hWyg42WR9zcbMk;
	Sat, 29 Aug 2026 09:42:24 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 1F09B40537;
	Sat, 29 Aug 2026 09:53:02 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Sat, 29 Aug 2026 09:53:01 +0800
Message-ID: <2fb1d9ec-4817-49de-a515-39cf4e4a007e@huawei.com>
Date: Sat, 29 Aug 2026 09:53:00 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 14/45] arm64: entry: Introduce entry specific
 exception masking helpers
To: Vladimir Murzin <vladimir.murzin@arm.com>,
	<linux-arm-kernel@lists.infradead.org>
CC: <mark.rutland@arm.com>, <maz@kernel.org>, <will@kernel.org>,
	<catalin.marinas@arm.com>, <liaochang1@huawei.com>
References: <20260727163453.7969-1-vladimir.murzin@arm.com>
 <20260727163453.7969-15-vladimir.murzin@arm.com>
 <349f178a-9eba-4353-96ab-91fd50ce87da@huawei.com>
 <6b0a4c25-6e5a-4ff9-b87a-1d12636df08c@arm.com>
 <e228c980-9e08-46be-9760-1586c3f3fa9e@huawei.com>
 <174d12f9-2404-4c21-951f-0666adaa3f4a@arm.com>
 <fea87282-737c-47d3-a40f-e71c7b3228e0@huawei.com>
 <a94c8d26-9f54-4df4-98bc-8e7272102a87@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <a94c8d26-9f54-4df4-98bc-8e7272102a87@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_185315_338701_E5FEF92F 
X-CRM114-Status: GOOD (  28.24  )
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



在 2026/8/21 18:50, Vladimir Murzin 写道:
> On 8/11/26 09:46, Jinjie Ruan wrote:
>>
>> 在 2026/8/11 16:37, Vladimir Murzin 写道:
>>> On 8/11/26 09:13, Jinjie Ruan wrote:
>>>> 在 2026/8/3 20:21, Vladimir Murzin 写道:
>>>>> On 7/28/26 10:18, Jinjie Ruan wrote:
>>>>>> 在 2026/7/28 0:34, Vladimir Murzin 写道:
>>>>>>> From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
>>>>>>>
>>>>>>> The entry code handles interrupt masking differently from the rest of
>>>>>>> the kernel. Exception handlers enter and exit with all exceptions
>>>>>>> masked, but they must temporarily unmask the appropriate set of
>>>>>>> exceptions so that the rest of the handler executes with the expected
>>>>>>> exception state.
>>>>>>>
>>>>>>> For EL0 handlers, this means dropping to masking context appropriate
>>>>>>> for the work to be performed. For EL1 handlers, this means restoring
>>>>>>> the masking context of the interrupted task. In both cases, all
>>>>>>> exceptions must be masked again before returning from the exception
>>>>>>> handler.
>>>>>>>
>>>>>>> The rest of the kernel typically follows the opposite pattern: it
>>>>>>> raises the masking context to protect a critical section and later
>>>>>>> restores the previous context.
>>>>>>>
>>>>>>> Given these different usage patterns, introduce a dedicated set of
>>>>>>> exception masking helpers for the entry code. Keeping these helpers
>>>>>>> separate from the generic interrupt masking APIs makes the intended
>>>>>>> usage explicit and helps avoid mixing the two masking models.
>>>>>>>
>>>>>>> Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
>>>>>>> Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
>>>>>>> ---
>>>>>>>  arch/arm64/include/asm/interrupts/entry.h | 113 ++++++++++++++++++++++
>>>>>>>  1 file changed, 113 insertions(+)
>>>>>>>  create mode 100644 arch/arm64/include/asm/interrupts/entry.h
>>>>>>>
>>>>>>> diff --git a/arch/arm64/include/asm/interrupts/entry.h b/arch/arm64/include/asm/interrupts/entry.h
>>>>>>> new file mode 100644
>>>>>>> index 000000000000..d66eb5d633f0
>>>>>>> --- /dev/null
>>>>>>> +++ b/arch/arm64/include/asm/interrupts/entry.h
>>>>>>> @@ -0,0 +1,113 @@
>>>>>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>>>>>> +/*
>>>>>>> + * Copyright (C) 2025 Arm Ltd.
>>>>>>> + */
>>>>>>> +#ifndef __ASM_INTERRUPTS_ENTRY_H
>>>>>>> +#define __ASM_INTERRUPTS_ENTRY_H
>>>>>>> +
>>>>>>> +#include <asm/arch_gicv3.h>
>>>>>>> +#include <asm/bug.h>
>>>>>>> +#include <asm/cpufeature.h>
>>>>>>> +#include <asm/interrupts/common_flags.h>
>>>>>>> +
>>>>>>> +
>>>>>>> +static __always_inline
>>>>>>> +arm64_exc_hwstate_t __arm64_switch_exc_hwstate_to(arm64_exc_hwstate_t prev,
>>>>>>> +						  arm64_exc_hwstate_t next)
>>>>>>> +{
>>>>>>> +	bool irqs_disabled = arch_irqs_disabled_flags(next.flags);
>>>>>>> +	bool force;
>>>>>>> +
>>>>>>> +	arm64_debug_exc_hwstate(prev);
>>>>>>> +
>>>>>>> +	if (prev.flags == next.flags)
>>>>>>> +		return next;
>>>>>>> +
>>>>>>> +	if (!irqs_disabled)
>>>>>>> +		trace_hardirqs_on();
>>>>>>> +
>>>>>>> +	force = system_uses_irq_prio_masking() && prev.pmr != next.pmr;
>>>>>>> +
>>>>>>> +	__arm64_update_exc_hwstate(next, force);
>>>>>>> +
>>>>>>> +	if (irqs_disabled)
>>>>>>> +		trace_hardirqs_off();
>>>>>>> +
>>>>>>> +	return next;
>>>>>>> +}
>>>>>>> +
>>>>>>> +static __always_inline
>>>>>>> +arm64_exc_hwstate_t arm64_inherit_exc_context(struct pt_regs *regs)
>>>>>>> +{
>>>>>>> +	arm64_exc_hwstate_t prev = arm64_exc_hwstate_of_context(CRITICAL_CONTEXT);
>>>>>>> +	arm64_exc_hwstate_t next = arm64_inherit_exc_hwstate(regs);
>>>>>>> +
>>>>>>> +	return __arm64_switch_exc_hwstate_to(prev, next);
>>>>>>> +}
>>>>>>> +
>>>>>>> +static __always_inline
>>>>>>> +arm64_exc_hwstate_t arm64_drop_exc_context(arm64_exc_hwstate_t prev, arm64_exc_context_t context)
>>>>>>> +{
>>>>>>> +	arm64_exc_hwstate_t next = arm64_exc_hwstate_of_context(context);
>>>>>>> +
>>>>>>> +	if (IS_ENABLED(CONFIG_DEBUG_IRQFLAGS)) {
>>>>>>> +		bool pnmi = system_uses_irq_prio_masking();
>>>>>>> +
>>>>>>> +		WARN_ON_ONCE(context > ERROR_CONTEXT &&
>>>>>>> +			     prev.daif == DAIF_ERRCTX);
>>>>>>> +
>>>>>>> +		WARN_ON_ONCE(context > NONMI_CONTEXT &&
>>>>>>> +			     prev.daif == DAIF_PROCCTX_NOIRQ);
>>>>>> For daif, we can directly compare next and prev because, as the context
>>>>>> drops, the value of daif decreases.
>>>>>>
>>>>>> This is also the opposite of the meanings of "drop" and "lift" in the
>>>>>> function names, which is easy to understand.
>>>>>>
>>>>>> WARN_ON_ONCE(prev.daif < next.daif);
>>>>> That's a very good point! I was too focused on checking the hardware
>>>>> state against the logical exception context, so I missed that we could
>>>>> perform the checks using the hardware state alone.
>>>>>
>>>>> What do you think about:
>>>>>
>>>>>         if (IS_ENABLED(CONFIG_DEBUG_IRQFLAGS)) {
>>>>>                 WARN_ON_ONCE(prev.daif < next.daif);
>>>>>
>>>>>                 if (prev.daif == next.daif) {
>>>>>                         /*
>>>>>                          * GIC_PRIO_IRQON is larger that GIC_PRIO_IRQOFF so larger PMR value is weaker
>>>>>                          */
>>>>>                         WARN_ON_ONCE(system_uses_irq_prio_masking() && prev.pmr > next.pmr);
>>>>>                         WARN_ON_ONCE(system_uses_nmi() && prev.allint < next.allint);
>>> Hi Jinjie,
>>>
>>>> Hi Vladimir,
>>>>
>>>> I have come up with what I think is a more comprehensible debugging method.
>>>>
>>>> Could we define a function that is the reverse of
>>>> arm64_exc_hwstate_of_context(), such that we can derive the previous
>>>> context from the previous hardware state? That would allow us to
>>>> directly compare below enum types, making the logic significantly easier
>>>> to follow. Any thoughts?
>>>>
>>> I used to have such reverse mapping in my internal version and feedback I
>>> got off-list is to avoid that at all cost. Since I needed it only for debug
>>> I open-coded checks in relevant functions (and that the reason I was focused
>>> on logical exception context rather than using hardware state alone).
>> I believe it would be cleaner to define and use this only when
>> CONFIG_DEBUG_IRQFLAGS is enabled; this would not introduce any overhead
>> in production kernels, correct?
>>
> 
> It is not about overhead - there is no use of such helpers
> outside of debug code anyway. Reverse mapping, in general,
> comes with a few complications:
> 
> - For DAIF-only, NMI and IRQ contexts are represented by the same
>   hardware state, so special handling would be required. Using

Yes, in the case where only DAIF is present, the hwstate of NONMI and
NOIRQ is the same (DAIF.IF is set), and reverse mapping cannot
distinguish between these two scenarios when looking for the context.

>   hardware state for the DAIF-only case and logical context for
>   NMI cases would be unlikely to be acceptable, since it would
>   not be uniform.

Perhaps that's the case

> 
> - We might encounter cases where the hardware state temporarily
>   cannot be directly mapped to a logical context. I do not know

In this case, the hwstate may be invalid.

>   if we have such cases right now, but that would need to be
>   somehow handled by helpers performing reverse mapping.
> 
> - Lastly, such a facility has already been deemed undesirable
>   once, so I would rather not reintroduce it.
> 
> IMO, performing checks using the hardware state alone is a good
> compromise between clarity and functionality.

I see.

> 
> Thanks
> Vladimir
> 
> 


