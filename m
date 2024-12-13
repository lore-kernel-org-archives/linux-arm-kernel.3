Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E4D6E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Dec 2024 09:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XiadGz3xPo8rSyhujZTnv+Ykh7jInKaAFhyo+5IG0JY=; b=Z7m5ZNB1lMlM5j/EycohgGqgqB
	FZfabr0taYH3hvLI/NNFmOflL3FqQidc9e/RgVpYRRDzBbmJ1/DpB9S7Mrb1xxVRi4Nag/b7ZHsIL
	IJHMrf/R/FWWUTIq3edZ9ER5QdsHzu+b26jks10NCp9tFd2X6JczZKAcnAnZ/LcYv3ALQ4klrkXNn
	wlBHjMomkMG9LGp2hjY8UWVgP9HLhzTOeJEZFSxHD14XWe4x1xzEoQVKYng+PVxuVIB3DQSdkLQjP
	fnLsnA3AAwUr2GAnEducAldI4kfQjBWAJraRTKYrHv8w4u4LLXWq/csc3ItzlL6u9vIc190VVNvGp
	CefefJZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tM23N-00000003GnZ-18uf;
	Fri, 13 Dec 2024 09:33:45 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tM22H-00000003GdG-3vBH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Dec 2024 09:32:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 101955C5C57;
	Fri, 13 Dec 2024 09:31:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69369C4CED0;
	Fri, 13 Dec 2024 09:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734082357;
	bh=+Kn5Rd3o6VA88PfkHIOqGFrg7vIHuEtXTf0h01Eg5Ac=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IluCMY15IT3uBDzUgQFDJR3g70ddxdiblyZx3/ZsUMaxziqphSqU2bBpzcinaZ3Zb
	 EX4PgEj3XDZO9M5cwnjK+i2MgAZd8gUx1Nrlp+sZHuko/IPqEdwb8M+by2sEU9izn6
	 MfQF+lghQy4JSe7/r0rv469lfwxIkj0Y1XFqhXhe79rjFX3po5CtYG+78HOzUYUHDB
	 DfKBplR4eg7EwyKoYWrztdXy8Uc30ZfyLiHUTpPFr4CdUFfDXLCJ1lurMypjf0sDu5
	 ZMsNplWeEX8WvWKtmQYrliTo/+UodZ9aGXmL6z4zu/ycbbJj7vkmfIe64Xc0R0r64i
	 1JvxGP9oPc5Rw==
Date: Fri, 13 Dec 2024 10:32:28 +0100
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Frank Li <Frank.li@nxp.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev, alyssa@rosenzweig.io, bpf@vger.kernel.org,
	broonie@kernel.org, jgg@ziepe.ca, joro@8bytes.org,
	lgirdwood@gmail.com, maz@kernel.org, p.zabel@pengutronix.de,
	robin.murphy@arm.com, will@kernel.org
Subject: Re: [PATCH v8 2/2] PCI: imx6: Add IOMMU and ITS MSI support for
 i.MX95
Message-ID: <Z1v/LCHsGOgnasuf@lpieralisi>
References: <20241210-imx95_lut-v8-0-2e730b2e5fde@nxp.com>
 <20241210-imx95_lut-v8-2-2e730b2e5fde@nxp.com>
 <Z1sTUaoA5yk9RcIc@lpieralisi>
 <Z1sdbH7N1Ly9eXc0@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z1sdbH7N1Ly9eXc0@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_013238_064178_76D03FC0 
X-CRM114-Status: GOOD (  45.68  )
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

On Thu, Dec 12, 2024 at 12:29:16PM -0500, Frank Li wrote:
> On Thu, Dec 12, 2024 at 05:46:09PM +0100, Lorenzo Pieralisi wrote:
> > On Tue, Dec 10, 2024 at 05:48:59PM -0500, Frank Li wrote:
> > > For the i.MX95, configuration of a LUT is necessary to convert Bus Device
> > > Function (BDF) to stream IDs, which are utilized by both IOMMU and ITS.
> > > This involves checking msi-map and iommu-map device tree properties to
> > > ensure consistent mapping of PCI BDF to the same stream IDs. Subsequently,
> > > LUT-related registers are configured. In the absence of an msi-map, the
> > > built-in MSI controller is utilized as a fallback.
> >
> > This is wrong information. What you want to say is that if an msi-map
> > isn't detected this means that the platform relies on DWC built-in
> > controller for MSIs (that does not need streamIDs handling).
> >
> > That's quite different from what you are writing here.
> 
> How about ?
> 
> "If an msi-map isn't detected, platform relies on DWC built-in controller
> for MSIs that does not need streamdIDs"

