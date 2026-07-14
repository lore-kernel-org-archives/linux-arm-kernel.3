Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92E6BC44501
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 15:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LbCYJags32OgbLppByxWuzLZK4hhBPvrzFAvIxB20yw=; b=XFcYvW2tyiLuP6uQD7Jy6hyRZO
	4jax6MsPjSX4jUw+V4ZLeIicOeL5hlyQC+qSzXlL3aR6ely59n2fCQ53qh4X2A2Curq8SlaPp8mk2
	zWY6O1bAb34y5vXBWI1FJCJWXzAo9uFElkpcsS/fCOapAnq4SN28HRy5x6q6r5v3G2YO8Xol96kpt
	bQYcmVjJZ3UxWKZwUJX8JaPu7ZQ1I1ysl4xiYMLdgX1G7oDLOt0j2tXrVEi3UlVauz3i7CpG2SovE
	XoGkScm9IQookAEquYS69vDX+tC3hfrdkfA7KwAu/qsroK2h6fz2pUrmI+q8UoBCyuGBayvJECxHP
	aRpmzjkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjfKR-0000000CZtI-2PgM;
	Tue, 14 Jul 2026 15:45:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjfKL-0000000CZrF-2T2g
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 14 Jul 2026 15:45:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=LbCYJags32OgbLppByxWuzLZK4hhBPvrzFAvIxB20yw=; b=f86lzEN9FX4zoYVAP0LunfYR0K
	/XXvlEB6aAEmsbYGRKe+OzAEImGG0v+w8JZDFcvWSRZK7LFJNU2CcV+67cev6mF9ZbBn99wVjJJs9
	0TPoUXgoLZVwkP9aeeUeh6LJItKtv3uqok2Y3xk+NBTUCRx2obzQBKJGp3j4I3GpHF8niVUzOouKR
	hKptwc4OkVPShIg9cLZkfCgImsqaj0bCF+1vTM5FIkT6aJw382oWeI3O5Q3ILYIsNQXrW755X7HS3
	E7epsvhCi6MiLUuixtNDTy1m89zhWwXAeQbxmsI95ke88F6YKzS0qQylWpE/X/MSQq0zwjoKuApaZ
	4ZpgAXsg==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wjfKI-0000000Cevo-2IeF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 15:45:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E17DF339;
	Tue, 14 Jul 2026 08:45:34 -0700 (PDT)
Received: from [10.1.34.162] (e121487-lin.cambridge.arm.com [10.1.34.162])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1AEA53F915;
	Tue, 14 Jul 2026 08:45:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784043939; bh=RGLSLk5yQ1e575piudG1ThObGCQFi8yT3JmlEbw0BZo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MdxHygzRstKZ8UsNfB+GYAchUyMtkFbQYF6F7r+QTZ5sFErOaaH2V8/L77wGyyyB2
	 qOa/YNwLs4SEdDsPrGiGAsshdkHZmPmOIALbcTpiQCljk9qtB+WgyqNRwgC61xSxZ5
	 jtrEPkXmGgdC5L4nfTqnFQ+RrvnaBy7RmuAHrpHo=
Message-ID: <c5c563e9-2157-4a54-ae5b-2ddd1ca51a4a@arm.com>
Date: Tue, 14 Jul 2026 16:45:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 11/36] arm64: interrupts: introduce interrupt masking
 helpers for entry code
To: "Liao, Chang" <liaochang1@huawei.com>,
 linux-arm-kernel@lists.infradead.org
Cc: mark.rutland@arm.com, maz@kernel.org, ruanjinjie@huawei.com,
 catalin.marinas@arm.com, will@kernel.org
References: <20260709121333.23507-1-vladimir.murzin@arm.com>
 <20260709121333.23507-12-vladimir.murzin@arm.com>
 <d93699cb-1541-4744-8b3a-bb1ac156d392@huawei.com>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <d93699cb-1541-4744-8b3a-bb1ac156d392@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_164542_971827_2B08B488 
X-CRM114-Status: GOOD (  13.86  )
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

On 7/14/26 08:33, Liao, Chang wrote:
> 在 2026/7/9 20:13, Vladimir Murzin 写道:
>> diff --git a/arch/arm64/include/asm/interrupts/entry.h b/arch/arm64/include/asm/interrupts/entry.h
>> new file mode 100644
>> index 000000000000..3034c490ed66
>> --- /dev/null
>> +++ b/arch/arm64/include/asm/interrupts/entry.h
>> @@ -0,0 +1,110 @@
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
>> +	bool update_pmr = system_uses_irq_prio_masking() && prev.pmr != next.pmr;
>> +
>> +	arm64_debug_exc_hwstate(prev);
>> +
>> +	if (prev.flags == next.flags)
>> +		return next;
>> +
>> +	if (!arch_irqs_disabled_flags(next.flags))
>> +		trace_hardirqs_on();
>> +
>> +	arm64_update_exc_hwstate(next, update_pmr);
>> +
>> +	if (arch_irqs_disabled_flags(next.flags))
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
> By definition, arm64_drop_exc_context() seems to require the target context to mask fewer (or equal)
> exception types than the prev state. In this case, if context > ERROR_CONTEXT while
> prev.daif == DAIF_PROCCTX_NOIRQ, doesn't that violate this assumption?
> 

My AI disagrees with your AI :D Honestly, prev.daif == DAIF_PROCCTX_NOIRQ is few lines bellow and
we guard it with context > NONMI_CONTEXT which covers ERROR_CONTEXT and CRITICAL_CONTEXT as well.

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
> Is it intentional to allow prev.daif == DAIF_ERRCTX when context has a value of NONMI_CONTEXT,
> NOIRQ_CONTEXT or PROCESS_CONTEXT? Or should these transitions also be caught here?
> 
> By definition, arm64_lift_exc_context() seems to require the target context to mask more (or equal)
> exception types than the prev state. Allowing these transitions appears to violate that assumption.
> 

Similarly prev.daif == DAIF_ERRCTX is few lines bellow and it is guarded by context < ERROR_CONTEXT
which covers NONMI_CONTEXT, NOIRQ_CONTEXT and PROCESS_CONTEXT.

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
> -- BR Liao, Chang
> 

Cheers
Vladimir

