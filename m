Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0CE8C44533
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 08:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iCt+W24qHMFaTA0Io95tX4AdmwGE6NhPJNdH8ob9BSs=; b=pSUJ/EE41IHVCb
	WFhij8d+CWwf3niILziMkjVhfvosJByhb94kITQNAu064VjB1Sw1zi58R/qUimVofH28nbH/aOz5/
	R6lFS0Gnbm8+5x4qTySrgY0a3uExUsJmM7OoI0T+A5ECR+oDIukCUk/Kdv2FUluBXq1/SIfgB1tNH
	6kEeBlqCkWbzyXCmFf5JKAFiTO3U0pLhOAEaB6mzfVGTBFLOhjjlkzli70oQbb6mXugUSZ93raho4
	YITeu86kIGtpc8Yh7fbbqAVg3voXA4IPGcqpWtBMautOGpwiy8jLGqnaU065gY5zB5AAfdiFRZb+j
	mKJpwaqKuiI1lelbUPBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmST8-0000000BHJi-13Ji;
	Wed, 22 Jul 2026 08:38:22 +0000
Received: from canpmsgout08.his.huawei.com ([113.46.200.223])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmST4-0000000BHIP-00iz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 08:38:20 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=iCt+W24qHMFaTA0Io95tX4AdmwGE6NhPJNdH8ob9BSs=;
	b=3aR+YNQlbyC2XGcL5L9kIiX2M+2GeKbBn9HSWeNQR4Rq+kI9u6cfDOQzaN9Fxl0fqFwTvx6pm
	sxeJsE2kbuW+Z6B/fzaPAnciop4CjCRpckUkiGNokgJIR+ELR4mLk8AnMfQMVqdCsWFmK6/in3O
	DLpfdEKTspwhx03priWz8PE=
Received: from mail.maildlp.com (unknown [172.19.163.15])
	by canpmsgout08.his.huawei.com (SkyGuard) with ESMTPS id 4h4nTT72WhzmVXs;
	Wed, 22 Jul 2026 16:28:45 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id CFCB640578;
	Wed, 22 Jul 2026 16:38:08 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 22 Jul 2026 16:38:08 +0800
Message-ID: <a8e3e9da-feca-4876-84f7-ddbb1e3d34c8@huawei.com>
Date: Wed, 22 Jul 2026 16:38:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 16/36] arm64: cpuidle: use new helpers to bypass
 interrupt priority masking
To: Vladimir Murzin <vladimir.murzin@arm.com>,
	<linux-arm-kernel@lists.infradead.org>
References: <20260709121333.23507-1-vladimir.murzin@arm.com>
 <20260709121333.23507-17-vladimir.murzin@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260709121333.23507-17-vladimir.murzin@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_013818_388925_6DFD62E7 
