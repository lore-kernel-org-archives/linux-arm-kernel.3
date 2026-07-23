Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CA7FC531C7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 09:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vWeYOcC5jOa3LaTaGQh392YJ/C5kCPyX4Kfef/Fwgh4=; b=hohRF0J3oQ25kFJo3bIntifCDK
	qAmlYVEdfWS8taKoVgouP03Fa61rnXG5SUVEBsx+6VCpIpDHBOhNnhRV2hdlUcoqOr4jzB16wELhu
	C2FlSxkPFcJovY1PkXA0rdjIwbkQdgQIWcJKQcpOfG1bSi/vF1X5yEqfyR0noLMcY/afKKM35beyW
	1tNhXy5DokFPTeeYdsAsdEZ367WLF7VYrye5phJ9BePwR1064rWgfBqVxxSHvcPsfIfDTQhJM+fMV
	btYKA/93kY0B137NGoMERiN0cSpa8lyIaBP9gneCKABQDdB4EVZDrdIv2pa4XBZFbpSFVj8S55KRU
	Gx3UchAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmpqu-0000000Drhy-18DE;
	Thu, 23 Jul 2026 09:36:28 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmpqq-0000000Drh2-3fyz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 09:36:26 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F09251477;
	Thu, 23 Jul 2026 02:36:19 -0700 (PDT)
Received: from [10.1.34.163] (e121487-lin.cambridge.arm.com [10.1.34.163])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E05333F66F;
	Thu, 23 Jul 2026 02:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784799384; bh=6LYLf2oxp2u3VwKlev2QEEs9lsFS0QDGOk9hlr9Vxrc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=X8eTrm+TifNqx9OYut7ZlBImbNwheMtEkjbmf7ThW/F6Y0PZlSIXBO6jqPm1tTO1A
	 wwoc4LitNeTLYp+e5lP7BfqrBa1Uuj6zx7VyTnT7/j30z6LiIXAb0ouMju2i5A0QUu
	 IbK7KKi98F/ULLPEY+Mm4TkItatXpzwyRXyzcK0M=
Message-ID: <1dd99bf0-c4b0-44ce-86ad-4ad1d0de75a7@arm.com>
Date: Thu, 23 Jul 2026 10:36:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 14/36] arm64: interrupts: introduce generic interrupt
 masking helpers
To: Jinjie Ruan <ruanjinjie@huawei.com>, "Liao, Chang"
 <liaochang1@huawei.com>, linux-arm-kernel@lists.infradead.org
Cc: mark.rutland@arm.com, maz@kernel.org, catalin.marinas@arm.com,
 will@kernel.org
References: <20260709121333.23507-1-vladimir.murzin@arm.com>
 <20260709121333.23507-15-vladimir.murzin@arm.com>
 <03dbefa5-6828-4b62-8f43-45b631c49289@huawei.com>
 <31e2fdb7-063e-44a3-b667-766213839992@arm.com>
 <e0f77ad6-fce6-435f-9dd3-e10378cb29b9@huawei.com>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <e0f77ad6-fce6-435f-9dd3-e10378cb29b9@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_023625_076957_E7E080DD 
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

