Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16DBEC55179
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 12:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DTEAsF0UoKZI+M+/J5gl1QVLxKPxSzoc8HFPlNvrHAg=; b=LwhxsFxzyNz5DKEtuJKNhh2wz4
	qALX0pcwlBvzlMCpwlB1jyGWEWdPIE5JCZiBiv5WvTxrIm/bqQb3jgPAAlhQ17G8ew6/SP5x61YvI
	rKeaVngcFxVVViVxu4jDdR7gbKosUpZnTuxS7IqVcDXb0TBFQyeXC5RAqinBSBGNiTR8pBXN/p+Q9
	lOkBkPUt4FlcvDYwzYNAgzKbkSuMyl2dgH8GStaxzJx3DmsaqQuk1RxKRa1isxbdzb2+f2DTx3xcp
	tNc5JhG3LpZf2Nlrex5Nd2RLW5MpT6EqZdMYyczKQGZONauGwnPR9FjCkKlfi3bGs84gwRO+c8bQL
	wFUCkJxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqrfJ-0000000H0kL-2e0u;
	Mon, 03 Aug 2026 12:21:09 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqrfG-0000000H0k1-450u
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 12:21:08 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 14591143D;
	Mon,  3 Aug 2026 05:21:01 -0700 (PDT)
Received: from [10.1.34.163] (e121487-lin.cambridge.arm.com [10.1.34.163])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 972533F66F;
	Mon,  3 Aug 2026 05:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785759665; bh=9zlz4Ulidyax1zng5aJbbsSR6EYOAqL4bjgpk5aurYA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hnY0PGd2UAIR/i4hlV5JT1jSVd+PoMCeVb4jd7iYVc8VK8ba1dKmP7iUVXXnBKqDp
	 xYbuvVuavmNE6P3mUJPpAtwgeq+A0brIdBbhnk4lHUgKrEh8bOLuGdC2zGIlBd+ZqL
	 /be0Js767GYvUlMaYT/uOz5u/lHr7Ri9zCru7/1U=
Message-ID: <6b0a4c25-6e5a-4ff9-b87a-1d12636df08c@arm.com>
Date: Mon, 3 Aug 2026 13:21:01 +0100
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
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <349f178a-9eba-4353-96ab-91fd50ce87da@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_052107_124093_96590578 
X-CRM114-Status: GOOD (  22.25  )
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

