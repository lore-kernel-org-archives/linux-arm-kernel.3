Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 439A7C53219
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 03:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W6UZlojZPD6eR5Zmm9raJSSGpa5c7JoSLng93LMymy8=; b=EtPhplbG6JQeXTJB0uD0CYuJep
	jka40TBN1lhK3/96W/GYaAqt9Tp1HByElkprB/VkfesGqVT7IEUfk45GZUn26mGASwQ35HmEQ5g/K
	NHM57+USnIT/6cYm8ylI6ttuOELY6rsyXBEuEUIVEBrkCybe1LCTYnsPj7nmlS6JlftrB63HQLD4K
	HOcS4IxpTtRzuy0labLdGntVTEs0BPUhHNDCIbjWX4UrB+97AV87duYoN0vc79fSFhNTXo2YS4X1X
	wRp65TpNzH311eM8tm0nb8ql7fdvaouIQNrJQRPlJNtdpdLwOOzd83NkCbw0x4CaBa0RFXNvVAZL0
	o6oi/iFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woYmT-00000004La8-24uJ;
	Tue, 28 Jul 2026 03:47:01 +0000
Received: from canpmsgout09.his.huawei.com ([113.46.200.224])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woYmQ-00000004LZ2-1MoK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 03:47:00 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=W6UZlojZPD6eR5Zmm9raJSSGpa5c7JoSLng93LMymy8=;
	b=pQu6rIy0b807lx5YKIbURc9BBUPob+LftllZ8wiK8Gh190PLmrCgUO725ugU3BCS4Aw2rHZ/l
	h5HJ1z7+M2qKHQpM++0yHB/2PQCmUN3ybhrHUqdbafu+sDlejUUiXZn2C6sFvH1vvWlGocFC3Oy
	Q4jH9+e/aYM/II41vbOSix0=
Received: from mail.maildlp.com (unknown [172.19.163.127])
	by canpmsgout09.his.huawei.com (SkyGuard) with ESMTPS id 4h8LkX5P6Tz1cyVf;
	Tue, 28 Jul 2026 11:37:24 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 8FA59402AB;
	Tue, 28 Jul 2026 11:46:49 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 28 Jul 2026 11:46:48 +0800
Message-ID: <3e95b25b-1f02-4a30-a56b-7ec809badf11@huawei.com>
Date: Tue, 28 Jul 2026 11:46:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 11/45] arm64: irqflags: save and use both DAIF and
 PMR
To: Vladimir Murzin <vladimir.murzin@arm.com>,
	<linux-arm-kernel@lists.infradead.org>
CC: <mark.rutland@arm.com>, <maz@kernel.org>, <will@kernel.org>,
	<catalin.marinas@arm.com>, <liaochang1@huawei.com>
References: <20260727163453.7969-1-vladimir.murzin@arm.com>
 <20260727163453.7969-12-vladimir.murzin@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260727163453.7969-12-vladimir.murzin@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_204659_006782_5BC23F2C 
X-CRM114-Status: GOOD (  27.58  )
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

This commit message need to be updated, we now do not use "<"

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
>  arch/arm64/include/asm/irqflags.h | 118 +++++++-----------------------
>  arch/arm64/include/asm/ptrace.h   |  18 +++--
>  2 files changed, 38 insertions(+), 98 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/irqflags.h b/arch/arm64/include/asm/irqflags.h
> index 1863a955d119..50720a01bde4 100644
> --- a/arch/arm64/include/asm/irqflags.h
> +++ b/arch/arm64/include/asm/irqflags.h
> @@ -96,135 +96,69 @@ static __always_inline void arch_local_irq_disable(void)
>  	}
>  }
>  

[...]

> -
> -static __always_inline unsigned long __pmr_local_irq_save(void)
> +static __always_inline unsigned long arch_local_irq_save(void)
>  {
> -	unsigned long flags = __pmr_local_save_flags();
> +	unsigned long flags = arch_local_save_flags();
>  
> -	/*
> -	 * There are too many states with IRQs disabled, just keep the current
> -	 * state if interrupts are already disabled/masked.
> -	 */
> -	if (!__pmr_irqs_disabled_flags(flags))
> +	if (system_uses_irq_prio_masking())
>  		__pmr_local_irq_disable();
> +	else
> +		__daif_local_irq_disable();


Now we do not check whether pmr is GIC_PRIO_IRQON for
__pmr_local_irq_disable(), however, it doesn't seem to be mentioned
in the commit message.


And the previous "arm64: suspend: Initialize PMR on resume" patch should
be merged into this patch, Otherwise, you cannot understand its commit
message or associate it with the patch.

>  
>  	return flags;
>  }
>  

[..]

>  }
>  
>  #endif /* __ASM_IRQFLAGS_H */
> diff --git a/arch/arm64/include/asm/ptrace.h b/arch/arm64/include/asm/ptrace.h
> index f7dc5fb9427d..e4c7e6bafa3d 100644
> --- a/arch/arm64/include/asm/ptrace.h
> +++ b/arch/arm64/include/asm/ptrace.h
> @@ -203,14 +203,20 @@ static inline void forget_syscall(struct pt_regs *regs)
>  #define processor_mode(regs) \
>  	((regs)->pstate & PSR_MODE_MASK)
>  
> -#define irqs_priority_unmasked(regs)					\
> -	(system_uses_irq_prio_masking() ?				\
> -		(regs)->pmr == GIC_PRIO_IRQON :				\
> -		true)
> -
>  static __always_inline bool regs_irqs_disabled(const struct pt_regs *regs)
>  {
> -	return (regs->pstate & PSR_I_BIT) || !irqs_priority_unmasked(regs);
> +	if (regs->pstate & PSR_I_BIT)
> +		return true;
> +
> +	if (system_uses_irq_prio_masking()) {
> +		WARN_ON_ONCE(IS_ENABLED(CONFIG_DEBUG_IRQFLAGS) &&
> +			     regs->pmr != GIC_PRIO_IRQOFF &&
> +			     regs->pmr != GIC_PRIO_IRQON);
> +
> +		return regs->pmr != GIC_PRIO_IRQON;
> +	}
> +
> +	return false;

Looks fine to me.

otherwise, LGTM
Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>

>  }
>  
>  #define interrupts_enabled(regs)	(!regs_irqs_disabled(regs))


