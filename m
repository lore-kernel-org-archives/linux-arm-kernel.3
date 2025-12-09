Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82CD3D3B7EA
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Dec 2025 00:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=2ZscvsbGvY30JuXEtwJ/NklAkr1juTvT+P51+rUN4M8=; b=ar+sLEJcgaBiGU
	Crvia5QK7MUbNneV9CY0yrdfgC45ulYehEQOMHf4Fr7edJOI6bsaqQbFEEwmzGnVJG6nG4t7ucIUi
	ckMqq569N979qK6+z2dlzm4IqKr+ET1431HIRna9okIN3FhuJKfvcbVRWP5uaqabWn1q4ybYrR85L
	j+T4/49O3dMSMfT5K7cSZVYv0Txk0j6mVQV6EkJHTVVZHz/TuOClFr6thjAHYEAoBDiZoQ2tB1Tjf
	yXxiCmf6r8m5jAkH7Qq3KK8mcsCypZQCzRcImciNPaQkasMhqjF8A1ce+1I2EyUHuJRsqS3qfSNYQ
	1/c1Yi/WhTg3NtjXoc2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSlJv-0000000DeCq-2oZO;
	Tue, 09 Dec 2025 00:11:11 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSlJu-0000000DeCf-0p7P;
	Tue, 09 Dec 2025 00:11:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 31F6060125;
	Tue,  9 Dec 2025 00:11:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF78BC4CEF1;
	Tue,  9 Dec 2025 00:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765239068;
	bh=7ptARhGnIW0rweJs/X7vTtC/SQB8ulRmWeebM2Urvl0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=Nzqe2YsLmvHdUUpvvSUvm6rLElIkqyZsP8E7UC7VgLN1jMvslaQaB65EuuR2M3tQD
	 ++rs5KQFBsdOe7SSQ8hVf+DJAugUoPM5Mqrfs69Wm5NDb1BwhrWGYUAduiY2Yokwcw
	 UnX/Dznj2igM6Bvu9sfjXeM7bTJaA4vS7oKDjiqP6a78W6GKZiw//u+Q7WQb61e+KS
	 HRkk6gQ/8ovRTrwFr5gibfZmzjuyR5eHFLZzYqvj1cKSwTFL0LbWpbU7omxzWiVhGp
	 mAEOHH5Lmz7F8T0wk0TahZiroHww1QftElDdmGAe4Dk+Qfg0wy4JVD6zQ794GMZXJu
	 /flhU9gTQ0Z9A==
Date: Mon, 8 Dec 2025 18:11:07 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Jacky Chou <jacky_chou@aspeedtech.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-aspeed@lists.ozlabs.org, linux-pci@vger.kernel.org,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v6 6/7] PCI: aspeed: Add ASPEED PCIe RC driver
Message-ID: <20251209001107.GA3430423@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251201-upstream_pcie_rc-v6-6-8c8800c56b16@aspeedtech.com>
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

On Mon, Dec 01, 2025 at 02:29:16PM +0800, Jacky Chou wrote:
> Introduce PCIe Root Complex driver for ASPEED SoCs. Support RC
> initialization, reset, clock, IRQ domain, and MSI domain setup.
> Implement platform-specific setup and register configuration for
> ASPEED. And provide PCI config space read/write and INTx/MSI
> interrupt handling.
> ...

> +struct aspeed_pcie {
> +	struct pci_host_bridge *host;
> +	struct device *dev;
> +	void __iomem *reg;
> +	struct regmap *ahbc;
> +	struct regmap *cfg;
> +	const struct aspeed_pcie_rc_platform *platform;
> +	struct list_head ports;
> +
> +	u8 tx_tag;
> +	int host_bus_num;

Only needs a u8.

> +static int aspeed_pcie_port_init(struct aspeed_pcie_port *port)
> +{
> +	struct aspeed_pcie *pcie = port->pcie;
> +	struct device *dev = pcie->dev;
> +	int ret;
> +
> +	ret = clk_prepare_enable(port->clk);
> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				     "failed to set clock for slot (%d)\n",
> +				     port->slot);
> +
> +	ret = phy_init(port->phy);
> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				     "failed to init phy pcie for slot (%d)\n",
> +				     port->slot);
> +
> +	ret = phy_set_mode_ext(port->phy, PHY_MODE_PCIE, PHY_MODE_PCIE_RC);
> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				     "failed to set phy mode for slot (%d)\n",
> +				     port->slot);
> +
> +	reset_control_deassert(port->perst);
> +	mdelay(PCIE_RESET_CONFIG_WAIT_MS);

