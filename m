Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91E83C88E53
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Sep 2026 20:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/H9gXZvtiPCItc2HBDLyTycRCmevlZw42OTHpRaYCzQ=; b=44Ooaw2HhDn/qYYc3BMBVM968N
	G4kcKZaCwg0zcajbxgDgw7ipgy5933+8HFBw/Ja4R3fQeZieyKT9pFDdwtFN0MsTmTEH/ZhafAL++
	48AeAFtpJQJI0aTV5j17qI+6gw9NG8uqnJ33RTdz3SbCqIsthAqJxqCbrk9FblZehN7Bjw37Iecfr
	jkhGg7u9+2/CCpO8fYrlPpx5uVgIfN4Ts+RZUb6n3L0FBDgd0S0TiJ0zAX+mG2/Jdy+i6K28Kdo41
	qx/Z7KDnxeO1wqxIkozIbeCyu+nGh/R2Z4GedeXlULkT0SVcVooHPl0ULISBDjpq1O3xwKVo0MLrD
	1CLVXecw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5U7I-000000019Bm-0dmr;
	Sat, 12 Sep 2026 20:14:28 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5U6O-000000018gO-3e2W;
	Sat, 12 Sep 2026 20:13:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 541B24176D;
	Sat, 12 Sep 2026 20:13:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D9281F00893;
	Sat, 12 Sep 2026 20:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789244012;
	bh=/H9gXZvtiPCItc2HBDLyTycRCmevlZw42OTHpRaYCzQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Mv3rHdy0fMDC8f5BzHeShyYkiTSzSfG4sCDbyu/b8+hs1TByHhvKFku8+Hi0wDr0k
	 bAZmbZcFfWCebLdttVg6ZSlvPflr2UayykHQDpwvHush8LpMRmkRBGqyCy6TcTm9T3
	 eUA4R6QaKOnKEmBxWJBH5FLPrJtkZK49VJa5diqS6A0HodvOdnBzqrYBT7ZcC8Zmjy
	 vj6/Qlh1bPOcK6nukfwfCKYYuHc3WHG6EBPZpx6YpRtSv2DNacPSzsnGLESdQBnnBu
	 9J5CMEZJefG8zUhUPlFHaJEYmEtqHmFoEhEAvkjH91MMRXQbmLeCbar0WhOcj63MNR
	 Ow7WB063PSupA==
From: Jakub Kicinski <kuba@kernel.org>
To: coiaprant@gmail.com
Cc: Jakub Kicinski <kuba@kernel.org>,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de,
	vkoul@kernel.org,
	maxime.chevallier@bootlin.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	romain.gantois@bootlin.com,
	hkallweit1@gmail.com,
	neil.armstrong@linaro.org,
	linux@armlinux.org.uk,
	shawn.lin@rock-chips.com,
	david@ixit.cz,
	netdev@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH net-next v4 08/10] net: stmmac: dwmac-rk: add SGMII support for RK3568
Date: Sat, 12 Sep 2026 13:13:30 -0700
Message-ID: <20260912201330.127164-1-kuba@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260907153713.2572547-10-coiaprant@gmail.com>
References: <20260907153713.2572547-10-coiaprant@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.
---
net: stmmac: dwmac-rk: add SGMII support for RK3568

This adds SGMII glue for RK3568: a set_to_sgmii() callback that programs
GMAC CON1 bit 7, pcs_init/pcs_exit/select_pcs callbacks that create the
Rockchip XPCS from the "pcs-handle" phandle, and a rework of the
rk_gmac_powerup() error unwinding into a single clk_disable label.

Link: https://dl.radxa.com/rock3/docs/hw/datasheet/Rockchip%20RK3568%20TRM%20Part1%20V1.1-20210301.pdf (Page 386)

A few questions below.

> While at it, fix the clock enable ordering in rk_gmac_powerup():
> gmac_clk_enable() is now called before any register access, including
> the SGMII mode setup path.  Previously SGMII mode would bypass the
> clock enable via a goto, which could cause synchronous external abort
> when accessing MAC registers with the clock domain disabled.

