Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93C41C982D0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 09:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e9EzhdCBaSpIAomlo0e+YuFfR08y/A2RZyednf9SAwQ=; b=hHGvI06MX4m32r0DroR1ijVseW
	dHbEclanLbpYrtaM9YtdtfmrS38toAGecBdjmWo6YxhQM+zDFD2Q0CqAVbBrI1WwfaeFYO200FMAU
	l814kXu1JIKtVXygtEhbG5Q3B6ZHtGsjCzlSDSlsH4+HTyFM8vXYVbPc6zi94kqix7F0hl21JgNNi
	uPZt35DeRcEDJxQesYb1Dv2DYD7qhXqlSTUM8N2J8AXjla9EQgi/tL+7AbzWxvyCc7/WMozMJ38Lj
	CBBhJ+P+aAhNJKD7s/XD+OKd4DezPwWn/O7YhBLD2mmgcwHxLmm7nyLpT8mbx5wzSlTDg0szHxTMz
	ipsbUgug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x78om-0000000B2v7-0bFj;
	Thu, 17 Sep 2026 09:54:12 +0000
Received: from canpmsgout09.his.huawei.com ([113.46.200.224])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x78oi-0000000B2u9-2wjR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 09:54:10 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=e9EzhdCBaSpIAomlo0e+YuFfR08y/A2RZyednf9SAwQ=;
	b=ETN6YdIrrOmc3yOXfJKBlC9LlqDC3xpAlqLnD8cljlk3JrEb3t8CUpK2oeKjrph6zbvf5TAxm
	fNbzxy6ITNtC1PvsxG+ac7mRoIkIlB/HIfaX0PQer5yejT8BsZPc5EisBRpc/L/Cqhnmuq7aPzU
	Do9tll9t6x+6nQHx0pFkZ3o=
Received: from mail.maildlp.com (unknown [172.19.162.92])
	by canpmsgout09.his.huawei.com (SkyGuard) with ESMTPS id 4hlrQr3jj3z1cyS4;
	Thu, 17 Sep 2026 17:43:00 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 2CEF540586;
	Thu, 17 Sep 2026 17:53:59 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemk200008.china.huawei.com (7.202.194.74) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 17 Sep 2026 17:53:58 +0800
Message-ID: <77548d26-25b4-4e88-b902-bae52e520289@huawei.com>
Date: Thu, 17 Sep 2026 17:53:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/38] arm64: entry: Introduce entry specific exception
 masking helpers
To: Vladimir Murzin <vladimir.murzin@arm.com>,
	<linux-arm-kernel@lists.infradead.org>
CC: <catalin.marinas@arm.com>, <will@kernel.org>, <mark.rutland@arm.com>,
	<maz@kernel.org>, <lpieralisi@kernel.org>, <liaochang1@huawei.com>
References: <20260914102102.68597-1-vladimir.murzin@arm.com>
 <20260914102102.68597-6-vladimir.murzin@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260914102102.68597-6-vladimir.murzin@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemk200008.china.huawei.com (7.202.194.74)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_025409_427963_90434ED4 
X-CRM114-Status: GOOD (  23.42  )
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



