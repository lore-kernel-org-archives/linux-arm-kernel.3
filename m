Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73AC7C61DB9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 29 Aug 2026 02:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:CC:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=029pauBIja0VaQ5opFkOXJKM7VcGMX9B/Z3GtNwAROw=; b=GA3BXyMYpurYO+Q1eBJamIA8UF
	Im8nFkrgRR6VyVVD+wY0CE+GMjuihkQP5K1GUcZxxJ6Vuq9pb4cZ0JW4gFTqAIvc/qLF7ndXhUxHx
	xOBYiIk6sSVJ3EtBythqsvnu5xrWKEr//KgWmDQr5/1sMkB5Ts0VU18jRC55mJXgETnibcOzifgES
	v7FaT4WpkOi0VPLfJ1GCVqAJ9NdZ9uOiQ4ZgIEX2JcOMJxDeCeWlCVj0RXRur+XbYz0x448i0tGHF
	ptjk9KvqUgwPzc/j7KeRUIB5BOLN1iEsk3I7SGKx0PbxZIdTITOQ8u8I7xW+ssT9xs4Eb7e04d1vh
	xDU8aeYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x08ts-00000006c8r-0aih;
	Sat, 29 Aug 2026 02:34:32 +0000
Received: from canpmsgout10.his.huawei.com ([113.46.200.225])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x08tp-00000006c85-2Xuj
	for linux-arm-kernel@lists.infradead.org;
	Sat, 29 Aug 2026 02:34:31 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=029pauBIja0VaQ5opFkOXJKM7VcGMX9B/Z3GtNwAROw=;
	b=eJSA5XXrkR515YIAyp30alIAlcrmAk31uvFm0Os7HS6dz2ICJh3PkZDgVrjyYgpJFHnvIqF6D
	xTGqBy7Ba6k5u8s3cWSeQ76m3nfxeKorhMHjhpE/W2Fx9Qse3Fximr+ay6cNtL/wr8l5OUuRlly
	LCmpDfKXOWKQZ4cRVfIhCsE=
Received: from mail.maildlp.com (unknown [172.19.162.92])
	by canpmsgout10.his.huawei.com (SkyGuard) with ESMTPS id 4hWzZW31Vfz1K97H;
	Sat, 29 Aug 2026 10:23:31 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id DFA9D40565;
	Sat, 29 Aug 2026 10:34:18 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Sat, 29 Aug 2026 10:34:18 +0800
Message-ID: <928dbd54-19ff-498f-a49c-23bdeccc589e@huawei.com>
Date: Sat, 29 Aug 2026 10:34:17 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 14/45] arm64: entry: Introduce entry specific
 exception masking helpers
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: Vladimir Murzin <vladimir.murzin@arm.com>,
	<linux-arm-kernel@lists.infradead.org>
CC: <mark.rutland@arm.com>, <maz@kernel.org>, <will@kernel.org>,
	<catalin.marinas@arm.com>, <liaochang1@huawei.com>
References: <20260727163453.7969-1-vladimir.murzin@arm.com>
 <20260727163453.7969-15-vladimir.murzin@arm.com>
 <c2c67794-a65c-4c63-b94b-cdb7e99bd92b@huawei.com>
In-Reply-To: <c2c67794-a65c-4c63-b94b-cdb7e99bd92b@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_193430_024484_7D88353C 
X-CRM114-Status: GOOD (  15.90  )
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



在 2026/7/28 17:29, Jinjie Ruan 写道:
> 
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
> may be const arm64_exc_hwstate_t next
> 
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
> 
> We do not update next; it should be "void".

Hi Vladimir,

What do you think?

> 
>> +}
>> +
>> +static __always_inline
>> +arm64_exc_hwstate_t arm64_inherit_exc_context(struct pt_regs *regs)
>> +{
>> +	arm64_exc_hwstate_t prev = arm64_exc_hwstate_of_context(CRITICAL_CONTEXT);
>> +	arm64_exc_hwstate_t next = arm64_inherit_exc_hwstate(regs);
>> +
>> +	return __arm64_switch_exc_hwstate_to(prev, next);
> 
> __arm64_switch_exc_hwstate_to(prev, next);
> return next;
> 
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
> 
> __arm64_switch_exc_hwstate_to(prev, next);
> return next;
> 
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
> 
> __arm64_switch_exc_hwstate_to(prev, next);
> return next;
> 
>> +}
>> +
>> +
> 
> Extra blank lines.
> 
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


