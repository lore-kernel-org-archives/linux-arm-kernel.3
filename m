Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB343CAC598
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 07:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KAS3QdVVCCgaQxjiMlbHXFVxSYaOoTQLoQ6z4Dm/+s0=; b=WyNcipLjULiDV+JSD/1Vi1zhkg
	b4coaBXrwtrb8XnQqqVF4ICO5OUolx1U3UouMnZ2fJZMDir1HUohF+pSvm6nffA9BpOLmcDbobnEz
	WzIzl7QSGYhepgGYXHYGPeasVg0mKrSZCM4xHhSQosrs4figrD2e+mBjUl38yDhXIowHl34MqcqBY
	25oTqO11Kjb/fVPzJNvJxnwmr0Yv8XjvVaryq0CRkiQT2u2jXRXNaEXjQ6DhApF6dG6dKZBr2WFDK
	Z9QqwyOV/BkLeEitbaYVOTCcfM4iRCvFokHXTNzfSCZ9cWyE+JMC6gr1m6jBzZZ6UVjBOwQWw2Ly1
	xwmQlG5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uymTn-0000000ARy8-2wME;
	Wed, 17 Sep 2025 07:21:27 +0000
Received: from pegase2.c-s.fr ([93.17.235.10])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uymTl-0000000ARwX-0NK3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 07:21:26 +0000
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4cRV8432kWz9sxs;
	Wed, 17 Sep 2025 09:02:28 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ugnVxOawaGAL; Wed, 17 Sep 2025 09:02:28 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4cRV841GBsz9sxr;
	Wed, 17 Sep 2025 09:02:28 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id E4D118B766;
	Wed, 17 Sep 2025 09:02:27 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id iQpCl6uKh8LN; Wed, 17 Sep 2025 09:02:27 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 8455C8B763;
	Wed, 17 Sep 2025 09:02:26 +0200 (CEST)
Message-ID: <40b2d005-47cc-46c9-a698-9d41d748fb58@csgroup.eu>
Date: Wed, 17 Sep 2025 09:02:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v12 13/18] net: phy: marvell10g: Support SFP
 through phy_port
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
 <20250909152617.119554-14-maxime.chevallier@bootlin.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <20250909152617.119554-14-maxime.chevallier@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_002125_337442_6F300985 
X-CRM114-Status: GOOD (  27.55  )
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
> Convert the Marvell10G driver to use the generic SFP handling, through a
> dedicated .attach_port() handler to populate the port's supported
> interfaces.
> 
> As the 88x3310 supports multiple MDI, the .attach_port() logic handles
> both SFP attach with 10GBaseR support, and support for the "regular"
> port that usually is a BaseT port.
> 
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>

