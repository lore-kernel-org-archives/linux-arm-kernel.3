Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDC4FCD4F2C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 07:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wsHqcKwo5977UKsycGEh8MAYVcFHAquPzMtiUyoer6g=; b=YuKrNn0lwNtWYwC816bK7J8ULT
	qEq2xYtai9OKqvHAorflmlNzIO0H1hC8p2Vzu4c6w6xTWhbFAkC13mnatYfBtJRptMeIU/hKgfKpK
	CIOrBpaIhU4VNLLia5FEPr3VsucAa2Png6ybUs+5rslFDwdo/5RH8fJhHehT9KH7wJPtiR3kkJHLU
	YLVdZGWG8oO9NCHTNgzSV1CY8RJq4pBwsd7/cPUakIAtkvJ5aFaXjLxg2GwKl8ILbtQW7oefSsflh
	cM+4Fjd79mQaz7/9vZc1smL7GdUKb1LPoCrwD2C9+WaliRkhxgjIEZEobVNvtVdRYnZfU2MYckl6u
	scbsNsEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXwbJ-0000000AUdX-1Npp;
	Fri, 12 Jun 2026 07:46:49 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXwbI-0000000AUdN-1r6J;
	Fri, 12 Jun 2026 07:46:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D16B743684;
	Fri, 12 Jun 2026 07:46:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E68651F000E9;
	Fri, 12 Jun 2026 07:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781250407;
	bh=wsHqcKwo5977UKsycGEh8MAYVcFHAquPzMtiUyoer6g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=G+1QaXUCq74YYvlVOgn/Ru3J12byjHh3oF1trnV981cS8ZSh9VtCGlEcXiRceS0W6
	 IhRSby5DNEkviGLbN1SJZptVd+Wb/RffOlOwE1U+cFRwqF18XDv85vCbSHbM7+5/sm
	 ZJVjKw3nQftPFdVwiHE5wpG8sVvghI4L+wmFDV4YkBs95Lw8BE64SN38qzA3aYMtOl
	 8gOo8rbJsRMkdZE+zW4NFVpPJKluCb+Mi3j8kkfeNi9kReI4EBo06U7Qnmvvo9n5rK
	 J0h1wU6VurMB/ZF/CcGpHyeIPLFwdZxhS1OatXGHm3KmYVsRvP2CkmHWxP3azrFqlR
	 HzDiFLG4oNUMA==
Date: Fri, 12 Jun 2026 09:46:41 +0200
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
Message-ID: <aiu5YU+Yn1DekE+E@lpieralisi>
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

Given that this has no OF counterpart, I'd rather add an empty stub
for acpi_dev_clear_dependencies() and remove the ifdef - I am not
sure that adding a FW agnostic:

dev_clear_dependencies()

would help much but that's just my opinion. Then the question is whether I
should convert all other acpi_dev_clear_dependencies() users (with ifdeffery
included) in tree.

Thanks,
Lorenzo

> 
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
> 
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

