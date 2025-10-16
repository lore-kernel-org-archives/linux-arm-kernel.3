Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FA13CCD183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 07:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ON2SCtQiP5UISY9OlG9TMamQzrttCF5L3Gqd7rBZXq4=; b=M0t8eOTYkQk7X1o1F8naIVvgx4
	lUvDFrAPaZH3WCZwMuVHa2D3GB0+2RG+eeoEfNdr2kOeRRnKwV/0F3MgPGBU94YgBon14Gzi3u1qa
	XqhlWMdMJzN3WPuHKKXhgQmuW6AHrSQHeLCUlR8R3wmTpIQ5Fye82QvVYJ1X92khYKoBYeEbVvYvn
	WWt90xuLAdfWpOx5ltovgadS0J9+7aCqc2HBjsKKziaywuVvYc4t7c0/CIjgI0myW+N9HrvmUnhvp
	QxL2bVXu9X7YYSb0/VPMV9h6Q57hyGfJnVOvrj4YJAcdEV4qYO0HuB2amnUfTk33Aah5MK9ODwT0h
	z9vYFZIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9I4H-00000003iYO-0zpK;
	Thu, 16 Oct 2025 07:06:33 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9I4F-00000003iXk-0B9D
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Oct 2025 07:06:32 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 4540C4E410F1;
	Thu, 16 Oct 2025 07:06:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 010036062C;
	Thu, 16 Oct 2025 07:06:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E3250102F229A;
	Thu, 16 Oct 2025 09:06:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760598388; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=ON2SCtQiP5UISY9OlG9TMamQzrttCF5L3Gqd7rBZXq4=;
	b=SnN1ms9YDbQxlYIHv0+nQCh4k1vRIopL+ldN2EOvNg/qox1nb7+h8HSS1A/qQJGk9/ygQ7
	VIAM1M9BjOm2tYnGe82+HmTAOnsecvqmvkOFC5Fm0VNbUXMiyN4nWH6DDCi2FlqsKZIlIF
	4JCentfpIvDeohQY5cW0gn3jTanCLLpXXCtJfdwiFNecEdnkxv8bxHH86d6NymNsjSuGJN
	hXlrRr9j6NGkSTkJiB0ORYAYGE9jWqEjGbFRHd4WW9OTM45GDe9JdihKqo6GfEIHU4wJPC
	y+gyzNJVoABux5QGy8DNSTHGrJWsVwFact7d9h6WsDkIODhNEErsjM5Oigp+Vg==
Message-ID: <ae07b0b6-f5d2-416d-b861-412888fda229@bootlin.com>
Date: Thu, 16 Oct 2025 09:06:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 2/5] net: stmmac: place .mac_finish() method more
 appropriately
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>
References: <aO_HIwT_YvxkDS8D@shell.armlinux.org.uk>
 <E1v945O-0000000AmeP-1k0t@rmk-PC.armlinux.org.uk>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <E1v945O-0000000AmeP-1k0t@rmk-PC.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_000631_217714_55CAE749 
X-CRM114-Status: GOOD (  15.07  )
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



On 15/10/2025 18:10, Russell King (Oracle) wrote:
> Place the .mac_finish() initialiser and implementation after the
> .mac_config() initialiser and method which reflects the order that
> they appear in struct phylink_mac_ops, and the order in which they
> are called. This keeps logically similar code together.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

> ---
>  .../net/ethernet/stmicro/stmmac/stmmac_main.c | 26 +++++++++----------
>  1 file changed, 13 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 650d75b73e0b..3728afa701c6 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -859,6 +859,18 @@ static void stmmac_mac_config(struct phylink_config *config, unsigned int mode,
>  	/* Nothing to do, xpcs_config() handles everything */
>  }
>  
> +static int stmmac_mac_finish(struct phylink_config *config, unsigned int mode,
> +			     phy_interface_t interface)
> +{
> +	struct net_device *ndev = to_net_dev(config->dev);
> +	struct stmmac_priv *priv = netdev_priv(ndev);
> +
> +	if (priv->plat->mac_finish)
> +		priv->plat->mac_finish(ndev, priv->plat->bsp_priv, mode, interface);
> +
> +	return 0;
> +}
> +
>  static void stmmac_mac_link_down(struct phylink_config *config,
>  				 unsigned int mode, phy_interface_t interface)
>  {
> @@ -1053,27 +1065,15 @@ static int stmmac_mac_enable_tx_lpi(struct phylink_config *config, u32 timer,
>  	return 0;
>  }
>  
> -static int stmmac_mac_finish(struct phylink_config *config, unsigned int mode,
> -			     phy_interface_t interface)
> -{
> -	struct net_device *ndev = to_net_dev(config->dev);
> -	struct stmmac_priv *priv = netdev_priv(ndev);
> -
> -	if (priv->plat->mac_finish)
> -		priv->plat->mac_finish(ndev, priv->plat->bsp_priv, mode, interface);
> -
> -	return 0;
> -}
> -
>  static const struct phylink_mac_ops stmmac_phylink_mac_ops = {
>  	.mac_get_caps = stmmac_mac_get_caps,
>  	.mac_select_pcs = stmmac_mac_select_pcs,
>  	.mac_config = stmmac_mac_config,
> +	.mac_finish = stmmac_mac_finish,
>  	.mac_link_down = stmmac_mac_link_down,
>  	.mac_link_up = stmmac_mac_link_up,
>  	.mac_disable_tx_lpi = stmmac_mac_disable_tx_lpi,
>  	.mac_enable_tx_lpi = stmmac_mac_enable_tx_lpi,
> -	.mac_finish = stmmac_mac_finish,
>  };
>  
>  /**


