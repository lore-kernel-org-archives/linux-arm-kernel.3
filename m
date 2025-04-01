Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF352C36016
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 06:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/yzplqdAPDSpRgvysGBcyb70oiqT6p+pK2C0nxnbMGo=; b=a2mda9odD2ksQ5+IeiKcKU7L0B
	aCVne2xRdtU0HzSzopKYPVobxHKduc4lrXpDws1OWDBmmbeX4ry5oOK5ekQ06C++bmxbF5RJsnG21
	HQW8203BwGQPjMA78bt8Sma97IiryFYTTKIrvpKTzWFi9zwaLR8za6PCqkFU7t9vbPy5pkGHs0gRF
	a7IaCzS66GJP+I8HP9vXf8EY9v8NHr188mRB/7u2tWeRbTukplBNeQEEDhZGB12YgUSri+w6fYhrx
	yi2nBAQqXap/caGq8zM+r9oEfUkJyfa12OfQmXiHrTuQuTCFOgH8lNLK1MyoVfZcjhOXQPOSwVJq0
	CsskA1aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzVPR-000000027kb-0ygo;
	Tue, 01 Apr 2025 06:47:41 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzVNa-000000027ag-3frP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Apr 2025 06:45:51 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id BD8ED443CF;
	Tue,  1 Apr 2025 06:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1743489943;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/yzplqdAPDSpRgvysGBcyb70oiqT6p+pK2C0nxnbMGo=;
	b=Ob65MilMRjUX+n6NZqEAUTKZafOYUIEGrdrF2QgtWmsQhjAChUtmi+qwu6Qd7yudVc0ZzG
	ieCZTzcZ7L5KPcdp8mAH/0SGAaYGVn/4M+OOq9k3K+mcCHuNcw+4YlkrC4PKo4DeKs8SQQ
	+iO1vJ2BAjuKe40dFoj10+PhpEZip5WOLdfkgCA86/DoRXLansw9fqJWppkCxsIXYG+ES/
	c5P2miWICh4PQTVvhtBAZIt4YurWWcygZfxKmAbF8gL48S9InRf/3KxQUU66CKTGgTnXQH
	BrzyOy02d0aC/XPgo5cAIAvBIKFXPI5Ipq3mWH+0xYqgTEVphDXX4L0+/lleqA==
Date: Tue, 1 Apr 2025 09:41:53 +0200
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Alexander Duyck <alexander.duyck@gmail.com>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>, Andrew Lunn
 <andrew@lunn.ch>, davem@davemloft.net, Jakub Kicinski <kuba@kernel.org>,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Heiner
 Kallweit <hkallweit1@gmail.com>, netdev@vger.kernel.org,
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
Message-ID: <20250401094153.43974af2@fedora.home>
In-Reply-To: <CAKgT0UdJHkGRh5S4hHg0V=Abd7UizH49F+V2QJJQxguHvCYhMg@mail.gmail.com>
References: <20250307173611.129125-1-maxime.chevallier@bootlin.com>
	<20250307173611.129125-10-maxime.chevallier@bootlin.com>
	<8d3a9c9bb76b1c6bc27d2bd01f4831b2cac83f7f.camel@gmail.com>
	<20250328090621.2d0b3665@fedora-2.home>
	<CAKgT0Ue_JzmJAPKBhe6XaMkDCy+YNNg5_5VvzOR6CCbqcaQg3Q@mail.gmail.com>
	<12e3b86d-27aa-420b-8676-97b603abb760@lunn.ch>
	<CAKgT0UcZRi1Eg2PbBnx0pDG_pCSV8tfELinNoJ-WH4g3CJOh2A@mail.gmail.com>
	<02c401a4-d255-4f1b-beaf-51a43cc087c5@lunn.ch>
	<Z-qsnN4umaz0QrG0@shell.armlinux.org.uk>
	<20250331182000.0d94902a@fedora.home>
	<CAKgT0UdJHkGRh5S4hHg0V=Abd7UizH49F+V2QJJQxguHvCYhMg@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddukedvudduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtqhertdertdejnecuhfhrohhmpeforgigihhmvgcuvehhvghvrghllhhivghruceomhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepkeehgeeijeekteffhfelheetffeghfffhfeufeeifeffjeeftefhveduteduueeunecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepvdgrtddumegtsgduleemkegugeehmeegledttdemieehieekmedvlegsudemlegvfhehmegvkegtjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudelmeekugegheemgeeltddtmeeiheeikeemvdelsgdumeelvghfheemvgektgejpdhhvghlohepfhgvughorhgrrdhhohhmvgdpmhgrihhlfhhrohhmpehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvtddprhgtphhtthhopegrlhgvgigrnhguvghrrdguuhihtghksehgmhgrihhlrdgtohhmpdhrtghpthhtoheplhhinhhugiesrghrmhhlihhnuhigrdhorhhgrdhukhdpr
 hgtphhtthhopegrnhgurhgvfieslhhunhhnrdgthhdprhgtphhtthhopegurghvvghmsegurghvvghmlhhofhhtrdhnvghtpdhrtghpthhtohepkhhusggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegvughumhgriigvthesghhoohhglhgvrdgtohhmpdhrtghpthhtohepphgrsggvnhhisehrvgguhhgrthdrtghomhdprhgtphhtthhopehhkhgrlhhlfigvihhtudesghhmrghilhdrtghomh
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_234547_653586_4040245B 
X-CRM114-Status: GOOD (  58.11  )
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

On Mon, 31 Mar 2025 09:38:34 -0700
Alexander Duyck <alexander.duyck@gmail.com> wrote:

