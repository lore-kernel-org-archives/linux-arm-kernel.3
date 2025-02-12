Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B1E5C021A5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 08:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LIgUAEyu8qolGLYGKy5KFxfJEdAWp4C5nM5+ktv2GAc=; b=M7hhlDyI3TPT40f1kLZsVjMELu
	95IQli3bkfhJULT6TcBV4m1eahiMrUOsC2sT2l40jskupStE6flFQEfK+nI9S+rJp0eHDrpQNwLJO
	hW76yWqb1DLcXMpj+iZO5vhljYPgzDz0qxJsZ7agGgjl6/WD6zcSN40cFCIf30p7x1L8qlbvsD+1O
	S3yMio/ooDWeRNQmsuITKx4p1LtHW9VPzZSoerxf/9WC2fXyW8Wm9lITUpbXHd0VvelXNx4l3MVDT
	A/6xi6qPSYJtiQ5F/Yj2CLNRRTKz5b1FHM+tiA1bVVQc8SAXuszOChLiptzYBxucdEVBo6j12acDB
	Be9xhmxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ti8A2-00000006dVG-1Rxv;
	Wed, 12 Feb 2025 08:31:58 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ti83v-00000006c6X-3RHu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 08:25:42 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 05D781F764;
	Wed, 12 Feb 2025 08:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1739348736;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LIgUAEyu8qolGLYGKy5KFxfJEdAWp4C5nM5+ktv2GAc=;
	b=IHMcyV8h5M35NbOnH2TZErLdEosb8U02k4tCGIImqJ6EV8fbbMmqTqCSKzDlZNQo8Wco1u
	8uW+ROGU8eRUvgKrTKcurNmd2W10HGBEpwW0z9NF8d9FLXtU5HCfk7IUsYrohzGnKwDJH/
	mvqcKl/1z/1VcISm8IA6+Uut6geE5JyF94KQeCR+MEcMgN4s3nIixUtJ8/odC9NJQoU2si
	pcqia8BfBySgTwAGCzLxkT8sXSxSziBm85Yt5lwjY9SLKjyVbID5IbK8Pwil388Vr/AVaH
	lCL0i74qj6/yahizFabye0IMDx90ma4miNOaUEi5xFbzbXHjSJFe/lMsUrjPBg==
Date: Wed, 12 Feb 2025 09:25:26 +0100
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Kory Maincent <kory.maincent@bootlin.com>
Cc: davem@davemloft.net, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 thomas.petazzoni@bootlin.com, Andrew Lunn <andrew@lunn.ch>, Jakub Kicinski
 <kuba@kernel.org>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Russell King <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Herve Codina <herve.codina@bootlin.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Heiner Kallweit
 <hkallweit1@gmail.com>, Vladimir Oltean <vladimir.oltean@nxp.com>, Marek
 =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>, Oleksij Rempel
 <o.rempel@pengutronix.de>, =?UTF-8?B?Tmljb2zDsg==?= Veronese
 <nicveronese@gmail.com>, Simon Horman <horms@kernel.org>,
 mwojtas@chromium.org, Antoine Tenart <atenart@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>
Subject: Re: [PATCH net-next RFC v2 2/6] net: ethtool: Introduce
 ETHTOOL_LINK_MEDIUM_* values
Message-ID: <20250212092526.544fb80e@fedora.home>
In-Reply-To: <20250211130830.25dbafb3@fedora.home>
References: <20250122174252.82730-1-maxime.chevallier@bootlin.com>
	<20250122174252.82730-3-maxime.chevallier@bootlin.com>
	<20250123103534.1ca273af@kmaincent-XPS-13-7390>
	<20250211130830.25dbafb3@fedora.home>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdegfeeflecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthhqredtredtjeenucfhrhhomhepofgrgihimhgvucevhhgvvhgrlhhlihgvrhcuoehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeuhfefgffgtdfhgffhvdfhhffhteeutdektefghfetveehheejjefgudeiudehudenucfkphepvdgrtddumegtsgduleemkegugegtmeelfhdttdemsggtvddumeekkeelleemheegtdgtmegvheelvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudelmeekugegtgemlehftddtmegstgdvudemkeekleelmeehgedttgemvgehlegvpdhhvghlohepfhgvughorhgrrdhhohhmvgdpmhgrihhlfhhrohhmpehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedviedprhgtphhtthhopehkohhrhidrmhgrihhntggvnhhtsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvthdprhgtphhtthhopehnvghtuggvvhesvhhgvghrrdhkvghrn
 hgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopeguvghvihgtvghtrhgvvgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopegrnhgurhgvfieslhhunhhnrdgthhdprhgtphhtthhopehkuhgsrgeskhgvrhhnvghlrdhorhhg
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_002539_989514_77A16AFC 
X-CRM114-Status: GOOD (  24.30  )
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

