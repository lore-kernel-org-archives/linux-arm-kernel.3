Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CC3BC021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 21:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jSyg4m32Z211cyBXnbFEQqvd1CvDN7Q9P47t+0FLggc=; b=1vuFqmopa064VYguOhnR5t9rq0
	x9LD0IMvDfY4AlFdavkAosSRo8qJxnSCxdGoGOplw85HGTPY6SXOckOIwy7RxAkNZKCuBtcI8XxYS
	Ap4BXQiYOW7Ymkwu9ONPh1g2PU0NtK05YYJJhP6c6+FZiLzIIhbZDE0RmpbwGqM1KrhuFTlbWHFSg
	FBnPx88BASG+FFrI7QttlAePpxkfKhM+/qXSGwtt1FstU4IuKzEzfkgVqYA7isJ8D5kMP2aNjRHkF
	K2VFvh+BRAcJOMNbXWU7c+dGG/rHLK+Sy3JhK9macq6J1f/TXU5OmIS5tTW1U7stO8kOfUtBVM2l6
	sqUXOdEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tn2Bg-00000001UoI-3Hzf;
	Tue, 25 Feb 2025 21:09:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tn1YV-00000001Myr-22Xa
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 25 Feb 2025 20:29:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=jSyg4m32Z211cyBXnbFEQqvd1CvDN7Q9P47t+0FLggc=; b=RfwLf+aNt2xLB6YNUgqm5JmHdt
	IWXGR56acdt87d+C5QqDcN4GKiWCWyjuuiMeZoZNaW0iAjZXqV6aTCGhoZ0dyIvO7AlZlQRyqIUnr
	jU+qav4a40WBUQeDyFikLOdRjW4Mg1mHa80zHBPlv10ZRFKkEolG86dh3MvQN0+zEuGrG6h6WNNcP
	D+7K7B2l90HVt9DXlA7ll7mJr5v/zl1zJ1upZ3N4m1s2OQEZmH/JDuuaG1uTh8dhDE9vvt2FJfTwn
	x5uDNnOxMUiNt+V3Bbf8QVUukO0BumFWh9n+4XqYCfZlzcfmcncV6I1Zq8nyBPXUBn9uVao9xEjp9
	Mct/BD6A==;
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tn1YS-00000003QRp-1iFG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 20:29:26 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1tn1YL-0004PK-Uh; Tue, 25 Feb 2025 21:29:17 +0100
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1tn1YL-002pgi-1j;
	Tue, 25 Feb 2025 21:29:17 +0100
