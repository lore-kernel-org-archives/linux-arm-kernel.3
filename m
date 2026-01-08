Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6D19D1D481
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 16:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GxLi7LJub88w48tq67sxh33w6E8fai98ldoD/R9Ur9Y=; b=XQ7kWfU53oolJFicdfhjIDAIDn
	MlOSIMg/2M8CRtJ1MjgOEfLmXjRWbP3O6VY0ofm9zxThsqPmssl12cQYJDUKFi6VVSkYgmAqs8Dfd
	fYVQVFv+7LlQQxrSRNTNGZyZ4EgV7ak8L3x8D//FhaBUtJcwcElYyyIEqFp/5pMh/iYcwwvyomWz9
	E9Bz93X3X2UsMkoxCCHYP2NSHvofhRdmdfCYgBr65WtA+0i5pP08UdEYO7j4YBYN8jw5dj5nqsx3B
	CdV01l9kJIuEry5Hh9BXi5wR5X1bqztktbvv9Cp0rodm6CN9NVMFE0+XMRdcmk6TpIXnuKYc08vRa
	1NvZcmAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdscp-000000004bh-3QgK;
	Thu, 08 Jan 2026 16:12:39 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdscn-000000004an-2mPe
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 16:12:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BE04B60130;
	Thu,  8 Jan 2026 16:12:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5884EC116C6;
	Thu,  8 Jan 2026 16:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767888756;
	bh=V8O17syXNsMLoXA54yd13fKCVCjHzEoJ999ub7lM/Pg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B9LRzVav2GO4CMduUYKdZsdpdXOgcXSJqjTduv7EcQ1UIyAY8wCV0GBdpAy3q3C+P
	 bhKc240hjb3u/t7nVUzARqu1oiuDzY5mK/m0x8s86Ag1QG2X4pM1xA0KJezfVtr73f
	 Grb+0t0Zt6S9FwjVht7Z2EiSK+voxc2nzI301ool3EByVIB6bTL2YCaQPOvGT8idp8
	 1zECHh0pS3E0KhVJW1MNZVB0so5vnVZIAyCQeXNMTWwdZhcvhM5lfIKp4tr23d+kBQ
	 EGlmUBW3BiRN+vXsxuV5Q0NFJsWF/08l7R/VYrUy7avgTn7snbgG5O5tOVBmE2y7W4
	 oUA9wpdkLg60g==
Date: Thu, 8 Jan 2026 17:12:30 +0100
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Jonathan Cameron <jonathan.cameron@huawei.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
	Robert Moore <robert.moore@intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Hanjun Guo <guohanjun@huawei.com>,
	Sudeep Holla <sudeep.holla@arm.com>, Marc Zyngier <maz@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>, linux-acpi@vger.kernel.org,
	acpica-devel@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org
Subject: Re: [PATCH v2 7/7] irqchip/gic-v5: Add ACPI IWB probing
Message-ID: <aV/XbgUrjLVGM40O@lpieralisi>
References: <20251218-gicv5-host-acpi-v2-0-eec76cd1d40b@kernel.org>
 <20251218-gicv5-host-acpi-v2-7-eec76cd1d40b@kernel.org>
 <20260105153521.00007e46@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260105153521.00007e46@huawei.com>
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