> On Mon, Mar 31, 2025 at 9:20=E2=80=AFAM Maxime Chevallier
> <maxime.chevallier@bootlin.com> wrote:
> >
> > On Mon, 31 Mar 2025 15:54:20 +0100
> > "Russell King (Oracle)" <linux@armlinux.org.uk> wrote:
> > =20
> > > On Mon, Mar 31, 2025 at 04:17:02PM +0200, Andrew Lunn wrote: =20
> > > > On Fri, Mar 28, 2025 at 04:26:04PM -0700, Alexander Duyck wrote: =20
> > > > > A serdes PHY is part of it, but not a traditional twisted pair PH=
Y as
> > > > > we are talking about 25R, 50R(50GAUI & LAUI), and 100P interfaces=
. I
> > > > > agree it is a different beast, but are we saying that the fixed-l=
ink
> > > > > is supposed to be a twisted pair PHY only? =20
> > > >
> > > > With phylink, the PCS enumerates its capabilities, the PHY enumerat=
es
> > > > its capabilities, and the MAC enumerates it capabilities. phylink t=
hen
> > > > finds the subset which all support.
> > > >
> > > > As i said, historically, fixed_link was used in place of a PHY, sin=
ce
> > > > it emulated a PHY. phylinks implementation of fixed_link is however
> > > > different. Can it be used in place of both a PCS and a PHY? I don't
> > > > know. =20
> > >
> > > In fixed-link mode, phylink will use a PCS if the MAC driver says the=
re
> > > is one, but it will not look for a PHY. =20
>=20
> Admittedly the documentation does reference much lower speeds as being
> the use case. I was a bit of an eager beaver and started assembling
> things without really reading the directions. I just kind of assumed
> what I could or couldn't get away with within the interface.
>=20
> > > > You are pushing the envelope here, and maybe we need to take a step
> > > > back and consider what is a fixed link, how does it fit into the MA=
C,
> > > > PCS, PHY model of enumeration? Maybe fixed link should only represe=
nt
> > > > the PHY and we need a second sort of fixed_link object to represent
> > > > the PCS? I don't know? =20
> > >
> > > As I previously wrote today in response to an earlier email, the
> > > link modes that phylink used were the first-match from the old
> > > settings[] array in phylib which is now gone. This would only ever
> > > return _one_ link mode, which invariably was a baseT link mode for
> > > the slower speeds.
> > >
> > > Maxime's first approach at adapting this to his new system was to
> > > set every single link mode that corresponded with the speed. I
> > > objected to that, because it quickly gets rediculous when we end
> > > up with lots of link modes being indicated for e.g. 10, 100M, 1G
> > > but the emulated PHY for these speeds only indicates baseT. That's
> > > just back-compatibility but... in principle changing the link modes
> > > that are reported to userspace for a fixed link is something we
> > > should not be doing - we don't know if userspace tooling has come
> > > to rely on that.
> > >
> > > Yes, it's a bit weird to be reporting 1000baseT for a 1000BASE-X
> > > interface mode, but that's what we've always done in the past and
> > > phylink was coded to maintain that (following the principle that
> > > we shouldn't do gratuitous changes to the information exposed to
> > > userspace.)
> > >
> > > Maxime's replacement approach is to just expose baseT, which
> > > means that for the speeds which do not have a baseT mode, we go
> > > from supporting it but with a weird link mode (mostly baseCR*)
> > > based on first-match in the settings[] table, to not supporting the
> > > speed. =20
> >
> > I very wrongfully considered that there was no >10G fixed-link users, I
> > plan to fix that with something like the proposed patch in the
> > discussion, that reports all linkmodes for speeds above 10G (looks less
> > like a randomly selected mode, you can kind-of see what's going on as
> > you get all the linkmodes) but is a change in what we expose to
> > userspace. =20
>=20
> I am not sure if there are any >10G users. I haven't landed anything
> in the kernel yet and like I said what I was doing was more of a hack
> to enable backwards compatibility on older kernels w/ the correct
> supported and advertised modes. If I have to patch one kernel to make
> it work for me that would be manageable.
>=20
> One thing I was thinking about that it looks like this code might
> prevent would be reinterpreting the meaning of duplex. Currently we
> only have 3 values for it 0 (half), 1 (Full), and ~0 (Unknown). One
> thought I had is that once we are over 1G we don't really care about
> that anymore as everything is Full duplex and instead care about
> lanes. As it turns out the duplex values currently used would work
> well to be extended out to lanes. Essentially 0 would still be half, 1
> would be 1 lane full duplex, 2-8 could be the number of full duplex
> lanes the interface is using, and unknown lane count would still be ~0
> since it is unlikely we will end up with anything other than a power
> of 2 number of lanes anyway. With that you could greatly sort out a
> number of modes in your setup. We would then have to do some cleanups
> here and there to do something like "duplex =3D=3D DUPLEX_UNKNOWN ? duplex
> : !!duplex" to clean up any cases where the legacy values are
> expected.

Funny you say that, the phy_port work I was referring to with the
mediums introduction also tracks the lanes for a given port=20

previous outdated iteration here
: https://lore.kernel.org/netdev/20250213101606.1154014-4-maxime.chevallier=
@bootlin.com/

The idea is to represent physical interfaces to a NIC, as NICs can have
multiple ports for different types of connectors. Ports would be driven
by either a PHY, a NIC directly or an SFP.

The port contains, among other things, speed, duplex, n_lanes, and the
medium (with more granularity than just TP/Backplane/Fiber, as we list
the 802.3 media : BaseS / BaseC / BaseK / BaseT ...)

We already have information about whickh linkmode uses how many lanes,
but we don't do much with that information besides reporting it to
userspace.

I'll revamp the whole thing for the next iteration, however I really
only have a deep-ish understanding of embedded usecases, and I lack
insights on other classes of devices such as what your working on.

I'll be very happy to get your feedback on it, I plan to send that when
net-next reopens.

Maxime


