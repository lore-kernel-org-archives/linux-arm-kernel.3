Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D33AD74EF7
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 Jan 2026 22:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EOIK10xH0yTCWUUVj0gfpOce8Y/1mBPR52q7zT3mQg8=; b=cwuN2ENpCAf+U5CUygmtu2j+sG
	yQRPEPkP8paGKVs+irzlRuo/4zsVPcCgCE9gf0bnvSXBUb7R6t0ZDhu0qnU8XANrWdro7hSz7zs1h
	yxRzSNmlestkvZzYZa48ZmG/ThjLGcnsvDh++l+ZtwnE8tlYNpH6eLV7VWJrkaprRsmZlY6E3OCcg
	u11P3xoujwWq8FwYPWUGmG37z3jAlSrDeO5GXhm1LL3LV/7aXF2dsN2HFABaXXHYl02HZCuzXdCcI
	nOQUEovGZOWQp/wBtt4Khpfc8FLWkPnrJbTw01GkYub0GwA8nvrb1pnecpHluuT/C+dyxVP6PpxRU
	E37R/3hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vk8PI-0000000BYun-1Q4P;
	Sun, 25 Jan 2026 22:16:32 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vk8PG-0000000BYtx-1SWy;
	Sun, 25 Jan 2026 22:16:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B1A9F600C3;
	Sun, 25 Jan 2026 22:16:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E478AC16AAE;
	Sun, 25 Jan 2026 22:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769379389;
	bh=d0e6wGR5CvLacjw6Dk5QUSRgUBj7IzlbzM3eQMWWIE4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dJ2VaWe9Y681uA5O6VXiK85/AuwwpVof+DzkmFwm5UjvHuE6pywUzUvbVAVvOXG9l
	 hfwQi9rV09LguQ+rVHfvrDcDP6YSxfApFjuMrydLFiQonchAFn2tRes4gM0d6+UyZU
	 dW0vnCZjSE5R1FACd/AZN94Rzc8fBePyCwj8e02cLWvaF5lhQpnRzsL5mTsd3yyZay
	 Ht5v6d9voDwxlVedzgNIlVB0UA/Bqe+yW6MJdfp1dsH05KSmnmJgcxTE3FKNu+K3Do
	 yLa4swLHRjCesVqles3HfHIx6KR6dMZFmPjLGp9PnykUiMtH8pbTWHFeRUv5uwCy8X
	 oyLyoEBWa5sQA==
From: Jakub Kicinski <kuba@kernel.org>
To: rmk+kernel@armlinux.org.uk
Cc: Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	andrew@lunn.ch,
	davem@davemloft.net,
	alexandre.torgue@foss.st.com,
	netdev@vger.kernel.org,
	edumazet@google.com,
	pabeni@redhat.com,
	heiko@sntech.de,
	andrew+netdev@lunn.ch,
	linux-rockchip@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [net-next,07/21] net: stmmac: rk: convert to mask-based interface mode configuration
Date: Sun, 25 Jan 2026 14:16:27 -0800
Message-ID: <20260125221627.3396138-1-kuba@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <E1vjEuL-00000005ggE-1z5W@rmk-PC.armlinux.org.uk>
References: <E1vjEuL-00000005ggE-1z5W@rmk-PC.armlinux.org.uk>
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

For local reproduction steps see https://netdev-ai.bots.linux.dev/ai-local.html
---
net: stmmac: rk: convert to mask-based interface mode configuration

This patch consolidates PHY interface mode configuration into a common
infrastructure. It introduces mask fields for phy_intf_sel and rmii_mode,
and moves the register writes from SoC-specific set_to_rgmii/set_to_rmii
functions into the common rk_gmac_powerup() function.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> index 4117f6863ff0..48fc5b58092f 100644

[ ... ]

> @@ -1198,9 +1225,6 @@ static const struct rk_gmac_ops rk3576_ops = {
>  #define RK3588_GRF_GMAC_CON0			0X0008
>  #define RK3588_GRF_CLK_CON1			0X0070

The comment above these defines says "/* php_grf */" indicating that
RK3588_GRF_GMAC_CON0 is in the php_grf register space.

[ ... ]

> +static int rk3588_init(struct rk_priv_data *bsp_priv)
> +{
> +	switch (bsp_priv->id) {
> +	case 0:
> +		bsp_priv->gmac_phy_intf_sel_mask = GENMASK_U16(5, 3);
> +		return 0;
> +
> +	case 1:
> +		bsp_priv->gmac_phy_intf_sel_mask = GENMASK_U16(11, 9);
> +		return 0;
> +
> +	default:
> +		return -EINVAL;
> +	}
> +}

[ ... ]

> @@ -1296,10 +1330,14 @@ static void rk3588_set_clock_selection(struct rk_priv_data *bsp_priv, bool input
>  }
>
>  static const struct rk_gmac_ops rk3588_ops = {
> +	.init = rk3588_init,
>  	.set_to_rgmii = rk3588_set_to_rgmii,
>  	.set_to_rmii = rk3588_set_to_rmii,
>  	.set_speed = rk3588_set_gmac_speed,
>  	.set_clock_selection = rk3588_set_clock_selection,
> +
> +	.gmac_grf_reg = RK3588_GRF_GMAC_CON0,

rk3588_ops sets gmac_grf_reg to RK3588_GRF_GMAC_CON0, and rk3588_init()
sets gmac_phy_intf_sel_mask. This enables the new common code path in
rk_gmac_powerup().

[ ... ]

> @@ -1664,6 +1707,24 @@ static int rk_gmac_powerup(struct rk_priv_data *bsp_priv)
>  	if (ret)
>  		return ret;
>
> +	ret = rk_get_phy_intf_sel(bsp_priv->phy_iface);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (bsp_priv->gmac_phy_intf_sel_mask ||
> +	    bsp_priv->gmac_rmii_mode_mask) {
> +		/* If defined, encode the phy_intf_sel value */
> +		val = rk_encode_wm16(ret, bsp_priv->gmac_phy_intf_sel_mask);
> +
> +		/* If defined, encode the RMII mode mask setting. */
> +		val |= rk_encode_wm16(ret == PHY_INTF_SEL_RMII,
> +				      bsp_priv->gmac_rmii_mode_mask);
> +
> +		ret = regmap_write(bsp_priv->grf, bsp_priv->gmac_grf_reg, val);
                                          ^^^^

For rk3588, does this write to the wrong regmap? The old code in
rk3588_set_to_rgmii() and rk3588_set_to_rmii() wrote the PHY_INTF_SEL
register to bsp_priv->php_grf:

    regmap_write(bsp_priv->php_grf, RK3588_GRF_GMAC_CON0,
                 RK3588_GMAC_PHY_INTF_SEL(id, PHY_INTF_SEL_RGMII));

But the new common code writes to bsp_priv->grf instead. The comment in
the source indicates RK3588_GRF_GMAC_CON0 is in the php_grf register
space. Should this be using php_grf for rk3588?

> +		if (ret < 0)
> +			return ret;
> +	}

