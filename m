Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBB6EC36017
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Mar 2025 07:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CRcbNpu8rD3LzgYT+z7vt6zQHONi+6JPiM+Bm4o7eMU=; b=jbPX33OBVoBvHqdz+KFUrAcraF
	fcvacXt1XlKi7hCDOjT7Z1Mgiybp0wS94r/Qknoy1rWZEIWSJJyA8miUcpqEBCXW1VTpbkAyBHf3K
	dB6skOzrB9q3ZAAQnpoq0yhslQQi7hq5726EbNqppsYR3OACOHs1feYDczR2YYlE5bm2crKhoEFjb
	BTDi7QgTJoypoXtK+Gs8X0d7yRii27yJrV1mvOhUbqmbsBc206LlRTYYSs3ETRjERIhzT64ph2Bk2
	B56qNbVDX0AEP3MaagBtrmJDIy+k2ed+2qbCQY2N6cPesfmTlDAzflrZW/HBb3r//TArjPy3O2JAK
	8Mrvlccg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tz9O1-0000000HBG1-3DUn;
	Mon, 31 Mar 2025 07:16:45 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tz9MH-0000000HB1j-2sP6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Mar 2025 07:15:00 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3D5114433B;
	Mon, 31 Mar 2025 07:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1743405292;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CRcbNpu8rD3LzgYT+z7vt6zQHONi+6JPiM+Bm4o7eMU=;
	b=UD/4i0LnyvYuXKD53LWq7//hkJEB9C/g3N6wfBGbEhVNnFXOvBtrjk2li/ub90l47Qb/bj
	C0Y6p2YaSyM4feqFTRzl+6XC+PtmXnjbXqdjRZrR97l39R8c9VAc+Gh89L1Ya58Ug2BUnw
	G+JiM/FAbv4/v6m38XvMsN3dPmuqz5BCDvjV4qAsbQPrmsp0dTKN1+zgqezSSD+yyE0JBm
	5z0/kGbahyI/mLXXFl6dimPtyzPDd2eLczgBab/lVxs9/nSdpVZxmhIm3AAg3sqSZK9g2K
	kQDArgMArfeJu2XAWOCZH3jXx+i2RAhmKMjU5WVB7jVJH6OVLMQxsf+I8ylW8g==
Date: Mon, 31 Mar 2025 09:14:49 +0200
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Alexander Duyck <alexander.duyck@gmail.com>
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
Message-ID: <20250331091449.155e14a4@fedora-2.home>
In-Reply-To: <CAKgT0Ue_JzmJAPKBhe6XaMkDCy+YNNg5_5VvzOR6CCbqcaQg3Q@mail.gmail.com>
References: <20250307173611.129125-1-maxime.chevallier@bootlin.com>
	<20250307173611.129125-10-maxime.chevallier@bootlin.com>
	<8d3a9c9bb76b1c6bc27d2bd01f4831b2cac83f7f.camel@gmail.com>
	<20250328090621.2d0b3665@fedora-2.home>
	<CAKgT0Ue_JzmJAPKBhe6XaMkDCy+YNNg5_5VvzOR6CCbqcaQg3Q@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddujeelvdelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtqhertdertdejnecuhfhrohhmpeforgigihhmvgcuvehhvghvrghllhhivghruceomhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepkeehgeeijeekteffhfelheetffeghfffhfeufeeifeffjeeftefhveduteduueeunecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepvdgrtddumegtsgduleemkegugeehmeegledttdemieehieekmedvlegsudemlegvfhehmegvkegtjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudelmeekugegheemgeeltddtmeeiheeikeemvdelsgdumeelvghfheemvgektgejpdhhvghlohepfhgvughorhgrqddvrdhhohhmvgdpmhgrihhlfhhrohhmpehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvtddprhgtphhtthhopegrlhgvgigrnhguvghrrdguuhihtghksehgmhgrihhlrdgtohhmpdhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvthdpr
 hgtphhtthhopegrnhgurhgvfieslhhunhhnrdgthhdprhgtphhtthhopehkuhgsrgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepvgguuhhmrgiivghtsehgohhoghhlvgdrtghomhdprhgtphhtthhopehprggsvghnihesrhgvughhrghtrdgtohhmpdhrtghpthhtoheplhhinhhugiesrghrmhhlihhnuhigrdhorhhgrdhukhdprhgtphhtthhopehhkhgrlhhlfigvihhtudesghhmrghilhdrtghomh
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_001458_489120_6FA9EF05 
X-CRM114-Status: GOOD (  56.19  )
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

