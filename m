Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B004CCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 17:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=CdJ+7CGRqx2pwaR7nFsvxokq6e2hsboYVcp35XvnspA=; b=Oe+/QHccB4lWNq
	Vw3m7nABP3eXvZz9yceV2Qje3LPsjMD1XIz8VC1eMOAInz4qbgMMAM+yMnSFvXeti5wvlMtOZwL2b
	m/JlwV3RUotlYXX/l/ggLxq3swcEdxmkIu315dP2MmDk+UThHUKwd0dPZSvVBfbjrBxIRQOYUmXOt
	sXWxZigL0RDzy2MtS1Sf+nE61ys2UIUI6kZ7UiT0+8ptCeiqPIiJmx1AL1EFfHj5443AKwrYkdSao
	p0NOg/ttL6EZWHOM5CLReoN1Mz9HpXk6otOjctJr65l1rB+T26bJ+Gc2vOP0mLfU7CkhvnDs0pOjZ
	wbZkBWPzojeunUiJs4+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDnGI-0000000GOI2-3X66;
	Tue, 28 Oct 2025 17:13:34 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDnGH-0000000GOHY-0Ypu;
	Tue, 28 Oct 2025 17:13:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3B9306124B;
	Tue, 28 Oct 2025 17:13:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B658BC4CEE7;
	Tue, 28 Oct 2025 17:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761671611;
	bh=+cenkb0yL5U6fkb9PXEJLOZBBfbIw/K5JcCnxUVgehI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=GHWgETQ1RNiG4NgBjVLnhJH9atMiVJdloWNMv11jPg99tyK+rmBwAzqK9hTb4gVhT
	 2ZtFnJKwxLI4s2Q1P8yhoci5coU0j5l4vn2zCzKepsIfscxlIj7Zu5fXo/n3/KWGIz
	 hHMqKbrGfsuMHEa9JXdVniJNLDuD3aTag4FRYpY8MZC7Tdt+1tj5Isr/dt42Ncc8NJ
	 sH4jdipg5MKIr6H7mirxdjLBByUiKYKRocaUoLgV9TRC+GCZAmUas2q83NjwZJ561i
	 7CYd2BuJMIACVxarC+376c/AlA60uR1HFbp6n2bx39j1c/IyYibnP+f7s04InfotSN
	 hUMwQm5MxpCww==
Date: Tue, 28 Oct 2025 12:13:30 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Jacky Chou <jacky_chou@aspeedtech.com>
Cc: lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org,
	robh@kernel.org, bhelgaas@google.com, krzk+dt@kernel.org,
	conor+dt@kernel.org, joel@jms.id.au, andrew@codeconstruct.com.au,
	vkoul@kernel.org, kishon@kernel.org, linus.walleij@linaro.org,
	p.zabel@pengutronix.de, linux-aspeed@lists.ozlabs.org,
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org, openbmc@lists.ozlabs.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v4 8/9] PCI: aspeed: Add ASPEED PCIe RC driver
Message-ID: <20251028171330.GA1506282@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251027095825.181161-9-jacky_chou@aspeedtech.com>
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

On Mon, Oct 27, 2025 at 05:58:24PM +0800, Jacky Chou wrote:
> Introduce PCIe Root Complex driver for ASPEED SoCs. Support RC
> initialization, reset, clock, IRQ domain, and MSI domain setup.
> Implement platform-specific setup and register configuration for
> ASPEED. And provide PCI config space read/write and INTx/MSI
> interrupt handling.

> +config PCIE_ASPEED
> +	bool "ASPEED PCIe controller"
> +	depends on ARCH_ASPEED || COMPILE_TEST
> +	depends on OF
> +	depends on PCI_MSI
> +	select IRQ_MSI_LIB
> +	help
> +	  Enable this option to support the PCIe controller found on ASPEED
> +	  SoCs.
> +
> +	  This driver provides initialization and management for PCIe
> +	  Root Complex functionality, including interrupt and MSI support.

