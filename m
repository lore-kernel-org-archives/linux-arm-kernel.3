Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5672AC19F2E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 13:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z2VNcrufiCKj7eFAmSfO6YQZUc/4GuUjSOvR4L9XN8o=; b=FUm0xRlcUNlocm4Y6sHudkeMoY
	Xvw28oWArBOaanWWiMR0jxIQMjBQUg6v23JELF8eEaDvawZA3t9z1/DDx9QPYVLOmuXK9IJ74zeX0
	Rd/NE183Ex8ZMNkPxzlkX6Jvz1v+hvlpGabgxR8sFxB6Kx3+I5EVUrk5hK+7DFd5nUGi5+OWh8hRW
	cb/rD1L22wBu3GOg0QHsfSK/TVdkvQ5sQ8WCORBQuQm2/XrvOGGqDOu006f9iWh7129OmNp+mh3MS
	ldAqdIWQpHyqJ7EgkhIOVc/1DYOq+eY5QeV7XN0I7B+qBwXqlCl2VANuk6l40kIx6/BlLrBa6bnfU
	3Cy26t4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tneOk-00000007cUE-17xY;
	Thu, 27 Feb 2025 13:57:58 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tneF3-00000007av5-0Gac;
	Thu, 27 Feb 2025 13:47:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=z2VNcrufiCKj7eFAmSfO6YQZUc/4GuUjSOvR4L9XN8o=; b=VjM/TY+MXccsyzI6ksj8zDo9In
	yFoyfRsMmdidwKCGMPw1blkR3xTStw1bxHGpgycjtHDOsEnqExtNS3RQIudklQ8ucmhjj/B4S1SWP
	XZsbM1ax1tchMRmjs0fXdGMprPgX+3Ab2pssCBqoQkjazkJQI0GjsRlxtyc69Y/C4pOw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tneEx-000bcT-JT; Thu, 27 Feb 2025 14:47:51 +0100
Date: Thu, 27 Feb 2025 14:47:51 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Kever Yang <kever.yang@rock-chips.com>
Cc: heiko@sntech.de, linux-rockchip@lists.infradead.org,
	David Wu <david.wu@rock-chips.com>,
	linux-arm-kernel@lists.infradead.org,
	"Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>,
	netdev@vger.kernel.org,
	Detlev Casanova <detlev.casanova@collabora.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-kernel@vger.kernel.org,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH v2 2/3] ethernet: stmmac: dwmac-rk: Add gmac support for
 rk3562
Message-ID: <f7146c95-85dd-4e5f-99b4-83a5d1b6fbd1@lunn.ch>
References: <20250227110652.2342729-1-kever.yang@rock-chips.com>
 <20250227110652.2342729-2-kever.yang@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250227110652.2342729-2-kever.yang@rock-chips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_054757_105072_CC83A4E0 
X-CRM114-Status: GOOD (  23.17  )
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

On Thu, Feb 27, 2025 at 07:06:51PM +0800, Kever Yang wrote:
> From: David Wu <david.wu@rock-chips.com>
> 
> Add constants and callback functions for the dwmac on RK3562 soc.
> As can be seen, the base structure is the same.
> 
> Signed-off-by: David Wu <david.wu@rock-chips.com>
> Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> ---
> 
> Changes in v2:
> - Collect review tag
> 
>  .../net/ethernet/stmicro/stmmac/dwmac-rk.c    | 207 +++++++++++++++++-
>  1 file changed, 205 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> index a4dc89e23a68..ccf4ecdffad3 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> @@ -2,8 +2,7 @@
>  /**
>   * DOC: dwmac-rk.c - Rockchip RK3288 DWMAC specific glue layer
>   *
> - * Copyright (C) 2014 Chen-Zhi (Roger Chen)
> - *
> + * Copyright (c) 2014 Rockchip Electronics Co., Ltd.
>   * Chen-Zhi (Roger Chen)  <roger.chen@rock-chips.com>
>   */

IANAL, but generally, you add additional copyright notices, not
replace them.

> +#define DELAY_VALUE(soc, tx, rx) \
> +	((((tx) >= 0) ? soc##_GMAC_CLK_TX_DL_CFG(tx) : 0) | \
> +	 (((rx) >= 0) ? soc##_GMAC_CLK_RX_DL_CFG(rx) : 0))
> +
> +#define GMAC_RGMII_CLK_DIV_BY_ID(soc, id, div) \
> +		(soc##_GMAC##id##_CLK_RGMII_DIV##div)
> +
> +#define GMAC_RMII_CLK_DIV_BY_ID(soc, id, div) \
> +		(soc##_GMAC##id##_CLK_RMII_DIV##div)
> +

This macro magic is pretty unreadable. Please consider another way to
do this. Some wise developer once said, code is written once, read 100
times. So please make code readable by default, unless it is hot path.

> +static void rk3562_set_gmac_speed(struct rk_priv_data *bsp_priv, int speed)
> +{
> +	struct device *dev = &bsp_priv->pdev->dev;
> +	unsigned int val = 0, offset, id = bsp_priv->id;
> +
> +	switch (speed) {
> +	case 10:
> +		if (bsp_priv->phy_iface == PHY_INTERFACE_MODE_RMII) {
> +			if (id > 0) {
> +				val = GMAC_RMII_CLK_DIV_BY_ID(RK3562, 1, 20);
> +				regmap_write(bsp_priv->grf, RK3562_GRF_SYS_SOC_CON0,
> +					     RK3562_GMAC1_RMII_SPEED10);
> +			} else {
> +				val = GMAC_RMII_CLK_DIV_BY_ID(RK3562, 0, 20);
> +			}
> +		} else {
> +			val = GMAC_RGMII_CLK_DIV_BY_ID(RK3562, 0, 50);
> +		}
> +		break;

It seems like this function would be a lot more readable if it was
split into two, one dealing with RMII and another with RGMII.

> +static void rk3562_set_clock_selection(struct rk_priv_data *bsp_priv, bool input,
> +				       bool enable)
> +{
> +	struct device *dev = &bsp_priv->pdev->dev;
> +	unsigned int value;
> +
> +	if (IS_ERR(bsp_priv->grf) || IS_ERR(bsp_priv->php_grf)) {
> +		dev_err(dev, "Missing rockchip,grf or rockchip,php_grf property\n");
> +		return;
> +	}

That should of been checked much earlier, at probe.

	Andrew

