Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60C1DE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 13:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RUvAF8nNh95eCP+DJf/kow70CTWmtALCQZrGVyhyTco=; b=RDecpu97DIVsg3SYuUZ9THlxel
	zZX++tQr1lk/6WWCnSix4qg4K1/uTtWKpmc3LQW5mNL7Xz3HGP7pl4t2nShIgnink71HLC3oxhlF4
	Q9qrxYF5kOKgasxT4n0bpxZSEugkRQrDF0/3LpvFv90sbM9CzX4Ekwzcx6PQOtN6tu9qKp68tNDc3
	eeKG16Pe/xoLS2y9oak7zrCODWLP5scOvjQrdLujo0o/e8xxm/6J7iYQV96AaFbJuRl8XHMjmVPAx
	G+kcMsiiF34AXFr5f8jk0Cb+oC9j/r0SAN5mC9UhveQAPqOO9Yx0ygtfmDEN5+cHtBSdspYjf6Ma9
	FhnbzjFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNXVw-0000000DYQf-1lKu;
	Tue, 17 Dec 2024 13:21:28 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNXTq-0000000DXj0-3T94
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 13:19:20 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1A297C000C;
	Tue, 17 Dec 2024 13:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1734441556;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RUvAF8nNh95eCP+DJf/kow70CTWmtALCQZrGVyhyTco=;
	b=DxdZ2zbbF9lT2rC9CkWB74l9vT5Dd/ap3ZVFqQhl+iuUntR7iTeWMeBIM9cgAynMsFp1QU
	6jerE5mJBZ3SgAXJ4nh//VZbyCfDGhp5j0QBWFWWZThca7x9uOKfWL0sKzzUg/D4qEo+oo
	VHci9RDcY7P08cW97PcYF+zzjjJATwEFYpMFojaWxvKf/Y2pkLGX3w4YB6vVy6XCyCp4GY
	zcW6PTtzazInS0ktppzzY4Ui5RsjY8Un0rexPzG/pZ8PMBSiJCaI6xzVEOUj5SKz9vbTsE
	xOMfvE1igIujLiMl5NHBzAsQ5IgUIt5/xMVqkt7nITzwNsxSzPOhs/qIqrHrow==
Date: Tue, 17 Dec 2024 14:19:12 +0100
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>, Jose Abreu
 <joabreu@synopsys.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 davem@davemloft.net, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexis =?UTF-8?B?TG90aG9yw6k=?=
 <alexis.lothore@bootlin.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 5/5] net: stmmac: use PCS supported_interfaces
Message-ID: <20241217141912.34cdd5ae@fedora.home>
In-Reply-To: <E1tMBRQ-006vat-7F@rmk-PC.armlinux.org.uk>
References: <Z1yJQikqneoFNJT4@shell.armlinux.org.uk>
	<E1tMBRQ-006vat-7F@rmk-PC.armlinux.org.uk>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_051918_998442_B848DBA0 
X-CRM114-Status: GOOD (  17.27  )
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

Hi Russell,

On Fri, 13 Dec 2024 19:35:12 +0000
"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk> wrote:

> Use the PCS' supported_interfaces member to build the MAC level
> supported_interfaces bitmap.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index d45fd7a3acd5..0e45c4a48bb5 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -1206,6 +1206,7 @@ static int stmmac_phy_setup(struct stmmac_priv *priv)
>  	struct stmmac_mdio_bus_data *mdio_bus_data;
>  	int mode = priv->plat->phy_interface;
>  	struct fwnode_handle *fwnode;
> +	struct phylink_pcs *pcs;
>  	struct phylink *phylink;
>  
>  	priv->phylink_config.dev = &priv->dev->dev;
> @@ -1227,8 +1228,14 @@ static int stmmac_phy_setup(struct stmmac_priv *priv)
>  
>  	/* If we have an xpcs, it defines which PHY interfaces are supported. */
>  	if (priv->hw->xpcs)
> -		xpcs_get_interfaces(priv->hw->xpcs,
> -				    priv->phylink_config.supported_interfaces);
> +		pcs = xpcs_to_phylink_pcs(priv->hw->xpcs);
> +	else
> +		pcs = priv->hw->phylink_pcs;
> +
> +	if (pcs)
> +		phy_interface_or(priv->phylink_config.supported_interfaces,
> +				 priv->phylink_config.supported_interfaces,
> +				 pcs->supported_interfaces);
>  
>  	fwnode = priv->plat->port_node;
>  	if (!fwnode)

I think that we could even make xpcs_get_interfaces a static
non-exported function now :) But this can be done in a subsequent patch.

Thanks for that work !

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime

