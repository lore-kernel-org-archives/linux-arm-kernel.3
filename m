Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77C0DC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 13:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OAy+CAyDH03ojq2AImlJaG9BcbYyqkfCIE5LlzZmWcI=; b=o5x0Ou6p7bsFv//i0anAxvTOVs
	gQNv7JpmezY7AXFwuHDY04xPSqwBIujsgxtvK3e8qu/9IY7HQcyeDxNq6VgM5wVtOm7FSFP054inI
	TK6OqTSYG7EX+bO3aatfKlCIPnKFjPgBNvKou+iT+sZp2YOoDFttMKGLBXPJe0fFVghEYIQa5krI9
	XfoC373wbLaL/e/jaXVfD5TU9XPXVR3GPQwwx7JmytlJgXgUt69naua7ARy/I3q+0fy4x36foiUKw
	YhABcsZxQc8yZ/QJ0u2C4JStcxk1sTv5KAHGO1+YlZDqRezI1SYjx3NQyl0HjQFMCD2gcHTPCszFd
	7vX8BjAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjcwv-0000000C7hF-1h02;
	Tue, 14 Jul 2026 13:13:25 +0000
Received: from canpmsgout07.his.huawei.com ([113.46.200.222])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjcws-0000000C7es-06Sn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 13:13:24 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=OAy+CAyDH03ojq2AImlJaG9BcbYyqkfCIE5LlzZmWcI=;
	b=WoNc8eB3V2vzjtIrgAVe6D1u2sU7Hh3arwRJFQ9J9UrIArDwXppcb65REvCkbOeDBlv5oPMe8
	WlPOBOLhj7qlRik87DRR4aMvZvV1fRnmDhpozSsh6SOQIFHD2m+5pPQTAQdHcOjd3Y2Gnd4lmm+
	TBqnRf2sELQwgHEQQB4G9UM=
Received: from mail.maildlp.com (unknown [172.19.163.127])
	by canpmsgout07.his.huawei.com (SkyGuard) with ESMTPS id 4gzzyZ6pgVzLlTK;
	Tue, 14 Jul 2026 21:03:50 +0800 (CST)
Received: from dggemv705-chm.china.huawei.com (unknown [10.3.19.32])
	by mail.maildlp.com (Postfix) with ESMTPS id C57BE402AB;
	Tue, 14 Jul 2026 21:13:08 +0800 (CST)
Received: from kwepemq200011.china.huawei.com (7.202.195.155) by
 dggemv705-chm.china.huawei.com (10.3.19.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 14 Jul 2026 21:13:08 +0800
Received: from [10.67.110.108] (10.67.110.108) by
 kwepemq200011.china.huawei.com (7.202.195.155) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 14 Jul 2026 21:13:07 +0800
Message-ID: <76366aad-dde5-4054-83bf-08c88d939134@huawei.com>
Date: Tue, 14 Jul 2026 21:13:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 14/36] arm64: interrupts: introduce generic interrupt
 masking helpers
To: Vladimir Murzin <vladimir.murzin@arm.com>,
	<linux-arm-kernel@lists.infradead.org>
CC: <mark.rutland@arm.com>, <maz@kernel.org>, <ruanjinjie@huawei.com>,
	<catalin.marinas@arm.com>, <will@kernel.org>
References: <20260709121333.23507-1-vladimir.murzin@arm.com>
 <20260709121333.23507-15-vladimir.murzin@arm.com>
From: "Liao, Chang" <liaochang1@huawei.com>
In-Reply-To: <20260709121333.23507-15-vladimir.murzin@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.110.108]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemq200011.china.huawei.com (7.202.195.155)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_061322_674329_E6F6336D 
X-CRM114-Status: GOOD (  26.07  )
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

在 2026/7/9 20:13, Vladimir Murzin 写道:
> From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
> 
> As for the entry code, we want to replace `local_daif_...` helpers
> so that they can properly handle both DAIF and PMR, as well controlling
> their use more strongly.
> 
> Introduce new `local_all_irqs_...` helpers to replace them, which should
> only be called in save/restore pairs.
> 
> Save the requested interrupt state as well, so we can check for
> inconsistent interrupt masking in between save and restore.
> 
> There are two exceptions where it does not make sense to force
> save/restore pairs for modifying the interrupt masks:
>  - when initializing a CPU or
>  - preparing to turn it off.
> 
> As we otherwise want to force save/restore pairs, those cases are
> handled with specific helpers, making clear that they should not be
> used outside of those cases, enforced with `CONFIG_DEBUG_IRQFLAGS`
> enabled.
> 
> Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
> Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
> ---
>  arch/arm64/include/asm/interrupts/masking.h | 101 ++++++++++++++++++++
>  1 file changed, 101 insertions(+)
>  create mode 100644 arch/arm64/include/asm/interrupts/masking.h
> 
> diff --git a/arch/arm64/include/asm/interrupts/masking.h b/arch/arm64/include/asm/interrupts/masking.h
> new file mode 100644
> index 000000000000..66ee03f7ab68
> --- /dev/null
> +++ b/arch/arm64/include/asm/interrupts/masking.h
> @@ -0,0 +1,101 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2025 Arm Ltd.
> + */
> +#ifndef __ASM_INTERRUPTS_MASKING_H
> +#define __ASM_INTERRUPTS_MASKING_H
> +
> +#include <asm/arch_gicv3.h>
> +#include <asm/bug.h>
> +#include <asm/cpufeature.h>
> +#include <asm/interrupts/common_flags.h>
> +#include <asm/ptrace.h>
> +
> +typedef struct arm64_exc_hwstates {
> +	arm64_exc_hwstate_t saved;
> +	arm64_exc_hwstate_t expected;
> +} arm64_exc_hwstates_t;
> +
> +#ifdef CONFIG_DEBUG_IRQFLAGS
> +/* Make sure the CPU init/tear down masking functions are only used once. */
> +static DEFINE_PER_CPU(bool, irqs_masks_cpu_init_done);
> +static DEFINE_PER_CPU(bool, irqs_masks_cpu_final_done);

