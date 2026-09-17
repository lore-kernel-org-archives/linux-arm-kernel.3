Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7740EC88E72
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 09:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=932yub1e6bnEXPMAi/o9VWjpCGHLUgf7Ili7g1J2xFI=; b=prGL2VW/OJ3UUkjX7aeCdSovZq
	qIIaKhXgV+aWYzRf47QKYS4SaNwf6HvmW3xEfxH/zRU5ZaJckYZyen5mx+n6Jq7ppHDprnGCIahHh
	AIjr22aOyxmZaI2U3y1AmnUP1KP8BCdaXctXCyROXvlcLtuavqLJ22AAv852aOQq4yroSMAYWp3Es
	KLulLt7W2xISigBWPgWucyzhBwnkQ+Tm+d4NIsKW1agYIqjPEiYB95USiqhhp2+XCtpuKzAYEpaxl
	1Ky4E+S6Vh4ZvFAMC3Qp+Is/7PVUhPSacE6BPCAAgv4C8m971CoTbMZnkV+xujwraxwJk56J87Z5k
	hrUc/CDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x788w-0000000AxeY-2Ccu;
	Thu, 17 Sep 2026 09:10:58 +0000
Received: from canpmsgout09.his.huawei.com ([113.46.200.224])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x788s-0000000Axdz-1moz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 09:10:56 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=932yub1e6bnEXPMAi/o9VWjpCGHLUgf7Ili7g1J2xFI=;
	b=NZsLzJBmicaWyJxo1d6RbImPgC5+5VGU7Ue++Ox8iZvbXMs2zrWOXNEIP8sfxjt5J0EdZggpa
	f419O3JiB9GLPfiX2AfYkpWTTPGm4gSJIMYt2kUhOy7DJ4HatQrFIxwu8vCrs279ug/SxUH7Xn/
	R01EmoRTwoovtr1Rh5Hcdd8=
Received: from mail.maildlp.com (unknown [172.19.163.200])
	by canpmsgout09.his.huawei.com (SkyGuard) with ESMTPS id 4hlqSz4c63z1cypG;
	Thu, 17 Sep 2026 16:59:47 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 46BEC4055B;
	Thu, 17 Sep 2026 17:10:46 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemk200008.china.huawei.com (7.202.194.74) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 17 Sep 2026 17:10:45 +0800
Message-ID: <03e261b4-10da-4530-b28a-5512e399d2e3@huawei.com>
Date: Thu, 17 Sep 2026 17:10:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/38] arm64: interrupts: Add common exception state
 helpers
To: Vladimir Murzin <vladimir.murzin@arm.com>,
	<linux-arm-kernel@lists.infradead.org>
CC: <catalin.marinas@arm.com>, <will@kernel.org>, <mark.rutland@arm.com>,
	<maz@kernel.org>, <lpieralisi@kernel.org>, <liaochang1@huawei.com>
References: <20260914102102.68597-1-vladimir.murzin@arm.com>
 <20260914102102.68597-4-vladimir.murzin@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260914102102.68597-4-vladimir.murzin@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemk200008.china.huawei.com (7.202.194.74)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_021055_131414_F682EEFB 
X-CRM114-Status: GOOD (  26.92  )
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
> The entry code and the rest of the kernel require different interrupt
> masking APIs, but all need a common representation of the hardware
> exception state.
> 
> Introduce exception contexts that map DAIF and PMR state to the
> corresponding masking context. Provide helpers to translate between
> exception contexts and hardware state and update the hardware state.
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
>  .../include/asm/interrupts/common_flags.h     | 174 ++++++++++++++++++
>  1 file changed, 174 insertions(+)
>  create mode 100644 arch/arm64/include/asm/interrupts/common_flags.h
> 
> diff --git a/arch/arm64/include/asm/interrupts/common_flags.h b/arch/arm64/include/asm/interrupts/common_flags.h
> new file mode 100644
> index 000000000000..0de5ba1ae155
> --- /dev/null
> +++ b/arch/arm64/include/asm/interrupts/common_flags.h
> @@ -0,0 +1,174 @@
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
Hi Vladimir,

This helper looks more related to the 5th patch "arm64: entry: Introduce
entry specific exception masking helpers", as it is entry-related.
Moving it to 5th patch may make it easier to review.

Best regards,
Jinjie

> +
> +static __always_inline
> +void __arm64_update_exc_hwstate(arm64_exc_hwstate_t hwstate, bool force)
> +{
> +	bool pseudo_nmi = system_uses_irq_prio_masking();
> +
> +	barrier();
> +
> +	if (pseudo_nmi && hwstate.pmr == GIC_PRIO_IRQOFF && force) {
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
> +	write_sysreg(hwstate.daif, daif);
> +
> +	if (pseudo_nmi && hwstate.pmr == GIC_PRIO_IRQON && force) {
> +		write_sysreg_s(hwstate.pmr, SYS_ICC_PMR_EL1);
> +		pmr_sync();
> +	}
> +
> +	barrier();
> +}
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