On 7/22/26 10:05, Jinjie Ruan wrote:
> 
> On 7/16/2026 5:37 PM, Vladimir Murzin wrote:
>> On 7/15/26 10:30, Liao, Chang wrote:
>>> 在 2026/7/9 20:13, Vladimir Murzin 写道:
>>>> From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
>>>>
>>>> As for the entry code, we want to replace `local_daif_...` helpers
>>>> so that they can properly handle both DAIF and PMR, as well controlling
>>>> their use more strongly.
>>>>
>>>> Introduce new `local_all_irqs_...` helpers to replace them, which should
>>>> only be called in save/restore pairs.
>>>>
>>>> Save the requested interrupt state as well, so we can check for
>>>> inconsistent interrupt masking in between save and restore.
>>>>
>>>> There are two exceptions where it does not make sense to force
>>>> save/restore pairs for modifying the interrupt masks:
>>>>  - when initializing a CPU or
>>>>  - preparing to turn it off.
>>>>
>>>> As we otherwise want to force save/restore pairs, those cases are
>>>> handled with specific helpers, making clear that they should not be
>>>> used outside of those cases, enforced with `CONFIG_DEBUG_IRQFLAGS`
>>>> enabled.
>>>>
>>>> Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
>>>> Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
>>>> ---
>>>>  arch/arm64/include/asm/interrupts/masking.h | 101 ++++++++++++++++++++
>>>>  1 file changed, 101 insertions(+)
>>>>  create mode 100644 arch/arm64/include/asm/interrupts/masking.h
>>>>
>>>> diff --git a/arch/arm64/include/asm/interrupts/masking.h b/arch/arm64/include/asm/interrupts/masking.h
>>>> new file mode 100644
>>>> index 000000000000..66ee03f7ab68
>>>> --- /dev/null
>>>> +++ b/arch/arm64/include/asm/interrupts/masking.h
>>>> @@ -0,0 +1,101 @@
>>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>>> +/*
>>>> + * Copyright (C) 2025 Arm Ltd.
>>>> + */
>>>> +#ifndef __ASM_INTERRUPTS_MASKING_H
>>>> +#define __ASM_INTERRUPTS_MASKING_H
>>>> +
>>>> +#include <asm/arch_gicv3.h>
>>>> +#include <asm/bug.h>
>>>> +#include <asm/cpufeature.h>
>>>> +#include <asm/interrupts/common_flags.h>
>>>> +#include <asm/ptrace.h>
>>>> +
>>>> +typedef struct arm64_exc_hwstates {
>>>> +	arm64_exc_hwstate_t saved;
>>>> +	arm64_exc_hwstate_t expected;
>>>> +} arm64_exc_hwstates_t;
>>>> +
>>>> +#ifdef CONFIG_DEBUG_IRQFLAGS
>>>> +/* Make sure the CPU init/tear down masking functions are only used once. */
>>>> +static DEFINE_PER_CPU(bool, irqs_masks_cpu_init_done);
>>>> +static DEFINE_PER_CPU(bool, irqs_masks_cpu_final_done);
>>>> +#endif
>>>> +
>>>> +static inline
>>>> +arm64_exc_hwstates_t local_all_irqs_save_mask(arm64_exc_context_t new)
>>>> +{
>>>> +	arm64_exc_hwstate_t state = arm64_exc_hwstate_of_context(new);
>>>> +	arm64_exc_hwstate_t actual = {.flags = arch_local_save_flags()};
>>>> +
>>>> +	if (IS_ENABLED(CONFIG_DEBUG_IRQFLAGS)) {
>>>> +		bool pnmi = system_uses_irq_prio_masking();
>>>> +
>>>> +		WARN_ON_ONCE(new < CRITICAL_CONTEXT &&
>>>> +			     actual.daif == DAIF_MASK);
>>>> +
>>>> +		WARN_ON_ONCE(new < ERROR_CONTEXT &&
>>>> +			     actual.daif == DAIF_ERRCTX);
>>>> +
>>>> +		WARN_ON_ONCE(new < NONMI_CONTEXT &&
>>>> +			     pnmi && actual.daif == DAIF_PROCCTX_NOIRQ);
>>>> +
>>>> +		WARN_ON_ONCE(new < NOIRQ_CONTEXT &&
>>>> +			     ((pnmi && actual.pmr == GIC_PRIO_IRQOFF) ||
>>>> +			      (!pnmi && actual.daif == DAIF_PROCCTX_NOIRQ)));
>>>> +	}
>>>> +
>>>> +	arm64_update_exc_hwstate(state, actual.pmr != state.pmr);
>>> Is it necessary to compare pmr field unconditionally here, does this function's
>>> usage imply a strict dependency on pseudo NMI？If this function moves forward to
>>> support FEAT_NMI, checking PMR seems unneccesary.
> I also think that this function seems to forcibly require the
> implementation of pseudo NMI and FEAT_NMI.
> 

I already revisited that, and I'll propose a reworked interface that
should (I hope) make it less confusing (see my reply to Chang a few
lines below for the idea).

> Can the arm64_update_exc_hwstate() and similar functions pass the target
> exception mask and current exception mask, and the function internally
> performs the check of "update_pmr" or "update_allint"?
> 

That would require us to always have the current exception mask
available. There are cases (such as exception entry, or here when we
save the state) where we have it almost for free. However, we may also
encounter cases where we either do not have it or cannot trust it, in
which case we would need an extra hardware state read just to satisfy
the interface.

Obviously this is not set in stone, and we may revisit it later. For
now, though, I'd prefer to keep the interface layered on top of the
basic hardware state operations.

Cheers
Vladimir

>> Yes, it is not necessary, but it is cheap. :) However, I think I need
>> to revisit this approach. More on that below...
>>
>>>> +
>>>> +	if (!arch_irqs_disabled_flags(actual.flags))
>>>> +		trace_hardirqs_off();
>>>> +
>>>> +	return (arm64_exc_hwstates_t){.saved = actual, .expected = state};
>>>> +}
>>>> +
>>>> +static inline void local_all_irqs_restore(arm64_exc_hwstates_t states)
>>>> +{
>>>> +	arm64_debug_exc_hwstate(states.expected);
>>>> +
>>>> +	if (!arch_irqs_disabled_flags(states.saved.flags))
>>>> +		trace_hardirqs_on();
>>>> +
>>>> +	arm64_update_exc_hwstate(states.saved, true);
>>> I'm curious why it forces update_pmr to true for this specific path?
>>>
>> We force an update because we cannot fully trust that the HW state
>> matches the expected state. The expected state exists for debug
>> purposes only.
>>
>> In the local_all_irqs_save_mask() case above, we have just read the HW
>> state, so we can use that information to avoid some unnecessary HW
>> updates.
>>
>> I think it would be better to provide two versions of
>> arm64_update_exc_hwstate(): a strong version and a relaxed version,
>> with the strong version being the default. That would let us limit the
>> relaxed version to places where we know it is safe to skip redundant
>> HW updates.
>>
>>
>>>> +}
>>>> +
>>>> +#ifdef CONFIG_DEBUG_IRQFLAGS
>>>> +static inline
>>>> +void local_all_irqs_cpu_init_mask(arm64_exc_context_t context)
>>>> +{
>>>> +	WARN_ON(__this_cpu_read(irqs_masks_cpu_init_done));
>>>> +	if (context == PROCESS_CONTEXT)
>>>> +		trace_hardirqs_on();
>>>> +	arm64_update_exc_context(context, true);
>>>> +	__this_cpu_write(irqs_masks_cpu_init_done, true);
>>>> +	__this_cpu_write(irqs_masks_cpu_final_done, false);
>>>> +}
>>>> +
>>>> +static inline void local_all_irqs_final_mask(void)
>>>> +{
>>>> +	WARN_ON(__this_cpu_read(irqs_masks_cpu_final_done));
>>>> +	arm64_update_exc_context(CRITICAL_CONTEXT, true);
>>>> +	trace_hardirqs_off();
>>>> +	__this_cpu_write(irqs_masks_cpu_final_done, true);
>>>> +	__this_cpu_write(irqs_masks_cpu_init_done, false);
>>>> +}
>>>> +#else /* CONFIG_DEBUG_IRQFLAGS */
>>>> +static inline
>>>> +void local_all_irqs_cpu_init_mask(arm64_exc_context_t context)
>>>> +{
>>>> +	if (context == PROCESS_CONTEXT)
>>>> +		trace_hardirqs_on();
>>>> +	arm64_update_exc_context(context, true);
>>>> +}
>>>> +
>>>> +static inline void local_all_irqs_final_mask(void)
>>>> +{
>>>> +	arm64_update_exc_context(CRITICAL_CONTEXT, true);
>>>> +	trace_hardirqs_off();
>>>> +}
>>>> +#endif /* CONFIG_DEBUG_IRQFLAGS */
>>>> +#endif /* __ASM_INTERRUPTS_MASKING_H */
>>> -- BR Liao, Chang
>>>
>> Cheers
>> Vladimir
>>


