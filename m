Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D819FE77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 13:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UPoYpFgpSWIiMAtH7UMQ7JuVf2JgTqlvu+3kYmhb1yg=; b=ptO1mPEm/Ms1Suw09JMEVq/Epw
	2oofLKtjpOoMnA94D3vfFEsBHuMZzRC9QZE67qV7pZ5DjFYs7dFNy+E7Xv9WhawSL0ixv0dfZnMsJ
	xmCPvgne7uDp58BpNVY7UBzDe9pGCzhLWeKW/q2hZcT19o0HHyToBT9CfSZWXviXZXXKtk8jieTXy
	oy3Rq5EbUOERx/7JC5BDBcazOBlvdsBToNIKqRYXOEOyvRpYAJPkFcqVJGc0OhHyfGZ6MO8bDIkwT
	P4UOZtj8x78Ryat0ZYw0vZDtlkGiDjHv+wqrHNX+8/GSDwM09XGKPnsl+kk67Ae59aWN6vOzL4IWj
	/W/VGMPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV9Iw-00000004vlh-0g4o;
	Tue, 07 Jan 2025 13:07:30 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV9Fv-00000004tqO-2JtX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 13:04:27 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1tV9FZ-0003iC-6R; Tue, 07 Jan 2025 14:04:01 +0100
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1tV9FV-007Lc1-27;
	Tue, 07 Jan 2025 14:03:58 +0100
Received: from pengutronix.de (pd9e59fec.dip0.t-ipconnect.de [217.229.159.236])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id E073E3A08A6;
	Tue, 07 Jan 2025 13:03:57 +0000 (UTC)
Date: Tue, 7 Jan 2025 14:03:57 +0100
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Doug Berger <opendmb@gmail.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, Vincent Mailhol <mailhol.vincent@wanadoo.fr>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Kalle Valo <kvalo@kernel.org>, Oleksij Rempel <o.rempel@pengutronix.de>, 
	Dario Binacchi <dariobin@libero.it>, Christophe Roullier <christophe.roullier@foss.st.com>, 
	Grygorii Strashko <grygorii.strashko@ti.com>, Siddharth Vadapalli <s-vadapalli@ti.com>, 
	Roger Quadros <rogerq@kernel.org>, Brian Norris <briannorris@chromium.org>, 
	Frank Li <Frank.Li@nxp.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-can@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-wireless@vger.kernel.org
Subject: Re: [PATCH net-next] dt-bindings: net: Correct indentation and style
 in DTS example
Message-ID: <20250107-cocky-industrious-hare-c508f6-mkl@pengutronix.de>
References: <20250107125613.211478-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5vdg3z53mqf4igqc"
Content-Disposition: inline
In-Reply-To: <20250107125613.211478-1-krzysztof.kozlowski@linaro.org>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_050423_594024_F704C1F3 
X-CRM114-Status: GOOD (  15.71  )
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


--5vdg3z53mqf4igqc
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH net-next] dt-bindings: net: Correct indentation and style
 in DTS example
MIME-Version: 1.0

On 07.01.2025 13:56:13, Krzysztof Kozlowski wrote:
> DTS example in the bindings should be indented with 2- or 4-spaces and
> aligned with opening '- |', so correct any differences like 3-spaces or
> mixtures 2- and 4-spaces in one binding.
>=20
> No functional changes here, but saves some comments during reviews of
> new patches built on existing code.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../bindings/net/can/bosch,c_can.yaml         | 10 +-
>  .../bindings/net/can/microchip,mcp2510.yaml   | 18 ++--

Acked-by: Marc Kleine-Budde <mkl@pengutronix.de> # for net/can

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--5vdg3z53mqf4igqc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEUEC6huC2BN0pvD5fKDiiPnotvG8FAmd9JjoACgkQKDiiPnot
vG9NNgf/SxxAC8UsIuL4bDVaIUg+kAj0yKfrwEWjhutunUKK24lVKylz+/UY8+zv
3+LqniAsnEwHJPxLZ5S0rCe2+qZ6gsvXSBlQSqEJukZOzpWNVYECd8Wf8Q8dQzu+
qYoaEgvr5jcwNUr+cdrPvhyn4CXuNJCsdmwpfJn98S6XLhwSX+SxgiSUAkXpRmQn
EE2nnt52Dbrrk4CILlRtPPpd0/hsAXMEWGjIUBYW2f/FJqVNv+yPwZiEsIC2iDSG
V4fs/zJxh98GK89T2fN8fRzlMTG9pMPmWaQLbMPmVkHn5eJbX7LUoQzmSBe6Kgc3
I+WqIjPZzj6L9ubrNZg4MgJ3t+T4tg==
=gbSE
-----END PGP SIGNATURE-----

--5vdg3z53mqf4igqc--

