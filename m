Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B72EC36014
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Mar 2025 21:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M1kAHr/2LuQvRfK4BWV3MaCLSiNlbrzzetn6/mOgDms=; b=bDjgBd4AigxpYppn1ykD5Nxx9y
	LaJDzvKhWoq56TxC/Odp6y4xka9lfgmFZQA1b9UmKsHccnSt+Z+myLlw/uH6Kv7VG5cjGo7Kg3F7G
	xGfZuYi/Nnx3+BLQqyUN18QVfij+fHMRBcODgQPUTqu78wxyGaTIi9NoqINoDbiOkDgi2VVKAoveh
	a4CL4jUFOwZ67C6Z4j/oSzWK9AUL6468IBEP1j+6fFuMzDmUsotDHH0mqX0G+1MWMyjraMveVt7AZ
	8b6ZRljyVkQ3uK7CvPfWPl5jtgwZBfJJoAl1396MV3ah58K6pcLGYoJogcN2gfX8Aszyr7UIM7cX+
	JKDq4/Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzMxT-00000001Ro4-2hfj;
	Mon, 31 Mar 2025 21:46:15 +0000
Received: from mx.denx.de ([2a03:4000:64:cc:545d:19ff:fe05:8172])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzMvK-00000001RSC-0WMG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Mar 2025 21:44:03 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E6F7110252BE4;
	Mon, 31 Mar 2025 23:43:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1743457439; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=M1kAHr/2LuQvRfK4BWV3MaCLSiNlbrzzetn6/mOgDms=;
	b=FpFIRWS0in2BDlOktoENOy68ru7VF3ykJs8txMirTePb7Q4K1Gtr6XHTCoOSn41RdnWWuy
	K47+YU03mchrcMLsKbJvGKCy6MqTjCBje0bv0udcUuZ5ZBRLTXp/zWEWMM8NtrAz2R6V9Z
	lapLT7i6oUKfGgoQVsV1XVwrfg3o3iZYNJbVsXCeqUKvrkAa8kQ68z05RYashS/aQXcTcK
	QQ3BLhqSfl5wkK1DzU2/V4DL5IvhfRFezk76P5OhPvTJT5Jxr8SivBhXjjo9UtonWtMk7K
	D1Zh72wHWCOjUSuPrUTWTMbmGj+emsVXuoem0/kFEOj9VFmuJaPqZj9wIbfRRA==
Date: Mon, 31 Mar 2025 23:43:54 +0200
From: Lukasz Majewski <lukma@denx.de>
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Shawn Guo
 <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 3/4] ARM: dts: nxp: mxs: Adjust XEA board's DTS to
 support L2 switch
Message-ID: <20250331234354.6032a4c0@wsk>
In-Reply-To: <7fa1b5c7-d5c5-45be-af6d-ae97a76eccae@gmx.net>
References: <20250331103116.2223899-1-lukma@denx.de>
	<20250331103116.2223899-4-lukma@denx.de>
	<7fa1b5c7-d5c5-45be-af6d-ae97a76eccae@gmx.net>
Organization: denx.de
X-Mailer: Claws Mail 3.19.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/N4y+i2Yc7WjNKxm/ab1iCGE";
 protocol="application/pgp-signature"; micalg=pgp-sha512
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_144402_448114_3C1572D2 
X-CRM114-Status: GOOD (  27.02  )
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

--Sig_/N4y+i2Yc7WjNKxm/ab1iCGE
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Stefan,

