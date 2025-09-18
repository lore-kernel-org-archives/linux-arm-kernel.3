Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C29B2CA1013
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 15:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+9lOTCzikSyVu96cR8WWjbtNgm9uqLVcXxeRpYVbVis=; b=JlCOw+t8xMT82e2KaY89nMtUw9
	ZjlT5bMAja0OuyQPh39XCKdGuEaVIptMLsIc7+4Q5Gsg5xFyw4iwpiwEmjVPZsq6ENJbblDT439Dj
	NdGSMiaQsww9nI2OKijR+62lahosOUsnHCp0UIuNc7kJHXObHUy67jjLl/orGSNquD09barJ8iYm+
	7FGQQK9WyZKibZJcOgF6wxSmmS1wsJLVSkKbyGoCrmBQ4RpYEZ+YnfZ0PlvV9nKeBKpgdWMBdWU9K
	UkvFImTJFvs6a3id12N2I61AUX69G7HP/rLHdv7x9MwICRJ6yU68qQhaJeor3BGdgiBAk9c2IRSdl
	reAG5kCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzGRr-00000000Lhj-3L7O;
	Thu, 18 Sep 2025 15:21:27 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzGRq-00000000Lgv-2CCa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 15:21:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6F8DE601D5;
	Thu, 18 Sep 2025 15:21:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4786BC4CEE7;
	Thu, 18 Sep 2025 15:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758208885;
	bh=7/PcDCApIZDlkgzvsXPVNcvnV9qW0ZVXMY2lmhDLV2g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PtvKWjPeuOqZewrc1jvLPZENqzSs3NQI9uGuhxJy8CL9PFwJ2F9KXKAh4WLxaxByF
	 TbwKpbHP5xZiC+a90zgvrkrk41BXYnPdF8zsIzW9iTNK6srHz4gnJlM93aN49AFT6P
	 LYKxXLxIpe1VJxD5feXdvZvPQDfmHd+dErzpsGnqyDyEgUiJIoAOPErwri6cswMZx0
	 JmKEHYoiTXdOre5XfoqXJuAvFpA4ScNpoGft8cnVPC4EIBBlAIu6jVXOVrO8vrTtFV
	 Ipace+FhpGJ7cQZNu19SL1v+EZFOWZrxcYNsNd2u0KXYYxoZL5xGif0ObfGTfFp1d0
	 DwnV7lyBBiy+Q==
Date: Thu, 18 Sep 2025 17:21:20 +0200
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH] of/irq: Add msi-parent check to of_msi_xlate()
Message-ID: <aMwjcIS/rvxkSZdr@lpieralisi>
References: <20250916091858.257868-1-lpieralisi@kernel.org>
 <20250918135555.GA1540012-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250918135555.GA1540012-robh@kernel.org>
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

On Thu, Sep 18, 2025 at 08:55:55AM -0500, Rob Herring wrote:
> On Tue, Sep 16, 2025 at 11:18:58AM +0200, Lorenzo Pieralisi wrote:
> > In some legacy platforms the MSI controller for a PCI host
> > bridge is identified by an msi-parent property whose phandle
> > points at an MSI controller node with no #msi-cells property,
> > that implicitly means #msi-cells == 0.
> > 
> > For such platforms, mapping a device ID and retrieving the
> > MSI controller node becomes simply a matter of checking
> > whether in the device hierarchy there is an msi-parent property
> > pointing at an MSI controller node with such characteristics.
> > 
> > Add a helper function to of_msi_xlate() to check the msi-parent
> > property in addition to msi-map and retrieve the MSI controller
> > node (with a 1:1 ID deviceID-IN<->deviceID-OUT mapping) to
> > provide support for deviceID mapping and MSI controller node
> > retrieval for such platforms.
> 
> Your line wrapping is a bit short.
> 
> I had a look at who is parsing "msi-parent" themselves as that's 
> typically a recipe for doing it incorrectly ('interrupt-map' anyone). 
> Can we make iproc_pcie_msi_enable() use this? It's quite ugly reaching 
> into the GICv3 node...

