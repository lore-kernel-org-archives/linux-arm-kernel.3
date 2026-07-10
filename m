Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EF36C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 03:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kdVXIccc27pdlengY0Rbvc8vz0TgXdo86jpzun7Afb0=; b=D3xjV7sLxIkc1TBeLnRIYm1OYX
	/j+7vmyvkzO/VItcmtxCZsJ22lVzpPmWKTtLmzrwBFcAKShmMwcv39R+MvD9pDHHfmwWMVTXz6pj3
	aD5oDHv6XIn7znmnwwEr6ry7eBvy5x4rGMuDQSOU8nkPWAHOUbDvyp42hYN1nr9QVSVgDWk/HM4zR
	r4SkEJxuLtcpH1MF9bMbCJk4pVcRW7TOclElM4DiZ+srEXsB55fY84haiJZYiOH5Pe4adTrwMCtco
	CP2T9fxhtIw0moUfQ8J9L8vpILIhusVN4wNOE/PDsNtgUttBQy87t73Kz1sF6qt0dbWvKf9T0HJ4i
	YYwSEP4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi2Iv-00000004446-0cER;
	Fri, 10 Jul 2026 03:53:33 +0000
Received: from canpmsgout01.his.huawei.com ([113.46.200.216])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi2Ir-0000000443f-3DTG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 03:53:31 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=kdVXIccc27pdlengY0Rbvc8vz0TgXdo86jpzun7Afb0=;
	b=xwrqKAKylLQe1+/BtDAx+3Fo8oSahPdOgCZqKUU44QJq6sXdKFhKwzBUMN/zSjZFjlHO987cI
	P0zB7PHI69RnhJnIg623uqNHUXksWjxqQ/eqhcDuufmFdgJMYacpxCu3b30z3fveJbgWte8X8eX
	4wmF2oXOYWVIQfY7/vjfXcM=
Received: from mail.maildlp.com (unknown [172.19.162.144])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4gxHkp6TMFz1T4G6;
	Fri, 10 Jul 2026 11:44:18 +0800 (CST)
Received: from dggemv706-chm.china.huawei.com (unknown [10.3.19.33])
	by mail.maildlp.com (Postfix) with ESMTPS id 1F9DF4056E;
	Fri, 10 Jul 2026 11:53:22 +0800 (CST)
Received: from kwepemq200011.china.huawei.com (7.202.195.155) by
 dggemv706-chm.china.huawei.com (10.3.19.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 10 Jul 2026 11:53:17 +0800
Received: from [10.67.110.108] (10.67.110.108) by
 kwepemq200011.china.huawei.com (7.202.195.155) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 10 Jul 2026 11:53:17 +0800
Message-ID: <73bfbebb-e8fd-4b6c-b0e4-8f7d5b09b6af@huawei.com>
Date: Fri, 10 Jul 2026 11:53:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 10/36] arm64: irqflags: save and use both DAIF and PMR
To: Vladimir Murzin <vladimir.murzin@arm.com>,
	<linux-arm-kernel@lists.infradead.org>
CC: <mark.rutland@arm.com>, <maz@kernel.org>, <ruanjinjie@huawei.com>,
	<catalin.marinas@arm.com>, <will@kernel.org>
References: <20260709121333.23507-1-vladimir.murzin@arm.com>
 <20260709121333.23507-11-vladimir.murzin@arm.com>
