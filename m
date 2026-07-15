Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C171DC44507
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 09:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=527bldQnC9vYRA3joDW0JrvEprTY72KTO1GHCLvbeBQ=; b=bXep1xrAQYRS+SumD4rs/AaeKm
	7JHm951gdXkxcfTEYjE5J5v9FCzpZfoXyo0Pg2FxdQiLe/iiygIDXRFsu0LlR62cU9WetCqbYGIU+
	DvyC14zBpQ9IFP/ng21EbObbYg/ONFgJpb288zMa4wEK+59JKNKPID5vdGxJkxqveRPPxnPotOJK0
	PvLfo1vTt3pTsUf5zHT8eYOHnN/Ct8MH8YBqd1rB5A6e4TKpqt6NZ8bmZSmXodGGvKz1t41MiCXhu
	a3juZ1nmyjUldq8nOqiI+cumoyMHcmU7EGX5IyHHwdD2kEeM6Veb9lW1+8/eVzB2Cf60Uv4Njd2qt
	M02qJicg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjvwZ-0000000EKPi-38Yt;
	Wed, 15 Jul 2026 09:30:19 +0000
Received: from canpmsgout01.his.huawei.com ([113.46.200.216])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjvwV-0000000EKOT-3NBR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 09:30:18 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=527bldQnC9vYRA3joDW0JrvEprTY72KTO1GHCLvbeBQ=;
	b=xKytVH4gZMUgWfQqlfNDVbCesEFGh3PZzZw6IRST91PTbWoAavIKVnpjVG4qwOKfewbS+fsue
	9Y4Uuvo2lxjz/iDfYYzCtAB8faJcDUg5u9lT6IZqAMwe192wJAR3z+P7w+4bCY3Y2Qc2TaK+2dj
	iXkNjGM2xrNfh2ByIIlDxWE=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4h0Vyp5vSnz1T4HL;
	Wed, 15 Jul 2026 17:20:50 +0800 (CST)
Received: from dggemv706-chm.china.huawei.com (unknown [10.3.19.33])
	by mail.maildlp.com (Postfix) with ESMTPS id 766C84057F;
	Wed, 15 Jul 2026 17:30:01 +0800 (CST)
Received: from kwepemq200011.china.huawei.com (7.202.195.155) by
 dggemv706-chm.china.huawei.com (10.3.19.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 15 Jul 2026 17:30:01 +0800
Received: from [10.67.110.108] (10.67.110.108) by
 kwepemq200011.china.huawei.com (7.202.195.155) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 15 Jul 2026 17:30:00 +0800
Message-ID: <03dbefa5-6828-4b62-8f43-45b631c49289@huawei.com>
Date: Wed, 15 Jul 2026 17:30:00 +0800
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
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemq200011.china.huawei.com (7.202.195.155)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_023016_510101_C58FA5A8 
X-CRM114-Status: GOOD (  24.27  )
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
> +
> +	arm64_update_exc_hwstate(state, actual.pmr != state.pmr);

Is it necessary to compare pmr field unconditionally here, does this function's
usage imply a strict dependency on pseudo NMI？If this function moves forward to
support FEAT_NMI, checking PMR seems unneccesary.

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

I'm curious why it forces update_pmr to true for this specific path?

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

