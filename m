Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DAC7C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 14:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EPcHCivrgVNEm/ByMHyUufAZZi+qh9K6loCNTwKX1V0=; b=4Y0Y7bYb07Stm65NQnLFYBLhOW
	pux7lCFTo7KdaonTI5Y7EWcrb7oYetg86+0qSvSHHluKLK5CtM2Scw5QbC2Fkydk3mgdxPVmH0qIv
	DbNnxhtxWj3eco00uolhbMgFyGx7j5N10QdKZnL2hnSA5bO0KAwQ5ckvcRbDTntmrPe3ZcVLds9QZ
	4StpvlugLCDfMbSnDQ7g8ZGPqesrdrgY6NR9j67SVrWQsXKLL+/L5uTjIJGOhVor7ME4jI2JXZpAD
	hhoF9M0Q1y7czqt4AQvRchuSyPR9PjH+8shdKZD1zw8Ev0/eDdORo7SZJIj6osXcXo5IgJwLqzctN
	23bBF7gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmZYe-0000000E7Dn-3EDl;
	Mon, 24 Feb 2025 14:35:44 +0000
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmZ4f-0000000E13Y-3QT3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 14:04:47 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3F66F44124;
	Mon, 24 Feb 2025 14:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1740405882;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EPcHCivrgVNEm/ByMHyUufAZZi+qh9K6loCNTwKX1V0=;
	b=FaCKg6csEf5Yj70+AItRKH2YVOKtzEd4JKrPyZsWGELHjx66vdfqN0tMT1FtlsZ9tuZYmY
	3gavhs9ZLYl1nbadbctHOZOmYWNhLMKjRVHVUhYjaB2R2QChme68lbkXqTmrZOj1Svq6ba
	EZOwMv91cOBXdNfC5RyG1h5743HAX9fE6D/s4iDD1lJUx45mvoTtjqcFAZBf5sV4H94BGr
	/HaRDCgYqGsEcU6qlLCyfRSeooFiNZjT/4TJ/A6fZA96OB5UAMCTthxFLpwrqpUuhRZjn0
	9wG9wvNqrwseXAx/l5B8CZcJ5PF+36yiFq6y1RwYjO3nuHE/T/+r6t18Pai+ZQ==
Date: Mon, 24 Feb 2025 15:04:40 +0100
From: Kory Maincent <kory.maincent@bootlin.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>, davem@davemloft.net,
 Andrew Lunn <andrew@lunn.ch>, Jakub Kicinski <kuba@kernel.org>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Heiner
 Kallweit <hkallweit1@gmail.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com,
 linux-arm-kernel@lists.infradead.org, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Herve Codina <herve.codina@bootlin.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean
 <vladimir.oltean@nxp.com>, Oleksij Rempel <o.rempel@pengutronix.de>, Simon
 Horman <horms@kernel.org>, Romain Gantois <romain.gantois@bootlin.com>
Subject: Re: [PATCH net-next 12/13] net: phy: phylink: Use phy_caps_lookup
 for fixed-link configuration
Message-ID: <20250224150440.7fe5458d@kmaincent-XPS-13-7390>
In-Reply-To: <Z7x52C5dE3eXWomq@shell.armlinux.org.uk>
References: <20250222142727.894124-1-maxime.chevallier@bootlin.com>
	<20250222142727.894124-13-maxime.chevallier@bootlin.com>
	<20250224144431.2dca9d19@kmaincent-XPS-13-7390>
	<Z7x52C5dE3eXWomq@shell.armlinux.org.uk>
Organization: bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdejkeeljecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthhqredtredtjeenucfhrhhomhepmfhorhihucforghinhgtvghnthcuoehkohhrhidrmhgrihhntggvnhhtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpefguddtfeevtddugeevgfevtdfgvdfhtdeuleetffefffffhffgteekvdefudeiieenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghlohepkhhmrghinhgtvghnthdqigfrufdqudefqdejfeeltddpmhgrihhlfhhrohhmpehkohhrhidrmhgrihhntggvnhhtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeduledprhgtphhtthhopehlihhnuhigsegrrhhmlhhinhhugidrohhrghdruhhkpdhrtghpthhtohepmhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomhdprhgtphhtthhopegurghvvghmsegurghvvghmlhhofhhtrdhnvghtpdhrtghpthhtoheprghnughrvgifsehluhhnnhdrtghhpdhrt
 ghpthhtohepkhhusggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegvughumhgriigvthesghhoohhglhgvrdgtohhmpdhrtghpthhtohepphgrsggvnhhisehrvgguhhgrthdrtghomhdprhgtphhtthhopehhkhgrlhhlfigvihhtudesghhmrghilhdrtghomh
X-GND-Sasl: kory.maincent@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_060446_300867_03D31823 
X-CRM114-Status: GOOD (  23.62  )
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

On Mon, 24 Feb 2025 13:53:28 +0000
"Russell King (Oracle)" <linux@armlinux.org.uk> wrote:

> On Mon, Feb 24, 2025 at 02:44:31PM +0100, Kory Maincent wrote:
> > On Sat, 22 Feb 2025 15:27:24 +0100
> > Maxime Chevallier <maxime.chevallier@bootlin.com> wrote:
> >  =20
> > > When phylink creates a fixed-link configuration, it finds a matching
> > > linkmode to set as the advertised, lp_advertising and supported modes
> > > based on the speed and duplex of the fixed link.
> > >=20
> > > Use the newly introduced phy_caps_lookup to get these modes instead of
> > > phy_lookup_settings(). This has the side effect that the matched
> > > settings and configured linkmodes may now contain several linkmodes (=
the
> > > intersection of supported linkmodes from the phylink settings and the
> > > linkmodes that match speed/duplex) instead of the one from
> > > phy_lookup_settings(). =20
> >=20
> > ...
> >  =20
> > > =20
> > >  	linkmode_set_bit(ETHTOOL_LINK_MODE_Pause_BIT, mask);
> > >  	linkmode_set_bit(ETHTOOL_LINK_MODE_Asym_Pause_BIT, mask);
> > > @@ -588,9 +591,9 @@ static int phylink_parse_fixedlink(struct phylink=
 *pl,
> > > =20
> > >  	phylink_set(pl->supported, MII);
> > > =20
> > > -	if (s) {
> > > -		__set_bit(s->bit, pl->supported);
> > > -		__set_bit(s->bit, pl->link_config.lp_advertising);
> > > +	if (c) {
> > > +		linkmode_or(pl->supported, pl->supported, match);
> > > +		linkmode_or(pl->link_config.lp_advertising,
> > > pl->supported, match); =20
> >=20
> > You are doing the OR twice. You should use linkmode_copy() instead. =20
>=20
> No, we don't want to copy pl->supported to
> pl->link_config.lp_advertising. We just want to set the linkmode bit
> that corresponds to the speed/duplex in each mask.
>=20
> That will result in e.g. the pause mode bits will be overwritten despite
> being appropriately set in the advertising mask in the code above this.

Ok, so the right thing should be this:
linkmode_or(pl->link_config.lp_advertising, pl->link_config.lp_advertising,
	    match)

Regards,
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

