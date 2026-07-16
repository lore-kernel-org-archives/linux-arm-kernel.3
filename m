Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91D7BC4450A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 09:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G42ZJjxq1cwFm5e4ues0EYOOR8QEvzxrhIVmMTC7tZE=; b=m+9HhTIuHePAdwgt4fr1E9K5vM
	Jnf+m59mreXJW4L1kSCs0a38GYvF2ZlmfievTQZHYjJCftXbMrsKr8s4HN5ST0RHgNYPAifjMFnN+
	VzJ+saVJqZyxLQ8lv44xO63zP/s02rjek1jAnrFD8MHtdjCcGDMrk9JJSUYFbcDaStuCZ5J+Cq4iE
	AD8TyEJ6dP2ZuljMHjwiLD2H0uoxBU71XI6hiN6JzRKy2rPBCNroy14Ny/ltzsX2AKgKb5ObhCPZA
	zU/8Ylz0avgfCm7MQl012iWwR+rkGatTr381dQJd+KpQPwdE+9Fip1rfD+o4iV5EHSnDd2bPQWT8W
	VCO7RSCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkIWk-0000000Gtp6-0vt0;
	Thu, 16 Jul 2026 09:37:10 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkIWi-0000000Gtoh-0f7a
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 09:37:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 06CC62F;
	Thu, 16 Jul 2026 02:37:03 -0700 (PDT)
Received: from [10.1.34.162] (e121487-lin.cambridge.arm.com [10.1.34.162])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9A2293F905;
	Thu, 16 Jul 2026 02:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784194627; bh=M4R71i24bJwwDZxhEnUUpI/n4qOrLNP84dEiTcS6kKM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JrMJ/ErBmL7UV1MGDzab//wfq5W6Dt9boak9uYozf1wE5hP7rtNN/SjT3v3VO7ekC
	 R1ug9QGtkoENaUQJH7S+Mx3Crw1oJk174UeGtOvYNkhoL1sqwi+knwFpn1XwRT0fYy
	 xSSGzE6Dia2ASWhFGsE0e5uBtL8cNEFIPqcrlLcI=
Message-ID: <31e2fdb7-063e-44a3-b667-766213839992@arm.com>
Date: Thu, 16 Jul 2026 10:37:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 14/36] arm64: interrupts: introduce generic interrupt
 masking helpers
To: "Liao, Chang" <liaochang1@huawei.com>,
 linux-arm-kernel@lists.infradead.org
Cc: mark.rutland@arm.com, maz@kernel.org, ruanjinjie@huawei.com,
 catalin.marinas@arm.com, will@kernel.org
References: <20260709121333.23507-1-vladimir.murzin@arm.com>
 <20260709121333.23507-15-vladimir.murzin@arm.com>
 <03dbefa5-6828-4b62-8f43-45b631c49289@huawei.com>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <03dbefa5-6828-4b62-8f43-45b631c49289@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_023708_274501_0E1734AC 
X-CRM114-Status: GOOD (  24.45  )
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

