Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DA06C35FF8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 15:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=2YFbbFDESuwPDgLKEDR//uE/cE8lI5yHUKtWmPB95H0=; b=gRz3di1jVoK+Fu
	r2ZxoNm5iVf12Bf3zQBu3+KOFpd1rJzktHNAnadTeLpGtyqepKY8WVUysqLQv5tKlY41UqoS4UhbK
	3aul1rhR/Ag3X3BBLfmMGK4lJpRgJ3KCbtcPSuxdSY1iTYM01RBjOTJz4W3Gg21jiBVs19X4YdJFI
	mvHhqkkSIhacbaWMmaqf+mhEAtAg6Lwpqbr1XhQOLQlYxXvau1aY9VYZ5/tiJ8zOoFuoDwYBJkspk
	e6NoGUZwphjPLXJgXjznYVte4kQbI08YCwdsDXbchxyXmlnxuL4ueAjwWMYvPkE99rSsRHn0IYMfm
	T1rEZkaEF9GwNPZznKag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trfLn-00000003Fr6-3s0n;
	Mon, 10 Mar 2025 15:47:31 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1treme-000000036sf-0r8K
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 15:11:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6C70C5C6765;
	Mon, 10 Mar 2025 15:08:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B093DC4CEEF;
	Mon, 10 Mar 2025 15:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741619470;
	bh=atd+PUJZNIOrqCwFpaInjw5P9puj5TcBLXrLKnepJLc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=gjok9gkMjFNUJMrB2dSFP20dG5MFn7ciouO2+4x4hxhoxDYl9c5fWmVN3QffQhhPI
	 E/Vb86Y/PO2Py7XNnZmgS9eCGTSyWtPQ3d8xFM7SqUDAp9uMiN2hjVGECHZ9UeHPLX
	 Ci7y2irDK/Rx0tcOfOQJytkBCpzi4PtXFjKnMebcC3mjLfkEAJlrUIYRgU0w3lfl4t
	 s4MROwNpDJY5UJjQ2mOf7p6/tU+LYXxNtE/BUxidtLN/YgsRbgOhPT4bwD7LvPFpZf
	 GztVz0hEL+LG/uAZtJC2NQoNjgGAeP6kHiqPcjdol6//isZLLS2SVma16WKPUbmTjp
	 sbMN3nL1VrIIw==
Date: Mon, 10 Mar 2025 10:11:09 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, l.stach@pengutronix.de, lpieralisi@kernel.org,
	kw@linux.com, manivannan.sadhasivam@linaro.org, bhelgaas@google.com,
	s.hauer@pengutronix.de, festevam@gmail.com,
	devicetree@vger.kernel.org, linux-pci@vger.kernel.org,
	imx@lists.linux.dev, kernel@pengutronix.de,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/2] PCI: imx6: Use domain number replace the hardcodes
Message-ID: <20250310151109.GA540579@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250226024256.1678103-3-hongxing.zhu@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_081112_325077_02E74AF5 
X-CRM114-Status: GOOD (  23.32  )
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

On Wed, Feb 26, 2025 at 10:42:56AM +0800, Richard Zhu wrote:
> Use the domain number replace the hardcodes to uniquely identify
> different controller on i.MX8MQ platforms. No function changes.
> 
> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
> ---
>  drivers/pci/controller/dwc/pci-imx6.c | 14 ++++++--------
>  1 file changed, 6 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
> index 90ace941090f..ab9ebb783593 100644
> --- a/drivers/pci/controller/dwc/pci-imx6.c
> +++ b/drivers/pci/controller/dwc/pci-imx6.c
> @@ -41,7 +41,6 @@
>  #define IMX8MQ_GPR_PCIE_CLK_REQ_OVERRIDE	BIT(11)
>  #define IMX8MQ_GPR_PCIE_VREG_BYPASS		BIT(12)
>  #define IMX8MQ_GPR12_PCIE2_CTRL_DEVICE_TYPE	GENMASK(11, 8)
> -#define IMX8MQ_PCIE2_BASE_ADDR			0x33c00000
>  
>  #define IMX95_PCIE_PHY_GEN_CTRL			0x0
>  #define IMX95_PCIE_REF_USE_PAD			BIT(17)
> @@ -1474,7 +1473,6 @@ static int imx_pcie_probe(struct platform_device *pdev)
>  	struct dw_pcie *pci;
>  	struct imx_pcie *imx_pcie;
>  	struct device_node *np;
> -	struct resource *dbi_base;
>  	struct device_node *node = dev->of_node;
>  	int i, ret, req_cnt;
>  	u16 val;
> @@ -1515,10 +1513,6 @@ static int imx_pcie_probe(struct platform_device *pdev)
>  			return PTR_ERR(imx_pcie->phy_base);
>  	}
>  
> -	pci->dbi_base = devm_platform_get_and_ioremap_resource(pdev, 0, &dbi_base);
> -	if (IS_ERR(pci->dbi_base))
> -		return PTR_ERR(pci->dbi_base);

This makes me wonder.

IIUC this means that previously we set controller_id to 1 if the first
item in devicetree "reg" was 0x33c00000, and now we will set
controller_id to 1 if the devicetree "linux,pci-domain" property is 1.
This is good, but I think this new dependency on the correct
"linux,pci-domain" in devicetree should be mentioned in the commit
log.

My bigger worry is that we no longer set pci->dbi_base at all.  I see
that the only use of pci->dbi_base in pci-imx6.c was to determine the
controller_id, but this is a DWC-based driver, and the DWC core
certainly uses pci->dbi_base.  Are we sure that none of those DWC core
paths are important to pci-imx6.c?

>  	/* Fetch GPIOs */
>  	imx_pcie->reset_gpiod = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
>  	if (IS_ERR(imx_pcie->reset_gpiod))
> @@ -1565,8 +1559,12 @@ static int imx_pcie_probe(struct platform_device *pdev)
>  	switch (imx_pcie->drvdata->variant) {
>  	case IMX8MQ:
>  	case IMX8MQ_EP:
> -		if (dbi_base->start == IMX8MQ_PCIE2_BASE_ADDR)
> -			imx_pcie->controller_id = 1;
> +		ret = of_get_pci_domain_nr(node);
> +		if (ret < 0 || ret > 1)
> +			return dev_err_probe(dev, -ENODEV,
> +					     "failed to get valid pcie domain\n");
> +		else
> +			imx_pcie->controller_id = ret;
>  		break;
>  	default:
>  		break;
> -- 
> 2.37.1
> 

