Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EA14C77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 19:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=R2+kVPbXgl9AEYRzLrPo/voZe4EiBFt74eCL+IFcKvA=; b=rVqkZrvMCuvxws
	VB5vX0m+S0Tj13OhCJRt6hJfCc4ejAjkoukMo5sZjkOdo2+ymoRWCnmh9p6ZUfxlFO6T3DRamcg+J
	ejD2NVi9HS529PbZSsQEnqlI+N4K5R5u4en4TE0hkUjToYFJ+s/JsnoOHkhh1qsUgJjb0HoY8+Atk
	XTYOcH8AAW+4IDpHCFmUVwFTl0b9O2NIN7KeW+Q3vPpAjrPh3epPRExbcfZ8+UqMeTGkQeuaYHQJe
	ty6+UuGFnC2d2lZ/E9Ds5anFPJaRnds8KNGN5+r5K7Fmwv9yi3F+sxiSF+/u/tQfoid5F+wnxhGju
	EVbh8QNy9PauP1UWPoUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVF0P-0000000Fg8O-3nOR;
	Fri, 27 Jun 2025 19:45:01 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVEmf-0000000Fdk5-07Xi;
	Fri, 27 Jun 2025 19:30:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 389A7A52FB8;
	Fri, 27 Jun 2025 19:30:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A284EC4CEE3;
	Fri, 27 Jun 2025 19:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751052647;
	bh=Ewt6x+TyLrnKWB9bcFNXn39ClBlBLwSs9oVDUkhN+5s=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=RPazJm95MCXTQsAh4h8EI9hYme1woTQj/7GHQ1aNwZf1LH+YtE91kNPlux6ZUBXs3
	 tmn7wLtMkotusbLg+Ipj1PXvDzK+Ih5zJaBq89DdFZX2y+yNquxaS3TzCfVg+rKSE3
	 cMh1XG5uXx3I+902Br+hvx+hOoBs5W1oSuav0bvOYvWquAGXVszjNqV0DMxIEZ9lXi
	 SQQ7PRmO6QpvO9Ghk+62IjRV130WaRg+4TzLphnxY5Me5G6m0eD5LpBqLnRjcjUarm
	 7YwJrjnxNeExgej4gvKNBhNgFbCi1cSRqguatqAJKpKOcGCFTA+mrrk3dp/kpQtqS6
	 i5SNPirztErfA==
Date: Fri, 27 Jun 2025 14:30:46 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Shradha Todi <shradha.t@samsung.com>
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org, linux-fsd@tesla.com,
	manivannan.sadhasivam@linaro.org, lpieralisi@kernel.org,
	kw@linux.com, robh@kernel.org, bhelgaas@google.com,
	jingoohan1@gmail.com, krzk+dt@kernel.org, conor+dt@kernel.org,
	alim.akhtar@samsung.com, vkoul@kernel.org, kishon@kernel.org,
	arnd@arndb.de, m.szyprowski@samsung.com, jh80.chung@samsung.com,
	pankaj.dubey@samsung.com
Subject: Re: [PATCH v2 09/10] PCI: exynos: Add support for Tesla FSD SoC
Message-ID: <20250627193046.GA1673824@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250625165229.3458-10-shradha.t@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_123049_193577_88EDF5DF 
X-CRM114-Status: GOOD (  19.90  )
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

On Wed, Jun 25, 2025 at 10:22:28PM +0530, Shradha Todi wrote:
> Add host and endpoint controller driver support for FSD SoC.

> +++ b/drivers/pci/controller/dwc/pci-exynos.c
> @@ -20,6 +20,8 @@
>  #include <linux/regulator/consumer.h>
>  #include <linux/mod_devicetable.h>
>  #include <linux/module.h>
> +#include <linux/regmap.h>
> +#include <linux/mfd/syscon.h>

The trend is to sort these alphabetically.  The last couple additions
didn't observe this, but maybe these new ones could go a little
farther up and make it more sorted rather than less?

> +#define FSD_PCIE_CXPL_DEBUG_00_31		0x2C8

Existing #defines use lower-case hex; please follow suit.

> +/* to store different SoC variants of Samsung */
> +enum samsung_pcie_variants {
> +	FSD,
> +	EXYNOS_5433,
> +};

>  struct samsung_pcie_pdata {
>  	struct pci_ops				*pci_ops;
>  	const struct dw_pcie_ops		*dwc_ops;
>  	const struct dw_pcie_host_ops		*host_ops;
> +	const struct dw_pcie_ep_ops		*ep_ops;
>  	const struct samsung_res_ops		*res_ops;
> +	unsigned int				soc_variant;
> +	enum dw_pcie_device_mode		device_mode;
>  };

