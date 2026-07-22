Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E98A9C44536
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 17:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=rzjj8biovvRWkfeojmscssuItNvTUTiwCB46uuRWj6w=; b=YxE0XU8VcKBBqv
	6PdEq95ISiDVRVm2r/un3GiFMN4hdOi/SohAPLs/G50RdlXsB5ZytdYsPxCFSkAEra1HHTnEL2vur
	9LfzhQJMSp4lJ6W4SQ5pe9LipVcTjgXPTGs2rt+1ggINkOfIH93UOmQ34uGVNtWX4wk4kv+xf07Zs
	e3/Fln2FIp7fGCep6IrSkEa+D/fUDdDnLbk+HjzdNfRX+pmMar//oP36PLDmwfel133W3mLLv7YEu
	C4w5Epkll/Xium/wlzAOu7ZQE4KzmXT7awOPzJhJohyfewA+9xXV6VEzuVMe5lXES+K1BVWrpvacl
	3IiBCA0jb4Zu2giH1GCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmavW-0000000CUcf-1Goc;
	Wed, 22 Jul 2026 17:40:14 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmavU-0000000CUcD-1m9M;
	Wed, 22 Jul 2026 17:40:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DB91641443;
	Wed, 22 Jul 2026 17:40:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 905901F000E9;
	Wed, 22 Jul 2026 17:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784742011;
	bh=rzjj8biovvRWkfeojmscssuItNvTUTiwCB46uuRWj6w=;
	h=Date:From:To:Cc:Subject:In-Reply-To;
	b=QfaQtj3QmYb778isL6FppGYgXQ1/mFhHUpPXnYhbUxhDWLVZSW8PYJwIAM7h9Mvu6
	 lOEp3k4PLjDFIj4sE5WimbE4U/O4jP8kqbOs9t0GVlbDJ3SJKbdSCBuorutBm85qqM
	 +l6aYyxkpmIY575ohn2X60XtAtrbhzPXK5ttTd8FI1wsl/TDhnVbgITIPhRcKvKNZF
	 o7mNvDljzIpa7xD6xq0mpc6fv9xfJx5UMV6OYIBW8PHcsyhlKAHauEBizdlvDXlKR0
	 65IxHbNA1+Osxc7l+8EWY7VpXPqNb3XVN29+BDFzNpQ8QpPtSGuI3vclGsT5sKQYZK
	 kZnUdwc2085Eg==
Date: Wed, 22 Jul 2026 12:40:10 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>, linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 4/4] PCI: mediatek-gen3: Add 2-lanes mode support for
 Airoha AN7581
Message-ID: <20260722174010.GA746214@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260714115848.8537-5-ansuelsmth@gmail.com>
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

On Tue, Jul 14, 2026 at 01:58:46PM +0200, Christian Marangi wrote:
> The Airoha AN7581 SoC supports configuring the first PCIe0 lane to 2-lanes
> mode (2x link) by bonding it with the second PCIe lane (PCIe1). This is
> done by configuring the PCIe MUX in the SCU register.

s/2x/x2/ to match usual convention, e.g., PCIe r7.0 sec 1.2

I mentioned this before at
https://lore.kernel.org/all/20260626162508.GA27685@bhelgaas

> To correctly configure PCIe0 in 2x link, define in DT the following
> additional property:

s/property/properties/

Add a blank line here and indent the following list a couple spaces:

> - additional reg, 'sec-pcie-mac' for the secondary PCIe.
> - PERSTOUT reset for both main and secondary PCIE0, called 'perstout' and
>   'sec-perstout'
> - airoha,scu property to correctly configure the SCU register for the PCIe
>   MUX
> - 'num-lanes' set to '2' to enable PCIe0 in 2x link

Add '' around 'airoha,scu' to match the others
s/2x/x2/

> In such configuration the EQ preset are configured to the same values.
> 
> To permit correct configuration of the PCIe line, additional logic is added
> to assert and deassert the PERSTOUT resets.

s/line/link/

In the PCIe context, "line" doesn't mean anything.

> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  drivers/pci/controller/pcie-mediatek-gen3.c | 106 ++++++++++++++++----
>  1 file changed, 89 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
> index b0accd828589..764974045340 100644
> --- a/drivers/pci/controller/pcie-mediatek-gen3.c
> +++ b/drivers/pci/controller/pcie-mediatek-gen3.c
> @@ -32,6 +32,11 @@
>  
>  #include "../pci.h"
>  
> +/* AN7581 SCU register */
> +#define SCU_PCIC			0x88
> +#define SCU_PCIC_PCIE_CTRL		GENMASK(7, 0)
> +
> +/* PCIe register */
>  #define PCIE_BASE_CFG_REG		0x14
>  #define PCIE_BASE_CFG_SPEED		GENMASK(15, 8)
>  
> @@ -131,6 +136,7 @@
>  #define PCIE_ATR_TLP_TYPE_IO		PCIE_ATR_TLP_TYPE(2)
>  
>  #define MAX_NUM_PHY_RESETS		3
> +#define MAX_NUM_PERSTOUT_RESETS		2
>  
>  #define PCIE_MTK_RESET_TIME_US		10
>  
> @@ -203,9 +209,11 @@ struct mtk_msi_set {
>  struct mtk_gen3_pcie {
>  	struct device *dev;
>  	void __iomem *base;
> +	void __iomem *sec_base;
>  	phys_addr_t reg_base;
>  	struct reset_control *mac_reset;
>  	struct reset_control_bulk_data phy_resets[MAX_NUM_PHY_RESETS];
> +	struct reset_control_bulk_data perstout_resets[MAX_NUM_PERSTOUT_RESETS];
>  	struct phy *phy;
>  	struct clk_bulk_data *clks;
>  	int num_clks;
> @@ -928,6 +936,14 @@ static int mtk_pcie_parse_port(struct mtk_gen3_pcie *pcie)
>  	if (ret)
>  		return dev_err_probe(dev, ret, "failed to get PHY bulk reset\n");
>  
> +	pcie->perstout_resets[0].id = "perstout";
> +	pcie->perstout_resets[1].id = "sec-perstout";
> +
> +	ret = devm_reset_control_bulk_get_optional_exclusive(dev, MAX_NUM_PERSTOUT_RESETS,
> +							     pcie->perstout_resets);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to get PERSTOUT bulk reset\n");
> +
>  	pcie->mac_reset = devm_reset_control_get_optional_exclusive(dev, "mac");
>  	if (IS_ERR(pcie->mac_reset))
>  		return dev_err_probe(dev, PTR_ERR(pcie->mac_reset), "failed to get MAC reset\n");
> @@ -949,18 +965,38 @@ static int mtk_pcie_parse_port(struct mtk_gen3_pcie *pcie)
>  			pcie->num_lanes = num_lanes;
>  	}
>  
> +	/* Map secondary PCIe for 2-lanes mode for EN7581 */
> +	if (pcie->num_lanes == 2 && device_is_compatible(dev, "airoha,en7581-pcie")) {
> +		regs = platform_get_resource_byname(pdev, IORESOURCE_MEM, "sec-pcie-mac");
> +		if (!regs)
> +			return -EINVAL;
> +		pcie->sec_base = devm_ioremap_resource(dev, regs);
> +		if (IS_ERR(pcie->sec_base))
> +			return dev_err_probe(dev, PTR_ERR(pcie->sec_base), "failed to map secondary register base\n");
> +	}
> +
>  	return 0;
>  }
>  
>  static int mtk_pcie_en7581_power_up(struct mtk_gen3_pcie *pcie)
>  {
>  	struct pci_host_bridge *host = pci_host_bridge_from_priv(pcie);
> +	unsigned int num_lanes = max(1, pcie->num_lanes);
> +	struct regmap *pbus_regmap, *scu;
>  	struct device *dev = pcie->dev;
>  	struct resource_entry *entry;
> -	struct regmap *pbus_regmap;
>  	u32 val, args[2], size;
>  	resource_size_t addr;
> -	int err;
> +	int i, err;
> +
> +	if (num_lanes > 2)
> +		return dev_err_probe(dev, -EINVAL, "unsupported num-lanes, maximum 2 lanes supported\n");
> +
> +	if (num_lanes == 2) {
> +		scu = syscon_regmap_lookup_by_phandle(dev->of_node, "airoha,scu");
> +		if (IS_ERR(scu))
> +			return dev_err_probe(dev, PTR_ERR(scu), "failed to map SCU regmap\n");
> +	}
>  
>  	/*
>  	 * The controller may have been left out of reset by the bootloader
> @@ -992,6 +1028,19 @@ static int mtk_pcie_en7581_power_up(struct mtk_gen3_pcie *pcie)
>  	size = lower_32_bits(resource_size(entry->res));
>  	regmap_write(pbus_regmap, args[1], GENMASK(31, __fls(size)));
>  
> +	/* Assert PERSTOUT for all relevant lines */

s/lines/lanes/ (also several more places below)

> +	err = reset_control_bulk_assert(MAX_NUM_PERSTOUT_RESETS,
> +					pcie->perstout_resets);
> +	if (err) {
> +		dev_err(dev, "failed to assert PERSTOUTs\n");
> +		return err;
> +	}
> +
> +	/* Configure SCU MUX to disable PCIE1 for 2 lines mode */
> +	if (num_lanes == 2)
> +		regmap_update_bits(scu, SCU_PCIC, SCU_PCIC_PCIE_CTRL,
> +				   FIELD_PREP(SCU_PCIC_PCIE_CTRL, BIT(1)));
> +
>  	/*
>  	 * Unlike the other MediaTek Gen3 controllers, the Airoha EN7581
>  	 * requires PHY initialization and power-on before PHY reset deassert.
> @@ -1024,18 +1073,6 @@ static int mtk_pcie_en7581_power_up(struct mtk_gen3_pcie *pcie)
>  	pm_runtime_enable(dev);
>  	pm_runtime_get_sync(dev);
>  
> -	val = FIELD_PREP(PCIE_VAL_LN0_DOWNSTREAM, 0x47) |
> -	      FIELD_PREP(PCIE_VAL_LN1_DOWNSTREAM, 0x47) |
> -	      FIELD_PREP(PCIE_VAL_LN0_UPSTREAM, 0x41) |
> -	      FIELD_PREP(PCIE_VAL_LN1_UPSTREAM, 0x41);
> -	writel_relaxed(val, pcie->base + PCIE_EQ_PRESET_01_REG);
> -
> -	val = PCIE_K_PHYPARAM_QUERY | PCIE_K_QUERY_TIMEOUT |
> -	      FIELD_PREP(PCIE_K_PRESET_TO_USE_16G, 0x80) |
> -	      FIELD_PREP(PCIE_K_PRESET_TO_USE, 0x2) |
> -	      FIELD_PREP(PCIE_K_FINETUNE_MAX, 0xf);
> -	writel_relaxed(val, pcie->base + PCIE_PIPE4_PIE8_REG);
> -
>  	err = clk_bulk_prepare_enable(pcie->num_clks, pcie->clks);
>  	if (err) {
>  		dev_err(dev, "failed to prepare clock\n");
> @@ -1043,14 +1080,47 @@ static int mtk_pcie_en7581_power_up(struct mtk_gen3_pcie *pcie)
>  	}
>  
>  	/*
> -	 * Airoha EN7581 performs PCIe reset via clk callbacks since it has a
> -	 * hw issue with PCIE_PE_RSTB signal. Add wait for the time needed to
> -	 * complete the PCIe reset.
> +	 * Old Airoha EN7581 clock driver performed PCIe reset via
> +	 * clk callbacks since it has a hw issue with PCIE_PE_RSTB signal.
> +	 * This is now handled by dedicated PERSTOUT resets with clk
> +	 * driver only enabling the refclk.

This reference to the "old Airoha EN7581 clock driver" makes me think
there's a dependency between a EN7581 clock driver change and this
PERSTOUT change.  If so, please mention the commit SHA1 for the EN7581
clock driver change so they're connected and people backporting to
older kernels know to be careful to get both of them.

It sounds like this PERSTOUT change might be independent of the x2
configuration support.  If so, it should be done in a separate patch.

> +	 * Wait is still needed for refclk to stabilize
>  	 */
>  	msleep(PCIE_T_PVPERL_MS);
>  
> +	/* Configure all the lines to the same EQ config */
> +	for (i = 0; i < num_lanes; i++) {
> +		void __iomem *base = pcie->base;
> +
> +		if (i == 1)
> +			base = pcie->sec_base;
> +
> +		val = FIELD_PREP(PCIE_VAL_LN0_DOWNSTREAM, 0x47) |
> +			FIELD_PREP(PCIE_VAL_LN1_DOWNSTREAM, 0x47) |
> +			FIELD_PREP(PCIE_VAL_LN0_UPSTREAM, 0x41) |
> +			FIELD_PREP(PCIE_VAL_LN1_UPSTREAM, 0x41);
> +		writel_relaxed(val, base + PCIE_EQ_PRESET_01_REG);
> +
> +		val = PCIE_K_PHYPARAM_QUERY | PCIE_K_QUERY_TIMEOUT |
> +			FIELD_PREP(PCIE_K_PRESET_TO_USE_16G, 0x80) |
> +			FIELD_PREP(PCIE_K_PRESET_TO_USE, 0x2) |
> +			FIELD_PREP(PCIE_K_FINETUNE_MAX, 0xf);
> +		writel_relaxed(val, base + PCIE_PIPE4_PIE8_REG);
> +	}
> +
> +	/* Deassert PERSTOUT for all relevant lines */
> +	err = reset_control_bulk_deassert(MAX_NUM_PERSTOUT_RESETS,
> +					  pcie->perstout_resets);
> +	if (err) {
> +		dev_err(dev, "failed to deassert PERSTOUTs\n");
> +		goto err_perstout_deassert;
> +	}
> +
>  	return 0;
>  
> +err_perstout_deassert:
> +	clk_bulk_disable_unprepare(pcie->num_clks, pcie->clks);
>  err_clk_prepare_enable:
>  	pm_runtime_put_sync(dev);
>  	pm_runtime_disable(dev);
> @@ -1136,6 +1206,8 @@ static void mtk_pcie_power_down(struct mtk_gen3_pcie *pcie)
>  
>  	phy_power_off(pcie->phy);
>  	phy_exit(pcie->phy);
> +	reset_control_bulk_assert(MAX_NUM_PERSTOUT_RESETS,
> +				  pcie->perstout_resets);
>  	reset_control_bulk_assert(pcie->soc->phy_resets.num_resets,
>  				  pcie->phy_resets);
>  }
> -- 
> 2.53.0
> 

