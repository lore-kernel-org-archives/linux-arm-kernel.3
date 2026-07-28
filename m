Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04F68C54F54
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 12:31:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=13ZGfNkaDmyEqxlDSi3603JVBSdLb2ouoodws9NWXGI=; b=sE1DcQwpS7TKYTJGtfpBephIh/
	M4AO/JA8tsGoN4i23OIzyh7mOpPBnE1FnpjhC1ZmtOI8gM2yGOPD2F0gK2cApjeCcC5Jxt8LvhKPl
	jCyRrwgDLsaldxYcGsHs2LFynVSZhc2noCq0NLEWyCh7qgBAUZRTXrepnHBVlEons+eepdlCfOGLh
	fHdf28tSaWNJEM6YwB2L0Dy4wA7DW3JdcC6iV2ynshPR/LQcd42sprp7G8HkzeerWSVGA4lzBs5Cy
	EOF76uDTgTaDKQZWOI0Lh0Dug8eu/L9xH+6RZjiyadB5X6MsW7+6S4XRn5Bt1b1djHl6KizZ+/mai
	HaL9JasA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wogxw-00000005FYn-1Lyl;
	Tue, 28 Jul 2026 12:31:24 +0000
Received: from canpmsgout11.his.huawei.com ([113.46.200.226])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wogxt-00000005FXv-0Ny1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 12:31:22 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=13ZGfNkaDmyEqxlDSi3603JVBSdLb2ouoodws9NWXGI=;
	b=C3QgYplo1/bYVlclsviSOGVYbbroofGVAFxlDa3cInGGcrTH2XyWStcWW5XjRmIQzwuCwSiUq
	e9eCj1Gjfg7c4nnUZX6gRfnOTVfT6G95QIDWQgF/IdXZUZ6NBjbiQgptn4mvukas+qDhma1/0ff
	4HccgRrMgbJ1TEhFDOAsZQ8=
Received: from mail.maildlp.com (unknown [172.19.163.127])
	by canpmsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4h8ZMX0pbDzKm4b;
	Tue, 28 Jul 2026 20:21:44 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 1B839402AB;
	Tue, 28 Jul 2026 20:31:13 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 28 Jul 2026 20:31:12 +0800
Message-ID: <4dcac83c-98df-421d-862d-36c1081f5abf@huawei.com>
Date: Tue, 28 Jul 2026 20:31:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 42/45] irqchip/gic-v3: Implement FEAT_GICv3_NMI
 support
To: Vladimir Murzin <vladimir.murzin@arm.com>,
	<linux-arm-kernel@lists.infradead.org>
CC: <mark.rutland@arm.com>, <maz@kernel.org>, <will@kernel.org>,
	<catalin.marinas@arm.com>, <liaochang1@huawei.com>
References: <20260727163453.7969-1-vladimir.murzin@arm.com>
 <20260727163453.7969-43-vladimir.murzin@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260727163453.7969-43-vladimir.murzin@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_053121_441060_A5D63A3B 
