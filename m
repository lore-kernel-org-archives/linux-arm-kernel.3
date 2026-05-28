Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CA39CD5BD5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 07:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lOF9/ftguGRGPekB6Y0hcSKN88e+EguDfHnvbC5AeRc=; b=QA1SQ3aBREdvXzbn5sX2E4aiXu
	F4pkQRohlCTwZcEDxRtjlrHWcwrN6Df0jMyxCcMCfgi9c6b4Fv0ifpC8MTcq/HG0bFb0jhcXVqdkc
	MKtjeYfkYj8eT39qjhu/goL6bRT4Qc8hE672sDfQOyI5GlN6JYTFHN2v4SD2FRta6EO3Rq8zg1jUg
	w7q9HF3wDb0w1GMi611BuYugyACXwdyo+CoQiNyXgg3jaiJCfwC1uL62APMfe9SrtAn4fQOf+wh1a
	6stVHoAm8HOhXma2BFLa78brGyGX5oFG7EAxmUqktD0Q+ShMzjtYfpb9YYb3QxRXdte2NxpeFA0j1
	WOdEPMXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSUxF-00000005FNq-1frK;
	Thu, 28 May 2026 07:14:57 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSUxD-00000005FNd-3qqh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 07:14:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E3477605DB;
	Thu, 28 May 2026 07:14:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A219A1F000E9;
	Thu, 28 May 2026 07:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779952494;
	bh=lOF9/ftguGRGPekB6Y0hcSKN88e+EguDfHnvbC5AeRc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dmjdaUFQ3Ihij4frIvq9H2pYznMbnYOiLexWjmJd7ue1syyhkJf/OnE7943pVT9iq
	 rxu0o1ra7VzRTVvcZlbKR9/5hS7mazLnGcNWJ9bBw+wKti4TiQe+GQCLDOfbjMEqNL
	 KDa776lDZaHvl2RgwYTqX15lryValy+WSyhPAXD7VWg7rQBwBwKRsETIDvdqWk2O9x
	 JOkzL6d57MxsfVYfCb9WoMNVbptfQ1IsVdY/y2e4A4Z1ZzBVdzzrL0lODlW+tmSxJV
	 JoxlB+i4VS7fR7JTjJEM2aoF3rkuGq1tSCplq8LE0gQP4ZOk1vw+23E1Hb/Aov2jcx
	 Fko1W1PDwQMrg==
Date: Thu, 28 May 2026 09:14:48 +0200
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Sascha Bischoff <Sascha.Bischoff@arm.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>, nd <nd@arm.com>,
	"maz@kernel.org" <maz@kernel.org>,
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>,
	Joey Gouly <Joey.Gouly@arm.com>,
	Suzuki Poulose <Suzuki.Poulose@arm.com>,
	"yuzenghui@huawei.com" <yuzenghui@huawei.com>,
	"peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	Timothy Hayes <Timothy.Hayes@arm.com>
Subject: Re: [PATCH v2 03/39] irqchip/gic-v5: Setup gic_kvm_info on ACPI hosts
Message-ID: <ahfraE2vVsZL2xcs@lpieralisi>
References: <20260521144846.1899475-1-sascha.bischoff@arm.com>
 <20260521144846.1899475-4-sascha.bischoff@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260521144846.1899475-4-sascha.bischoff@arm.com>
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

