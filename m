Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A90CC0219B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 12:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VjM6wR9lV3rjjatXl5KU7qPYxVjUzsxsOmxpjHWtsxE=; b=ZQkvhTAWfPqfapoKXiFNdjB6jt
	iIix55WhM6F6kjPglW7KPu2YsvVBd7MhZzizf5i6jimz3IW9Xt9A9wzAMwaFXIH4leueuXd1OZzqg
	mAhopmOP3mnaqKxiucdtD/Yw1iuWLpJ/GFDR+yiJ/GU5j/4aSAjx6vA2b1Nrw8MThWocAd3i3rXyT
	2SHY8KMSg+S9ISxx1P5fqtiW3d0SOcmeI39qBOjgX6HOb8kQGDxLaGvT5/FNclor6LxEu9164XnUw
	P2pgdGAn4PhSjT94hGs3Uv4C0NEG0qRgVjX8tZvfxJAqatU/0s/80pFq1Ow7NrUrkneiw8BcgorXw
	49h1a1dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thpm7-00000003qUI-49BL;
	Tue, 11 Feb 2025 12:54:04 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thp49-00000003hJq-21p8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 12:08:39 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6626844206;
	Tue, 11 Feb 2025 12:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1739275714;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VjM6wR9lV3rjjatXl5KU7qPYxVjUzsxsOmxpjHWtsxE=;
	b=VtAkFhbAS3bE2SKQENlezoNTiJPUHb07Kf/zDfc78REU3jItmxKRYLPJXAWRl0MAWXM5Tz
	1jjoLHWM7IG3BzdF0j123Sd1yOWtYhtkcMuI+UfkXSukxFEuSvm5RYxA9glWHiaqVtgW7G
	u9GmyyhmyZbKpcJeO4FPAs04Un2a1ostkVoNzl7nH96RcHRBQsmPDhFmSwmmCh7iU8k2eH
	9kcKRXACG7Tr/uuw+gmeobox7XiENpzstu6KHVfN6YcUCRmrf/h1cIkwqXnQLs2aAy91x6
	7Pi6tZorp7z5MpMK+TRD+yZS4jZOOrQduOywVRol1FFn/uYHWG77M9Zx7IyViw==
Date: Tue, 11 Feb 2025 13:08:30 +0100
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
Message-ID: <20250211130830.25dbafb3@fedora.home>
In-Reply-To: <20250123103534.1ca273af@kmaincent-XPS-13-7390>
References: <20250122174252.82730-1-maxime.chevallier@bootlin.com>
	<20250122174252.82730-3-maxime.chevallier@bootlin.com>
	<20250123103534.1ca273af@kmaincent-XPS-13-7390>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdegtdeliecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthhqredtredtjeenucfhrhhomhepofgrgihimhgvucevhhgvvhgrlhhlihgvrhcuoehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeuhfefgffgtdfhgffhvdfhhffhteeutdektefghfetveehheejjefgudeiudehudenucfkphepvdgrtddumegtsgduleemkegugegtmeelfhdttdemsggtvddumeekkeelleemheegtdgtmegvheelvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudelmeekugegtgemlehftddtmegstgdvudemkeekleelmeehgedttgemvgehlegvpdhhvghlohepfhgvughorhgrrdhhohhmvgdpmhgrihhlfhhrohhmpehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedviedprhgtphhtthhopehkohhrhidrmhgrihhntggvnhhtsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvthdprhgtphhtthhopehnvghtuggvvhesvhhgvghrrdhkvghrn
 hgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopeguvghvihgtvghtrhgvvgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopegrnhgurhgvfieslhhunhhnrdgthhdprhgtphhtthhopehkuhgsrgeskhgvrhhnvghlrdhorhhg
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_040838_257868_1D023657 
X-CRM114-Status: GOOD (  19.25  )
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

Hi K=C3=B6ry,

On Thu, 23 Jan 2025 10:35:34 +0100
Kory Maincent <kory.maincent@bootlin.com> wrote:

> On Wed, 22 Jan 2025 18:42:47 +0100
> Maxime Chevallier <maxime.chevallier@bootlin.com> wrote:
>=20
> > In an effort to have a better representation of Ethernet ports,
> > introduce enumeration values representing the various ethernet Mediums.
> >=20
> > This is part of the 802.3 naming convention, for example :
> >=20
> > 1000 Base T 4
> >  |    |   | |
> >  |    |   | \_ lanes (4)
> >  |    |   \___ Medium (T =3D=3D Twisted Copper Pairs)
> >  |    \_______ Baseband transmission
> >  \____________ Speed
> >=20
> >  Other example :
> >=20
> > 10000 Base K X 4
> >            | | \_ lanes (4)
> >            | \___ encoding (BaseX is 8b/10b while BaseR is 66b/64b)
> >            \_____ Medium (K is backplane ethernet)
> >=20
> > In the case of representing a physical port, only the medium and number
> > of lanes should be relevant. One exception would be 1000BaseX, which is
> > currently also used as a medium in what appears to be any of
> > 1000BaseSX, 1000BaseFX, 1000BaseCX and 1000BaseLX. =20
>=20
>=20
>=20
> > -	__DEFINE_LINK_MODE_PARAMS(100, T, Half),
> > -	__DEFINE_LINK_MODE_PARAMS(100, T, Full),
> > -	__DEFINE_LINK_MODE_PARAMS(1000, T, Half),
> > -	__DEFINE_LINK_MODE_PARAMS(1000, T, Full),
> > +	__DEFINE_LINK_MODE_PARAMS_LANES(10, T, 2, 4, Half, T),
> > +	__DEFINE_LINK_MODE_PARAMS_LANES(10, T, 2, 4, Full, T),
> > +	__DEFINE_LINK_MODE_PARAMS_LANES(100, T, 2, 4, Half, T),
> > +	__DEFINE_LINK_MODE_PARAMS_LANES(100, T, 2, 4, Full, T), =20
>=20
>=20
> > -	__DEFINE_LINK_MODE_PARAMS(1000, KX, Full),
> > -	__DEFINE_LINK_MODE_PARAMS(10000, KX4, Full),
> > -	__DEFINE_LINK_MODE_PARAMS(10000, KR, Full),
> > +	__DEFINE_LINK_MODE_PARAMS(1000, KX, Full, K),
> > +	__DEFINE_LINK_MODE_PARAMS(10000, KX4, Full, K),
> > +	__DEFINE_LINK_MODE_PARAMS(10000, KR, Full, K), =20
>=20
> The medium information is used twice.
> Maybe we could redefine the __DEFINE_LINK_MODE_PARAMS like this to avoid
> redundant information:
> #define __DEFINE_LINK_MODE_PARAMS(_speed, _medium, _encoding, _lanes, _du=
plex)
>=20
> And something like this when the lanes are not a fix number:
> #define __DEFINE_LINK_MODE_PARAMS_LANES_RANGE(_speed, _medium, _encoding,
> _min_lanes, _max_lanes, _duplex)
>=20
> Then we can remove all the __LINK_MODE_LANES_XX defines which may be
> wrong as you have spotted in patch 1.

My apologies, I missed your review and didn't address it in the new
iteration :(

I will give this a try, see hw this looks, so that we can separate the
encoding info from the medium info.

Thanks !

Maxime

> Regards,


