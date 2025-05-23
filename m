Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7BEFC54ED0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 May 2025 13:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1kgxapgqpqXKaidI+dwQyPPRpZm75jne3m7YkATlzkI=; b=o7k3+BTcYNgXy1mVSzXoEqTJgp
	3n89ytwA19WMl0eOlArky+t3ZDi6T42Vv1XfFLeRkpZBVtcUdv04LpziCrc2ZWyCkZeBuhA38aDIN
	kWp+AayQwktIaBb4JTXUP/4mYE32UK3dfU+ijakhl/uySQTD4HB9C8Ydh/qbhAIBwvWkLGt1HV0E9
	Ygp2J7m5BWyk5yEbavOTjIqCATESJG717qyCei7UbbdCsoGEGUqXHuaJwaZ6eFRiZ9DtjFvO2cwRH
	upCfc/NP15h0UP95Mrq0IedgbGdBQzDoVqZFz9wXPVazTPnjUFQSR7CEnPBP8uKEs7muOWKTIrNBw
	0MsXvkoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uISG2-00000003vFu-33YN;
	Fri, 23 May 2025 13:16:18 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIRvZ-00000003rkm-30Yo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 May 2025 12:55:11 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 066BA4399E;
	Fri, 23 May 2025 12:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1748004903;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1kgxapgqpqXKaidI+dwQyPPRpZm75jne3m7YkATlzkI=;
	b=ZEcDaO+l+3Vp/ktqUSPkwm5cuKaiXWUMMNrU2zxBnF0MSE8d5hkLY1smkK1u0miJXbuDwa
	mdCfeF4zZ9bKTHeZ4VOY3VO6MtPSrAzF7JjRdaxLvwzcjObPrFS+BKXNTOOU17/ZPCx/cG
	A8lSQNOuJSG11dP7Hbp5VbAlOCG+jEjOEdnEu8U5pVbjesJURt++hfQLazUlWQ+1bn4dPb
	2kShAqi1PvUmemBXbrlwE7FwvmJySFnBUOuic74F4xH108Yo4rXhtBeEaC0V0pq83E71qG
	A9bNjuApw8wGun0SuJpw9db90sBuSnwm1arA13qF3Q2sku6QK8AKeBe8NamGeQ==
Date: Fri, 23 May 2025 14:54:57 +0200
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Romain Gantois <romain.gantois@bootlin.com>
Cc: davem@davemloft.net, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 thomas.petazzoni@bootlin.com, Andrew Lunn <andrew@lunn.ch>, Jakub Kicinski
 <kuba@kernel.org>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Russell King <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Herve Codina <herve.codina@bootlin.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Heiner Kallweit
 <hkallweit1@gmail.com>, Vladimir Oltean <vladimir.oltean@nxp.com>,
 =?UTF-8?B?S8O2cnk=?= Maincent <kory.maincent@bootlin.com>, Marek
 =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>, Oleksij Rempel
 <o.rempel@pengutronix.de>, =?UTF-8?B?Tmljb2zDsg==?= Veronese
 <nicveronese@gmail.com>, Simon Horman <horms@kernel.org>,
 mwojtas@chromium.org, Antoine Tenart <atenart@kernel.org>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, Daniel Golle
 <daniel@makrotopia.org>, Dimitri Fedrau <dimitri.fedrau@liebherr.com>
Subject: Re: [PATCH net-next v6 06/14] net: phy: Introduce generic SFP
 handling for PHY drivers
Message-ID: <20250523145457.07b1e7db@2a02-8428-0f40-1901-f412-2f85-a503-26ba.rev.sfr.net>
In-Reply-To: <23936783.6Emhk5qWAg@fw-rgant>
References: <20250507135331.76021-1-maxime.chevallier@bootlin.com>
	<20250507135331.76021-7-maxime.chevallier@bootlin.com>
	<23936783.6Emhk5qWAg@fw-rgant>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdekledtucdltddurdegfedvrddttddmucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpeforgigihhmvgcuvehhvghvrghllhhivghruceomhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeevledtvdevueehhfevhfelhfekveeftdfgiedufeffieeltddtgfefuefhueeknecukfhppedvrgdtvdemkeegvdekmehfgedtmeduledtudemfheguddvmedvfhekheemrgehtdefmedviegsrgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemkeegvdekmehfgedtmeduledtudemfheguddvmedvfhekheemrgehtdefmedviegsrgdphhgvlhhopedvrgdtvddqkeegvdekqddtfhegtddqudeltdduqdhfgeduvddqvdhfkeehqdgrhedtfedqvdeisggrrdhrvghvrdhsfhhrrdhnvghtpdhmrghilhhfrhhomhepmhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedtpdhrtghpthhtoheprhhomhgrihhnrdhgrghnthhoihhssegsohhothhlihhnrdgtohhmp
 dhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvthdprhgtphhtthhopehnvghtuggvvhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhmshhmsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheprghnughrvgifsehluhhnnhdrtghhpdhrtghpthhtohepkhhusggrsehkvghrnhgvlhdrohhrgh
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_055510_279676_60B26504 
X-CRM114-Status: GOOD (  41.65  )
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

Hi Romain,

On Mon, 12 May 2025 10:38:52 +0200
Romain Gantois <romain.gantois@bootlin.com> wrote:

