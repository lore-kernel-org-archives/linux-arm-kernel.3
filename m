Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D50CC36018
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 15:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QWoRQ0u8OSafzgnHjL0rkdECIXv/ii6wOIMSgWZzu/A=; b=4LCzcSjQt3jnf3Ru+s4SyqhWAF
	ccvOFpHWGbhyMVTL1u6cWgut05tDIk2aBS2X61NqmgnwENY95DRGbcuksw+oeiptVf38+NuOlVlp+
	GkJCNzhyxuWHZuQkyQWNy3anMxCl1YtN8Yk1bfeg25RdJOAlIaBR2ZEbATk79gxDRPqXqGRYeKbLT
	nZGb5lqdhLB62jwRYJNr1aiNTWH4gnhbCz80eIOmB7Rmo0PLptLVo9xHNRR+Xz5HRAzw2/iMs0Ssn
	ejf6P8Z0liuSHZSkpv2XMx3y2eeQ/gq+qD6c89Q0EmNkeP7Fjh4BCewvOUiMHYytRiO93e42kf5Z5
	yCGAllKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzdZJ-00000003iuF-0Ozn;
	Tue, 01 Apr 2025 15:30:25 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzdXV-00000003icb-0RXX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Apr 2025 15:28:34 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-22403cbb47fso119044665ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Apr 2025 08:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743521312; x=1744126112; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=QWoRQ0u8OSafzgnHjL0rkdECIXv/ii6wOIMSgWZzu/A=;
        b=X4HfWGQe7N3J7i0e+7sPWUX2xeqfYZfX4f4tlcsPnJr8WcwvhYxqdVpN6fAoFVsEsh
         VnwTfTaoKT6+hQ3cHScF7ll4mvpeyIJHIuvRLownoIwlhYudbFUqFIjKwULUA1pj54n4
         5wmTk/yfqYZ6y65UAkyE8yOrASx8e7KyU4YxksOTRtwCjx1DrrocxHkhMaOe4vvV5YFQ
         zt0kQ9LHXGpFK/6spsUGuXF5ekSs1fHpWWv3AsY8zzegfLXigE0KJd3esoS3WLAlfRKg
         IqXUwENeItkzdT4N02/l0it53xkZAn4G3DdVQmwgBfY2XM32xFyt25sN9KL4s7limeW3
         aA6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743521312; x=1744126112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QWoRQ0u8OSafzgnHjL0rkdECIXv/ii6wOIMSgWZzu/A=;
        b=D3x2iscevX2dSpsPdmHdKhIQEd43FIBV5qeREnzGZ21BlmnQZtR7zEBd0WAF+cUGry
         8y58fDRV9X2xbidbqUMGnK7yIhS4DkQ+tZXYrNtbSgbB/8ptKeMlHUU7XRmXErOP6+NI
         nzcbG/bMNctTjWznxVSBDcengX6jGq9lAUUniMqdi9LLKtHSBZpIaWvQK6d3xrAwiHva
         ozEnlxtC13PnzIMRtNYbNXAtiHxTTlQf5Yyam+ByN7PqI7pTUNfc5BXH/yL4OZtJbDIM
         uL162J4T6ZjHauo8Z6GSUrRbsMewAtqDRUC1hz8mLPTOws3DUJoa+yd9grmY3b3eoyxj
         cHMg==
X-Forwarded-Encrypted: i=1; AJvYcCWWwWIQTjw++jUD5q79/Fbl1ahzSlWrSQfthhXt9dJbqu7XOeMTKAgp6iLJ1GuNstLR+7NPL8BL7KTXm8/8N9ok@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3ENVNCpyraP+0MCd4HRLPHFpEQDkHT8sAfOlbjjwu9OEjqLx8
	MBeo0s6vV4QxazrhT/KExerYmrEUlIuqQJld5U8I/h6CArS4n9DV
X-Gm-Gg: ASbGnctfsMsrdvaO/v4wXjEs6L8zmpjtIuWRMBu9ojHFyQd2LI3HMxuw7ousZa9gGTG
	mb8bzBmavltN0J7HcsgNdOyy9/v+oRWCBnnsJP17BkV73BqNJr2K34/tWzzFQCZTLXWrqf602Xl
	d6N6wNOveSOPfOvRahmTyyuxtzuput4YeVyBQqS1m3qVUcmnJKgTvLcrEOaxlJTHmU7mQIGXZto
	8qtPufmHyNTtnlJFUImvbKpJneiMy5TaY51hnTzqCYtdi4ZgBpkn9D1bnSURBG9fI9/Dgt2ZDXG
	NrKyM4lhlmouC6VaRXJ6lF/THdn3Gx6siPSWdQR67sc1jdVxlJgYos+0zDKTi9VN8yGBuuw7F8W
	Yi7Hr/HV8/+hj3udKa4pln6gD