On 7/28/26 10:18, Jinjie Ruan wrote:
> 
> 在 2026/7/28 0:34, Vladimir Murzin 写道:
>> From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
>>
>> The entry code handles interrupt masking differently from the rest of
>> the kernel. Exception handlers enter and exit with all exceptions
>> masked, but they must temporarily unmask the appropriate set of
>> exceptions so that the rest of the handler executes with the expected
>> exception state.
>>
>> For EL0 handlers, this means dropping to masking context appropriate
>> for the work to be performed. For EL1 handlers, this means restoring
>> the masking context of the interrupted task. In both cases, all
>> exceptions must be masked again before returning from the exception
>> handler.
>>
>> The rest of the kernel typically follows the opposite pattern: it
>> raises the masking context to protect a critical section and later
>> restores the previous context.
>>
>> Given these different usage patterns, introduce a dedicated set of
>> exception masking helpers for the entry code. Keeping these helpers
>> separate from the generic interrupt masking APIs makes the intended
>> usage explicit and helps avoid mixing the two masking models.
>>
>> Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
>> Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
>> ---
>>  arch/arm64/include/asm/interrupts/entry.h | 113 ++++++++++++++++++++++
>>  1 file changed, 113 insertions(+)
>>  create mode 100644 arch/arm64/include/asm/interrupts/entry.h
>>
>> diff --git a/arch/arm64/include/asm/interrupts/entry.h b/arch/arm64/include/asm/interrupts/entry.h
>> new file mode 100644
>> index 000000000000..d66eb5d633f0
>> --- /dev/null
>> +++ b/arch/arm64/include/asm/interrupts/entry.h
>> @@ -0,0 +1,113 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * Copyright (C) 2025 Arm Ltd.
>> + */
>> +#ifndef __ASM_INTERRUPTS_ENTRY_H
>> +#define __ASM_INTERRUPTS_ENTRY_H
>> +
>> +#include <asm/arch_gicv3.h>
>> +#include <asm/bug.h>
>> +#include <asm/cpufeature.h>
>> +#include <asm/interrupts/common_flags.h>
>> +
>> +
>> +static __always_inline
>> +arm64_exc_hwstate_t __arm64_switch_exc_hwstate_to(arm64_exc_hwstate_t prev,
>> +						  arm64_exc_hwstate_t next)
>> +{
>> +	bool irqs_disabled = arch_irqs_disabled_flags(next.flags);
>> +	bool force;
>> +
>> +	arm64_debug_exc_hwstate(prev);
>> +
>> +	if (prev.flags == next.flags)
>> +		return next;
>> +
>> +	if (!irqs_disabled)
>> +		trace_hardirqs_on();
>> +
>> +	force = system_uses_irq_prio_masking() && prev.pmr != next.pmr;
>> +
>> +	__arm64_update_exc_hwstate(next, force);
>> +
>> +	if (irqs_disabled)
>> +		trace_hardirqs_off();
>> +
>> +	return next;
>> +}
>> +
>> +static __always_inline
>> +arm64_exc_hwstate_t arm64_inherit_exc_context(struct pt_regs *regs)
>> +{
>> +	arm64_exc_hwstate_t prev = arm64_exc_hwstate_of_context(CRITICAL_CONTEXT);
>> +	arm64_exc_hwstate_t next = arm64_inherit_exc_hwstate(regs);
>> +
>> +	return __arm64_switch_exc_hwstate_to(prev, next);
>> +}
>> +
>> +static __always_inline
>> +arm64_exc_hwstate_t arm64_drop_exc_context(arm64_exc_hwstate_t prev, arm64_exc_context_t context)
>> +{
>> +	arm64_exc_hwstate_t next = arm64_exc_hwstate_of_context(context);
>> +
>> +	if (IS_ENABLED(CONFIG_DEBUG_IRQFLAGS)) {
>> +		bool pnmi = system_uses_irq_prio_masking();
>> +
>> +		WARN_ON_ONCE(context > ERROR_CONTEXT &&
>> +			     prev.daif == DAIF_ERRCTX);
>> +
>> +		WARN_ON_ONCE(context > NONMI_CONTEXT &&
>> +			     prev.daif == DAIF_PROCCTX_NOIRQ);
> For daif, we can directly compare next and prev because, as the context
> drops, the value of daif decreases.
> 
> This is also the opposite of the meanings of "drop" and "lift" in the
> function names, which is easy to understand.
> 
> WARN_ON_ONCE(prev.daif < next.daif);

That's a very good point! I was too focused on checking the hardware
state against the logical exception context, so I missed that we could
perform the checks using the hardware state alone.

What do you think about:

        if (IS_ENABLED(CONFIG_DEBUG_IRQFLAGS)) {
                WARN_ON_ONCE(prev.daif < next.daif);

                if (prev.daif == next.daif) {
                        /*
                         * GIC_PRIO_IRQON is larger that GIC_PRIO_IRQOFF so larger PMR value is weaker
                         */
                        WARN_ON_ONCE(system_uses_irq_prio_masking() && prev.pmr > next.pmr);
                        WARN_ON_ONCE(system_uses_nmi() && prev.allint < next.allint);
                }
        }

> 
>> +
>> +		WARN_ON_ONCE(context > NOIRQ_CONTEXT &&
>> +			     pnmi && prev.pmr == GIC_PRIO_IRQOFF);
>> +
>> +		WARN_ON_ONCE(context > PROCESS_CONTEXT &&
>> +			     ((pnmi && prev.daif == DAIF_PROCCTX && prev.pmr == GIC_PRIO_IRQON) ||
>> +			      (!pnmi && prev.daif == DAIF_PROCCTX)));
>> +	}
>> +
>> +	return __arm64_switch_exc_hwstate_to(prev, next);
>> +}
>> +
>> +static __always_inline
>> +arm64_exc_hwstate_t arm64_lift_exc_context(arm64_exc_hwstate_t prev, arm64_exc_context_t context)
>> +{
>> +	arm64_exc_hwstate_t next = arm64_exc_hwstate_of_context(context);
>> +
>> +	if (IS_ENABLED(CONFIG_DEBUG_IRQFLAGS)) {
>> +		bool pnmi = system_uses_irq_prio_masking();
>> +
>> +		WARN_ON_ONCE(context < CRITICAL_CONTEXT &&
>> +			     prev.daif == DAIF_MASK);
>> +
>> +		WARN_ON_ONCE(context < ERROR_CONTEXT &&
>> +			     prev.daif == DAIF_ERRCTX);
> WARN_ON_ONCE(prev.daif > next.daif);
> 

... and

        if (IS_ENABLED(CONFIG_DEBUG_IRQFLAGS)) {
                WARN_ON_ONCE(prev.daif > next.daif);

                if (prev.daif == next.daif) {
                        /*
                         * GIC_PRIO_IRQON is larger that GIC_PRIO_IRQOFF so smaller PMR value is stronger
                         */
                        WARN_ON_ONCE(system_uses_irq_prio_masking() && prev.pmr < next.pmr);
                        WARN_ON_ONCE(system_uses_nmi() && prev.allint > next.allint);
                }
        }


Cheers
Vladimir

>> +
>> +		WARN_ON_ONCE(context < NONMI_CONTEXT &&
>> +			     pnmi && prev.daif == DAIF_PROCCTX_NOIRQ);
>> +
>> +		WARN_ON_ONCE(context < NOIRQ_CONTEXT &&
>> +			     ((pnmi && prev.pmr == GIC_PRIO_IRQOFF) ||
>> +			      (!pnmi && prev.daif == DAIF_PROCCTX_NOIRQ)));
>> +	}
>> +
>> +	return __arm64_switch_exc_hwstate_to(prev, next);
>> +}
>> +
>> +
>> +static __always_inline
>> +arm64_exc_hwstate_t arm64_unmask_exc_context(arm64_exc_context_t context)
>> +{
>> +	arm64_exc_hwstate_t prev = arm64_exc_hwstate_of_context(CRITICAL_CONTEXT);
>> +
>> +	return arm64_drop_exc_context(prev, context);
>> +}
>> +
>> +static __always_inline
>> +arm64_exc_hwstate_t arm64_mask_exc_context(arm64_exc_hwstate_t prev)
>> +{
>> +	return arm64_lift_exc_context(prev, CRITICAL_CONTEXT);
>> +}
>> +
>> +#endif /* __ASM_INTERRUPTS_ENTRY_H */
> 