On Fri, 28 Mar 2025 14:03:54 -0700
Alexander Duyck <alexander.duyck@gmail.com> wrote:

> On Fri, Mar 28, 2025 at 1:06=E2=80=AFAM Maxime Chevallier
> <maxime.chevallier@bootlin.com> wrote:
> >
> > On Thu, 27 Mar 2025 18:16:00 -0700
> > Alexander H Duyck <alexander.duyck@gmail.com> wrote:
> > =20
> > > On Fri, 2025-03-07 at 18:36 +0100, Maxime Chevallier wrote: =20
> > > > When phylink creates a fixed-link configuration, it finds a matching
> > > > linkmode to set as the advertised, lp_advertising and supported mod=
es
> > > > based on the speed and duplex of the fixed link.
> > > >
> > > > Use the newly introduced phy_caps_lookup to get these modes instead=
 of
> > > > phy_lookup_settings(). This has the side effect that the matched
> > > > settings and configured linkmodes may now contain several linkmodes=
 (the
> > > > intersection of supported linkmodes from the phylink settings and t=
he
> > > > linkmodes that match speed/duplex) instead of the one from
> > > > phy_lookup_settings().
> > > >
> > > > Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> > > > ---
> > > >  drivers/net/phy/phylink.c | 44 +++++++++++++++++++++++++++--------=
----
> > > >  1 file changed, 31 insertions(+), 13 deletions(-)
> > > >
> > > > diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
> > > > index cf9f019382ad..8e2b7d647a92 100644
> > > > --- a/drivers/net/phy/phylink.c
> > > > +++ b/drivers/net/phy/phylink.c
> > > > @@ -802,12 +802,26 @@ static int phylink_validate(struct phylink *p=
l, unsigned long *supported,
> > > >     return phylink_validate_mac_and_pcs(pl, supported, state);
> > > >  }
> > > >
> > > > +static void phylink_fill_fixedlink_supported(unsigned long *suppor=
ted)
> > > > +{
> > > > +   linkmode_set_bit(ETHTOOL_LINK_MODE_10baseT_Half_BIT, supported);
> > > > +   linkmode_set_bit(ETHTOOL_LINK_MODE_10baseT_Full_BIT, supported);
> > > > +   linkmode_set_bit(ETHTOOL_LINK_MODE_100baseT_Half_BIT, supported=
);
> > > > +   linkmode_set_bit(ETHTOOL_LINK_MODE_100baseT_Full_BIT, supported=
);
> > > > +   linkmode_set_bit(ETHTOOL_LINK_MODE_1000baseT_Half_BIT, supporte=
d);
> > > > +   linkmode_set_bit(ETHTOOL_LINK_MODE_1000baseT_Full_BIT, supporte=
d);
> > > > +   linkmode_set_bit(ETHTOOL_LINK_MODE_2500baseT_Full_BIT, supporte=
d);
> > > > +   linkmode_set_bit(ETHTOOL_LINK_MODE_5000baseT_Full_BIT, supporte=
d);
> > > > +   linkmode_set_bit(ETHTOOL_LINK_MODE_10000baseT_Full_BIT, support=
ed);
> > > > +}
> > > > + =20
> > >
> > > Any chance we can go with a different route here than just locking
> > > fixed mode to being only for BaseT configurations?
> > >
> > > I am currently working on getting the fbnic driver up and running and=
 I
> > > am using fixed-link mode as a crutch until I can finish up enabling
> > > QSFP module support for phylink and this just knocked out the support=
ed
> > > link modes as I was using 25CR, 50CR, 50CR2, and 100CR2.
> > >
> > > Seems like this should really be something handled by some sort of
> > > validation function rather than just forcing all devices using fixed
> > > link to assume that they are BaseT. I know in our direct attached
> > > copper case we aren't running autoneg so that plan was to use fixed
> > > link until we can add more flexibility by getting QSFP support going.=
 =20
