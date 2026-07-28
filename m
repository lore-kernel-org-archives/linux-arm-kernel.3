Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F5A6C54EFC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 08:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=17lLCvzW6eIVpk5Z9oFGo0P/6y4SOcT0+PY7YSsgMGY=; b=oQTiKG1ZgNZxUMPSH/ECRYEUf3
	IqnMCcjfN1kQ0BGnH27g1+GuGYZOXGRVO+3Z8utPTMqeSZ6iVr9V1rQEiM6TjAFi+dvwq0Uzq4n5v
	ty6WEHn6JSz/1mlSCD/isT5msXEeRD2oK1teynQqe/XAppPa+MT0f3caPn3ZT2lUsd5KkL6aexaGZ
	KEjhUU7mw8b6eNda7uXY2pD+zaY1/jE7NWmmv8Ep0dl6YkzdCA9BFXyJMrWDiFm1piXKIpcwD8AY/
	88HaMmtc2xdGs/V1M43ZMMC0mexUNpxGOf/GLeYMrErHBawsu/8glg05IHan46u/ir0qonijBnb0Y
	fD/00Gyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wod3s-00000004hsq-2wzO;
	Tue, 28 Jul 2026 08:21:16 +0000
Received: from canpmsgout03.his.huawei.com ([113.46.200.218])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wod3o-00000004hsA-0eGI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 08:21:15 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=17lLCvzW6eIVpk5Z9oFGo0P/6y4SOcT0+PY7YSsgMGY=;
	b=VRRhFtj2lAx5nD2KWZrS8gJE71gx8pS+HqIfj2Uyp5DS7mhR94De4QJjeSfUYQtsbUTDkJDz0
	uFCeivly4JETysU/txlovMGRHXOUHI8jhXxEdVRez3BDdXvqCiyEDKzgMHv/Rq9OLdc7O5eO82U
	01QaltAkakGzyvu63DFcoCY=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4h8Sq22zKhzpT1J;
	Tue, 28 Jul 2026 16:11:42 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id DA91B40575;
	Tue, 28 Jul 2026 16:20:57 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 28 Jul 2026 16:20:57 +0800
Message-ID: <e93ae08b-64e2-4128-b1fd-910c4d197dbd@huawei.com>
Date: Tue, 28 Jul 2026 16:20:56 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 12/45] arm64: interrupts: Add common exception
 state helpers
To: Vladimir Murzin <vladimir.murzin@arm.com>,
	<linux-arm-kernel@lists.infradead.org>
CC: <mark.rutland@arm.com>, <maz@kernel.org>, <will@kernel.org>,
	<catalin.marinas@arm.com>, <liaochang1@huawei.com>
References: <20260727163453.7969-1-vladimir.murzin@arm.com>
 <20260727163453.7969-13-vladimir.murzin@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260727163453.7969-13-vladimir.murzin@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_012112_889391_C1E44660 
X-CRM114-Status: GOOD (  32.35  )
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



在 2026/7/28 0:34, Vladimir Murzin 写道:
> From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
> 
> The entry code and the rest of the kernel require different interrupt
> masking APIs, but all need a common representation of the hardware
> exception state.
> 
> Introduce exception contexts that map DAIF and PMR state to the
> corresponding masking context. Provide helpers to translate between
> exception contexts and hardware state, verify the current state, and
> update the hardware state.
> 
> Updating PMR is unnecessary when a caller knows that its value has not
> changed. Allow such callers to avoid the update, while providing a
> force option for callers that cannot rely on the previous PMR state.
> 
> Entry specific and general purpose masking APIs will be built on these
> helpers in subsequent patches.
> 
> Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
> Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
> ---
>  .../include/asm/interrupts/common_flags.h     | 208 ++++++++++++++++++
>  1 file changed, 208 insertions(+)
>  create mode 100644 arch/arm64/include/asm/interrupts/common_flags.h
> 
> diff --git a/arch/arm64/include/asm/interrupts/common_flags.h b/arch/arm64/include/asm/interrupts/common_flags.h
> new file mode 100644
> index 000000000000..f034dcafccbc
> --- /dev/null
> +++ b/arch/arm64/include/asm/interrupts/common_flags.h
> @@ -0,0 +1,208 @@
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

Hi Vladimir,

Using two tables as below to map different contexts to the hwstate
status makes the code appear more concise and clear. What do you think?

