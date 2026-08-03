Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3CBDC55179
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 12:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hpLO/wAMabmjPHn92fsxKbzt/GIFoOk49WFt7q9RSHs=; b=PyCsP16jaNEtgAomLhMisNDHNI
	DUzK4UMXecXiQKeBzaHYwn+KHG3GiHkB14rw6gxPPEyTcgvKmCS+Fdc2vCxCfc6qJOoifk+gZ1HI5
	pdgNG0xJ/1myvSsU5YQwfhUPlkmD685a1gulawkpWz59jMuCaIaNswUywqQYDUAygKouz4hAKK22H
	ti77GKHD/V9CRuGnFCXRV2HQGTItReVuEDt7cKXxF04vaGC7D7a1QaFkvSp6mhxHAlwg9v4VE2Rrj
	hCtPThb8uZI0/Y1y0Gq/PeuNhHTJhw+nGF/yew41yBxD6frGRYoy1kokW18brXNQY8aMrLa1fHnhk
	ddrUU7XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqrX9-0000000GzzE-1Y2V;
	Mon, 03 Aug 2026 12:12:43 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqrX7-0000000Gzys-2JDg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 12:12:42 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AFD08143D;
	Mon,  3 Aug 2026 05:12:34 -0700 (PDT)
Received: from [10.1.34.163] (e121487-lin.cambridge.arm.com [10.1.34.163])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 53D7F3F66F;
	Mon,  3 Aug 2026 05:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785759158; bh=IwsIndV4vrHrbcLybCO8GvfcfsAIYdkm8Zitf4e9iM4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FPmljpw0JFVcTZeG0Fmm7HAAKqjqEmbgzbfFpkJ+7nI8z3fbQk8KjeeMxNlRDjT7f
	 lpERzxaa+wMzXffXZ/sbhqSILndFwgZ+ufYB4aCgNaVrg45SW0UiUmu7lZ6gJ9imKU
	 bYPKRZQdfPxxuIhDWw1Ccf482M+ivJ2qghJuFaao=
Message-ID: <4f67380b-23e2-4d3c-8d9a-71916c5851d1@arm.com>
Date: Mon, 3 Aug 2026 13:12:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 14/45] arm64: entry: Introduce entry specific
 exception masking helpers
To: Jinjie Ruan <ruanjinjie@huawei.com>, linux-arm-kernel@lists.infradead.org
Cc: mark.rutland@arm.com, maz@kernel.org, will@kernel.org,
 catalin.marinas@arm.com, liaochang1@huawei.com
References: <20260727163453.7969-1-vladimir.murzin@arm.com>
 <20260727163453.7969-15-vladimir.murzin@arm.com>
 <afb95e7c-9c46-44c5-bf07-645b62501c58@huawei.com>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <afb95e7c-9c46-44c5-bf07-645b62501c58@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_051241_678338_D14018DC 
X-CRM114-Status: GOOD (  19.18  )
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

On 7/28/26 09:48, Jinjie Ruan wrote:
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
> [...]
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

Hi Jinjie,

> Hi Vladimir,
> 
> These two functions appear to have similar functionality, with only the
> debug code being different. Can they be merged?
> 

Functionality is indeed similar, but the intent is different. It
gently encourages the user to think about the exception context they
are currently in, which should make it easier to reason about
exception transitions. That is not always possible with a merged "take
me there" interface.

The debug code then ensures that the requested exception transition is
in the correct direction.

Cheers
Vladimir

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
> otherwise, LGTM
> Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>
> 
>> +
>> +#endif /* __ASM_INTERRUPTS_ENTRY_H */
> 


