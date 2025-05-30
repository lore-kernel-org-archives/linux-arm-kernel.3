Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F55AC54F30
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 May 2025 07:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WxJKQnlngqPKzQgieYcZOedSyyuKtQwXRQsJDRHek1A=; b=wvBe/LDJXqIsZWtZXbb4NJycOa
	+8VR6M7NyBkjx67d83G49I3WLaV+rCgvd7ZXrz8tPh1o7iW8WRiepzCBe5zv2bh6X40xO6w6cgZZ0
	S7nSuyzBdAXlADLhXZL/qaF72S0M709LGPkiXms6giOnOylU1S6i/exs9gZHuMKufNZba8FDyL6xB
	nk5TciosXtDTeQR9ubCEzuFh57ZYMMQ+OqegcxCBefFNxlOpg/x/Cxwr90sIyoC7z7EG8947sHT9t
	ga1J53at2fwRIighuN/wDRcS3Nr5RxDP0m7vcGqIVZDPCI4Jex56a7V2UUcuAq1OEJLVqNjw6W0nW
	5xkVHEsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKuCH-0000000HSAM-0Ukm;
	Fri, 30 May 2025 07:30:33 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKuA6-0000000HRvL-4Bk0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 May 2025 07:28:21 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id D35A843A63;
	Fri, 30 May 2025 07:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1748590094;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WxJKQnlngqPKzQgieYcZOedSyyuKtQwXRQsJDRHek1A=;
	b=DOYOTYnGlX46ngRBabnkMLB8PdI8LP7g+Z5auY7q2nXgqXll22UC4qv4S0hL6ZfQJOgtNM
	NKMQhvbkS59CKkdfZFzdB//Y3EBgwzYZ0EFs13gCjWvnyxikQnj8Arnt5z85fzr0cBeCYQ
	yyD/lVKi3UbGBtdTNIwC8qcr59aQJ95z1BfkX7T9aE0pbgb4n7KxzBZsqebQd/MiBOR0xA
	N9kuQOfPbkcdZdpMJE12LyG0SwsG2NM7E7t15jtg3kECxFz46ImvC4DoBxPnKpO+V/fW1B
	vZjrsrW3t0ArlrUk/ozCHZbVdoVWgsDh8W42aKpNLzgkZBrpyljE8oW6QFZ3hQ==
From: Romain Gantois <romain.gantois@bootlin.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>, davem@davemloft.net,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, thomas.petazzoni@bootlin.com,
 Andrew Lunn <andrew@lunn.ch>, Jakub Kicinski <kuba@kernel.org>,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
 linux-arm-kernel@lists.infradead.org,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Herve Codina <herve.codina@bootlin.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 =?UTF-8?B?S8O2cnk=?= Maincent <kory.maincent@bootlin.com>,
 Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>,
 Oleksij Rempel <o.rempel@pengutronix.de>,
 =?UTF-8?B?Tmljb2zDsg==?= Veronese <nicveronese@gmail.com>,
 Simon Horman <horms@kernel.org>, mwojtas@chromium.org,
 Antoine Tenart <atenart@kernel.org>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Rob Herring <robh@kernel.org>, Daniel Golle <daniel@makrotopia.org>,
 Dimitri Fedrau <dimitri.fedrau@liebherr.com>
Subject: Re: [PATCH net-next v6 06/14] net: phy: Introduce generic SFP handling for
 PHY drivers
Date: Fri, 30 May 2025 09:28:11 +0200
Message-ID: <6159237.lOV4Wx5bFT@fw-rgant>
In-Reply-To: <aDhfyiSOnyA709oX@shell.armlinux.org.uk>
References: <20250507135331.76021-1-maxime.chevallier@bootlin.com>
 <13770694.uLZWGnKmhe@fw-rgant> <aDhfyiSOnyA709oX@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart5012516.31r3eYUQgx";
 micalg="pgp-sha512"; protocol="application/pgp-signature"
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgddvkeegudculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkjghfgggtsehgtderredttdejnecuhfhrohhmpeftohhmrghinhcuifgrnhhtohhishcuoehrohhmrghinhdrghgrnhhtohhishessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhephfdvleekvefgieejtdduieehfeffjefhleegudeuhfelteduiedukedtieehlefgnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehffidqrhhgrghnthdrlhhotggrlhhnvghtpdhmrghilhhfrhhomheprhhomhgrihhnrdhgrghnthhoihhssegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeeftddprhgtphhtthhopehlihhnuhigsegrrhhmlhhinhhugidrohhrghdruhhkpdhrtghpthhtohepmhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomhdprhgtphhtthhopegurghvvghmsegurghvvghmlhhofhhtrdhnvghtpdhrtghpthhtohepnhgvthguvghvsehvg
 hgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrghrmhdqmhhsmhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopegrnhgurhgvfieslhhunhhnrdgthh
