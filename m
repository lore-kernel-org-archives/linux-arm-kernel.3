Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA526C369B4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Apr 2025 18:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KvrP4YX9S88PE5IGWj9XQEJrki5oMuCrrMt/Wwr1Hxw=; b=ClQPqfAKpnF0UbBc0LTuajAbJF
	zCa0MOsgaIx/fPo4Cr6BlyBbGlUlm+M3mn0PBYKgfSqeAWseZfUJM/QMUKJjnGoVAfTjWXdCFqETY
	UsnWZMnw30KVwxR+13akdYhElzpnj4Ti3WZ4yXOD10CVoRsSNwpUVLtKrMc8sz2IFM3zABIxI47uU
	UrljM0OS6VJBPWsrWFWW/ooMJJKl8ucsyRQ/EvoIWYXQGcTFzwyVWEqDVFy8oP5xhWG/QVZQH2td6
	kuhSVedp2hpICQoIZuFd6+kZmJ5Yn+RH9dVgDjfT6OAkF34DYd7Wv9TcLr7zP7EEtFCga0MSdBsPU
	MVwrxziw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4Ode-000000037e1-0zyS;
	Mon, 14 Apr 2025 18:34:34 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4OZd-000000036Sw-36MW;
	Mon, 14 Apr 2025 18:30:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=KvrP4YX9S88PE5IGWj9XQEJrki5oMuCrrMt/Wwr1Hxw=; b=F0+Mk7aBUK+0Qn8yr3+0zXWTV4
	Y6tEaB+VVFzxQ5xMlEqWLRg99PhfBRfcefiA++Hi/koQtHGy5Xe2qzxrpHUFoy/+55OKQufU3Yin5
	XPnHk7xWytSkie8IVd5hishRde0WcEpsneqeOJ/tD8dy/tTdSo9EGks8j9H4F/YkGs6s=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1u4OZI-009FcJ-GO; Mon, 14 Apr 2025 20:30:04 +0200
Date: Mon, 14 Apr 2025 20:30:04 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Bo-Cun Chen <bc-bocun.chen@mediatek.com>, Felix Fietkau <nbd@nbd.name>,
	Sean Wang <sean.wang@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Florian Fainelli <f.fainelli@gmail.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net 1/5] net: ethernet: mtk_eth_soc: revise mdc divider
 configuration
Message-ID: <6c36505c-7af3-49f5-9141-8a655f90a2f9@lunn.ch>
References: <08498e31e830cf0ee1ceb4fc1313d5c528a69150.1744654076.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <08498e31e830cf0ee1ceb4fc1313d5c528a69150.1744654076.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_113025_776245_E89D0F3E 
X-CRM114-Status: GOOD (  24.77  )
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

On Mon, Apr 14, 2025 at 07:11:20PM +0100, Daniel Golle wrote:
> From: Bo-Cun Chen <bc-bocun.chen@mediatek.com>
> 
> In the current method, the MDC divider was reset to the default setting
> of 2.5MHz after the NETSYS SER. Therefore, we need to move the MDC
> divider configuration function to mtk_hw_init().
> 
> Fixes: c0a440031d431 ("net: ethernet: mtk_eth_soc: set MDIO bus clock frequency")
> Signed-off-by: Bo-Cun Chen <bc-bocun.chen@mediatek.com>
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
>  drivers/net/ethernet/mediatek/mtk_eth_soc.c | 60 ++++++++++++++-------
>  1 file changed, 42 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> index 43197b28b3e74..fd643cc1b7dd2 100644
> --- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> +++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> @@ -871,11 +871,11 @@ static const struct phylink_mac_ops mtk_phylink_ops = {
>  	.mac_enable_tx_lpi = mtk_mac_enable_tx_lpi,
>  };
>  
> -static int mtk_mdio_init(struct mtk_eth *eth)
> +static int mtk_mdio_config(struct mtk_eth *eth)
>  {
>  	unsigned int max_clk = 2500000, divider;
>  	struct device_node *mii_np;
> -	int ret;
> +	int ret = 0;
>  	u32 val;
>  
>  	mii_np = of_get_available_child_by_name(eth->dev->of_node, "mdio-bus");
> @@ -884,22 +884,6 @@ static int mtk_mdio_init(struct mtk_eth *eth)
>  		return -ENODEV;
>  	}
>  
> -	eth->mii_bus = devm_mdiobus_alloc(eth->dev);
> -	if (!eth->mii_bus) {
> -		ret = -ENOMEM;
> -		goto err_put_node;
> -	}
> -
> -	eth->mii_bus->name = "mdio";
> -	eth->mii_bus->read = mtk_mdio_read_c22;
> -	eth->mii_bus->write = mtk_mdio_write_c22;
> -	eth->mii_bus->read_c45 = mtk_mdio_read_c45;
> -	eth->mii_bus->write_c45 = mtk_mdio_write_c45;
> -	eth->mii_bus->priv = eth;
> -	eth->mii_bus->parent = eth->dev;
> -
> -	snprintf(eth->mii_bus->id, MII_BUS_ID_SIZE, "%pOFn", mii_np);
> -
>  	if (!of_property_read_u32(mii_np, "clock-frequency", &val)) {
>  		if (val > MDC_MAX_FREQ || val < MDC_MAX_FREQ / MDC_MAX_DIVIDER) {
>  			dev_err(eth->dev, "MDIO clock frequency out of range");
> @@ -922,6 +906,42 @@ static int mtk_mdio_init(struct mtk_eth *eth)
>  
>  	dev_dbg(eth->dev, "MDC is running on %d Hz\n", MDC_MAX_FREQ / divider);
>  
> +err_put_node:
> +	of_node_put(mii_np);
> +	return ret;
> +}
> +
> +static int mtk_mdio_init(struct mtk_eth *eth)
> +{
> +	struct device_node *mii_np;
> +	int ret;
> +
> +	mii_np = of_get_child_by_name(eth->dev->of_node, "mdio-bus");
> +	if (!mii_np) {
> +		dev_err(eth->dev, "no %s child node found", "mdio-bus");
> +		return -ENODEV;
> +	}
> +
> +	if (!of_device_is_available(mii_np)) {
> +		ret = -ENODEV;
> +		goto err_put_node;
> +	}

It seems like you end up doing these checks twice. In theory it might
change between the calls, but it is very unlikely? Maybe just keep
node reference returned by of_get_child_by_name() and release it in
mtk_mdio_cleanup()?

Or calculate the divider in mtk_mdio_init() as is, but store it away
in struct mtk_eth, so you don't need to redo all the DT parsing?

	Andrew

