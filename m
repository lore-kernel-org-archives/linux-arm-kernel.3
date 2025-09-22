Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0F79CAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 10:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9FyE/0N1K3w7nr3vxYWKDBXg7DtluS3ho5RrT5Eoduw=; b=yOcHQIl2DskpNApuEYwSzQpThA
	uQ80bsFf44tWU2isdfSKcn+9lM9hw9wtUQ5KS30HOUyRdrfMUi9QjqwDjP/prZbQgMFTwiByxDlkS
	jRY8AoP+5il6aOP1H4iUPTueX5Iy834jp8Xkj2/o5mkjVxf4regg/XosZXB6se+jJXVfA4YClQAvb
	60GYdqOmAg7lOcjLwgo0vI2UqO56TxML8TnM8/wT6UD5zlnMM6Lqv6hscPrUcwl2s95GKCTJLpsM+
	iEB1D9PDPI0njoQljCn/1+l+xXqxA+6hCYtBwHNHAb0B3TfMKN7J51mA+xaFKL249hE2bIXy67VIK
	dcT29FBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0e7O-0000000A7gJ-4AfR;
	Mon, 22 Sep 2025 10:50:02 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0e7M-0000000A7fI-41EG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 10:50:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E87C244C43;
	Mon, 22 Sep 2025 10:49:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CACBFC4CEF0;
	Mon, 22 Sep 2025 10:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758538198;
	bh=niid4/G+12MRj1IFs6hp4sxeglXjyvGTGDPW0mtxjKo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qn15K+BDQCMdtm8fPWDiC0Citf1LHeyLNl9kXRi5WJvwj2/1hIuCpVvsRxGMiSXBP
	 X1RnlBTgKC6NFyFOYs4Ht4cTAKrG289MkmevTZU02K+unBfSI+7zLjm+dY9XGQsONM
	 7lfD8Fs5lCSaRp7iG/bLU3B9HB7R1UByh08z+VA/wlsghF52gImFrpJpqb4RfsYH6z
	 ovVNgbPNhwvW+PRUn4J+Jhqq8YIvSn3QU6DmZ6Z3BDmodPCTMWLjh/1wNOI0WJbnIJ
	 kTbDqYeC8arkwbeOcl8N4TP51f0ZjiM8O7wsFZv7XPtqlYd5qmvoh3IQU0LEZjc/fB
	 yAne/WZgkp6yw==
Date: Mon, 22 Sep 2025 12:49:53 +0200
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH] of/irq: Add msi-parent check to of_msi_xlate()
Message-ID: <aNEp0Ty3+a2oxLNm@lpieralisi>
References: <20250916091858.257868-1-lpieralisi@kernel.org>
 <20250918135555.GA1540012-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250918135555.GA1540012-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_035001_039940_DB61D07F 
X-CRM114-Status: GOOD (  41.06  )
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
> 
> And perhaps irq-gic-its-msi-parent.c could use this? 
> 
> And looks like pcie-layerscape-gen4 is leaking a node reference...

Hi Rob,

given where we are in the development cycle and that technically this
is a GICv5 fix I would send a patch to fix the issue in GICv5 MSI
parent code in drivers/irqchip (yes, it is more code handling the
msi-parent property scattered around) and then will resume this
thread for v6.19 - starting the clean-up.

This patch affects more platforms than GICv5 and I am not sure
it is safe to rush it in.

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

