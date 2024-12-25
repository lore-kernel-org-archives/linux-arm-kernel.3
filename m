Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F17F3E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Dec 2024 19:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EAra1qhdZK96AgGOf/EgteGRsVPCMYxtHK2qlwvZmbg=; b=cV1RiIsr+2kdb0xiUxYPZ0OFdN
	iIH7t01YJye+f92pHMVVV6+079eSqhih2giWY2APhMFIpcYu0B4SnzfAnQobZaHObJjPlaR0Mim69
	RfQ31rKM1cU6CDMLIV3f7uJ/NpWMNRmwvHBlt0UcKE7oAsRQ+QGmZQ7o31wQooOLyJexJnxLB0xQD
	ZOL3J3qa9K6+vYZEQG1UDCtJSb8S6tj+k0rBqj6x9T/VEXLLH/Yzb+5j7qWlRn3SIdExSvJ8CGSgD
	LsCIQflOPUSk60Iv/u2wZyMrcbbPoHbH/uO2eMNf3L0gcG8ORHYxykq+sIIEqCXeEd4Epg9eIvzCk
	uYI3PXwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQXRt-0000000EGEr-1gs6;
	Wed, 25 Dec 2024 19:53:41 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQXQe-0000000EG6Z-0dNe
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Dec 2024 19:52:26 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1tQXQD-0000Jn-19; Wed, 25 Dec 2024 20:51:57 +0100
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1tQXQ6-005EvM-35;
	Wed, 25 Dec 2024 20:51:51 +0100
Received: from pengutronix.de (2a02-8206-2430-9d00-8f68-253a-4589-f451.dynamic.ewe-ip-backbone.de [IPv6:2a02:8206:2430:9d00:8f68:253a:4589:f451])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id 61711394F8A;
	Wed, 25 Dec 2024 19:50:18 +0000 (UTC)
Date: Wed, 25 Dec 2024 20:50:17 +0100
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Markus Schneider-Pargmann <msp@baylibre.com>
Cc: Chandrasekar Ramakrishnan <rcsekar@samsung.com>, 
	Vincent Mailhol <mailhol.vincent@wanadoo.fr>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, linux-can@vger.kernel.org, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Matthias Schiffer <matthias.schiffer@ew.tq-group.com>, 
	Vishal Mahaveer <vishalm@ti.com>, Kevin Hilman <khilman@baylibre.com>, Dhruva Gole <d-gole@ti.com>, 
	Simon Horman <horms@kernel.org>
Subject: Re: [PATCH v6 1/7] dt-bindings: can: m_can: Add wakeup properties
Message-ID: <20241225-singing-passionate-antelope-88e154-mkl@pengutronix.de>
References: <20241219-topic-mcan-wakeup-source-v6-12-v6-0-1356c7f7cfda@baylibre.com>
 <20241219-topic-mcan-wakeup-source-v6-12-v6-1-1356c7f7cfda@baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="srwhw2v5uya67a3g"
Content-Disposition: inline
In-Reply-To: <20241219-topic-mcan-wakeup-source-v6-12-v6-1-1356c7f7cfda@baylibre.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241225_115224_203248_3E59252D 
X-CRM114-Status: GOOD (  16.99  )
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


--srwhw2v5uya67a3g
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v6 1/7] dt-bindings: can: m_can: Add wakeup properties
MIME-Version: 1.0

On 19.12.2024 20:57:52, Markus Schneider-Pargmann wrote:
> m_can can be a wakeup source on some devices. Especially on some of the
> am62* SoCs pins, connected to m_can in the mcu, can be used to wakeup
> the SoC.
>=20
> The wakeup-source property defines on which devices m_can can be used
> for wakeup and in which power states.
>=20
> The pins associated with m_can have to have a special configuration to
> be able to wakeup the SoC. This configuration is described in the wakeup
> pinctrl state while the default state describes the default
> configuration.
>=20
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>

The DTBS check fails:

| $ make CHECK_DTBS=3Dy ti/k3-am625-beagleplay.dtb
|   DTC [C] arch/arm64/boot/dts/ti/k3-am625-beagleplay.dtb
| arch/arm64/boot/dts/ti/k3-am625-beagleplay.dtb: can@4e08000: wakeup-sourc=
e: 'oneOf' conditional failed, one must be fixed:
|         ['suspend', 'poweroff'] is not of type 'boolean'
|         ['suspend', 'poweroff'] is too long
|         from schema $id: http://devicetree.org/schemas/net/can/bosch,m_ca=
n.yaml#
| arch/arm64/boot/dts/ti/k3-am625-beagleplay.dtb: can@4e08000: wakeup-sourc=
e: ['suspend', 'poweroff'] is not of type 'boolean'
|         from schema $id: http://devicetree.org/schemas/wakeup-source.yaml#
| arch/arm64/boot/dts/ti/k3-am625-beagleplay.dtb: can@4e18000: wakeup-sourc=
e: 'oneOf' conditional failed, one must be fixed:
|         ['suspend', 'poweroff'] is not of type 'boolean'
|         ['suspend', 'poweroff'] is too long
|         from schema $id: http://devicetree.org/schemas/net/can/bosch,m_ca=
n.yaml#
| arch/arm64/boot/dts/ti/k3-am625-beagleplay.dtb: can@4e18000: wakeup-sourc=
e: ['suspend', 'poweroff'] is not of type 'boolean'
|         from schema $id: http://devicetree.org/schemas/wakeup-source.yaml#

Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--srwhw2v5uya67a3g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEUEC6huC2BN0pvD5fKDiiPnotvG8FAmdsYfYACgkQKDiiPnot
vG8yoQf/TvollExLSNWWJR9S7tKurNCmxmlPYket9IZbscYEr9zwGB4CG9v6q/K/
ee5jRaJ7ck8hiUEkIQpHwz8Ek+jq84GAJEQYWDjIT5dZSLwkQsZS54/Nv4wPgrbH
3BPxTlMdkDiFHqlxSX/yOTyTbGD8sc3VU2pXx7DfFBl6C4f7bhup19guLiLosUr1
1Nh8jnttzV2pSiG/YzsMQCuj5SuiCYnFpJnJzgUMRPSm4+WEZHlecq5BnszfWeS3
hqZII3Wg1aCdm+CstUvAw+jIfa1InbNjtS2drU5kOsiawKcK0gzdCzQ0cBvvylaf
bpK/ypEN0QZZxuSAkpBmm6+xF1hAyQ==
=WQRL
-----END PGP SIGNATURE-----

--srwhw2v5uya67a3g--