Received: from pengutronix.de (p5b164285.dip0.t-ipconnect.de [91.22.66.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id 1E0533CBC87;
	Tue, 25 Feb 2025 20:29:17 +0000 (UTC)
Date: Tue, 25 Feb 2025 21:29:16 +0100
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Chester Lin <chester62515@gmail.com>, 
	Matthias Brugger <mbrugger@suse.com>, Conor Dooley <conor+dt@kernel.org>, imx@lists.linux.dev, 
	Enric Balletbo <eballetb@redhat.com>, linux-arm-kernel@lists.infradead.org, 
	Christophe Lizzi <clizzi@redhat.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	linux-kernel@vger.kernel.org, Alberto Ruiz <aruizrui@redhat.com>, NXP S32 Linux <s32@nxp.com>, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: s32g: add FlexCAN[0..3] support for s32g2
 and s32g3
Message-ID: <20250225-private-savvy-caracal-3e7f47-mkl@pengutronix.de>
References: <20250224134016.3921196-1-ciprianmarian.costea@oss.nxp.com>
 <174051414934.2971045.13322665811292325537.robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hyjls6qa3nf4o47i"
Content-Disposition: inline
In-Reply-To: <174051414934.2971045.13322665811292325537.robh@kernel.org>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_202924_584756_35E4B0F2 
X-CRM114-Status: GOOD (  19.87  )
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


--hyjls6qa3nf4o47i
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] arm64: dts: s32g: add FlexCAN[0..3] support for s32g2
 and s32g3
MIME-Version: 1.0

On 25.02.2025 14:12:30, Rob Herring (Arm) wrote:
>=20
> On Mon, 24 Feb 2025 15:40:16 +0200, Ciprian Costea wrote:
> > From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> >=20
> > Add FlexCAN[0..3] for S32G2 and S32G3 SoCs.
> >=20
> > Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> > ---
> >  arch/arm64/boot/dts/freescale/s32g2.dtsi      | 52 ++++++++++++++
> >  arch/arm64/boot/dts/freescale/s32g3.dtsi      | 56 +++++++++++++++
> >  .../boot/dts/freescale/s32gxxxa-evb.dtsi      | 72 +++++++++++++++++++
> >  .../boot/dts/freescale/s32gxxxa-rdb.dtsi      | 48 +++++++++++++
> >  4 files changed, 228 insertions(+)
> >=20
>=20
>=20
> My bot found new DTB warnings on the .dts files added or changed in this
> series.

The dt-bindings patch that documents support for the S32G2/S32G3 is in
net-next/main: 51723790b718 ("dt-bindings: can: fsl,flexcan: add
S32G2/S32G3 SoC support")

> New warnings running 'make CHECK_DTBS=3Dy for arch/arm64/boot/dts/freesca=
le/' for 20250224134016.3921196-1-ciprianmarian.costea@oss.nxp.com:
>=20
> arch/arm64/boot/dts/freescale/s32g399a-rdb3.dtb: /soc@0/can@401b4000: fai=
led to match any schema with compatible: ['nxp,s32g3-flexcan', 'nxp,s32g2-f=
lexcan']
> arch/arm64/boot/dts/freescale/s32g399a-rdb3.dtb: /soc@0/can@401b4000: fai=
led to match any schema with compatible: ['nxp,s32g3-flexcan', 'nxp,s32g2-f=
lexcan']
> arch/arm64/boot/dts/freescale/s32g399a-rdb3.dtb: /soc@0/can@401be000: fai=
led to match any schema with compatible: ['nxp,s32g3-flexcan', 'nxp,s32g2-f=
lexcan']
> arch/arm64/boot/dts/freescale/s32g399a-rdb3.dtb: /soc@0/can@401be000: fai=
led to match any schema with compatible: ['nxp,s32g3-flexcan', 'nxp,s32g2-f=
lexcan']
> arch/arm64/boot/dts/freescale/s32g399a-rdb3.dtb: /soc@0/can@402a8000: fai=
led to match any schema with compatible: ['nxp,s32g3-flexcan', 'nxp,s32g2-f=
lexcan']
> arch/arm64/boot/dts/freescale/s32g399a-rdb3.dtb: /soc@0/can@402a8000: fai=
led to match any schema with compatible: ['nxp,s32g3-flexcan', 'nxp,s32g2-f=
lexcan']
> arch/arm64/boot/dts/freescale/s32g399a-rdb3.dtb: /soc@0/can@402b2000: fai=
led to match any schema with compatible: ['nxp,s32g3-flexcan', 'nxp,s32g2-f=
lexcan']
> arch/arm64/boot/dts/freescale/s32g399a-rdb3.dtb: /soc@0/can@402b2000: fai=
led to match any schema with compatible: ['nxp,s32g3-flexcan', 'nxp,s32g2-f=
lexcan']
> arch/arm64/boot/dts/freescale/s32g274a-evb.dtb: /soc@0/can@401b4000: fail=
ed to match any schema with compatible: ['nxp,s32g2-flexcan']
> arch/arm64/boot/dts/freescale/s32g274a-evb.dtb: /soc@0/can@401be000: fail=
ed to match any schema with compatible: ['nxp,s32g2-flexcan']
> arch/arm64/boot/dts/freescale/s32g274a-evb.dtb: /soc@0/can@402a8000: fail=
ed to match any schema with compatible: ['nxp,s32g2-flexcan']
> arch/arm64/boot/dts/freescale/s32g274a-evb.dtb: /soc@0/can@402b2000: fail=
ed to match any schema with compatible: ['nxp,s32g2-flexcan']
> arch/arm64/boot/dts/freescale/s32g274a-rdb2.dtb: /soc@0/can@401b4000: fai=
led to match any schema with compatible: ['nxp,s32g2-flexcan']
> arch/arm64/boot/dts/freescale/s32g274a-rdb2.dtb: /soc@0/can@401be000: fai=
led to match any schema with compatible: ['nxp,s32g2-flexcan']
> arch/arm64/boot/dts/freescale/s32g274a-rdb2.dtb: /soc@0/can@402a8000: fai=
led to match any schema with compatible: ['nxp,s32g2-flexcan']
> arch/arm64/boot/dts/freescale/s32g274a-rdb2.dtb: /soc@0/can@402b2000: fai=
led to match any schema with compatible: ['nxp,s32g2-flexcan']

Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--hyjls6qa3nf4o47i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEn/sM2K9nqF/8FWzzDHRl3/mQkZwFAme+KBkACgkQDHRl3/mQ
kZxdrwf+JXiYSAtNXsvcQpYo6OfO9ld3hbOKggakubUaLFftujJA/9iNVFaUgqHg
1m1/pAgYThwS+zVAVPn8w7zgfznQj5iF45qigUAugkGANBrPwvcr4YBYqrATQTpq
WHsWnaz5A8Emg9AC9kmg7nfFDM6uMR7SEWXwlvp3YXUzqC5Ujh2scrKg9nh/NUNj
BIDoOyWb0YrNyJoPfVd7ooG6GnMxmg6oPqWr7xIRwR+FkJVFwEtcBmPk71Xk9foX
yXLZlC92qTwQBn/0pgj/q/8XyX8UuGgL28Wfo2bg2q67iPqc/yQdi6QW/C+OMRuG
qJmoE2guvBD9ho/u4NtPJ307RtGZqQ==
=dAC0
-----END PGP SIGNATURE-----

--hyjls6qa3nf4o47i--

