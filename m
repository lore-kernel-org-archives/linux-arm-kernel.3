Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFA80C0219B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 13:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lJYnHq/sEIobe9VCr0dLddOsYZHMnYLJhMmVGTUEBgc=; b=cbMxx4Zw5dnw9RM7wkqxt3P5qG
	KjrMohjriTS5CTVRGn0hQg9MiLXsvkVZmsICn69CSKmlML5iAE5Gwyr18L6zXE5zPk5wZqihX6L9f
	C3rr4wt9sodqygc3CdKd8wJ/WIKZTWh2N2LALW4UCQd334s2wN+GJdY9rv4xtLxA5Jf17Sx1IX0qo
	TFW2Opr4s33WUstct0FTKsYpLcUCza/6tdqUCGYb5VRdBIjATNiXbck2jXfmWzagr1NUjTFSr5J9B
	bGwP7Zk+4XVfzBDrrysDVgvUtPJDzyOoCH2wEHU6RhqlfY1PGLdkqkSVy6Wfw2zXX76tECL3JQCZJ
	l1Fsi1ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thqjF-000000041U7-0HaL;
	Tue, 11 Feb 2025 13:55:09 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thqgj-00000004190-2h8n
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 13:52:35 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id A761544214;
	Tue, 11 Feb 2025 13:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1739281951;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lJYnHq/sEIobe9VCr0dLddOsYZHMnYLJhMmVGTUEBgc=;
	b=MMI/CAm2RVUEankum6M+P6dyFrnzmDJKaFY5Irg/kep2quAF7z1RgKFW8dshZtVI5Br8IF
	FsXzMyRx8GQU1Rk8ZMWIYKYlme+2NX+I8WJ48zpjE7NTpTwwxi2bJP1LOKVuC96K02RGwv
	FX35CyLr7JCltCoSLQZF5M51ej1FxhS3Tzqw9dMr4buz+FB8aaBBMpInH9uqX2HKqsRBkB
	YrgBgk7h2y/ZcHVQYouvtwYGr+BzQG70uydW5kLcmc38uwxgnf5Ettmb0bo8nHwK8XSKl3
	qANRLTdRhCbQhuwUj6T91muApa5ijBlocf10KX+zF/mp3BJ9hVWCXGG3bkj1WQ==
Date: Tue, 11 Feb 2025 14:52:28 +0100
From: Kory Maincent <kory.maincent@bootlin.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: davem@davemloft.net, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
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
 mwojtas@chromium.org, Antoine Tenart <atenart@kernel.org>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, Romain
 Gantois <romain.gantois@bootlin.com>
Subject: Re: [PATCH net-next 03/13] net: phy: Introduce PHY ports
 representation
Message-ID: <20250211145228.06408469@kmaincent-XPS-13-7390>
In-Reply-To: <20250211144243.6190005a@fedora.home>
References: <20250207223634.600218-1-maxime.chevallier@bootlin.com>
	<20250207223634.600218-4-maxime.chevallier@bootlin.com>
	<20250211143209.74f84a10@kmaincent-XPS-13-7390>
	<20250211144243.6190005a@fedora.home>
Organization: bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeguddujecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthhqfedtredtjeenucfhrhhomhepmfhorhihucforghinhgtvghnthcuoehkohhrhidrmhgrihhntggvnhhtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpefhjeevfeeggeeghffgudfhhedvvedvueekleevjeduvddutefhvddugedtfeeludenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghlohepkhhmrghinhgtvghnthdqigfrufdqudefqdejfeeltddpmhgrihhlfhhrohhmpehkohhrhidrmhgrihhntggvnhhtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvkedprhgtphhtthhopehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvthdprhgtphhtthhopehnvghtuggvvhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgv
 ghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhmshhmsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheprghnughrvgifsehluhhnnhdrtghhpdhrtghpthhtohepkhhusggrsehkvghrnhgvlhdrohhrgh
X-GND-Sasl: kory.maincent@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_055233_826604_7AE41939 
X-CRM114-Status: GOOD (  42.28  )
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

On Tue, 11 Feb 2025 14:42:43 +0100
Maxime Chevallier <maxime.chevallier@bootlin.com> wrote:

