Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 774CAC7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 11:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y44ZngC9p0NB3MezaOSDWgPGnmy1iJ9G/uwh0PVGesk=; b=U9X5aAsHW+v3bGYA/Vg0a0rJPe
	e+iRJtWMEXjAAEWeSghzYeqdIMLQNYu+OKx0IFG+XUpDBT0j7Q3r5qM+sJcyTsmH550icf+hdYmZc
	iJ/+W6sNoqSFl/ZMqqjSyPmMLqkGvhjHredo774uftJXo822NISTV3KwGG6B99uUd2erA21gpnDCd
	L1T5eBG748+NPwLyYN1+ouTNKV5raPEC7nEIwLLHXF33GkUqChnluoc8TKvOpPX09djV0vQbktj/B
	8ynvPBpghiUOd1BFYYd/CwE3wWlS2MOzlD7+W0Ci4ufWdR/n0cvv1NnWdAc/y+b5ahzrRVarh8FyB
	y4BI0bYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWZQb-00000004uEH-1yxi;
	Tue, 01 Jul 2025 11:45:33 +0000
Received: from mailout4.samsung.com ([203.254.224.34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWZLc-00000004t6j-1jgo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 11:40:26 +0000
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250701114018epoutp04ca387354940db1de88e2725ad202ad24~OHcDBpSqm0989809898epoutp047
	for <linux-arm-kernel@lists.infradead.org>; Tue,  1 Jul 2025 11:40:18 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250701114018epoutp04ca387354940db1de88e2725ad202ad24~OHcDBpSqm0989809898epoutp047
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1751370018;
	bh=Y44ZngC9p0NB3MezaOSDWgPGnmy1iJ9G/uwh0PVGesk=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=I7kS7w0grMn5BAv46zf20bUn4NnfACk2WhCR/jx2e72sS0SwyTHMXx86hVBBbYp/H
	 l0NTvmOnEYjhAtmsDNLHWDpObx7gZY0qLp0DY01Ile98SxPYePSo1468WdCgC5UmYA
	 Kr08AfPXd8ybJLREfw6Dym14N5osZoGoPuU8EH7c=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20250701114018epcas5p3da61799c0a1f1b9952e9ee147a22346d~OHcCiPWjL2271522715epcas5p3i;
	Tue,  1 Jul 2025 11:40:18 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.179]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4bWh0c3prVz6B9m5; Tue,  1 Jul
	2025 11:40:16 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20250701111817epcas5p1aa3bcea4074a614451ae5e586fe81ff6~OHI0Oe2Uy0185401854epcas5p1z;
	Tue,  1 Jul 2025 11:18:17 +0000 (GMT)
Received: from FDSFTE462 (unknown [107.122.81.248]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20250701111814epsmtip20da990c40862028a8a169bea64463967~OHIxcFNzu2999529995epsmtip2C;
	Tue,  1 Jul 2025 11:18:14 +0000 (GMT)
From: "Shradha Todi" <shradha.t@samsung.com>
To: "'Bjorn Helgaas'" <helgaas@kernel.org>
Cc: <linux-pci@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-phy@lists.infradead.org>,
	<linux-fsd@tesla.com>, <mani@kernel.org>, <lpieralisi@kernel.org>,
	<kw@linux.com>, <robh@kernel.org>, <bhelgaas@google.com>,
	<jingoohan1@gmail.com>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<alim.akhtar@samsung.com>, <vkoul@kernel.org>, <kishon@kernel.org>,
	<arnd@arndb.de>, <m.szyprowski@samsung.com>, <jh80.chung@samsung.com>,
	<pankaj.dubey@samsung.com>
In-Reply-To: <20250627193046.GA1673824@bhelgaas>
Subject: RE: [PATCH v2 09/10] PCI: exynos: Add support for Tesla FSD SoC
Date: Tue, 1 Jul 2025 16:48:13 +0530
Message-ID: <02b101dbea79$d7e086c0$87a19440$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQGhrL3pBtmKB+eUT+UdId2XMSsQswHJrC1DtINLLcA=
Content-Language: en-in
X-CMS-MailID: 20250701111817epcas5p1aa3bcea4074a614451ae5e586fe81ff6
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250627193052epcas5p1cf3fc43c6a3c2e5ed9ad68ceac9c34bd
References: <CGME20250627193052epcas5p1cf3fc43c6a3c2e5ed9ad68ceac9c34bd@epcas5p1.samsung.com>
	<20250627193046.GA1673824@bhelgaas>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_044025_107197_1DF48A2D 
X-CRM114-Status: GOOD (  33.43  )
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



> -----Original Message-----
> From: Bjorn Helgaas <helgaas@kernel.org>
> Sent: 28 June 2025 01:01
> To: Shradha Todi <shradha.t@samsung.com>
> Cc: linux-pci@vger.kernel.org; devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org;
linux-
> samsung-soc@vger.kernel.org; linux-kernel@vger.kernel.org; linux-phy@lists.infradead.org; linux-
> fsd@tesla.com; manivannan.sadhasivam@linaro.org; lpieralisi@kernel.org; kw@linux.com;
> robh@kernel.org; bhelgaas@google.com; jingoohan1@gmail.com; krzk+dt@kernel.org;
> conor+dt@kernel.org; alim.akhtar@samsung.com; vkoul@kernel.org; kishon@kernel.org;
> arnd@arndb.de; m.szyprowski@samsung.com; jh80.chung@samsung.com; pankaj.dubey@samsung.com
> Subject: Re: [PATCH v2 09/10] PCI: exynos: Add support for Tesla FSD SoC
> 
> On Wed, Jun 25, 2025 at 10:22:28PM +0530, Shradha Todi wrote:
> > Add host and endpoint controller driver support for FSD SoC.
> 
> > +++ b/drivers/pci/controller/dwc/pci-exynos.c
> > @@ -20,6 +20,8 @@
> >  #include <linux/regulator/consumer.h>
> >  #include <linux/mod_devicetable.h>
> >  #include <linux/module.h>
> > +#include <linux/regmap.h>
> > +#include <linux/mfd/syscon.h>
> 
> The trend is to sort these alphabetically.  The last couple additions
> didn't observe this, but maybe these new ones could go a little
> farther up and make it more sorted rather than less?
> 
> > +#define FSD_PCIE_CXPL_DEBUG_00_31		0x2C8
> 
> Existing #defines use lower-case hex; please follow suit.
> 
> > +/* to store different SoC variants of Samsung */
> > +enum samsung_pcie_variants {
> > +	FSD,
> > +	EXYNOS_5433,
> > +};
> 
> >  struct samsung_pcie_pdata {
> >  	struct pci_ops				*pci_ops;
> >  	const struct dw_pcie_ops		*dwc_ops;
> >  	const struct dw_pcie_host_ops		*host_ops;
> > +	const struct dw_pcie_ep_ops		*ep_ops;
> >  	const struct samsung_res_ops		*res_ops;
> > +	unsigned int				soc_variant;
> > +	enum dw_pcie_device_mode		device_mode;
> >  };
> 
> > +static u32 fsd_pcie_read_dbi(struct dw_pcie *pci, void __iomem *base,
> > +				u32 reg, size_t size)
> > +{
> > +	void __iomem *addr;
> > +	u32 val;
> > +
> > +	addr = fsd_atu_setting(pci, base);
> > +
> > +	dw_pcie_read(addr + reg, size, &val);
> > +
> > +	return val;
> 
> Remove blank lines to match style of fsd_pcie_write_dbi2().
> 
> > +}
> > +
> > +static void fsd_pcie_write_dbi(struct dw_pcie *pci, void __iomem *base,
> > +				u32 reg, size_t size, u32 val)
> > +{
> > +	void __iomem *addr;
> > +
> > +	addr = fsd_atu_setting(pci, base);
> > +
> > +	dw_pcie_write(addr + reg, size, val);
> 
> Ditto.
> 
> > +}
> > +
> > +static void fsd_pcie_write_dbi2(struct dw_pcie *pci, void __iomem *base,
> > +				u32 reg, size_t size, u32 val)
> > +{
> > +	struct exynos_pcie *ep = to_exynos_pcie(pci);
> > +
> > +	fsd_atu_setting(pci, base);
> > +	dw_pcie_write(pci->dbi_base + reg, size, val);
> > +	regmap_write(ep->sysreg, ep->sysreg_offset, ADDR_TYPE_DBI);
> > +}
> 
> > +static int fsd_pcie_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
> > +				 unsigned int type, u16 interrupt_num)
> > +{
> > +	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> > +
> > +	switch (type) {
> > +	case PCI_IRQ_INTX:
> > +		return dw_pcie_ep_raise_intx_irq(ep, func_no);
> > +	case PCI_IRQ_MSIX:
> > +		dev_err(pci->dev, "EP does not support MSIX\n");
> 
> s/MSIX/MSI-X/ to match spec usage.
> 

Thanks for the review! Will take care of all mentioned changes in next version

> > @@ -373,13 +617,43 @@ static int exynos_pcie_probe(struct platform_device *pdev)
> >  		return ret;
> >
> >  	platform_set_drvdata(pdev, ep);
> > -	ret = samsung_irq_init(ep, pdev);
> > -	if (ret)
> > -		goto fail_regulator;
> > -	ep->pci.pp.ops = pdata->host_ops;
> > -	ret = dw_pcie_host_init(&ep->pci.pp);
> > -	if (ret < 0)
> > +
> > +	if (pdata->res_ops->set_device_mode)
> > +		pdata->res_ops->set_device_mode(ep);
> > +
> > +	switch (ep->pdata->device_mode) {
> > +	case DW_PCIE_RC_TYPE:
> > +		ret = samsung_irq_init(ep, pdev);
> > +		if (ret)
> > +			goto fail_regulator;
> > +
> > +		ep->pci.pp.ops = pdata->host_ops;
> > +
> > +		ret = dw_pcie_host_init(&ep->pci.pp);
> > +		if (ret < 0)
> > +			goto fail_phy_init;
> > +
> > +		break;
> > +	case DW_PCIE_EP_TYPE:
> > +		phy_init(ep->phy);
> > +
> > +		ep->pci.ep.ops = pdata->ep_ops;
> > +
> > +		ret = dw_pcie_ep_init(&ep->pci.ep);
> > +		if (ret < 0)
> > +			goto fail_phy_init;
> > +
> > +		ret = dw_pcie_ep_init_registers(&ep->pci.ep);
> > +		if (ret)
> > +			goto fail_phy_init;
> > +
> > +		pci_epc_init_notify(ep->pci.ep.epc);
> > +
> > +		break;
> > +	default:
> > +		dev_err(dev, "invalid device type\n");
> >  		goto fail_phy_init;
> > +	}
> 
> This would be a little nicer if you added soc_variant and device_mode
> and the code that sets and tests them for exynos_5433 first in a
> separate patch.  Then it would be more obvious that the new FSD parts
> don't affect exynos_5433 since this patch would only be *adding*
> FSD-specific things.
> 

Sure,  I have no issues in splitting the patches further. Though unfortunately,
I or anyone I know does not possess a board which has Exynos 5433 chipset.
Therefore, I'm unable to verify these changes for Exynos chipset. I took care
to not disturb the exynos flow functionally but would be great if someone
could test this and confirm that it works well on Exynos 5433 after the changes.

> >  static const struct samsung_pcie_pdata exynos_5433_pcie_rc_pdata = {
> >  	.dwc_ops		= &exynos_dw_pcie_ops,
> >  	.pci_ops		= &exynos_pci_ops,
> >  	.host_ops		= &exynos_pcie_host_ops,
> >  	.res_ops		= &exynos_res_ops_data,
> > +	.soc_variant		= EXYNOS_5433,
> > +	.device_mode		= DW_PCIE_RC_TYPE,
> >  };
> 
> >  static const struct of_device_id exynos_pcie_of_match[] = {
> > @@ -449,6 +756,14 @@ static const struct of_device_id exynos_pcie_of_match[] = {
> >  		.compatible = "samsung,exynos5433-pcie",
> >  		.data = (void *) &exynos_5433_pcie_rc_pdata,
> >  	},