Hi again K=C3=B6ry,

> Hi K=C3=B6ry,
>=20
> On Thu, 23 Jan 2025 10:35:34 +0100
> Kory Maincent <kory.maincent@bootlin.com> wrote:
>=20
> > On Wed, 22 Jan 2025 18:42:47 +0100
> > Maxime Chevallier <maxime.chevallier@bootlin.com> wrote:
> >  =20
> > > In an effort to have a better representation of Ethernet ports,
> > > introduce enumeration values representing the various ethernet Medium=
s.
> > >=20
> > > This is part of the 802.3 naming convention, for example :
> > >=20
> > > 1000 Base T 4
> > >  |    |   | |
> > >  |    |   | \_ lanes (4)
> > >  |    |   \___ Medium (T =3D=3D Twisted Copper Pairs)
> > >  |    \_______ Baseband transmission
> > >  \____________ Speed
> > >=20
> > >  Other example :
> > >=20
> > > 10000 Base K X 4
> > >            | | \_ lanes (4)
> > >            | \___ encoding (BaseX is 8b/10b while BaseR is 66b/64b)
> > >            \_____ Medium (K is backplane ethernet)
> > >=20
> > > In the case of representing a physical port, only the medium and numb=
er
> > > of lanes should be relevant. One exception would be 1000BaseX, which =
is
> > > currently also used as a medium in what appears to be any of
> > > 1000BaseSX, 1000BaseFX, 1000BaseCX and 1000BaseLX.   =20
> >=20
> >=20
> >  =20
> > > -	__DEFINE_LINK_MODE_PARAMS(100, T, Half),
> > > -	__DEFINE_LINK_MODE_PARAMS(100, T, Full),
> > > -	__DEFINE_LINK_MODE_PARAMS(1000, T, Half),
> > > -	__DEFINE_LINK_MODE_PARAMS(1000, T, Full),
> > > +	__DEFINE_LINK_MODE_PARAMS_LANES(10, T, 2, 4, Half, T),
> > > +	__DEFINE_LINK_MODE_PARAMS_LANES(10, T, 2, 4, Full, T),
> > > +	__DEFINE_LINK_MODE_PARAMS_LANES(100, T, 2, 4, Half, T),
> > > +	__DEFINE_LINK_MODE_PARAMS_LANES(100, T, 2, 4, Full, T),   =20
> >=20
> >  =20
> > > -	__DEFINE_LINK_MODE_PARAMS(1000, KX, Full),
> > > -	__DEFINE_LINK_MODE_PARAMS(10000, KX4, Full),
> > > -	__DEFINE_LINK_MODE_PARAMS(10000, KR, Full),
> > > +	__DEFINE_LINK_MODE_PARAMS(1000, KX, Full, K),
> > > +	__DEFINE_LINK_MODE_PARAMS(10000, KX4, Full, K),
> > > +	__DEFINE_LINK_MODE_PARAMS(10000, KR, Full, K),   =20
> >=20
> > The medium information is used twice.
> > Maybe we could redefine the __DEFINE_LINK_MODE_PARAMS like this to avoid
> > redundant information:
> > #define __DEFINE_LINK_MODE_PARAMS(_speed, _medium, _encoding, _lanes, _=
duplex)
> >=20
> > And something like this when the lanes are not a fix number:
> > #define __DEFINE_LINK_MODE_PARAMS_LANES_RANGE(_speed, _medium, _encodin=
g,
> > _min_lanes, _max_lanes, _duplex)
> >=20
> > Then we can remove all the __LINK_MODE_LANES_XX defines which may be
> > wrong as you have spotted in patch 1. =20
>=20
> I will give this a try, see hw this looks, so that we can separate the
> encoding info from the medium info.

So I did give it a go, but it turns out to be much more complex than
expected... The _type information from definitions like :

__DEFINE_LINK_MODE_PARAMS(10000, KX4, Full, K),

(here _type is KX4) can't really be split into the individual
attributes <Medium, Encoding, Lanes> without having some complex macro
logic. This type is used to convert to actual linkmodes that already
exist in the kernel :

#define ETHTOOL_LINK_MODE(speed, type, duplex) \
	ETHTOOL_LINK_MODE_ ## speed ## base ## type ## _ ## duplex ## _BIT

Say we want to generate the _type from <Medium, Encoding, Lanes> with a
macro, we have to cover all the weird cases :

1000BaseT =3D> No encoding, no lanes
10000BaseKX4 =3D> K medium, X encoding, 4 lanes
10000BeseKX =3D> K medium, X encding, no lanes (which means 1 lane)
1000BaseX =3D> Just encoding
100000BaseLR4_ER4 =3D> One link mode that applies for 2 mediums ?

While doable, this will probably end-up more complex and hard to
maintain than re-specifying the medium :(

Maxime