On Mon, Jan 05, 2026 at 03:35:21PM +0000, Jonathan Cameron wrote:
> On Thu, 18 Dec 2025 11:14:33 +0100
> Lorenzo Pieralisi <lpieralisi@kernel.org> wrote:
> 
> > To probe an IWB in an ACPI based system it is required:
> > 
> > - to implement the IORT functions handling the IWB IORT node and create
> >   functions to retrieve IWB firmware information
> > - to augment the driver to match the DSDT ACPI "ARMH0003" device and
> >   retrieve the IWB wire and trigger mask from the GSI interrupt descriptor
> >   in the IWB msi_domain_ops.msi_translate() function
> > 
> > Make the required driver changes to enable IWB probing in ACPI systems.
> > 
> > The GICv5 GSI format requires special handling for IWB routed IRQs.
> > 
> > Add IWB GSI detection to the top level driver gic_v5_get_gsi_domain_id()
> > function so that the correct IRQ domain for a GSI can be detected by
> > parsing the GSI and check whether it is an IWB-backed IRQ or not.
> > 
> > Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
> > Cc: Thomas Gleixner <tglx@linutronix.de>
> > Cc: Hanjun Guo <guohanjun@huawei.com>
> > Cc: Sudeep Holla <sudeep.holla@arm.com>
> > Cc: Marc Zyngier <maz@kernel.org>
> A couple of trivial comments inline. Overall this series looks in a good
> state to me.
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> 
> > ---
> >  drivers/acpi/arm64/iort.c          | 95 ++++++++++++++++++++++++++++++++------
> >  drivers/irqchip/irq-gic-v5-iwb.c   | 42 +++++++++++++----
> >  drivers/irqchip/irq-gic-v5.c       |  4 ++
> >  include/linux/acpi_iort.h          |  1 +
> >  include/linux/irqchip/arm-gic-v5.h |  6 +++
> >  5 files changed, 123 insertions(+), 25 deletions(-)
> > 
> > diff --git a/drivers/acpi/arm64/iort.c b/drivers/acpi/arm64/iort.c
> > index 17dbe66da804..4b0b753db738 100644
> > --- a/drivers/acpi/arm64/iort.c
> > +++ b/drivers/acpi/arm64/iort.c
> 
> > @@ -317,12 +325,28 @@ static acpi_status iort_match_node_callback(struct acpi_iort_node *node,
> >  	return status;
> >  }
> >  
> > +static acpi_status iort_match_iwb_callback(struct acpi_iort_node *node, void *context)
> > +{
> > +	acpi_status status = AE_NOT_FOUND;
> > +	u32 *id = context;
> > +
> > +	if (node->type == ACPI_IORT_NODE_IWB) {
> > +		struct acpi_iort_iwb *iwb;
> > +
> > +		iwb = (struct acpi_iort_iwb *)node->node_data;
> > +		status = iwb->iwb_index == *id ? AE_OK : AE_NOT_FOUND;
> > +	}
> > +
> > +	return status;
> Simpler flow with a quick exclusion of wrong nodes.
> 	if (node->type != ACPI_IORT_NODE_IWB)
> 		return AE_NOT_FOUND;
> 	....
> 	iwb = ...
> 	
> Also not sure I'd use a ternary here given it's only slightly more code
> as more readable.
> 	if (iwb->iwb_index != *id)
> 		return AE_NOT_FOUND;
> 
> 	return AE_OK;

Updated.

> > +}
> 
> 
> > diff --git a/drivers/irqchip/irq-gic-v5-iwb.c b/drivers/irqchip/irq-gic-v5-iwb.c
> > index ad9fdc14d1c6..c7d5fd34d053 100644
> > --- a/drivers/irqchip/irq-gic-v5-iwb.c
> > +++ b/drivers/irqchip/irq-gic-v5-iwb.c
> > @@ -4,6 +4,7 @@
> >   */
> >  #define pr_fmt(fmt)	"GICv5 IWB: " fmt
> >  
> > +#include <linux/acpi.h>
> >  #include <linux/init.h>
> >  #include <linux/kernel.h>
> >  #include <linux/msi.h>
> > @@ -136,18 +137,31 @@ static int gicv5_iwb_irq_domain_translate(struct irq_domain *d, struct irq_fwspe
> >  					  irq_hw_number_t *hwirq,
> >  					  unsigned int *type)
> >  {
> > -	if (!is_of_node(fwspec->fwnode))
> > -		return -EINVAL;
> > +	if (is_of_node(fwspec->fwnode)) {
> >  
> > -	if (fwspec->param_count < 2)
> > -		return -EINVAL;
> > +		if (fwspec->param_count < 2)
> > +			return -EINVAL;
> >  
> > -	/*
> > -	 * param[0] is be the wire
> > -	 * param[1] is the interrupt type
> > -	 */
> > -	*hwirq = fwspec->param[0];
> > -	*type = fwspec->param[1] & IRQ_TYPE_SENSE_MASK;
> > +		/*
> > +		 * param[0] is be the wire
> > +		 * param[1] is the interrupt type
> > +		 */
> > +		*hwirq = fwspec->param[0];
> > +		*type = fwspec->param[1] & IRQ_TYPE_SENSE_MASK;
> 
> As below, FIELD_GET() would improve reviewability a little.
> 
> 
> > +	}
> > +
> > +	if (is_acpi_device_node(fwspec->fwnode)) {
> > +
> > +		if (fwspec->param_count < 2)
> > +			return -EINVAL;
> > +
> > +		/*
> > +		 * Extract the wire from param[0]
> > +		 * param[1] is the interrupt type
> > +		 */
> > +		*hwirq = FIELD_GET(GICV5_GSI_IWB_WIRE, fwspec->param[0]);
> > +		*type = fwspec->param[1] & IRQ_TYPE_SENSE_MASK;
> 
> I'd prefer this FIELD_GET() for this as well so there is no need to
> go sanity check that it is the lowest bits.

It is a common pattern in the kernel, that's why I am not convinced that
changing just this instance would improve much.

Thanks,
Lorenzo

> 
> > +	}
> >  
> >  	return 0;

