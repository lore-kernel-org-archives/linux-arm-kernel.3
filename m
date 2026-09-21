Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DDAAC982E6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 23:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wyyNcZM4cSJHoIFefeYseki5qqzOc1LjCCBw+fDcDDg=; b=RJhNaXSO62xCXZ2W2nk1zVUWiD
	h+GJTs5gEz6g8tC9O3jS/lGSn648auBQ8nfdrjNTOTH/mLiS8MlzHCzczQuBp+wNNLBZpjkKq0YyI
	IBxgbVNVG6ZEBm2jeFNzbfTl1EYuu2A/H/nlItax+4WNonSYWj37u1zuK6+EQfLSuzBQMo7lt9nkS
	3K9jy0x3EgJW1RgezAHGgXvyMpBI1LtrbhOWOTZJlCbF4rhkUhAhAE2waPd5Pcac7EbT5va2sGjsX
	/L+K5f0M0OUrWFvsSGGdtE8PHmEdbMdXi44cYYlpheK34+Z+Z+Ax/v8GQZGCsOeVWwtg9ndr7W0BZ
	Jj6gTCCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8nff-00000003hKW-0h6q;
	Mon, 21 Sep 2026 23:43:39 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8nfe-00000003hKC-0xBP;
	Mon, 21 Sep 2026 23:43:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7C43D60210;
	Mon, 21 Sep 2026 23:43:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA46B1F000FF;
	Mon, 21 Sep 2026 23:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790034217;
	bh=wyyNcZM4cSJHoIFefeYseki5qqzOc1LjCCBw+fDcDDg=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=N1+Y5OPs8kUURUvBk/7RrjCkQNf7htdjVy5zUsfly1SsHpPmncA6+HYrMh+BK04MX
	 oroO/NSntNFKT1e04JHHw1u5vQRBxeE7+gL4MKTKzYf/J/FjqaWMX6c3MT2XaG2t4D
	 nu1prph8kA5fOSja6mP6uOoQLurEIdz1xMnSASWOzEZcyLydDUi6WPsfDVGnG6FeVk
	 F1Z3dPCIBM9bioKK8FuEbOxa9r0pdUchac1iU7WCTGC2XFctOC0ByEnp889ZD/cXlb
	 LVrzc8SmjlP6sFxzmlaXmPjJ0pxlcECs+L3Qmt1dnQZ3FchBhCxgHCq1p1b5fb0aQl
	 ZYeWqTKq6xpVw==
Subject: Re: [PATCH net-next v7 01/11] net: stmmac: move XPCS lifetime
 management to platform drivers
From: netdev-bot+sashiko@kernel.org
To: coiaprant@gmail.com
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, heiko@sntech.de, vkoul@kernel.org,
 maxime.chevallier@bootlin.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 romain.gantois@bootlin.com, hkallweit1@gmail.com, neil.armstrong@linaro.org,
 linux@armlinux.org.uk, shawn.lin@rock-chips.com, david@ixit.cz,
 netdev@vger.kernel.org, linux-rockchip@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-renesas-soc@vger.kernel.org
Date: Mon, 21 Sep 2026 23:43:35 +0000
Message-ID: <179003421521.2160803.12201964751147449347@kernel.org>
In-Reply-To: <20260917204624.2427486-2-coiaprant@gmail.com>
References: <20260917204624.2427486-2-coiaprant@gmail.com>
X-sashiko-severity: Low
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
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

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] Commit message supporting evidence: the list "every DTS that
  pairs a dwmac node with a PCS goes through a glue that sets pcs_init()…