From: "Liao, Chang" <liaochang1@huawei.com>
In-Reply-To: <20260709121333.23507-11-vladimir.murzin@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.110.108]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemq200011.china.huawei.com (7.202.195.155)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_205330_114504_F2F5304F 
X-CRM114-Status: GOOD (  28.55  )
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
> With pseudo-NMIs enabled, both DAIF and the PMR affect interrupt masking.
> Now that we have a type which can track both of them at the same time,
> update our irqflags implementation to use it.
> 
> Save DAIF flags in all cases, as they can be manipulated directly by other
> code, and the PMR if it is in use.
> 
> When checking if IRQs are disabled, now that we always save DAIF we can
> check that the I flag is set and bypass checking the PMR if it is.
> We can also properly check if PMR masks interrupts (PMR < GIC_PRIO_IRQON),
> now that we don't need to rely on the GIC_PRIO_PSR_I_SET bit being set in
> the PMR to know if DAIF is already masking interrupts.
> Update `irqs_priority_unmasked()` to align with this change.
> 
> This allows us to remove the `__daif_...` and `__pmr_...` versions
> of the save and check functions, as they are now unified.
> 
> We can reasonably merge the two `__{daif,pmr}_irq_restore()` functions
> in the main one, as the DAIF and PMR values are properly split now.
> 
> Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
> Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
> ---
>  arch/arm64/include/asm/irqflags.h | 110 ++++++------------------------
>  arch/arm64/include/asm/ptrace.h   |   2 +-
>  2 files changed, 23 insertions(+), 89 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/irqflags.h b/arch/arm64/include/asm/irqflags.h
> index 7775904ba6a9..62f047702493 100644
> --- a/arch/arm64/include/asm/irqflags.h
> +++ b/arch/arm64/include/asm/irqflags.h
> @@ -95,117 +95,48 @@ static __always_inline void arch_local_irq_disable(void)
>  	}
>  }
>  
> -static __always_inline arm64_exc_hwstate_t __daif_local_save_flags(void)
> -{
> -	return (arm64_exc_hwstate_t){ .daif = read_sysreg(daif) };
> -}
> -
> -static __always_inline arm64_exc_hwstate_t __pmr_local_save_flags(void)
> -{
> -	return (arm64_exc_hwstate_t){ .pmr = read_sysreg_s(SYS_ICC_PMR_EL1) };
> -}
> -
>  /*
>   * Save the current interrupt enable state.
>   */
>  static __always_inline unsigned long arch_local_save_flags(void)
>  {
> -	if (system_uses_irq_prio_masking()) {
> -		return __pmr_local_save_flags().flags;
> -	} else {
> -		return __daif_local_save_flags().flags;
> -	}
> -}
> +	arm64_exc_hwstate_t hwstate = { .daif = read_sysreg(daif) };
>  
> -static __always_inline
> -bool __daif_irqs_disabled_flags(arm64_exc_hwstate_t hwstate)
> -{
> -	return hwstate.daif & PSR_I_BIT;
> -}
> +	if (system_uses_irq_prio_masking())
> +		hwstate.pmr = read_sysreg_s(SYS_ICC_PMR_EL1);
>  
> -static __always_inline
> -bool __pmr_irqs_disabled_flags(arm64_exc_hwstate_t hwstate)
> -{
> -	return hwstate.pmr != GIC_PRIO_IRQON;
> +	return hwstate.flags;
>  }
>  
>  static __always_inline bool arch_irqs_disabled_flags(unsigned long flags)
>  {
>  	arm64_exc_hwstate_t hwstate = { .flags = flags };
>  
> -	if (system_uses_irq_prio_masking()) {
> -		return __pmr_irqs_disabled_flags(hwstate);
> -	} else {
> -		return __daif_irqs_disabled_flags(hwstate);
> -	}
> -}
> +	/* If I is set, the PMR doesn't matter: interrupts will not be taken. */
> +	if (hwstate.daif & PSR_I_BIT)
> +		return true;
>  
> -static __always_inline bool __daif_irqs_disabled(void)
> -{
> -	return __daif_irqs_disabled_flags(__daif_local_save_flags());
> -}
> +	if (system_uses_irq_prio_masking() && hwstate.pmr < GIC_PRIO_IRQON)
> +		return true;
>  
> -static __always_inline bool __pmr_irqs_disabled(void)
> -{
> -	return __pmr_irqs_disabled_flags(__pmr_local_save_flags());
> +	return false;
>  }
>  
>  static __always_inline bool arch_irqs_disabled(void)
>  {
> -	if (system_uses_irq_prio_masking()) {
> -		return __pmr_irqs_disabled();
> -	} else {
> -		return __daif_irqs_disabled();
> -	}
> -}
> -
> -static __always_inline arm64_exc_hwstate_t __daif_local_irq_save(void)
> -{
> -	arm64_exc_hwstate_t hwstate = __daif_local_save_flags();
> -
> -	__daif_local_irq_disable();
> -
> -	return hwstate;
> -}
> -
> -static __always_inline arm64_exc_hwstate_t __pmr_local_irq_save(void)
> -{
> -	arm64_exc_hwstate_t hwstate = __pmr_local_save_flags();
> -
> -	/*
> -	 * There are too many states with IRQs disabled, just keep the current
> -	 * state if interrupts are already disabled/masked.
> -	 */
> -	if (!__pmr_irqs_disabled_flags(hwstate))
> -		__pmr_local_irq_disable();
> -
> -	return hwstate;
> +	return arch_irqs_disabled_flags(arch_local_save_flags());
>  }
>  
>  static __always_inline unsigned long arch_local_irq_save(void)
>  {
> -	if (system_uses_irq_prio_masking()) {
> -		return __pmr_local_irq_save().flags;
> -	} else {
> -		return __daif_local_irq_save().flags;
> -	}
> -}
> +	unsigned long flags = arch_local_save_flags();
>  
> -static __always_inline
> -void __daif_local_irq_restore(arm64_exc_hwstate_t hwstate)
> -{
> -	barrier();
> -	write_sysreg(hwstate.daif, daif);
> -	barrier();
> -}
> +	if (system_uses_irq_prio_masking())
> +		__pmr_local_irq_disable();
> +	else
> +		__daif_local_irq_disable();
>  
> -static __always_inline
> -void __pmr_local_irq_restore(arm64_exc_hwstate_t hwstate)
> -{
> -	barrier();
> -	write_sysreg_s(hwstate.pmr, SYS_ICC_PMR_EL1);
> -	pmr_sync();
> -	barrier();
> +	return flags;
>  }
>  
>  /*
> @@ -215,11 +146,14 @@ static __always_inline void arch_local_irq_restore(unsigned long flags)
>  {
>  	arm64_exc_hwstate_t hwstate = { .flags = flags };
>  
> +	barrier();
>  	if (system_uses_irq_prio_masking()) {
> -		__pmr_local_irq_restore(hwstate);
> +		write_sysreg_s(hwstate.pmr, SYS_ICC_PMR_EL1);
> +		pmr_sync();
>  	} else {
> -		__daif_local_irq_restore(hwstate);
> +		write_sysreg(hwstate.daif, daif);
>  	}
> +	barrier();
>  }
>  
>  #endif /* __ASM_IRQFLAGS_H */
> diff --git a/arch/arm64/include/asm/ptrace.h b/arch/arm64/include/asm/ptrace.h
> index f7dc5fb9427d..192eb97cd50b 100644
> --- a/arch/arm64/include/asm/ptrace.h
> +++ b/arch/arm64/include/asm/ptrace.h
> @@ -205,7 +205,7 @@ static inline void forget_syscall(struct pt_regs *regs)
>  
>  #define irqs_priority_unmasked(regs)					\
>  	(system_uses_irq_prio_masking() ?				\
> -		(regs)->pmr == GIC_PRIO_IRQON :				\
> +		(regs)->pmr >= GIC_PRIO_IRQON :				\
>  		true)
>  
>  static __always_inline bool regs_irqs_disabled(const struct pt_regs *regs)

Is there any reason to keep interrupt_enabled()? It appears to be rarely used
across interrupt and exception code. So far, i've only found a single use in
gic_handle_irq(), corret me if i'm wrong. So using regs_irqs_disable() directly
might reduce the number of small helper that people need to remember.

-- 
BR
Liao, Chang

