Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11C33C282CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 17:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xPpTerC4hLINRf1Gupo5oTIIFDAqKCP0hsRiaiP783g=; b=X1J6gAZI5jxwnjVj+1Tf1R7tKm
	4GnGcACwSBfFnHZ8Y0kkXBKHJLTEgvAm7vIo/VVFyhevaB6hdE+Gjv8+InkJm0pzx06HPWvuAW/3X
	cREZpTxlbP+bQK6lwuJp0tW8byT3QJ3INsCdYUoMyodgv6NNfntGF4HDeG4coXRaCyzz6ytDI3nrx
	g3jtHF4HcE2gYsXDwlAI/F342VKykE59MspHJtJ45y8VMO+oT4u9mu5xiLWTziju8ivaWVshcl7hc
	6ROZwlZgmYC+/tTbzy0RZHpi0VA7UM6SS+WGBAXlEyxrCYls1Ocnem3sZWHTCeaZs29q8WnKcX9yq
	QLe4FGXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp9t1-00000001pTN-2UOD;
	Mon, 03 Mar 2025 17:47:27 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp9rQ-00000001p5Y-23wl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 17:45:50 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id E72C84432F;
	Mon,  3 Mar 2025 17:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1741023945;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xPpTerC4hLINRf1Gupo5oTIIFDAqKCP0hsRiaiP783g=;
	b=ZUNleldDt2otWbBhV/st1ZKBAlw4HXcV0O5aPm0w6XjDXI0zSlX7j5lk0zXGPqU8pRm75D
	X/NmpvIhAqp08+TOksq5Gy9iIUc8PSQ3IlDi3bF1rOrSUBaBuoCYfuZw9EQqJWwAEHCRZb
	TRl8FtQWhuQ0wgyMQr8vVYmbOQ2QJiwKS2503RpKRrnKI5a4Q00i2mqONBrXFCiJ9sz0//
	IKVyIAcJeh+kLbunUWZdZH5cQ5QRd8UHYVaxlyMAp2zRaCPXuVo32P6HwEoMfLn1vZfjFX
	MF16m7EqA/fRw0WEZPGzTeFhXno5wNH6fska6ejdt++L7x8/2y4E6Xv5Y0bJAA==
Date: Mon, 3 Mar 2025 18:45:43 +0100
From: Kory Maincent <kory.maincent@bootlin.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: davem@davemloft.net, Andrew Lunn <andrew@lunn.ch>, Jakub Kicinski
 <kuba@kernel.org>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Heiner Kallweit <hkallweit1@gmail.com>, Parthiban
 Veerasooran <parthiban.veerasooran@microchip.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com,
 linux-arm-kernel@lists.infradead.org, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Herve Codina <herve.codina@bootlin.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean
 <vladimir.oltean@nxp.com>, Oleksij Rempel <o.rempel@pengutronix.de>, Simon
 Horman <horms@kernel.org>, Romain Gantois <romain.gantois@bootlin.com>,
 Piergiorgio Beruto <piergiorgio.beruto@gmail.com>
Subject: Re: [PATCH net v2] net: ethtool: netlink: Allow NULL nlattrs when
 getting a phy_device
Message-ID: <20250303184543.33f74191@kmaincent-XPS-13-7390>
In-Reply-To: <20250301141114.97204-1-maxime.chevallier@bootlin.com>
References: <20250301141114.97204-1-maxime.chevallier@bootlin.com>
Organization: bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdelleejiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthhqredtredtjeenucfhrhhomhepmfhorhihucforghinhgtvghnthcuoehkohhrhidrmhgrihhntggvnhhtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpefguddtfeevtddugeevgfevtdfgvdfhtdeuleetffefffffhffgteekvdefudeiieenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghlohepkhhmrghinhgtvghnthdqigfrufdqudefqdejfeeltddpmhgrihhlfhhrohhmpehkohhrhidrmhgrihhntggvnhhtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvuddprhgtphhtthhopehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvthdprhgtphhtthhopegrnhgurhgvfieslhhunhhnrdgthhdprhgtphhtthhopehkuhgsrgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepv
 gguuhhmrgiivghtsehgohhoghhlvgdrtghomhdprhgtphhtthhopehprggsvghnihesrhgvughhrghtrdgtohhmpdhrtghpthhtohephhhkrghllhifvghithdusehgmhgrihhlrdgtohhmpdhrtghpthhtohepphgrrhhthhhisggrnhdrvhgvvghrrghsohhorhgrnhesmhhitghrohgthhhiphdrtghomh
X-GND-Sasl: kory.maincent@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_094548_658577_A3410AA0 
X-CRM114-Status: GOOD (  15.16  )
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

On Sat,  1 Mar 2025 15:11:13 +0100
Maxime Chevallier <maxime.chevallier@bootlin.com> wrote:

> ethnl_req_get_phydev() is used to lookup a phy_device, in the case an
> ethtool netlink command targets a specific phydev within a netdev's
> topology.
>=20
> It takes as a parameter a const struct nlattr *header that's used for
> error handling :
>=20
>        if (!phydev) {
>                NL_SET_ERR_MSG_ATTR(extack, header,
>                                    "no phy matching phyindex");
>                return ERR_PTR(-ENODEV);
>        }
>=20
> In the notify path after a ->set operation however, there's no request
> attributes available.
>=20
> The typical callsite for the above function looks like:
>=20
> 	phydev =3D ethnl_req_get_phydev(req_base, tb[ETHTOOL_A_XXX_HEADER],
> 				      info->extack);
>=20
> So, when tb is NULL (such as in the ethnl notify path), we have a nice
> crash.
>=20
> It turns out that there's only the PLCA command that is in that case, as
> the other phydev-specific commands don't have a notification.
>=20
> This commit fixes the crash by passing the cmd index and the nlattr
> array separately, allowing NULL-checking it directly inside the helper.
>=20
> Fixes: c15e065b46dc ("net: ethtool: Allow passing a phy index for some
> commands") Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.co=
m>

Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>

Thank you!

--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

