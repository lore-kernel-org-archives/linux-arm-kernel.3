Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B73CDC021A6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 13:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2dHd4KnjPWv2ykRzFr7ZhW+iP+q3WqoFHN6uZ4GxReo=; b=gFtze/NCK4PBkQ3q4tdBOfcuah
	e4iZhemXVEzLm4OZT8MqKulvDlPgk90t24TDQx1OApGv2Ym83CM3NxIXfno2L8BREE7DUILpFOjkf
	VVIju85xbrYnsMrKZa9shA6IS83LyDohLYvnX9CuwO4ByLkh4bSZYd4HQfb0L1SoBFuJmiNd6naOh
	fDB9+Dr66X2EsGC7hb+V3OBfNCnZir2PWs1lGBTqr6tRobdJBvaki9EXgPaOaLPFiwU6w6834re9F
	zBt7dP4pqR0Xh4f4JCq0/MOf4XGti0emuBp0F4mWW1lmqfr6Vmcq9Rkhnsa2k2pO8ihSiJ0GevyRH
	FkW8vsqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmYcC-0000000DuPM-1fOo;
	Mon, 24 Feb 2025 13:35:20 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmYah-0000000Du8H-40y5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 13:33:49 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id A855B204D6;
	Mon, 24 Feb 2025 13:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1740404023;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2dHd4KnjPWv2ykRzFr7ZhW+iP+q3WqoFHN6uZ4GxReo=;
	b=MXBoTjUsFDtLVczTsN4dMXf43jF2koAdK5EIfBKg4ENAdHqXp5w2JEb1xVZAL6fqsOKdRq
	U0rOBTWHDmhx0vGFHc32l5Y4k0HmuAK8EEGnvezGIjoE8XSQsC31wsDM/+UPAp/HxBrXQ0
	Nfx8PuANGov2QhT2D8jqZHHqulPFcj164vujplLNOH8h6mV/JDF7kDNJ9qjKTFa4PbCr2S
	lqrN8qM/9KDYn/eiCl4tLrb8SQ0YrEjJ4toQ/rvdYwicwc+hWZzm3pmrCEJ9Lu3fg7DeqM
	Mq/3B4D585JjQveoylMrg/DJD2OK+Y5LfbtXioJHcnOu6pUB5R/5MtsurRT0eQ==
Date: Mon, 24 Feb 2025 14:33:39 +0100
From: Kory Maincent <kory.maincent@bootlin.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: davem@davemloft.net, Andrew Lunn <andrew@lunn.ch>, Jakub Kicinski
 <kuba@kernel.org>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Russell King <linux@armlinux.org.uk>, Heiner Kallweit
 <hkallweit1@gmail.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com,
 linux-arm-kernel@lists.infradead.org, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Herve Codina <herve.codina@bootlin.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean
 <vladimir.oltean@nxp.com>, Oleksij Rempel <o.rempel@pengutronix.de>, Simon
 Horman <horms@kernel.org>, Romain Gantois <romain.gantois@bootlin.com>
Subject: Re: [PATCH net-next 05/13] net: phy: Use an internal, searchable
 storage for the linkmodes
Message-ID: <20250224143339.3e9ba797@kmaincent-XPS-13-7390>
In-Reply-To: <20250222142727.894124-6-maxime.chevallier@bootlin.com>
References: <20250222142727.894124-1-maxime.chevallier@bootlin.com>
	<20250222142727.894124-6-maxime.chevallier@bootlin.com>
Organization: bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdejkeelvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthhqredtredtjeenucfhrhhomhepmfhorhihucforghinhgtvghnthcuoehkohhrhidrmhgrihhntggvnhhtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpefguddtfeevtddugeevgfevtdfgvdfhtdeuleetffefffffhffgteekvdefudeiieenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghlohepkhhmrghinhgtvghnthdqigfrufdqudefqdejfeeltddpmhgrihhlfhhrohhmpehkohhrhidrmhgrihhntggvnhhtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeduledprhgtphhtthhopehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvthdprhgtphhtthhopegrnhgurhgvfieslhhunhhnrdgthhdprhgtphhtthhopehkuhgsrgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepv
 gguuhhmrgiivghtsehgohhoghhlvgdrtghomhdprhgtphhtthhopehprggsvghnihesrhgvughhrghtrdgtohhmpdhrtghpthhtoheplhhinhhugiesrghrmhhlihhnuhigrdhorhhgrdhukhdprhgtphhtthhopehhkhgrlhhlfigvihhtudesghhmrghilhdrtghomh
X-GND-Sasl: kory.maincent@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_053348_139453_16F66882 
X-CRM114-Status: GOOD (  13.44  )
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

On Sat, 22 Feb 2025 15:27:17 +0100
Maxime Chevallier <maxime.chevallier@bootlin.com> wrote:

Only small typos:

> The canonical definition for all the link modes is in linux/ethtol.h,

ethtool

> which is complemented by the link_mode_params array stored in
> net/ethtool/common.h . That array contains all the metadata about each
> of these modes, including the Speed and Duplex information.
>=20
> Phylib and phylink needs that information as well for internal
> managmement of the link, which was done by duplicating that information

management

> in locally-stored arrays and lookup functions. This makes it easy for
> developpers adding new modes to forget modifying phylib and phylink
> accordingly.
>=20
> However, the link_mode_params array in net/ethtool/common.c is fairly
> inefficient to search through, as it isn't sorted in any manner. Phylib
> and phylink perform a lot of lookup operations, mostly to filter modes
> by speed and/or duplex.
>=20
> We therefore introduce the link_caps private array in phy_caps.c, that
> indexes linkmodes in a more efficient manner. Each element associated a
> tuple <speed, duplex> to a bitfield of all the linkmodes runs at these
> speed/duplex.
>=20
> We end-up with an array that's fairly short, easily addressable and that
> it optimised for the typical use-cases of phylib/phylink.
>=20
> That array is initialized at the same time as phylib. As the
> link_mode_params array is part of the net stack, which phylink depends
> on, it should always be accessible from phylib.

The rest looks ok for me.

--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