X-CRM114-Status: GOOD (  30.29  )
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
> When the CPU goes into WFI and pseudo-NMIs are in use, we need to make
> sure that interrupts are not masked by the PMR otherwise they would not
> reach the CPU and wake it up.
> 
> Now that we have a proper API that handles both DAIF and PMR, extend it
> to provide helpers allowing to temporarily switch to masking interrupts
> via DAIF only when interrupt priorities are in use.
> This could allow other parts of the code to make use of it and makes it
> easier to check for proper use.
> 
> Replace the custom cpuidle helper with those new helpers.
> 
> Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
> Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
> ---
>  arch/arm64/include/asm/cpuidle.h            | 14 ++---
>  arch/arm64/include/asm/interrupts/masking.h | 58 +++++++++++++++++++++
>  2 files changed, 62 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/cpuidle.h b/arch/arm64/include/asm/cpuidle.h
> index 2047713e097d..0c7ccdaf1832 100644
> --- a/arch/arm64/include/asm/cpuidle.h
> +++ b/arch/arm64/include/asm/cpuidle.h
> @@ -5,22 +5,17 @@
>  #include <asm/proc-fns.h>
>  
>  #ifdef CONFIG_ARM64_PSEUDO_NMI
> -#include <asm/arch_gicv3.h>
> +#include <asm/interrupts/masking.h>
>  
>  struct arm_cpuidle_irq_context {
> -	unsigned long pmr;
> -	unsigned long daif_bits;
> +	arm64_exc_hwstates_t arm64_context;
>  };
>  
>  #define arm_cpuidle_save_irq_context(__c)				\
>  	do {								\
>  		struct arm_cpuidle_irq_context *c = __c;		\
>  		if (system_uses_irq_prio_masking()) {			\
> -			c->daif_bits = read_sysreg(daif);		\
> -			write_sysreg(c->daif_bits | PSR_I_BIT | PSR_F_BIT, \
> -				     daif);				\
> -			c->pmr = gic_read_pmr();			\
> -			gic_write_pmr(GIC_PRIO_IRQON | GIC_PRIO_PSR_I_SET); \
> +			c->arm64_context = local_all_irqs_force_daif_save(); \
>  		}							\
>  	} while (0)
>  
> @@ -28,8 +23,7 @@ struct arm_cpuidle_irq_context {
>  	do {								\
>  		struct arm_cpuidle_irq_context *c = __c;		\
>  		if (system_uses_irq_prio_masking()) {			\
> -			gic_write_pmr(c->pmr);				\
> -			write_sysreg(c->daif_bits, daif);		\
> +			local_all_irqs_force_daif_restore(c->arm64_context); \
>  		}							\
>  	} while (0)
>  #else
> diff --git a/arch/arm64/include/asm/interrupts/masking.h b/arch/arm64/include/asm/interrupts/masking.h
> index 19d32618b2b9..9dc37a571094 100644
> --- a/arch/arm64/include/asm/interrupts/masking.h
> +++ b/arch/arm64/include/asm/interrupts/masking.h
> @@ -99,6 +99,64 @@ static inline void local_all_irqs_final_mask(void)
>  }
>  #endif /* CONFIG_DEBUG_IRQFLAGS */
>  
> +/*
> + * In some cases, WFI or guest entry for example, we always want interrupts
> + * to reach the CPU even if masked. Masking via the PMR prevents them from
> + * reaching the CPU and waking it up.
> + * Force IRQ masking using DAIF by raising the priority mask
> + * and setting the IF flags.
> + *
> + * Should only be called when IRQs are already masked.
> + */
> +static inline arm64_exc_hwstates_t local_all_irqs_force_daif_save(void)
> +{
> +	arm64_exc_hwstates_t states = {};
> +	/*
> +	 * Cannot use lockdep_assert here as idle entry enables hardirqs
> +	 * while keeping interrupts masked.
> +	 */
> +	WARN_ON_ONCE(!irqs_disabled());
> +
> +	if (system_uses_irq_prio_masking()) {
> +	        states.saved.daif = read_sysreg(daif);
> +	        states.saved.pmr = read_sysreg_s(SYS_ICC_PMR_EL1);
> +		/*
> +		 * We might have IF set or unset. In case IF already set orring with IF
> +		 * won't change anything, combined with PMR set to IRQON we might become
> +		 * one of contexts: CRITICAL, ERROR or NONMI. In case IF is unset (which
> +		 * also implies that DA is unset) orring with IF and combining with PMR
> +		 * set to IRQON would effectively gives us NONMI context.
> +		 */
> +		states.expected.daif = states.saved.daif | DAIF_PROCCTX_NOIRQ;
> +		states.expected.pmr = GIC_PRIO_IRQON;
> +
> +		arm64_update_exc_hwstate(states.expected, true);
> +	}
> +
> +	return states;
> +}
> +
> +/*
> + * Return to masking with the PMR, restoring previously saved DAIF and PMR.
> + *
> + * IRQs or interrupt priority masking should not have been re-enabled in between
> + * the save and restore.
> + */
> +static inline
> +void local_all_irqs_force_daif_restore(arm64_exc_hwstates_t states)
> +{
> +	/*
> +	 * Cannot use lockdep_assert here as idle entry enables hardirqs
> +	 * while keeping interrupts masked.
> +	 */
> +	WARN_ON_ONCE(!irqs_disabled());
> +
> +	if (system_uses_irq_prio_masking()) {
> +		arm64_debug_exc_hwstate(states.expected);
> +		arm64_update_exc_hwstate(states.saved, true);
> +	}
> +}

The newly introduced two helper functions seem to have been used only
once in the end, and they do not update ALLINT. So, is it necessary to
introduce these two helpers?

> +
>  /*
>   * During early boot, we unmask PSR.DA before the GIC has been set up.
>   * If we use IRQ priority masking, the PMR and PSR will be out of sync


