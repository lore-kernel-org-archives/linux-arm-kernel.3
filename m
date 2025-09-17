Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9C35CAC598
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 07:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NhHhY/MyxZbQZX97oQCZQcUd67x7P22WDY8sUquQru4=; b=3Te6T8fK3Rr6HvgdcfWHd+DZnz
	Lo6Spd5QnitIs1bsIPPl5oSvtZ5UbIErKxRsOIA1PfUce3mkBi789PMBI2QfBiUoiQ10Mtf7YXOaW
	7HFPViYa+oGV3kJmGxVslC6VjcgGsFhRhP0IF+7oj0KOFXj2nlZFoc5CXWF07lcIcfvwKcBWUfsqz
	8l3n1Mt73kZajJb5oluD0VzxYjGC9XQPSspBPJq6k9HaWICDBnUCrSv7iovuN5hZFm+ZJcF9uMsU2
	8GhuY4WitaV/jbMZaFxknpRHh3cfAOX51FQt71hmkFJIFcNvyDb1kFSv60zOkmAkIKDEDN7FOJXSX
	tgDVP+ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uymT2-0000000ARct-2WMd;
	Wed, 17 Sep 2025 07:20:40 +0000
Received: from pegase2.c-s.fr ([93.17.235.10])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uymSz-0000000ARcU-40Qs
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 07:20:39 +0000
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4cRV6547rDz9sxj;
	Wed, 17 Sep 2025 09:00:45 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0jycUt0D3HEs; Wed, 17 Sep 2025 09:00:45 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4cRV652Pthz9sxg;
	Wed, 17 Sep 2025 09:00:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 24D818B766;
	Wed, 17 Sep 2025 09:00:45 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id X30wXOSaiMnX; Wed, 17 Sep 2025 09:00:45 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id BAB618B763;
	Wed, 17 Sep 2025 09:00:43 +0200 (CEST)
Message-ID: <4b67331e-823e-4fac-9af7-35c11f996ae5@csgroup.eu>
Date: Wed, 17 Sep 2025 09:00:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v12 08/18] net: phylink: Move
 phylink_interface_max_speed to phy_caps
To: Maxime Chevallier <maxime.chevallier@bootlin.com>, davem@davemloft.net
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, thomas.petazzoni@bootlin.com,
 Andrew Lunn <andrew@lunn.ch>, Jakub Kicinski <kuba@kernel.org>,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
 Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org,
 Herve Codina <herve.codina@bootlin.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 =?UTF-8?Q?K=C3=B6ry_Maincent?= <kory.maincent@bootlin.com>,
 =?UTF-8?Q?Marek_Beh=C3=BAn?= <kabel@kernel.org>,
 Oleksij Rempel <o.rempel@pengutronix.de>,
 =?UTF-8?Q?Nicol=C3=B2_Veronese?= <nicveronese@gmail.com>,
 Simon Horman <horms@kernel.org>, mwojtas@chromium.org,
 Antoine Tenart <atenart@kernel.org>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 Romain Gantois <romain.gantois@bootlin.com>,
 Daniel Golle <daniel@makrotopia.org>,
 Dimitri Fedrau <dimitri.fedrau@liebherr.com>
References: <20250909152617.119554-1-maxime.chevallier@bootlin.com>
 <20250909152617.119554-9-maxime.chevallier@bootlin.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <20250909152617.119554-9-maxime.chevallier@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_002038_164629_C6EF46B3 
X-CRM114-Status: GOOD (  20.06  )
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



Le 09/09/2025 à 17:26, Maxime Chevallier a écrit :
> The phylink_interface_max_speed() retrieves the max achievable speed
> on a MII interface. This logic needs to be re-used in other parts of the
> PHY stack, let's move it to phy_caps as it already contains most of the
> interface attribute accessors.
> 
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>