I think this should use msleep().

> +static int aspeed_ast2600_setup(struct platform_device *pdev)
> +{
> +	struct aspeed_pcie *pcie = platform_get_drvdata(pdev);
> +	struct device *dev = pcie->dev;
> +
> +	pcie->ahbc = syscon_regmap_lookup_by_phandle(dev->of_node,
> +						     "aspeed,ahbc");
> +	if (IS_ERR(pcie->ahbc))
> +		return dev_err_probe(dev, PTR_ERR(pcie->ahbc),
> +				     "failed to map ahbc base\n");
> +
> +	aspeed_host_reset(pcie);
> +
> +	regmap_write(pcie->ahbc, ASPEED_AHBC_KEY, ASPEED_AHBC_UNLOCK_KEY);
> +	regmap_update_bits(pcie->ahbc, ASPEED_AHBC_ADDR_MAPPING,
> +			   ASPEED_PCIE_RC_MEMORY_EN, ASPEED_PCIE_RC_MEMORY_EN);
> +	regmap_write(pcie->ahbc, ASPEED_AHBC_KEY, ASPEED_AHBC_UNLOCK);
> +
> +	/* Due to the BAR assignment is fixed mapping on 0x6000_0000.*/
> +	writel(ASPEED_AHB_REMAP_LO_ADDR(0x600) | ASPEED_AHB_MASK_LO_ADDR(0xe00),
> +	       pcie->reg + ASPEED_H2X_AHB_ADDR_CONFIG0);
> +	writel(ASPEED_AHB_REMAP_HI_ADDR(0),
> +	       pcie->reg + ASPEED_H2X_AHB_ADDR_CONFIG1);

I assume this ASPEED_H2X_AHB_ADDR_CONFIG is doing basically the same
thing as aspeed_ast2700_remap_pci_addr() below, so see the comments
there.

> +	writel(ASPEED_AHB_MASK_HI_ADDR(~0),
> +	       pcie->reg + ASPEED_H2X_AHB_ADDR_CONFIG2);
> +	writel(ASPEED_H2X_BRIDGE_EN, pcie->reg + ASPEED_H2X_CTRL);
> +
> +	writel(ASPEED_PCIE_RX_DMA_EN | ASPEED_PCIE_RX_LINEAR |
> +	       ASPEED_PCIE_RX_MSI_SEL | ASPEED_PCIE_RX_MSI_EN |
> +	       ASPEED_PCIE_WAIT_RX_TLP_CLR | ASPEED_PCIE_RC_RX_ENABLE |
> +	       ASPEED_PCIE_RC_ENABLE,
> +	       pcie->reg + ASPEED_H2X_DEV_CTRL);
> +
> +	writel(ASPEED_RC_TLP_TX_TAG_NUM, pcie->reg + ASPEED_H2X_DEV_TX_TAG);
> +
> +	pcie->host->ops = &aspeed_ast2600_pcie_ops;
> +	pcie->host->child_ops = &aspeed_ast2600_pcie_child_ops;
> +
> +	return 0;
> +}
> +
> +static int aspeed_ast2700_remap_pci_addr(struct aspeed_pcie *pcie)
> +{
> +	struct device_node *dev_node = pcie->dev->of_node;
> +	struct of_pci_range range;
> +	struct of_pci_range_parser parser;
> +	int ret;
> +
> +	ret = of_pci_range_parser_init(&parser, dev_node);
> +	if (ret)
> +		return ret;
> +
> +	for_each_of_pci_range(&parser, &range) {
> +		if ((range.flags & IORESOURCE_TYPE_BITS) == IORESOURCE_MEM) {
> +			writel(ASPEED_REMAP_PCI_ADDR_31_12(range.pci_addr),
> +			       pcie->reg + ASPEED_H2X_REMAP_PCI_ADDR_LO);
> +			writel(ASPEED_REMAP_PCI_ADDR_63_32(range.pci_addr),
> +			       pcie->reg + ASPEED_H2X_REMAP_PCI_ADDR_HI);
> +			return 0;

It looks like this is essentially hardcoding the offset between the
parent-bus-address and the child-bus-address in the DT 'ranges'
property.  Since ASPEED_REMAP_PCI_ADDR_31_12() and
ASPEED_REMAP_PCI_ADDR_63_32() do nothing except mask out the low 12
bits, I assume that offset is zero.

But this should not be hard-coded at all; it should be extracted from
'ranges'.  I don't think we really have a consistent way of doing
this, but you can take a look at how these other drivers program
"outbound" mappings like this using bridge->windows:

  cdns_pcie_hpa_host_init_address_translation()
  dw_pcie_iatu_setup()
  mobiveil_host_init()
  xgene_pcie_map_ranges()
  iproc_pcie_map_ranges()
  rzg3s_pcie_parse_map_ranges()

> +static int aspeed_pcie_parse_dt(struct aspeed_pcie *pcie)
> +{
> +	struct device *dev = pcie->dev;
> +	struct device_node *node = dev->of_node;
> +	int ret;
> +
> +	for_each_available_child_of_node_scoped(node, child) {
> +		int slot;
> +		const char *type;
> +
> +		ret = of_property_read_string(child, "device_type", &type);
> +		if (ret || strcmp(type, "pci"))
> +			continue;
> +
> +		ret = of_pci_get_devfn(child);
> +		if (ret < 0)
> +			return dev_err_probe(dev, ret,
> +					     "failed to parse devfn\n");
> +
> +		slot = PCI_SLOT(ret);
> +
> +		ret = aspeed_pcie_parse_port(pcie, child, slot);
> +		if (ret)
> +			return ret;

It looks unnecessarily complicated to put each port on a list in
aspeed_pcie_parse_port() and then iterate over that list in
aspeed_pcie_init_ports().

I think you could just do something like:

  aspeed_pcie_parse_port();
  aspeed_pcie_port_init();

and get rid of the list completely.

> +	}
> +
> +	if (list_empty(&pcie->ports))
> +		return dev_err_probe(dev, -ENODEV,
> +				     "No PCIe port found in DT\n");
> +
> +	return 0;
> +}
> +
> +static int aspeed_pcie_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct pci_host_bridge *host;
> +	struct aspeed_pcie *pcie;
> +	struct resource_entry *entry;
> +	const struct aspeed_pcie_rc_platform *md;
> +	int irq, ret;
> +
> +	md = of_device_get_match_data(dev);
> +	if (!md)
> +		return -ENODEV;
> +
> +	host = devm_pci_alloc_host_bridge(dev, sizeof(*pcie));
> +	if (!host)
> +		return -ENOMEM;
> +
> +	pcie = pci_host_bridge_priv(host);
> +	pcie->dev = dev;
> +	pcie->tx_tag = 0;
> +	platform_set_drvdata(pdev, pcie);
> +
> +	pcie->platform = md;
> +	pcie->host = host;
> +	INIT_LIST_HEAD(&pcie->ports);
> +
> +	/* Get root bus num for cfg command to decide tlp type 0 or type 1 */
> +	entry = resource_list_first_type(&host->windows, IORESOURCE_BUS);
> +	if (entry)
> +		pcie->host_bus_num = entry->res->start;

s/host_bus_num/root_bus_nr/   to match struct altera_pcie