> +static u32 fsd_pcie_read_dbi(struct dw_pcie *pci, void __iomem *base,
> +				u32 reg, size_t size)
> +{
> +	void __iomem *addr;
> +	u32 val;
> +
> +	addr = fsd_atu_setting(pci, base);
> +
> +	dw_pcie_read(addr + reg, size, &val);
> +
> +	return val;

Remove blank lines to match style of fsd_pcie_write_dbi2().

> +}
> +
> +static void fsd_pcie_write_dbi(struct dw_pcie *pci, void __iomem *base,
> +				u32 reg, size_t size, u32 val)
> +{
> +	void __iomem *addr;
> +
> +	addr = fsd_atu_setting(pci, base);
> +
> +	dw_pcie_write(addr + reg, size, val);

Ditto.

> +}
> +
> +static void fsd_pcie_write_dbi2(struct dw_pcie *pci, void __iomem *base,
> +				u32 reg, size_t size, u32 val)
> +{
> +	struct exynos_pcie *ep = to_exynos_pcie(pci);
> +
> +	fsd_atu_setting(pci, base);
> +	dw_pcie_write(pci->dbi_base + reg, size, val);
> +	regmap_write(ep->sysreg, ep->sysreg_offset, ADDR_TYPE_DBI);
> +}

> +static int fsd_pcie_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
> +				 unsigned int type, u16 interrupt_num)
> +{
> +	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> +
> +	switch (type) {
> +	case PCI_IRQ_INTX:
> +		return dw_pcie_ep_raise_intx_irq(ep, func_no);
> +	case PCI_IRQ_MSIX:
> +		dev_err(pci->dev, "EP does not support MSIX\n");

s/MSIX/MSI-X/ to match spec usage.

> @@ -373,13 +617,43 @@ static int exynos_pcie_probe(struct platform_device *pdev)
>  		return ret;
>  
>  	platform_set_drvdata(pdev, ep);
> -	ret = samsung_irq_init(ep, pdev);
> -	if (ret)
> -		goto fail_regulator;
> -	ep->pci.pp.ops = pdata->host_ops;
> -	ret = dw_pcie_host_init(&ep->pci.pp);
> -	if (ret < 0)
> +
> +	if (pdata->res_ops->set_device_mode)
> +		pdata->res_ops->set_device_mode(ep);
> +
> +	switch (ep->pdata->device_mode) {
> +	case DW_PCIE_RC_TYPE:
> +		ret = samsung_irq_init(ep, pdev);
> +		if (ret)
> +			goto fail_regulator;
> +
> +		ep->pci.pp.ops = pdata->host_ops;
> +
> +		ret = dw_pcie_host_init(&ep->pci.pp);
> +		if (ret < 0)
> +			goto fail_phy_init;
> +
> +		break;
> +	case DW_PCIE_EP_TYPE:
> +		phy_init(ep->phy);
> +
> +		ep->pci.ep.ops = pdata->ep_ops;
> +
> +		ret = dw_pcie_ep_init(&ep->pci.ep);
> +		if (ret < 0)
> +			goto fail_phy_init;
> +
> +		ret = dw_pcie_ep_init_registers(&ep->pci.ep);
> +		if (ret)
> +			goto fail_phy_init;
> +
> +		pci_epc_init_notify(ep->pci.ep.epc);
> +
> +		break;
> +	default:
> +		dev_err(dev, "invalid device type\n");
>  		goto fail_phy_init;
> +	}

This would be a little nicer if you added soc_variant and device_mode
and the code that sets and tests them for exynos_5433 first in a
separate patch.  Then it would be more obvious that the new FSD parts
don't affect exynos_5433 since this patch would only be *adding*
FSD-specific things.

>  static const struct samsung_pcie_pdata exynos_5433_pcie_rc_pdata = {
>  	.dwc_ops		= &exynos_dw_pcie_ops,
>  	.pci_ops		= &exynos_pci_ops,
>  	.host_ops		= &exynos_pcie_host_ops,
>  	.res_ops		= &exynos_res_ops_data,
> +	.soc_variant		= EXYNOS_5433,
> +	.device_mode		= DW_PCIE_RC_TYPE,
>  };

>  static const struct of_device_id exynos_pcie_of_match[] = {
> @@ -449,6 +756,14 @@ static const struct of_device_id exynos_pcie_of_match[] = {
>  		.compatible = "samsung,exynos5433-pcie",
>  		.data = (void *) &exynos_5433_pcie_rc_pdata,
>  	},

