Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC2F3D32D97
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 19:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=QYpZQZV9Sf9mUJyRv9SP0b5m7hBFl4Ie3JWd+mJ+ui4=; b=4x0W7uL/CTB4Hc
	UercswXf8rTTWxWLMStT31qbWXppn2mLZ0mcbTFrXpURlGDc+eOMbMAy929e65hE3UQK5DUB/CpBT
	AwrvE8S7fyje+rUUi6NNqDyQyl+NCNU6c0kA7MNUTy7eaKej/heS98+M1N/7edhisC/K3fsJKF/0g
	mz/RATq0Uvw2jTnd35XH009h+74UxsedMjElyM20Qz0lJrmJfE19GI8MhgGa+5Zclh0VN5EnnnuSE
	D72C0B9qjw62He1hYTo3JZAsaG9OYcoRs158Ynnz5Z2HdalEoHXvBN7W8gqoNAYuHvjQCCRa084CN
	Cl2rCB2bFffdZO0xUMoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAweR-00000004jF5-2PV5;
	Tue, 12 Nov 2024 19:34:11 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAwcd-00000004isC-1qt2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 19:32:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1F6195C567F;
	Tue, 12 Nov 2024 19:31:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0977CC4CECD;
	Tue, 12 Nov 2024 19:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731439936;
	bh=PbvVdhdBEXjnTEmDivhqOlUPJQD+aBWqaUCqgKTAKoI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=UgwlqQOPbUn+NMAkHsotVB19OCL95wPYWMYvDfvlFxc2tPpATu7Lx6s3OHygfWwok
	 VgLUzsR6UWHz/b6k57R4Ucao/7TES+nDv0Hzr0FPopvo/ia/5MUQa8Fg7IZJoDHcF3
	 /+eOyA+kjfu18uf6BaVL2YGtkQnsPRVR4f7Qvzbo0RrDY75UMyNP1M1HbIexQdCiXl
	 tYttJC4bqO4iE3dH+aZFjPsNdDN+/CqfK+SfHobanSDxM/2DanpR9huDuJV75SUFpK
	 CR1vMn7H+rWoWK0J+DDuuHugzYXM16PZRabKsBN1k9pF2rGY/yVxkaOPZxyMr02SKe
	 OhSQ2xNqfrb6A==
Date: Tue, 12 Nov 2024 13:32:14 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Christian Bruel <christian.bruel@foss.st.com>
Cc: lpieralisi@kernel.org, kw@linux.com, manivannan.sadhasivam@linaro.org,
	robh@kernel.org, bhelgaas@google.com, krzk+dt@kernel.org,
	conor+dt@kernel.org, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, p.zabel@pengutronix.de,
	cassel@kernel.org, quic_schintav@quicinc.com,
	fabrice.gasnier@foss.st.com, linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] PCI: stm32: Add PCIe host support for STM32MP25
Message-ID: <20241112193214.GA1852199@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241112161925.999196-3-christian.bruel@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_113219_599515_1E8E0C38 
X-CRM114-Status: GOOD (  36.97  )
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

On Tue, Nov 12, 2024 at 05:19:22PM +0100, Christian Bruel wrote:
> Add driver for the STM32MP25 SoC PCIe Gen2 controller based on the
> DesignWare PCIe core.
> Supports MSI via GICv2m, Single Virtual Channel, Single Function

Add blank lines between paragraphs.  Also applies to other patches in
the series.

> +config PCIE_STM32
> +	tristate "STMicroelectronics STM32MP25 PCIe Controller (host mode)"
> +	depends on ARCH_STM32 || COMPILE_TEST
> +	depends on PCI_MSI
> +	select PCIE_DW_HOST
> +	help
> +	  Enables support for the DesignWare core based PCIe host controller
> +	  found in STM32MP25 SoC.
> +
> +	  This driver can also be built as a module. If so, the module
> +	  will be called pcie-stm32.

Move this so the drivers stay alphabetized.  There's already a
"STMicroelectronics SPEAr PCIe controller" entry, and this should go
right next to it.

> +++ b/drivers/pci/controller/dwc/pcie-stm32.c

> +static const struct of_device_id stm32_pcie_of_match[] = {
> +	{ .compatible = "st,stm32mp25-pcie-rc" },
> +	{},
> +};

Most drivers put this near the platform_driver struct that references
it.