X-Google-Smtp-Source: AGHT+IEoyq6eWRZ10eRzbU6lc1mU8jyJ+JmDPIL8wHVPlaY78fQ2mYq34IsqtsHOAz3s29OhpbqapQ==
X-Received: by 2002:a17:902:f549:b0:224:a74:28cd with SMTP id d9443c01a7336-2292f9767camr203073785ad.31.1743521311689;
        Tue, 01 Apr 2025 08:28:31 -0700 (PDT)
Received: from ?IPv6:2605:59c8:829:4c00:82ee:73ff:fe41:9a02? ([2605:59c8:829:4c00:82ee:73ff:fe41:9a02])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2291f1f7cc2sm89178845ad.258.2025.04.01.08.28.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 08:28:31 -0700 (PDT)
Message-ID: <3517cb7b3b10c29a6bf407f2e35fdebaf7a271e3.camel@gmail.com>
Subject: Re: [PATCH net-next v5 09/13] net: phylink: Use phy_caps_lookup for
 fixed-link configuration
From: Alexander H Duyck <alexander.duyck@gmail.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: davem@davemloft.net, Andrew Lunn <andrew@lunn.ch>, Jakub Kicinski
 <kuba@kernel.org>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Russell King <linux@armlinux.org.uk>, Heiner Kallweit
 <hkallweit1@gmail.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org,  thomas.petazzoni@bootlin.com,
 linux-arm-kernel@lists.infradead.org,  Christophe Leroy
 <christophe.leroy@csgroup.eu>, Herve Codina <herve.codina@bootlin.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean
 <vladimir.oltean@nxp.com>,  =?ISO-8859-1?Q?K=F6ry?= Maincent
 <kory.maincent@bootlin.com>, Oleksij Rempel <o.rempel@pengutronix.de>,
 Simon Horman <horms@kernel.org>, Romain Gantois <romain.gantois@bootlin.com>
Date: Tue, 01 Apr 2025 08:28:29 -0700
In-Reply-To: <20250331091449.155e14a4@fedora-2.home>
References: <20250307173611.129125-1-maxime.chevallier@bootlin.com>
	 <20250307173611.129125-10-maxime.chevallier@bootlin.com>
	 <8d3a9c9bb76b1c6bc27d2bd01f4831b2cac83f7f.camel@gmail.com>
	 <20250328090621.2d0b3665@fedora-2.home>
	 <CAKgT0Ue_JzmJAPKBhe6XaMkDCy+YNNg5_5VvzOR6CCbqcaQg3Q@mail.gmail.com>
	 <20250331091449.155e14a4@fedora-2.home>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_082833_148252_B52C0880 
X-CRM114-Status: GOOD (  57.45  )
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

