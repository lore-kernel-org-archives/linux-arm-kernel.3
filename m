Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 425F4CAC598
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 07:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VJ/EhOmVDLF9DI3TUuazxQjw64uladD2efGMC+5FrcU=; b=JBbP/HBRVUp+Wqt1/cOVHXW8Dx
	5QIGtHU0jT47SzTyBoK9IBYc3UYBik8oO49XjBgstQSF7p6IO1oyj0UMy4tXldR338pMTUojopH4X
	ZhKxetsqM81oui5BjBrTd6E89skPBgwBWyaTGPAuN60yllrca5n5uskJrdIqtxwpxA1ZQOc6TsksR
	RBEbWYK+o7MaUETVx4ulGtqMA0M2AuBACcEpOjIzRjgub55xdBGYRH6frRFZN8GoKF8Q9Nxq4vKnu
	17X1FB07NPJjzJVstJcWhrblBuRJ2GiBKVGSzUTGj1lei5MRQVqFfbltrn39+vcBRK9Frwe9yBiY1
	J1uRc2+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uymUS-0000000ASRB-0AF6;
	Wed, 17 Sep 2025 07:22:08 +0000
Received: from pegase2.c-s.fr ([93.17.235.10])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uymU8-0000000ASDh-3UGU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 07:21:52 +0000
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4cRV8y5cxKz9sy2;
	Wed, 17 Sep 2025 09:03:14 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JcCnYpbaHND0; Wed, 17 Sep 2025 09:03:14 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4cRV8y4BN2z9sy1;
	Wed, 17 Sep 2025 09:03:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 5AF7A8B766;
	Wed, 17 Sep 2025 09:03:14 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id H1xM81UEGxD0; Wed, 17 Sep 2025 09:03:14 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 3D8B68B763;
	Wed, 17 Sep 2025 09:03:12 +0200 (CEST)
Message-ID: <92ccb5be-efea-4dbf-ac87-a3415b0ed3dc@csgroup.eu>
Date: Wed, 17 Sep 2025 09:03:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v12 15/18] net: phy: qca807x: Support SFP through
 phy_port interface
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
 <20250909152617.119554-16-maxime.chevallier@bootlin.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <20250909152617.119554-16-maxime.chevallier@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_002149_112053_20FA5233 
X-CRM114-Status: GOOD (  20.36  )
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
> QCA8072/8075 may be used as combo-port PHYs, with Serdes (100/1000BaseX)
>   and Copper interfaces. The PHY has the ability to read the configuration
> it's in.  If the configuration indicates the PHY is in combo mode, allow
> registering up to 2 ports.
> 
> Register a dedicated set of port ops to handle the serdes port, and rely
> on generic phylib SFP support for the SFP handling.
> 
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>

