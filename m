Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 773A1C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 09:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H1Xtk/Laxv043X/NEr5K+gIEpoXwwhPTLlaiLOk/BNg=; b=KGrYghSLQr+X6x
	0DHjF2ITQNhpHqF/LU+NgCAGf0CaHqhTFtpA7ue6KSGaLE5O1UJym8YPRUJaUaDB9XEfzMCsffC/l
	qhvZgOxJf9Vj18TwL/e2XSDn8TLOVv+fctT43lFVnXBmZ2iwBuxIx+3Q9dXYX0931fqHnammtL/OY
	36V7I8XsrsIcsLssx+sAvqnDsEMuEhHCAA8vYoVXTVc/E+sdQalN0f3quBT6zW/rE9sJljpcpRT3R
	PHvfnfbx5vXHQgVlO6+ZB9uOdQzU0IXkjXrsuHjWTkpGM5XVHpLVOYnz3fwbmgFTYhEhquAIf/OxF
	HdCpbbAsmP7Pm+Sabt/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi7hw-00000004byN-2pMR;
	Fri, 10 Jul 2026 09:39:44 +0000
Received: from canpmsgout08.his.huawei.com ([113.46.200.223])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi7hq-00000004bvD-18cX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 09:39:39 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=H1Xtk/Laxv043X/NEr5K+gIEpoXwwhPTLlaiLOk/BNg=;
	b=RAlqIpXsaNPLVoGwwcpRQw6+eMoj+gGCzACZRlUgLroUlXzgoT5wgidtmY5q3n/aFNP0FyJgb
	9M0AeJAML8eHDLwm1DMnrbsAviF6mi6mx+EG2zSD7lMqHkyHO6giZ32sR3fUi90u/Bshb4yGMYL
	xC7iS9Kke+HoPtK9sQgeTDY=
Received: from mail.maildlp.com (unknown [172.19.163.200])
	by canpmsgout08.his.huawei.com (SkyGuard) with ESMTPS id 4gxRPz4yBYzmV8X;
	Fri, 10 Jul 2026 17:30:15 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 2AFC84055B;
	Fri, 10 Jul 2026 17:39:31 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 10 Jul 2026 17:39:30 +0800
Message-ID: <6374def7-d2fd-4e34-9fc3-465e479ab681@huawei.com>
Date: Fri, 10 Jul 2026 17:39:29 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 11/36] arm64: interrupts: introduce interrupt masking
 helpers for entry code
To: Vladimir Murzin <vladimir.murzin@arm.com>,
	<linux-arm-kernel@lists.infradead.org>
References: <20260709121333.23507-1-vladimir.murzin@arm.com>
 <20260709121333.23507-12-vladimir.murzin@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260709121333.23507-12-vladimir.murzin@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_023938_667161_40494FAF 
X-CRM114-Status: GOOD (  30.90  )
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
Cc: mark.rutland@arm.com, maz@kernel.org, will@kernel.org, catalin.marinas@arm.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org