X-CRM114-Status: GOOD (  26.79  )
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
> From: Lorenzo Pieralisi <lpieralisi@kernel.org>
> 
> The FEAT_GICv3_NMI GIC feature coupled with the CPU FEAT_NMI enables
> handling NMI interrupts in HW on aarch64, by adding a superpriority
> interrupt to the existing GIC priority scheme.
> 
> Implement GIC driver support for the FEAT_GICv3_NMI feature.
> 
> Check, through the ARM64 capabilitity infrastructure, if support
> for FEAT_NMI was detected on the core and the system has not overridden
> the detection and forced pseudo-NMIs enablement.
> 
> If FEAT_NMI is detected, it was not overridden (check embedded in the
> system_uses_nmi() call) and the GIC supports the FEAT_GICv3_NMI
> feature, initialize NMIs related HW GIC registers and route irq to NMI
> handling logic.
> 
> Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
> Signed-off-by: Mark Brown <broonie@kernel.org>
> Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
> Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
> ---
>  drivers/irqchip/irq-gic-v3.c       | 114 +++++++++++++++++++++++++++--
>  include/linux/irqchip/arm-gic-v3.h |   4 +
>  2 files changed, 111 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/irqchip/irq-gic-v3.c b/drivers/irqchip/irq-gic-v3.c
> index c75acd5f9e7f..a21ed3dcf46f 100644
> --- a/drivers/irqchip/irq-gic-v3.c
> +++ b/drivers/irqchip/irq-gic-v3.c
> @@ -64,6 +64,7 @@ struct gic_chip_data {
>  	u32			nr_redist_regions;
>  	u64			flags;
>  	bool			has_rss;
> +	bool			has_nmi;
>  	unsigned int		ppi_nr;
>  	struct partition_affinity *parts;
>  	unsigned int		nr_parts;
> @@ -89,6 +90,9 @@ static DEFINE_STATIC_KEY_TRUE(supports_deactivate_key);
>  
>  static bool pseudo_nmi_support_forbidden;
>  
> +static DEFINE_RAW_SPINLOCK(gic_nmi_lock);
> +
> +
>  /*
>   * There are 16 SGIs, though we only actually use 8 in Linux. The other 8 SGIs
>   * are potentially stolen by the secure side. Some code, especially code dealing
> @@ -252,6 +256,37 @@ enum gic_intid_range {
>  	__INVALID_RANGE__
>  };
>  
> +#ifdef CONFIG_ARM64
> +#include <asm/cpufeature.h>
> +
> +static inline bool gic_supports_v3_3_nmi(void)
> +{
> +	return gic_data.has_nmi && system_uses_nmi();
> +}
> +
> +static inline u64 gic_read_nmiar(void)
> +{
> +	u64 irqstat;
> +
> +	irqstat = read_sysreg_s(SYS_ICC_NMIAR1_EL1);
> +
> +	dsb(sy);
> +
> +	return irqstat;
> +}
> +
> +#else
> +static inline bool gic_supports_v3_3_nmi(void)
> +{
> +	return false;
> +}
> +
> +static inline u64 gic_read_nmiar(void)
> +{
> +	BUG();
> +}
> +#endif
> +
>  static enum gic_intid_range __get_intid_range(irq_hw_number_t hwirq)
>  {
>  	switch (hwirq) {
> @@ -438,6 +473,8 @@ static u32 convert_offset_index(struct irq_data *d, u32 offset, u32 *index)
>  			return GICD_ICFGRnE;
>  		case GICD_IROUTER:
>  			return GICD_IROUTERnE;
> +		case GICD_INMIR:
> +			return GICD_INMIRnE;
>  		default:
>  			break;
>  		}
> @@ -467,6 +504,42 @@ static int gic_peek_irq(struct irq_data *d, u32 offset)
>  	return !!(readl_relaxed(base + offset + (index / 32) * 4) & mask);
>  }
>  
> +static void gic_irq_configure_nmi(struct irq_data *d, bool enable)
> +{
> +	void __iomem *base, *addr;
> +	unsigned long val;
> +	u32 offset, index;
> +
> +	offset = convert_offset_index(d, GICD_INMIR, &index);
> +
> +	if (gic_irq_in_rdist(d))
> +		base = gic_data_rdist_sgi_base();
> +	else
> +		base = gic_dist_base_alias(d);
> +
> +	addr = base + offset + (index / 32) * 4;
> +
> +	raw_spin_lock(&gic_nmi_lock);
> +
> +	val = readl_relaxed(addr);
> +
> +	__assign_bit(index % 32, &val, enable);
> +
> +	writel_relaxed(val, addr);
> +
> +	raw_spin_unlock(&gic_nmi_lock);
> +}
> +
> +static void gic_irq_enable_nmi(struct irq_data *d)
> +{
> +	gic_irq_configure_nmi(d, true);
> +}
> +
> +static void gic_irq_disable_nmi(struct irq_data *d)
> +{
> +	gic_irq_configure_nmi(d, false);
> +}
> +
>  static void gic_poke_irq(struct irq_data *d, u32 offset)
>  {
>  	void __iomem *base;
> @@ -598,7 +671,7 @@ static int gic_irq_nmi_setup(struct irq_data *d)
>  {
>  	struct irq_desc *desc = irq_to_desc(d->irq);
>  
> -	if (!gic_supports_pseudo_nmi())
> +	if (!gic_supports_pseudo_nmi() && !gic_supports_v3_3_nmi())
>  		return -EINVAL;
>  
>  	if (gic_peek_irq(d, GICD_ISENABLER)) {
> @@ -617,7 +690,10 @@ static int gic_irq_nmi_setup(struct irq_data *d)
>  	if (!gic_irq_in_rdist(d))
>  		desc->handle_irq = handle_fasteoi_nmi;
>  
> -	gic_irq_set_prio(d, dist_prio_nmi);
> +	if (gic_supports_v3_3_nmi())
> +		gic_irq_enable_nmi(d);
> +	else
> +		gic_irq_set_prio(d, dist_prio_nmi);
>  
>  	return 0;
>  }
> @@ -626,7 +702,7 @@ static void gic_irq_nmi_teardown(struct irq_data *d)
>  {
>  	struct irq_desc *desc = irq_to_desc(d->irq);
>  
> -	if (WARN_ON(!gic_supports_pseudo_nmi()))
> +	if (WARN_ON(!gic_supports_pseudo_nmi() && !gic_supports_v3_3_nmi()))
>  		return;
>  
>  	if (gic_peek_irq(d, GICD_ISENABLER)) {
> @@ -645,7 +721,10 @@ static void gic_irq_nmi_teardown(struct irq_data *d)
>  	if (!gic_irq_in_rdist(d))
>  		desc->handle_irq = handle_fasteoi_irq;
>  
> -	gic_irq_set_prio(d, dist_prio_irq);
> +	if (gic_supports_v3_3_nmi())
> +		gic_irq_disable_nmi(d);
> +	else
> +		gic_irq_set_prio(d, dist_prio_irq);
>  }
>  
>  static bool gic_arm64_erratum_2941627_needed(struct irq_data *d)
> @@ -836,7 +915,8 @@ static void __gic_handle_nmi(u32 irqnr, struct pt_regs *regs)
>  	gic_complete_ack(irqnr);
>  
>  	if (generic_handle_domain_nmi(gic_data.domain, irqnr)) {
> -		WARN_ONCE(true, "Unexpected pseudo-NMI (irqnr %u)\n", irqnr);
> +		WARN_ONCE(true, "Unexpected %sNMI (irqnr %u)\n",
> +			  gic_supports_pseudo_nmi() ? "pseudo-" : "", irqnr);
>  		gic_deactivate_unhandled(irqnr);
>  	}
>  }
> @@ -911,7 +991,11 @@ static void __gic_handle_irq_from_irqsoff(struct pt_regs *regs)
>  
>  static void __exception_irq_entry gic_handle_irq(struct pt_regs *regs)
>  {
> -	if (unlikely(gic_supports_pseudo_nmi() && !interrupts_enabled(regs)))
> +	if (gic_supports_v3_3_nmi() && in_nmi()) {
> +		u32 irqnr = gic_read_nmiar();
> +
> +		__gic_handle_nmi(irqnr, regs);
> +	} else if (unlikely(gic_supports_pseudo_nmi() && !interrupts_enabled(regs)))
>  		__gic_handle_irq_from_irqsoff(regs);
>  	else
>  		__gic_handle_irq_from_irqson(regs);
> @@ -1964,6 +2048,19 @@ static void gic_enable_pseudo_nmi(void)
>  		gic_has_relaxed_pmr_sync() ? "relaxed" : "forced");
>  
>  	static_branch_enable(&supports_pseudo_nmi);
> +}
> +
> +static void gic_enable_nmi_support(void)
> +{
> +	if ((!gic_prio_masking_enabled() || pseudo_nmi_support_forbidden) && !gic_supports_v3_3_nmi())
> +		return;
> +
> +	/*
> +	 * Initialize pseudo-NMIs only if GIC driver cannot take advantage
> +	 * of core (FEAT_NMI) and GIC (FEAT_GICv3_NMI) in HW
> +	 */
> +	if (!gic_supports_v3_3_nmi())
> +		gic_enable_pseudo_nmi();
>  
>  	if (static_branch_likely(&supports_deactivate_key))
>  		gic_eoimode1_chip.flags |= IRQCHIP_SUPPORTS_NMI;
> @@ -2032,6 +2129,9 @@ static int __init gic_init_bases(phys_addr_t dist_phys_base,
>  	irq_domain_update_bus_token(gic_data.domain, DOMAIN_BUS_WIRED);
>  
>  	gic_data.has_rss = !!(typer & GICD_TYPER_RSS);
> +	gic_data.has_nmi = !!(typer & GICD_TYPER_NMI);
> +
> +	pr_info("Non-maskable interrupt property %s supported\n", gic_data.has_nmi ? "is" : "not");

Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>

>  
>  	if (typer & GICD_TYPER_MBIS) {
>  		err = mbi_init(handle, gic_data.domain);
> @@ -2047,7 +2147,7 @@ static int __init gic_init_bases(phys_addr_t dist_phys_base,
>  	gic_prio_init();
>  	gic_dist_init();
>  	gic_cpu_init();
> -	gic_enable_pseudo_nmi();
> +	gic_enable_nmi_support();
>  	gic_smp_init();
>  	gic_cpu_pm_init();
>  
> diff --git a/include/linux/irqchip/arm-gic-v3.h b/include/linux/irqchip/arm-gic-v3.h
> index ea5fd2374ebe..ebccd76cadda 100644
> --- a/include/linux/irqchip/arm-gic-v3.h
> +++ b/include/linux/irqchip/arm-gic-v3.h
> @@ -30,6 +30,7 @@
>  #define GICD_ICFGR			0x0C00
>  #define GICD_IGRPMODR			0x0D00
>  #define GICD_NSACR			0x0E00
> +#define GICD_INMIR			0x0F80
>  #define GICD_IGROUPRnE			0x1000
>  #define GICD_ISENABLERnE		0x1200
>  #define GICD_ICENABLERnE		0x1400
> @@ -39,6 +40,7 @@
>  #define GICD_ICACTIVERnE		0x1C00
>  #define GICD_IPRIORITYRnE		0x2000
>  #define GICD_ICFGRnE			0x3000
> +#define GICD_INMIRnE			0x3B00
>  #define GICD_IROUTER			0x6000
>  #define GICD_IROUTERnE			0x8000
>  #define GICD_IDREGS			0xFFD0
> @@ -83,6 +85,7 @@
>  #define GICD_TYPER_LPIS			(1U << 17)
>  #define GICD_TYPER_MBIS			(1U << 16)
>  #define GICD_TYPER_ESPI			(1U << 8)
> +#define GICD_TYPER_NMI			(1U << 9)
>  
>  #define GICD_TYPER_ID_BITS(typer)	((((typer) >> 19) & 0x1f) + 1)
>  #define GICD_TYPER_NUM_LPIS(typer)	((((typer) >> 11) & 0x1f) + 1)
> @@ -238,6 +241,7 @@
>  #define GICR_ICFGR0			GICD_ICFGR
>  #define GICR_IGRPMODR0			GICD_IGRPMODR
>  #define GICR_NSACR			GICD_NSACR
> +#define GICR_INMIR0			GICD_INMIR
>  
>  #define GICR_TYPER_PLPIS		(1U << 0)
>  #define GICR_TYPER_VLPIS		(1U << 1)