> Hi K=C3=B6ry,
>=20
> On Tue, 11 Feb 2025 14:32:09 +0100
> Kory Maincent <kory.maincent@bootlin.com> wrote:
>=20
> > On Fri,  7 Feb 2025 23:36:22 +0100
> > Maxime Chevallier <maxime.chevallier@bootlin.com> wrote:
> >  =20
> > > Ethernet provides a wide variety of layer 1 protocols and standards f=
or
> > > data transmission. The front-facing ports of an interface have their =
own
> > > complexity and configurability.
> > >=20
> > > Introduce a representation of these front-facing ports. The current c=
ode
> > > is minimalistic and only support ports controlled by PHY devices, but
> > > the plan is to extend that to SFP as well as raw Ethernet MACs that
> > > don't use PHY devices.
> > >=20
> > > This minimal port representation allows describing the media and numb=
er
> > > of lanes of a port. From that information, we can derive the linkmodes
> > > usable on the port, which can be used to limit the capabilities of an
> > > interface.
> > >=20
> > > For now, the port lanes and medium is derived from devicetree, defined
> > > by the PHY driver, or populated with default values (as we assume that
> > > all PHYs expose at least one port).
> > >=20
> > > The typical example is 100M ethernet. 100BaseT can work using only 2
> > > lanes on a Cat 5 cables. However, in the situation where a 10/100/1000
> > > capable PHY is wired to its RJ45 port through 2 lanes only, we have no
> > > way of detecting that. The "max-speed" DT property can be used, but a
> > > more accurate representation can be used :
> > >=20
> > > mdi {
> > > 	port@0 {
> > > 		media =3D "BaseT";
> > > 		lanes =3D <2>;
> > > 	};
> > > };
> > >=20
> > > From that information, we can derive the max speed reachable on the
> > > port.
> > >=20
> > > Another benefit of having that is to avoid vendor-specific DT propert=
ies
> > > (micrel,fiber-mode or ti,fiber-mode).
> > >=20
> > > This basic representation is meant to be expanded, by the introduction
> > > of port ops, userspace listing of ports, and support for multi-port
> > > devices.   =20
> >=20
> > This patch is tackling the support of ports only for the PHY API. Keepi=
ng in
> > mind that this port abstraction support will also be of interest to the
> > NICs. Isn't it preferable to handle port in a standalone API? =20
>=20
> The way I see it, nothing prevents from using the port definition in
> ethernet-port.yml in DSA/raw nics.
>=20
> > With net drivers having PHY managed by the firmware or DSA, there is no
> > linux description of their PHYs. On that case, if we want to use port
> > abstraction, what is the best? Register a virtual phy_device to use the
> > abstraction port or use the port abstraction API directly which meant t=
hat
> > it is not related to any PHY? =20
>=20
> I think the next steps will be to have net_device have a list of ports
> (maintained in the phy_link_topology) that aggregates ports from all
> its PHYs/SFPs/raw interfaces. in that case net_device will be the
> direct parent. I haven't worked on the bindings for that though,
> especially for DSA :'(

Having it under phy_link_topology is a great idea!
=20
> I don't think the virtual phydev is going to be helpful. I'm hitting
> the 15 patches limit, but a possible extension is to make so that
> phylink also creates a port when it finds an SFP (hence, when upstream
> is a MAC).

I would say not only for SFP but phylink should create a port when it can f=
ind
a mdi description in the devicetree. Port with PoE, leds or whatever future
supported features should be created by phylink.=20

> This is why phy_port has these fields :
>=20
>=20
> enum phy_port_parent {
> 	PHY_PORT_PHY,
> };
>=20
> struct phy_port {
> 	...
> 	enum phy_port_parent parent_type;
> 	union {
> 		struct phy_device *phy;
> 	};
>=20
> };
>=20
> The parent type may (will) be extended with PORT_PHY_MAC, and that's
> also why the parent pointer is in a union :)

Ok for me!
=20
> I'm trying hard to make so that phy_port doesn't depend on phylib
> (altough, phylib depends on phy_port). There's a dependency on some
> core stuff (converting from medium =3D> linkmodes) and phylink
> (converting the interfaces list to linkmodes), but we can extract these
> fairly easily.
>=20
> You're correct in that for now, the integration is with phylib only
> though, but let's make sure this will also work for phy-less devices.
>=20
> Thanks a lot for your input,

Thanks for your work, it will be really helpful to add support for PoE in D=
SA.=20

Regards,
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

