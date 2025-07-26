Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF738C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Jul 2025 21:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nHnQrVjulWV5eTEaeLxZ11VN7DxPLeTCfKGd7yvq2Kg=; b=CTQy5FSrSIXX1c99BLhtd8odtr
	N9pHRcDp2yEVu8nRLKPeElT2hIgCruUCdjD2ltSTHqfiiO1icQw+mU65nHW/MmhzHS6hd+F9tJ7/d
	Gsz5B/Nut2EcMFQzV3Xp9oT1NwQPErKpEvKZZiGlmLC1VeNdsSrtQnnxVqBJqFBwJmy4HUJk3KtzU
	Hu9Yuf/7GhRDA5wp6EA/uGZ2r2qt0fLyCVjT/um1wQKom3xAiUACkBnJ9tLtqHBE7m1Mx+y4+dBwx
	IWVjw4LC9ozFDdODgB+DEW9oV4lvqaeYQL9paAl6h76Rj4tNyP3XTl5bHpMEJ1dd8gCCiXQ+za7Nh
	vfL9M8ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufm7u-0000000BuZZ-1Fq4;
	Sat, 26 Jul 2025 21:08:18 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufm5N-0000000BuNg-1lBI
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Jul 2025 21:05:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=nHnQrVjulWV5eTEaeLxZ11VN7DxPLeTCfKGd7yvq2Kg=; b=0640mmRpxuB0M4XtTXtwopiRXN
	tIEEn2VttlpVBUT0oUfNo/exnyXON3oM/tWTtoaxQt51qAm6V0sMc4R1NPxDiiOFY22F05N1f+vt3
	1GZ7qPB4x9BgWw8zDChJ6hH5n065tnbriroOIe3IUulFir+3mZBJog8FGCV/ThC4FKmk=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1ufm5F-002y1h-DG; Sat, 26 Jul 2025 23:05:33 +0200
Date: Sat, 26 Jul 2025 23:05:33 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: davem@davemloft.net, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	thomas.petazzoni@bootlin.com, Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Herve Codina <herve.codina@bootlin.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	=?iso-8859-1?Q?K=F6ry?= Maincent <kory.maincent@bootlin.com>,
	Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	=?iso-8859-1?Q?Nicol=F2?= Veronese <nicveronese@gmail.com>,
	Simon Horman <horms@kernel.org>, mwojtas@chromium.org,
	Antoine Tenart <atenart@kernel.org>, devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Romain Gantois <romain.gantois@bootlin.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Dimitri Fedrau <dimitri.fedrau@liebherr.com>
Subject: Re: [PATCH net-next v10 07/15] net: phy: Introduce generic SFP
 handling for PHY drivers
Message-ID: <762dd1dd-0170-4f7d-b418-1997c48e7f95@lunn.ch>
References: <20250722121623.609732-1-maxime.chevallier@bootlin.com>
 <20250722121623.609732-8-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250722121623.609732-8-maxime.chevallier@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250726_140541_462964_6799216F 
X-CRM114-Status: GOOD (  19.27  )
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

On Tue, Jul 22, 2025 at 02:16:12PM +0200, Maxime Chevallier wrote:
> There are currently 4 PHY drivers that can drive downstream SFPs:
> marvell.c, marvell10g.c, at803x.c and marvell-88x2222.c. Most of the
> logic is boilerplate, either calling into generic phylib helpers (for
> SFP PHY attach, bus attach, etc.) or performing the same tasks with a
> bit of validation :
>  - Getting the module's expected interface mode
>  - Making sure the PHY supports it
>  - Optionnaly perform some configuration to make sure the PHY outputs

Too man n's.

> +static int phy_sfp_module_insert(void *upstream, const struct sfp_eeprom_id *id)
> +{
> +	struct phy_device *phydev = upstream;
> +	struct phy_port *port = phy_get_sfp_port(phydev);

Strictly speeding, this is not allowed, reverse Christmas tree...

The assignment needs to move into the body of the function.

> +	if (linkmode_empty(sfp_support)) {
> +		dev_err(&phydev->mdio.dev, "incompatible SFP module inserted\n");
> +		return -EINVAL;
> +	}
> +
> +	iface = sfp_select_interface(phydev->sfp_bus, sfp_support);
> +
> +	/* Check that this interface is supported */
> +	if (!test_bit(iface, port->interfaces)) {
> +		dev_err(&phydev->mdio.dev, "incompatible SFP module inserted\n");

Maybe make this string different to the previous one, so somebody
debugging issues knows which happened?

> +/**
> + * phy_get_sfp_port() - Returns the first valid SFP port of a PHY
> + * @phydev: pointer to the PHY device to get the SFP port from
> + *
> + * Returns: The first active SFP (serdes) port of a PHY device, NULL if none
> + * exist.
> + */
> +struct phy_port *phy_get_sfp_port(struct phy_device *phydev)
> +{
> +	struct phy_port *port;
> +
> +	list_for_each_entry(port, &phydev->ports, head)
> +		if (port->active && port->is_mii)

Naming is hard, but this actually returns the first mii port.  Is
there a clear 1:1 mapping? I don't think i've ever seen it, but such a
SERDES port could be connected to a Ethernet switch? And when you get
further, add support for a MUX, could it be connected to a MUX?

	Andrew

