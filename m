Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31BC5C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 17:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fQqUsJ+Qb6MnonChra2CtKhIIlviGmLlJPe1nhDRgAA=; b=NS3Gfkq0qcoOEIKTTEsLLgk1eI
	DxCjOzdKBQEyuxfyxI4LzaRVBTcR0b/PThGGKagJLQ4S1pGKso6uiz4wl4gSysCTBZSkDgA5kBevz
	rKW9juelJalnJ4x6ZIoVnnWRpLW66doPyYIVnC5nmX/KxAY2a91OeCHCeCO0DqKquBWbuPKhO0Rn4
	ml7JsmdttHuchM994vmZ9IJDMNVAcQhroCGjb5Bh9OEkJQcoNhrJsMsOVz5QtCrb/ldsXp7KNqGTK
	Lgjj1m5BINM1uKEXtQZt/KzptQ0IKo4arRPT3zSIeq2TMje05DMHUHsizx9moCfJIZ8/9ujaWTN68
	HmBPsDow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucp9U-0000000DFsS-3QAI;
	Fri, 18 Jul 2025 17:45:44 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucp4N-0000000DFPV-45j8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Jul 2025 17:40:29 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5FD8E443B3;
	Fri, 18 Jul 2025 17:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1752860425;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fQqUsJ+Qb6MnonChra2CtKhIIlviGmLlJPe1nhDRgAA=;
	b=CVdRvKlIHFHsWfAgRCHtzqd+wMzGyGeJV7woFCUMSefTHo6gS4gAbmWGFLMC+KtyhK8Sep
	7mSo0vOFEg1xkQv2/aKJ8M1I+NOfJbKxBXNwO/iXiopx9mRRBngl1EYJMtucYoz3/Ckc3e
	qGdMo6s7sj/FPzERN7FrV5S5pNO//q3meaQqQ4YyAf0x/K3K4I2X4TjryooGndNCD1CXog
	wSAvnuP9QxJZ5z/3+UOpSAyL8PV7vbx23Nn7aboo5j8HvfRiFRj1M3/zSF92soI9YTFFo8
	msJwRCY5Tbz/C9eqdCnQPrhN76K1qnNze4lKNr1tJe5RxthKM4S6M5wfXQE4jw==
Date: Fri, 18 Jul 2025 19:40:22 +0200
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
 Gantois <romain.gantois@bootlin.com>, Daniel Golle <daniel@makrotopia.org>,
 Dimitri Fedrau <dimitri.fedrau@liebherr.com>
Subject: Re: [PATCH net-next v9 02/15] net: ethtool: common: Indicate that
 BaseT works on up to 4 lanes
Message-ID: <20250718194022.4d01088e@kmaincent-XPS-13-7390>
In-Reply-To: <20250717073020.154010-3-maxime.chevallier@bootlin.com>
References: <20250717073020.154010-1-maxime.chevallier@bootlin.com>
	<20250717073020.154010-3-maxime.chevallier@bootlin.com>
Organization: bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdeigedtkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthhqredtredtjeenucfhrhhomhepmfhorhihucforghinhgtvghnthcuoehkohhrhidrmhgrihhntggvnhhtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpefguddtfeevtddugeevgfevtdfgvdfhtdeuleetffefffffhffgteekvdefudeiieenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgduheemfegvgeemtgehtddtmeekvddttgemiegvtddumeejkegrtgemvdgtugefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgduheemfegvgeemtgehtddtmeekvddttgemiegvtddumeejkegrtgemvdgtugefpdhhvghlohepkhhmrghinhgtvghnthdqigfrufdqudefqdejfeeltddpmhgrihhlfhhrohhmpehkohhrhidrmhgrihhntggvnhhtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefuddprhgtphhtthhopehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvthdprhgtp
 hhtthhopehnvghtuggvvhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhmshhmsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheprghnughrvgifsehluhhnnhdrtghhpdhrtghpthhtohepkhhusggrsehkvghrnhgvlhdrohhrgh
X-GND-Sasl: kory.maincent@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_104028_170674_BED11C41 
X-CRM114-Status: GOOD (  13.38  )
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

Le Thu, 17 Jul 2025 09:30:06 +0200,
Maxime Chevallier <maxime.chevallier@bootlin.com> a =C3=A9crit :

> The way BaseT modes (Ethernet over twisted copper pairs) are represented
> in the kernel are through the following modes :
>=20
>   ETHTOOL_LINK_MODE_10baseT_Half
>   ETHTOOL_LINK_MODE_10baseT_Full
>   ETHTOOL_LINK_MODE_100baseT_Half
>   ETHTOOL_LINK_MODE_100baseT_Full
>   ETHTOOL_LINK_MODE_1000baseT_Half
>   ETHTOOL_LINK_MODE_1000baseT_Full
>   ETHTOOL_LINK_MODE_2500baseT_Full
>   ETHTOOL_LINK_MODE_5000baseT_Full
>   ETHTOOL_LINK_MODE_10000baseT_Full
>   ETHTOOL_LINK_MODE_100baseT1_Full
>   ETHTOOL_LINK_MODE_1000baseT1_Full
>   ETHTOOL_LINK_MODE_10baseT1L_Full
>   ETHTOOL_LINK_MODE_10baseT1S_Full
>   ETHTOOL_LINK_MODE_10baseT1S_Half
>   ETHTOOL_LINK_MODE_10baseT1S_P2MP_Half
>   ETHTOOL_LINK_MODE_10baseT1BRR_Full
>=20
> The baseT1* modes explicitly specify that they work on a single,
> unshielded twister copper pair.
>=20
> However, the other modes do not state the number of pairs that are used
> to carry the link. 10 and 100BaseT use 2 twisted copper pairs, while
> 1GBaseT and higher use 4 pairs.
>=20
> although 10 and 100BaseT use 2 pairs, they can work on a Cat3/4/5+
> cables that contain 4 pairs.
>=20
> Change the number of pairs associated to BaseT modes to indicate the
> allowable number of pairs for BaseT. Further commits will then refine
> the minimum number of pairs required for the linkmode to work.
>=20
> BaseT1 modes aren't affected by this commit.
>=20
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>

Thank you!

--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