> Hi Maxime,
> 
> On Wednesday, 7 May 2025 15:53:22 CEST Maxime Chevallier wrote:
> > There are currently 4 PHY drivers that can drive downstream SFPs:
> > marvell.c, marvell10g.c, at803x.c and marvell-88x2222.c. Most of the
> > logic is boilerplate, either calling into generic phylib helpers (for
> > SFP PHY attach, bus attach, etc.) or performing the same tasks with a
> > bit of validation :
> >  - Getting the module's expected interface mode
> >  - Making sure the PHY supports it
> >  - Optionnaly perform some configuration to make sure the PHY outputs
> >    the right mode
> > 
> > This can be made more generic by leveraging the phy_port, and its
> > configure_mii() callback which allows setting a port's interfaces when
> > the port is a serdes.
> > 
> > Introduce a generic PHY SFP support. If a driver doesn't probe the SFP
> > bus itself, but an SFP phandle is found in devicetree/firmware, then the
> > generic PHY SFP support will be used, relying on port ops.
> > 
> > PHY driver need to :
> >  - Register a .attach_port() callback
> >  - When a serdes port is registered to the PHY, drivers must set
> >    port->interfaces to the set of PHY_INTERFACE_MODE the port can output
> >  - If the port has limitations regarding speed, duplex and aneg, the
> >    port can also fine-tune the final linkmodes that can be supported
> >  - The port may register a set of ops, including .configure_mii(), that
> >    will be called at module_insert time to adjust the interface based on
> >    the module detected.
> > 
> > Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> > ---
> >  drivers/net/phy/phy_device.c | 107 +++++++++++++++++++++++++++++++++++
> >  include/linux/phy.h          |   2 +
> >  2 files changed, 109 insertions(+)
> > 
> > diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
> > index aaf0eccbefba..aca3a47cbb66 100644
> > --- a/drivers/net/phy/phy_device.c
> > +++ b/drivers/net/phy/phy_device.c
> > @@ -1450,6 +1450,87 @@ void phy_sfp_detach(void *upstream, struct sfp_bus
> > *bus) }
> >  EXPORT_SYMBOL(phy_sfp_detach);
> > 
> > +static int phy_sfp_module_insert(void *upstream, const struct sfp_eeprom_id
> > *id) +{
> > +	struct phy_device *phydev = upstream;
> > +	struct phy_port *port = phy_get_sfp_port(phydev);
> > +  
> 
> RCT

Can't be done here, it won't build if in the other order...

> 
> > +	__ETHTOOL_DECLARE_LINK_MODE_MASK(sfp_support);
> > +	DECLARE_PHY_INTERFACE_MASK(interfaces);
> > +	phy_interface_t iface;
> > +
> > +	linkmode_zero(sfp_support);
> > +
> > +	if (!port)
> > +		return -EINVAL;
> > +
> > +	sfp_parse_support(phydev->sfp_bus, id, sfp_support, interfaces);
> > +
> > +	if (phydev->n_ports == 1)
> > +		phydev->port = sfp_parse_port(phydev->sfp_bus, id,   
> sfp_support);
> 
> As mentionned below, this check looks a bit strange to me. Why are we only 
> parsing the SFP port if the PHY device only has one registered port?

Because phydev->port is global to the PHY. If we have another port,
then phydev->port must be handled differently so that SFP insertion /
removal doesn't overwrite what the other port is.

Handling of phydev->port is still fragile in this state of the series,
I'll try to improve on that for V7 and document it better.

> > +
> > +	linkmode_and(sfp_support, port->supported, sfp_support);
> > +
> > +	if (linkmode_empty(sfp_support)) {
> > +		dev_err(&phydev->mdio.dev, "incompatible SFP module   
> inserted\n");
> > +		return -EINVAL;
> > +	}
> > +
> > +	iface = sfp_select_interface(phydev->sfp_bus, sfp_support);
> > +
> > +	/* Check that this interface is supported */
> > +	if (!test_bit(iface, port->interfaces)) {
> > +		dev_err(&phydev->mdio.dev, "incompatible SFP module   
> inserted\n");
> > +		return -EINVAL;
> > +	}
> > +
> > +	if (port->ops && port->ops->configure_mii)
> > +		return port->ops->configure_mii(port, true, iface);  
> 
> The name "configure_mii()" seems a bit narrow-scoped to me, as this callback 
> might have to configure something else than a MII link. For example, if a DAC 
> SFP module is inserted, the downstream side of the transciever will have to be 
> configured to 1000Base-X or something similar.

In that regard, you can consider 1000BaseX as a MII mode (we do have
PHY_INTERFACE_MODE_1000BASEX).

> I'd suggest something like "post_sfp_insert()", please let me know what you 
> think.

That's not intended to be SFP-specific though. post_sfp_insert() sounds
lke the narrow-scoped name to me :) Here we are dealing with a PHy that
has a media-side port that isn't a MDI port, but an MII interface like
a MAC would usually export. There may be an SFP here, or something else
entirely :)

One thing though is that this series uses a mix of "is_serdes" and
"configure_mii" to mean pretty-much the same thing, I'll make the names
a bit more homogenous.

> > +
> > +	return 0;
> > +}
> > +
> > +static void phy_sfp_module_remove(void *upstream)
> > +{
> > +	struct phy_device *phydev = upstream;
> > +	struct phy_port *port = phy_get_sfp_port(phydev);
> > +
> > +	if (port && port->ops && port->ops->configure_mii)
> > +		port->ops->configure_mii(port, false, PHY_INTERFACE_MODE_NA);
> > +
> > +	if (phydev->n_ports == 1)
> > +		phydev->port = PORT_NONE;  
> 
> This check is a bit confusing to me. Could you please explain why you're only 
> setting the phydev's SFP port to PORT_NONE if the PHY device only has one 
> registered port? Shouldn't this be done regardless?

So that we don't overwrite what the other port would have set :) but,
that's a bit fragile as I said and probably not correct anyways, let me
double-check that.

Maxime


