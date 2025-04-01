Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DD0BC36010
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 15:46:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gecQ9RQtI/BcwX9PC8Ldbr2+MugSUGg3KZUpdtkeQ64=; b=ld21wIXv4euihM6sCtvF4JhW9V
	JJhU9EObC8UDFrlxSBByz+vqFsE88TitjAc8WIc6iVZd9y+joAnYQumbIWXyvYbXN9v8omnPFtsgg
	7h6HYvylplEShdr6HsXUoUxhmiH4IJvb5+WHPbvJh3/ISBjh3gD+qMZBcd/6yjJxnqOLMAFGA1PDm
	xYOTotnJB271Wb6x1xSJZHA4B+auCiCyHHwzr21rDQ6w+sIqPeHyTIfTc2SYOxrZL6LqilEd7CN5k
	Epf24dRgaSsklYFufIjH7BjI4bgu6ZtoOiZu6WuA9wkbNRVn+H62audfe5DupGJKMACwfz1UL8xKX
	oJQ748Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzdoM-00000003kyM-2c5O;
	Tue, 01 Apr 2025 15:45:58 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzdjD-00000003k2h-30Bh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Apr 2025 15:40:41 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id A190D43225;
	Tue,  1 Apr 2025 15:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1743522035;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gecQ9RQtI/BcwX9PC8Ldbr2+MugSUGg3KZUpdtkeQ64=;
	b=CGnXBuu9p/2PkGyHjI4nwuazryKF3wvXNP4AjAQDYGcpp9YaGXidsNhM4Bji+MYifrKOk7
	oH6Y1Pqf95COq1jDKU7IfHh3gcMXoiEYCmTrAXT9GrVzqykITCNf5W8NcaFo/spXEWB1Z4
	qsG93SiMLsNhiHcdD4/eWoVKHa/IDSAEUYvIPBtBTeg7cWDMsds2SLRrNVJjATdkpyYTof
	xsDT4FCItDYZDqGmJR8MxW4EXbDj6YRU/5zfIBwUDQahdpBcGCXTCCA9JXGY/DTFPCOKSQ
	f3/ggT2Pd5c23T4B3XtOe19U9OhJaTHTy+qbjINf7FooxhtWUwROgoUUjDIDCw==
Date: Tue, 1 Apr 2025 17:40:32 +0200
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
Message-ID: <20250401174032.2af3ebb8@fedora.home>
In-Reply-To: <3517cb7b3b10c29a6bf407f2e35fdebaf7a271e3.camel@gmail.com>
References: <20250307173611.129125-1-maxime.chevallier@bootlin.com>
	<20250307173611.129125-10-maxime.chevallier@bootlin.com>
	<8d3a9c9bb76b1c6bc27d2bd01f4831b2cac83f7f.camel@gmail.com>
	<20250328090621.2d0b3665@fedora-2.home>
	<CAKgT0Ue_JzmJAPKBhe6XaMkDCy+YNNg5_5VvzOR6CCbqcaQg3Q@mail.gmail.com>
	<20250331091449.155e14a4@fedora-2.home>
	<3517cb7b3b10c29a6bf407f2e35fdebaf7a271e3.camel@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddukeefudejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtqhertdertdejnecuhfhrohhmpeforgigihhmvgcuvehhvghvrghllhhivghruceomhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepkeehgeeijeekteffhfelheetffeghfffhfeufeeifeffjeeftefhveduteduueeunecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepvdgrtddumegtsgduleemkegugeehmeegledttdemieehieekmedvlegsudemlegvfhehmegvkegtjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudelmeekugegheemgeeltddtmeeiheeikeemvdelsgdumeelvghfheemvgektgejpdhhvghlohepfhgvughorhgrrdhhohhmvgdpmhgrihhlfhhrohhmpehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvtddprhgtphhtthhopegrlhgvgigrnhguvghrrdguuhihtghksehgmhgrihhlrdgtohhmpdhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvthdprhgtp
 hhtthhopegrnhgurhgvfieslhhunhhnrdgthhdprhgtphhtthhopehkuhgsrgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepvgguuhhmrgiivghtsehgohhoghhlvgdrtghomhdprhgtphhtthhopehprggsvghnihesrhgvughhrghtrdgtohhmpdhrtghpthhtoheplhhinhhugiesrghrmhhlihhnuhigrdhorhhgrdhukhdprhgtphhtthhopehhkhgrlhhlfigvihhtudesghhmrghilhdrtghomh
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_084040_054483_0AC0D976 
X-CRM114-Status: GOOD (  58.40  )
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