> ---
>   drivers/net/phy/qcom/qca807x.c | 73 ++++++++++++++--------------------
>   1 file changed, 30 insertions(+), 43 deletions(-)
> 
> diff --git a/drivers/net/phy/qcom/qca807x.c b/drivers/net/phy/qcom/qca807x.c
> index 070dc8c00835..d8f1ce5a7128 100644
> --- a/drivers/net/phy/qcom/qca807x.c
> +++ b/drivers/net/phy/qcom/qca807x.c
> @@ -13,7 +13,7 @@
>   #include <linux/phy.h>
>   #include <linux/bitfield.h>
>   #include <linux/gpio/driver.h>
> -#include <linux/sfp.h>
> +#include <linux/phy_port.h>
>   
>   #include "../phylib.h"
>   #include "qcom.h"
> @@ -643,68 +643,54 @@ static int qca807x_phy_package_config_init_once(struct phy_device *phydev)
>   	return ret;
>   }
>   
> -static int qca807x_sfp_insert(void *upstream, const struct sfp_eeprom_id *id)
> +static int qca807x_configure_serdes(struct phy_port *port, bool enable,
> +				    phy_interface_t interface)
>   {
> -	struct phy_device *phydev = upstream;
> -	__ETHTOOL_DECLARE_LINK_MODE_MASK(support) = { 0, };
> -	phy_interface_t iface;
> +	struct phy_device *phydev = port_phydev(port);
>   	int ret;
> -	DECLARE_PHY_INTERFACE_MASK(interfaces);
>   
> -	sfp_parse_support(phydev->sfp_bus, id, support, interfaces);
> -	iface = sfp_select_interface(phydev->sfp_bus, support);
> +	if (!phydev)
> +		return -ENODEV;
>   
> -	dev_info(&phydev->mdio.dev, "%s SFP module inserted\n", phy_modes(iface));
> -
> -	switch (iface) {
> -	case PHY_INTERFACE_MODE_1000BASEX:
> -	case PHY_INTERFACE_MODE_100BASEX:
> +	if (enable) {
>   		/* Set PHY mode to PSGMII combo (1/4 copper + combo ports) mode */
>   		ret = phy_modify(phydev,
>   				 QCA807X_CHIP_CONFIGURATION,
>   				 QCA807X_CHIP_CONFIGURATION_MODE_CFG_MASK,
>   				 QCA807X_CHIP_CONFIGURATION_MODE_PSGMII_FIBER);
> +		if (ret)
> +			return ret;
>   		/* Enable fiber mode autodection (1000Base-X or 100Base-FX) */
>   		ret = phy_set_bits_mmd(phydev,
>   				       MDIO_MMD_AN,
>   				       QCA807X_MMD7_FIBER_MODE_AUTO_DETECTION,
>   				       QCA807X_MMD7_FIBER_MODE_AUTO_DETECTION_EN);
> -		/* Select fiber page */
> -		ret = phy_clear_bits(phydev,
> -				     QCA807X_CHIP_CONFIGURATION,
> -				     QCA807X_BT_BX_REG_SEL);
> -
> -		phydev->port = PORT_FIBRE;
> -		break;
> -	default:
> -		dev_err(&phydev->mdio.dev, "Incompatible SFP module inserted\n");
> -		return -EINVAL;
> +		if (ret)
> +			return ret;
>   	}
>   
> -	return ret;
> +	phydev->port = enable ? PORT_FIBRE : PORT_TP;
> +
> +	return phy_modify(phydev, QCA807X_CHIP_CONFIGURATION,
> +			  QCA807X_BT_BX_REG_SEL,
> +			  enable ? 0 : QCA807X_BT_BX_REG_SEL);
>   }
>   
> -static void qca807x_sfp_remove(void *upstream)
> +static const struct phy_port_ops qca807x_serdes_port_ops = {
> +	.configure_mii = qca807x_configure_serdes,
> +};
> +
> +static int qca807x_attach_mii_port(struct phy_device *phydev,
> +				   struct phy_port *port)
>   {
> -	struct phy_device *phydev = upstream;
> +	__set_bit(PHY_INTERFACE_MODE_1000BASEX, port->interfaces);
> +	__set_bit(PHY_INTERFACE_MODE_100BASEX, port->interfaces);
>   
> -	/* Select copper page */
> -	phy_set_bits(phydev,
> -		     QCA807X_CHIP_CONFIGURATION,
> -		     QCA807X_BT_BX_REG_SEL);
> +	port->ops = &qca807x_serdes_port_ops;
>   
> -	phydev->port = PORT_TP;
> +	return 0;
>   }
>   
> -static const struct sfp_upstream_ops qca807x_sfp_ops = {
> -	.attach = phy_sfp_attach,
> -	.detach = phy_sfp_detach,
> -	.module_insert = qca807x_sfp_insert,
> -	.module_remove = qca807x_sfp_remove,
> -	.connect_phy = phy_sfp_connect_phy,
> -	.disconnect_phy = phy_sfp_disconnect_phy,
> -};
> -
>   static int qca807x_probe(struct phy_device *phydev)
>   {
>   	struct device_node *node = phydev->mdio.dev.of_node;
> @@ -745,9 +731,8 @@ static int qca807x_probe(struct phy_device *phydev)
>   
>   	/* Attach SFP bus on combo port*/
>   	if (phy_read(phydev, QCA807X_CHIP_CONFIGURATION)) {
> -		ret = phy_sfp_probe(phydev, &qca807x_sfp_ops);
> -		if (ret)
> -			return ret;
> +		phydev->max_n_ports = 2;
> +
>   		linkmode_set_bit(ETHTOOL_LINK_MODE_FIBRE_BIT, phydev->supported);
>   		linkmode_set_bit(ETHTOOL_LINK_MODE_FIBRE_BIT, phydev->advertising);
>   	}
> @@ -825,6 +810,7 @@ static struct phy_driver qca807x_drivers[] = {
>   		.get_phy_stats		= qca807x_get_phy_stats,
>   		.set_wol		= at8031_set_wol,
>   		.get_wol		= at803x_get_wol,
> +		.attach_mii_port	= qca807x_attach_mii_port,
>   	},
>   	{
>   		PHY_ID_MATCH_EXACT(PHY_ID_QCA8075),
> @@ -852,6 +838,7 @@ static struct phy_driver qca807x_drivers[] = {
>   		.get_phy_stats		= qca807x_get_phy_stats,
>   		.set_wol		= at8031_set_wol,
>   		.get_wol		= at803x_get_wol,
> +		.attach_mii_port	= qca807x_attach_mii_port,
>   	},
>   };
>   module_phy_driver(qca807x_drivers);


