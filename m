Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D83EFC53219
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 12:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sUDxMejfGZzplB3jikSoQk6C4y+DyAy+Fo2ekjKlXng=; b=iyrl+GG9FXf0x1AYPe3i6MOHrl
	PKL9NGzY6/1l7j6AvwSyyONcMRFadyzcBYArLGxLRMex3hMMnROk2a+Qr5CMvNgCWapSmXl5gwVcF
	yRLYhFQTWHvntgruPqVYKeBTPoq++9D9gIP+V4rMfzN78nSPng/QVvum5xXg+dK8aPlTf2S5NKUU/
	Nawieqkk2ayF9hjBEs4UML6XPGUAy7YUbSgMEDp1z7iFLY3vl2WSyww8PFFmIvLgcK1QcncLzta8i
	SkTSFkyeG6ACLu8wlw9L7PtaUbFDFIH1/WUeZuf+dONbwHGzovipLwDbts9PJc5Fh/3Y/7Dw44DDx
	J7hndlRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wogwd-00000005FLR-397E;
	Tue, 28 Jul 2026 12:30:03 +0000
Received: from canpmsgout04.his.huawei.com ([113.46.200.219])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wogwb-00000005FKK-22GP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 12:30:03 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=sUDxMejfGZzplB3jikSoQk6C4y+DyAy+Fo2ekjKlXng=;
	b=UAo8sCjsUTQxfnNXyGzyqJgMn4tKB9oUWMGB0lUO2aai5Q8y1nNnnr+IYTASecmG5nNHztRJO
	aWK1w6+JNHiWAirytuDdVbUXyH1rS0w3g09uNY0R/tQnE4hxPReCOMyfM9eLvDbK5GRZI0tAHjz
	Z+zy5YdUl12QtTregkIcp3g=
Received: from mail.maildlp.com (unknown [172.19.162.140])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4h8ZKy1Fkzz1prKd;
	Tue, 28 Jul 2026 20:20:22 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id B5725202E6;
	Tue, 28 Jul 2026 20:29:50 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 28 Jul 2026 20:29:50 +0800
Message-ID: <a61ab3b2-eacb-4988-9f35-4ade98fa9489@huawei.com>
Date: Tue, 28 Jul 2026 20:29:49 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 41/45] irqchip/gic-v3: Prepare for FEAT_GICv3_NMI
 support
To: Vladimir Murzin <vladimir.murzin@arm.com>,
	<linux-arm-kernel@lists.infradead.org>
CC: <mark.rutland@arm.com>, <maz@kernel.org>, <will@kernel.org>,
	<catalin.marinas@arm.com>, <liaochang1@huawei.com>
References: <20260727163453.7969-1-vladimir.murzin@arm.com>
 <20260727163453.7969-42-vladimir.murzin@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260727163453.7969-42-vladimir.murzin@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_053001_856586_426EF35C 
X-CRM114-Status: GOOD (  20.40  )
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

The title "irqchip/gic-v3: Rename *nmi* to *pseudo_nmi*" will be more clear

otherwise LGTM
Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>

