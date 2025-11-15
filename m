Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E42CCEB2C6
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Nov 2025 13:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RcpmW6oPw54JV2hDrUyco+JWh65TEMPn5Jq/XSCy4Uw=; b=WJUgVef6UfrpAxjl2b3ZQnPO+n
	avBKbXGBa8nTrD+KLhF+ShkVT38I4OY4g153PBn/nLmjrEv+pVkgpWKakVXY3k2CsUAXroJ0gNCXI
	DBcqIp3x1hYHmjAv5GeiBctxtIK9Yi5U6T2hoRk7ZkjF7UrDpnJ+1qU7O/oR8coIr/8WQndFpnNDA
	VubyeJj1173ZRLXh5p8EbECsY6ClyVAO4Ttta4G8+1JGHJM0KGKloQHeMpl7LUSI/DRMF0amWyFiM
	iCx0hLlzGRz13pIr0KDCeTH5a8JySUADEwnXulzNZwQMK32+ypbGa9zbNGz7R6vUARyfxnkib1aat
	69FLFWDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKGCn-0000000Dn59-1Ogq;
	Sat, 15 Nov 2025 13:20:41 +0000
Received: from pegase2.c-s.fr ([93.17.235.10])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKGCj-0000000Dn4S-1z6F
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Nov 2025 13:20:39 +0000
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4d7v7w1p1Wz9sTL;
	Sat, 15 Nov 2025 13:53:32 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yP86A2irwuLL; Sat, 15 Nov 2025 13:53:32 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4d7v7w0lMTz9sTK;
	Sat, 15 Nov 2025 13:53:32 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 023658B770;
	Sat, 15 Nov 2025 13:53:32 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id zSve2Ap9yPlL; Sat, 15 Nov 2025 13:53:31 +0100 (CET)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 9B2338B76E;
	Sat, 15 Nov 2025 13:53:30 +0100 (CET)
Message-ID: <fe773f23-fa99-4a43-8d43-97088103923c@csgroup.eu>
Date: Sat, 15 Nov 2025 13:53:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v16 06/15] net: phy: Create a phy_port for
 PHY-driven SFPs
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
References: <20251113081418.180557-1-maxime.chevallier@bootlin.com>
 <20251113081418.180557-7-maxime.chevallier@bootlin.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <20251113081418.180557-7-maxime.chevallier@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251115_052037_679062_13435F10 
X-CRM114-Status: GOOD (  24.65  )
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


Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>



Le 13/11/2025 à 09:14, Maxime Chevallier a écrit :
> Some PHY devices may be used as media-converters to drive SFP ports (for
> example, to allow using SFP when the SoC can only output RGMII). This is
> already supported to some extend by allowing PHY drivers to registers
> themselves as being SFP upstream.
> 
> However, the logic to drive the SFP can actually be split to a per-port
> control logic, allowing support for multi-port PHYs, or PHYs that can
> either drive SFPs or Copper.
> 
> To that extent, create a phy_port when registering an SFP bus onto a
> PHY. This port is considered a "serdes" port, in that it can feed data
> to another entity on the link. The PHY driver needs to specify the
> various PHY_INTERFACE_MODE_XXX that this port supports.
> 
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> ---
>   drivers/net/phy/phy_device.c | 24 ++++++++++++++++++++++++
>   drivers/net/phy/phy_port.c   | 14 ++++++++++++++
>   2 files changed, 38 insertions(+)
> 
> diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
> index f48565c3a9b8..3772c68b1dbc 100644
> --- a/drivers/net/phy/phy_device.c
> +++ b/drivers/net/phy/phy_device.c
> @@ -1643,6 +1643,26 @@ static void phy_del_port(struct phy_device *phydev, struct phy_port *port)
>   	phydev->n_ports--;
>   }
>   
> +static int phy_setup_sfp_port(struct phy_device *phydev)
> +{
> +	struct phy_port *port = phy_port_alloc();
> +
> +	if (!port)
> +		return -ENOMEM;
> +
> +	port->parent_type = PHY_PORT_PHY;
> +	port->phy = phydev;
> +
> +	/* The PHY is a media converter, the port connected to the SFP cage
> +	 * is a MII port.
> +	 */
> +	port->is_mii = true;
> +
> +	phy_add_port(phydev, port);
> +
> +	return 0;
> +}
> +
>   /**
>    * phy_sfp_probe - probe for a SFP cage attached to this PHY device
>    * @phydev: Pointer to phy_device
> @@ -1664,6 +1684,10 @@ int phy_sfp_probe(struct phy_device *phydev,
>   		ret = sfp_bus_add_upstream(bus, phydev, ops);
>   		sfp_bus_put(bus);
>   	}
> +
> +	if (phydev->sfp_bus)
> +		ret = phy_setup_sfp_port(phydev);
> +
>   	return ret;
>   }
>   EXPORT_SYMBOL(phy_sfp_probe);
> diff --git a/drivers/net/phy/phy_port.c b/drivers/net/phy/phy_port.c
> index 05455dc487cd..f89f70f83593 100644
> --- a/drivers/net/phy/phy_port.c
> +++ b/drivers/net/phy/phy_port.c
> @@ -132,6 +132,20 @@ void phy_port_update_supported(struct phy_port *port)
>   			port->pairs = max_t(int, port->pairs,
>   					    ethtool_linkmode_n_pairs(mode));
>   
> +	/* Serdes ports supported through SFP may not have any medium set,
> +	 * as they will output PHY_INTERFACE_MODE_XXX modes. In that case, derive
> +	 * the supported list based on these interfaces
> +	 */
> +	if (port->is_mii && linkmode_empty(supported)) {
> +		unsigned long interface, link_caps = 0;
> +
> +		/* Get each interface's caps */
> +		for_each_set_bit(interface, port->interfaces,
> +				 PHY_INTERFACE_MODE_MAX)
> +			link_caps |= phy_caps_from_interface(interface);
> +
> +		phy_caps_linkmodes(link_caps, port->supported);
> +	}
>   }
>   EXPORT_SYMBOL_GPL(phy_port_update_supported);
>   


