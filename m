Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92CFBC5B552
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 May 2025 09:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YDcQoFFC4NqCXcyobvRRuP1Ua4ytiuIE7XjIkD34fbk=; b=u43uYEzmtHNM8ipTs5MYajjL38
	h0qaOgQURML+i4g8WYK6SZE6R/6vSdVucCMMgxLc745llOTW/QQL69mBag++0aGF9KLl+m/ZXgtZG
	ERHfuFXlRXoJcNR+uX0xfjm0zS+dvkpNhxom36iTzVa0xRZIqfCig6N7MU/NtoY2DE2FwEDoH/eeS
	F97trEHNCcBPOPf/KbXBdsgCxqAHh/AAYnRHtzmwv7KbnwmNAJsArklM80frzMop2hNk3Y7CdpUmF
	c+ZSxY3AfIv/JyvvsTW6xQ1ebEK96vLAnUrVrKqofK9uPgVVQDyjglmbexPmrfjJ8sk38os0jdTPI
	NHAzngZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKvrv-000000005wg-2Ngx;
	Fri, 30 May 2025 09:17:39 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKvjR-000000004uC-0cQM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 May 2025 09:08:55 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id D06D643349;
	Fri, 30 May 2025 09:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1748596129;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YDcQoFFC4NqCXcyobvRRuP1Ua4ytiuIE7XjIkD34fbk=;
	b=ZB1U/Pdfi7HtDnqYB1OWNlxulO3P8Fzu1T1afPYQ754WfHDNuOCqhr37hUY6ZczMdot6mN
	iKfgB57p8ne86qqiVAZL4T0zsuD2oXjkNi9Lx3+FRbgiijwLmb9ZSxZ3KK2eC8Xqd9CioZ
	yzOYPApcG7YNnNy58ZNYVwhc7L78+lx/W8BrCXo2NEU35lMAFE1SSpZx26hyQJVZ3Nrnmb
	w6+mG5x8R8W7GNQ2s81ezwluiyStYudEhpPnKiYruUKX3GhapRbICKk4/l3DWhZDNjo9ME
	QUFFW58toUQT05s34GNXa92rPdx7Bu+JwK3kC06Yh9cWmK4T9/7lyc5QvFJqLA==
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
Date: Fri, 30 May 2025 11:08:41 +0200
Message-ID: <12687918.O9o76ZdvQC@fw-rgant>
In-Reply-To: <aDliS9uMFaLf2lCV@shell.armlinux.org.uk>
References: <20250507135331.76021-1-maxime.chevallier@bootlin.com>
 <6159237.lOV4Wx5bFT@fw-rgant> <aDliS9uMFaLf2lCV@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart5904461.DvuYhMxLoT";
 micalg="pgp-sha512"; protocol="application/pgp-signature"
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgddvkeeiudculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkjghfgggtsehgtderredttdejnecuhfhrohhmpeftohhmrghinhcuifgrnhhtohhishcuoehrohhmrghinhdrghgrnhhtohhishessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhephfdvleekvefgieejtdduieehfeffjefhleegudeuhfelteduiedukedtieehlefgnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehffidqrhhgrghnthdrlhhotggrlhhnvghtpdhmrghilhhfrhhomheprhhomhgrihhnrdhgrghnthhoihhssegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeeftddprhgtphhtthhopehlihhnuhigsegrrhhmlhhinhhugidrohhrghdruhhkpdhrtghpthhtohepmhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomhdprhgtphhtthhopegurghvvghmsegurghvvghmlhhofhhtrdhnvghtpdhrtghpthhtohepnhgvthguvghvsehvg
 hgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrghrmhdqmhhsmhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopegrnhgurhgvfieslhhunhhnrdgthh
X-GND-Sasl: romain.gantois@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250530_020853_817792_B3E9E890 
X-CRM114-Status: GOOD (  24.77  )
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

--nextPart5904461.DvuYhMxLoT
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Romain Gantois <romain.gantois@bootlin.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Date: Fri, 30 May 2025 11:08:41 +0200
Message-ID: <12687918.O9o76ZdvQC@fw-rgant>
In-Reply-To: <aDliS9uMFaLf2lCV@shell.armlinux.org.uk>
MIME-Version: 1.0