On Tue, 01 Apr 2025 08:28:29 -0700
Alexander H Duyck <alexander.duyck@gmail.com> wrote:

> On Mon, 2025-03-31 at 09:14 +0200, Maxime Chevallier wrote:
> > On Fri, 28 Mar 2025 14:03:54 -0700
> > Alexander Duyck <alexander.duyck@gmail.com> wrote:
> >  =20
> > > On Fri, Mar 28, 2025 at 1:06=E2=80=AFAM Maxime Chevallier
> > > <maxime.chevallier@bootlin.com> wrote: =20
> > > >=20
> > > > On Thu, 27 Mar 2025 18:16:00 -0700
> > > > Alexander H Duyck <alexander.duyck@gmail.com> wrote:
> > > >   =20
> > > > > On Fri, 2025-03-07 at 18:36 +0100, Maxime Chevallier wrote:   =20
> > > > > > When phylink creates a fixed-link configuration, it finds a mat=
ching
> > > > > > linkmode to set as the advertised, lp_advertising and supported=
 modes
> > > > > > based on the speed and duplex of the fixed link.
> > > > > >=20
> > > > > > Use the newly introduced phy_caps_lookup to get these modes ins=
tead of
> > > > > > phy_lookup_settings(). This has the side effect that the matched
> > > > > > settings and configured linkmodes may now contain several linkm=
odes (the
> > > > > > intersection of supported linkmodes from the phylink settings a=
nd the
> > > > > > linkmodes that match speed/duplex) instead of the one from
> > > > > > phy_lookup_settings().
> > > > > >=20
> > > > > > Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> > > > > > ---
> > > > > >  drivers/net/phy/phylink.c | 44 +++++++++++++++++++++++++++----=
--------
> > > > > >  1 file changed, 31 insertions(+), 13 deletions(-)
> > > > > >=20
> > > > > > diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylin=
k.c
> > > > > > index cf9f019382ad..8e2b7d647a92 100644
> > > > > > --- a/drivers/net/phy/phylink.c
> > > > > > +++ b/drivers/net/phy/phylink.c
> > > > > > @@ -802,12 +802,26 @@ static int phylink_validate(struct phylin=
k *pl, unsigned long *supported,
> > > > > >     return phylink_validate_mac_and_pcs(pl, supported, state);
> > > > > >  }
> > > > > >=20
> > > > > > +static void phylink_fill_fixedlink_supported(unsigned long *su=
pported)
> > > > > > +{
> > > > > > +   linkmode_set_bit(ETHTOOL_LINK_MODE_10baseT_Half_BIT, suppor=
ted);
> > > > > > +   linkmode_set_bit(ETHTOOL_LINK_MODE_10baseT_Full_BIT, suppor=
ted);
> > > > > > +   linkmode_set_bit(ETHTOOL_LINK_MODE_100baseT_Half_BIT, suppo=
rted);
> > > > > > +   linkmode_set_bit(ETHTOOL_LINK_MODE_100baseT_Full_BIT, suppo=
rted);
> > > > > > +   linkmode_set_bit(ETHTOOL_LINK_MODE_1000baseT_Half_BIT, supp=
orted);
> > > > > > +   linkmode_set_bit(ETHTOOL_LINK_MODE_1000baseT_Full_BIT, supp=
orted);
> > > > > > +   linkmode_set_bit(ETHTOOL_LINK_MODE_2500baseT_Full_BIT, supp=
orted);
> > > > > > +   linkmode_set_bit(ETHTOOL_LINK_MODE_5000baseT_Full_BIT, supp=
orted);
> > > > > > +   linkmode_set_bit(ETHTOOL_LINK_MODE_10000baseT_Full_BIT, sup=
ported);
> > > > > > +}
> > > > > > +   =20
> > > > >=20
> > > > > Any chance we can go with a different route here than just locking
> > > > > fixed mode to being only for BaseT configurations?
> > > > >=20
> > > > > I am currently working on getting the fbnic driver up and running=
 and I
