Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1799BE7718B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Dec 2024 09:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mdi6g8FFGId9v2EMbuG0YCzfLkEirxQuAwhBo8qjfw4=; b=Szb4zYkcskW+sjAsBFvdwBVVzt
	CW58q2t0aM+NJm2xaMrarDOS1CxOD8Ep6V4XS1+sc1yZFW7ej0loZmWDkxDEVUbw6hPHvGLRcKIlF
	3DnpZIqTByKroa7H00K/VazdEWRRHBatew2L5e+u+kEqpoFe9vKTPeSNuXsyNOjczWrFn+2D7nBcy
	c0IDpYD9YaR3EoSYWqN1husfoebr1h1UjgVipc+SFwpbxcIS2nPgg6c9sDs5edXO/YKQT48j12xar
	uHGZM+f3ey/P52FVfW0RSVlEPYlUQWiyuh8qIdkkl/DEjDT594PE2ySsjlw+jBnXwD45E0Hlz/Naa
	mUL/Df9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tR78C-0000000HWko-1W0F;
	Fri, 27 Dec 2024 09:59:44 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tR76v-0000000HWWD-3Sm7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Dec 2024 09:58:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 9565AA41457;
	Fri, 27 Dec 2024 09:56:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F27EDC4CED0;
	Fri, 27 Dec 2024 09:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735293504;
	bh=ZVmriFc0XH8plJi+hYMOKP3vwmebzeJP8fVsrXKydSc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ia2oX5vhH9xnoYZFCBcJPyyWOyOerSgWktBrvllCNkRMLfc9xow0moCafOLrn01yJ
	 6kFQdDaqa9yysEQ2mmEe3XtjLqE24Q1TJw4cSY9qDQZQIgwMxWj8SniQFIDHmKtmUp
	 tYhNgN2au2JAFFhVQ+/Q4kHZIXr2sWfH56O9u0IDhaRZQ3EzlN4Hx6mUbn7YLcWFKM
	 eAU88glX1Kk3faaL5bolHsAt9RvB9HBQ3iOCJzhexsqfddpHzVhvx/5ynuAn6wFE9n
	 g4vReSPXngynS1Kc4xIskATnCH/g9znuPu2hB6OqnurXTumSKETRWgh0AGggexFHbT
	 Xz2SFs7F/39Gg==
Date: Fri, 27 Dec 2024 10:58:15 +0100
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Frank Li <Frank.li@nxp.com>, Rob Herring <robh@kernel.org>,
	robin.murphy@arm.com
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
Message-ID: <Z256NxZF/+jO2bkR@lpieralisi>
References: <20241210-imx95_lut-v8-0-2e730b2e5fde@nxp.com>
 <20241210-imx95_lut-v8-2-2e730b2e5fde@nxp.com>
 <Z1sTUaoA5yk9RcIc@lpieralisi>
 <Z1sdbH7N1Ly9eXc0@lizhi-Precision-Tower-5810>
 <Z1v/LCHsGOgnasuf@lpieralisi>
 <Z1xs6GkcdTg2c73F@lizhi-Precision-Tower-5810>
 <Z2FDp1zQ7JzxQKJT@lpieralisi>
 <Z2GdvpzT6MOygG4W@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z2GdvpzT6MOygG4W@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241227_015826_015782_00D7C520 
X-CRM114-Status: GOOD (  52.57  )
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

On Tue, Dec 17, 2024 at 10:50:22AM -0500, Frank Li wrote:

[...]

> > > > Right. Question: what happens if DT shows that there are SMMU and/or
> > > > ITS bindings/mappings but the SMMU driver and ITS driver are either not
> > > > enabled or have not probed ?
> > >
> > > It is little bit complex.
> > > iommu:
> > > Case 1:
> > > 	iommu{
> > > 		status = "disabled"
> > > 	};
> > >
> > > 	PCI driver normal probed. if RID is in range of iommu-map, not
> > > any functional impact and harmless.
> > > 	If RID is out of range of iommu-map, "false alarm" will return.
> > > enable PCI EP device failure, but actually it can work without IOMMU.
> >
> > What does "false alarm" mean in practice ? PCI device enable fails
> > but actually it should not ?
> 
> Yes, you are right. It should work without iommu. but return failure for
> this case.

