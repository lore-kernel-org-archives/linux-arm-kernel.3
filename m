Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84330CA0FF2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 08:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5HwiAk4UaJ/0RnREoKOoLiBWJI8eHPDmXvmgOzLgPWo=; b=S31I86kJ7jC8EjWWTQb5JKpAR+
	RjOCs5FC3dE1ETmpZnmr2DgLPNSu6ne+TN6nJTRF8g9MP3VfG+M9u1P5rF1DtxnZFAlp2g6b8d0Iq
	Y5BdXc/Qa8tmTe/5XyfiJezka61T4TGg+HOin+eVJdJJwmGEiN6Mg3E6vLjsL1ox0pu7II5PIj4dw
	lTn9lukMYHLlWwvHaDWKmhFPeKariJFRdKXM6HGLPGFQmdTJaVmnKe+5nNd2x8SvhRfAdRRzApOB0
	3jYOdZqM1367KRAnzqqB90yPXwmuIotSxkWOAv9oRQr9afspgk83IJzwbz/7oFdQVC8fvSFSUqjJd
	z3aHU2fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urXjG-00000000k8L-1EcD;
	Thu, 28 Aug 2025 08:11:30 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urXTp-00000000gr5-3lIJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Aug 2025 07:55:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1756367733; x=1787903733;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5HwiAk4UaJ/0RnREoKOoLiBWJI8eHPDmXvmgOzLgPWo=;
  b=n3+mL+/TFkQDgAjtLmW6cJlsFU7KHg3uGNtFb/bdjMgU67383pOwbG0J
   ZmPv8mFytGip+SJdS+rJJb6NLkYW751SU/SfL4LX/I6MGuOXCq864s535
   0YURcMZJg0Vw726O/+tlQqllc+AZQRFswrAUS3c6iH02nbpVmiybKsLdS
   xrtKgiWzjwP4nPYok23VWiFXv52zjk2F3oX0CEva4llU6+m5NiBW5Oixd
   ZjAZwT3vZRb8VN9gtuXPq5vT63/e25cPTljczAUkGSlkJbJW4qTXdVBig
   cGyS+Q3qdvbiwQr0GSgJspWHM2Nsg+BbLddudyw2bSgLkzrWUbmiOvhsJ
   A==;
X-CSE-ConnectionGUID: DT7/qzjVS322pF82mqZonQ==
X-CSE-MsgGUID: Nme356ZFScCFBcwqXo/rFQ==
X-IronPort-AV: E=Sophos;i="6.18,217,1751234400"; 
   d="scan'208";a="45949455"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 28 Aug 2025 09:55:28 +0200
X-CheckPoint: {68B00B70-28-820F521C-C7779E56}
X-MAIL-CPID: F4DDEA0D02B3B61D9A99DB4722F13A30_4
X-Control-Analysis: str=0001.0A002109.68B00B0B.0011,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 565541609FD;
	Thu, 28 Aug 2025 09:55:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1756367724;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=5HwiAk4UaJ/0RnREoKOoLiBWJI8eHPDmXvmgOzLgPWo=;
	b=b+JJBEoE5ceAFZwdG8+H/uZU0uJwXkaIxAEoC/nSuaJ+H2jKgPXXwb/8HWJ9tYpaBZdvvZ
	NV7i4LwG/avXFqtYV6NYxfsbzz18M3kdGrSK9KV3j2pPqyJWzKWcFMgYFJ6SKuLCVQ6Q73
	00t2CwkBomDcZR0xlOC5UueJobU2N+66yVFdZUqLM0Sr02kk3whP3+woc9laFeKQmcGVGM
	/YPLcWHyOIhn5sN9SMwsUU8fLFCDXSWbo4JdUYa2IPBWaVmh27QJy95gjhIqxVVPbkLpu5
	u7d57S7O+Ts6eKFwkvmQPiqs/nt/RxCi49vvt80PQX4oL1nBCHNXdaYE0S9Mvg==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, richardcochran@gmail.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 frieder.schrempf@kontron.de, primoz.fiser@norik.com, othacehe@gnu.org,
 Markus.Niebel@ew.tq-group.com, linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux@ew.tq-group.com, netdev@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Frank.Li@nxp.com,
 Joy Zou <joy.zou@nxp.com>
Subject: Re: [PATCH v9 1/6] arm64: dts: freescale: move aliases from imx93.dtsi to
 board dts