> >
> > These baseT mode were for compatibility with the previous way to deal
> > with fixed links, but we can extend what's being report above 10G with
> > other modes. Indeed the above code unnecessarily restricts the
> > linkmodes. Can you tell me if the following patch works for you ?
> >
> > Maxime
> >
> > -----------
> >
> > From 595888afb23f209f2b1002d0b0406380195d53c1 Mon Sep 17 00:00:00 2001
> > From: Maxime Chevallier <maxime.chevallier@bootlin.com>
> > Date: Fri, 28 Mar 2025 08:53:00 +0100
> > Subject: [PATCH] net: phylink: Allow fixed-link registration above 10G
> >
> > The blamed commit introduced a helper to keep the linkmodes reported by
> > fixed links identical to what they were before phy_caps. This means
> > filtering linkmodes only to report BaseT modes.
> >
> > Doing so, it also filtered out any linkmode above 10G. Reinstate the
> > reporting of linkmodes above 10G, where we report any linkmodes that
> > exist at these speeds.
> >
> > Reported-by: Alexander H Duyck <alexander.duyck@gmail.com>
> > Closes: https://lore.kernel.org/netdev/8d3a9c9bb76b1c6bc27d2bd01f4831b2=
cac83f7f.camel@gmail.com/
> > Fixes: de7d3f87be3c ("net: phylink: Use phy_caps_lookup for fixed-link =
configuration")
> > Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> > ---
> >  drivers/net/phy/phylink.c | 17 +++++++++++++----
> >  1 file changed, 13 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
> > index 69ca765485db..de90fed9c207 100644
> > --- a/drivers/net/phy/phylink.c
> > +++ b/drivers/net/phy/phylink.c
> > @@ -715,16 +715,25 @@ static int phylink_parse_fixedlink(struct phylink=
 *pl,
> >                 phylink_warn(pl, "fixed link specifies half duplex for =
%dMbps link?\n",
> >                              pl->link_config.speed);
> >
> > -       linkmode_zero(pl->supported);
> > -       phylink_fill_fixedlink_supported(pl->supported);
> > +       linkmode_fill(pl->supported);
> >
> >         linkmode_copy(pl->link_config.advertising, pl->supported);
> >         phylink_validate(pl, pl->supported, &pl->link_config);
> >
> > +       phylink_fill_fixedlink_supported(match);
> > + =20
>=20
> I worry that this might put you back into the same problem again with
> the older drivers. In addition it is filling in modes that shouldn't
> be present after the validation.

Note that I'm not directly filling pl->supported here.

[...]

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

[...]

	if (c) {
		linkmode_or(pl->supported, pl->supported, match);
		linkmode_or(pl->link_config.lp_advertising,
			    pl->link_config.lp_advertising, match);
	}

For speeds above 10G, you will get all the modes for the requested
speed, so it should solve the issue in the next steps of your code
where you need matching linkmodes for your settings ? Did you give it a
try ?

You may end up with too many linkmodes, but for fixed-link we don't
really expect these modes to precisely represent any real linkmodes

> One thought on this. You might look at checking to see if the TP bit
> is set in the supported modes after validation and then use your
> fixedlink_supported as a mask if it is supporting twisted pair
> connections.

But the TP bit doesn't really mean much here, at least as of today.
What matters at that point really is the supported phy_interface_t and
your requested speed/duplex

> One possibility would be to go through and filter the
> modes based on the media type where you could basically filter out TP,
> Fiber, and Backplane connection types and use that as a second pass
> based on the settings by basically doing a set of AND and OR
> operations.

At that point, the linkmodes aren't very relevant, even if you look at
the old version of that same function, the linkmodes are built only
based on speed/duplex and do not represent any physical mode.

The media-specific filtering will come in a next series, I sent a few
iterations in last cycle to be able to filter out based on medium, I'll
CC you for the next round

> Also I am not sure it makes sense to say we can't support multiple
> modes on a fixed connection. For example in the case of SerDes links
> and the like it isn't unusual to see support for CR/KR advertised at
> the same speed on the same link and use the exact same configuration
> so a fixed config could support both and advertise both at the same
> time if I am not mistaken.

The use-cases for fixed links have mostly been about describing a link
that we know exists, but can't really control or query. In that case,
we don't even know what's the physical medium so we report pretty much
bogus values (as Andrew says, that used to be done by emulating a
copper PHY). As use-cases are evolving, I think we can consider indeed
a better coverage of your use-case :)

Maxime