> ---
>   drivers/net/phy/marvell10g.c | 54 ++++++++++++++++++++++--------------
>   drivers/net/phy/phy_port.c   | 44 +++++++++++++++++++++++++++++
>   include/linux/phy_port.h     |  1 +
>   3 files changed, 78 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/net/phy/marvell10g.c b/drivers/net/phy/marvell10g.c
> index 13e81dff42c1..833ea0c0dc22 100644
> --- a/drivers/net/phy/marvell10g.c
> +++ b/drivers/net/phy/marvell10g.c
> @@ -28,7 +28,7 @@
>   #include <linux/hwmon.h>
>   #include <linux/marvell_phy.h>
>   #include <linux/phy.h>
> -#include <linux/sfp.h>
> +#include <linux/phy_port.h>
>   #include <linux/netdevice.h>
>   
>   #define MV_PHY_ALASKA_NBT_QUIRK_MASK	0xfffffffe
> @@ -463,36 +463,36 @@ static int mv3310_set_edpd(struct phy_device *phydev, u16 edpd)
>   	return err;
>   }
>   
> -static int mv3310_sfp_insert(void *upstream, const struct sfp_eeprom_id *id)
> +static int mv3310_attach_mii_port(struct phy_device *phydev,
> +				  struct phy_port *port)
>   {
> -	struct phy_device *phydev = upstream;
> -	__ETHTOOL_DECLARE_LINK_MODE_MASK(support) = { 0, };
> -	DECLARE_PHY_INTERFACE_MASK(interfaces);
> -	phy_interface_t iface;
> -
> -	sfp_parse_support(phydev->sfp_bus, id, support, interfaces);
> -	iface = sfp_select_interface(phydev->sfp_bus, support);
> +	__set_bit(PHY_INTERFACE_MODE_10GBASER, port->interfaces);
>   
> -	if (iface != PHY_INTERFACE_MODE_10GBASER) {
> -		dev_err(&phydev->mdio.dev, "incompatible SFP module inserted\n");
> -		return -EINVAL;
> -	}
>   	return 0;
>   }
>   
> -static const struct sfp_upstream_ops mv3310_sfp_ops = {
> -	.attach = phy_sfp_attach,
> -	.detach = phy_sfp_detach,
> -	.connect_phy = phy_sfp_connect_phy,
> -	.disconnect_phy = phy_sfp_disconnect_phy,
> -	.module_insert = mv3310_sfp_insert,
> -};
> +static int mv3310_attach_mdi_port(struct phy_device *phydev,
> +				  struct phy_port *port)
> +{
> +	/* This PHY can do combo-ports, i.e. 2 MDI outputs, usually one
> +	 * of them going to an SFP and the other one to a RJ45
> +	 * connector. If we don't have any representation for the port
> +	 * in DT, and we are dealing with a non-SFP port, then we
> +	 * mask the port's capabilities to report BaseT-only modes
> +	 */
> +	if (port->not_described)
> +		return phy_port_restrict_mediums(port,
> +						 BIT(ETHTOOL_LINK_MEDIUM_BASET));
> +
> +	return 0;
> +}
>   
>   static int mv3310_probe(struct phy_device *phydev)
>   {
>   	const struct mv3310_chip *chip = to_mv3310_chip(phydev);
>   	struct mv3310_priv *priv;
>   	u32 mmd_mask = MDIO_DEVS_PMAPMD | MDIO_DEVS_AN;
> +	DECLARE_PHY_INTERFACE_MASK(interfaces);
>   	int ret;
>   
>   	if (!phydev->is_c45 ||
> @@ -543,9 +543,13 @@ static int mv3310_probe(struct phy_device *phydev)
>   	if (ret)
>   		return ret;
>   
> +	__set_bit(PHY_INTERFACE_MODE_10GBASER, interfaces);
> +
>   	chip->init_supported_interfaces(priv->supported_interfaces);
>   
> -	return phy_sfp_probe(phydev, &mv3310_sfp_ops);
> +	phydev->max_n_ports = 2;
> +
> +	return 0;
>   }
>   
>   static void mv3310_remove(struct phy_device *phydev)
> @@ -1406,6 +1410,8 @@ static struct phy_driver mv3310_drivers[] = {
>   		.set_loopback	= genphy_c45_loopback,
>   		.get_wol	= mv3110_get_wol,
>   		.set_wol	= mv3110_set_wol,
> +		.attach_mii_port = mv3310_attach_mii_port,
> +		.attach_mdi_port = mv3310_attach_mdi_port,
>   	},
>   	{
>   		.phy_id		= MARVELL_PHY_ID_88X3310,
> @@ -1425,6 +1431,8 @@ static struct phy_driver mv3310_drivers[] = {
>   		.set_tunable	= mv3310_set_tunable,
>   		.remove		= mv3310_remove,
>   		.set_loopback	= genphy_c45_loopback,
> +		.attach_mii_port = mv3310_attach_mii_port,
> +		.attach_mdi_port = mv3310_attach_mdi_port,
>   	},
>   	{
>   		.phy_id		= MARVELL_PHY_ID_88E2110,
> @@ -1445,6 +1453,8 @@ static struct phy_driver mv3310_drivers[] = {
>   		.set_loopback	= genphy_c45_loopback,
>   		.get_wol	= mv3110_get_wol,
>   		.set_wol	= mv3110_set_wol,
> +		.attach_mii_port = mv3310_attach_mii_port,
> +		.attach_mdi_port = mv3310_attach_mdi_port,
>   	},
>   	{
>   		.phy_id		= MARVELL_PHY_ID_88E2110,
> @@ -1463,6 +1473,8 @@ static struct phy_driver mv3310_drivers[] = {
>   		.set_tunable	= mv3310_set_tunable,
>   		.remove		= mv3310_remove,
>   		.set_loopback	= genphy_c45_loopback,
> +		.attach_mii_port = mv3310_attach_mii_port,
> +		.attach_mdi_port = mv3310_attach_mdi_port,
>   	},
>   };
>   
> diff --git a/drivers/net/phy/phy_port.c b/drivers/net/phy/phy_port.c
> index 6fecaa68350e..b1ba3e56c28d 100644
> --- a/drivers/net/phy/phy_port.c
> +++ b/drivers/net/phy/phy_port.c
> @@ -131,6 +131,50 @@ void phy_port_update_supported(struct phy_port *port)
>   }
>   EXPORT_SYMBOL_GPL(phy_port_update_supported);
>   
> +/**
> + * phy_port_filter_supported() - Make sure that port->supported match port->mediums
> + * @port: The port to filter
> + *
> + * After updating a port's mediums to a more restricted subset, this helper will
> + * make sure that port->supported only contains linkmodes that are compatible
> + * with port->mediums.
> + */
> +static void phy_port_filter_supported(struct phy_port *port)
> +{
> +	__ETHTOOL_DECLARE_LINK_MODE_MASK(supported) = { 0 };
> +	int i;
> +
> +	for_each_set_bit(i, &port->mediums, __ETHTOOL_LINK_MEDIUM_LAST)
> +		phy_caps_medium_get_supported(supported, i, port->lanes);
> +
> +	linkmode_and(port->supported, port->supported, supported);
> +}
> +
> +/**
> + * phy_port_restrict_mediums - Mask away some of the port's supported mediums
> + * @port: The port to act upon
> + * @mediums: A mask of mediums to support on the port
> + *
> + * This helper allows removing some mediums from a port's list of supported
> + * mediums, which occurs once we have enough information about the port to
> + * know its nature.
> + *
> + * Returns 0 if the change was donne correctly, a negative value otherwise.
> + */
> +int phy_port_restrict_mediums(struct phy_port *port, unsigned long mediums)
> +{
> +	/* We forbid ending-up with a port with empty mediums */
> +	if (!(port->mediums & mediums))
> +		return -EINVAL;
> +
> +	port->mediums &= mediums;
> +
> +	phy_port_filter_supported(port);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(phy_port_restrict_mediums);
> +
>   /**
>    * phy_port_get_type() - get the PORT_* attribute for that port.
>    * @port: The port we want the information from
> diff --git a/include/linux/phy_port.h b/include/linux/phy_port.h
> index 053c35c70071..82f1992d2395 100644
> --- a/include/linux/phy_port.h
> +++ b/include/linux/phy_port.h
> @@ -92,6 +92,7 @@ static inline bool phy_port_is_fiber(struct phy_port *port)
>   }
>   
>   void phy_port_update_supported(struct phy_port *port);
> +int phy_port_restrict_mediums(struct phy_port *port, unsigned long mediums);
>   
>   int phy_port_get_type(struct phy_port *port);
>   


