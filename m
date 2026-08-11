Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FFBAC5CFCF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 08:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qtC4bZ4oiS+jDaJBObfI6XLhYsuBsmJEi4axBF+WMao=; b=JrdKDEDPahomGeXh4UsfcKrDvs
	qIqaQhPdbxNnXqFyth4EqueBeu5fCQ4nV/sL/DnCE5bSVh+uoHfM9WQjaKJ2y4DIo77VOBR2kUBzr
	h8WJPH3LhSQVim6A6gncw1LlHcR2lq1/DJn5abfG/RvmFIJV/o0EOh6iPJnpH8f+C11DxgyRREHxH
	Yg8Bm/wum5fOEpPuqA8aHkghRsfb1pl9GlF6RkkoZ7e3NmJsAXHEpltJn5hpJ4YvXY3dy5UF02UdN
	/vHV8e5W3rD1pxlCc9niYNWMmPvjrEyjDSH5o+J1ry5eHUrXttsSn97KKYOt2rbnd8xUcHbeGqN0v
	BrIChOUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtiKm-0000000DflG-2JAf;
	Tue, 11 Aug 2026 08:59:44 +0000
Received: from canpmsgout09.his.huawei.com ([113.46.200.224])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtiKi-0000000DfkP-2EPM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 08:59:42 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=qtC4bZ4oiS+jDaJBObfI6XLhYsuBsmJEi4axBF+WMao=;
	b=Y4ksyhwBasFbFVwS6cE35hsu5Kv8+AZMy4imSWAKo+GUF0RBbWM37xcnEPivykn6+vQ9nhewS
	sWPrCZlBXi/eOCA5Sy3brCWWYLUTOiGgm6td/RiR56aka0Y0STFyz7xPrJsfSDUjJX7QhrMYC1R
	IgMdRczB3vBgF6HXqT8cvGg=
Received: from mail.maildlp.com (unknown [172.19.163.163])
	by canpmsgout09.his.huawei.com (SkyGuard) with ESMTPS id 4hK4zW6jS2z1cyQN;
	Tue, 11 Aug 2026 16:48:55 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 8B1F84057A;
	Tue, 11 Aug 2026 16:59:31 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 11 Aug 2026 16:59:31 +0800
Message-ID: <39b86a06-291f-46b3-8bef-4c0835b9a8bd@huawei.com>
Date: Tue, 11 Aug 2026 16:59:30 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 19/45] arm64: cpuidle: use new helpers to bypass
 interrupt priority masking
To: Vladimir Murzin <vladimir.murzin@arm.com>,
	<linux-arm-kernel@lists.infradead.org>
CC: <mark.rutland@arm.com>, <maz@kernel.org>, <will@kernel.org>,
	<catalin.marinas@arm.com>, <liaochang1@huawei.com>
References: <20260727163453.7969-1-vladimir.murzin@arm.com>
 <20260727163453.7969-20-vladimir.murzin@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260727163453.7969-20-vladimir.murzin@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_015941_220569_979FB1E1 
X-CRM114-Status: GOOD (  29.11  )
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
>  arch/arm64/include/asm/cpuidle.h            | 18 ++----
>  arch/arm64/include/asm/interrupts/masking.h | 61 +++++++++++++++++++++
>  2 files changed, 65 insertions(+), 14 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/cpuidle.h b/arch/arm64/include/asm/cpuidle.h
> index 2047713e097d..b70ef5fd5e57 100644
> --- a/arch/arm64/include/asm/cpuidle.h
> +++ b/arch/arm64/include/asm/cpuidle.h
> @@ -5,32 +5,22 @@
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
> -		if (system_uses_irq_prio_masking()) {			\
> -			c->daif_bits = read_sysreg(daif);		\
> -			write_sysreg(c->daif_bits | PSR_I_BIT | PSR_F_BIT, \
> -				     daif);				\
> -			c->pmr = gic_read_pmr();			\
> -			gic_write_pmr(GIC_PRIO_IRQON | GIC_PRIO_PSR_I_SET); \
> -		}							\
> +		c->arm64_context = local_exceptions_force_daif_save(); 	\
>  	} while (0)
>  
>  #define arm_cpuidle_restore_irq_context(__c)				\
>  	do {								\
>  		struct arm_cpuidle_irq_context *c = __c;		\
> -		if (system_uses_irq_prio_masking()) {			\
> -			gic_write_pmr(c->pmr);				\
> -			write_sysreg(c->daif_bits, daif);		\
> -		}							\
> +		local_exceptions_force_daif_restore(c->arm64_context);	\
>  	} while (0)
>  #else
>  struct arm_cpuidle_irq_context { };
> diff --git a/arch/arm64/include/asm/interrupts/masking.h b/arch/arm64/include/asm/interrupts/masking.h
> index 193089fda252..e13852442062 100644
> --- a/arch/arm64/include/asm/interrupts/masking.h
> +++ b/arch/arm64/include/asm/interrupts/masking.h
> @@ -89,6 +89,67 @@ static inline void local_exceptions_final_mask(void)
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
> +static inline arm64_exc_hwstates_t local_exceptions_force_daif_save(void)
> +{
> +	arm64_exc_hwstates_t states = {};
> +
> +	if (!system_uses_irq_prio_masking())
> +		return states;
> +
> +	/*
> +	 * Cannot use lockdep_assert here as idle entry enables hardirqs
> +	 * while keeping interrupts masked.
> +	 */
> +	WARN_ON_ONCE(!irqs_disabled());
> +
> +	states.saved.daif = read_sysreg(daif);
> +	states.saved.pmr = read_sysreg_s(SYS_ICC_PMR_EL1);

I'd suggest using gic_read_pmr() as it aligns better with the original
implementation.

> +	/*
> +	 * We might have IF set or unset. In case IF already set orring with IF
> +	 * won't change anything, combined with PMR set to IRQON we might become
> +	 * one of contexts: CRITICAL, ERROR or NONMI. In case IF is unset (which
> +	 * also implies that DA is unset) orring with IF and combining with PMR
> +	 * set to IRQON would effectively gives us NONMI context.
> +	 */

The comment seems redundant to me, because __arm64_update_exc_hwstate()
only needs the hwstate parameter and has no dependency on the context type.

Otherwise, LGTM
Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>

> +	states.expected.daif = states.saved.daif | DAIF_PROCCTX_NOIRQ;
> +	states.expected.pmr = GIC_PRIO_IRQON;
> +
> +	arm64_update_exc_hwstate(states.expected);
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
> +void local_exceptions_force_daif_restore(arm64_exc_hwstates_t states)
> +{
> +	if (!system_uses_irq_prio_masking())
> +		return;
> +
> +	/*
> +	 * Cannot use lockdep_assert here as idle entry enables hardirqs
> +	 * while keeping interrupts masked.
> +	 */
> +	WARN_ON_ONCE(!irqs_disabled());
> +
> +	arm64_debug_exc_hwstate(states.expected);
> +	arm64_update_exc_hwstate(states.saved);
> +}
> +
>  /*
>   * During early boot, we unmask PSR.DA before the GIC has been set up.
>   * If we use IRQ priority masking, the PMR and PSR will be out of sync


