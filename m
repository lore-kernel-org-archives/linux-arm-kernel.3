Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61781E63CA4
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 Jan 2026 22:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UijmsoFoLBFm66IqGVaO+nTkrgwW+uiTExzQxvlAddc=; b=DXAuPfJiT3P1JhAtIr9oLW+NVe
	dRR39wmqWCYusijsC7AEo6ZG680YuNMZGAfTzC7RdtDABXLmaLBT6p3deCJtC/4V9iyYpBNJVKka8
	HULc2W1clty7XHzjS7vgELqwWyyjQcTfI8D8I9RISQRRXoclH0Jbhh3KpAXH2pYYxZlW10KaPWxfP
	4xToGtmyaodPyO2IWLlscMe44WoPD+Hge5hnrD+uTs49ka8ZjrNbUtbeF8370vNg78X4renKHDsaJ
	xPsBqtKwLrIPwolKyFtu3odURUY1hZfnICxGHl43rmtnicCRNRKf8nEfpSaqML/BOEv/dCdlz6W/I
	tQaLLpOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vk8PS-0000000BZ10-2PQL;
	Sun, 25 Jan 2026 22:16:42 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vk8PH-0000000BYuE-22rV;
	Sun, 25 Jan 2026 22:16:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2CC2443C6E;
	Sun, 25 Jan 2026 22:16:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FC34C2BC86;
	Sun, 25 Jan 2026 22:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769379391;
	bh=f3JOuPvjWSkZ5OMkpcZPMBzYMykOzPVsEuZRDZjmfrI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nXjfi6DjXDT+vEwmrnTDrefeneyQCEW+WZwgmEKzn38xGlSOO+2cmjTFNuwg4R603
	 12t5u2HmnuowyrtWuCvDdWJDMnDl49qtRdVLCjTOjOukCdCcjCrrKM68vD1RoFyzFI
	 bOwW9u0mSjkmJq5j4A4PhChil8zodhleWEavBL0NERPAwqPS8n/yKfLAadL/lzzPRG
	 7VQyrV0OniqAL9ep3Mm1KWlS2em+XkTeKGIh9gh20VZXfTPZKbI0QZ0QZqo0S8n+8M
	 8R44ka8/76H+Q6kWJtih6ovCy4DUZDybt3XOjBoCN1e3oaMnn5McaCxkI+kA17o3w2
	 ucZB241H8e4jQ==
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
Subject: Re: [net-next,17/21] net: stmmac: rk: replace empty set_to_rmii() with supports_rmii
Date: Sun, 25 Jan 2026 14:16:29 -0800
Message-ID: <20260125221629.3396169-1-kuba@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <E1vjEvA-00000005ghD-2i2t@rmk-PC.armlinux.org.uk>
References: <E1vjEvA-00000005ghD-2i2t@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260125_141631_563605_1A7C4F23 
X-CRM114-Status: GOOD (  13.55  )
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

This patch consolidates RMII mode configuration for rk3506, rk3528, and
rk3588 by moving the rmii_mode bit writes from per-SoC set_to_rmii()
functions into a centralized block in rk_gmac_powerup().

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> index ebbc09ea572a..759deb66ef2a 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c

[ ... ]

> @@ -1412,6 +1385,15 @@ static int rk_gmac_powerup(struct rk_priv_data *bsp_priv)
> 			return ret;
> 	}

The context above this hunk is relevant. Earlier in rk_gmac_powerup():

    ret = rk_get_phy_intf_sel(bsp_priv->phy_iface);
    ...
    if (bsp_priv->gmac_phy_intf_sel_mask ||
        bsp_priv->gmac_rmii_mode_mask) {
        ...
        ret = regmap_write(bsp_priv->grf, bsp_priv->gmac_grf_reg, val);
        ...
    }

At this point, if the first if-block executed, ret has been overwritten by
regmap_write() and will be 0 on success.

> +	if (bsp_priv->clock.rmii_mode_mask) {
> +		val = rk_encode_wm16(ret == PHY_INTF_SEL_RMII,
> +				     bsp_priv->clock.rmii_mode_mask);

For RK3588, both gmac_phy_intf_sel_mask and clock.rmii_mode_mask are set.
The first if-block will execute and overwrite ret with the regmap_write()
return value (0 on success).

When this second if-block runs, ret will be 0 rather than the original
PHY_INTF_SEL_RMII value (which is 4). This means ret == PHY_INTF_SEL_RMII
will always evaluate to false for RK3588, causing the rmii_mode bit to be
cleared instead of set when RMII mode is configured.

Should ret be saved before the first if-block and restored here, or should
a separate variable hold the phy interface selection?

> +
> +		ret = rk_write_clock_grf_reg(bsp_priv, val);
> +		if (ret < 0)
> +			return ret;
> +	}

[ ... ]