Right. Question: what happens if DT shows that there are SMMU and/or
ITS bindings/mappings but the SMMU driver and ITS driver are either not
enabled or have not probed ?

I assume the LUT programming makes no difference (it is useless yes but
should be harmless too) in this case but wanted to check with you.

Thanks,
Lorenzo

> 
> >
> > >
> > > Register a PCI bus callback function to handle enable_device() and
> > > disable_device() operations, setting up the LUT whenever a new PCI device
> > > is enabled.
> > >
> > > Acked-by: Richard Zhu <hongxing.zhu@nxp.com>
> > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> 
> [...]
> 
> > > +	int err_i, err_m;
> > > +	u32 sid;
> > > +
> > > +	dev = imx_pcie->pci->dev;
> > > +
> > > +	target = NULL;
> > > +	err_i = of_map_id(dev->of_node, rid, "iommu-map", "iommu-map-mask", &target, &sid_i);
> > > +	if (target) {
> > > +		of_node_put(target);
> > > +	} else {
> > > +		/*
> > > +		 * "target == NULL && err_i == 0" means use 1:1 map RID to
> >
> > Is it what it means ? Or does it mean that the iommu-map property was found
> > and RID is out of range ?
> 
> yes, if this happen, sid_i will be equal to RID.
> 
> >
> > Could you point me at a sample dts for this host bridge please ?
> 
> https://github.com/nxp-imx/linux-imx/blob/lf-6.6.y/arch/arm64/boot/dts/freescale/imx95.dtsi
> 
> /* 0x10~0x17 stream id for pci0 */
>    iommu-map = <0x000 &smmu 0x10 0x1>,
>                <0x100 &smmu 0x11 0x7>;
> 
> /* msi part */
>    msi-map = <0x000 &its 0x10 0x1>,
>              <0x100 &its 0x11 0x7>;
> 
> >
> > > +		 * stream ID. Hardware can't support this because stream ID
> > > +		 * only 5bits
> >
> > It is 5 or 6 bits ? From GENMASK(5, 0) above it should be 6.
> 
> Sorry for typo. it is 6bits.
> 
> >
> > > +		 */
> > > +		err_i = -EINVAL;
> > > +	}
> > > +
> > > +	target = NULL;
> > > +	err_m = of_map_id(dev->of_node, rid, "msi-map", "msi-map-mask", &target, &sid_m);
> > > +
> > > +	/*
> > > +	 *   err_m      target
> > > +	 *	0	NULL		Use 1:1 map RID to stream ID,
> >
> > Again, is that what it really means ?
> >
> > > +	 *				Current hardware can't support it,
> > > +	 *				So return -EINVAL.
> > > +	 *      != 0    NULL		msi-map not exist, use built-in MSI.
> >
> > does not exist.
> >
> > > +	 *	0	!= NULL		Get correct streamID from RID.
> > > +	 *	!= 0	!= NULL		Unexisted case, never happen.
> >
> > "Invalid combination"
> >
> > > +	 */
> > > +	if (!err_m && !target)
> > > +		return -EINVAL;
> > > +	else if (target)
> > > +		of_node_put(target); /* Find stream ID map entry for RID in msi-map */
> > > +
> > > +	/*
> > > +	 * msi-map        iommu-map
> > > +	 *   N                N            DWC MSI Ctrl
> > > +	 *   Y                Y            ITS + SMMU, require the same sid
> > > +	 *   Y                N            ITS
> > > +	 *   N                Y            DWC MSI Ctrl + SMMU
> > > +	 */
> > > +	if (err_i && err_m)
> > > +		return 0;
> > > +
> > > +	if (!err_i && !err_m) {
> > > +		/*
> > > +		 * MSI glue layer auto add 2 bits controller ID ahead of stream
> >
> > What's "MSI glue layer" ?
> 
> It is common term for IC desgin, which connect IP's signal to platform with
> some simple logic. Inside chip, when connect LUT output 6bit streamIDs
> to MSI controller, there are 2bits hardcode controller ID information
> append to 6 bits streamID.
> 
>            Glue Layer
>           <==========>
> ┌─────┐                  ┌──────────┐
> │ LUT │ 6bit stream ID   │          │
> │     ┼─────────────────►│  MSI     │
> └─────┘    2bit ctrl ID  │          │
>             ┌───────────►│          │
>             │            │          │
>  00 PCIe0   │            │          │
>  01 ENETC   │            │          │
>  10 PCIe1   │            │          │
>             │            └──────────┘
> 
> >
> > > +		 * ID, so mask this 2bits to get stream ID.
> > > +		 * But IOMMU glue layer doesn't do that.
> >
> > and "IOMMU glue layer" ?
> 
> See above.
> 
> Frank
> 
> >
> > > +		 */
> > > +		if (sid_i != (sid_m & IMX95_SID_MASK)) {
> > > +			dev_err(dev, "iommu-map and msi-map entries mismatch!\n");
> > > +			return -EINVAL;
> > > +		}
> > > +	}
> > > +
> > > +	sid = sid_i;
> >
> > err_i could be != 0 here, I understand that the end result is
> > fine given how the code is written but it is misleading.
> >
> > 	if (!err_i)
> > 	else if (!err_m)
> 
> Okay
> 
> >
> > > +	if (!err_m)
> > > +		sid = sid_m & IMX95_SID_MASK;
> > > +
> > > +	return imx_pcie_add_lut(imx_pcie, rid, sid);
> > > +}
> > > +
> > > +static void imx_pcie_disable_device(struct pci_host_bridge *bridge, struct pci_dev *pdev)
> > > +{
> > > +	struct imx_pcie *imx_pcie;
> > > +
> > > +	imx_pcie = to_imx_pcie(to_dw_pcie_from_pp(bridge->sysdata));
> > > +	imx_pcie_remove_lut(imx_pcie, pci_dev_id(pdev));
> > > +}
> > > +
> > >  static int imx_pcie_host_init(struct dw_pcie_rp *pp)
> > >  {
> > >  	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> > > @@ -946,6 +1122,11 @@ static int imx_pcie_host_init(struct dw_pcie_rp *pp)
> > >  		}
> > >  	}
> > >
> > > +	if (pp->bridge && imx_check_flag(imx_pcie, IMX_PCIE_FLAG_HAS_LUT)) {
> > > +		pp->bridge->enable_device = imx_pcie_enable_device;
> > > +		pp->bridge->disable_device = imx_pcie_disable_device;
> > > +	}
> > > +
> > >  	imx_pcie_assert_core_reset(imx_pcie);
> > >
> > >  	if (imx_pcie->drvdata->init_phy)
> > > @@ -1330,6 +1511,8 @@ static int imx_pcie_probe(struct platform_device *pdev)
> > >  	imx_pcie->pci = pci;
> > >  	imx_pcie->drvdata = of_device_get_match_data(dev);
> > >
> > > +	mutex_init(&imx_pcie->lock);
> > > +
> > >  	/* Find the PHY if one is defined, only imx7d uses it */
> > >  	np = of_parse_phandle(node, "fsl,imx7d-pcie-phy", 0);
> > >  	if (np) {
> > > @@ -1627,7 +1810,8 @@ static const struct imx_pcie_drvdata drvdata[] = {
> > >  	},
> > >  	[IMX95] = {
> > >  		.variant = IMX95,
> > > -		.flags = IMX_PCIE_FLAG_HAS_SERDES,
> > > +		.flags = IMX_PCIE_FLAG_HAS_SERDES |
> > > +			 IMX_PCIE_FLAG_HAS_LUT,
> > >  		.clk_names = imx8mq_clks,
> > >  		.clks_cnt = ARRAY_SIZE(imx8mq_clks),
> > >  		.ltssm_off = IMX95_PE0_GEN_CTRL_3,
> > >
> > > --
> > > 2.34.1
> > >