在 2026/9/14 18:20, Vladimir Murzin 写道:
> From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
> 
> The entry code handles interrupt masking differently from the rest of
> the kernel. Exception handlers enter and exit with all exceptions
> masked, but they must temporarily unmask the appropriate set of
> exceptions so that the rest of the handler executes with the expected
> exception state.
> 
> For EL0 handlers, this means dropping to masking context appropriate
> for the work to be performed. For EL1 handlers, this means restoring
> the masking context of the interrupted task. In both cases, all
> exceptions must be masked again before returning from the exception
> handler.
> 
> The rest of the kernel typically follows the opposite pattern: it
> raises the masking context to protect a critical section and later
> restores the previous context.
> 
> Given these different usage patterns, introduce a dedicated set of
> exception masking helpers for the entry code. Keeping these helpers
> separate from the generic interrupt masking APIs makes the intended
> usage explicit and helps avoid mixing the two masking models.
> 
> Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
> Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
> Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>  arch/arm64/include/asm/interrupts/entry.h | 100 ++++++++++++++++++++++
>  1 file changed, 100 insertions(+)
>  create mode 100644 arch/arm64/include/asm/interrupts/entry.h
> 
> diff --git a/arch/arm64/include/asm/interrupts/entry.h b/arch/arm64/include/asm/interrupts/entry.h
> new file mode 100644
> index 000000000000..0cfca62aa25b
> --- /dev/null
> +++ b/arch/arm64/include/asm/interrupts/entry.h
> @@ -0,0 +1,100 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2025 Arm Ltd.
> + */
> +#ifndef __ASM_INTERRUPTS_ENTRY_H
> +#define __ASM_INTERRUPTS_ENTRY_H
> +
> +#include <asm/arch_gicv3.h>
> +#include <asm/bug.h>
> +#include <asm/cpufeature.h>
> +#include <asm/interrupts/common_flags.h>
> +
> +
> +static __always_inline
> +arm64_exc_hwstate_t __arm64_switch_exc_hwstate_to(arm64_exc_hwstate_t prev,
> +						  arm64_exc_hwstate_t next)
> +{
> +	bool irqs_disabled = arch_irqs_disabled_flags(next.flags);
> +	bool force;
> +
> +	arm64_debug_exc_hwstate(prev);
> +
> +	if (prev.flags == next.flags)
> +		return next;
> +
> +	if (!irqs_disabled)
> +		trace_hardirqs_on();
> +
> +	force = system_uses_irq_prio_masking() && prev.pmr != next.pmr;
> +
> +	__arm64_update_exc_hwstate(next, force);
> +
> +	if (irqs_disabled)
> +		trace_hardirqs_off();
> +
> +	return next;
> +}
> +
> +static __always_inline
> +arm64_exc_hwstate_t arm64_inherit_exc_context(struct pt_regs *regs)
> +{
> +	arm64_exc_hwstate_t prev = arm64_exc_hwstate_of_context(CRITICAL_CONTEXT);
> +	arm64_exc_hwstate_t next = arm64_inherit_exc_hwstate(regs);

Could it be renamed to a more intuitive name, such as
arm64_exc_hwstate_of_regs()?

> +
> +	return __arm64_switch_exc_hwstate_to(prev, next);
> +}
> +
> +static __always_inline
> +arm64_exc_hwstate_t arm64_drop_exc_context(arm64_exc_hwstate_t prev, arm64_exc_context_t context)
> +{
> +	arm64_exc_hwstate_t next = arm64_exc_hwstate_of_context(context);
> +
> +	if (IS_ENABLED(CONFIG_DEBUG_IRQFLAGS)) {
> +		WARN_ON_ONCE(prev.daif < next.daif);
> +
> +		if (prev.daif == next.daif) {
> +			/*
> +			 * GIC_PRIO_IRQON is larger that GIC_PRIO_IRQOFF so larger PMR value is weaker
> +			 */
> +			WARN_ON_ONCE(system_uses_irq_prio_masking() && prev.pmr > next.pmr);
> +		}

The if branch is a dead code now, we can remove it.

arm64_drop_exc_context is only used directly in the context of
el0t_64_error_handler below. It switches from ERROR_CONTEXT to
PROCESS_CONTEXT.

And now arm64_unmask_exc_context always switch from CRITICAL_CONTEXT
to ERROR_CONTEXT/NONMI_CONTEXT/NOIRQ_CONTEXT/PROCESS_CONTEXT.

So there is no case where prev and next DAIF are the same.

1009 static void noinstr __el0_error_handler_common(struct pt_regs *regs)
1010 {
1011 >-------unsigned long esr = read_sysreg(esr_el1);
1012 >-------arm64_exc_hwstate_t hwstate;
1013 >-------irqentry_state_t state;
1014
1015 >-------arm64_enter_from_user_mode(regs);
1016 >-------hwstate = arm64_unmask_exc_context(ERROR_CONTEXT);
1017 >-------state = irqentry_nmi_enter(regs);
1018 >-------do_serror(regs, esr);
1019 >-------irqentry_nmi_exit(regs, state);
1020 >-------hwstate = arm64_drop_exc_context(hwstate, PROCESS_CONTEXT);
1021 >-------arm64_exit_to_user_mode(regs, hwstate);
1022 >-------arm64_debug_exc_context(CRITICAL_CONTEXT);
1023 }
1024
1025 asmlinkage void noinstr el0t_64_error_handler(struct pt_regs *regs)
1026 {
1027 >-------__el0_error_handler_common(regs);
1028 }


> +	}
> +
> +	return __arm64_switch_exc_hwstate_to(prev, next);
> +}
> +
> +static __always_inline
> +arm64_exc_hwstate_t arm64_lift_exc_context(arm64_exc_hwstate_t prev, arm64_exc_context_t context)
> +{
> +	arm64_exc_hwstate_t next = arm64_exc_hwstate_of_context(context);
> +
> +	if (IS_ENABLED(CONFIG_DEBUG_IRQFLAGS)) {
> +		WARN_ON_ONCE(prev.daif > next.daif);
> +
> +		if (prev.daif == next.daif) {
> +			/*
> +			 * GIC_PRIO_IRQON is larger that GIC_PRIO_IRQOFF so smaller PMR value is stronger
> +			 */
> +			WARN_ON_ONCE(system_uses_irq_prio_masking() && prev.pmr < next.pmr);
> +		}
> +	}
> +
> +	return __arm64_switch_exc_hwstate_to(prev, next);
> +}
> +
> +static __always_inline
> +arm64_exc_hwstate_t arm64_unmask_exc_context(arm64_exc_context_t context)
> +{
> +	arm64_exc_hwstate_t prev = arm64_exc_hwstate_of_context(CRITICAL_CONTEXT);
> +
> +	return arm64_drop_exc_context(prev, context);
> +}
> +
> +static __always_inline
> +arm64_exc_hwstate_t arm64_mask_exc_context(arm64_exc_hwstate_t prev)
> +{
> +	return arm64_lift_exc_context(prev, CRITICAL_CONTEXT);
> +}
> +
> +#endif /* __ASM_INTERRUPTS_ENTRY_H */

-- 
Best regards,
Jinjie