[Severity: Low]
Does this paragraph describe the baseline?  At 879e280b8486 there is no
SGMII case and no goto in rk_gmac_powerup(), and the order is already:

	ret = rk_get_phy_intf_sel(bsp_priv->phy_iface);
	if (ret < 0)
		return ret;
	intf = ret;

	ret = gmac_clk_enable(bsp_priv, true);
	if (ret)
		return ret;
	...
		ret = rk_write_gmac_grf_reg(bsp_priv, val);

so gmac_clk_enable() already preceded every register access and there was
nothing that could bypass it.  The change here is a pure reorder ahead of
rk_get_phy_intf_sel(), which touches no registers, plus the new unified
unwind label.

Would it be more accurate to describe this as preparing the ordering for
the new SGMII path rather than as a fix for a synchronous external abort?

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> index 8d7042e689261..e47ca1bec5b8b 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c

[ ... ]

> @@ -809,6 +813,8 @@ static const struct rk_gmac_ops rk3528_ops = {
>  #define RK3568_GRF_GMAC1_CON1		0x038c
>  
>  /* RK3568_GRF_GMAC0_CON1 && RK3568_GRF_GMAC1_CON1 */
> +#define RK3568_GMAC_MODE_RMII_RGMII		GRF_CLR_BIT(7)
> +#define RK3568_GMAC_MODE_SGMII_QSGMII		GRF_BIT(7)
>  #define RK3568_GMAC_FLOW_CTRL			GRF_BIT(3)
>  #define RK3568_GMAC_FLOW_CTRL_CLR		GRF_CLR_BIT(3)
>  #define RK3568_GMAC_RXCLK_DLY_ENABLE		GRF_BIT(1)
> @@ -851,18 +857,32 @@ static void rk3568_set_to_rgmii(struct rk_priv_data *bsp_priv,
>  		     RK3568_GMAC_CLK_TX_DL_CFG(tx_delay));
>  
>  	regmap_write(bsp_priv->grf, con1,
> +		     RK3568_GMAC_MODE_RMII_RGMII |
>  		     RK3568_GMAC_RXCLK_DLY_ENABLE |
>  		     RK3568_GMAC_TXCLK_DLY_ENABLE);
>  }
>  
> +static void rk3568_set_to_sgmii(struct rk_priv_data *bsp_priv)
> +{
> +	u32 con1;
> +
> +	con1 = (bsp_priv->id == 1) ? RK3568_GRF_GMAC1_CON1 :
> +				     RK3568_GRF_GMAC0_CON1;
> +
> +	regmap_write(bsp_priv->grf, con1, RK3568_GMAC_MODE_SGMII_QSGMII);
> +}
> +
>  static const struct rk_gmac_ops rk3568_ops = {
>  	.init = rk3568_init,
>  	.set_to_rgmii = rk3568_set_to_rgmii,
> +	.set_to_sgmii = rk3568_set_to_sgmii,
> +
>  	.set_speed = rk_set_clk_mac_speed,
>  
>  	.gmac_phy_intf_sel_mask = GENMASK_U16(6, 4),
>  
>  	.supports_rmii = true,
> +	.supports_sgmii = true,

[Severity: Medium]
Who clears CON1 bit 7 for RMII on rk3568?

rk3568_set_to_rgmii() now explicitly writes RK3568_GMAC_MODE_RMII_RGMII,
which shows bit 7 has to be programmed by the driver.  rk3568_ops declares
supports_rmii = true but has no .set_to_rmii, so the RMII branch of
rk_gmac_powerup() is a no-op:

	case PHY_INTERFACE_MODE_RMII:
		dev_info(dev, "init for RMII\n");
		if (bsp_priv->ops->set_to_rmii)
			bsp_priv->ops->set_to_rmii(bsp_priv);
		break;

and the generic GRF write uses gmac_phy_intf_sel_mask = GENMASK_U16(6, 4),
whose write-enable half-word never covers bit 7.

Since rk3568_set_to_sgmii() leaves bit 7 set persistently and nothing in
rk_gmac_powerdown() restores it, can an RMII port come up muxed to the
SerDes when bit 7 was left set by firmware or by a previous SGMII
configuration of the same MAC (kexec, warm reboot)?  The probe would report
success while the link never works.

>  
>  	.regs_valid = true,
>  	.regs = {
> @@ -1208,6 +1228,43 @@ static void rk_phy_powerdown(struct rk_priv_data *bsp_priv)
>  		dev_err(bsp_priv->dev, "fail to disable phy-supply\n");
>  }
>  
> +static int rk_pcs_init(struct stmmac_priv *priv)
> +{
> +	struct device_node *np = priv->device->of_node;
> +	struct device_node *pcs_node;
> +	struct dw_xpcs *xpcs;
> +
> +	pcs_node = of_parse_phandle(np, "pcs-handle", 0);
> +	if (!pcs_node)
> +		return -ENODEV;

[Severity: Low]
Should "pcs-handle" be documented in the Rockchip MAC binding?

This makes the property effectively mandatory for phy-mode = "sgmii" on
RK3568: a missing phandle returns -ENODEV, and stmmac_pcs_setup() turns
that into a probe failure:

drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c:stmmac_pcs_setup() {
	ret = priv->plat->pcs_init(priv);
	if (ret)
		return dev_err_probe(priv->device, ret, "No xPCS found\n");
}

Documentation/devicetree/bindings/net/rockchip-dwmac.yaml does not mention
pcs-handle at all - it is neither described nor conditionally required for
the SGMII-capable compatibles - while the new
Documentation/devicetree/bindings/net/pcs/rockchip-dwxpcs.yaml says the
port "is linked to an Ethernet MAC controller via the pcs-handle property
in the MAC's device tree node".  Other stmmac glue bindings that parse this
property describe it (renesas,rzn1-gmac.yaml, renesas,rzv2h-gbeth.yaml).
Could the MAC binding be updated to match?

> +
> +	xpcs = xpcs_rk_create(priv->device, pcs_node);
> +	of_node_put(pcs_node);
> +	if (IS_ERR(xpcs))
> +		return PTR_ERR(xpcs);
> +
> +	priv->hw->xpcs = xpcs;
> +	return 0;
> +}

[ ... ]

> @@ -1330,6 +1387,7 @@ static struct rk_priv_data *rk_gmac_setup(struct platform_device *pdev,
>  
>  	bsp_priv->supports_rgmii = ops->supports_rgmii || !!ops->set_to_rgmii;
>  	bsp_priv->supports_rmii = ops->supports_rmii || !!ops->set_to_rmii;
> +	bsp_priv->supports_sgmii = ops->supports_sgmii || !!ops->set_to_sgmii;

[ ... ]

> @@ -1379,16 +1441,19 @@ static int rk_gmac_powerup(struct rk_priv_data *bsp_priv)
>  	if (ret)
>  		return ret;
>  
> +	ret = gmac_clk_enable(bsp_priv, true);
> +	if (ret)
> +		return ret;

[Severity: Medium]
This isn't a bug introduced by this patch, but the bare return here cannot
unwind a partially enabled clock domain.  gmac_clk_enable() leaks the bulk
clock references when the PHY clock fails:

drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c:gmac_clk_enable() {
			ret = clk_bulk_prepare_enable(bsp_priv->num_clks,
						      bsp_priv->clks);
			if (ret)
				return ret;

			ret = clk_prepare_enable(bsp_priv->clk_phy);
			if (ret)
				return ret;
	...
			bsp_priv->clk_enabled = true;
}

The second failure path returns without clk_bulk_disable_unprepare() and
without setting clk_enabled, so the new clk_disable label,
rk_gmac_powerdown() and the suspend path are all no-ops afterwards because
the disable branch is gated on clk_enabled.  Does this leave the bulk
clocks prepared and enabled for the lifetime of the system?

> +
> +	if (bsp_priv->phy_iface == PHY_INTERFACE_MODE_SGMII)
> +		goto set_mode;
> +
>  	ret = rk_get_phy_intf_sel(bsp_priv->phy_iface);
>  	if (ret < 0)
> -		return ret;
> +		goto clk_disable;
>  
>  	intf = ret;
>  

[ ... ]

> @@ -1447,15 +1509,20 @@ static int rk_gmac_powerup(struct rk_priv_data *bsp_priv)
>  		if (bsp_priv->ops->set_to_rmii)
>  			bsp_priv->ops->set_to_rmii(bsp_priv);
>  		break;
> +	case PHY_INTERFACE_MODE_SGMII:
> +		dev_info(dev, "init for SGMII\n");
> +		if (bsp_priv->ops->set_to_sgmii)
> +			bsp_priv->ops->set_to_sgmii(bsp_priv);
> +		break;
>  	default:
>  		dev_err(dev, "NO interface defined!\n");
> +		ret = -EINVAL;
> +		goto clk_disable;
>  	}

[ ... ]

> @@ -1486,6 +1557,9 @@ static void rk_get_interfaces(struct stmmac_priv *priv, void *bsp_priv,
>  
>  	if (rk->supports_rmii)
>  		__set_bit(PHY_INTERFACE_MODE_RMII, interfaces);
> +
> +	if (rk->supports_sgmii)
> +		__set_bit(PHY_INTERFACE_MODE_SGMII, interfaces);
>  }

[Severity: Medium]
Is the SGMII advertisement here consistent with where the PCS is installed?

supports_sgmii is true for every rk3568 instance regardless of DT, so SGMII
always lands in phylink_config.supported_interfaces.  The PCS plumbing,
however, is only installed when the DT phy-mode is exactly SGMII (see the
rk_gmac_probe() hunk below).

On an RK3568 board with phy-mode = "rgmii"/"rmii", phylink can still pick
SGMII - phylink_validate_phy() intersects phy->possible_interfaces with
config->supported_interfaces - and then:

drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:stmmac_mac_select_pcs() {
	if (priv->plat->select_pcs) {
		pcs = priv->plat->select_pcs(priv, interface);
		if (!IS_ERR(pcs))
			return pcs;
	}
}

returns NULL because select_pcs is unset, no XPCS was ever created
(pcs_init is NULL), and rk_gmac_powerup() has already programmed the GRF
once from the DT-derived bsp_priv->phy_iface, so rk3568_set_to_sgmii() never
ran.  Would gating the SGMII bit on the same condition that installs
select_pcs/pcs_init keep the two in agreement?

>  
>  static int rk_set_clk_tx_rate(void *bsp_priv_, struct clk *clk_tx_i,
> @@ -1602,6 +1676,17 @@ static int rk_gmac_probe(struct platform_device *pdev)
>  	plat_dat->suspend = rk_gmac_suspend;
>  	plat_dat->resume = rk_gmac_resume;
>  
> +	if (plat_dat->phy_interface == PHY_INTERFACE_MODE_SGMII) {
> +		/* SGMII clock always runs at 125 MHz */
> +		plat_dat->set_clk_tx_rate = NULL;
> +
> +		/* SGMII requires a PCS */
> +		plat_dat->default_an_inband = true;

[Severity: Medium]
Does default_an_inband guarantee in-band mode here?

include/linux/phylink.h describes it as a default that "a fixed-link
specification will override", and phylink has two ways out of in-band:

drivers/net/phy/phylink.c:phylink_parse_mode() {
	dn = fwnode_get_named_child_node(fwnode, "fixed-link");
	if (dn || fwnode_property_present(fwnode, "fixed-link"))
		pl->cfg_link_an_mode = MLO_AN_FIXED;
}

drivers/net/phy/phylink.c:phylink_pcs_neg_mode() {
			neg_mode = PHYLINK_PCS_NEG_OUTBAND;
			if (pl->phydev)
				mode = MLO_AN_PHY;
}

With set_clk_tx_rate cleared, stmmac_mac_link_up() then programs no rate at
all:

drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:stmmac_mac_link_up() {
	if (priv->plat->set_clk_tx_rate) {
		ret = priv->plat->set_clk_tx_rate(priv->plat->bsp_priv,
						priv->plat->clk_tx_i,
						interface, speed);
}

So for phy-mode = "sgmii" with a fixed-link node, or with a PHY that cannot
do in-band signalling, the fixed 125 MHz clock is used at 10/100 Mbps -
which the commit message says gives working TX and failing RX.  Should the
driver reject out-of-band SGMII explicitly instead of relying on the
default?

> +		plat_dat->pcs_init = rk_pcs_init;
> +		plat_dat->pcs_exit = rk_pcs_exit;
> +		plat_dat->select_pcs = rk_select_pcs;
> +	}
> +

[ ... ]

