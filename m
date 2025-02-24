Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFB04C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 14:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w6ddd5eN9n7fNFqvJfwSzJ+NMubkWkXegBbLwCG/opI=; b=R73ZHbHIC+OmbzE5LpMhjbPWW7
	UrGiexTJLVL9FQov+p6RiqFXKWU3fgjYthmA7uFN707sWJNDsTUVVr9wUMjGU4xrOivMUs80gpEdq
	51cyAN2/xG6CSkvia4ajzNnNTvewe2mhHHIaxpz2nJ4/GpFNddzuEea89GewLDwzzsM4PpUfuRBH0
	cPssbc19Te+TdinGza6bf9InKxo9oxwwywNrE6E8Y0N1VcrYi0pkKCTNW74y1289HfusfTz/jH4mY
	uwsBH4xrnfTZhuTrWefIJpq9bL8bzarARNTF8uL+BbdHtr2o41yihU8FNVqfAjm+M05G2goyQlcTs
	8qojA32g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmZeT-0000000E8me-3D2X;
	Mon, 24 Feb 2025 14:41:45 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmZDF-0000000E2v6-3br1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 14:13:39 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3905044280;
	Mon, 24 Feb 2025 14:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1740406413;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=w6ddd5eN9n7fNFqvJfwSzJ+NMubkWkXegBbLwCG/opI=;
	b=SHxmHNgqUIQfAjO5+M0vS07kR4vJdlM2Q61kzT1i3NSw2SLqTYRO4iSTx39hTusWiDbcfy
	YwSkMFjxJO9IJNe7x/060jHUw0D+Ye4V1Yzx1cinWqlsJopQeiwC4+BbMkRtLBaNfspYNE
	8DG8TPBkI8JOAS9jaxL1aE5Qs395CVZj0Yg36ovmBtTPNQBUKomEMtT97a/QSJqL6Eizi2
	P9JsXsUwhBvLTe0qvZtqkhUFsYgwFa8SCFvUpmne+1j+cN9OKUHmEwfifQZ5wdUksIiPgU
	SHLfUolVwn0DNEfcHj9M+/1hPprlSO4mgSjExqk434LItWh6v+5K0QaUfO9URg==
Date: Mon, 24 Feb 2025 15:13:30 +0100
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: davem@davemloft.net, Andrew Lunn <andrew@lunn.ch>, Jakub Kicinski
 <kuba@kernel.org>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Heiner Kallweit <hkallweit1@gmail.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 thomas.petazzoni@bootlin.com, linux-arm-kernel@lists.infradead.org,
 Christophe Leroy <christophe.leroy@csgroup.eu>, Herve Codina
 <herve.codina@bootlin.com>, Florian Fainelli <f.fainelli@gmail.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>, =?UTF-8?B?S8O2cnk=?= Maincent
 <kory.maincent@bootlin.com>, Oleksij Rempel <o.rempel@pengutronix.de>,
 Simon Horman <horms@kernel.org>, Romain Gantois
 <romain.gantois@bootlin.com>
Subject: Re: [PATCH net-next 01/13] net: phy: Extract the speed/duplex to
 linkmode conversion from phylink
Message-ID: <20250224151330.2e0d95e4@fedora>
In-Reply-To: <Z7x7p3W0ZpkFu44m@shell.armlinux.org.uk>
References: <20250222142727.894124-1-maxime.chevallier@bootlin.com>
	<20250222142727.894124-2-maxime.chevallier@bootlin.com>
	<Z7x7p3W0ZpkFu44m@shell.armlinux.org.uk>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdejkeellecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepofgrgihimhgvucevhhgvvhgrlhhlihgvrhcuoehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeegveeltddvveeuhefhvefhlefhkeevfedtgfeiudefffeiledttdfgfeeuhfeukeenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghlohepfhgvughorhgrpdhmrghilhhfrhhomhepmhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudelpdhrtghpthhtoheplhhinhhugiesrghrmhhlihhnuhigrdhorhhgrdhukhdprhgtphhtthhopegurghvvghmsegurghvvghmlhhofhhtrdhnvghtpdhrtghpthhtoheprghnughrvgifsehluhhnnhdrtghhpdhrtghpthhtohepkhhusggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegvughumhgriigvthesghhoohhglhgvrdgtohhmpdhrtghpthhtohepphgrsggvn
 hhisehrvgguhhgrthdrtghomhdprhgtphhtthhopehhkhgrlhhlfigvihhtudesghhmrghilhdrtghomhdprhgtphhtthhopehnvghtuggvvhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_061338_038119_4B4F74F8 
X-CRM114-Status: GOOD (  20.29  )
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

On Mon, 24 Feb 2025 14:01:11 +0000
"Russell King (Oracle)" <linux@armlinux.org.uk> wrote:

> On Sat, Feb 22, 2025 at 03:27:13PM +0100, Maxime Chevallier wrote:
> > Phylink uses MAC capabilities to represent the Pause, AsymPause, Speed
> > and Duplex capabilities of a given MAC device. These capabilities are
> > used internally by phylink for link validation and get a coherent set of
> > linkmodes that we can effectively use on a given interface.
> > 
> > The conversion from MAC capabilities to linkmodes is done in a dedicated
> > function, that associates speed/duplex to linkmodes.
> > 
> > As preparation work for phy_port, extract this logic away from phylink
> > and have it in a dedicated file that will deal with all the conversions
> > between capabilities, linkmodes and interfaces.  
> 
> Fundamental question: why do you want to extract MAC capabilities from
> phylink?
> 
> At the moment, only phylink uses the MAC capabilities (they're a phylink
> thing.) Why should they be made generic, and what use will they be
> applied to as something generic?
> 
> If there's no answer for that, then I worry that they'll get abused.
> 

I only have a blurry answer for you, so that probably wont cut it, but
for phy_port (which I have ready) and stackable PHY support (which I
have not), I foresee that we may need to specify what can the PHY do on
its MII serdes port.

TBH the only real stuff that will be needed is "Given a set of
phy_interface_t supported by a PHY downstream port, what linkmodes can
we get out of these". The phylink code uses the mac_capabilities as an
intermediate between phylink_get_capabilities and
phylink_caps_to_linkmodes(). Given that this series introduces very very
similar enums in the form of the LINK_CAPA_XXX, we might be able to
keep the MAC_CAPABILITIES a phylink-specific set of values. I can
include that in V2.

Maxime

