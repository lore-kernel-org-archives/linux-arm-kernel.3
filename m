Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60169C71136
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 10:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ndhDy8t8Vqb14/BRGhTagux2Vyu0xrthJAkwAjdEqmU=; b=FChMySkDZGRmkBfehizglBgG7z
	E4ANKLJH7wz3Y3vAoOMALFchH582sh3AUfYiFwJbEFnif3qvwAOVHeEj05R93/+taYmBg2AyZbf3o
	kGUL0tNz+3StHVAX5RKRQBYEJnmNUElW7oyVbJN0WVSDFfqe/4G49DamrV2rIgS7xduKaBuE8XqIy
	7AGoCObYceeFboqGy2GYvSqccxC3JitNcfprvRXsgRSJDLlkMfKd8Cx3ZPorgDyrHHDWVA9S7poTA
	6ClKrOrVQ/qqUkiNLNT/OArbZIvghF3PGY7HLrIIKr4H7NX5lQIiZLLszJw6Vv4AOUbV6597HoZhG
	4j+TISlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR78d-000000044uu-0zmX;
	Mon, 16 Jun 2025 10:32:27 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR6bE-00000003zUD-10dT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 09:57:57 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1uR6b4-0002wJ-5K; Mon, 16 Jun 2025 11:57:46 +0200
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1uR6b3-003mk9-2d;
	Mon, 16 Jun 2025 11:57:45 +0200
Received: from pengutronix.de (p5b1645f7.dip0.t-ipconnect.de [91.22.69.247])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id 7498F428696;
	Mon, 16 Jun 2025 09:57:45 +0000 (UTC)
Date: Mon, 16 Jun 2025 11:57:45 +0200
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Linus Walleij <linus.walleij@linaro.org>, "Chester A. Unal" <chester.a.unal@arinc9.com>, 
	Daniel Golle <daniel@makrotopia.org>, DENG Qingfang <dqfext@gmail.com>, 
	Sean Wang <sean.wang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Vincent Mailhol <mailhol.vincent@wanadoo.fr>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-can@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v2 4/5] net: can: mcp251x: use new GPIO line value setter
 callbacks
Message-ID: <20250616-quick-blazing-dogfish-1d73c3-mkl@pengutronix.de>
References: <20250616-gpiochip-set-rv-net-v2-0-cae0b182a552@linaro.org>
 <20250616-gpiochip-set-rv-net-v2-4-cae0b182a552@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cgo7ltpow6ehzxso"
Content-Disposition: inline
In-Reply-To: <20250616-gpiochip-set-rv-net-v2-4-cae0b182a552@linaro.org>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_025756_295206_88ADE1E0 
X-CRM114-Status: GOOD (  12.91  )
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


--cgo7ltpow6ehzxso
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 4/5] net: can: mcp251x: use new GPIO line value setter
 callbacks
MIME-Version: 1.0

On 16.06.2025 09:24:07, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>=20
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
>=20
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Marc Kleine-Budde <mkl@pengutronix.de>

Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--cgo7ltpow6ehzxso
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEn/sM2K9nqF/8FWzzDHRl3/mQkZwFAmhP6pYACgkQDHRl3/mQ
kZwhTgf/Rdvldz+sfHV1GPN68aLAO5qzKJUWpvJ05B1WZ62FpeQ32yATbOX4Gdza
PXxXP4fcb4CI/tchuSLijWxILlaHeH3XmLKr6dbISHa+3fITiyTfrT8aIVrbXad7
B7Lk/k3xCSpFeIy59IYjx3x/JuVeAlOnId9AnKiv2eXJAJbxta5HNL9XcwpJ59kl
68PO//pu7LDxwyyuxtoMT2xkhBV72NEQPBnK/vzYuw0sVvTxpRi4LuJtW0Twth3G
qSspMeG2q8te19InHtEwF/hvgGE5wPwMf+pH9DBwVdFH0R5yuu4O4mzKTt2Cg6Qv
mNLmJthXx+uFjegch384egz7Aw7oyg==
=8T2d
-----END PGP SIGNATURE-----

--cgo7ltpow6ehzxso--

