Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16389C28B20
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Mar 2025 08:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=txpxsTy5Igy4BZd7LQw51gIz0+Sc/EV673tLlRbxdo0=; b=mDNlz7c0WneTjj7fl3RN/pxItB
	yTRPI5z6wzMLjjZoL7ycjbjgyMPeurI7L0aO3NBoD/9Z9C2KgUCk3dHLt6rSmGwlEeDHuRzpjf2Dm
	ViIs6LkPCNnxiAxwgvLrg3GotFFDz2fNO82rRHt2AxyZNoJERHUzf1oN6vqgI1BZr5BDM1taqgVKt
	n0pHXeQfsnsBs5xuuC1AQa/Fh0KxPU8ZJI3NXoh+liXQPpiz+b1Bcah+scHRPqSi0wRQ6gfOnpNl+
	CnGr7McGcV1mqAUueDUHXrEUJ+GhAskGw0LGf2wnh1KJuzYeNkcSmx+tJhG/DWJH3in6Ns5QodnUA
	Hv09RX1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty4p5-0000000Ct0I-1Z2F;
	Fri, 28 Mar 2025 08:12:15 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty4jc-0000000Cs4X-0OzM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Mar 2025 08:06:38 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id D2FFF4434A;
	Fri, 28 Mar 2025 08:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1743149191;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=txpxsTy5Igy4BZd7LQw51gIz0+Sc/EV673tLlRbxdo0=;
	b=N092Qp7O4xu0C0LC9Jld0qwLeROPEa2bmbHa5rx+7UryRNUCT3x0EbFCiiWUWjRguxk6bB
	mk5ZtVAtYtX97CjiRg3dkVV4YPzvVEpfg3s6RuvDbBbyi7EThmLtS8fwI66Suwlaciq4v4
	Rf5krwbNXkTmZYMJ7T0t9iWAPu+oYN2jjP7XWMYgPNm4BSi9QSsNkhuz1x4FyBogit97es
	W72asT8vzmkMmAk7JAXCvNR8IV2i+d2x6sW/Nm3I9waCp8fsWg5YR8x8iMiLD/HTNIPxbf
	nkPnXDB1e6ODDgjV81XDs3Ui/33W81KOClPg8T5JShIJvqKJASv5fz4JworyEg==
Date: Fri, 28 Mar 2025 09:06:21 +0100
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Alexander H Duyck <alexander.duyck@gmail.com>
Cc: davem@davemloft.net, Andrew Lunn <andrew@lunn.ch>, Jakub Kicinski
 <kuba@kernel.org>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Russell King <linux@armlinux.org.uk>, Heiner Kallweit
 <hkallweit1@gmail.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com,
 linux-arm-kernel@lists.infradead.org, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Herve Codina <herve.codina@bootlin.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean
 <vladimir.oltean@nxp.com>, =?UTF-8?B?S8O2cnk=?= Maincent
 <kory.maincent@bootlin.com>, Oleksij Rempel <o.rempel@pengutronix.de>,
 Simon Horman <horms@kernel.org>, Romain Gantois
 <romain.gantois@bootlin.com>
Subject: Re: [PATCH net-next v5 09/13] net: phylink: Use phy_caps_lookup for
 fixed-link configuration
Message-ID: <20250328090621.2d0b3665@fedora-2.home>
In-Reply-To: <8d3a9c9bb76b1c6bc27d2bd01f4831b2cac83f7f.camel@gmail.com>
References: <20250307173611.129125-1-maxime.chevallier@bootlin.com>
	<20250307173611.129125-10-maxime.chevallier@bootlin.com>
	<8d3a9c9bb76b1c6bc27d2bd01f4831b2cac83f7f.camel@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddujedtjeeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtqhertdertddvnecuhfhrohhmpeforgigihhmvgcuvehhvghvrghllhhivghruceomhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepjeeifeevjeevfeeujeeuieeftdehieejkedukeffhfehhedvieeugeejvefhffeinecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepvdgrtddumegtsgduleemkegugeehmeegledttdemieehieekmedvlegsudemlegvfhehmegvkegtjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudelmeekugegheemgeeltddtmeeiheeikeemvdelsgdumeelvghfheemvgektgejpdhhvghlohepfhgvughorhgrqddvrdhhohhmvgdpmhgrihhlfhhrohhmpehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvtddprhgtphhtthhopegrlhgvgigrnhguvghrrdguuhihtghksehgmhgrihhlrdgtohhmpdhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvthdpr
 hgtphhtthhopegrnhgurhgvfieslhhunhhnrdgthhdprhgtphhtthhopehkuhgsrgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepvgguuhhmrgiivghtsehgohhoghhlvgdrtghomhdprhgtphhtthhopehprggsvghnihesrhgvughhrghtrdgtohhmpdhrtghpthhtoheplhhinhhugiesrghrmhhlihhnuhigrdhorhhgrdhukhdprhgtphhtthhopehhkhgrlhhlfigvihhtudesghhmrghilhdrtghomh
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250328_010636_793160_ACF079C7 
X-CRM114-Status: GOOD (  33.53  )
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

On Thu, 27 Mar 2025 18:16:00 -0700
Alexander H Duyck <alexander.duyck@gmail.com> wrote:

