Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5232AE77199
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 12:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pp8Ijekn8G4MgxmczEQf9rlWAtsOBbH2TtImnlKkZ+w=; b=eHTMHpmnjWKPHhNJtdrRvgDuMy
	S9RRFCGkp2Z6/P7IRwAw2QWyvSyCO+KM9MhGCKbpOap2YcOmkCCLgRkP6/jM07lndbFrXe4gPJ82m
	FvPmZyUJjrSR3Ni4Mn3oOiqimWdZ6Q+xUnHWsZ4W04+5Ghw+bkmF40OjvABPu2NYrt0ssbbLfC04A
	rwQFfKNfS4VqkuxYbxO8gdMsRdUSNtl6Y3rZCUesnq/HsdTBlQWG6SPGtMO/0gqH/KUens0oDu80n
	mqZYmVZ/opeb+dv/oYPbYY/42gkHgeJ92cDvAs6JdUhprzhxpu4jAZ73APsGv+JzJosOS9ybnDxiJ
	b44/BqZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV8UF-00000004jMw-0U3h;
	Tue, 07 Jan 2025 12:15:07 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV8LF-00000004goJ-31Fb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 12:05:53 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1tV8Ku-0000EA-8n; Tue, 07 Jan 2025 13:05:28 +0100
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1tV8Kq-007L5X-2G;
	Tue, 07 Jan 2025 13:05:25 +0100
Received: from pengutronix.de (pd9e59fec.dip0.t-ipconnect.de [217.229.159.236])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id 02F0E3A07D8;
	Tue, 07 Jan 2025 12:05:25 +0000 (UTC)
Date: Tue, 7 Jan 2025 13:05:24 +0100
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
Message-ID: <20250107-liberal-unique-uakari-0ddc2c-mkl@pengutronix.de>
References: <20241219-topic-mcan-wakeup-source-v6-12-v6-0-1356c7f7cfda@baylibre.com>
 <20241219-topic-mcan-wakeup-source-v6-12-v6-1-1356c7f7cfda@baylibre.com>
 <20241225-singing-passionate-antelope-88e154-mkl@pengutronix.de>
 <d6hukfwjqgtwqjgvo65icmpzbm32ob6n7ehrzlywwomjbdn5lg@2wm53244pszz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="irxivooeuvii5qqy"
Content-Disposition: inline
In-Reply-To: <d6hukfwjqgtwqjgvo65icmpzbm32ob6n7ehrzlywwomjbdn5lg@2wm53244pszz>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_040549_757215_24EC7567 
X-CRM114-Status: GOOD (  26.29  )
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


--irxivooeuvii5qqy
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v6 1/7] dt-bindings: can: m_can: Add wakeup properties
MIME-Version: 1.0

On 07.01.2025 10:53:26, Markus Schneider-Pargmann wrote:
> On Wed, Dec 25, 2024 at 08:50:17PM +0100, Marc Kleine-Budde wrote:
> > On 19.12.2024 20:57:52, Markus Schneider-Pargmann wrote:
> > > m_can can be a wakeup source on some devices. Especially on some of t=
he
> > > am62* SoCs pins, connected to m_can in the mcu, can be used to wakeup
> > > the SoC.
> > >=20
> > > The wakeup-source property defines on which devices m_can can be used
> > > for wakeup and in which power states.
> > >=20
> > > The pins associated with m_can have to have a special configuration to
> > > be able to wakeup the SoC. This configuration is described in the wak=
eup
> > > pinctrl state while the default state describes the default
> > > configuration.
> > >=20
> > > Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> >=20
> > The DTBS check fails:
> >=20
> > | $ make CHECK_DTBS=3Dy ti/k3-am625-beagleplay.dtb
> > |   DTC [C] arch/arm64/boot/dts/ti/k3-am625-beagleplay.dtb
> > | arch/arm64/boot/dts/ti/k3-am625-beagleplay.dtb: can@4e08000: wakeup-s=
ource: 'oneOf' conditional failed, one must be fixed:
> > |         ['suspend', 'poweroff'] is not of type 'boolean'
> > |         ['suspend', 'poweroff'] is too long
> > |         from schema $id: http://devicetree.org/schemas/net/can/bosch,=
m_can.yaml#
> > | arch/arm64/boot/dts/ti/k3-am625-beagleplay.dtb: can@4e08000: wakeup-s=
ource: ['suspend', 'poweroff'] is not of type 'boolean'
> > |         from schema $id: http://devicetree.org/schemas/wakeup-source.=
yaml#
> > | arch/arm64/boot/dts/ti/k3-am625-beagleplay.dtb: can@4e18000: wakeup-s=
ource: 'oneOf' conditional failed, one must be fixed:
> > |         ['suspend', 'poweroff'] is not of type 'boolean'
> > |         ['suspend', 'poweroff'] is too long
> > |         from schema $id: http://devicetree.org/schemas/net/can/bosch,=
m_can.yaml#
> > | arch/arm64/boot/dts/ti/k3-am625-beagleplay.dtb: can@4e18000: wakeup-s=
ource: ['suspend', 'poweroff'] is not of type 'boolean'
> > |         from schema $id: http://devicetree.org/schemas/wakeup-source.=
yaml#
>=20
> Thanks, the bot also notified me about this issue. I wasn't able to
> solve it without updating the dt-schema, so I submitted a pull request
> there:
>=20
> https://github.com/devicetree-org/dt-schema/pull/150

I see, please add to the patch description that it depends on the that
PR and re-post once it is accepted.

Thanks,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--irxivooeuvii5qqy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEUEC6huC2BN0pvD5fKDiiPnotvG8FAmd9GIEACgkQKDiiPnot
vG+zTQgAihSGsmCQN7GOCUVL0pLqGfQ+AHZnIQy8rwBO01Z59sh6sqoE9gXb798d
gHsC/et9Mcrq7CetVsitQgE0+4+1byxSBFQsfBmAY6IAlwoOwmMSMPNYldCs4y13
XtQJnDDPc1zNgj5JGzoTbTs2ysu+qUK+N1lZDAkXd3k78OR9Lh2080q99UxeVFsX
OF2/+FBp5tuxIbKwjpCY61XgW7zZKBQ3/weFrZUeGbeqeV33NOvUr+mvYXJmNG8O
9IlOGY3my6JDMiYg4H6aGUwV2YmeBO3HgaUCJyJ+La+/J2odyAyxTWEUIacvgfDd
p+TND+ZVqXJIXALf8Jk+iKfyB/c9mQ==
=usZs
-----END PGP SIGNATURE-----

--irxivooeuvii5qqy--

