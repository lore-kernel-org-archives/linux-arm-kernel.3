Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A41A5C19776
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 22:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=bqhNhMwrLxeMVtpppavu6NpRPuMSnYo6oSldDsR67Ps=; b=lQPrHZyfOMPy5q
	t7xsZNU47QjBKiVRrefnBZE4KMckfR0FUfzPDSraIqeYee+CGSu0iF5dnG2q54z0RWRbY2sgfBvE9
	5MoSCDA9OHzSOF7tRJRd4+lkrOTmiVLCI8nVlADvPxJhHtuX/ZPCLX6OXYrQvZTsdPJdlZEnTwFUH
	osiTcN9YRPxzUudViimG1KJpDB6X6yqwI6KiYdUYMTw5Ns37n8t1mLMIe4UotKkQiw91su6UM6fAQ
	LRmq2Q4TLPoTyHvld/RxZb5J7GCYIBSlKtvr8U3xqQadtYfH8GatV8jVFZHhDTlUHSPoukewyHYS8
	demjiWkJrb5p8zUi2KYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnPqL-00000005bK7-3MSi;
	Wed, 26 Feb 2025 22:25:29 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnPZu-00000005Z0p-0YbM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 22:08:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 397105C1292;
	Wed, 26 Feb 2025 22:07:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F498C4CED6;
	Wed, 26 Feb 2025 22:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740607708;
	bh=QbUAkvbUHg9cT3BxA/KVVOs8O43DiKCmxS/Svt4jiFE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=I4H338xo1mfVr6Ujw1djIt8JYyAEE2PEItm2qphZ7Vc0HhqmIzu9F+ebvxPfXqBMd
	 E9W7+ilz7ArbdgkYna8Qhzccp6ITfKfttaihg1KdcTLpuy9iNgSozYMj5dgS9dP+DK
	 fWkKwEOZe5nyATbwy6acLFTbGJF02O8nxPPzcFqfxoa2FCEo2Ca3DFSEVx8Wd2IotW
	 KdAF0Uv5YXwrYllDG33w2RT3aFsYaxpmfRf+W11+vbklY2jTINbEs6gIFDYT54Bh4d
	 Ri3cy33ZDoHUWP937iA9O6ylXMscdCo+0pw7UJwU2WnXHIsx3XdEPrLKQcTOCZrse9
	 SKSh9ginKHdlQ==
Date: Wed, 26 Feb 2025 16:08:26 -0600
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
Message-ID: <20250226220826.GA561554@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250226024256.1678103-3-hongxing.zhu@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_140830_219563_5E04B932 
X-CRM114-Status: GOOD (  19.08  )
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

Nice, thanks for getting rid of this!

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
> -
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

