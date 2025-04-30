Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC365C369D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 08:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RpkWxXFGKAiLG2ta90qx3Sn6Qyy1g04wUDbLN5W5WUg=; b=1uNStmR469ULb4ywluAjrbdF+w
	dJAJR+1kRvKf2u8TDCON7SDSTzN9s07hEcY0h6egsOlXfLnuu/GxPbVcIawbdMwk1VhkJapE8xeqD
	9Fy9k+oOEELuNar3MV7joACM+QHXGDHwOIVJL/SZCz2X04TvShH+6HipPd8DFZMymlAsGmoaZYu7D
	eGlgoSe3387c0YENaYzQ9ROX1F4fExvbtWdoKnI5IaRewCuLOcFxoosgYhHoo7eIIcJ/quwSgRUxM
	66T3hZqkeINkwTRcpHH86TeV98R3ofR4NriNLWjGtpwjsAOp2U72144sLeJ9q7fDrT70cJYAc3/Na
	Nr62/h/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA2mt-0000000C92G-2ZLt;
	Wed, 30 Apr 2025 08:27:27 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA2Pn-0000000C5Le-05pt;
	Wed, 30 Apr 2025 08:03:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C1FA5450EE;
	Wed, 30 Apr 2025 08:03:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA10CC4CEE9;
	Wed, 30 Apr 2025 08:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746000212;
	bh=RlnABCF7WCe8RVLZReHP66Pa73bC8yt5d8eBUmJneKE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UBFir0PumNtsyhRcyxswUYKkQFbxj4U9rU1ILc/gnLeWlVWvWv0AuFFR43w79q5nI
	 lC4XHCpPUuxLiQHZVitSfmKwA6wzrN51gkEOBiB68nyFedAw2890mXFFrv2N4plGkF
	 pgbSjCp3p7CloUXv9rEuHPCBg6Y3UTFTOvh5VIe67CAnVmKpZL94v1bv2zaoD/Ezy6
	 ITkdVoR9Ywz5gzKHONxvQ7XL+hLOnjuc4Kc8U3odszxuh2aAUl69V1msFUfo0iZZzJ
	 Xx7yB3KU9KZriVTBdH7We3SMz1tHsqQRzd6Y4QcIM81vRccWPu7/S7kMdzj46aRSHE
	 TNVSXGWOHcoyA==
Date: Wed, 30 Apr 2025 10:03:27 +0200
From: Niklas Cassel <cassel@kernel.org>
To: Wilfred Mallawa <wilfred.opensource@gmail.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Damien Le Moal <dlemoal@kernel.org>,
	Alistair Francis <alistair@alistair23.me>,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Wilfred Mallawa <wilfred.mallawa@wdc.com>
Subject: Re: [PATCH] PCI: dwc: Add support for slot reset on link down event
Message-ID: <aBHZT_mOruwH7HxJ@ryzen>
References: <20250430-b4-pci_dwc_reset_support-v1-1-f654abfa7925@wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250430-b4-pci_dwc_reset_support-v1-1-f654abfa7925@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_010335_176396_0D483525 
X-CRM114-Status: GOOD (  39.73  )
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

Hello Wilfred,

Nice to see this feature :)