> > > > > am using fixed-link mode as a crutch until I can finish up enabli=
ng
> > > > > QSFP module support for phylink and this just knocked out the sup=
ported
> > > > > link modes as I was using 25CR, 50CR, 50CR2, and 100CR2.
> > > > >=20
> > > > > Seems like this should really be something handled by some sort of
> > > > > validation function rather than just forcing all devices using fi=
xed
> > > > > link to assume that they are BaseT. I know in our direct attached
> > > > > copper case we aren't running autoneg so that plan was to use fix=
ed
> > > > > link until we can add more flexibility by getting QSFP support go=
ing.   =20
> > > >=20
> > > > These baseT mode were for compatibility with the previous way to de=
al
> > > > with fixed links, but we can extend what's being report above 10G w=
ith
> > > > other modes. Indeed the above code unnecessarily restricts the
> > > > linkmodes. Can you tell me if the following patch works for you ?
> > > >=20
> > > > Maxime
> > > >=20
> > > > -----------
> > > >=20
> > > > From 595888afb23f209f2b1002d0b0406380195d53c1 Mon Sep 17 00:00:00 2=
001
> > > > From: Maxime Chevallier <maxime.chevallier@bootlin.com>
> > > > Date: Fri, 28 Mar 2025 08:53:00 +0100
> > > > Subject: [PATCH] net: phylink: Allow fixed-link registration above =
10G
> > > >=20
> > > > The blamed commit introduced a helper to keep the linkmodes reporte=
d by
> > > > fixed links identical to what they were before phy_caps. This means
> > > > filtering linkmodes only to report BaseT modes.
> > > >=20
> > > > Doing so, it also filtered out any linkmode above 10G. Reinstate the
> > > > reporting of linkmodes above 10G, where we report any linkmodes that
> > > > exist at these speeds.
> > > >=20
> > > > Reported-by: Alexander H Duyck <alexander.duyck@gmail.com>
> > > > Closes: https://lore.kernel.org/netdev/8d3a9c9bb76b1c6bc27d2bd01f48=
31b2cac83f7f.camel@gmail.com/
> > > > Fixes: de7d3f87be3c ("net: phylink: Use phy_caps_lookup for fixed-l=
ink configuration")
> > > > Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> > > > ---
> > > >  drivers/net/phy/phylink.c | 17 +++++++++++++----
> > > >  1 file changed, 13 insertions(+), 4 deletions(-)
> > > >=20
> > > > diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
> > > > index 69ca765485db..de90fed9c207 100644
> > > > --- a/drivers/net/phy/phylink.c
> > > > +++ b/drivers/net/phy/phylink.c
> > > > @@ -715,16 +715,25 @@ static int phylink_parse_fixedlink(struct phy=
link *pl,
> > > >                 phylink_warn(pl, "fixed link specifies half duplex =
for %dMbps link?\n",
> > > >                              pl->link_config.speed);
> > > >=20
> > > > -       linkmode_zero(pl->supported);
> > > > -       phylink_fill_fixedlink_supported(pl->supported);
> > > > +       linkmode_fill(pl->supported);
> > > >=20
> > > >         linkmode_copy(pl->link_config.advertising, pl->supported);
> > > >         phylink_validate(pl, pl->supported, &pl->link_config);
> > > >=20
> > > > +       phylink_fill_fixedlink_supported(match);
> > > > +   =20
> > >=20
> > > I worry that this might put you back into the same problem again with
> > > the older drivers. In addition it is filling in modes that shouldn't
> > > be present after the validation. =20
> >=20
> > Note that I'm not directly filling pl->supported here.
> >=20
> > [...]
> >=20
> >  	c =3D phy_caps_lookup(pl->link_config.speed, pl->link_config.duplex,
> >  			    pl->supported, true);
> > -	if (c)
> > -		linkmode_and(match, pl->supported, c->linkmodes);
> > +	if (c) {
> > +		/* Compatbility with the legacy behaviour : Report one single
> > +		 * BaseT mode for fixed-link speeds under or at 10G, or all
> > +		 * linkmodes at the speed/duplex for speeds over 10G
> > +		 */
> > +		if (linkmode_intersects(match, c->linkmodes))
> > +			linkmode_and(match, match, c->linkmodes);
> > +		else
> > +			linkmode_copy(match, c->linkmodes);
> > +	}
> >=20
> > [...]
> >=20
> > 	if (c) {
> > 		linkmode_or(pl->supported, pl->supported, match);
> > 		linkmode_or(pl->link_config.lp_advertising,
> > 			    pl->link_config.lp_advertising, match);
> > 	}
> >=20
> > For speeds above 10G, you will get all the modes for the requested
> > speed, so it should solve the issue in the next steps of your code
> > where you need matching linkmodes for your settings ? Did you give it a
> > try ?
> >=20
> > You may end up with too many linkmodes, but for fixed-link we don't
> > really expect these modes to precisely represent any real linkmodes =20
>=20
> Here is more the quick-n-dirty approach that I think does what you were
> trying to do without breaking stuff:
>=20
> diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
> index 16a1f31f0091..380e51c5bdaa 100644
> --- a/drivers/net/phy/phylink.c
> +++ b/drivers/net/phy/phylink.c
> @@ -713,17 +713,24 @@ static int phylink_parse_fixedlink(struct phylink *=
pl,
>                 phylink_warn(pl, "fixed link specifies half duplex for %d=
Mbps link?\n",
>                              pl->link_config.speed);
> =20
> -       linkmode_zero(pl->supported);
> -       phylink_fill_fixedlink_supported(pl->supported);
> -
> +       linkmode_fill(pl->supported);
>         linkmode_copy(pl->link_config.advertising, pl->supported);
>         phylink_validate(pl, pl->supported, &pl->link_config);
> =20
>         c =3D phy_caps_lookup(pl->link_config.speed, pl->link_config.dupl=
ex,
>                             pl->supported, true);
> -       if (c)
> +       if (c) {
>                 linkmode_and(match, pl->supported, c->linkmodes);
> =20
> +               /* Compatbility with the legacy behaviour:
> +                * Report one single BaseT mode.
> +                */
> +               phylink_fill_fixedlink_supported(mask);
> +               if (linkmode_intersects(match, mask))
> +                       linkmode_and(match, match, mask);
> +               linkmode_zero(mask);
> +       }
> +
>         linkmode_set_bit(ETHTOOL_LINK_MODE_Pause_BIT, mask);
>         linkmode_set_bit(ETHTOOL_LINK_MODE_Asym_Pause_BIT, mask);
>         linkmode_set_bit(ETHTOOL_LINK_MODE_Autoneg_BIT, mask);
>=20
> Basically we still need the value to be screened by the pl->supported.
> The one change is that we have to run the extra screening on the
> intersect instead of skipping the screening, or doing it before we even
> start providing bits.
>=20
> With this approach we will even allow people to use non twisted pair
> setups regardless of speed as long as they don't provide any twisted
> pair modes in the standard set.
>=20
> I will try to get this tested today and if it works out I will submit
> it for net. I just need to test this and an SFP ksettings_set issue I
> found when we aren't using autoneg.

That looks correct and indeed better than my patch, thanks for that :)

Feel free to send it indeed, I'll give it a try on the setups I have
here as well

Maxime