在 2026/7/28 0:34, Vladimir Murzin 写道:
> From: Lorenzo Pieralisi <lpieralisi@kernel.org>
> 
> Support for FEAT_GICv3_NMI is coming. Currently, the terms "NMI" and
> "pseudo-NMI" are used interchangeably. Rename helper functions and
> variables related to pseudo-NMI to make the code paths clearer and
> more explicit.
> 
> Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
> Signed-off-by: Mark Brown <broonie@kernel.org>
> Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
> Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
> ---
>  drivers/irqchip/irq-gic-v3.c | 28 ++++++++++++++--------------
>  1 file changed, 14 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/irqchip/irq-gic-v3.c b/drivers/irqchip/irq-gic-v3.c
> index 94c6a3f2b009..c75acd5f9e7f 100644
> --- a/drivers/irqchip/irq-gic-v3.c
> +++ b/drivers/irqchip/irq-gic-v3.c
> @@ -87,7 +87,7 @@ static DEFINE_STATIC_KEY_TRUE(supports_deactivate_key);
>  #define GIC_LINE_NR	min(GICD_TYPER_SPIS(gic_data.rdists.gicd_typer), 1020U)
>  #define GIC_ESPI_NR	GICD_TYPER_ESPIS(gic_data.rdists.gicd_typer)
>  
> -static bool nmi_support_forbidden;
> +static bool pseudo_nmi_support_forbidden;
>  
>  /*
>   * There are 16 SGIs, though we only actually use 8 in Linux. The other 8 SGIs
> @@ -117,7 +117,7 @@ static bool nmi_support_forbidden;
>   * - Figure 4-7 Secure read of the priority field for a Non-secure Group 1
>   *   interrupt.
>   */
> -static DEFINE_STATIC_KEY_FALSE(supports_pseudo_nmis);
> +static DEFINE_STATIC_KEY_FALSE(supports_pseudo_nmi);
>  
>  static u32 gic_get_pribits(void)
>  {
> @@ -185,7 +185,7 @@ static void __init gic_prio_init(void)
>  				pr_warn("Broken GIC integration, security disabled\n");
>  		} else {
>  			pr_warn("Broken GIC integration, pNMI forbidden\n");
> -			nmi_support_forbidden = true;
> +			pseudo_nmi_support_forbidden = true;
>  		}
>  	}
>  
> @@ -512,10 +512,10 @@ static void gic_unmask_irq(struct irq_data *d)
>  	gic_poke_irq(d, GICD_ISENABLER);
>  }
>  
> -static inline bool gic_supports_nmi(void)
> +static inline bool gic_supports_pseudo_nmi(void)
>  {
>  	return IS_ENABLED(CONFIG_ARM64_PSEUDO_NMI) &&
> -	       static_branch_likely(&supports_pseudo_nmis);
> +	       static_branch_likely(&supports_pseudo_nmi);
>  }
>  
>  static int gic_irq_set_irqchip_state(struct irq_data *d,
> @@ -598,7 +598,7 @@ static int gic_irq_nmi_setup(struct irq_data *d)
>  {
>  	struct irq_desc *desc = irq_to_desc(d->irq);
>  
> -	if (!gic_supports_nmi())
> +	if (!gic_supports_pseudo_nmi())
>  		return -EINVAL;
>  
>  	if (gic_peek_irq(d, GICD_ISENABLER)) {
> @@ -626,7 +626,7 @@ static void gic_irq_nmi_teardown(struct irq_data *d)
>  {
>  	struct irq_desc *desc = irq_to_desc(d->irq);
>  
> -	if (WARN_ON(!gic_supports_nmi()))
> +	if (WARN_ON(!gic_supports_pseudo_nmi()))
>  		return;
>  
>  	if (gic_peek_irq(d, GICD_ISENABLER)) {
> @@ -804,7 +804,7 @@ static inline void gic_complete_ack(u32 irqnr)
>  
>  static bool gic_rpr_is_nmi_prio(void)
>  {
> -	if (!gic_supports_nmi())
> +	if (!gic_supports_pseudo_nmi())
>  		return false;
>  
>  	return unlikely(gic_read_rpr() == GICV3_PRIO_NMI);
> @@ -911,7 +911,7 @@ static void __gic_handle_irq_from_irqsoff(struct pt_regs *regs)
>  
>  static void __exception_irq_entry gic_handle_irq(struct pt_regs *regs)
>  {
> -	if (unlikely(gic_supports_nmi() && !interrupts_enabled(regs)))
> +	if (unlikely(gic_supports_pseudo_nmi() && !interrupts_enabled(regs)))
>  		__gic_handle_irq_from_irqsoff(regs);
>  	else
>  		__gic_handle_irq_from_irqson(regs);
> @@ -1162,7 +1162,7 @@ static void gic_cpu_sys_reg_init(void)
>  	/* Set priority mask register */
>  	if (!gic_prio_masking_enabled()) {
>  		write_gicreg(DEFAULT_PMR_VALUE, ICC_PMR_EL1);
> -	} else if (gic_supports_nmi()) {
> +	} else if (gic_supports_pseudo_nmi()) {
>  		/*
>  		 * Check that all CPUs use the same priority space.
>  		 *
> @@ -1955,15 +1955,15 @@ static const struct gic_quirk gic_quirks[] = {
>  	}
>  };
>  
> -static void gic_enable_nmi_support(void)
> +static void gic_enable_pseudo_nmi(void)
>  {
> -	if (!gic_prio_masking_enabled() || nmi_support_forbidden)
> +	if (!gic_prio_masking_enabled() || pseudo_nmi_support_forbidden)
>  		return;
>  
>  	pr_info("Pseudo-NMIs enabled using %s ICC_PMR_EL1 synchronisation\n",
>  		gic_has_relaxed_pmr_sync() ? "relaxed" : "forced");
>  
> -	static_branch_enable(&supports_pseudo_nmis);
> +	static_branch_enable(&supports_pseudo_nmi);
>  
>  	if (static_branch_likely(&supports_deactivate_key))
>  		gic_eoimode1_chip.flags |= IRQCHIP_SUPPORTS_NMI;
> @@ -2047,7 +2047,7 @@ static int __init gic_init_bases(phys_addr_t dist_phys_base,
>  	gic_prio_init();
>  	gic_dist_init();
>  	gic_cpu_init();
> -	gic_enable_nmi_support();
> +	gic_enable_pseudo_nmi();
>  	gic_smp_init();
>  	gic_cpu_pm_init();
>  