> ---
>   drivers/net/phy/phy-caps.h |  1 +
>   drivers/net/phy/phy_caps.c | 80 +++++++++++++++++++++++++++++++++++
>   drivers/net/phy/phylink.c  | 87 ++------------------------------------
>   3 files changed, 85 insertions(+), 83 deletions(-)
> 
> diff --git a/drivers/net/phy/phy-caps.h b/drivers/net/phy/phy-caps.h
> index 01df1bdc1516..ba81cd75e122 100644
> --- a/drivers/net/phy/phy-caps.h
> +++ b/drivers/net/phy/phy-caps.h
> @@ -49,6 +49,7 @@ void phy_caps_linkmode_max_speed(u32 max_speed, unsigned long *linkmodes);
>   bool phy_caps_valid(int speed, int duplex, const unsigned long *linkmodes);
>   void phy_caps_linkmodes(unsigned long caps, unsigned long *linkmodes);
>   unsigned long phy_caps_from_interface(phy_interface_t interface);
> +int phy_caps_interface_max_speed(phy_interface_t interface);
>   
>   const struct link_capabilities *
>   phy_caps_lookup_by_linkmode(const unsigned long *linkmodes);
> diff --git a/drivers/net/phy/phy_caps.c b/drivers/net/phy/phy_caps.c
> index e4efd5c477b4..b38c567ec6ef 100644
> --- a/drivers/net/phy/phy_caps.c
> +++ b/drivers/net/phy/phy_caps.c
> @@ -440,3 +440,83 @@ u32 phy_caps_mediums_from_linkmodes(unsigned long *linkmodes)
>   	return mediums;
>   }
>   EXPORT_SYMBOL_GPL(phy_caps_mediums_from_linkmodes);
> +
> +/**
> + * phy_caps_interface_max_speed() - get the maximum speed of a phy interface
> + * @interface: phy interface mode defined by &typedef phy_interface_t
> + *
> + * Determine the maximum speed of a phy interface. This is intended to help
> + * determine the correct speed to pass to the MAC when the phy is performing
> + * rate matching.
> + *
> + * Return: The maximum speed of @interface
> + */
> +int phy_caps_interface_max_speed(phy_interface_t interface)
> +{
> +	switch (interface) {
> +	case PHY_INTERFACE_MODE_100BASEX:
> +	case PHY_INTERFACE_MODE_REVRMII:
> +	case PHY_INTERFACE_MODE_RMII:
> +	case PHY_INTERFACE_MODE_SMII:
> +	case PHY_INTERFACE_MODE_REVMII:
> +	case PHY_INTERFACE_MODE_MII:
> +	case PHY_INTERFACE_MODE_MIILITE:
> +		return SPEED_100;
> +
> +	case PHY_INTERFACE_MODE_TBI:
> +	case PHY_INTERFACE_MODE_MOCA:
> +	case PHY_INTERFACE_MODE_RTBI:
> +	case PHY_INTERFACE_MODE_1000BASEX:
> +	case PHY_INTERFACE_MODE_1000BASEKX:
> +	case PHY_INTERFACE_MODE_TRGMII:
> +	case PHY_INTERFACE_MODE_RGMII_TXID:
> +	case PHY_INTERFACE_MODE_RGMII_RXID:
> +	case PHY_INTERFACE_MODE_RGMII_ID:
> +	case PHY_INTERFACE_MODE_RGMII:
> +	case PHY_INTERFACE_MODE_PSGMII:
> +	case PHY_INTERFACE_MODE_QSGMII:
> +	case PHY_INTERFACE_MODE_QUSGMII:
> +	case PHY_INTERFACE_MODE_SGMII:
> +	case PHY_INTERFACE_MODE_GMII:
> +		return SPEED_1000;
> +
> +	case PHY_INTERFACE_MODE_2500BASEX:
> +	case PHY_INTERFACE_MODE_10G_QXGMII:
> +		return SPEED_2500;
> +
> +	case PHY_INTERFACE_MODE_5GBASER:
> +		return SPEED_5000;
> +
> +	case PHY_INTERFACE_MODE_XGMII:
> +	case PHY_INTERFACE_MODE_RXAUI:
> +	case PHY_INTERFACE_MODE_XAUI:
> +	case PHY_INTERFACE_MODE_10GBASER:
> +	case PHY_INTERFACE_MODE_10GKR:
> +	case PHY_INTERFACE_MODE_USXGMII:
> +		return SPEED_10000;
> +
> +	case PHY_INTERFACE_MODE_25GBASER:
> +		return SPEED_25000;
> +
> +	case PHY_INTERFACE_MODE_XLGMII:
> +		return SPEED_40000;
> +
> +	case PHY_INTERFACE_MODE_50GBASER:
> +	case PHY_INTERFACE_MODE_LAUI:
> +		return SPEED_50000;
> +
> +	case PHY_INTERFACE_MODE_100GBASEP:
> +		return SPEED_100000;
> +
> +	case PHY_INTERFACE_MODE_INTERNAL:
> +	case PHY_INTERFACE_MODE_NA:
> +	case PHY_INTERFACE_MODE_MAX:
> +		/* No idea! Garbage in, unknown out */
> +		return SPEED_UNKNOWN;
> +	}
> +
> +	/* If we get here, someone forgot to add an interface mode above */
> +	WARN_ON_ONCE(1);
> +	return SPEED_UNKNOWN;
> +}
> +EXPORT_SYMBOL_GPL(phy_caps_interface_max_speed);
> diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
> index c7cb95aa8007..091b1ee5c49a 100644
> --- a/drivers/net/phy/phylink.c
> +++ b/drivers/net/phy/phylink.c
> @@ -218,85 +218,6 @@ static unsigned int phylink_interface_signal_rate(phy_interface_t interface)
>   	}
>   }
>   
> -/**
> - * phylink_interface_max_speed() - get the maximum speed of a phy interface
> - * @interface: phy interface mode defined by &typedef phy_interface_t
> - *
> - * Determine the maximum speed of a phy interface. This is intended to help
> - * determine the correct speed to pass to the MAC when the phy is performing
> - * rate matching.
> - *
> - * Return: The maximum speed of @interface
> - */
> -static int phylink_interface_max_speed(phy_interface_t interface)
> -{
> -	switch (interface) {
> -	case PHY_INTERFACE_MODE_100BASEX:
> -	case PHY_INTERFACE_MODE_REVRMII:
> -	case PHY_INTERFACE_MODE_RMII:
> -	case PHY_INTERFACE_MODE_SMII:
> -	case PHY_INTERFACE_MODE_REVMII:
> -	case PHY_INTERFACE_MODE_MII:
> -	case PHY_INTERFACE_MODE_MIILITE:
> -		return SPEED_100;
> -
> -	case PHY_INTERFACE_MODE_TBI:
> -	case PHY_INTERFACE_MODE_MOCA:
> -	case PHY_INTERFACE_MODE_RTBI:
> -	case PHY_INTERFACE_MODE_1000BASEX:
> -	case PHY_INTERFACE_MODE_1000BASEKX:
> -	case PHY_INTERFACE_MODE_TRGMII:
> -	case PHY_INTERFACE_MODE_RGMII_TXID:
> -	case PHY_INTERFACE_MODE_RGMII_RXID:
> -	case PHY_INTERFACE_MODE_RGMII_ID:
> -	case PHY_INTERFACE_MODE_RGMII:
> -	case PHY_INTERFACE_MODE_PSGMII:
> -	case PHY_INTERFACE_MODE_QSGMII:
> -	case PHY_INTERFACE_MODE_QUSGMII:
> -	case PHY_INTERFACE_MODE_SGMII:
> -	case PHY_INTERFACE_MODE_GMII:
> -		return SPEED_1000;
> -
> -	case PHY_INTERFACE_MODE_2500BASEX:
> -	case PHY_INTERFACE_MODE_10G_QXGMII:
> -		return SPEED_2500;
> -
> -	case PHY_INTERFACE_MODE_5GBASER:
> -		return SPEED_5000;
> -
> -	case PHY_INTERFACE_MODE_XGMII:
> -	case PHY_INTERFACE_MODE_RXAUI:
> -	case PHY_INTERFACE_MODE_XAUI:
> -	case PHY_INTERFACE_MODE_10GBASER:
> -	case PHY_INTERFACE_MODE_10GKR:
> -	case PHY_INTERFACE_MODE_USXGMII:
> -		return SPEED_10000;
> -
> -	case PHY_INTERFACE_MODE_25GBASER:
> -		return SPEED_25000;
> -
> -	case PHY_INTERFACE_MODE_XLGMII:
> -		return SPEED_40000;
> -
> -	case PHY_INTERFACE_MODE_50GBASER:
> -	case PHY_INTERFACE_MODE_LAUI:
> -		return SPEED_50000;
> -
> -	case PHY_INTERFACE_MODE_100GBASEP:
> -		return SPEED_100000;
> -
> -	case PHY_INTERFACE_MODE_INTERNAL:
> -	case PHY_INTERFACE_MODE_NA:
> -	case PHY_INTERFACE_MODE_MAX:
> -		/* No idea! Garbage in, unknown out */
> -		return SPEED_UNKNOWN;
> -	}
> -
> -	/* If we get here, someone forgot to add an interface mode above */
> -	WARN_ON_ONCE(1);
> -	return SPEED_UNKNOWN;
> -}
> -
>   static struct {
>   	unsigned long mask;
>   	int speed;
> @@ -430,7 +351,7 @@ static unsigned long phylink_get_capabilities(phy_interface_t interface,
>   					      int rate_matching)
>   {
>   	unsigned long link_caps = phy_caps_from_interface(interface);
> -	int max_speed = phylink_interface_max_speed(interface);
> +	int max_speed = phy_caps_interface_max_speed(interface);
>   	unsigned long caps = MAC_SYM_PAUSE | MAC_ASYM_PAUSE;
>   	unsigned long matched_caps = 0;
>   
> @@ -1529,7 +1450,7 @@ static void phylink_link_up(struct phylink *pl,
>   		 * the link_state) to the interface speed, and will send
>   		 * pause frames to the MAC to limit its transmission speed.
>   		 */
> -		speed = phylink_interface_max_speed(link_state.interface);
> +		speed = phy_caps_interface_max_speed(link_state.interface);
>   		duplex = DUPLEX_FULL;
>   		rx_pause = true;
>   		break;
> @@ -1539,7 +1460,7 @@ static void phylink_link_up(struct phylink *pl,
>   		 * the link_state) to the interface speed, and will cause
>   		 * collisions to the MAC to limit its transmission speed.
>   		 */
> -		speed = phylink_interface_max_speed(link_state.interface);
> +		speed = phy_caps_interface_max_speed(link_state.interface);
>   		duplex = DUPLEX_HALF;
>   		break;
>   	}
> @@ -2732,7 +2653,7 @@ static phy_interface_t phylink_sfp_select_interface_speed(struct phylink *pl,
>   		if (!test_bit(interface, pl->sfp_interfaces))
>   			continue;
>   
> -		max_speed = phylink_interface_max_speed(interface);
> +		max_speed = phy_caps_interface_max_speed(interface);
>   
>   		/* The logic here is: if speed == max_speed, then we've found
>   		 * the best interface. Otherwise we find the interface that