Maybe "INTx and MSI support", since MSI is an interrupt?

> +/* Complete status */

"Completion"

> +static int aspeed_ast2700_ahb_remap_to_bar(struct aspeed_pcie *pcie)
> +{
> +	struct resource_entry *win, *tmp;
> +	struct pci_host_bridge *bridge = pcie->host;
> +
> +	/* Configure AHB remapping to BAR on AST27x0.
> +	 * The BAR region is HW-fixed in AST27x0, these BARs will be filled
> +	 * in the ranges of pcie node in DT.
> +	 */

I don't understand what "HW-fixed" means here.  It looks like you're
writing host bridge window addresses (that came from DT) to the
hardware.  That sounds like they're not actually "fixed" but
programmable.

Host bridge windows are not BARs themselves.  Mem space for devices
below the host bridge is allocated from the windows, and the addresses
are programmed into BARs of those downstream devices.

Multi-line comment style:

  /*
   * Configure ...
   */

Wrap to fill 78 columns, or add blank lines between paragraphs.

> +	resource_list_for_each_entry_safe(win, tmp, &bridge->windows) {
> +		struct resource *res = win->res;
> +
> +		if (resource_type(res) == IORESOURCE_MEM &&
> +		    !(res->flags & IORESOURCE_MEM_64)) {
> +			writel(ASPEED_REMAP_BAR_BASE(res->start),
> +			       pcie->reg + ASPEED_H2X_REMAP_DIRECT_ADDR);
> +			return 0;
> +		}
> +	}
> +
> +	return -ENODEV;
> +}
> +
> +static int aspeed_ast2700_setup(struct platform_device *pdev)
> +{
> +	struct aspeed_pcie *pcie = platform_get_drvdata(pdev);
> +	struct device *dev = pcie->dev;
> +	int ret;
> +
> +	pcie->cfg = syscon_regmap_lookup_by_phandle(dev->of_node,
> +						    "aspeed,pciecfg");
> +	if (IS_ERR(pcie->cfg))
> +		return dev_err_probe(dev, PTR_ERR(pcie->cfg),
> +				     "failed to map pciecfg base\n");
> +
> +	regmap_update_bits(pcie->cfg, ASPEED_SCU_60,
> +			   ASPEED_RC_E2M_PATH_EN | ASPEED_RC_H2XS_PATH_EN |
> +			   ASPEED_RC_H2XD_PATH_EN | ASPEED_RC_H2XX_PATH_EN |
> +			   ASPEED_RC_UPSTREAM_MEM_EN,
> +			   ASPEED_RC_E2M_PATH_EN | ASPEED_RC_H2XS_PATH_EN |
> +			   ASPEED_RC_H2XD_PATH_EN | ASPEED_RC_H2XX_PATH_EN |
> +			   ASPEED_RC_UPSTREAM_MEM_EN);
> +	regmap_write(pcie->cfg, ASPEED_SCU_64,
> +		     ASPEED_RC0_DECODE_DMA_BASE(0) |
> +		     ASPEED_RC0_DECODE_DMA_LIMIT(0xff) |
> +		     ASPEED_RC1_DECODE_DMA_BASE(0) |
> +		     ASPEED_RC1_DECODE_DMA_LIMIT(0xff));
> +	regmap_write(pcie->cfg, ASPEED_SCU_70, ASPEED_DISABLE_EP_FUNC);
> +
> +	aspeed_host_reset(pcie);
> +
> +	writel(0, pcie->reg + ASPEED_H2X_CTRL);
> +	writel(ASPEED_H2X_BRIDGE_EN | ASPEED_H2X_BRIDGE_DIRECT_EN,
> +	       pcie->reg + ASPEED_H2X_CTRL);
> +
> +	ret = aspeed_ast2700_ahb_remap_to_bar(pcie);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to assign BAR\n");

This is not assigning *BARs*.  A host bridge doesn't have BARs in the
PCI spec sense.  It might have programmable address ranges, but the
host bridge is not itself a PCI device, so its programmability is
device specific.

