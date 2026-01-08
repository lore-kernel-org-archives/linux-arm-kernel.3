Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD66CD1D478
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 16:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qLwdKD9+THR7f76zVdSxWsoTvAlSVBVoYg2rjN7iJDs=; b=r6K7awav3hv3Fzy5k5VGaHqi53
	NRj3ryLEx751xJpHuqdKDIMY5udR8UCvpjMghLnp3H0Eydt14OnCuqfR8su/BkBf/H9wNl2/0e7Ud
	xrfGtabWqC8MvzPXwYDyA9ysPN7RcD5ya3OsVnMQzEsDdFemq7dcYLsVAMOyGvuwh0BTEkJ6fwq7L
	B1ERY3tkqhaapW/g8Av+BPdobn3x4st6BGkfxkTaJTp2o6fxtZtmN1wvYlI+EQG5CQMfxHt6wFAtx
	x5V79Hx7HyiDinHvpFFKj+1fAAInuIIC4icYHoTLlaAXDW0GnPcNpOL/Jg4gr8UOGD4WckoOVKjV/
	qHHRwkGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdsdZ-000000004nB-2VNP;
	Thu, 08 Jan 2026 16:13:25 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdsdW-000000004lV-34pH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 16:13:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3067960138;
	Thu,  8 Jan 2026 16:13:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0682C19422;
	Thu,  8 Jan 2026 16:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767888801;
	bh=S72kyJ6OhWOaTjMtM11JCMPxODXaSQCVVNaJHWk9JJA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KTiQ4gykw+qZEp0IC5oOch0G+UQQMj+WxxSfjOYba3ju/faZXuP+5CggeYNv+KaTE
	 9kgDZOuFCQ1kQgU7hi08Rux3iXqUReWgB3AZyePUL5UNRWqNMHOR5JqNObSPKZhNIj
	 a5YQv1RJ6fa2j758A2Gx5QtX1rEbDvFCUQUy6nv6YR3U0oCM6dWLDYQEh1jB+5tIvQ
	 lpXU0aUUZWQWJjod/zZVFMdaRhd2J8lHMlPLj/RUV2KAhEKzof9wuogHiEdAR0DqM7
	 sClSS6fFSj9qqVOnyFws3SmfXHckf1trDEg44R5IZUl+hEGoJmxQChVzeqfBuODltL
	 Zq7IPPWskPVsw==
Date: Thu, 8 Jan 2026 17:13:16 +0100
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
Subject: Re: [PATCH v2 6/7] irqchip/gic-v5: Add ACPI ITS probing
Message-ID: <aV/XnJg7CPBpbXnR@lpieralisi>
References: <20251218-gicv5-host-acpi-v2-0-eec76cd1d40b@kernel.org>
 <20251218-gicv5-host-acpi-v2-6-eec76cd1d40b@kernel.org>
 <20260105135545.00003a59@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260105135545.00003a59@huawei.com>
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

On Mon, Jan 05, 2026 at 01:55:45PM +0000, Jonathan Cameron wrote:
> On Thu, 18 Dec 2025 11:14:32 +0100
> Lorenzo Pieralisi <lpieralisi@kernel.org> wrote:
> 
> > On ACPI ARM64 systems the GICv5 ITS configuration and translate frames
> > are described in the MADT table.
> > 
> > Refactor the current GICv5 ITS driver code to share common functions
> > between ACPI and OF and implement ACPI probing in the GICv5 ITS driver.
> > 
> > Add iort_msi_xlate() to map a device ID and retrieve an MSI controller
> > fwnode node for ACPI systems and update pci_msi_map_rid_ctlr_node() to
> > use it in its ACPI code path.
> > 
> > Add the required functions to IORT code for deviceID retrieval and IRQ
> > domain registration and look-up so that the GICv5 ITS driver in an
> > ACPI based system can be successfully probed.
> > 
> > Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
> > Cc: Thomas Gleixner <tglx@linutronix.de>
> > Cc: Hanjun Guo <guohanjun@huawei.com>
> > Cc: Sudeep Holla <sudeep.holla@arm.com>
> > Cc: Marc Zyngier <maz@kernel.org>
> Hi Lorenzo,
> 
> Diff was in a rather unfriendly mood on this one and smashing the xlate
> on top of the wrong function (wrt to what was being replaced).
> 
> Ah well. Only one minor comment inline.  Not really my area of expertise
> beyond wanting this to move forwards quickly but none the less,
> 
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> 
> > ---
> >  drivers/acpi/arm64/iort.c                |  95 +++++++++++++++++-----
> >  drivers/irqchip/irq-gic-its-msi-parent.c |  39 ++++-----
> >  drivers/irqchip/irq-gic-v5-irs.c         |   7 +-
> >  drivers/irqchip/irq-gic-v5-its.c         | 132 ++++++++++++++++++++++++++++++-
> >  drivers/pci/msi/irqdomain.c              |   2 +
> >  include/linux/acpi_iort.h                |  10 ++-
> >  include/linux/irqchip/arm-gic-v5.h       |   1 +
> >  7 files changed, 241 insertions(+), 45 deletions(-)
> > 
> > diff --git a/drivers/acpi/arm64/iort.c b/drivers/acpi/arm64/iort.c
> > index 65f0f56ad753..17dbe66da804 100644
> > --- a/drivers/acpi/arm64/iort.c
> > +++ b/drivers/acpi/arm64/iort.c
> > @@ -595,45 +595,45 @@ u32 iort_msi_map_id(struct device *dev, u32 input_id)
> >  }
> >
> > +/**
> > + * iort_pmsi_get_msi_info() - Get the device id and translate frame PA for a device
> > + * @dev: The device for which the mapping is to be done.
> > + * @dev_id: The device ID found.
> > + * @pa: optional pointer to store translate frame address.
> > + *
> > + * Returns: 0 for successful devid and pa retrieval, -ENODEV on error
> > + */
> > +int iort_pmsi_get_msi_info(struct device *dev, u32 *dev_id, phys_addr_t *pa)
> > +{
> > +	struct acpi_iort_node *node, *parent = NULL;
> > +	struct acpi_iort_its_group *its;
> > +	int i, index;
> > +
> > +	node = iort_find_dev_node(dev);
> > +	if (!node)
> > +		return -ENODEV;
> > +
> > +	index = iort_get_id_mapping_index(node);
> > +	/* if there is a valid index, go get the dev_id directly */
> > +	if (index >= 0) {
> > +		parent = iort_node_get_id(node, dev_id, index);
> > +	} else {
> > +		for (i = 0; i < node->mapping_count; i++) {
> > +			parent = iort_node_map_platform_id(node, dev_id,
> > +						      IORT_MSI_TYPE, i);
> > +			if (parent)
> > +				break;
> > +		}
> > +	}
> > +
> Another borderline comment on what I think is a small readabilty
> improvement.
> 
> I'd handle the only error case that would otherwise use the ternary below
> here
> 	if (!parent)
> 		return -ENODEV;
> 
> 	if (pa) {
> 		...
> 	}
> 	return 0;

Updated.

Thanks,
Lorenzo

> > +	if (parent && pa) {
> > +		int ret;
> > +
> > +		its = (struct acpi_iort_its_group *)node->node_data;
> > +		ret = iort_find_its_base(its->identifiers[0], pa);
> > +		if (ret)
> > +			return ret;
> > +	}
> > +
> > +	return parent ? 0 : -ENODEV;
> > +}
> 
> 