On Friday, 30 May 2025 09:46:19 CEST Russell King (Oracle) wrote:
> On Fri, May 30, 2025 at 09:28:11AM +0200, Romain Gantois wrote:
> > On Thursday, 29 May 2025 15:23:22 CEST Russell King (Oracle) wrote:
> > > On Wed, May 28, 2025 at 09:35:35AM +0200, Romain Gantois wrote:
> > > > > In that regard, you can consider 1000BaseX as a MII mode (we do have
> > > > > PHY_INTERFACE_MODE_1000BASEX).
> > > > 
> > > > Ugh, the "1000BaseX" terminology never ceases to confuse me, but yes
> > > > you're
> > > > right.
> > > 
> > > 1000BASE-X is exactly what is described in IEEE 802.3. It's a PHY
> > > interface mode because PHYs that use SerDes can connect to the host
> > > using SGMII or 1000BASE-X over the serial link.
> > > 
> > > 1000BASE-X's purpose in IEEE 802.3 is as a protocol for use over
> > > fibre links, as the basis for 1000BASE-SX, 1000BASE-LX, 1000BASE-EX
> > > etc where the S, L, E etc are all to do with the properties of the
> > > medium that the electrical 1000BASE-X is sent over. It even includes
> > > 1000BASE-CX which is over copper cable.
> > 
> > Ah makes sense, thanks for the explanation. I guess my mistake was
> > assuming
> > that MAC/PHY interface modes were necessarily strictly at the
> > reconciliation sublayer level, and didn't include PCS/PMA functions.
> 
> When a serdes protocol such as SGMII, 1000BASE-X, or 10GBASE-R is being
> used with a PHY, the IEEE 802.3 setup isn't followed exactly - in
> effect there are more layers.
> 
> On the SoC:
> 
> 	MAC
> 	Reconciliation (RS)
> 	PCS
> 	SerDes (part of the PMA layer)
> 
> On the PHY side of the SerDes host-to-phy link:
> 
> 	SerDes
> 	PCS (which may or may not be exposed in the PHY register set,
> 	     and is normally managed by the PHY itself)
> 	(maybe other layers, could include MACs	back-to-back)
> 	PCS
> 	PMA
> 	PMD
> 
> Hope that helps explain what's going on a little more.

Definitely helps a lot, thanks.

-- 
Romain Gantois, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--nextPart5904461.DvuYhMxLoT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEYFZBShRwOvLlRRy+3R9U/FLj284FAmg5dZkACgkQ3R9U/FLj
285M0g/+Nz1A6obdeKee0RLc6MA2gBvM/EmqYPQ6ZduN6VFL2D6J4NATyQRqu/VW
u4d0pjD2ZOe44w6eAeRcWHsC0LJYfnHPPMhxekF2l+qqggkvZDGp9BmWJZd5UUe0
dDxur4qI6XF2WlWDXyf9auZ3iGvqOUnWYK7VsLu/1hMYeC8M0Q+5dwy72//aAGnH
9lyBU77a7sd3Qhlnd5Flg5f9ZuQmfqcD7Hyjp0OXdSJr7TlXLPJ+4FffNTivOQMK
WonmDnfUOSPfxukMd0ozR7Z2BdvUeKPrlQq6yvcC5aS+9WZvVWCZzLOLrlBylu50
wtEnYLpXd8QVehLsZGfE8mB4u+IuJICnEKhhrQ7YSLdjmXkj4VHCZHjl28WrI5rP
wMCczhfYk4tDM83L2TBDVX5DTvcIcBawWlGxwzOdZ8WbipSVt5LZMtAkICE9TZzz
j0oJ6+4xxi8mXGVduWD7kztOgXFl+UAx9GG8RsWoSPE0+t1f2nO0YV55UTW5RhEA
/hNR+P1Z8pB9SHjHM9TskW6LC4Z/NEIBnI0N98BacAdjSc/KX4uHSH01ANVHRyEs
wD5PJQKAj705h81tvNA4RzUkqC+UAa9bjtE3gtqj0KnusZhSiPBtIRe55sJ3W9aU
uYNbFO3CW8dD+WMqYm9fQrWtbqX/tOWRCOzdM5KMSNpbVyBWNDs=
=r0Tf
-----END PGP SIGNATURE-----

--nextPart5904461.DvuYhMxLoT--