> Hi,
>=20
> Am 31.03.25 um 12:31 schrieb Lukasz Majewski:
> > The description is similar to the one used with the new CPSW driver.
> >
> > Signed-off-by: Lukasz Majewski <lukma@denx.de>
> > ---
> > Changes for v2:
> > - Remove properties which are common for the imx28(7) SoC
> > - Use mdio properties to perform L2 switch reset (avoid using
> >    deprecated properties)
> >
> > Changes for v3:
> > - Replace IRQ_TYPE_EDGE_FALLING with IRQ_TYPE_LEVEL_LOW
> > - Update comment regarding PHY interrupts s/AND/OR/g
> > ---
> >   arch/arm/boot/dts/nxp/mxs/imx28-xea.dts | 54
> > +++++++++++++++++++++++++ 1 file changed, 54 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/nxp/mxs/imx28-xea.dts
> > b/arch/arm/boot/dts/nxp/mxs/imx28-xea.dts index
> > 6c5e6856648a..8642578fddf3 100644 ---
> > a/arch/arm/boot/dts/nxp/mxs/imx28-xea.dts +++
> > b/arch/arm/boot/dts/nxp/mxs/imx28-xea.dts @@ -5,6 +5,7 @@
> >    */
> >
> >   /dts-v1/;
> > +#include<dt-bindings/interrupt-controller/irq.h>
> >   #include "imx28-lwe.dtsi"
> >
> >   / {
> > @@ -90,6 +91,59 @@ &reg_usb_5v {
> >   	gpio =3D <&gpio0 2 0>;
> >   };
> >
> > +&eth_switch {
> > +	pinctrl-names =3D "default";
> > +	pinctrl-0 =3D <&mac0_pins_a>, <&mac1_pins_a>;
> > +	phy-supply =3D <&reg_fec_3v3>;
> > +	status =3D "okay";
> > +
> > +	ethernet-ports {
> > +		#address-cells =3D <1>;
> > +		#size-cells =3D <0>;
> > +
> > +		mtip_port1: port@1 {
> > +			reg =3D <1>;
> > +			label =3D "lan0";
> > +			local-mac-address =3D [ 00 00 00 00 00 00 ];
> > +			phy-mode =3D "rmii";
> > +			phy-handle =3D <&ethphy0>;
> > +		};
> > +
> > +		mtip_port2: port@2 {
> > +			reg =3D <2>;
> > +			label =3D "lan1";
> > +			local-mac-address =3D [ 00 00 00 00 00 00 ];
> > +			phy-mode =3D "rmii";
> > +			phy-handle =3D <&ethphy1>;
> > +		};
> > +	};
> > +
> > +	mdio_sw: mdio {
> > +		#address-cells =3D <1>;
> > +		#size-cells =3D <0>;
> > +
> > +		reset-gpios =3D <&gpio3 21 0>; =20
> i'm a huge fan of the polarity defines, which makes it easier to
> understand.
>=20

Ok.

> Btw since you introduced the compatible in the DTS of a i.MX28 board,
> it would be nice to also enable the driver in mxs_defconfig.

Yes, thanks for the tip.

>=20
> Regards
> > +		reset-delay-us =3D <25000>;
> > +		reset-post-delay-us =3D <10000>;
> > +
> > +		ethphy0: ethernet-phy@0 {
> > +			reg =3D <0>;
> > +			smsc,disable-energy-detect;
> > +			/* Both PHYs (i.e. 0,1) have the same,
> > single GPIO, */
> > +			/* line to handle both, their interrupts
> > (OR'ed) */
> > +			interrupt-parent =3D <&gpio4>;
> > +			interrupts =3D <13 IRQ_TYPE_LEVEL_LOW>;
> > +		};
> > +
> > +		ethphy1: ethernet-phy@1 {
> > +			reg =3D <1>;
> > +			smsc,disable-energy-detect;
> > +			interrupt-parent =3D <&gpio4>;
> > +			interrupts =3D <13 IRQ_TYPE_LEVEL_LOW>;
> > +		};
> > +	};
> > +};
> > +
> >   &spi2_pins_a {
> >   	fsl,pinmux-ids =3D <
> >   		MX28_PAD_SSP2_SCK__SSP2_SCK =20
>=20


Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Erika Unter
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/N4y+i2Yc7WjNKxm/ab1iCGE
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAmfrDJoACgkQAR8vZIA0
zr3UJQgA0HyhfyDsLGObOeUIL/btg74vBxnJ2OTGDfIniD4pupQW+Cn0MwjEK6GX
Fp9QA2fyp0ExoXwOcECHPiTRz5uVeYyQ/mw7rvtTJ+P3mYFhGkyyjiAK2wSJCZ3L
WJZhqR4APlr1nIBc3j8ROlplZ+oOMwXKO4TCHApE+JGHXFWhMnGc8T0asmKV3sx6
exPXHFhNNFqmiBj/ZfIKR3zwGj+8zgZYQaDyU4vTuy69iOMPiq0IN0+rsrFSf2B7
75p2+JhOken4DV/6MK1DhpBqs7eGz0JCC4A2pRAcjCMWLTfE2kD6pf21l+IrmLdD
TKlO2eLMKaTfXEp7FJ8oNwJqUSmfZw==
=X/u9
-----END PGP SIGNATURE-----

--Sig_/N4y+i2Yc7WjNKxm/ab1iCGE--

