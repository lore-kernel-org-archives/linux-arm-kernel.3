Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3644AC7115B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 19:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9mGflkL/ZVdAASldw1hk3VuG1rhuf0NrOR2v98rVPcU=; b=noQUPWHegIOJaSd3Os/By0eY+u
	HtczonBLOStLIDxnCizw55AWzg/DxZeD+sQFz76ZZCehVGvRj9qahK599DYtncd2TJACct7HeHIIb
	siRDH20qE2qDQHTYUMv4FxSmLpvrYvO/T1kmF5lvyYD1nu5Ddlp9hoMz8+tv1XjN7ieIZhiHQmyI2
	ALhqr0/pZXaalBb46Rz5s6wITuRKMmdcRpiAvzrWObUaEzS2pqq3cZW0y/UzHHBE0kHiSyL9o+b3I
	0nMVgwtuJ8b4uXuUEuWT9w3rbjrEt1xGt3XAN+7tDoK8l2TT0iUe/wOOxanwk+/0jUy0JlRBaw9H0
	xoHVlETQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uShIG-0000000GQzr-3bie;
	Fri, 20 Jun 2025 19:20:56 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uShG0-0000000GQnK-3Xyw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Jun 2025 19:18:38 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1750447113;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9mGflkL/ZVdAASldw1hk3VuG1rhuf0NrOR2v98rVPcU=;
	b=Wo7FvqMPifmFfy2fOAKavWwtVfDL2s1uoGZfVzNtAC8x9nZs2WYUWFA+edsXhxgV3bYIi9
	mATMsyHMaRIwlG3xRkSScJIivyrPfv6HbhSr6WYqkkEg/BabgBvEvwBAjoQtvxzNYBj373
	VJaztRQS1Q067C6DsSFlem/LhcPufxq75iNn2AS/bpoMQKsLT3CrDEAE7Yo5tbp070FRoS
	I3WTCKJOe1xPpeheDvWOd/LziCIYlPgPWLI9Z+UQ5s8rDuwv96XK0iSxzMXUCKz96he4f5
	iZq6q7mRMdrPDyu86sjyOC/DNoxqaWsIGbPzmhdkwEqxJ7omkNVIzBkZSbc85Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1750447113;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9mGflkL/ZVdAASldw1hk3VuG1rhuf0NrOR2v98rVPcU=;
	b=mYnhDXvxvgkPULRpgzofLbJh/RchuVTknl95XmzZGhIm4EjWz6QFL896qMYyKPZxpWhirJ
	nT24sIaReZ5E1MDA==
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, Marc Zyngier
 <maz@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Sascha Bischoff
 <sascha.bischoff@arm.com>, Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Timothy Hayes <timothy.hayes@arm.com>, Bjorn Helgaas
 <bhelgaas@google.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, Peter
 Maydell <peter.maydell@linaro.org>, Mark Rutland <mark.rutland@arm.com>,
 Jiri Slaby <jirislaby@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-pci@vger.kernel.org, Lorenzo Pieralisi <lpieralisi@kernel.org>
Subject: Re: [PATCH v5 24/27] irqchip/gic-v5: Add GICv5 ITS support
In-Reply-To: <20250618-gicv5-host-v5-24-d9e622ac5539@kernel.org>
References: <20250618-gicv5-host-v5-0-d9e622ac5539@kernel.org>
 <20250618-gicv5-host-v5-24-d9e622ac5539@kernel.org>
Date: Fri, 20 Jun 2025 21:18:32 +0200
Message-ID: <87y0tmp6gn.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_121837_029562_3B597A02 
X-CRM114-Status: GOOD (  30.70  )
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

On Wed, Jun 18 2025 at 12:17, Lorenzo Pieralisi wrote:
>  drivers/of/irq.c                                   |   21 +
>  drivers/pci/msi/irqdomain.c                        |   19 +
>  include/linux/msi.h                                |    5 +
>  include/linux/of_irq.h                             |    7 +

This are preparatory changes. Please split them out into a seperate patch.

>  ...3-its-msi-parent.c => irq-gic-its-msi-parent.c} |  187 ++-
>  drivers/irqchip/irq-gic-its-msi-parent.h           |   14 +
>  drivers/irqchip/irq-gic-v3-its.c                   |    3 +-

Ditto, i.e. the rename and code move, not the v5 add ons.

