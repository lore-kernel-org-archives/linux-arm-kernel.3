Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 645BDCF65E2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 00:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IJi+Gz+dpl+GgYv5r0VEETXShk9uZ7yWSbdh+m+YdtI=; b=WKp+Io8poo4OVTTsD9DxboLQzb
	R/54OQiBLKliqEoG9IMeD3ZIohKGTK8zAvc3UkPHGWmWNQVcQYXwryilHp1jgX7V8S6GwG2/VcQb3
	X/hG+A+tib/suwCzpsTQvv75tJ8gJMvbFiDOPfOI1Xe6BeAuYbV27AtircCT8g45ybnZU/wrvX7up
	3ATZ+PaktaD/S5XuXfP0ngfw8v1fkURk4GLegIgNQeok5v9D4Wsw7mKDxjpZYnzCYajhxdJOxtlwr
	Rx5e56JMhdALgIDTqmdMTkoU7Z+EYsN15WjG2Kv8VVwayPZszWs2q5B8slW2CGKts1VDT1+KjIpRP
	CHEUeFWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkX8j-0000000DO82-0wpT;
	Tue, 27 Jan 2026 00:41:05 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkX8f-0000000DO6e-1HeU;
	Tue, 27 Jan 2026 00:41:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3FE7C60097;
	Tue, 27 Jan 2026 00:41:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A547C116C6;
	Tue, 27 Jan 2026 00:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769474459;
	bh=gyfB6CxCcjmjjILeS0ZovfjbSMTZXSuR0XjS5SBThoA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UFVT0ozS7FgYPwaFDGZ2cfWG/YY0qi0V4LPQU40c0jX9fImWwrtpWlxdnt49l6rRY
	 IfaHAQPPFc2RZ3JGvCuM6tTpBHcmYxktxedE/mHEKiddEqF+eze1T163nqc3edvZr9
	 tLFBLabXkQx/jpHgkNRSyWj5bNQCdae0z82Fe82+jD/f2IAHUA316GeuWuXskcT1Ka
	 Uog7VArapPEvIuXcXCR2XDRq+qr9Jeo30IMKCFiMSveEG4V5hM3ORrzG3GYjYOomrC
	 tq7dKlnF8YodLJXlXUGc0LR18mW/bZZqglo4aEp9xO68iBwamtVrN1jdqfTM92wHjT
	 L5XbbISIqMQbw==
From: Jakub Kicinski <kuba@kernel.org>
To: rmk+kernel@armlinux.org.uk
Cc: Jakub Kicinski <kuba@kernel.org>,
	linux-stm32@st-md-mailman.stormreply.com,
	andrew+netdev@lunn.ch,
	linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org,
	pabeni@redhat.com,
	linux-rockchip@lists.infradead.org,
	heiko@sntech.de,
	alexandre.torgue@foss.st.com,
	andrew@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com
Subject: Re: [net-next,v2,07/22] net: stmmac: rk: convert to mask-based interface mode configuration
Date: Mon, 26 Jan 2026 16:40:57 -0800
Message-ID: <20260127004057.3785761-1-kuba@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <E1vkL2D-00000005uso-3W6y@rmk-PC.armlinux.org.uk>
References: <E1vkL2D-00000005uso-3W6y@rmk-PC.armlinux.org.uk>
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

This commit consolidates PHY interface mode configuration into common
infrastructure by introducing mask fields for phy_intf_sel and rmii_mode,
moving the register writes from SoC-specific functions into the common
rk_gmac_powerup() function.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> index 4117f6863ff0..35836ffdfc1d 100644

[ ... ]

> @@ -1654,7 +1685,9 @@ static int rk_gmac_check_ops(struct rk_priv_data *bsp_priv)
>  static int rk_gmac_powerup(struct rk_priv_data *bsp_priv)
>  {
>  	struct device *dev = bsp_priv->dev;
> +	u32 val;
>  	int ret;
> +	u8 intf;
>
>  	ret = rk_gmac_check_ops(bsp_priv);
>  	if (ret)
> @@ -1664,6 +1697,26 @@ static int rk_gmac_powerup(struct rk_priv_data *bsp_priv)
>  	if (ret)
>  		return ret;
>
> +	ret = rk_get_phy_intf_sel(bsp_priv->phy_iface);
> +	if (ret < 0)
> +		return ret;

Should this error path call gmac_clk_enable(bsp_priv, false) before
returning? The clocks were enabled just above, and the existing error
handling for rk_phy_powerup() later in this function disables the
clocks on failure:

    ret = rk_phy_powerup(bsp_priv);
    if (ret) {
        gmac_clk_enable(bsp_priv, false);
        return ret;
    }

> +
> +	intf = ret;
> +
> +	if (bsp_priv->gmac_phy_intf_sel_mask ||
> +	    bsp_priv->gmac_rmii_mode_mask) {
> +		/* If defined, encode the phy_intf_sel value */
> +		val = rk_encode_wm16(intf, bsp_priv->gmac_phy_intf_sel_mask);
> +
> +		/* If defined, encode the RMII mode mask setting. */
> +		val |= rk_encode_wm16(intf == PHY_INTF_SEL_RMII,
> +				      bsp_priv->gmac_rmii_mode_mask);
> +
> +		ret = regmap_write(bsp_priv->grf, bsp_priv->gmac_grf_reg, val);
> +		if (ret < 0)
> +			return ret;

Same question here - should this also disable clocks before returning?

> +	}