On Thu, May 21, 2026 at 02:50:09PM +0000, Sascha Bischoff wrote:
> Device-tree based GICv5 probing already passes the IRS details and
> maintenance interrupt to KVM, but the ACPI path only initialises the
> irqchip and installs the ACPI IRQ model. As a result, KVM never sees
> the GICv5 host information required to probe the vGIC on ACPI systems.
> 
> Add the ACPI equivalent of the DT KVM setup. Parse the MADT GICC
> entries for the maintenance interrupt, require all relevant entries to
> agree, register the interrupt as a GICv5 PPI-encoded GSI, and pass the
> resulting IRQ together with the IRS base and coherency information to
> KVM. Native GICv5 does not require a maintenance interrupt unless the
> legacy GICv3-compatible CPU interface is present, so preserve the
> existing no-maintenance-IRQ handling for that case.
> 
> Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
> ---
>  drivers/irqchip/irq-gic-v5.c | 103 +++++++++++++++++++++++++++++++++--
>  1 file changed, 98 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/irqchip/irq-gic-v5.c b/drivers/irqchip/irq-gic-v5.c
> index 707deabbf2f63..ccd1ec69a6ab2 100644
> --- a/drivers/irqchip/irq-gic-v5.c
> +++ b/drivers/irqchip/irq-gic-v5.c
> @@ -1126,7 +1126,7 @@ static void gicv5_set_cpuif_idbits(void)
>  #ifdef CONFIG_KVM
>  static struct gic_kvm_info gic_v5_kvm_info __initdata;
>  
> -static void __init gic_of_setup_kvm_info(struct device_node *node)
> +static void __init gic_setup_kvm_info(unsigned int maint_irq)
>  {
>  	struct gicv5_irs_chip_data *irs_data = gicv5_irs_get_chip_data();
>  
> @@ -1140,13 +1140,14 @@ static void __init gic_of_setup_kvm_info(struct device_node *node)
>  		return;
>  	}
>  
> -	gic_v5_kvm_info.type = GIC_V5;
> +	if (WARN_ON(!irs_data))
> +		return;
>  
> +	gic_v5_kvm_info.type = GIC_V5;
>  	gic_v5_kvm_info.gicv5_irs.base = irs_data->irs_base;
>  	gic_v5_kvm_info.gicv5_irs.non_coherent = !!(irs_data->flags & IRS_FLAGS_NON_COHERENT);
> -
> -	/* GIC Virtual CPU interface maintenance interrupt */
> -	gic_v5_kvm_info.maint_irq = irq_of_parse_and_map(node, 0);
> +	gic_v5_kvm_info.maint_irq = maint_irq;
> +	gic_v5_kvm_info.no_maint_irq_mask = false;
>  
>  	/*
>  	 * We require an MI if we have legacy support, but don't, otherwise.
> @@ -1162,10 +1163,101 @@ static void __init gic_of_setup_kvm_info(struct device_node *node)
>  
>  	vgic_set_kvm_info(&gic_v5_kvm_info);
>  }
> +
> +static void __init gic_of_setup_kvm_info(struct device_node *node)
> +{
> +	/* GIC Virtual CPU interface maintenance interrupt */
> +	gic_setup_kvm_info(irq_of_parse_and_map(node, 0));
> +}
> +
> +#ifdef CONFIG_ACPI
> +struct gicv5_acpi_kvm_info {
> +	u32 maint_irq;
> +	int maint_irq_mode;
> +};
> +
> +static struct gicv5_acpi_kvm_info acpi_v5_kvm_info __initdata;
> +
> +static int __init gic_acpi_parse_virt_madt_gicc(union acpi_subtable_headers *header,
> +						const unsigned long end)
> +{
> +	struct acpi_madt_generic_interrupt *gicc =
> +		(struct acpi_madt_generic_interrupt *)header;
> +	static int first_madt = true;
> +	int maint_irq_mode;
> +
> +	if (!(gicc->flags &
> +	      (ACPI_MADT_ENABLED | ACPI_MADT_GICC_ONLINE_CAPABLE)))
> +		return 0;
> +
> +	maint_irq_mode = (gicc->flags & ACPI_MADT_VGIC_IRQ_MODE) ?
> +			 ACPI_EDGE_SENSITIVE : ACPI_LEVEL_SENSITIVE;
> +
> +	if (first_madt) {
> +		first_madt = false;
> +
> +		acpi_v5_kvm_info.maint_irq = gicc->vgic_interrupt;
> +		acpi_v5_kvm_info.maint_irq_mode = maint_irq_mode;
> +		return 0;
> +	}
> +
> +	/* The maintenance interrupt must be the same for every GICC entry. */
> +	if (acpi_v5_kvm_info.maint_irq != gicc->vgic_interrupt ||
> +	    acpi_v5_kvm_info.maint_irq_mode != maint_irq_mode)
> +		return -EINVAL;
> +
> +	return 0;
> +}
> +
> +static bool __init gic_acpi_collect_virt_info(void)
> +{
> +	int count;
> +
> +	acpi_v5_kvm_info.maint_irq = 0;
> +	acpi_v5_kvm_info.maint_irq_mode = 0;

Nit: there is no need to zero them.

> +
> +	count = acpi_table_parse_madt(ACPI_MADT_TYPE_GENERIC_INTERRUPT,
> +				      gic_acpi_parse_virt_madt_gicc, 0);
> +
> +	return count > 0;
> +}
> +
> +static void __init gic_acpi_setup_kvm_info(void)
> +{
> +	unsigned int maint_irq = 0;
> +	int irq;
> +
> +	if (!gic_acpi_collect_virt_info()) {
> +		pr_warn("Unable to get hardware information used for virtualization\n");
> +		return;
> +	}
> +
> +	if (acpi_v5_kvm_info.maint_irq) {
> +		u32 gsi = FIELD_PREP(GICV5_HWIRQ_TYPE, GICV5_HWIRQ_TYPE_PPI) |
> +			  FIELD_PREP(GICV5_HWIRQ_ID, acpi_v5_kvm_info.maint_irq);

What you get from the MADT table is the GSI already encoded.

> +
> +		irq = acpi_register_gsi(NULL, gsi,
> +					acpi_v5_kvm_info.maint_irq_mode,
> +					ACPI_ACTIVE_HIGH);
> +		if (irq <= 0)
> +			return;

As we discussed offline, we are resolving the IRQ before knowing whether
FEAT_GCIE_LEGACY is supported. I don't think it is specified what that
GSI value in the GICC should be when !FEAT_GCIE_LEGACY, I will ask for
a spec update on the matter.

> +
> +		maint_irq = irq;
> +	}
> +
> +	gic_setup_kvm_info(maint_irq);
> +}
> +#endif
>  #else
>  static inline void __init gic_of_setup_kvm_info(struct device_node *node)
>  {
>  }
> +
> +#ifdef CONFIG_ACPI
> +static inline void __init gic_acpi_setup_kvm_info(void)
> +{
> +}
> +#endif
>  #endif // CONFIG_KVM

All of the above is almost identical to GICv3 code retrieving the maintenance
IRQ, which is not surprising the only difference is where you store it.

I think it is fine to leave this as is, writing a helper that we can reuse
in v3 and v5 drivers seems overkill at present.

Thanks,
Lorenzo

>  static int __init gicv5_init_common(struct fwnode_handle *parent_domain)
> @@ -1264,6 +1356,7 @@ static int __init gic_acpi_init(union acpi_subtable_headers *header, const unsig
>  		goto out_irs;
>  
>  	acpi_set_irq_model(ACPI_IRQ_MODEL_GIC_V5, gic_v5_get_gsi_domain_id);
> +	gic_acpi_setup_kvm_info();
>  
>  	return 0;
>  
> -- 
> 2.34.1