--- /dev/null
+++ b/arch/arm64/include/asm/interrupts/common_flags.h
+typedef enum arm64_exc_context {
+       PROCESS_CONTEXT,
+       NOIRQ_CONTEXT,
+       NONMI_CONTEXT,
+       ERROR_CONTEXT,
+       CRITICAL_CONTEXT,
+       NR_CONTEXTS,
+} arm64_exc_context_t;

+static const arm64_exc_hwstate_t daif_context_hwstate[] = {
+       [PROCESS_CONTEXT]  = { .daif = DAIF_PROCCTX },
+       [NOIRQ_CONTEXT]    = { .daif = DAIF_PROCCTX_NOIRQ },
+       [NONMI_CONTEXT]    = { .daif = DAIF_PROCCTX_NOIRQ },
+       [ERROR_CONTEXT]    = { .daif = DAIF_ERRCTX },
+       [CRITICAL_CONTEXT] = { .daif = DAIF_MASK },
+};
+
+static const arm64_exc_hwstate_t pseudo_nmi_context_hwstate[] = {
+       [PROCESS_CONTEXT]  = { .daif = DAIF_PROCCTX,       .pmr =
GIC_PRIO_IRQON },
+       [NOIRQ_CONTEXT]    = { .daif = DAIF_PROCCTX,       .pmr =
GIC_PRIO_IRQOFF},
+       [NONMI_CONTEXT]    = { .daif = DAIF_PROCCTX_NOIRQ, .pmr =
GIC_PRIO_IRQON },
+       [ERROR_CONTEXT]    = { .daif = DAIF_ERRCTX,        .pmr =
GIC_PRIO_IRQON },
+       [CRITICAL_CONTEXT] = { .daif = DAIF_MASK,          .pmr =
GIC_PRIO_IRQON },
+};
+
+static __always_inline
+arm64_exc_hwstate_t arm64_exc_hwstate_of_context(arm64_exc_context_t
context)
+{
+       if (unlikely((unsigned int)context >= NR_CONTEXTS))
+               BUG();
+
+       if (system_uses_irq_prio_masking())
+               return pnmi_table[context];
+
+       return legacy_table[context];
+}
+

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
> +void __arm64_update_exc_hwstate(arm64_exc_hwstate_t hwstate, bool force)
> +{
> +	barrier();

I don't understand the purpose of the barrier at the beginning and end
of the function. Is this fix also required for the original
implementation of local_daif_restore()?

> +
> +	if (system_uses_irq_prio_masking() &&
> +	    hwstate.pmr == GIC_PRIO_IRQOFF &&
> +	    force) {
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
> +	}
> +
> +	barrier();

This barrier seems redundant and inconsistent with the comment above.

> +	write_sysreg(hwstate.daif, daif);
> +	barrier();
> +
> +	if (system_uses_irq_prio_masking() &&
> +	    hwstate.pmr == GIC_PRIO_IRQON &&
> +	    force) {
> +		write_sysreg_s(hwstate.pmr, SYS_ICC_PMR_EL1);
> +		pmr_sync();
> +	}
> +
> +	barrier();
> +}

If we no use pesudo NMI, the barrier is not nessary,

static __always_inline
void __arm64_update_exc_hwstate(arm64_exc_hwstate_t hwstate, bool force)
{
    if (system_uses_irq_prio_masking() && force) {
        if (hwstate.pmr == GIC_PRIO_IRQOFF)
            write_sysreg_s(hwstate.pmr, SYS_ICC_PMR_EL1);

        write_sysreg(hwstate.daif, daif);
        if (hwstate.pmr == GIC_PRIO_IRQON) {
            barrier();
            write_sysreg_s(hwstate.pmr, SYS_ICC_PMR_EL1);
            pmr_sync();
        }
    } else {
        write_sysreg(hwstate.daif, daif);
    }
}

otherwise, LGTM
Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>

> +
> +static __always_inline
> +void arm64_update_exc_hwstate(arm64_exc_hwstate_t hwstate)
> +{
> +	__arm64_update_exc_hwstate(hwstate, true);
> +}
> +
> +static __always_inline
> +void arm64_update_exc_context(arm64_exc_context_t context)
> +{
> +	arm64_exc_hwstate_t hwstate = arm64_exc_hwstate_of_context(context);
> +
> +	arm64_update_exc_hwstate(hwstate);
> +}
> +#endif /* __ASM_INTERRUPTS_COMMON_FLAGS_H */


