Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9554BCAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Sep 2025 20:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=VSKLyM00phHW0wHDaWMQHUhD1sQtOyruhpvSDC8vCOY=; b=lyNzwcxYFpuX69
	dgw96y3m0hmoI9uX7t/V+u90lLfsXcS6U0X5CkxNMxg0nXLQi5VfxgFdzWznYEed6MAxey5EZaKf9
	jr23C3rLoTVOw9C+8mYAOWA+F78BAcx2ju4sXN+SmHH5S6CWTTMqXNbCweM6+nPTdPmXYF859uKVU
	J9Fe2gHyQV/sDeO/cnxpHauONcGQHpIY05aJxHQMb/zhxf9vYd1Nvc0VG4w7k6Mztrfp9lP6Air9Q
	vN3vZ+0YEPuC3o1UEPo4kBH5uRapPfm96T/QnyC8RQpScWu7j4U7tHcBH2YrVIYx1arAvxt23ZOMo
	RklwpihEQ0SNJi+pXBkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2FRw-00000004SER-1TgJ;
	Fri, 26 Sep 2025 20:53:52 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2FRv-00000004SDs-2VT1;
	Fri, 26 Sep 2025 20:53:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A4B0A61F6B;
	Fri, 26 Sep 2025 20:53:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22861C4CEF4;
	Fri, 26 Sep 2025 20:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758920030;
	bh=+2j9/0CdRMeV9jn7IdyUu73NHHsTC5nbTEOVlrmZkHo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=MmvtP3EQERr0QqgKsC48/0imRxbynvn6Lx+1COGwNGlSb+ElEt1nsaqYPEODbYYlK
	 hLnKV9dVAZn8aUynnmXVEn98uJwFTDI3G03xHiu87tOqop1k56HYxOB6FwBqcWcspc
	 cy/ELMTE3aQOAUty5ZONn4BC3ECwkkLySQEvA0sb04SrQPMarGDHrGlm0zXHIYaE/M
	 /spoBSuskav8QFCqoxrTmClj30NXnDuhIzQF50I1cb2TjgNuvkvwGgwugyqONcfJ3E
	 bn8PPYEtIDdGTvQPdNTminngrfQ+uyYIFfWV+5DanTiuhPe2YDhgAbdxYhe8UJJfB3
	 RGqdkA3uIcujw==
Date: Fri, 26 Sep 2025 15:53:48 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Ryder Lee <ryder.lee@mediatek.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, upstream@airoha.com
Subject: Re: [PATCH v3 4/4] PCI: mediatek: add support for Airoha AN7583 SoC
Message-ID: <20250926205348.GA2266187@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250925162332.9794-5-ansuelsmth@gmail.com>
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

In subject:

  PCI: mediatek: Add support for Airoha AN7583 SoC

On Thu, Sep 25, 2025 at 06:23:18PM +0200, Christian Marangi wrote:
> Add support for the second PCIe line present on Airoha AN7583 SoC.

What is a "second PCIe line"?  Does this mean a second Root Complex?
Or a second Root Port in a Root Complex?

I guess maybe it just means this adds support for another variant of
the Mediatek IP that is used in Airoha AN7583?