Date: Thu, 28 Aug 2025 09:55:18 +0200
Message-ID: <7849995.EvYhyI6sBW@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20250825091223.1378137-2-joy.zou@nxp.com>
References: <20250825091223.1378137-1-joy.zou@nxp.com>
 <20250825091223.1378137-2-joy.zou@nxp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_005534_443085_C16F756D 
X-CRM114-Status: GOOD (  13.74  )
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

Hi,

Am Montag, 25. August 2025, 11:12:18 CEST schrieb Joy Zou:
> The aliases is board level property rather than soc property, so move
> these to each boards.
>=20
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Joy Zou <joy.zou@nxp.com>

Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com> # imx93-tqma=
9352

> ---
> Changes for v7:
> 1. Add new patch that move aliases from imx93.dtsi to board dts.
> 2. The aliases is board level property rather than soc property.
>    These changes come from comments:
>    https://lore.kernel.org/imx/4e8f2426-92a1-4c7e-b860-0e10e8dd886c@kerne=
l.org/
> 3. Only add aliases using to imx93 board dts.
> ---
>  .../boot/dts/freescale/imx93-11x11-evk.dts    | 19 +++++++++++
>  .../boot/dts/freescale/imx93-14x14-evk.dts    | 15 ++++++++
>  .../boot/dts/freescale/imx93-9x9-qsb.dts      | 18 ++++++++++
>  .../dts/freescale/imx93-kontron-bl-osm-s.dts  | 21 ++++++++++++
>  .../dts/freescale/imx93-phyboard-nash.dts     | 21 ++++++++++++
>  .../dts/freescale/imx93-phyboard-segin.dts    |  9 +++++
>  .../freescale/imx93-tqma9352-mba91xxca.dts    | 11 ++++++
>  .../freescale/imx93-tqma9352-mba93xxca.dts    | 25 ++++++++++++++
>  .../freescale/imx93-tqma9352-mba93xxla.dts    | 25 ++++++++++++++
>  .../dts/freescale/imx93-var-som-symphony.dts  | 17 ++++++++++
>  arch/arm64/boot/dts/freescale/imx93.dtsi      | 34 -------------------
>  11 files changed, 181 insertions(+), 34 deletions(-)
>=20
> diff --git a/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts b/arch/arm=
64/boot/dts/freescale/imx93-11x11-evk.dts
> index e24e12f04526..44566e03be65 100644
> --- a/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts
> +++ b/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts
> @@ -12,6 +12,25 @@ / {
>  	model =3D "NXP i.MX93 11X11 EVK board";
>  	compatible =3D "fsl,imx93-11x11-evk", "fsl,imx93";
> =20
> +	aliases {
> +		ethernet0 =3D &fec;
> +		ethernet1 =3D &eqos;
> +		gpio0 =3D &gpio1;
> +		gpio1 =3D &gpio2;
> +		gpio2 =3D &gpio3;
> +		i2c0 =3D &lpi2c1;
> +		i2c1 =3D &lpi2c2;
> +		i2c2 =3D &lpi2c3;
> +		mmc0 =3D &usdhc1;
> +		mmc1 =3D &usdhc2;
> +		rtc0 =3D &bbnsm_rtc;
> +		serial0 =3D &lpuart1;
> +		serial1 =3D &lpuart2;
> +		serial2 =3D &lpuart3;
> +		serial3 =3D &lpuart4;
> +		serial4 =3D &lpuart5;
> +	};
> +
>  	chosen {
>  		stdout-path =3D &lpuart1;
>  	};
> diff --git a/arch/arm64/boot/dts/freescale/imx93-14x14-evk.dts b/arch/arm=
64/boot/dts/freescale/imx93-14x14-evk.dts
> index c5d86b54ad33..da252b7c06cb 100644
> --- a/arch/arm64/boot/dts/freescale/imx93-14x14-evk.dts
> +++ b/arch/arm64/boot/dts/freescale/imx93-14x14-evk.dts
> @@ -12,6 +12,21 @@ / {
>  	model =3D "NXP i.MX93 14X14 EVK board";
>  	compatible =3D "fsl,imx93-14x14-evk", "fsl,imx93";
> =20
> +	aliases {
> +		ethernet0 =3D &fec;
> +		ethernet1 =3D &eqos;
> +		gpio0 =3D &gpio1;
> +		gpio1 =3D &gpio2;
> +		gpio2 =3D &gpio3;
> +		i2c0 =3D &lpi2c1;
> +		i2c1 =3D &lpi2c2;
> +		i2c2 =3D &lpi2c3;
> +		mmc0 =3D &usdhc1;
> +		mmc1 =3D &usdhc2;
> +		rtc0 =3D &bbnsm_rtc;
> +		serial0 =3D &lpuart1;
> +	};
> +
>  	chosen {
>  		stdout-path =3D &lpuart1;
>  	};
> diff --git a/arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts b/arch/arm64=
/boot/dts/freescale/imx93-9x9-qsb.dts
> index f6f8d105b737..0852067eab2c 100644
> --- a/arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts
> +++ b/arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts
> @@ -17,6 +17,24 @@ bt_sco_codec: bt-sco-codec {
>  		compatible =3D "linux,bt-sco";
>  	};
> =20
> +	aliases {
> +		ethernet0 =3D &fec;
> +		ethernet1 =3D &eqos;
> +		gpio0 =3D &gpio1;
> +		gpio1 =3D &gpio2;
> +		gpio2 =3D &gpio3;
> +		i2c0 =3D &lpi2c1;
> +		i2c1 =3D &lpi2c2;
> +		mmc0 =3D &usdhc1;
> +		mmc1 =3D &usdhc2;
> +		rtc0 =3D &bbnsm_rtc;
> +		serial0 =3D &lpuart1;
> +		serial1 =3D &lpuart2;
> +		serial2 =3D &lpuart3;
> +		serial3 =3D &lpuart4;
> +		serial4 =3D &lpuart5;
> +	};
> +
>  	chosen {
>  		stdout-path =3D &lpuart1;
>  	};
> diff --git a/arch/arm64/boot/dts/freescale/imx93-kontron-bl-osm-s.dts b/a=
rch/arm64/boot/dts/freescale/imx93-kontron-bl-osm-s.dts
> index 89e97c604bd3..11dd23044722 100644
> --- a/arch/arm64/boot/dts/freescale/imx93-kontron-bl-osm-s.dts
> +++ b/arch/arm64/boot/dts/freescale/imx93-kontron-bl-osm-s.dts
> @@ -14,6 +14,27 @@ / {
>  	aliases {
>  		ethernet0 =3D &fec;
>  		ethernet1 =3D &eqos;
> +		gpio0 =3D &gpio1;
> +		gpio1 =3D &gpio2;
> +		i2c0 =3D &lpi2c1;
> +		i2c1 =3D &lpi2c2;
> +		mmc0 =3D &usdhc1;
> +		mmc1 =3D &usdhc2;
> +		serial0 =3D &lpuart1;
> +		serial1 =3D &lpuart2;
> +		serial2 =3D &lpuart3;
> +		serial3 =3D &lpuart4;
> +		serial4 =3D &lpuart5;
> +		serial5 =3D &lpuart6;
> +		serial6 =3D &lpuart7;
> +		spi0 =3D &lpspi1;
> +		spi1 =3D &lpspi2;
> +		spi2 =3D &lpspi3;
> +		spi3 =3D &lpspi4;
> +		spi4 =3D &lpspi5;
> +		spi5 =3D &lpspi6;
> +		spi6 =3D &lpspi7;
> +		spi7 =3D &lpspi8;
>  	};
> =20
>  	leds {
> diff --git a/arch/arm64/boot/dts/freescale/imx93-phyboard-nash.dts b/arch=
/arm64/boot/dts/freescale/imx93-phyboard-nash.dts
> index 475913cf0cb9..fa5d83dee0a7 100644
> --- a/arch/arm64/boot/dts/freescale/imx93-phyboard-nash.dts
> +++ b/arch/arm64/boot/dts/freescale/imx93-phyboard-nash.dts
> @@ -19,8 +19,29 @@ / {
> =20
>  	aliases {
>  		ethernet1 =3D &eqos;
> +		gpio0 =3D &gpio1;
> +		gpio1 =3D &gpio2;
> +		gpio2 =3D &gpio3;
> +		gpio3 =3D &gpio4;
> +		i2c0 =3D &lpi2c1;
> +		i2c1 =3D &lpi2c2;
> +		mmc0 =3D &usdhc1;
> +		mmc1 =3D &usdhc2;
>  		rtc0 =3D &i2c_rtc;
>  		rtc1 =3D &bbnsm_rtc;
> +		serial0 =3D &lpuart1;
> +		serial1 =3D &lpuart2;
> +		serial2 =3D &lpuart3;
> +		serial3 =3D &lpuart4;
> +		serial4 =3D &lpuart5;
> +		serial5 =3D &lpuart6;
> +		serial6 =3D &lpuart7;
> +		spi0 =3D &lpspi1;
> +		spi1 =3D &lpspi2;
> +		spi2 =3D &lpspi3;
> +		spi3 =3D &lpspi4;
> +		spi4 =3D &lpspi5;
> +		spi5 =3D &lpspi6;
>  	};
> =20
>  	chosen {
> diff --git a/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts b/arc=
h/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
> index 6f1374f5757f..802d96b19e4c 100644
> --- a/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
> +++ b/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
> @@ -19,8 +19,17 @@ /{
> =20
>  	aliases {
>  		ethernet1 =3D &eqos;
> +		gpio0 =3D &gpio1;
> +		gpio1 =3D &gpio2;
> +		gpio2 =3D &gpio3;
> +		gpio3 =3D &gpio4;
> +		i2c0 =3D &lpi2c1;
> +		i2c1 =3D &lpi2c2;
> +		mmc0 =3D &usdhc1;
> +		mmc1 =3D &usdhc2;
>  		rtc0 =3D &i2c_rtc;
>  		rtc1 =3D &bbnsm_rtc;
> +		serial0 =3D &lpuart1;
>  	};
> =20
>  	chosen {
> diff --git a/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba91xxca.dts b=
/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba91xxca.dts
> index 9dbf41cf394b..2673d9dccbf4 100644
> --- a/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba91xxca.dts
> +++ b/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba91xxca.dts
> @@ -27,8 +27,19 @@ aliases {
>  		eeprom0 =3D &eeprom0;
>  		ethernet0 =3D &eqos;
>  		ethernet1 =3D &fec;
> +		gpio0 =3D &gpio1;
> +		gpio1 =3D &gpio2;
> +		gpio2 =3D &gpio3;
> +		gpio3 =3D &gpio4;
> +		i2c0 =3D &lpi2c1;
> +		i2c1 =3D &lpi2c2;
> +		i2c2 =3D &lpi2c3;
> +		mmc0 =3D &usdhc1;
> +		mmc1 =3D &usdhc2;
>  		rtc0 =3D &pcf85063;
>  		rtc1 =3D &bbnsm_rtc;
> +		serial0 =3D &lpuart1;
> +		serial1 =3D &lpuart2;
>  	};
> =20
>  	backlight: backlight {
> diff --git a/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxca.dts b=
/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxca.dts
> index 137b8ed242a2..4760d07ea24b 100644
> --- a/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxca.dts
> +++ b/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxca.dts
> @@ -28,8 +28,33 @@ aliases {
>  		eeprom0 =3D &eeprom0;
>  		ethernet0 =3D &eqos;
>  		ethernet1 =3D &fec;
> +		gpio0 =3D &gpio1;
> +		gpio1 =3D &gpio2;
> +		gpio2 =3D &gpio3;
> +		gpio3 =3D &gpio4;
> +		i2c0 =3D &lpi2c1;
> +		i2c1 =3D &lpi2c2;
> +		i2c2 =3D &lpi2c3;
> +		i2c3 =3D &lpi2c4;
> +		i2c4 =3D &lpi2c5;
> +		mmc0 =3D &usdhc1;
> +		mmc1 =3D &usdhc2;
>  		rtc0 =3D &pcf85063;
>  		rtc1 =3D &bbnsm_rtc;
> +		serial0 =3D &lpuart1;
> +		serial1 =3D &lpuart2;
> +		serial2 =3D &lpuart3;
> +		serial3 =3D &lpuart4;
> +		serial4 =3D &lpuart5;
> +		serial5 =3D &lpuart6;
> +		serial6 =3D &lpuart7;
> +		serial7 =3D &lpuart8;
> +		spi0 =3D &lpspi1;
> +		spi1 =3D &lpspi2;
> +		spi2 =3D &lpspi3;
> +		spi3 =3D &lpspi4;
> +		spi4 =3D &lpspi5;
> +		spi5 =3D &lpspi6;
>  	};
> =20
>  	backlight_lvds: backlight {
> diff --git a/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla.dts b=
/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla.dts
> index 219f49a4f87f..8a88c98ac05a 100644
> --- a/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla.dts
> +++ b/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla.dts
> @@ -28,8 +28,33 @@ aliases {
>  		eeprom0 =3D &eeprom0;
>  		ethernet0 =3D &eqos;
>  		ethernet1 =3D &fec;
> +		gpio0 =3D &gpio1;
> +		gpio1 =3D &gpio2;
> +		gpio2 =3D &gpio3;
> +		gpio3 =3D &gpio4;
> +		i2c0 =3D &lpi2c1;
> +		i2c1 =3D &lpi2c2;
> +		i2c2 =3D &lpi2c3;
> +		i2c3 =3D &lpi2c4;
> +		i2c4 =3D &lpi2c5;
> +		mmc0 =3D &usdhc1;
> +		mmc1 =3D &usdhc2;
>  		rtc0 =3D &pcf85063;
>  		rtc1 =3D &bbnsm_rtc;
> +		serial0 =3D &lpuart1;
> +		serial1 =3D &lpuart2;
> +		serial2 =3D &lpuart3;
> +		serial3 =3D &lpuart4;
> +		serial4 =3D &lpuart5;
> +		serial5 =3D &lpuart6;
> +		serial6 =3D &lpuart7;
> +		serial7 =3D &lpuart8;
> +		spi0 =3D &lpspi1;
> +		spi1 =3D &lpspi2;
> +		spi2 =3D &lpspi3;
> +		spi3 =3D &lpspi4;
> +		spi4 =3D &lpspi5;
> +		spi5 =3D &lpspi6;
>  	};
> =20
>  	backlight_lvds: backlight {
> diff --git a/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts b/a=
rch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
> index 576d6982a4a0..c789c1f24bdc 100644
> --- a/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
> +++ b/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
> @@ -17,8 +17,25 @@ /{
>  	aliases {
>  		ethernet0 =3D &eqos;
>  		ethernet1 =3D &fec;
> +		gpio0 =3D &gpio1;
> +		gpio1 =3D &gpio2;
> +		gpio2 =3D &gpio3;
> +		i2c0 =3D &lpi2c1;
> +		i2c1 =3D &lpi2c2;
> +		i2c2 =3D &lpi2c3;
> +		i2c3 =3D &lpi2c4;
> +		i2c4 =3D &lpi2c5;
> +		mmc0 =3D &usdhc1;
> +		mmc1 =3D &usdhc2;
> +		serial0 =3D &lpuart1;
> +		serial1 =3D &lpuart2;
> +		serial2 =3D &lpuart3;
> +		serial3 =3D &lpuart4;
> +		serial4 =3D &lpuart5;
> +		serial5 =3D &lpuart6;
>  	};
> =20
> +
>  	chosen {
>  		stdout-path =3D &lpuart1;
>  	};
> diff --git a/arch/arm64/boot/dts/freescale/imx93.dtsi b/arch/arm64/boot/d=
ts/freescale/imx93.dtsi
> index 8a7f1cd76c76..d505f9dfd8ee 100644
> --- a/arch/arm64/boot/dts/freescale/imx93.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx93.dtsi
> @@ -18,40 +18,6 @@ / {
>  	#address-cells =3D <2>;
>  	#size-cells =3D <2>;
> =20
> -	aliases {
> -		gpio0 =3D &gpio1;
> -		gpio1 =3D &gpio2;
> -		gpio2 =3D &gpio3;
> -		gpio3 =3D &gpio4;
> -		i2c0 =3D &lpi2c1;
> -		i2c1 =3D &lpi2c2;
> -		i2c2 =3D &lpi2c3;
> -		i2c3 =3D &lpi2c4;
> -		i2c4 =3D &lpi2c5;
> -		i2c5 =3D &lpi2c6;
> -		i2c6 =3D &lpi2c7;
> -		i2c7 =3D &lpi2c8;
> -		mmc0 =3D &usdhc1;
> -		mmc1 =3D &usdhc2;
> -		mmc2 =3D &usdhc3;
> -		serial0 =3D &lpuart1;
> -		serial1 =3D &lpuart2;
> -		serial2 =3D &lpuart3;
> -		serial3 =3D &lpuart4;
> -		serial4 =3D &lpuart5;
> -		serial5 =3D &lpuart6;
> -		serial6 =3D &lpuart7;
> -		serial7 =3D &lpuart8;
> -		spi0 =3D &lpspi1;
> -		spi1 =3D &lpspi2;
> -		spi2 =3D &lpspi3;
> -		spi3 =3D &lpspi4;
> -		spi4 =3D &lpspi5;
> -		spi5 =3D &lpspi6;
> -		spi6 =3D &lpspi7;
> -		spi7 =3D &lpspi8;
> -	};
> -
>  	cpus {
>  		#address-cells =3D <1>;
>  		#size-cells =3D <0>;
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



