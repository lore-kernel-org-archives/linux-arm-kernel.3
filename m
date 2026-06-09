Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D06BDCD6E79
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 09:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2O0A8k7i0uc3+GN/wePb/LhobyOV72RtaqOWFuiG+AE=; b=I/ltSHTiN+RdwgMPU66q5TiKxr
	q1c3Ps6limDpETpifEf2gLSLgt9McbHG7LB8lFy3o3kto2RKnhxcep+/5minRZ65XQulZeUSvAr79
	4CpO0ZO2P4EjGlfvWXVr0bbmRtAdQt23ZZMHI3yQQG77nXD8IGxG/O7aHYWQwfoU7dGrNGSqLYxcE
	AQppGNVdqSEF0uQRULzaoyH0QDcot5NWfitKSOzvwi5ONjh2NjMdil6bCnG9SiVeWMQ1esTjHQ+6N
	7Dvy6f/cvBvFT6zYPnGhLOUjkEeNcr7BZoUcNGpGM7NBmxTsd3h0L0v8yaBjvMEwuO8TwNlP65mrV
	nIQdlWyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWso7-00000005DDr-3aZP;
	Tue, 09 Jun 2026 09:31:39 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWso6-00000005DDO-1onP;
	Tue, 09 Jun 2026 09:31:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0503743F92;
	Tue,  9 Jun 2026 09:31:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0606B1F00893;
	Tue,  9 Jun 2026 09:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780997497;
	bh=2O0A8k7i0uc3+GN/wePb/LhobyOV72RtaqOWFuiG+AE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mAI6hhRXHfGBva7Rk3YIaxAe7+mGw8/Nc1CfF0iSOK7POUGUFrcPUd8rhYyAIQ/PA
	 dlYb0Z433wrDey4OY33Evo/RywrrH3HIGh1lADXKvY+gT6ZAUmg6ZBjy9/IrdeOviS
	 NuiO0yVrE5IWQNWfJz8xhh0BIlRrIE9lOhSaL3/LGs4BGbbOAr8eiDOybX/erkM50Z
	 B52wIBz2lnFpm0+319gQkrelQ1Y5h7gPp1y7bgpmHtOqRm2vnr9gBYfgU/iSufmUkS
	 R9LDV5FA/sPADE1rEeSrsfU5+o2bX1TWV5nsX2r5S6NA9HAXJye9hxqLxf1vBOU5LO
	 B5RcmBKv9b83Q==
Date: Tue, 9 Jun 2026 11:31:31 +0200
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Len Brown <lenb@kernel.org>, Sunil V L <sunilvl@ventanamicro.com>,
	Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	Anup Patel <anup@brainfault.org>, Hanjun Guo <guohanjun@huawei.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev
Subject: Re: [PATCH v2 6/6] irqchip/gic-v5: Enable GICv5 IWB ACPI probe
 ordering detection
Message-ID: <aifdc2E/+YCvCnwG@lpieralisi>
References: <20260603-gic-v5-acpi-iwb-probe-deferral-v2-0-23ffa16b6ebb@kernel.org>
 <20260603-gic-v5-acpi-iwb-probe-deferral-v2-6-23ffa16b6ebb@kernel.org>
 <CAJZ5v0ibZKfzJwGyUb92-K1N9C_ab0QujpAKCrvMdyygquS1Vw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJZ5v0ibZKfzJwGyUb92-K1N9C_ab0QujpAKCrvMdyygquS1Vw@mail.gmail.com>
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