- [Low] Concern that the commit message overstates the second ("more
  critically") problem — the unconditional `priv->hw->xpcs = xpcs;`…

--

net: stmmac: move XPCS lifetime management to platform drivers

This moves XPCS creation and destruction out of the common
stmmac_pcs_setup()/stmmac_pcs_clean() code and into the platform glue
pcs_init()/pcs_exit() callbacks. The Intel mGbE glue gains its own
pcs_init()/pcs_exit() that create and destroy the XPCS, and the
renesas-gbeth, rzn1 and socfpga pcs_exit() callbacks now clear
priv->hw->phylink_pcs after destroying the PCS.

Two observations on the commit message below.

>     Second, and more critically, when a platform driver sets pcs_init()
>     and creates an XPCS inside that callback, the common code afterwards
>     still runs unconditionally and overwrites priv->hw->xpcs with the
>     local xpcs variable, which stays NULL. The platform driver has no way
>     to prevent this override because the common code runs after the
>     platform-specific initialization.

[Severity: Low]
This isn't a bug, but is the "more critically" framing accurate for the
tree as it stands before this patch?

The description of the pre-patch code is correct: stmmac_pcs_setup() ran

	if (priv->plat->pcs_init) {
		ret = priv->plat->pcs_init(priv);
	...
	priv->hw->xpcs = xpcs;

with xpcs still NULL on the pcs_init() branch.

However, none of the pre-patch in-tree pcs_init() implementations store
an XPCS: renesas_gmac_pcs_init(), rzn1_dwmac_pcs_init() and
socfpga_dwmac_pcs_init() all assign priv->hw->phylink_pcs, not
priv->hw->xpcs, so no shipping platform was actually hit by the
overwrite.

The first platform that stores an XPCS from pcs_init() is
intel_mgbe_pcs_init(), added by this very patch. Would it be clearer to
state that the overwrite is a latent design gap that becomes relevant
once a glue starts creating its own XPCS, rather than an existing
failure?

>     Note that this also removes the generic "pcs-handle" parsing from the
>     common code. A glue that does not set pcs_init() now leaves
>     priv->hw->xpcs as NULL, and "pcs-handle" becomes a no-op for it. No
>     in-tree platform relies on this path: every DTS that pairs a dwmac node
>     with a PCS goes through a glue that sets pcs_init() (Intel, Renesas,
>     RZ/N1, SoCFPGA, Rockchip).

[Severity: Low]
Should Rockchip be in that list at this point in the series? At this
commit, drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c has no PCS
handling at all, there is no pcs_init(), pcs_exit(), select_pcs(), xpcs
or pcs_mask reference in that file, and no Rockchip dwmac DTS uses
"pcs-handle".

The underlying claim does check out for the other entries: the only
in-tree setter of mdio_bus_data->pcs_mask is intel_mgbe_common_data(),
which this patch also gives pcs_init()/pcs_exit(), and the only dwmac DTS
users of "pcs-handle" are the rzn1 and renesas-gbeth nodes, both of which
already set pcs_init().

The Rockchip glue does gain rk_pcs_init()/rk_pcs_exit()/rk_select_pcs()
later in this same series ("net: stmmac: dwmac-rk: add SGMII support for
RK3568"), so the list is accurate for the finished series. Would it be
worth wording the parenthetical to reflect what is true at this commit,
or reordering so the Rockchip support lands first?

For reference, the code the two comments refer to:

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
> index f5f9fa67ecd77..4308dccbf2570 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
> @@ -603,13 +603,47 @@ static void common_default_data(struct plat_stmmacenet_data *plat)
>  	plat->mdio_bus_data->needs_reset = true;
>  }
>  
> +static int intel_mgbe_pcs_init(struct stmmac_priv *priv)
> +{

[ ... ]

> +	xpcs_config_eee_mult_fact(xpcs, priv->plat->mult_fact_100ns);
> +
> +	priv->hw->xpcs = xpcs;
> +	return 0;
> +}

[ ... ]

> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
> index afe98ff5bdcb0..7396b68899c66 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
> @@ -426,35 +426,14 @@ int stmmac_mdio_reset(struct mii_bus *bus)
>  int stmmac_pcs_setup(struct net_device *ndev)
>  {
>  	struct stmmac_priv *priv = netdev_priv(ndev);
> -	struct fwnode_handle *devnode, *pcsnode;
> -	struct dw_xpcs *xpcs = NULL;
> -	int addr, ret;
> -
> -	devnode = dev_fwnode(priv->device);
> -
> -	if (priv->plat->pcs_init) {
> -		ret = priv->plat->pcs_init(priv);
> -	} else if (fwnode_property_present(devnode, "pcs-handle")) {
> -		pcsnode = fwnode_find_reference(devnode, "pcs-handle", 0);
> -		xpcs = xpcs_create_fwnode(pcsnode);
> -		fwnode_handle_put(pcsnode);
> -		ret = PTR_ERR_OR_ZERO(xpcs);
> -	} else if (priv->plat->mdio_bus_data &&
> -		   priv->plat->mdio_bus_data->pcs_mask) {
> -		addr = ffs(priv->plat->mdio_bus_data->pcs_mask) - 1;
> -		xpcs = xpcs_create_mdiodev(priv->mii, addr);
> -		ret = PTR_ERR_OR_ZERO(xpcs);
> -	} else {
> +	int ret;
> +
> +	if (!priv->plat->pcs_init)
>  		return 0;
> -	}
>  
> +	ret = priv->plat->pcs_init(priv);
>  	if (ret)
> -		return dev_err_probe(priv->device, ret, "No xPCS found\n");
> -
> -	if (xpcs)
> -		xpcs_config_eee_mult_fact(xpcs, priv->plat->mult_fact_100ns);
> -
> -	priv->hw->xpcs = xpcs;
> +		return dev_err_probe(priv->device, ret, "Failed to initialize PCS\n");
>  
>  	return 0;
>  }

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260917204624.2427486-1-coiaprant%40gmail.com

