Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6FFCC19F32
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 12:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JjerLCo/Vx+u2IcERkPYduGM/CF946cLg9oPJ/k7GMw=; b=f8tsgwy49w1IeMkhlMZZ9LGtjm
	Za7BDaTW5qLJjVQStdueLot/jlMDWD3zlZHV3VdcuJCLNl4UeXDb+VGbtIPFB23uVMqYvbHJdWgiN
	i733A/8VFnuMPkJjmUdb2JoRX2czVw0Jc0BicuB9/FBKGlJwnK3csNXG3blJpjF87pj80M9GNl1St
	N6wdvTyocdUcwm8Mx9yEL2jhau6T8eyNhxrK/Pj1yueGjSxyupo218yDiaUyTMbWaflitOTk4mcM5
	9wq87DVgl/3RSxTXaJEXIilKwwKE6PbtjkL+BuWdNdv5tEP/iIz9UPkkf0vqZb+T+y50pBYFOvrh/
	7WVAtPpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqWra-0000000EBjC-2T6y;
	Fri, 07 Mar 2025 12:31:38 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqWpx-0000000EBXk-0aHJ;
	Fri, 07 Mar 2025 12:29:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 27BE2A45740;
	Fri,  7 Mar 2025 12:24:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC0ECC4CED1;
	Fri,  7 Mar 2025 12:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741350595;
	bh=+VVBJtiF5Ii7M1lEfiI1i4POFsGEnlp4WuusV3Xil4g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WjdsCdjobZNT+sMdck8xTcbhwFdqsgPOwF9xU1fXrTskcvBDGPgiQFzK98ciQU0cd
	 JABhDQAT0cZMUbb9t7vOq4WzCEXQ8ZsRGoEwBjEiiPTQ/0ZClb/ugUwQcJHJDM9KNd
	 5n2yT/Qp88Rva/vrA4+DQAxGW1Yy5X4P4HUcGHCxqukqflJvQ08QwQazhNe9zLcXXi
	 k4iCVhUUfn976KmDME8sHmSrItXj5+rtDMs3ld2IOaXRQJbox0GRupEniQdPgKub1N
	 n/pk+d1ER7Dtt/oxzNAxyYIjZdKorT5mo1dy6cXu7HAmqqoVCPDb1+Tusr6yOSGSrY
	 p1W012/Vs+/+A==
Date: Fri, 7 Mar 2025 13:29:50 +0100
From: Niklas Cassel <cassel@kernel.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Damien Le Moal <dlemoal@kernel.org>,
	Shawn Lin <shawn.lin@rock-chips.com>, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 2/2] PCI: dw-rockchip: hide broken ATS capability
Message-ID: <Z8rmviTHs92699jQ@ryzen>
References: <20250221202646.395252-3-cassel@kernel.org>
 <20250221202646.395252-4-cassel@kernel.org>
 <20250222160837.mropn3laiyv3acaa@thinkpad>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250222160837.mropn3laiyv3acaa@thinkpad>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_042957_349878_610E036E 
X-CRM114-Status: GOOD (  41.07  )
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

Hello Mani,