On Mon, 2025-03-31 at 09:14 +0200, Maxime Chevallier wrote:
> On Fri, 28 Mar 2025 14:03:54 -0700
> Alexander Duyck <alexander.duyck@gmail.com> wrote:
>=20
> > On Fri, Mar 28, 2025 at 1:06=E2=80=AFAM Maxime Chevallier
> > <maxime.chevallier@bootlin.com> wrote:
> > >=20
> > > On Thu, 27 Mar 2025 18:16:00 -0700
> > > Alexander H Duyck <alexander.duyck@gmail.com> wrote:
> > > =20
> > > > On Fri, 2025-03-07 at 18:36 +0100, Maxime Chevallier wrote: =20
> > > > > When phylink creates a fixed-link configuration, it finds a match=
ing
> > > > > linkmode to set as the advertised, lp_advertising and supported m=
odes
> > > > > based on the speed and duplex of the fixed link.
> > > > >=20
> > > > > Use the newly introduced phy_caps_lookup to get these modes inste=
ad of
> > > > > phy_lookup_settings(). This has the side effect that the matched
> > > > > settings and configured linkmodes may now contain several linkmod=
es (the
> > > > > intersection of supported linkmodes from the phylink settings and=
 the
> > > > > linkmodes that match speed/duplex) instead of the one from
> > > > > phy_lookup_settings().
> > > > >=20
> > > > > Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> > > > > ---
> > > > >  drivers/net/phy/phylink.c | 44 +++++++++++++++++++++++++++------=
------
> > > > >  1 file changed, 31 insertions(+), 13 deletions(-)
> > > > >=20
> > > > > diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.=
c
> > > > > index cf9f019382ad..8e2b7d647a92 100644
> > > > > --- a/drivers/net/phy/phylink.c
> > > > > +++ b/drivers/net/phy/phylink.c
> > > > > @@ -802,12 +802,26 @@ static int phylink_validate(struct phylink =
*pl, unsigned long *supported,
> > > > >     return phylink_validate_mac_and_pcs(pl, supported, state);
> > > > >  }
> > > > >=20
> > > > > +static void phylink_fill_fixedlink_supported(unsigned long *supp=
orted)
> > > > > +{
> > > > > +   linkmode_set_bit(ETHTOOL_LINK_MODE_10baseT_Half_BIT, supporte=
d);
> > > > > +   linkmode_set_bit(ETHTOOL_LINK_MODE_10baseT_Full_BIT, supporte=
d);
> > > > > +   linkmode_set_bit(ETHTOOL_LINK_MODE_100baseT_Half_BIT, support=
ed);
> > > > > +   linkmode_set_bit(ETHTOOL_LINK_MODE_100baseT_Full_BIT, support=
ed);
> > > > > +   linkmode_set_bit(ETHTOOL_LINK_MODE_1000baseT_Half_BIT, suppor=
ted);
> > > > > +   linkmode_set_bit(ETHTOOL_LINK_MODE_1000baseT_Full_BIT, suppor=
ted);
> > > > > +   linkmode_set_bit(ETHTOOL_LINK_MODE_2500baseT_Full_BIT, suppor=
ted);
> > > > > +   linkmode_set_bit(ETHTOOL_LINK_MODE_5000baseT_Full_BIT, suppor=
ted);
> > > > > +   linkmode_set_bit(ETHTOOL_LINK_MODE_10000baseT_Full_BIT, suppo=
rted);
> > > > > +}
> > > > > + =20
> > > >=20
> > > > Any chance we can go with a different route here than just locking
> > > > fixed mode to being only for BaseT configurations?
> > > >=20
> > > > I am currently working on getting the fbnic driver up and running a=
nd I
> > > > am using fixed-link mode as a crutch until I can finish up enabling
> > > > QSFP module support for phylink and this just knocked out the suppo=
rted
> > > > link modes as I was using 25CR, 50CR, 50CR2, and 100CR2.
> > > >=20
> > > > Seems like this should really be something handled by some sort of
> > > > validation function rather than just forcing all devices using fixe=
d
> > > > link to assume that they are BaseT. I know in our direct attached
> > > > copper case we aren't running autoneg so that plan was to use fixed
> > > > link until we can add more flexibility by getting QSFP support goin=
g. =20
> > >=20
> > > These baseT mode were for compatibility with the previous way to deal
> > > with fixed links, but we can extend what's being report above 10G wit=
h
> > > other modes. Indeed the above code unnecessarily restricts the
> > > linkmodes. Can you tell me if the following patch works for you ?
> > >=20
> > > Maxime
> > >=20
> > > -----------
> > >=20
> > > From 595888afb23f209f2b1002d0b0406380195d53c1 Mon Sep 17 00:00:00 200=
1
> > > From: Maxime Chevallier <maxime.chevallier@bootlin.com>
> > > Date: Fri, 28 Mar 2025 08:53:00 +0100
> > > Subject: [PATCH] net: phylink: Allow fixed-link registration above 10=
G
> > >=20
> > > The blamed commit introduced a helper to keep the linkmodes reported =
by
> > > fixed links identical to what they were before phy_caps. This means
> > > filtering linkmodes only to report BaseT modes.
> > >=20
> > > Doing so, it also filtered out any linkmode above 10G. Reinstate the
> > > reporting of linkmodes above 10G, where we report any linkmodes that
> > > exist at these speeds.
> > >=20
> > > Reported-by: Alexander H Duyck <alexander.duyck@gmail.com>
> > > Closes: https://lore.kernel.org/netdev/8d3a9c9bb76b1c6bc27d2bd01f4831=
b2cac83f7f.camel@gmail.com/
> > > Fixes: de7d3f87be3c ("net: phylink: Use phy_caps_lookup for fixed-lin=
k configuration")
> > > Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> > > ---
> > >  drivers/net/phy/phylink.c | 17 +++++++++++++----
> > >  1 file changed, 13 insertions(+), 4 deletions(-)
> > >=20
> > > diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
> > > index 69ca765485db..de90fed9c207 100644
> > > --- a/drivers/net/phy/phylink.c
> > > +++ b/drivers/net/phy/phylink.c
> > > @@ -715,16 +715,25 @@ static int phylink_parse_fixedlink(struct phyli=
nk *pl,
> > >                 phylink_warn(pl, "fixed link specifies half duplex fo=
r %dMbps link?\n",
> > >                              pl->link_config.speed);
> > >=20
> > > -       linkmode_zero(pl->supported);
> > > -       phylink_fill_fixedlink_supported(pl->supported);
> > > +       linkmode_fill(pl->supported);
> > >=20
> > >         linkmode_copy(pl->link_config.advertising, pl->supported);
> > >         phylink_validate(pl, pl->supported, &pl->link_config);
> > >=20
> > > +       phylink_fill_fixedlink_supported(match);
> > > + =20
> >=20
> > I worry that this might put you back into the same problem again with
> > the older drivers. In addition it is filling in modes that shouldn't
> > be present after the validation.
>=20
> Note that I'm not directly filling pl->supported here.
>=20
> [...]
>=20
>  	c =3D phy_caps_lookup(pl->link_config.speed, pl->link_config.duplex,
>  			    pl->supported, true);
> -	if (c)
> -		linkmode_and(match, pl->supported, c->linkmodes);
> +	if (c) {
> +		/* Compatbility with the legacy behaviour : Report one single
> +		 * BaseT mode for fixed-link speeds under or at 10G, or all
> +		 * linkmodes at the speed/duplex for speeds over 10G
> +		 */
> +		if (linkmode_intersects(match, c->linkmodes))
> +			linkmode_and(match, match, c->linkmodes);
> +		else
> +			linkmode_copy(match, c->linkmodes);
> +	}
>=20
> [...]
>=20
> 	if (c) {
> 		linkmode_or(pl->supported, pl->supported, match);
> 		linkmode_or(pl->link_config.lp_advertising,
> 			    pl->link_config.lp_advertising, match);
> 	}
>=20
> For speeds above 10G, you will get all the modes for the requested
> speed, so it should solve the issue in the next steps of your code
> where you need matching linkmodes for your settings ? Did you give it a
> try ?
>=20
> You may end up with too many linkmodes, but for fixed-link we don't
> really expect these modes to precisely represent any real linkmodes

Here is more the quick-n-dirty approach that I think does what you were
trying to do without breaking stuff:

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 16a1f31f0091..380e51c5bdaa 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -713,17 +713,24 @@ static int phylink_parse_fixedlink(struct phylink *pl=
,
                phylink_warn(pl, "fixed link specifies half duplex for %dMb=
ps link?\n",
                             pl->link_config.speed);
=20
-       linkmode_zero(pl->supported);
-       phylink_fill_fixedlink_supported(pl->supported);
-
+       linkmode_fill(pl->supported);
        linkmode_copy(pl->link_config.advertising, pl->supported);
        phylink_validate(pl, pl->supported, &pl->link_config);
=20
        c =3D phy_caps_lookup(pl->link_config.speed, pl->link_config.duplex=
,
                            pl->supported, true);
-       if (c)
+       if (c) {
                linkmode_and(match, pl->supported, c->linkmodes);
=20
+               /* Compatbility with the legacy behaviour:
+                * Report one single BaseT mode.
+                */
+               phylink_fill_fixedlink_supported(mask);
+               if (linkmode_intersects(match, mask))
+                       linkmode_and(match, match, mask);
+               linkmode_zero(mask);
+       }
+
        linkmode_set_bit(ETHTOOL_LINK_MODE_Pause_BIT, mask);
        linkmode_set_bit(ETHTOOL_LINK_MODE_Asym_Pause_BIT, mask);
        linkmode_set_bit(ETHTOOL_LINK_MODE_Autoneg_BIT, mask);

Basically we still need the value to be screened by the pl->supported.
The one change is that we have to run the extra screening on the
intersect instead of skipping the screening, or doing it before we even
start providing bits.

With this approach we will even allow people to use non twisted pair
setups regardless of speed as long as they don't provide any twisted
pair modes in the standard set.

I will try to get this tested today and if it works out I will submit
it for net. I just need to test this and an SFP ksettings_set issue I
found when we aren't using autoneg.