It is generally not a good idea to define static DEFINE_PER_CPU variables directly in
a header file, as this creates a separate copy of the variable in every translation unit
that includes it. Unless this header is strictly limited to a single source file. Please
correct me if this was designed for some special purpose.

> +#endif
> +
> +static inline
> +arm64_exc_hwstates_t local_all_irqs_save_mask(arm64_exc_context_t new)
> +{
> +	arm64_exc_hwstate_t state = arm64_exc_hwstate_of_context(new);
> +	arm64_exc_hwstate_t actual = {.flags = arch_local_save_flags()};
> +
> +	if (IS_ENABLED(CONFIG_DEBUG_IRQFLAGS)) {
> +		bool pnmi = system_uses_irq_prio_masking();
> +
> +		WARN_ON_ONCE(new < CRITICAL_CONTEXT &&
> +			     actual.daif == DAIF_MASK);
> +
> +		WARN_ON_ONCE(new < ERROR_CONTEXT &&
> +			     actual.daif == DAIF_ERRCTX);
> +
> +		WARN_ON_ONCE(new < NONMI_CONTEXT &&
> +			     pnmi && actual.daif == DAIF_PROCCTX_NOIRQ);
> +
> +		WARN_ON_ONCE(new < NOIRQ_CONTEXT &&
> +			     ((pnmi && actual.pmr == GIC_PRIO_IRQOFF) ||
> +			      (!pnmi && actual.daif == DAIF_PROCCTX_NOIRQ)));
> +	}

This verification logic is almost same with the counterpart in arm64_lift_exc_context().
Would it make sense to factor this out into a shared helper function to avoid duplication?

> +
> +	arm64_update_exc_hwstate(state, actual.pmr != state.pmr);
> +
> +	if (!arch_irqs_disabled_flags(actual.flags))
> +		trace_hardirqs_off();
> +
> +	return (arm64_exc_hwstates_t){.saved = actual, .expected = state};
> +}
> +
> +static inline void local_all_irqs_restore(arm64_exc_hwstates_t states)
> +{
> +	arm64_debug_exc_hwstate(states.expected);
> +
> +	if (!arch_irqs_disabled_flags(states.saved.flags))
> +		trace_hardirqs_on();
> +
> +	arm64_update_exc_hwstate(states.saved, true);
> +}
> +
> +#ifdef CONFIG_DEBUG_IRQFLAGS
> +static inline
> +void local_all_irqs_cpu_init_mask(arm64_exc_context_t context)
> +{
> +	WARN_ON(__this_cpu_read(irqs_masks_cpu_init_done));
> +	if (context == PROCESS_CONTEXT)
> +		trace_hardirqs_on();
> +	arm64_update_exc_context(context, true);
> +	__this_cpu_write(irqs_masks_cpu_init_done, true);
> +	__this_cpu_write(irqs_masks_cpu_final_done, false);
> +}
> +
> +static inline void local_all_irqs_final_mask(void)
> +{
> +	WARN_ON(__this_cpu_read(irqs_masks_cpu_final_done));
> +	arm64_update_exc_context(CRITICAL_CONTEXT, true);
> +	trace_hardirqs_off();
> +	__this_cpu_write(irqs_masks_cpu_final_done, true);
> +	__this_cpu_write(irqs_masks_cpu_init_done, false);
> +}
> +#else /* CONFIG_DEBUG_IRQFLAGS */
> +static inline
> +void local_all_irqs_cpu_init_mask(arm64_exc_context_t context)
> +{
> +	if (context == PROCESS_CONTEXT)
> +		trace_hardirqs_on();
> +	arm64_update_exc_context(context, true);
> +}
> +
> +static inline void local_all_irqs_final_mask(void)
> +{
> +	arm64_update_exc_context(CRITICAL_CONTEXT, true);
> +	trace_hardirqs_off();
> +}
> +#endif /* CONFIG_DEBUG_IRQFLAGS */
> +#endif /* __ASM_INTERRUPTS_MASKING_H */


-- 
BR
Liao, Chang

