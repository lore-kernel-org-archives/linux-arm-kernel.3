Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9855C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 08:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dF0dupBm0Zx1IEjqrPInQvm+q6+l1hX08pTeKIA53Jc=; b=BpcH8r4A8uR0et
	DajH0Kqsv3xEsPyBkYlFenUSjNx2QiyxavoZwR/H3OFCaxQge18SuGp334P/C7TOZZnwMj0Ym9VXy
	J9WRhAXZcEGn5YaXwJp4kF4KZ1a0j7IsuqRt9FHQJcohuWvmNMQgOm5W5W7y/cYZClytjQVKd6tsJ
	qWYJLag3uD7ch5iiX62GzC7H9yB17bFGrQA0rJoO4pD/q8WGUJgyAOIAf1Oob8Slved7XiYe23/ty
	uWmESATZYsyDc950Rtfb1n2nn+frOtnKOu9XlEm2Or3R2m6ZCqPB2i8e1nH4jxfzIMjXcUU4eMNyF
	HqUopYldtKdnd/0/rRKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi6E0-00000004PiB-1gNn;
	Fri, 10 Jul 2026 08:04:44 +0000
Received: from canpmsgout03.his.huawei.com ([113.46.200.218])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi6Dy-00000004PhP-0KpS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 08:04:43 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=dF0dupBm0Zx1IEjqrPInQvm+q6+l1hX08pTeKIA53Jc=;
	b=lsBt7vQXLGNcZVRgK3hkhm1qm/5HSS3sDsfOi3Om3YPD2utPtDStiecyZ2IZeqlvG/cP+JMn7
	PDGgCtuuLi8zpkMCtCRfpNPS/nowR6kjCYX3aMlqyT6eFxl7hnyLhEBSY6AHHsOnvZXcC44QUb5
	atcD2p9jim3wVdsNQOpKuHo=
Received: from mail.maildlp.com (unknown [172.19.162.197])
	by canpmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4gxPK10d9WzpSvB;
	Fri, 10 Jul 2026 15:55:49 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id B660240579;
	Fri, 10 Jul 2026 16:04:32 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 10 Jul 2026 16:04:32 +0800
Message-ID: <d6cf9f87-401f-4962-bef8-f8aee79aeeb9@huawei.com>
Date: Fri, 10 Jul 2026 16:04:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 08/36] irqchip/gic-v3: make the unmasking of
 pseudo-NMIs explicit when handling IRQs
To: Vladimir Murzin <vladimir.murzin@arm.com>,
	<linux-arm-kernel@lists.infradead.org>
References: <20260709121333.23507-1-vladimir.murzin@arm.com>
 <20260709121333.23507-9-vladimir.murzin@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260709121333.23507-9-vladimir.murzin@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_010442_445347_E7DFC84D 
X-CRM114-Status: GOOD (  20.39  )
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
> `gic_arch_enable_irqs()` is only used when handling IRQs (which could
> be pseudo-NMIs) and unmasking pseudo-NMIs.
> 
> The chain of `gic_pmr_mask_irqs()` and `gic_arch_enable_irqs()` for it
> is slightly confusing without further explanation.
> 
> Remove `gic_arch_enable_irqs()` and instead do the whole pseudo-NMI
> umasking in `gic_unmask_pnmis()`, making the operation explicit.
> 
> Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
> Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
> ---
>  arch/arm/include/asm/arch_gicv3.h     | 6 +-----
>  arch/arm64/include/asm/arch_gicv3.h   | 7 +++++--
>  arch/arm64/include/asm/entry-common.h | 2 +-
>  drivers/irqchip/irq-gic-v3.c          | 5 +----
>  4 files changed, 8 insertions(+), 12 deletions(-)
> 
> diff --git a/arch/arm/include/asm/arch_gicv3.h b/arch/arm/include/asm/arch_gicv3.h
> index 847590df7551..d4ac8d3271b1 100644
> --- a/arch/arm/include/asm/arch_gicv3.h
> +++ b/arch/arm/include/asm/arch_gicv3.h
> @@ -246,11 +246,7 @@ static inline void gic_pmr_mask_irqs(void)
>  	WARN_ON_ONCE(true);
>  }
>  
> -static inline void gic_arch_enable_irqs(void)
> -{
> -	/* Should not get called. */
> -	WARN_ON_ONCE(true);
> -}
> +static inline void gic_unmask_pnmis(void) {}
>  
>  static inline bool gic_has_relaxed_pmr_sync(void)
>  {
> diff --git a/arch/arm64/include/asm/arch_gicv3.h b/arch/arm64/include/asm/arch_gicv3.h
> index d20b03931a8d..3dcb7b8309d9 100644
> --- a/arch/arm64/include/asm/arch_gicv3.h
> +++ b/arch/arm64/include/asm/arch_gicv3.h
> @@ -178,9 +178,12 @@ static inline void gic_pmr_mask_irqs(void)
>  	gic_write_pmr(GIC_PRIO_IRQOFF);
>  }
>  
> -static inline void gic_arch_enable_irqs(void)
> +static inline void gic_unmask_pnmis(void)
>  {
> -	asm volatile ("msr daifclr, #3" : : : "memory");
> +	if (gic_prio_masking_enabled()) {
> +		gic_pmr_mask_irqs();
> +		asm volatile ("msr daifclr, #3" : : : "memory");
> +	}

LGTM
Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>

>  }
>  
>  static inline bool gic_has_relaxed_pmr_sync(void)
> diff --git a/arch/arm64/include/asm/entry-common.h b/arch/arm64/include/asm/entry-common.h
> index cab8cd78f693..1905765159aa 100644
> --- a/arch/arm64/include/asm/entry-common.h
> +++ b/arch/arm64/include/asm/entry-common.h
> @@ -32,7 +32,7 @@ static inline bool arch_irqentry_exit_need_resched(void)
>  	/*
>  	 * DAIF.DA are cleared at the start of IRQ/FIQ handling, and when GIC
>  	 * priority masking is used the GIC irqchip driver will clear DAIF.IF
> -	 * using gic_arch_enable_irqs() for normal IRQs. If anything is set in
> +	 * in gic_unmask_pnmis() for normal IRQs. If anything is set in
>  	 * DAIF we must have handled an NMI, so skip preemption.
>  	 */
>  	if (system_uses_irq_prio_masking() && read_sysreg(daif))
> diff --git a/drivers/irqchip/irq-gic-v3.c b/drivers/irqchip/irq-gic-v3.c
> index 99444a1b2ffa..94c6a3f2b009 100644
> --- a/drivers/irqchip/irq-gic-v3.c
> +++ b/drivers/irqchip/irq-gic-v3.c
> @@ -867,10 +867,7 @@ static void __gic_handle_irq_from_irqson(struct pt_regs *regs)
>  		nmi_exit();
>  	}
>  
> -	if (gic_prio_masking_enabled()) {
> -		gic_pmr_mask_irqs();
> -		gic_arch_enable_irqs();
> -	}
> +	gic_unmask_pnmis();
>  
>  	if (!is_nmi)
>  		__gic_handle_irq(irqnr, regs);


