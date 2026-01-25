Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0F11D74EFD
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 Jan 2026 22:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hxH2gv6G3NoCoBnyDC4nPkfI2czI+Fq/um97dmMM4lY=; b=NxiBhr5EljhK3t6TC8RB83h9RP
	bH6cbJFp0nCgQjOHszt0m/gc0MClt+v6Zo/HmLinU+Pq4wAi1PvLxtOE6tSPdqxfEk05dVcpHbIOr
	x1N6+bNA4pTM8RqMKaIi84M7wZ20hBmADbY/nByWUXKvRuBldjIHU7AXJdiz4+AitSntVTwg/+9Uy
	GM+qNowwkaJAsjq7X7EzzGUJGalxfQsiIHFgnBB0Vow7l2UGNsAIY4pNGlAxRUuSCHu8L5C1wb1kq
	nSOkqsXPfuvNvbfgyI6KjQIJrx7v6y8PsG+DoAAyxGzXaSLeV2KqgI1mEZ/wGqXtsywGs6LIRnD1E
	Io7+9Bwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vk8PV-0000000BZ4p-2fTC;
	Sun, 25 Jan 2026 22:16:45 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vk8PN-0000000BYy8-0Xq1;
	Sun, 25 Jan 2026 22:16:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 68BD043EBB;
	Sun, 25 Jan 2026 22:16:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B18A6C4CEF1;
	Sun, 25 Jan 2026 22:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769379396;
	bh=E8R/DJ/ZbtKTHps96zcRomj23PE6yMett5iGgHXATgo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=px5R/rXqCwz2QVbI/14rOI9OYcyDWK9WeJQ71v8yaGRyq4uUo7bfAXPy+adHh2aIK
	 e5i+8zYDRoNIgvKowNezzV3pH+nEwgf/fNQn+qmcCk9Q9rGxuX7yBrx22VeXFSAuuh
	 WSkkKeJ4xs664gJ/VDCGQhO3WTOSbhw3+6h4EHOCFYF7xS/fIlqcV4LWexh+gTHWfs
	 33QdoyfZW303ADs3czHpKmd2jKtA0lR2yKlc7sOIarhPzTSv2u383TV/wvROk9ml6Y
	 xj/thP1HuC/aitZxgKUW+JovDB3748F+t4brtT7v0MIk5cs9DBDHwS/ZQk2ePSSub2
	 eLrinl8J6O3ww==
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
Subject: Re: [net-next,20/21] net: stmmac: rk: use rk_encode_wm16() for clock selection
Date: Sun, 25 Jan 2026 14:16:34 -0800
Message-ID: <20260125221634.3396295-1-kuba@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <E1vjEvQ-00000005ghV-07C8@rmk-PC.armlinux.org.uk>
References: <E1vjEvQ-00000005ghV-07C8@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260125_141637_196712_A168A457 
X-CRM114-Status: GOOD (  16.25  )
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

This patch adds an rmii_mode_mask field to struct rk_clock_fields to handle
RMII mode configuration in the clock GRF register. It removes the SoC-specific
set_to_rmii() functions for rk3506, rk3528, and rk3588, replacing them with a
generic mechanism in rk_gmac_powerup().

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> index ebbc09ea572a..759deb66ef2a 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c

[ ... ]

> @@ -1412,6 +1385,15 @@ static int rk_gmac_powerup(struct rk_priv_data *bsp_priv)
>  			return ret;
>  	}
>
> +	if (bsp_priv->clock.rmii_mode_mask) {
> +		val = rk_encode_wm16(ret == PHY_INTF_SEL_RMII,
> +				     bsp_priv->clock.rmii_mode_mask);

Is this comparison using the correct value? Earlier in rk_gmac_powerup(), the
variable ret is assigned the return value from rk_get_phy_intf_sel(), which is
PHY_INTF_SEL_RGMII (0) or PHY_INTF_SEL_RMII (1).

However, for SoCs that have gmac_phy_intf_sel_mask set (such as rk3588), the
code enters the preceding if block:

    if (bsp_priv->gmac_phy_intf_sel_mask || bsp_priv->gmac_rmii_mode_mask) {
        ...
        ret = regmap_write(bsp_priv->grf, bsp_priv->gmac_grf_reg, val);
        ...
    }

After this block, ret has been overwritten with the regmap_write() return
value (0 on success). When the rmii_mode_mask block executes, the comparison
ret == PHY_INTF_SEL_RMII becomes 0 == 1, which is always false.

This means for rk3588 in RMII mode, the rmii_mode bit in the clock register
will be cleared (RGMII mode) instead of set. Would it be better to save the
PHY interface selection value in a separate variable before it gets
overwritten?

> +
> +		ret = rk_write_clock_grf_reg(bsp_priv, val);
> +		if (ret < 0)
> +			return ret;
> +	}