X-GND-Sasl: romain.gantois@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250530_002819_778968_391B3F3E 
X-CRM114-Status: GOOD (  16.59  )
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

--nextPart5012516.31r3eYUQgx
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Romain Gantois <romain.gantois@bootlin.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Date: Fri, 30 May 2025 09:28:11 +0200
Message-ID: <6159237.lOV4Wx5bFT@fw-rgant>
In-Reply-To: <aDhfyiSOnyA709oX@shell.armlinux.org.uk>
MIME-Version: 1.0

On Thursday, 29 May 2025 15:23:22 CEST Russell King (Oracle) wrote:
> On Wed, May 28, 2025 at 09:35:35AM +0200, Romain Gantois wrote:
> > > In that regard, you can consider 1000BaseX as a MII mode (we do have
> > > PHY_INTERFACE_MODE_1000BASEX).
> > 
> > Ugh, the "1000BaseX" terminology never ceases to confuse me, but yes
> > you're
> > right.
> 
> 1000BASE-X is exactly what is described in IEEE 802.3. It's a PHY
> interface mode because PHYs that use SerDes can connect to the host
> using SGMII or 1000BASE-X over the serial link.
> 
> 1000BASE-X's purpose in IEEE 802.3 is as a protocol for use over
> fibre links, as the basis for 1000BASE-SX, 1000BASE-LX, 1000BASE-EX
> etc where the S, L, E etc are all to do with the properties of the
> medium that the electrical 1000BASE-X is sent over. It even includes
> 1000BASE-CX which is over copper cable.

Ah makes sense, thanks for the explanation. I guess my mistake was assuming 
that MAC/PHY interface modes were necessarily strictly at the reconciliation 
sublayer level, and didn't include PCS/PMA functions.

Thanks,

-- 
Romain Gantois, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--nextPart5012516.31r3eYUQgx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEYFZBShRwOvLlRRy+3R9U/FLj284FAmg5XgsACgkQ3R9U/FLj
286GbBAAmB3Nz5sjbXmWSvq8T+BWKMW6/ADtfZoynbL1liHfm02INS3KBq6v80Ev
V9bV7+DHe2VPHiWTQdVDfKXwsdlHRtzknR5d9paXM2l+EdaXgi4g1WI6tPjCNcdA
HGCxoRnc0xEAWpVO7cCQWkq+77Z7LVt1QY19KFQiWMjvrerTynW4aKiCC3Y1TyEV
/qFbXLC4cweZM0KYY4bkBezlWMEkSM74nNZ2Wd2NyZTX9PvtrhIrJJk+PEufYtcl
N/boaRq6clQ3fMPzmRBRLdW7a4OyFQo5ua7FN5rfTPjvLwGWs3R50CnITGdjmZab
sj7Gz44GSIjCW180sr9LBxCxyghqwOPaDAVu+hzw3zWGOr49upOdvKXwfPx/W50h
d8coBTgF1dfcMipO7QVwzvDOsFu27IsOCJ8YQs3UwnjUX3i1zIWwmwy5JVehMoJX
Y2RH3AJdTvcoiEE8dMn6iDh1ytPWiZuCTBT/1wUQ6BgG1Nzkv/ZWE/OZVupszzph
vYDgNRdKMUlh6p/rT/PX7b5CjY30O7i3d1qd3kEihJD6ilFBRrcp9GDoiBH3QcFR
CzXnQ+v8JSe3d/M/Z8tbiTakjyb5138Jms/AriV+/JXluotuoWm0f8QI32PJURpC
x+1WTrHPNlRPBQfj15Z3h5191R0pskPp4Q219ZJB8pYPrEJ9Z2w=
=aVaE
-----END PGP SIGNATURE-----

--nextPart5012516.31r3eYUQgx--




