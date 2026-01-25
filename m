Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64592D74EF7
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 Jan 2026 22:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xSpw0pecfzn3OHTUz4ELnnOapmxAv8+oBlxd+xdh5ws=; b=zvloYTGp1tV0RnvnIwkpQv5dFO
	ZCgCxTpksYm/09XFFuc2xgqPY+T9A+NjqoeUOa5MLXK5PB9SCM0GzLOaoStY8ONOUwh8ToG2HI4pO
	6vd4JiP9PleSlUMwGC/jgT3OegHncQduUAgfMn51uUM6byvfmP3Sfsux8FhZM+X+Nyd7sCcQyhwl/
	L3Tj/j4R8QVjaWATbgBYAlWsZ9mbxQaeIfGumSirmiVgKXceelBPtGxmuVT0qwAduUISXnViVL+bU
	bXsXq/+bzivN9NzrLqa0rvx8UYGyMVOCGLt4ppp0ruLit5ttZNt3VoQumBQp2koKGUP5UhYc7MwW0
	V3sLu2TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vk8PT-0000000BZ1j-1aH6;
	Sun, 25 Jan 2026 22:16:43 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vk8PK-0000000BYvy-1Z9i;
	Sun, 25 Jan 2026 22:16:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F3C726011E;
	Sun, 25 Jan 2026 22:16:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27ABFC19425;
	Sun, 25 Jan 2026 22:16:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769379392;
	bh=6tZOcoDzLjLZcLcPdF7/WrSy+zSdMZm9sx0zi040qLs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mhAo3cqiV3m5SxW526CCIL5J+nR3v9o0BKXcdtdln/txsFUNcEtkPC9z86vdxHAHs
	 /j45rTwFWkBzTS6CTNz7S9PnQylV6tPQBA1wTY47zsmbFIHhyj+Ddm1/kq87McwBbH
	 UIjNYuWt+q5z7OSRQXXgWmOv9pxjoHLfCLA4iswiDqAyUbnaVqgVxD0tAP0CZgDZzE
	 nNlHu3drq4RpNMHdqAj3pNq2laOHJonC8+u5XfUA6LDEFW7bCAv680sTJXwKT7WZaC
	 5rYjAl9yw68Vy4lh6j5Cr9n4TkHYx6CU7H3mrViRLVGz1wBR9o35l2gBHx7U3UrlbP
	 l/fctiky0mCtQ==
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
Subject: Re: [net-next,18/21] net: stmmac: rk: rk3328: gmac2phy only supports RMII
Date: Sun, 25 Jan 2026 14:16:31 -0800
Message-ID: <20260125221631.3396200-1-kuba@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <E1vjEvF-00000005ghI-3CYC@rmk-PC.armlinux.org.uk>
References: <E1vjEvF-00000005ghI-3CYC@rmk-PC.armlinux.org.uk>
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
net: stmmac: rk: rk3506, rk3528 and kk3588 have rmii_mode in clock register

This commit consolidates RMII mode configuration for rk3506, rk3528, and
rk3588 by adding a rmii_mode_mask field to rk_clock_fields, removing the
per-SoC set_to_rmii() functions, and adding common code in rk_gmac_powerup()
to write this field.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> index ebbc09ea572a..759deb66ef2a 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c

[ ... ]

> @@ -1412,6 +1385,15 @@ static int rk_gmac_powerup(struct rk_priv_data *bsp_priv)
>  			return ret;
>  	}

The code above (not shown in the diff, but present in the function) is:

    ret = rk_get_phy_intf_sel(bsp_priv->phy_iface);
    ...
    if (bsp_priv->gmac_phy_intf_sel_mask ||
        bsp_priv->gmac_rmii_mode_mask) {
        ...
        ret = regmap_write(bsp_priv->grf, bsp_priv->gmac_grf_reg, val);
        if (ret < 0)
            return ret;
    }

At this point, if the block above executed, ret holds the return value from
regmap_write() (0 on success), not the interface selector.

> +	if (bsp_priv->clock.rmii_mode_mask) {
> +		val = rk_encode_wm16(ret == PHY_INTF_SEL_RMII,
> +				     bsp_priv->clock.rmii_mode_mask);

For rk3588, both gmac_phy_intf_sel_mask and clock.rmii_mode_mask are set in
rk3588_init(). When the preceding block executes, it overwrites ret with
the regmap_write() return value. Then here, ret == PHY_INTF_SEL_RMII
compares 0 == 4 which is always false, so the rmii_mode bit will never be
set for rk3588 in RMII mode.

Should ret be saved before the preceding block so its original value
(the interface selector) can be used here?

> +
> +		ret = rk_write_clock_grf_reg(bsp_priv, val);
> +		if (ret < 0)
> +			return ret;
> +	}

[ ... ]

