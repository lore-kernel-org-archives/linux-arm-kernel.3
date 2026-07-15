Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52480C44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 06:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PmsEAjJS+eKCQ4dXmeQVw9aVx6qI0BsyF8cXt1ghixk=; b=r7nINJB6mdWX1eXTJnnIQxD/u5
	0plP2ukHLf1Iv6LHkydB0Xks+IZgljGDOv1jYz5hY/Xy59LxLFb932vrZqNyoYhQjFRByO8BzJH9N
	D8PK0FAMgt/ig8XtVjVRtjnIeTzBVYj37/Z9AeGHtYHNsrlXJ3nBw0dO81qdZknqbHA2oKTTW3d7u
	WmpjXJAjlj++uXvbrqYsn36XUSSGTDC23k1iLrnFwGcagxfeFiI0/Yvm3yzHomyARFLZMSXvZh2dY
	LE3IV1h+A/6Y1ZvlsKzuEOcyhuLuAgdmC5IXOA1GWjNwkmB0KswgX40cVaThr813aS4CvdDW11Ib2
	HyAqHp7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjtKl-0000000Dvmw-3wIV;
	Wed, 15 Jul 2026 06:43:08 +0000
Received: from canpmsgout01.his.huawei.com ([113.46.200.216])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjtKj-0000000Dvll-0Ie5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 06:43:07 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=PmsEAjJS+eKCQ4dXmeQVw9aVx6qI0BsyF8cXt1ghixk=;
	b=3mdOeZVB0PvqhYmxzQJwFGSFj6M/w/eOyRSY3DEvCGqmROVrWSniXt9XtMykM1WFk4OIRVnHM
	b6SBcLCvh6HP+XxADq3ZnTPfrGkZzoUAMk0f8pB1Xw29ZnSuuiEuAHWgwL0rgvICkPN2keJ6PLL
	p11c9T4Yt728OVVAy5GXbto=
Received: from mail.maildlp.com (unknown [172.19.162.197])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4h0RG15mQpz1T4Hh;
	Wed, 15 Jul 2026 14:33:45 +0800 (CST)
Received: from dggemv712-chm.china.huawei.com (unknown [10.1.198.32])
	by mail.maildlp.com (Postfix) with ESMTPS id 4A8B540579;
	Wed, 15 Jul 2026 14:42:56 +0800 (CST)
Received: from kwepemq200011.china.huawei.com (7.202.195.155) by
 dggemv712-chm.china.huawei.com (10.1.198.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 15 Jul 2026 14:42:56 +0800
Received: from [10.67.110.108] (10.67.110.108) by
 kwepemq200011.china.huawei.com (7.202.195.155) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 15 Jul 2026 14:42:55 +0800
Message-ID: <d77b4056-5b5f-4fc2-9fc8-7c25134aa060@huawei.com>
Date: Wed, 15 Jul 2026 14:42:54 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 11/36] arm64: interrupts: introduce interrupt masking
 helpers for entry code
To: Vladimir Murzin <vladimir.murzin@arm.com>,
	<linux-arm-kernel@lists.infradead.org>
CC: <mark.rutland@arm.com>, <maz@kernel.org>, <ruanjinjie@huawei.com>,
	<catalin.marinas@arm.com>, <will@kernel.org>
References: <20260709121333.23507-1-vladimir.murzin@arm.com>
 <20260709121333.23507-12-vladimir.murzin@arm.com>
 <d93699cb-1541-4744-8b3a-bb1ac156d392@huawei.com>
 <c5c563e9-2157-4a54-ae5b-2ddd1ca51a4a@arm.com>
From: "Liao, Chang" <liaochang1@huawei.com>
In-Reply-To: <c5c563e9-2157-4a54-ae5b-2ddd1ca51a4a@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.110.108]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemq200011.china.huawei.com (7.202.195.155)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_234305_462409_C2A8433C 
X-CRM114-Status: GOOD (  12.59  )
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

