Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89520C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 08:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nlnYuXs8rOtjydGe8YvncmQUyoFZD72xMNKEnJvHeHE=; b=t4hOoWIwr95clr
	K9KRQTlXqEUunao32559ALwVIFZQrs15Ppx3jnKMgHm+OXV0eOnb9kw96nvpKh0rrWbmofjGRf5AK
	7HWL6nC7LA2/M7d2vfMhET8kSzBJ/tAy34uJGa9gG4kKVprgfbqDk8j1cF7di15nu3lsqv3NOMVcL
	sS+fyehaY1H8hpfQUU5YGw3E0oiYimzfmtMFxr0ESyxK9XrMPWZeGgP4BKc0NOu4RSSW9dUCor6ty
	QhOuNvXxd6ALxmLWbwhFXqQI8mFPBjCjHv+2x+U9Fxpl8hoec6v1EuAdbQEc2VfhQwb7rpwTeKOK8
	zOA3Y+QSbNj0Y1zTz/Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjCGf-00000008cxV-3Vpt;
	Mon, 13 Jul 2026 08:44:01 +0000
Received: from canpmsgout10.his.huawei.com ([113.46.200.225])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjCGb-00000008cwd-3Zjc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 08:44:00 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=nlnYuXs8rOtjydGe8YvncmQUyoFZD72xMNKEnJvHeHE=;
	b=Vrdj3n0jM5yJHhbLtmkaYgoVen+yKoLxfhNqG0SCFmNy1XkWUdh8EKjjwe2HncmewvDEsXbr0
	y+8pJAsfrRk0otI5RecU+Xdw6FtvN9q+yiRExkD9Zhb+DMSO2jdcaSKpLZyOEU4uXYmWEtkar/K
	FzL/4j3hrBZupTbTW/6VN7Y=
Received: from mail.maildlp.com (unknown [172.19.163.163])
	by canpmsgout10.his.huawei.com (SkyGuard) with ESMTPS id 4gzG2G1J2mz1K97g;
	Mon, 13 Jul 2026 16:34:30 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 146B440588;
	Mon, 13 Jul 2026 16:43:46 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 13 Jul 2026 16:43:45 +0800
Message-ID: <33e6094d-e433-4406-8fef-0feff8f05bcb@huawei.com>
Date: Mon, 13 Jul 2026 16:43:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 14/36] arm64: interrupts: introduce generic interrupt
 masking helpers
To: Vladimir Murzin <vladimir.murzin@arm.com>,
	<linux-arm-kernel@lists.infradead.org>
References: <20260709121333.23507-1-vladimir.murzin@arm.com>
 <20260709121333.23507-15-vladimir.murzin@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260709121333.23507-15-vladimir.murzin@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_014358_529972_8E39FF53 
X-CRM114-Status: GOOD (  24.83  )
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

I think the name "all irqs" is inappropriate, because it also masks
DEBUG exceptions and SERROR exceptions, which are not irqs.

Maybe local_exceptions_save_mask()?

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