Rob, Robin, are you OK with this patch DT bindings usage (and the
related dependencies described in Frank's reply) ?

I am referring to "iommu-map" and "msi-map" usage, everything else
is platform specific code.

It looks like things can break in multiple ways but I don't want
to hold up this series forever.

Thanks,
Lorenzo

> > That does not look like a false alarm to me.
> 
> My means:  return failure but it should work without iommu. Ideally
> of_map_id() should return failure when iommu is disabled. It needs more
> work for that. I think we can improve it later.
> 
> >
> > >
> > > Case 2:
> > > 	iommu {
> > > 		status = "Okay"
> > > 	}
> > > 	but iommu driver have not probed yet.  PCI Host bridge driver
> > > should defer till iommu probed.
> > >
> > > Worst case is "false alarm". But this happen is very rare if DTS is
> > > correct.
> >
> > Explain what this means.
> 
> It return failure, but it should return success if "iommu disabled" and
> "RID is out of iommu-map range".
> 
> >
> > > MSI:
> > > case 1:
> > > 	msi-controller {
> > > 		status = "disabled";
> > > 	}
> > > 	Whole all dwc drivers will be broken.
> >
> > What MSI controller. Please make an effort to be precise and explain.
> 
> For example: ARM its, I use general term here because some other platform
> such as RISC V have not use ARM ITS.
> 
> pcie {
> 	...
> 	msi-map= <...>
> 	...
> }
> 
> DWC common driver will check property "msi-map". if it exist, built-in
> MSI controller will skip init by history reason. That is also the another
> reason why Rob don't want us to check these standard property.
> 
> Without MSI, system will failure back to INTx mode, same to no-msi=yes.
> But some EP devices require MSI support.
> 
> Frank
> 
> >
> > Thanks,
> > Lorenzo
> >
> > > case 2:
> > > 	msi-controller {
> > > 		status = "Okay"
> > > 	}
> > > 	if msi driver have not probed yet, PCI Host bridge driver will
> > > defer.
> > >
> > > Frank
> > >
> > > >
> > > > I assume the LUT programming makes no difference (it is useless yes but
> > > > should be harmless too) in this case but wanted to check with you`.
> > > >
> > > > Thanks,
> > > > Lorenzo
> > > >
> > > > >
> > > > > >
> > > > > > >
> > > > > > > Register a PCI bus callback function to handle enable_device() and
> > > > > > > disable_device() operations, setting up the LUT whenever a new PCI device
> > > > > > > is enabled.
> > > > > > >
> > > > > > > Acked-by: Richard Zhu <hongxing.zhu@nxp.com>
> > > > > > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > > > >
> > > > > [...]
> > > > >
> > > > > > > +	int err_i, err_m;
> > > > > > > +	u32 sid;
> > > > > > > +
> > > > > > > +	dev = imx_pcie->pci->dev;
> > > > > > > +
> > > > > > > +	target = NULL;
> > > > > > > +	err_i = of_map_id(dev->of_node, rid, "iommu-map", "iommu-map-mask", &target, &sid_i);
> > > > > > > +	if (target) {
> > > > > > > +		of_node_put(target);
> > > > > > > +	} else {
> > > > > > > +		/*
> > > > > > > +		 * "target == NULL && err_i == 0" means use 1:1 map RID to
> > > > > >
> > > > > > Is it what it means ? Or does it mean that the iommu-map property was found
> > > > > > and RID is out of range ?
> > > > >
> > > > > yes, if this happen, sid_i will be equal to RID.
> > > > >
> > > > > >
> > > > > > Could you point me at a sample dts for this host bridge please ?
> > > > >
> > > > > https://github.com/nxp-imx/linux-imx/blob/lf-6.6.y/arch/arm64/boot/dts/freescale/imx95.dtsi
> > > > >
> > > > > /* 0x10~0x17 stream id for pci0 */
> > > > >    iommu-map = <0x000 &smmu 0x10 0x1>,
> > > > >                <0x100 &smmu 0x11 0x7>;
> > > > >
> > > > > /* msi part */
> > > > >    msi-map = <0x000 &its 0x10 0x1>,
> > > > >              <0x100 &its 0x11 0x7>;
> > > > >
> > > > > >
> > > > > > > +		 * stream ID. Hardware can't support this because stream ID
> > > > > > > +		 * only 5bits
> > > > > >
> > > > > > It is 5 or 6 bits ? From GENMASK(5, 0) above it should be 6.
> > > > >
> > > > > Sorry for typo. it is 6bits.
> > > > >
> > > > > >
> > > > > > > +		 */
> > > > > > > +		err_i = -EINVAL;
> > > > > > > +	}
> > > > > > > +
> > > > > > > +	target = NULL;
> > > > > > > +	err_m = of_map_id(dev->of_node, rid, "msi-map", "msi-map-mask", &target, &sid_m);
> > > > > > > +
> > > > > > > +	/*
> > > > > > > +	 *   err_m      target
> > > > > > > +	 *	0	NULL		Use 1:1 map RID to stream ID,
> > > > > >
> > > > > > Again, is that what it really means ?
> > > > > >
> > > > > > > +	 *				Current hardware can't support it,
> > > > > > > +	 *				So return -EINVAL.
> > > > > > > +	 *      != 0    NULL		msi-map not exist, use built-in MSI.
> > > > > >
> > > > > > does not exist.
> > > > > >
> > > > > > > +	 *	0	!= NULL		Get correct streamID from RID.
> > > > > > > +	 *	!= 0	!= NULL		Unexisted case, never happen.
> > > > > >
> > > > > > "Invalid combination"
> > > > > >
> > > > > > > +	 */
> > > > > > > +	if (!err_m && !target)
> > > > > > > +		return -EINVAL;
> > > > > > > +	else if (target)
> > > > > > > +		of_node_put(target); /* Find stream ID map entry for RID in msi-map */
> > > > > > > +
> > > > > > > +	/*
> > > > > > > +	 * msi-map        iommu-map
> > > > > > > +	 *   N                N            DWC MSI Ctrl
> > > > > > > +	 *   Y                Y            ITS + SMMU, require the same sid
> > > > > > > +	 *   Y                N            ITS
> > > > > > > +	 *   N                Y            DWC MSI Ctrl + SMMU
> > > > > > > +	 */
> > > > > > > +	if (err_i && err_m)
> > > > > > > +		return 0;
> > > > > > > +
> > > > > > > +	if (!err_i && !err_m) {
> > > > > > > +		/*
> > > > > > > +		 * MSI glue layer auto add 2 bits controller ID ahead of stream
> > > > > >
> > > > > > What's "MSI glue layer" ?
> > > > >
> > > > > It is common term for IC desgin, which connect IP's signal to platform with
> > > > > some simple logic. Inside chip, when connect LUT output 6bit streamIDs
> > > > > to MSI controller, there are 2bits hardcode controller ID information
> > > > > append to 6 bits streamID.
> > > > >
> > > > >            Glue Layer
> > > > >           <==========>
> > > > > ┌─────┐                  ┌──────────┐
> > > > > │ LUT │ 6bit stream ID   │          │
> > > > > │     ┼─────────────────►│  MSI     │
> > > > > └─────┘    2bit ctrl ID  │          │
> > > > >             ┌───────────►│          │
> > > > >             │            │          │
> > > > >  00 PCIe0   │            │          │
> > > > >  01 ENETC   │            │          │
> > > > >  10 PCIe1   │            │          │
> > > > >             │            └──────────┘
> > > > >
> > > > > >
> > > > > > > +		 * ID, so mask this 2bits to get stream ID.
> > > > > > > +		 * But IOMMU glue layer doesn't do that.
> > > > > >
> > > > > > and "IOMMU glue layer" ?
> > > > >
> > > > > See above.
> > > > >
> > > > > Frank
> > > > >
> > > > > >
> > > > > > > +		 */
> > > > > > > +		if (sid_i != (sid_m & IMX95_SID_MASK)) {
> > > > > > > +			dev_err(dev, "iommu-map and msi-map entries mismatch!\n");
> > > > > > > +			return -EINVAL;
> > > > > > > +		}
> > > > > > > +	}
> > > > > > > +
> > > > > > > +	sid = sid_i;
> > > > > >
> > > > > > err_i could be != 0 here, I understand that the end result is
> > > > > > fine given how the code is written but it is misleading.
> > > > > >
> > > > > > 	if (!err_i)
> > > > > > 	else if (!err_m)
> > > > >
> > > > > Okay
> > > > >
> > > > > >
> > > > > > > +	if (!err_m)
> > > > > > > +		sid = sid_m & IMX95_SID_MASK;
> > > > > > > +
> > > > > > > +	return imx_pcie_add_lut(imx_pcie, rid, sid);
> > > > > > > +}
> > > > > > > +
> > > > > > > +static void imx_pcie_disable_device(struct pci_host_bridge *bridge, struct pci_dev *pdev)
> > > > > > > +{
> > > > > > > +	struct imx_pcie *imx_pcie;
> > > > > > > +
> > > > > > > +	imx_pcie = to_imx_pcie(to_dw_pcie_from_pp(bridge->sysdata));
> > > > > > > +	imx_pcie_remove_lut(imx_pcie, pci_dev_id(pdev));
> > > > > > > +}
> > > > > > > +
> > > > > > >  static int imx_pcie_host_init(struct dw_pcie_rp *pp)
> > > > > > >  {
> > > > > > >  	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> > > > > > > @@ -946,6 +1122,11 @@ static int imx_pcie_host_init(struct dw_pcie_rp *pp)
> > > > > > >  		}
> > > > > > >  	}
> > > > > > >
> > > > > > > +	if (pp->bridge && imx_check_flag(imx_pcie, IMX_PCIE_FLAG_HAS_LUT)) {
> > > > > > > +		pp->bridge->enable_device = imx_pcie_enable_device;
> > > > > > > +		pp->bridge->disable_device = imx_pcie_disable_device;
> > > > > > > +	}
> > > > > > > +
> > > > > > >  	imx_pcie_assert_core_reset(imx_pcie);
> > > > > > >
> > > > > > >  	if (imx_pcie->drvdata->init_phy)
> > > > > > > @@ -1330,6 +1511,8 @@ static int imx_pcie_probe(struct platform_device *pdev)
> > > > > > >  	imx_pcie->pci = pci;
> > > > > > >  	imx_pcie->drvdata = of_device_get_match_data(dev);
> > > > > > >
> > > > > > > +	mutex_init(&imx_pcie->lock);
> > > > > > > +
> > > > > > >  	/* Find the PHY if one is defined, only imx7d uses it */
> > > > > > >  	np = of_parse_phandle(node, "fsl,imx7d-pcie-phy", 0);
> > > > > > >  	if (np) {
> > > > > > > @@ -1627,7 +1810,8 @@ static const struct imx_pcie_drvdata drvdata[] = {
> > > > > > >  	},
> > > > > > >  	[IMX95] = {
> > > > > > >  		.variant = IMX95,
> > > > > > > -		.flags = IMX_PCIE_FLAG_HAS_SERDES,
> > > > > > > +		.flags = IMX_PCIE_FLAG_HAS_SERDES |
> > > > > > > +			 IMX_PCIE_FLAG_HAS_LUT,
> > > > > > >  		.clk_names = imx8mq_clks,
> > > > > > >  		.clks_cnt = ARRAY_SIZE(imx8mq_clks),
> > > > > > >  		.ltssm_off = IMX95_PE0_GEN_CTRL_3,
> > > > > > >
> > > > > > > --
> > > > > > > 2.34.1
> > > > > > >