On Mon, Jun 08, 2026 at 07:18:15PM +0200, Rafael J. Wysocki wrote:
> On Wed, Jun 3, 2026 at 10:21 AM Lorenzo Pieralisi <lpieralisi@kernel.org> wrote:
> >
> > Register an ACPI hook in the ACPI interrupt management code for GICv5 to
> > retrieve the ACPI interrupt controller handle (if any) of the controller
> > handling a specific GSI, by updating the acpi_set_irq_model() call with
> > the gic_v5_get_gsi_handle() function pointer parameter.
> >
> > gicv5_get_gsi_handle() allows ACPI core to detect the ACPI handle
> > of the controller that manages a specific GSI interrupt.
> >
> > Update the IWB driver to clear device dependencies in ACPI core once the
> > IWB driver has probed.
> >
> > Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
> > Cc: Thomas Gleixner <tglx@kernel.org>
> > Cc: Marc Zyngier <maz@kernel.org>
> > ---
> >  drivers/irqchip/irq-gic-v5-iwb.c |  5 +++++
> >  drivers/irqchip/irq-gic-v5.c     | 13 +++++++++++--
> >  2 files changed, 16 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/irqchip/irq-gic-v5-iwb.c b/drivers/irqchip/irq-gic-v5-iwb.c
> > index 9103feb70ce8..a02cb9537b15 100644
> > --- a/drivers/irqchip/irq-gic-v5-iwb.c
> > +++ b/drivers/irqchip/irq-gic-v5-iwb.c
> > @@ -269,6 +269,11 @@ static int gicv5_iwb_device_probe(struct platform_device *pdev)
> >         if (IS_ERR(iwb_node))
> >                 return PTR_ERR(iwb_node);
> >
> > +#ifdef CONFIG_ACPI
> > +       if (has_acpi_companion(&pdev->dev))
> > +               acpi_dev_clear_dependencies(ACPI_COMPANION(&pdev->dev));
> > +#endif
> 
> I would rather add a wrapper for this, along with an empty stub for
> the !CONFIG_ACPI case.

Ok, I will.

> > +
> >         return 0;
> >  }
> >
> > diff --git a/drivers/irqchip/irq-gic-v5.c b/drivers/irqchip/irq-gic-v5.c
> > index 03cc2830b260..26cfaea1af41 100644
> > --- a/drivers/irqchip/irq-gic-v5.c
> > +++ b/drivers/irqchip/irq-gic-v5.c
> > @@ -1217,11 +1217,19 @@ static struct fwnode_handle *gsi_domain_handle;
> >  static struct fwnode_handle *gic_v5_get_gsi_domain_id(u32 gsi)
> >  {
> >         if (FIELD_GET(GICV5_GSI_IC_TYPE, gsi) == GICV5_GSI_IWB_TYPE)
> > -               return iort_iwb_handle(FIELD_GET(GICV5_GSI_IWB_FRAME_ID, gsi));
> > +               return iort_iwb_handle_fwnode(FIELD_GET(GICV5_GSI_IWB_FRAME_ID, gsi));
> 
> Why is this change needed?

This is a mistake, thanks for spotting it, it belongs in the previous patch
(IMO patch 5 and 6 are a single logical entity, I split it to try to keep
irqchip specific changes in one patch).

iort_iwb_handle() was refactored to return an acpi_handle not a fwnode_handle
(in preparation for adding gic_v5_get_gsi_handle() below - the dependency
chain requires acpi_handle retrieval not fwnode_handle), so the change above
belongs in patch 5, I will move this line change to patch 5 in v3.

Thanks,
Lorenzo

> >
> >         return gsi_domain_handle;
> >  }
> >
> > +static acpi_handle gic_v5_get_gsi_handle(u32 gsi)
> > +{
> > +       if (FIELD_GET(GICV5_GSI_IC_TYPE, gsi) == GICV5_GSI_IWB_TYPE)
> > +               return iort_iwb_handle(FIELD_GET(GICV5_GSI_IWB_FRAME_ID, gsi));
> > +
> > +       return NULL;
> > +}
> > +
> >  static int __init gic_acpi_init(union acpi_subtable_headers *header, const unsigned long end)
> >  {
> >         struct acpi_madt_gicv5_irs *irs = (struct acpi_madt_gicv5_irs *)header;
> > @@ -1242,7 +1250,8 @@ static int __init gic_acpi_init(union acpi_subtable_headers *header, const unsig
> >         if (ret)
> >                 goto out_irs;
> >
> > -       acpi_set_irq_model(ACPI_IRQ_MODEL_GIC_V5, gic_v5_get_gsi_domain_id, NULL);
> > +       acpi_set_irq_model(ACPI_IRQ_MODEL_GIC_V5, gic_v5_get_gsi_domain_id,
> > +                          gic_v5_get_gsi_handle);
> >
> >         return 0;
> >
> >
> > --