On 7/15/26 10:30, Liao, Chang wrote:
> 在 2026/7/9 20:13, Vladimir Murzin 写道:
>> From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
>>
>> As for the entry code, we want to replace `local_daif_...` helpers
>> so that they can properly handle both DAIF and PMR, as well controlling
>> their use more strongly.
>>
>> Introduce new `local_all_irqs_...` helpers to replace them, which should
>> only be called in save/restore pairs.
>>
>> Save the requested interrupt state as well, so we can check for
>> inconsistent interrupt masking in between save and restore.
>>
>> There are two exceptions where it does not make sense to force
>> save/restore pairs for modifying the interrupt masks:
>>  - when initializing a CPU or
>>  - preparing to turn it off.
>>
>> As we otherwise want to force save/restore pairs, those cases are
>> handled with specific helpers, making clear that they should not be
>> used outside of those cases, enforced with `CONFIG_DEBUG_IRQFLAGS`
>> enabled.
>>
>> Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
>> Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
>> ---
>>  arch/arm64/include/asm/interrupts/masking.h | 101 ++++++++++++++++++++
>>  1 file changed, 101 insertions(+)
>>  create mode 100644 arch/arm64/include/asm/interrupts/masking.h
>>
>> diff --git a/arch/arm64/include/asm/interrupts/masking.h b/arch/arm64/include/asm/interrupts/masking.h
>> new file mode 100644
>> index 000000000000..66ee03f7ab68
>> --- /dev/null
>> +++ b/arch/arm64/include/asm/interrupts/masking.h
>> @@ -0,0 +1,101 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * Copyright (C) 2025 Arm Ltd.
>> + */
>> +#ifndef __ASM_INTERRUPTS_MASKING_H
>> +#define __ASM_INTERRUPTS_MASKING_H
>> +
>> +#include <asm/arch_gicv3.h>
>> +#include <asm/bug.h>
>> +#include <asm/cpufeature.h>
>> +#include <asm/interrupts/common_flags.h>
>> +#include <asm/ptrace.h>
>> +
>> +typedef struct arm64_exc_hwstates {
>> +	arm64_exc_hwstate_t saved;
>> +	arm64_exc_hwstate_t expected;
>> +} arm64_exc_hwstates_t;
>> +
>> +#ifdef CONFIG_DEBUG_IRQFLAGS
>> +/* Make sure the CPU init/tear down masking functions are only used once. */
>> +static DEFINE_PER_CPU(bool, irqs_masks_cpu_init_done);
>> +static DEFINE_PER_CPU(bool, irqs_masks_cpu_final_done);
>> +#endif
>> +
>> +static inline
>> +arm64_exc_hwstates_t local_all_irqs_save_mask(arm64_exc_context_t new)
>> +{
>> +	arm64_exc_hwstate_t state = arm64_exc_hwstate_of_context(new);
>> +	arm64_exc_hwstate_t actual = {.flags = arch_local_save_flags()};
>> +
>> +	if (IS_ENABLED(CONFIG_DEBUG_IRQFLAGS)) {
>> +		bool pnmi = system_uses_irq_prio_masking();
>> +
>> +		WARN_ON_ONCE(new < CRITICAL_CONTEXT &&
>> +			     actual.daif == DAIF_MASK);
>> +
>> +		WARN_ON_ONCE(new < ERROR_CONTEXT &&
>> +			     actual.daif == DAIF_ERRCTX);
>> +
>> +		WARN_ON_ONCE(new < NONMI_CONTEXT &&
>> +			     pnmi && actual.daif == DAIF_PROCCTX_NOIRQ);
>> +
>> +		WARN_ON_ONCE(new < NOIRQ_CONTEXT &&
>> +			     ((pnmi && actual.pmr == GIC_PRIO_IRQOFF) ||
>> +			      (!pnmi && actual.daif == DAIF_PROCCTX_NOIRQ)));
>> +	}
>> +
>> +	arm64_update_exc_hwstate(state, actual.pmr != state.pmr);
> Is it necessary to compare pmr field unconditionally here, does this function's
> usage imply a strict dependency on pseudo NMI？If this function moves forward to
> support FEAT_NMI, checking PMR seems unneccesary.
> 

Yes, it is not necessary, but it is cheap. :) However, I think I need
to revisit this approach. More on that below...

>> +
>> +	if (!arch_irqs_disabled_flags(actual.flags))
>> +		trace_hardirqs_off();
>> +
>> +	return (arm64_exc_hwstates_t){.saved = actual, .expected = state};
>> +}
>> +
>> +static inline void local_all_irqs_restore(arm64_exc_hwstates_t states)
>> +{
>> +	arm64_debug_exc_hwstate(states.expected);
>> +
>> +	if (!arch_irqs_disabled_flags(states.saved.flags))
>> +		trace_hardirqs_on();
>> +
>> +	arm64_update_exc_hwstate(states.saved, true);
> I'm curious why it forces update_pmr to true for this specific path?
> 

We force an update because we cannot fully trust that the HW state
matches the expected state. The expected state exists for debug
purposes only.

In the local_all_irqs_save_mask() case above, we have just read the HW
state, so we can use that information to avoid some unnecessary HW
updates.

I think it would be better to provide two versions of
arm64_update_exc_hwstate(): a strong version and a relaxed version,
with the strong version being the default. That would let us limit the
relaxed version to places where we know it is safe to skip redundant
HW updates.


>> +}
>> +
>> +#ifdef CONFIG_DEBUG_IRQFLAGS
>> +static inline
>> +void local_all_irqs_cpu_init_mask(arm64_exc_context_t context)
>> +{
>> +	WARN_ON(__this_cpu_read(irqs_masks_cpu_init_done));
>> +	if (context == PROCESS_CONTEXT)
>> +		trace_hardirqs_on();
>> +	arm64_update_exc_context(context, true);
>> +	__this_cpu_write(irqs_masks_cpu_init_done, true);
>> +	__this_cpu_write(irqs_masks_cpu_final_done, false);
>> +}
>> +
>> +static inline void local_all_irqs_final_mask(void)
>> +{
>> +	WARN_ON(__this_cpu_read(irqs_masks_cpu_final_done));
>> +	arm64_update_exc_context(CRITICAL_CONTEXT, true);
>> +	trace_hardirqs_off();
>> +	__this_cpu_write(irqs_masks_cpu_final_done, true);
>> +	__this_cpu_write(irqs_masks_cpu_init_done, false);
>> +}
>> +#else /* CONFIG_DEBUG_IRQFLAGS */
>> +static inline
>> +void local_all_irqs_cpu_init_mask(arm64_exc_context_t context)
>> +{
>> +	if (context == PROCESS_CONTEXT)
>> +		trace_hardirqs_on();
>> +	arm64_update_exc_context(context, true);
>> +}
>> +
>> +static inline void local_all_irqs_final_mask(void)
>> +{
>> +	arm64_update_exc_context(CRITICAL_CONTEXT, true);
>> +	trace_hardirqs_off();
>> +}
>> +#endif /* CONFIG_DEBUG_IRQFLAGS */
>> +#endif /* __ASM_INTERRUPTS_MASKING_H */
> 
> -- BR Liao, Chang
> 

Cheers
Vladimir