I am not sure I get what you mean here. Possibly iproc_pcie_msi_enable()
can reuse this patch's code if I extend it and make it a global function,
yes and somehow use that function to carry out the check for an
msi-parent property with no #msi-cells property or an #msi-cells == 0.

Don't get what GICv3 node has to do with that though, sorry.

> And perhaps irq-gic-its-msi-parent.c could use this? 

Yes and I have to fix leaks there too (and there are other
of_phandle_with_args() calls in the kernel that don't put the args.np
pointer on success - though not to retrieve msi-parent).
> 
> And looks like pcie-layerscape-gen4 is leaking a node reference...

It looks like it is in good company I am afraid :(

Thanks,
Lorenzo

> > 
> > Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
> > Cc: Sascha Bischoff <sascha.bischoff@arm.com>
> > Cc: Rob Herring <robh@kernel.org>
> > Cc: Marc Zyngier <maz@kernel.org>
> > ---
> >  drivers/of/irq.c | 38 +++++++++++++++++++++++++++++++++++---
> >  1 file changed, 35 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/of/irq.c b/drivers/of/irq.c
> > index e7c12abd10ab..d0e2dfd0ee28 100644
> > --- a/drivers/of/irq.c
> > +++ b/drivers/of/irq.c
> > @@ -670,6 +670,35 @@ void __init of_irq_init(const struct of_device_id *matches)
> >  	}
> >  }
> >  
> > +static int of_check_msi_parent(struct device_node *dev_node, struct device_node **msi_node)
> > +{
> > +	struct of_phandle_args msi_spec;
> > +	int ret;
> > +
> > +	/*
> > +	 * An msi-parent phandle with a missing or == 0 #msi-cells
> > +	 * property identifies a 1:1 ID translation mapping.
> > +	 *
> > +	 * Set the msi controller node if the firmware matches this
> > +	 * condition.
> > +	 */
> > +	ret = of_parse_phandle_with_optional_args(dev_node, "msi-parent", "#msi-cells",
> > +						  0, &msi_spec);
> > +	if (!ret) {
> > +		if ((*msi_node && *msi_node != msi_spec.np) || msi_spec.args_count != 0)
> > +			ret = -EINVAL;
> > +
> > +		if (!ret) {
> > +			/* Return with a node reference held */
> > +			*msi_node = msi_spec.np;
> > +			return 0;
> > +		}
> > +		of_node_put(msi_spec.np);
> > +	}
> > +
> > +	return ret;
> > +}
> > +
> >  /**
> >   * of_msi_xlate - map a MSI ID and find relevant MSI controller node
> >   * @dev: device for which the mapping is to be done.
> > @@ -677,7 +706,7 @@ void __init of_irq_init(const struct of_device_id *matches)
> >   * @id_in: Device ID.
> >   *
> >   * Walk up the device hierarchy looking for devices with a "msi-map"
> > - * property. If found, apply the mapping to @id_in.
> > + * or "msi-parent" property. If found, apply the mapping to @id_in.
> >   * If @msi_np points to a non-NULL device node pointer, only entries targeting
> >   * that node will be matched; if it points to a NULL value, it will receive the
> >   * device node of the first matching target phandle, with a reference held.
> > @@ -691,12 +720,15 @@ u32 of_msi_xlate(struct device *dev, struct device_node **msi_np, u32 id_in)
> >  
> >  	/*
> >  	 * Walk up the device parent links looking for one with a
> > -	 * "msi-map" property.
> > +	 * "msi-map" or an "msi-parent" property.
> >  	 */
> > -	for (parent_dev = dev; parent_dev; parent_dev = parent_dev->parent)
> > +	for (parent_dev = dev; parent_dev; parent_dev = parent_dev->parent) {
> >  		if (!of_map_id(parent_dev->of_node, id_in, "msi-map",
> >  				"msi-map-mask", msi_np, &id_out))
> >  			break;
> > +		if (!of_check_msi_parent(parent_dev->of_node, msi_np))
> > +			break;
> > +	}
> >  	return id_out;
> >  }
> >  
> > -- 
> > 2.48.0
> > 