> On Fri, 2025-03-07 at 18:36 +0100, Maxime Chevallier wrote:
> > When phylink creates a fixed-link configuration, it finds a matching
> > linkmode to set as the advertised, lp_advertising and supported modes
> > based on the speed and duplex of the fixed link.
> >=20
> > Use the newly introduced phy_caps_lookup to get these modes instead of
> > phy_lookup_settings(). This has the side effect that the matched
> > settings and configured linkmodes may now contain several linkmodes (the
> > intersection of supported linkmodes from the phylink settings and the
> > linkmodes that match speed/duplex) instead of the one from
> > phy_lookup_settings().
> >=20
> > Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> > ---
> >  drivers/net/phy/phylink.c | 44 +++++++++++++++++++++++++++------------
> >  1 file changed, 31 insertions(+), 13 deletions(-)
> >=20
> > diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
> > index cf9f019382ad..8e2b7d647a92 100644
> > --- a/drivers/net/phy/phylink.c
> > +++ b/drivers/net/phy/phylink.c
> > @@ -802,12 +802,26 @@ static int phylink_validate(struct phylink *pl, u=
nsigned long *supported,
> >  	return phylink_validate_mac_and_pcs(pl, supported, state);
> >  }
> > =20
> > +static void phylink_fill_fixedlink_supported(unsigned long *supported)
> > +{
> > +	linkmode_set_bit(ETHTOOL_LINK_MODE_10baseT_Half_BIT, supported);
> > +	linkmode_set_bit(ETHTOOL_LINK_MODE_10baseT_Full_BIT, supported);
> > +	linkmode_set_bit(ETHTOOL_LINK_MODE_100baseT_Half_BIT, supported);
> > +	linkmode_set_bit(ETHTOOL_LINK_MODE_100baseT_Full_BIT, supported);
> > +	linkmode_set_bit(ETHTOOL_LINK_MODE_1000baseT_Half_BIT, supported);
> > +	linkmode_set_bit(ETHTOOL_LINK_MODE_1000baseT_Full_BIT, supported);
> > +	linkmode_set_bit(ETHTOOL_LINK_MODE_2500baseT_Full_BIT, supported);
> > +	linkmode_set_bit(ETHTOOL_LINK_MODE_5000baseT_Full_BIT, supported);
> > +	linkmode_set_bit(ETHTOOL_LINK_MODE_10000baseT_Full_BIT, supported);
> > +}
> > + =20
>=20
> Any chance we can go with a different route here than just locking
> fixed mode to being only for BaseT configurations?
>=20
> I am currently working on getting the fbnic driver up and running and I
> am using fixed-link mode as a crutch until I can finish up enabling
> QSFP module support for phylink and this just knocked out the supported
> link modes as I was using 25CR, 50CR, 50CR2, and 100CR2.
>=20
> Seems like this should really be something handled by some sort of
> validation function rather than just forcing all devices using fixed
> link to assume that they are BaseT. I know in our direct attached
> copper case we aren't running autoneg so that plan was to use fixed
> link until we can add more flexibility by getting QSFP support going.

These baseT mode were for compatibility with the previous way to deal
with fixed links, but we can extend what's being report above 10G with
other modes. Indeed the above code unnecessarily restricts the
linkmodes. Can you tell me if the following patch works for you ?

Maxime

-----------

=46rom 595888afb23f209f2b1002d0b0406380195d53c1 Mon Sep 17 00:00:00 2001
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Date: Fri, 28 Mar 2025 08:53:00 +0100
Subject: [PATCH] net: phylink: Allow fixed-link registration above 10G

The blamed commit introduced a helper to keep the linkmodes reported by
fixed links identical to what they were before phy_caps. This means
filtering linkmodes only to report BaseT modes.

Doing so, it also filtered out any linkmode above 10G. Reinstate the
reporting of linkmodes above 10G, where we report any linkmodes that
exist at these speeds.

Reported-by: Alexander H Duyck <alexander.duyck@gmail.com>
Closes: https://lore.kernel.org/netdev/8d3a9c9bb76b1c6bc27d2bd01f4831b2cac8=
3f7f.camel@gmail.com/
Fixes: de7d3f87be3c ("net: phylink: Use phy_caps_lookup for fixed-link conf=
iguration")
Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 drivers/net/phy/phylink.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 69ca765485db..de90fed9c207 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -715,16 +715,25 @@ static int phylink_parse_fixedlink(struct phylink *pl,
 		phylink_warn(pl, "fixed link specifies half duplex for %dMbps link?\n",
 			     pl->link_config.speed);
=20
-	linkmode_zero(pl->supported);
-	phylink_fill_fixedlink_supported(pl->supported);
+	linkmode_fill(pl->supported);
=20
 	linkmode_copy(pl->link_config.advertising, pl->supported);
 	phylink_validate(pl, pl->supported, &pl->link_config);
=20
+	phylink_fill_fixedlink_supported(match);
+
 	c =3D phy_caps_lookup(pl->link_config.speed, pl->link_config.duplex,
 			    pl->supported, true);
-	if (c)
-		linkmode_and(match, pl->supported, c->linkmodes);
+	if (c) {
+		/* Compatbility with the legacy behaviour : Report one single
+		 * BaseT mode for fixed-link speeds under or at 10G, or all
+		 * linkmodes at the speed/duplex for speeds over 10G
+		 */
+		if (linkmode_intersects(match, c->linkmodes))
+			linkmode_and(match, match, c->linkmodes);
+		else
+			linkmode_copy(match, c->linkmodes);
+	}
=20
 	linkmode_set_bit(ETHTOOL_LINK_MODE_Pause_BIT, mask);
 	linkmode_set_bit(ETHTOOL_LINK_MODE_Asym_Pause_BIT, mask);
--=20
2.48.1