On Wed, Apr 30, 2025 at 05:43:51PM +1000, Wilfred Mallawa wrote:
> From: Wilfred Mallawa <wilfred.mallawa@wdc.com>
> 
> The PCIe link may go down in cases like firmware crashes or unstable
> connections. When this occurs, the PCIe slot must be reset to restore
> functionality. However, the current driver lacks link down handling,
> forcing users to reboot the system to recover.
> 
> This patch implements the `reset_slot` callback for link down handling
> for DWC PCIe host controller. In which, the RC is reset, reconfigured
> and link training initiated to recover from the link down event.
> 
> This patch by extension fixes issues with sysfs initiated bus resets.
> In that, currently, when a sysfs initiated bus reset is issued, the
> endpoint device is non-functional after (may link up with downgraded link
> status). With this patch adding support for link down recovery, a sysfs
> initiated bus reset works as intended. Testing conducted on a ROCK5B board
> with an M.2 NVMe drive.
> 
> Signed-off-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
> ---
> Hey all,
> 
> This patch builds ontop of [1] to extend the reset slot support for the
> DWC PCIe host controller. Which implements link down recovery support
> for the DesignWare PCIe host controller by adding a `reset_slot` callback.
> This allows the system to recover from PCIe link failures without requiring a reboot.
> 
> This patch by extension improves the behavior of sysfs-initiated bus resets.
> Previously, a `reset` issued via sysfs could leave the endpoint in a
> non-functional state or with downgraded link parameters. With the added
> link down recovery logic, sysfs resets now result in a properly reinitialized
> and fully functional endpoint device. This issue was discovered on a
> Rock5B board, and thus testing was also conducted on the same platform
> with a known good M.2 NVMe drive.
> 
> Thanks!
> 
> [1] https://lore.kernel.org/all/20250417-pcie-reset-slot-v3-0-59a10811c962@linaro.org/
> ---
>  drivers/pci/controller/dwc/Kconfig            |  1 +
>  drivers/pci/controller/dwc/pcie-dw-rockchip.c | 89 ++++++++++++++++++++++++++-
>  2 files changed, 88 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/Kconfig b/drivers/pci/controller/dwc/Kconfig
> index d9f0386396edf66ad0e514a0f545ed24d89fcb6c..878c52de0842e32ca50dfcc4b66231a73ef436c4 100644
> --- a/drivers/pci/controller/dwc/Kconfig
> +++ b/drivers/pci/controller/dwc/Kconfig
> @@ -347,6 +347,7 @@ config PCIE_ROCKCHIP_DW_HOST
>  	depends on OF
>  	select PCIE_DW_HOST
>  	select PCIE_ROCKCHIP_DW
> +	select PCI_HOST_COMMON
>  	help
>  	  Enables support for the DesignWare PCIe controller in the
>  	  Rockchip SoC (except RK3399) to work in host mode.
> diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> index 3c6ab71c996ec1246954f52a9454c8ae67956a54..4c2c683d170f19266e1dfe0efde76d6feb23bf7a 100644
> --- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> +++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> @@ -23,6 +23,8 @@
>  #include <linux/reset.h>
>  
>  #include "pcie-designware.h"
> +#include "../../pci.h"
> +#include "../pci-host-common.h"
>  
>  /*
>   * The upper 16 bits of PCIE_CLIENT_CONFIG are a write
> @@ -83,6 +85,9 @@ struct rockchip_pcie_of_data {
>  	const struct pci_epc_features *epc_features;
>  };
>  
> +static int rockchip_pcie_rc_reset_slot(struct pci_host_bridge *bridge,
> +				       struct pci_dev *pdev);
> +
>  static int rockchip_pcie_readl_apb(struct rockchip_pcie *rockchip, u32 reg)
>  {
>  	return readl_relaxed(rockchip->apb_base + reg);
> @@ -256,6 +261,7 @@ static int rockchip_pcie_host_init(struct dw_pcie_rp *pp)
>  					 rockchip);
>  
>  	rockchip_pcie_enable_l0s(pci);
> +	pp->bridge->reset_slot = rockchip_pcie_rc_reset_slot;
>  
>  	return 0;
>  }
> @@ -455,6 +461,11 @@ static irqreturn_t rockchip_pcie_rc_sys_irq_thread(int irq, void *arg)
>  	dev_dbg(dev, "PCIE_CLIENT_INTR_STATUS_MISC: %#x\n", reg);
>  	dev_dbg(dev, "LTSSM_STATUS: %#x\n", rockchip_pcie_get_ltssm(rockchip));
>  
> +	if (reg & PCIE_LINK_REQ_RST_NOT_INT) {
> +		dev_dbg(dev, "hot reset or link-down reset\n");
> +		pci_host_handle_link_down(pp->bridge);
> +	}
> +
>  	if (reg & PCIE_RDLH_LINK_UP_CHGED) {
>  		if (rockchip_pcie_link_up(pci)) {
>  			dev_dbg(dev, "Received Link up event. Starting enumeration!\n");
> @@ -536,8 +547,8 @@ static int rockchip_pcie_configure_rc(struct platform_device *pdev,
>  		return ret;
>  	}
>  
> -	/* unmask DLL up/down indicator */
> -	val = HIWORD_UPDATE(PCIE_RDLH_LINK_UP_CHGED, 0);
> +	/* unmask DLL up/down indicator and hot reset/link-down reset irq */
> +	val = HIWORD_UPDATE(PCIE_RDLH_LINK_UP_CHGED | PCIE_LINK_REQ_RST_NOT_INT, 0);
>  	rockchip_pcie_writel_apb(rockchip, val, PCIE_CLIENT_INTR_MASK_MISC);
>  
>  	return ret;
> @@ -688,6 +699,80 @@ static int rockchip_pcie_probe(struct platform_device *pdev)
>  	return ret;
>  }
>  
> +static int rockchip_pcie_rc_reset_slot(struct pci_host_bridge *bridge,
> +				  struct pci_dev *pdev)
> +{
> +	struct pci_bus *bus = bridge->bus;
> +	struct dw_pcie_rp *pp = bus->sysdata;
> +	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> +	struct rockchip_pcie *rockchip = to_rockchip_pcie(pci);
> +	struct device *dev = rockchip->pci.dev;
> +	u32 val;
> +	int ret;
> +
> +	dw_pcie_stop_link(pci);
> +	rockchip_pcie_phy_deinit(rockchip);
> +
> +	ret = reset_control_assert(rockchip->rst);
> +	if (ret)
> +		return ret;
> +
> +	ret = rockchip_pcie_phy_init(rockchip);
> +	if (ret)
> +		goto disable_regulator;
> +
> +	ret = reset_control_deassert(rockchip->rst);
> +	if (ret)
> +		goto deinit_phy;
> +
> +	ret = rockchip_pcie_clk_init(rockchip);
> +	if (ret)
> +		goto deinit_phy;

Here you call rockchip_pcie_clk_init(), but I don't see that we ever called
clk_bulk_disable_unprepare() after stopping the link. I would have expected
the clk framework to have given us a warning about enabling clocks that are
already enabled.


> +
> +	ret = pp->ops->init(pp);
> +	if (ret) {
> +		dev_err(dev, "Host init failed: %d\n", ret);
> +		goto deinit_clk;
> +	}
> +
> +	/* LTSSM enable control mode */
> +	val = HIWORD_UPDATE_BIT(PCIE_LTSSM_ENABLE_ENHANCE);
> +	rockchip_pcie_writel_apb(rockchip, val, PCIE_CLIENT_HOT_RESET_CTRL);
> +
> +	rockchip_pcie_writel_apb(rockchip, PCIE_CLIENT_RC_MODE, PCIE_CLIENT_GENERAL_CON);
> +
> +	ret = dw_pcie_setup_rc(pp);
> +	if (ret) {
> +		dev_err(dev, "Failed to setup RC: %d\n", ret);
> +		goto deinit_clk;
> +	}
> +
> +	/* unmask DLL up/down indicator and hot reset/link-down reset irq */
> +	val = HIWORD_UPDATE(PCIE_RDLH_LINK_UP_CHGED | PCIE_LINK_REQ_RST_NOT_INT, 0);
> +	rockchip_pcie_writel_apb(rockchip, val, PCIE_CLIENT_INTR_MASK_MISC);
> +
> +	ret = dw_pcie_start_link(pci);
> +	if (ret)
> +		return ret;

Here you are simply returning ret in case of error,
should we perhaps goto error if this function fails?


> +
> +	ret = dw_pcie_wait_for_link(pci);
> +	if (ret)
> +		return ret;

Here, I think that we should simply call dw_pcie_wait_for_link()
without checking for error.

1) That is what Mani does in the qcom patch that implements the
reset_slot() callback.
2) That is what we do in:
https://github.com/torvalds/linux/blob/master/drivers/pci/controller/dwc/pcie-designware-host.c#L558-L559

(Ignore errors, the link may come up later)


Kind regards,
Niklas