> +static bool its_v5_init_dev_msi_info(struct device *dev, struct irq_domain *domain,
> +				     struct irq_domain *real_parent, struct msi_domain_info *info)
> +{
> +	if (!msi_lib_init_dev_msi_info(dev, domain, real_parent, info))
> +		return false;
> +
> +	switch (info->bus_token) {
> +	case DOMAIN_BUS_PCI_DEVICE_MSI:
> +	case DOMAIN_BUS_PCI_DEVICE_MSIX:
> +		/*
> +		 * FIXME: This probably should be done after a (not yet
> +		 * existing) post domain creation callback once to make
> +		 * support for dynamic post-enable MSI-X allocations
> +		 * work without having to reevaluate the domain size
> +		 * over and over. It is known already at allocation
> +		 * time via info->hwsize.
> +		 *
> +		 * That should work perfectly fine for MSI/MSI-X but needs
> +		 * some thoughts for purely software managed MSI domains
> +		 * where the index space is only limited artificially via
> +		 * %MSI_MAX_INDEX.


This comment is stale after Marc moved the prepare callback into
the domain creation, where the prepare callback gets hwsize for scaling.

The only valid caveat are software managed domains, where hwsize is
unspecified, but that's a different problem (and not used as of today).

> +		 */
> +		info->ops->msi_prepare = its_v5_pci_msi_prepare;
> +		info->ops->msi_teardown = its_msi_teardown;
> +		break;
> +	case DOMAIN_BUS_DEVICE_MSI:
> +	case DOMAIN_BUS_WIRED_TO_MSI:
> +		/*
> +		 * FIXME: See the above PCI prepare comment. The domain
> +		 * size is also known at domain creation time.
> +		 */

See above.

> +void gicv5_irs_syncr(void)
> +{
> +	struct gicv5_irs_chip_data *irs_data;
> +	u32 syncr;
> +
> +	irs_data = list_first_entry_or_null(&irs_nodes,
> +					    struct gicv5_irs_chip_data, entry);

Let it stick out. You have 100 characters.

> +	if (WARN_ON(!irs_data))

WARN_ON_ONCE() ?

> +static unsigned int gicv5_its_l2sz_to_l2_bits(unsigned int sz)
> +{
> +	switch (sz) {
> +	case GICV5_ITS_DT_ITT_CFGR_L2SZ_64k:
> +		return 13;
> +	case GICV5_ITS_DT_ITT_CFGR_L2SZ_16k:
> +		return 11;
> +	case GICV5_ITS_DT_ITT_CFGR_L2SZ_4k:
> +	default:
> +		return 9;

Magic numbers pulled out of thin air?

> +static __le64 *gicv5_its_device_get_itte_ref(struct gicv5_its_dev *its_dev,
> +					     u16 event_id)
> +{
> +	unsigned int l1_idx, l2_idx, l2_bits;
> +	__le64 *l2_itt, *l1_itt;
> +
> +	if (!its_dev->itt_cfg.l2itt) {
> +		__le64 *itt = its_dev->itt_cfg.linear.itt;
> +
> +		return &itt[event_id];
> +	}
> +
> +	l1_itt = its_dev->itt_cfg.l2.l1itt;
> +
> +	l2_bits = gicv5_its_l2sz_to_l2_bits(its_dev->itt_cfg.l2.l2sz);
> +
> +	l1_idx = event_id >> l2_bits;
> +
> +	BUG_ON(!FIELD_GET(GICV5_ITTL1E_VALID, le64_to_cpu(l1_itt[l1_idx])));

I assume this is truly unrecoverable

> +	l2_idx = event_id & GENMASK(l2_bits - 1, 0);
> +
> +	l2_itt = its_dev->itt_cfg.l2.l2ptrs[l1_idx];
> +
> +	return &l2_itt[l2_idx];
> +}
> +
....
> +
> +	return 0;
> +out_free_lpi:

It's amazing. All the code has a gazillion of empty newlines, which just
take up space and have no delimiting value. But on these error labels,
you glue them right at the return statement (not only here, noticed that
before).

> +	gicv5_free_lpi(lpi);
> +out_eventid:
> +	gicv5_its_free_eventid(its_dev, event_id_base, nr_irqs);
> +
> +	return ret;
> +}

> + * Taken from msi_lib_irq_domain_select(). The only difference is that
> + * we have to match the fwspec->fwnode parent against the domain->fwnode
> + * in that in GICv5 the ITS domain is represented by the ITS fwnode but
> + * the MSI controller (ie the ITS frames) are ITS child nodes.
> + */
> +static int gicv5_its_irq_domain_select(struct irq_domain *d, struct irq_fwspec *fwspec,
> +				       enum irq_domain_bus_token bus_token)
> +{
> +	const struct msi_parent_ops *ops = d->msi_parent_ops;
> +	u32 busmask = BIT(bus_token);
> +
> +	if (!ops)
> +		return 0;
> +
> +	if (fwnode_get_parent(fwspec->fwnode) != d->fwnode ||
> +	    fwspec->param_count != 0)
> +		return 0;

Just add a MSI flag and set it in parent_ops::required_flags and extend
the lib with

        struct fwnode_handle *fwh;

        fwh = d->flags & MAGIC ? fwnode_get_parent(fwspec->fwnode) : fwspec->fwnode;

No?

> diff --git a/drivers/irqchip/irq-gic-v5.c b/drivers/irqchip/irq-gic-v5.c
> index c2e7ba7e38f7..4a0990f46358 100644
> --- a/drivers/irqchip/irq-gic-v5.c
> +++ b/drivers/irqchip/irq-gic-v5.c
> @@ -57,12 +57,12 @@ static void release_lpi(u32 lpi)
>  	ida_free(&lpi_ida, lpi);
>  }
>  
> -static int gicv5_alloc_lpi(void)
> +int gicv5_alloc_lpi(void)
>  {
>  	return alloc_lpi();
>  }
>  
> -static void gicv5_free_lpi(u32 lpi)
> +void gicv5_free_lpi(u32 lpi)
>  {
>  	release_lpi(lpi);
>  }

Just make them global right away when you implement them. No point for
this kind of churn.

Thanks,

        tglx