On Sat, Feb 22, 2025 at 09:38:37PM +0530, Manivannan Sadhasivam wrote:
> On Fri, Feb 21, 2025 at 09:26:48PM +0100, Niklas Cassel wrote:
> > When running the rk3588 in endpoint mode, with an Intel host with IOMMU
> > enabled, the host side prints:
> > DMAR: VT-d detected Invalidation Time-out Error: SID 0
> > 
> > When running the rk3588 in endpoint mode, with an AMD host with IOMMU
> > enabled, the host side prints:
> > iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT device=63:00.0 address=0x42b5b01a0]
> > 
> > Usually, to handle these issues, we add a quirk for the PCI vendor and
> > device ID in drivers/pci/quirks.c with quirk_no_ats(). That is because
> > we cannot usually modify the capabilities on the EP side.
> > 
> > In this case, we can modify the capabilties on the EP side. Thus, hide the
> > broken ATS capability on rk3588 when running in EP mode. That way,
> > we don't need any quirk on the host side, and we see no errors on the host
> > side, and we can run pci_endpoint_test successfully, with the IOMMU
> > enabled on the host side.
> > 
> > Signed-off-by: Niklas Cassel <cassel@kernel.org>
> > ---
> >  drivers/pci/controller/dwc/pcie-dw-rockchip.c | 46 +++++++++++++++++++
> >  1 file changed, 46 insertions(+)
> > 
> > diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> > index 836ea10eafbb..2be005c1a161 100644
> > --- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> > +++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> > @@ -242,6 +242,51 @@ static const struct dw_pcie_host_ops rockchip_pcie_host_ops = {
> >  	.init = rockchip_pcie_host_init,
> >  };
> >  
> > +/*
> > + * ATS does not work on rk3588 when running in EP mode.
> > + * After a host has enabled ATS on the EP side, it will send an IOTLB
> > + * invalidation request to the EP side. The rk3588 will never send a completion
> > + * back and eventually the host will print an IOTLB_INV_TIMEOUT error, and the
> > + * EP will not be operational. If we hide the ATS cap, things work as expected.
> > + */
> > +static void rockchip_pcie_ep_hide_broken_ats_cap_rk3588(struct dw_pcie_ep *ep)
> > +{
> > +	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> > +	struct device *dev = pci->dev;
> > +	unsigned int spcie_cap_offset, next_cap_offset;
> > +	u32 spcie_cap_header, next_cap_header;
> > +
> > +	/* only hide the ATS cap for rk3588 running in EP mode */
> > +	if (!of_device_is_compatible(dev->of_node, "rockchip,rk3588-pcie-ep"))
> > +		return;
> 
> Compatible checks always tend to extend. So please use a boolean flag to
> identify the quirk in 'struct rockchip_pcie_of_data' and set it in
> 'rockchip_pcie_ep_of_data_rk3588'. This way, other SoCs could also reuse the
> flag if required.

I agree that in many cases, compatible checks tend to extend.

However, the ATS capability is broken only for rk3588, thus we need to provide
the ATS cap_id and the cap_id for the CAP immediately preceding the ATS cap_id.

The linked list of capabilities will be different for every SoC.
If we look at the only other SoC supported by this EPC, rk3568, it does not
even have the ATS cap in the linked list.

Thus, I think that creating a boolean flag for this is wrong.
Even in the unlikely scenario that there will come a Rockchip SoC in the
future with an identical linked list of capabilities, I think that what you
are proposing this is premature optimization (AKA the root of all evil :P)


> 
> > +
> > +	spcie_cap_offset = dw_pcie_find_ext_capability(pci, PCI_EXT_CAP_ID_SECPCI);
> > +	if (!spcie_cap_offset)
> > +		return;
> > +
> > +	spcie_cap_header = dw_pcie_readl_dbi(pci, spcie_cap_offset);
> > +	next_cap_offset = PCI_EXT_CAP_NEXT(spcie_cap_header);
> > +
> > +	next_cap_header = dw_pcie_readl_dbi(pci, next_cap_offset);
> > +	if (PCI_EXT_CAP_ID(next_cap_header) != PCI_EXT_CAP_ID_ATS)
> > +		return;
> > +
> > +	/* clear next ptr */
> > +	spcie_cap_header &= ~GENMASK(31, 20);
> > +
> > +	/* set next ptr to next ptr of ATS_CAP */
> > +	spcie_cap_header |= next_cap_header & GENMASK(31, 20);
> > +
> > +	dw_pcie_dbi_ro_wr_en(pci);
> > +	dw_pcie_writel_dbi(pci, spcie_cap_offset, spcie_cap_header);
> > +	dw_pcie_dbi_ro_wr_dis(pci);
> 
> This code is mostly generic. So please move it to pcie-designware-ep.c. The
> function should just accept two CAP IDs (prev and target) and hide the target
> capability. Like,
> 
> 	dw_pcie_hide_ext_capability(pci, PCI_EXT_CAP_ID_SECPCI,
> 				    PCI_EXT_CAP_ID_ATS);

Sure, I will create a generic function in pcie-designware-ep.c.


> 
> Its too bad that we cannot traverse back from the target capability. We could
> open code dw_pcie_ep_find_ext_capability() to keep track of the prev_cap_offset
> though.

I'd rather skip this. Seems like too many special cases.
E.g. what should dw_pcie_ep_find_ext_capability() return if there is no prev?
It seems easier to just need to provide prev_cap_id as well.


Kind regards,
Niklas