> This is based on the Mediatek Gen1/2 PCIe driver and similar to Gen3
> also require workaround for the reset signals.
> 
> Introduce a new bool to skip having to reset signals and also introduce
> some additional logic to configure the PBUS registers required for
> Airoha SoC.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  drivers/pci/controller/pcie-mediatek.c | 85 +++++++++++++++++++-------
>  1 file changed, 63 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/pci/controller/pcie-mediatek.c b/drivers/pci/controller/pcie-mediatek.c
> index 24cc30a2ab6c..640d1f1a6478 100644
> --- a/drivers/pci/controller/pcie-mediatek.c
> +++ b/drivers/pci/controller/pcie-mediatek.c
> @@ -147,6 +147,7 @@ struct mtk_pcie_port;
>   * @need_fix_class_id: whether this host's class ID needed to be fixed or not
>   * @need_fix_device_id: whether this host's device ID needed to be fixed or not
>   * @no_msi: Bridge has no MSI support, and relies on an external block
> + * @skip_pcie_rstb: Skip calling RSTB bits on PCIe probe
>   * @device_id: device ID which this host need to be fixed
>   * @ops: pointer to configuration access functions
>   * @startup: pointer to controller setting functions
> @@ -156,6 +157,7 @@ struct mtk_pcie_soc {
>  	bool need_fix_class_id;
>  	bool need_fix_device_id;
>  	bool no_msi;
> +	bool skip_pcie_rstb;
>  	unsigned int device_id;
>  	struct pci_ops *ops;
>  	int (*startup)(struct mtk_pcie_port *port);
> @@ -679,28 +681,30 @@ static int mtk_pcie_startup_port_v2(struct mtk_pcie_port *port)
>  		regmap_update_bits(pcie->cfg, PCIE_SYS_CFG_V2, val, val);
>  	}
>  
> -	/* Assert all reset signals */
> -	writel(0, port->base + PCIE_RST_CTRL);
> -
> -	/*
> -	 * Enable PCIe link down reset, if link status changed from link up to
> -	 * link down, this will reset MAC control registers and configuration
> -	 * space.
> -	 */
> -	writel(PCIE_LINKDOWN_RST_EN, port->base + PCIE_RST_CTRL);
> -
> -	/*
> -	 * Described in PCIe CEM specification sections 2.2 (PERST# Signal) and
> -	 * 2.2.1 (Initial Power-Up (G3 to S0)). The deassertion of PERST# should
> -	 * be delayed 100ms (TPVPERL) for the power and clock to become stable.
> -	 */
> -	msleep(100);
> -
> -	/* De-assert PHY, PE, PIPE, MAC and configuration reset	*/
> -	val = readl(port->base + PCIE_RST_CTRL);
> -	val |= PCIE_PHY_RSTB | PCIE_PERSTB | PCIE_PIPE_SRSTB |
> -	       PCIE_MAC_SRSTB | PCIE_CRSTB;
> -	writel(val, port->base + PCIE_RST_CTRL);
> +	if (!soc->skip_pcie_rstb) {
> +		/* Assert all reset signals */
> +		writel(0, port->base + PCIE_RST_CTRL);
> +
> +		/*
> +		 * Enable PCIe link down reset, if link status changed from link up to
> +		 * link down, this will reset MAC control registers and configuration
> +		 * space.
> +		 */
> +		writel(PCIE_LINKDOWN_RST_EN, port->base + PCIE_RST_CTRL);
> +
> +		/*
> +		 * Described in PCIe CEM specification sections 2.2 (PERST# Signal) and
> +		 * 2.2.1 (Initial Power-Up (G3 to S0)). The deassertion of PERST# should
> +		 * be delayed 100ms (TPVPERL) for the power and clock to become stable.

Wrap these comments to fit in 80 columns like the rest of the file.

You only moved the comment, without updating it, but since you're
touching it anyway, it's a chance to add the CEM spec revision, e.g.,
"PCIe CEM r5.0, sec 2.2"

> +		 */
> +		msleep(100);

Use PCIE_T_PVPERL_MS if that's what this is.

> +
> +		/* De-assert PHY, PE, PIPE, MAC and configuration reset	*/
> +		val = readl(port->base + PCIE_RST_CTRL);
> +		val |= PCIE_PHY_RSTB | PCIE_PERSTB | PCIE_PIPE_SRSTB |
> +		       PCIE_MAC_SRSTB | PCIE_CRSTB;
> +		writel(val, port->base + PCIE_RST_CTRL);
> +	}
>  
>  	/* Set up vendor ID and class code */
>  	if (soc->need_fix_class_id) {
> @@ -1105,6 +1109,33 @@ static int mtk_pcie_probe(struct platform_device *pdev)
>  	if (err)
>  		goto put_resources;
>  
> +	if (device_is_compatible(dev, "airoha,an7583-pcie")) {
> +		struct resource_entry *entry;
> +		struct regmap *pbus_regmap;
> +		resource_size_t addr;
> +		u32 args[2], size;
> +
> +		/*
> +		 * Configure PBus base address and base address mask to allow the
> +		 * hw to detect if a given address is accessible on PCIe controller.

Wrap to fit in 80 columns.

> +		 */
> +		pbus_regmap = syscon_regmap_lookup_by_phandle_args(dev->of_node,
> +								   "mediatek,pbus-csr",
> +								   ARRAY_SIZE(args),
> +								   args);
> +		if (IS_ERR(pbus_regmap))
> +			return PTR_ERR(pbus_regmap);
> +
> +		entry = resource_list_first_type(&host->windows, IORESOURCE_MEM);
> +		if (!entry)
> +			return -ENODEV;
> +
> +		addr = entry->res->start - entry->offset;
> +		regmap_write(pbus_regmap, args[0], lower_32_bits(addr));
> +		size = lower_32_bits(resource_size(entry->res));
> +		regmap_write(pbus_regmap, args[1], GENMASK(31, __fls(size)));
> +	}
> +
>  	return 0;
>  
>  put_resources:
> @@ -1205,6 +1236,15 @@ static const struct mtk_pcie_soc mtk_pcie_soc_mt7622 = {
>  	.setup_irq = mtk_pcie_setup_irq,
>  };
>  
> +static const struct mtk_pcie_soc mtk_pcie_soc_an7583 = {
> +	.skip_pcie_rstb = true,
> +	.need_fix_class_id = true,
> +	.need_fix_device_id = false,

No need to specify "false" items; things are false by default since
members not explicitly initialized are set to zero.

> +	.ops = &mtk_pcie_ops_v2,
> +	.startup = mtk_pcie_startup_port_v2,
> +	.setup_irq = mtk_pcie_setup_irq,
> +};
> +
>  static const struct mtk_pcie_soc mtk_pcie_soc_mt7629 = {
>  	.need_fix_class_id = true,
>  	.need_fix_device_id = true,
> @@ -1215,6 +1255,7 @@ static const struct mtk_pcie_soc mtk_pcie_soc_mt7629 = {
>  };
>  
>  static const struct of_device_id mtk_pcie_ids[] = {
> +	{ .compatible = "airoha,an7583-pcie", .data = &mtk_pcie_soc_an7583 },
>  	{ .compatible = "mediatek,mt2701-pcie", .data = &mtk_pcie_soc_v1 },
>  	{ .compatible = "mediatek,mt7623-pcie", .data = &mtk_pcie_soc_v1 },
>  	{ .compatible = "mediatek,mt2712-pcie", .data = &mtk_pcie_soc_mt2712 },
> -- 
> 2.51.0
> 