在 2026/7/14 23:45, Vladimir Murzin 写道:
> On 7/14/26 08:33, Liao, Chang wrote:
>> 在 2026/7/9 20:13, Vladimir Murzin 写道:
>>> diff --git a/arch/arm64/include/asm/interrupts/entry.h b/arch/arm64/include/asm/interrupts/entry.h
>>> new file mode 100644
>>> index 000000000000..3034c490ed66
>>> --- /dev/null
>>> +++ b/arch/arm64/include/asm/interrupts/entry.h
>>> @@ -0,0 +1,110 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>> +/*
>>> + * Copyright (C) 2025 Arm Ltd.
>>> + */
>>> +#ifndef __ASM_INTERRUPTS_ENTRY_H
>>> +#define __ASM_INTERRUPTS_ENTRY_H
>>> +
>>> +#include <asm/arch_gicv3.h>
>>> +#include <asm/bug.h>
>>> +#include <asm/cpufeature.h>
>>> +#include <asm/interrupts/common_flags.h>
>>> +
>>> +
>>> +static __always_inline
>>> +arm64_exc_hwstate_t __arm64_switch_exc_hwstate_to(arm64_exc_hwstate_t prev,
>>> +						  arm64_exc_hwstate_t next)
>>> +{
>>> +	bool update_pmr = system_uses_irq_prio_masking() && prev.pmr != next.pmr;
>>> +
>>> +	arm64_debug_exc_hwstate(prev);
>>> +
>>> +	if (prev.flags == next.flags)
>>> +		return next;
>>> +
>>> +	if (!arch_irqs_disabled_flags(next.flags))
>>> +		trace_hardirqs_on();
>>> +
>>> +	arm64_update_exc_hwstate(next, update_pmr);
>>> +
>>> +	if (arch_irqs_disabled_flags(next.flags))
>>> +		trace_hardirqs_off();
>>> +
>>> +	return next;
>>> +}
>>> +
>>> +static __always_inline
>>> +arm64_exc_hwstate_t arm64_inherit_exc_context(struct pt_regs *regs)
>>> +{
>>> +	arm64_exc_hwstate_t prev = arm64_exc_hwstate_of_context(CRITICAL_CONTEXT);
>>> +	arm64_exc_hwstate_t next = arm64_inherit_exc_hwstate(regs);
>>> +
>>> +	return __arm64_switch_exc_hwstate_to(prev, next);
>>> +}
>>> +
>>> +static __always_inline
>>> +arm64_exc_hwstate_t arm64_drop_exc_context(arm64_exc_hwstate_t prev, arm64_exc_context_t context)
>>> +{
>>> +	arm64_exc_hwstate_t next = arm64_exc_hwstate_of_context(context);
>>> +
>>> +	if (IS_ENABLED(CONFIG_DEBUG_IRQFLAGS)) {
>>> +		bool pnmi = system_uses_irq_prio_masking();
>>> +
>>> +		WARN_ON_ONCE(context > ERROR_CONTEXT &&
>>> +			     prev.daif == DAIF_ERRCTX);
>> By definition, arm64_drop_exc_context() seems to require the target context to mask fewer (or equal)
>> exception types than the prev state. In this case, if context > ERROR_CONTEXT while
>> prev.daif == DAIF_PROCCTX_NOIRQ, doesn't that violate this assumption?
>>
> 
> My AI disagrees with your AI :D Honestly, prev.daif == DAIF_PROCCTX_NOIRQ is few lines bellow and
> we guard it with context > NONMI_CONTEXT which covers ERROR_CONTEXT and CRITICAL_CONTEXT as well.

Ah, sorry for the nosie, I completely overlooked the additional guard checks a few lines beblow,
thanks for pointing out. Your AI wins this round.

> 
>>> +
>>> +		WARN_ON_ONCE(context > NONMI_CONTEXT &&
>>> +			     prev.daif == DAIF_PROCCTX_NOIRQ);
>>> +
>>> +		WARN_ON_ONCE(context > NOIRQ_CONTEXT &&
>>> +			     pnmi && prev.pmr == GIC_PRIO_IRQOFF);
>>> +
>>> +		WARN_ON_ONCE(context > PROCESS_CONTEXT &&
>>> +			     ((pnmi && prev.daif == DAIF_PROCCTX && prev.pmr == GIC_PRIO_IRQON) ||
>>> +			      (!pnmi && prev.daif == DAIF_PROCCTX)));
>>> +	}
>>> +
>>> +	return __arm64_switch_exc_hwstate_to(prev, next);
>>> +}
>>> +
>>> +static __always_inline
>>> +arm64_exc_hwstate_t arm64_lift_exc_context(arm64_exc_hwstate_t prev, arm64_exc_context_t context)
>>> +{
>>> +	arm64_exc_hwstate_t next = arm64_exc_hwstate_of_context(context);
>>> +
>>> +	if (IS_ENABLED(CONFIG_DEBUG_IRQFLAGS)) {
>>> +		bool pnmi = system_uses_irq_prio_masking();
>>> +
>>> +		WARN_ON_ONCE(context < CRITICAL_CONTEXT &&
>>> +			     prev.daif == DAIF_MASK);
>> Is it intentional to allow prev.daif == DAIF_ERRCTX when context has a value of NONMI_CONTEXT,
>> NOIRQ_CONTEXT or PROCESS_CONTEXT? Or should these transitions also be caught here?
>>
>> By definition, arm64_lift_exc_context() seems to require the target context to mask more (or equal)
>> exception types than the prev state. Allowing these transitions appears to violate that assumption.
>>
> 
> Similarly prev.daif == DAIF_ERRCTX is few lines bellow and it is guarded by context < ERROR_CONTEXT
> which covers NONMI_CONTEXT, NOIRQ_CONTEXT and PROCESS_CONTEXT.

Thanks for pointing out.

> 
>>> +
>>> +		WARN_ON_ONCE(context < ERROR_CONTEXT &&
>>> +			     prev.daif == DAIF_ERRCTX);
>>> +
>>> +		WARN_ON_ONCE(context < NONMI_CONTEXT &&
>>> +			     pnmi && prev.daif == DAIF_PROCCTX_NOIRQ);
>>> +
>>> +		WARN_ON_ONCE(context < NOIRQ_CONTEXT &&
>>> +			     ((pnmi && prev.pmr == GIC_PRIO_IRQOFF) ||
>>> +			      (!pnmi && prev.daif == DAIF_PROCCTX_NOIRQ)));
>>> +	}
>>> +
>>> +	return __arm64_switch_exc_hwstate_to(prev, next);
>>> +}
>>> +
>>> +
>>> +static __always_inline
>>> +arm64_exc_hwstate_t arm64_unmask_exc_context(arm64_exc_context_t context)
>>> +{
>>> +	arm64_exc_hwstate_t prev = arm64_exc_hwstate_of_context(CRITICAL_CONTEXT);
>>> +
>>> +	return arm64_drop_exc_context(prev, context);
>>> +}
>>> +
>>> +static __always_inline
>>> +arm64_exc_hwstate_t arm64_mask_exc_context(arm64_exc_hwstate_t prev)
>>> +{
>>> +	return arm64_lift_exc_context(prev, CRITICAL_CONTEXT);
>>> +}
>>> +
>>> +#endif /* __ASM_INTERRUPTS_ENTRY_H */
>>
>> -- BR Liao, Chang
>>
> 
> Cheers
> Vladimir
> 


-- 
BR
Liao, Chang

