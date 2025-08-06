Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFE4BC87FD3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Aug 2025 03:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oJH5KNGSYO4/UiYFErjzDJ3fGQHDSZzhyyZv4ILcihA=; b=ST3YoZj38dmIV/of+KKEtGea+u
	LfXvE4W3S2oZXOGG2yse8RSSNq5zfrvSPTVvSFaRcyOke2zXwzya/tLB9FRiwyOQeBYtC3CVKgz8Y
	4LjV1zJ3+DtG3NlKlP1HQgOEmWCab6frGmpYfmFni/6B2LERm/FiMKzR8cOlkqNqaGSlBWvFxpBih
	dtOkVmyGWfsalvArgiSOeDGVZ8+PoCWgLOoVZdDcUObFem9A9USKfNmvQNVDP/Pp/joqqqKCH2o5V
	QOOQYaOX7RPntTT73n28DHoRuIBHzqniKHGY+VPLXLXHIjNDcEKEFYl4CZviBWfgR++DnGW6a6ATQ
	LORWMx4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujUf8-0000000EDyZ-2Xmb;
	Wed, 06 Aug 2025 03:17:58 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujUcW-0000000EDn3-2Tmt;
	Wed, 06 Aug 2025 03:15:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=oJH5KNGSYO4/UiYFErjzDJ3fGQHDSZzhyyZv4ILcihA=; b=ygHclmUzWU8YQkMYad2J6FVTlp
	rUSjmHiKNbUM3zFdh2+Cr9HummLeuNCQeaMp54HaQLsBKPxPNYl8OB31xcn4Rs8dfWGiQnmQWJyLW
	SDVh7XiHYTklCXvRZTXoEZM6QYcghtI1jXvF5e3dmNc79c3zpvvUGqGSTt9B8AJa2PnY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1ujUcD-003quH-UA; Wed, 06 Aug 2025 05:14:57 +0200
Date: Wed, 6 Aug 2025 05:14:57 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Chaoyi Chen <kernel@airkyi.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Jonas Karlman <jonas@kwiboo.se>, David Wu <david.wu@rock-chips.com>,
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>
Subject: Re: [PATCH] net: ethernet: stmmac: dwmac-rk: Make the clk_phy could
 be used for external phy
Message-ID: <3c401e82-169f-4540-9c12-175798ac72a6@lunn.ch>
References: <20250806011405.115-1-kernel@airkyi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250806011405.115-1-kernel@airkyi.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_201516_634372_84DD43B0 
X-CRM114-Status: GOOD (  22.53  )
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

On Wed, Aug 06, 2025 at 09:14:05AM +0800, Chaoyi Chen wrote:
> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> 
> For external phy, clk_phy should be optional, and some external phy
> need the clock input from clk_phy. This patch adds support for setting
> clk_phy for external phy.
> 
> Signed-off-by: David Wu <david.wu@rock-chips.com>
> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>

Please take a read of:

https://www.kernel.org/doc/html/latest/process/maintainer-netdev.html

net-next is closed at the moment for the merge window.

You also need the indicate the tree in the Subject: line.

> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c | 16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> index 700858ff6f7c..703b4b24f3bc 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> @@ -1558,6 +1558,7 @@ static int rk_gmac_clk_init(struct plat_stmmacenet_data *plat)
>  	struct device *dev = &bsp_priv->pdev->dev;
>  	int phy_iface = bsp_priv->phy_iface;
>  	int i, j, ret;
> +	unsigned int rate;

Reverse Christmas tree. Longest to shortest.

>  
>  	bsp_priv->clk_enabled = false;
>  
> @@ -1595,12 +1596,19 @@ static int rk_gmac_clk_init(struct plat_stmmacenet_data *plat)
>  		clk_set_rate(bsp_priv->clk_mac, 50000000);
>  	}
>  
> -	if (plat->phy_node && bsp_priv->integrated_phy) {
> +	if (plat->phy_node) {
>  		bsp_priv->clk_phy = of_clk_get(plat->phy_node, 0);
>  		ret = PTR_ERR_OR_ZERO(bsp_priv->clk_phy);
> -		if (ret)
> -			return dev_err_probe(dev, ret, "Cannot get PHY clock\n");
> -		clk_set_rate(bsp_priv->clk_phy, 50000000);
> +		/* If it is not integrated_phy, clk_phy is optional */
> +		if (bsp_priv->integrated_phy) {
> +			if (ret)
> +				return dev_err_probe(dev, ret, "Cannot get PHY clock\n");
> +
> +			ret = of_property_read_u32(plat->phy_node, "clock-frequency", &rate);

Is this property already in the DT binding?


    Andrew

---
pw-bot: cr