> +static int stm32_pcie_set_max_payload(struct dw_pcie *pci, int mps)
> +{
> +	int ret;
> +	struct device *dev = pci->dev;
> +	struct pci_dev *pdev = to_pci_dev(dev);
> +
> +	if (mps != 128 && mps != 256) {
> +		dev_err(dev, "Unexpected payload size %d\n", mps);
> +		return -EINVAL;
> +	}
> +
> +	ret = pcie_set_mps(pdev, mps);
> +	if (ret)
> +		dev_err(dev, "failed to set mps %d, error %d\n", mps, ret);

MPS config is normally not device-specific, and it's somewhat fragile
(see pci_configure_mps() and pcie_bus_config), so I kind of hate to
see more users.  Maybe there's some hardware issue involved here?

> +static int stm32_pcie_start_link(struct dw_pcie *pci)
> +{
> +	struct stm32_pcie *stm32_pcie = to_stm32_pcie(pci);
> +	u32 ret;
> +
> +	if (stm32_pcie->reset_gpio) {
> +		/* Make sure PERST# is asserted. */
> +		gpiod_set_value(stm32_pcie->reset_gpio, 1);
> +
> +		/* Deassert PERST# after 100us */
> +		usleep_range(100, 200);

If this is PCIE_T_PERST_CLK_US, use that.  If not, please add a
relevant #define with a citation to the spec.

> +		gpiod_set_value(stm32_pcie->reset_gpio, 0);
> +	}
> +
> +	ret = regmap_update_bits(stm32_pcie->regmap, SYSCFG_PCIECR,
> +				 STM32MP25_PCIECR_LTSSM_EN,
> +				 STM32MP25_PCIECR_LTSSM_EN);
> +
> +	/*
> +	 * PCIe specification states that you should not issue any config
> +	 * requests until 100ms after asserting reset, so we enforce that here

I think it says 100ms after *deasserting* reset.  But if you use
PCIE_T_RRS_READY_MS below, I don't think you even need this comment.

> +	if (stm32_pcie->reset_gpio)
> +		msleep(100);

I think this is PCIE_T_RRS_READY_MS.

> +static void stm32_pcie_stop_link(struct dw_pcie *pci)
> +{
> +	struct stm32_pcie *stm32_pcie = to_stm32_pcie(pci);
> +
> +	regmap_update_bits(stm32_pcie->regmap, SYSCFG_PCIECR, STM32MP25_PCIECR_LTSSM_EN, 0);

With a half-dozen exceptions, this file fits nicely in 80 columns.
Can you wrap this and the similar exceptions?  No need to break printf
strings or the regmap strings that can't reasonably be wrapped.

> +	/* Assert PERST# */
> +	if (stm32_pcie->reset_gpio)
> +		gpiod_set_value(stm32_pcie->reset_gpio, 1);

Might be nice to include "perst" in the "reset_gpio" name to identify
it more specifically.

> +}
> +
> +static int stm32_pcie_suspend(struct device *dev)
> +{
> +	struct stm32_pcie *stm32_pcie = dev_get_drvdata(dev);
> +
> +	if (device_may_wakeup(dev) || device_wakeup_path(dev))
> +		enable_irq_wake(stm32_pcie->wake_irq);
> +
> +	return 0;
> +}
> +
> +static int stm32_pcie_resume(struct device *dev)
> +{
> +	struct stm32_pcie *stm32_pcie = dev_get_drvdata(dev);
> +
> +	if (device_may_wakeup(dev) || device_wakeup_path(dev))
> +		disable_irq_wake(stm32_pcie->wake_irq);
> +
> +	return 0;
> +}
> +
> +static int stm32_pcie_suspend_noirq(struct device *dev)
> +{
> +	struct stm32_pcie *stm32_pcie = dev_get_drvdata(dev);
> +
> +	stm32_pcie->link_is_up = dw_pcie_link_up(stm32_pcie->pci);
> +
> +	stm32_pcie_stop_link(stm32_pcie->pci);
> +	clk_disable_unprepare(stm32_pcie->clk);
> +
> +	if (!device_may_wakeup(dev) && !device_wakeup_path(dev))
> +		phy_exit(stm32_pcie->phy);
> +
> +	return pinctrl_pm_select_sleep_state(dev);
> +}
> +
> +static int stm32_pcie_resume_noirq(struct device *dev)
> +{
> +	struct stm32_pcie *stm32_pcie = dev_get_drvdata(dev);
> +	struct dw_pcie *pci = stm32_pcie->pci;
> +	struct dw_pcie_rp *pp = &pci->pp;
> +	int ret;
> +
> +	/* init_state was set in pinctrl_bind_pins() before probe */
> +	if (!IS_ERR(dev->pins->init_state))
> +		ret = pinctrl_select_state(dev->pins->p, dev->pins->init_state);
> +	else
> +		ret = pinctrl_pm_select_default_state(dev);
> +
> +	if (ret) {
> +		dev_err(dev, "Failed to activate pinctrl pm state: %d\n", ret);
> +		return ret;
> +	}
> +
> +	if (!device_may_wakeup(dev) && !device_wakeup_path(dev)) {
> +		ret = phy_init(stm32_pcie->phy);
> +		if (ret) {
> +			pinctrl_pm_select_default_state(dev);
> +			return ret;
> +		}
> +	}
> +
> +	ret = clk_prepare_enable(stm32_pcie->clk);
> +	if (ret)
> +		goto clk_err;
> +
> +	ret = stm32_pcie_host_init(pp);
> +	if (ret)
> +		goto host_err;
> +
> +	ret = dw_pcie_setup_rc(pp);
> +	if (ret)
> +		goto pcie_err;
> +
> +	if (stm32_pcie->link_is_up) {
> +		ret = stm32_pcie_start_link(stm32_pcie->pci);
> +		if (ret)
> +			goto pcie_err;
> +
> +		/* Ignore errors, the link may come up later */
> +		dw_pcie_wait_for_link(stm32_pcie->pci);
> +	}
> +
> +	pinctrl_pm_select_default_state(dev);

Interesting that pcie-stm32.c, pci-tegra.c, and pcie-tegra194.c are
the only PCI controller drivers that use this.  I have no idea what
this is; it just makes me wonder if these three are just special, or
if others should be using it?

> +static int stm32_add_pcie_port(struct stm32_pcie *stm32_pcie,
> +			       struct platform_device *pdev)
> +{
> +	struct dw_pcie *pci = stm32_pcie->pci;
> +	struct device *dev = pci->dev;
> +	struct dw_pcie_rp *pp = &pci->pp;
> +	int ret;
> +
> +	ret = phy_set_mode(stm32_pcie->phy, PHY_MODE_PCIE);
> +	if (ret)
> +		return ret;
> +
> +	ret = phy_init(stm32_pcie->phy);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_update_bits(stm32_pcie->regmap, SYSCFG_PCIECR,
> +				 STM32MP25_PCIECR_TYPE_MASK, STM32MP25_PCIECR_RC);
> +	if (ret)
> +		goto phy_disable;
> +
> +	reset_control_assert(stm32_pcie->rst);
> +	reset_control_deassert(stm32_pcie->rst);

Is there any reset pulse width requirement here?

> +	ret = clk_prepare_enable(stm32_pcie->clk);
> +	if (ret) {
> +		dev_err(dev, "Core clock enable failed %d\n", ret);
> +		goto phy_disable;
> +	}
> +
> +	pp->ops = &stm32_pcie_host_ops;
> +	ret = dw_pcie_host_init(pp);
> +	if (ret) {
> +		dev_err(dev, "failed to initialize host: %d\n", ret);

Consider making all the messages consistent in terms of sentence
structure and capitalization.

> +static int stm32_pcie_probe(struct platform_device *pdev)
> +{
> +	struct stm32_pcie *stm32_pcie;
> +	struct dw_pcie *dw;
> +	struct device *dev = &pdev->dev;
> +	struct device_node *np = pdev->dev.of_node;
> +	int ret;
> +
> +	stm32_pcie = devm_kzalloc(dev, sizeof(*stm32_pcie), GFP_KERNEL);
> +	if (!stm32_pcie)
> +		return -ENOMEM;
> +
> +	dw = devm_kzalloc(dev, sizeof(*dw), GFP_KERNEL);
> +	if (!dw)
> +		return -ENOMEM;

Add blank line.

> +static struct platform_driver stm32_pcie_driver = {
> +	.probe = stm32_pcie_probe,
> +	.remove_new = stm32_pcie_remove,

Use .remove instead of .remove_new; see 0edb555a65d1 ("platform: Make
platform_driver::remove() return void").

> +	.driver = {
> +		.name = "stm32-pcie",
> +		.of_match_table = stm32_pcie_of_match,
> +		.pm		= &stm32_pcie_pm_ops,
> +	},
> +};
> +
> +static bool is_stm32_pcie_driver(struct device *dev)
> +{
> +	/* PCI bridge */
> +	dev = get_device(dev);
> +
> +	/* Platform driver */
> +	dev = get_device(dev->parent);
> +
> +	return (dev->driver == &stm32_pcie_driver.driver);

Ugh.  Some MPS/MRRS magic going on here, evidently related to the STM
integration of DWC IP?

> +static bool apply_mrrs_quirk(struct pci_dev *root_port)
> +{
> +	struct dw_pcie_rp *pp;
> +	struct dw_pcie *dw_pci;
> +	struct stm32_pcie *stm32_pcie;
> +
> +	if (WARN_ON(!root_port) || !is_stm32_pcie_driver(root_port->dev.parent))
> +		return false;
> +
> +	pp = root_port->bus->sysdata;
> +	dw_pci = to_dw_pcie_from_pp(pp);
> +	stm32_pcie = to_stm32_pcie(dw_pci);
> +
> +	if (!stm32_pcie->limit_downstream_mrrs)
> +		return false;
> +
> +	return true;
> +}
> +
> +static void quirk_stm32_pcie_limit_mrrs(struct pci_dev *pci)
> +{
> +	struct pci_dev *root_port;
> +	struct pci_bus *bus = pci->bus;
> +	int readrq;
> +	int mps;
> +
> +	if (pci_is_root_bus(bus))
> +		return;
> +
> +	root_port = pcie_find_root_port(pci);
> +
> +	if (!apply_mrrs_quirk(root_port))
> +		return;
> +
> +	mps = pcie_get_mps(root_port);
> +
> +	/*
> +	 * STM32 PCI controller has a h/w performance limitation on the AXI DDR requests.
> +	 * Limit the maximum read request size to 256B on all downstream devices.

I guess this is some kind of platform erratum, since there's no way
for us to discover a limit on supported MRRS values?

> +	readrq = pcie_get_readrq(pci);
> +	if (readrq > 256) {
> +		int mrrs = min(mps, 256);
> +
> +		pcie_set_readrq(pci, mrrs);
> +
> +		pci_info(pci, "Max Read Rq set to %4d (was %4d)\n", mrrs, readrq);
> +	}
> +}
> +
> +DECLARE_PCI_FIXUP_HEADER(PCI_ANY_ID, PCI_ANY_ID,
> +			 quirk_stm32_pcie_limit_mrrs);
> +
> +static int stm32_dma_limit(struct pci_dev *pdev, void *data)
> +{
> +	dev_dbg(&pdev->dev, "set bus_dma_limit");
> +
> +	pdev->dev.bus_dma_limit = DMA_BIT_MASK(32);

This is quite unusual and deserves some comment about why we need
it.

> +	return 0;
> +}
> +
> +static void quirk_stm32_dma_mask(struct pci_dev *pci)
> +{
> +	struct pci_dev *root_port;
> +
> +	root_port = pcie_find_root_port(pci);
> +
> +	if (root_port && is_stm32_pcie_driver(root_port->dev.parent))
> +		pci_walk_bus(pci->bus, stm32_dma_limit, NULL);
> +}
> +DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_SYNOPSYS, 0x0550, quirk_stm32_dma_mask);

I guess this applies to [16c3:0550] devices and everything below them?
It looks like these must be Root Ports?  And they identify as
PCI_VENDOR_ID_SYNOPSYS instead of PCI_VENDOR_ID_STMICRO (104a)?

Could be added at https://admin.pci-ids.ucw.cz/read/PC/16c3/ if you
want lspci to name them correctly.

> +++ b/drivers/pci/controller/dwc/pcie-stm32.h

> +#define STM32MP25_PCIECR_EP		0

Ideally would go in the patch that uses it.

> +#define SYSCFG_PCIEPMEMSICR		0x6004
> +#define SYSCFG_PCIEAERRCMSICR		0x6008
> +#define SYSCFG_PCIESR1			0x6100
> +#define SYSCFG_PCIESR2			0x6104
> +
> +#define PCIE_CAP_MAX_PAYLOAD_SIZE(x)	((x) << 5)
> +#define PCIE_CAP_MAX_READ_REQ_SIZE(x)	((x) << 12)

These are all unused, drop them until you need them.

