Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 984D7C531F9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 11:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MTokd4xXMDbwyH2Br7d5SO0e8QzcrjZpeuLHFInTGmI=; b=bPRgQdgcRsIEmarrwrqLfsbaiZ
	xKuqljDRVo1xFzh+BiiEz11lw+dmZSdKhNADvZp0eSoNNM3M3qZvG2SbAXq1LBwiDOT7xUGs8Iq2l
	easKVLY4wpJcw2OXU1vgG1wD7C0bmMAA2PnpgpQZJ5DqW2amy45BmSD9lmWYacEgBXR70r39ba1kI
	R+7fUJZZJNuUDFPTV4rin7BMEjAiTP5CCANh+mQ+jt3bhw0GTI2tcfQCGqUKhjeZ2gSj+ZT7LH0Og
	fuLobR/e7Vq3kLqCMJbFeyuUiS0ff/5P6XtQEoaklnXVlObzZE7B/AZN5z7ZW4kzb3Pl86crVunQI
	vdX54LIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wogQL-000000059SV-2CuF;
	Tue, 28 Jul 2026 11:56:41 +0000
Received: from canpmsgout04.his.huawei.com ([113.46.200.219])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wogQC-000000059Pb-3OFA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 11:56:35 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=MTokd4xXMDbwyH2Br7d5SO0e8QzcrjZpeuLHFInTGmI=;
	b=lr3Zk4D356dfV9aJwyOW20ghqfZJPZ+5QQKdKGpIWOEVRAH6N5Lz/8O2+qzxEppTcgwx7PHYS
	gAnd6C5zboDmRrcI/P6vBJteJVJSHn55eOyQQjR+DutGP1siBAdMdNhP0L+SZyfiM76rjjUXnwo
	vPGdnDf+GDKLBOR3H9H8094=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4h8YbM13LHz1prLg;
	Tue, 28 Jul 2026 19:46:55 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id A3CC640575;
	Tue, 28 Jul 2026 19:56:23 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 28 Jul 2026 19:56:23 +0800
Message-ID: <57e6edc7-0be8-4ec4-950c-c6b97e0a576b@huawei.com>
Date: Tue, 28 Jul 2026 19:56:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 16/45] arm64: interrupts: Introduce exception
 masking save/restore helpers
To: Vladimir Murzin <vladimir.murzin@arm.com>,
	<linux-arm-kernel@lists.infradead.org>
CC: <mark.rutland@arm.com>, <maz@kernel.org>, <will@kernel.org>,
	<catalin.marinas@arm.com>, <liaochang1@huawei.com>
References: <20260727163453.7969-1-vladimir.murzin@arm.com>
 <20260727163453.7969-17-vladimir.murzin@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260727163453.7969-17-vladimir.murzin@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_045633_506685_87607C6F 