On 7/9/2026 8:13 PM, Vladimir Murzin wrote:
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
> To make the masking logic easier to reason about, introduce exception
> contexts that map directly to the corresponding hardware exception
> state. Along with these contexts, provide helpers to:
> 
> - translate an exception context into the corresponding hardware
>   state,
> 
> - verify that the current hardware exception state matches the
>   expected exception context,
> 
> - raise or lower the current exception context, and
> 
> - perform the common mask/unmask operations when the starting or
>   target exception context is already known.
> 
> Tracking the current exception context also provides two additional
> benefits:
> 
> - improved debugging by verifying that the hardware exception state
>   matches the expected exception context, and
> 
> - avoiding unnecessary writes to the hardware exception state.
> 
> Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
> Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
> ---
>  .../include/asm/interrupts/common_flags.h     | 197 ++++++++++++++++++
>  arch/arm64/include/asm/interrupts/entry.h     | 110 ++++++++++
>  2 files changed, 307 insertions(+)
>  create mode 100644 arch/arm64/include/asm/interrupts/common_flags.h
>  create mode 100644 arch/arm64/include/asm/interrupts/entry.h
> 
> diff --git a/arch/arm64/include/asm/interrupts/common_flags.h b/arch/arm64/include/asm/interrupts/common_flags.h
> new file mode 100644
> index 000000000000..6ce60d1519e8
> --- /dev/null
> +++ b/arch/arm64/include/asm/interrupts/common_flags.h
> @@ -0,0 +1,197 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2025 Arm Ltd.
> + */
> +#ifndef __ASM_INTERRUPTS_COMMON_FLAGS_H
> +#define __ASM_INTERRUPTS_COMMON_FLAGS_H
> +
> +#include <asm/arch_gicv3.h>
> +#include <asm/bug.h>
> +#include <asm/cpufeature.h>
> +#include <asm/ptrace.h>
> +#include <asm/sysreg.h>
> +#include <asm/irqflags.h>
> +
> +#define DAIF_PROCCTX		0
> +#define DAIF_PROCCTX_NOIRQ	(PSR_I_BIT | PSR_F_BIT)
> +#define DAIF_ERRCTX		(PSR_A_BIT | PSR_I_BIT | PSR_F_BIT)
> +#define DAIF_MASK		(PSR_D_BIT | PSR_A_BIT | PSR_I_BIT | PSR_F_BIT)
> +
> +/*
> + * Exception context mapping
> + *
> + * pseudo-NMI
> + *
> + * CRITICAL -> DAIF + IRQON  (corresponds to the state on exception entry)
> + * ERROR    ->  AIF + IRQON
> + * NONMI    ->   IF + IRQON
> + * NOIRQ    ->    0 + IRQOFF
> + * PROCESS  ->    0 + IRQON
> + *
> + * Otherwise
> + *
> + * CRITICAL -> DAIF           (corresponds to the state on exception entry)
> + * ERROR    ->  AIF
> + * NONMI    ->   IF
> + * NOIRQ    ->   IF
> + * PROCESS  ->    0
> + */
> +typedef enum arm64_exc_context {
> +	PROCESS_CONTEXT,
> +	NOIRQ_CONTEXT,
> +	NONMI_CONTEXT,
> +	ERROR_CONTEXT,
> +	CRITICAL_CONTEXT,
> +} arm64_exc_context_t;
> +
> +static __always_inline
> +arm64_exc_hwstate_t __arm64_exc_hwstate_of_process_context(void)
> +{
> +	if (system_uses_irq_prio_masking())
> +		return (arm64_exc_hwstate_t){.daif=DAIF_PROCCTX, .pmr=GIC_PRIO_IRQON};
> +
> +	return (arm64_exc_hwstate_t){.daif=DAIF_PROCCTX};
> +}
> +
> +static __always_inline
> +arm64_exc_hwstate_t __arm64_exc_hwstate_of_noirq_context(void)
> +{
> +	if (system_uses_irq_prio_masking())
> +		return (arm64_exc_hwstate_t){.daif=DAIF_PROCCTX, .pmr=GIC_PRIO_IRQOFF};
> +
> +	return (arm64_exc_hwstate_t){.daif=DAIF_PROCCTX_NOIRQ};
> +}
> +
> +static __always_inline
> +arm64_exc_hwstate_t __arm64_exc_hwstate_of_nonmi_context(void)
> +{
> +	if (system_uses_irq_prio_masking())
> +		return (arm64_exc_hwstate_t){.daif=DAIF_PROCCTX_NOIRQ, .pmr=GIC_PRIO_IRQON};
> +
> +	return (arm64_exc_hwstate_t){.daif=DAIF_PROCCTX_NOIRQ};
> +}
> +
> +static __always_inline
> +arm64_exc_hwstate_t __arm64_exc_hwstate_of_error_context(void)
> +{
> +	if (system_uses_irq_prio_masking())
> +		return (arm64_exc_hwstate_t){.daif=DAIF_ERRCTX, .pmr=GIC_PRIO_IRQON};
> +
> +	return (arm64_exc_hwstate_t){.daif=DAIF_ERRCTX};
> +}
> +
> +static __always_inline
> +arm64_exc_hwstate_t __arm64_exc_hwstate_of_critical_context(void)
> +{
> +	if (system_uses_irq_prio_masking())
> +		return (arm64_exc_hwstate_t){.daif=DAIF_MASK, .pmr=GIC_PRIO_IRQON};
> +
> +	return (arm64_exc_hwstate_t){.daif=DAIF_MASK};
> +}
> +
> +static __always_inline
> +arm64_exc_hwstate_t arm64_exc_hwstate_of_context(arm64_exc_context_t context) {
> +	switch (context) {
> +	case PROCESS_CONTEXT:
> +		return __arm64_exc_hwstate_of_process_context();
> +	case NOIRQ_CONTEXT:
> +		return __arm64_exc_hwstate_of_noirq_context();
> +	case NONMI_CONTEXT:
> +		return __arm64_exc_hwstate_of_nonmi_context();
> +	case ERROR_CONTEXT:
> +		return __arm64_exc_hwstate_of_error_context();
> +	case CRITICAL_CONTEXT:
> +		return __arm64_exc_hwstate_of_critical_context();
> +	default:
> +		BUG();
> +	}
> +}
> +
> +static __always_inline
> +arm64_exc_hwstate_t arm64_inherit_exc_hwstate(struct pt_regs *regs)
> +{
> +	arm64_exc_hwstate_t state = {.daif=regs->pstate & DAIF_MASK};
> +
> +	if (system_uses_irq_prio_masking())
> +		state.pmr = regs->pmr;
> +
> +	return state;
> +}
> +
> +static __always_inline
> +void arm64_debug_exc_hwstate(arm64_exc_hwstate_t expected)
> +{
> +	arm64_exc_hwstate_t actual;
> +
> +	if (!IS_ENABLED(CONFIG_DEBUG_IRQFLAGS))
> +		return;
> +
> +	actual.flags = arch_local_save_flags();
> +
> +	if (expected.flags == actual.flags)
> +		return;
> +
> +	if (system_uses_irq_prio_masking()) {
> +		WARN_ONCE(1, "Unexpected DAIF+PMR: 0x%x + 0x%x (expected 0x%x + 0x%x)\n",
> +			  actual.daif, actual.pmr, expected.daif, expected.pmr);
> +	} else {
> +		WARN_ONCE(1, "Unexpected DAIF: 0x%x (expected 0x%x)\n",
> +			  actual.daif, expected.daif);
> +	}
> +}
> +
> +static __always_inline
> +void arm64_debug_exc_context(arm64_exc_context_t context)
> +{
> +	arm64_exc_hwstate_t expected = arm64_exc_hwstate_of_context(context);
> +
> +	arm64_debug_exc_hwstate(expected);
> +}
> +
> +static __always_inline
> +void arm64_update_exc_hwstate(arm64_exc_hwstate_t hwstate, bool update_pmr)
> +{
> +	if (system_uses_irq_prio_masking() &&
> +	    update_pmr &&
> +	    hwstate.pmr == GIC_PRIO_IRQOFF) {
> +		/*
> +		 * There has been concern that the write to daif
> +		 * might be reordered before this write to PMR.
> +		 * From the ARM ARM DDI 0487D.a, section D1.7.1
> +		 * "Accessing PSTATE fields":
> +		 *   Writes to the PSTATE fields have side-effects on
> +		 *   various aspects of the PE operation. All of these
> +		 *   side-effects are guaranteed:
> +		 *     - Not to be visible to earlier instructions in
> +		 *       the execution stream.
> +		 *     - To be visible to later instructions in the
> +		 *       execution stream
> +		 *
> +		 * Also, writes to PMR are self-synchronizing, so no
> +		 * interrupts with a lower priority than PMR is signaled
> +		 * to the PE after the write.
> +		 *
> +		 * So we don't need additional synchronization here.
> +		 */
> +		write_sysreg_s(hwstate.pmr, SYS_ICC_PMR_EL1);
> +		pmr_sync();
> +	}
> +
> +	write_sysreg(hwstate.daif, daif);
> +
> +	if (system_uses_irq_prio_masking() &&
> +	    update_pmr &&
> +	    hwstate.pmr == GIC_PRIO_IRQON) {
> +		write_sysreg_s(hwstate.pmr, SYS_ICC_PMR_EL1);
> +		pmr_sync();
> +	}
The default behavior of both local_daif_restore() and
local_daif_inherit() is to first restore the PMR register and then
restore DAIF. It appears that there has been a functional change here.

> +}
> +
> +static __always_inline
> +void arm64_update_exc_context(arm64_exc_context_t context, bool update_pmr)
> +{
> +	arm64_exc_hwstate_t hwstate = arm64_exc_hwstate_of_context(context);
> +
> +	arm64_update_exc_hwstate(hwstate, update_pmr);
> +}
> +#endif /* __ASM_INTERRUPTS_COMMON_FLAGS_H */
> diff --git a/arch/arm64/include/asm/interrupts/entry.h b/arch/arm64/include/asm/interrupts/entry.h
> new file mode 100644
> index 000000000000..3034c490ed66
> --- /dev/null
> +++ b/arch/arm64/include/asm/interrupts/entry.h
> @@ -0,0 +1,110 @@
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
> +	bool update_pmr = system_uses_irq_prio_masking() && prev.pmr != next.pmr;
> +
> +	arm64_debug_exc_hwstate(prev);
> +
> +	if (prev.flags == next.flags)
> +		return next;
> +
> +	if (!arch_irqs_disabled_flags(next.flags))
> +		trace_hardirqs_on();
> +
> +	arm64_update_exc_hwstate(next, update_pmr);
> +
> +	if (arch_irqs_disabled_flags(next.flags))
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
> +		bool pnmi = system_uses_irq_prio_masking();
> +
> +		WARN_ON_ONCE(context > ERROR_CONTEXT &&
> +			     prev.daif == DAIF_ERRCTX);
> +
> +		WARN_ON_ONCE(context > NONMI_CONTEXT &&
> +			     prev.daif == DAIF_PROCCTX_NOIRQ);
> +
> +		WARN_ON_ONCE(context > NOIRQ_CONTEXT &&
> +			     pnmi && prev.pmr == GIC_PRIO_IRQOFF);
> +
> +		WARN_ON_ONCE(context > PROCESS_CONTEXT &&
> +			     ((pnmi && prev.daif == DAIF_PROCCTX && prev.pmr == GIC_PRIO_IRQON) ||
> +			      (!pnmi && prev.daif == DAIF_PROCCTX)));
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
> +		bool pnmi = system_uses_irq_prio_masking();
> +
> +		WARN_ON_ONCE(context < CRITICAL_CONTEXT &&
> +			     prev.daif == DAIF_MASK);
> +
> +		WARN_ON_ONCE(context < ERROR_CONTEXT &&
> +			     prev.daif == DAIF_ERRCTX);
> +
> +		WARN_ON_ONCE(context < NONMI_CONTEXT &&
> +			     pnmi && prev.daif == DAIF_PROCCTX_NOIRQ);
> +
> +		WARN_ON_ONCE(context < NOIRQ_CONTEXT &&
> +			     ((pnmi && prev.pmr == GIC_PRIO_IRQOFF) ||
> +			      (!pnmi && prev.daif == DAIF_PROCCTX_NOIRQ)));
> +	}
> +
> +	return __arm64_switch_exc_hwstate_to(prev, next);
> +}
> +
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