X-CRM114-Status: GOOD (  25.07  )
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
> Outside the entry code, the local_daif_... helpers need to be replaced
> so that both DAIF and PMR are handled correctly and their use can be
> controlled more strongly.
> 
> Introduce local_exceptions_save_mask() and local_exceptions_restore(),
> which must be used as a pair. Save both the original and requested
> exception state so that inconsistent changes between the save and
> restore can be detected.
> 
> There are two cases where paired save and restore operations do not
> make sense:
> 
> - when initializing a CPU, and
> - when preparing to turn it off.
> 
> Handle those cases with local_exceptions_cpu_init_mask() and
> local_exceptions_final_mask(). When CONFIG_DEBUG_IRQFLAGS is enabled,
> enforce that these helpers are not used outside their intended
> contexts.
> 
> Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
> Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
> ---
>  arch/arm64/include/asm/interrupts/masking.h | 89 +++++++++++++++++++++
>  arch/arm64/kernel/irq.c                     | 32 +++++++-
>  2 files changed, 120 insertions(+), 1 deletion(-)
>  create mode 100644 arch/arm64/include/asm/interrupts/masking.h
> 
> diff --git a/arch/arm64/include/asm/interrupts/masking.h b/arch/arm64/include/asm/interrupts/masking.h
> new file mode 100644
> index 000000000000..fd4fb5497c7e
> --- /dev/null
> +++ b/arch/arm64/include/asm/interrupts/masking.h
> @@ -0,0 +1,89 @@
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
> +static inline
> +arm64_exc_hwstates_t local_exceptions_save_mask(arm64_exc_context_t new)
> +{
> +	arm64_exc_hwstate_t actual = {.flags = arch_local_save_flags()};
> +	arm64_exc_hwstate_t state = arm64_exc_hwstate_of_context(new);
> +	bool irqs_disabled = arch_irqs_disabled_flags(state.flags);
> +	bool force;
> +
> +	/*
> +	 * We've just got actual HW state so we can rely on that to
> +	 * optimize some unnecessary updates.
> +	 */
> +	force = system_uses_irq_prio_masking() && actual.pmr != state.pmr;
> +
> +	if (!irqs_disabled)
> +		trace_hardirqs_on();
> +
> +	__arm64_update_exc_hwstate(state, force);
> +
> +	if (irqs_disabled)
> +		trace_hardirqs_off();
> +
> +	return (arm64_exc_hwstates_t){.saved = actual, .expected = state};
> +}
> +
> +static inline void local_exceptions_restore(arm64_exc_hwstates_t states)
> +{
> +	bool irqs_disabled = arch_irqs_disabled_flags(states.saved.flags);
> +
> +	arm64_debug_exc_hwstate(states.expected);
> +
> +	if (!irqs_disabled)
> +		trace_hardirqs_on();
> +
> +	arm64_update_exc_hwstate(states.saved);
> +
> +	if (irqs_disabled)
> +		trace_hardirqs_off();
> +}
> +
> +static __always_inline
> +void __local_exceptions_cpu_init_mask(arm64_exc_context_t context)
> +{
> +	if (context == PROCESS_CONTEXT)
> +		trace_hardirqs_on();
> +
> +	arm64_update_exc_context(context);

Is following miss for setup_arch()?

      if (context == NOIRQ_CONTEXT)
	  trace_hardirqs_off();

> +}
> +
> +static __always_inline void __local_exceptions_final_mask(void)
> +{
> +	arm64_update_exc_context(CRITICAL_CONTEXT);
> +	trace_hardirqs_off();
> +}
> +
> +#ifdef CONFIG_DEBUG_IRQFLAGS
> +void local_exceptions_cpu_init_mask(arm64_exc_context_t context);
> +void local_exceptions_final_mask(void);
> +#else
> +static inline
> +void local_exceptions_cpu_init_mask(arm64_exc_context_t context)
> +{
> +	__local_exceptions_cpu_init_mask(context);
> +}
> +
> +static inline void local_exceptions_final_mask(void)
> +{
> +	__local_exceptions_final_mask();
> +}
> +#endif /* CONFIG_DEBUG_IRQFLAGS */
> +#endif /* __ASM_INTERRUPTS_MASKING_H */
> diff --git a/arch/arm64/kernel/irq.c b/arch/arm64/kernel/irq.c
> index 9fafd826002b..ca98db345f92 100644
> --- a/arch/arm64/kernel/irq.c
> +++ b/arch/arm64/kernel/irq.c
> @@ -21,7 +21,7 @@
>  #include <linux/seq_file.h>
>  #include <linux/smp.h>
>  #include <linux/vmalloc.h>
> -#include <asm/daifflags.h>
> +#include <asm/interrupts/masking.h>
>  #include <asm/exception.h>
>  #include <asm/numa.h>
>  #include <asm/softirq_stack.h>
> @@ -39,6 +39,12 @@ DECLARE_PER_CPU(unsigned long *, irq_shadow_call_stack_ptr);
>  DEFINE_PER_CPU(unsigned long *, irq_shadow_call_stack_ptr);
>  #endif
>  
> +#ifdef CONFIG_DEBUG_IRQFLAGS
> +/* Make sure the CPU init/tear down masking functions are only used once. */
> +static cpumask_t irqs_masks_init_done;
> +static cpumask_t irqs_masks_final_done;
> +#endif
> +
>  static int __init init_irq_scs(void)
>  {
>  	int cpu;
> @@ -133,3 +139,27 @@ void __init init_IRQ(void)
>  		local_daif_restore(DAIF_PROCCTX_NOIRQ);
>  	}
>  }
> +
> +#ifdef CONFIG_DEBUG_IRQFLAGS
> +void local_exceptions_cpu_init_mask(arm64_exc_context_t context)
> +{
> +	int cpu = smp_processor_id();
> +
> +	WARN_ON(cpumask_test_cpu(cpu, &irqs_masks_init_done));
> +
> +	__local_exceptions_cpu_init_mask(context);
> +	cpumask_set_cpu(cpu, &irqs_masks_init_done);
> +	cpumask_clear_cpu(cpu, &irqs_masks_final_done);
> +}
> +
> +void local_exceptions_final_mask(void)
> +{
> +	int cpu = smp_processor_id();
> +
> +	WARN_ON(cpumask_test_cpu(cpu, &irqs_masks_final_done));
> +
> +	__local_exceptions_final_mask();
> +	cpumask_set_cpu(cpu, &irqs_masks_final_done);
> +	cpumask_clear_cpu(cpu, &irqs_masks_init_done);
> +}
> +#endif


