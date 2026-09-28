Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E59F8C9832F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 09:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4CuU+g3OS0jSsPnDL28a19vrBRSayq8z8NOABY2I9L0=; b=2COhSnKcyst/fGG4y1gKF7083u
	u9hpr4/+mqu9ZHv3P3lHJknnIs7cjC+PaQ8e5j8piyw/Azc1IAglVG+DHDSYGsDzJ62hKZYHLM2ag
	uiYv7ku1Thpwihc2MCGWT8qopWi+276v6kn3KQT8Y9DJ3T7yXNKDOc+Hs9JsASWEgtj1dAgVWMAAz
	ir7CgqASsVKvxTxSzDP2zNKJhFcRY/I08wU5pxsdg/bZs4cwXsr34mIX/u2JMX8GNWq7Q/z4BxnGS
	mhpXmg4KjXSNxmqXIJaiYx3fyK+Cl74W4DnqcceQbzDYEJnHDV1PKCeh3G2QviH528vf6rT11JguJ
	2aFlXjkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB7vw-00000000GLv-0xn3;
	Mon, 28 Sep 2026 09:46:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB7vv-00000000GLe-2PAc
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 28 Sep 2026 09:46:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=4CuU+g3OS0jSsPnDL28a19vrBRSayq8z8NOABY2I9L0=; b=al/1dHSXUFT5DgGC4yxKZ23/+8
	vgYwLIQLtdzKiy/1SAf0+V4i4o49wpTEQtk3GC0KhUlrB1ChRZGNFefNVN9idsBPgd6yKNusFBoXb
	pbG0266sz+1/TvPPL2NEaIf5uRqVkqaRe3yrxf2Q1SK4vGzyMNMef6I9jqubqQWkZoDLMbtEU9MIw
	JywxTscJrugOpKFWSPrAnoGHUx3NyKfg5Fa4MjyLMyQE0zEppxUTwKU+MlINWA/Gu6EsvrIo1CSx2
	gTObGNVbbpCOKU7S44QO+27cIJpcvYAY5H+8XL+9uMLadX3pbVt39iwhyGkH5xHnvWz4E906XRCxQ
	3rHrje0Q==;
Received: from www537.your-server.de ([188.40.3.216])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xB7vs-00000001KAV-1hDX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 09:46:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=4CuU+g3OS0jSsPnDL28a19vrBRSayq8z8NOABY2I9L0=; b=LRjkTP/07ZPNpeKypa4US1wvsw
	OtyA1Aw8+Z6Rg+8XIxA4YkjoMtTXEi5Ob68KcJgImG2kaPWDOlZlwmIjq3cfuSNoUa25OLFa2712v
	2DGk39CO7BJlWYrEdG/EbA+HpOJ5AhZYFtwJXsmtMtKzvJcEO6hS22X0/gnTaAib6dPdCO3kdLIak
	RxvNM0ch90QAbVZlYhgVbwInb12fS3r+cTDjt+fBvsDhcKRX3BYoccNkDNSrcBKpN4ZR2JqoWAwVD
	apeMddSF6FckTfjJl81A/bbAZflcGJTGXgA0WkclixC1qgDVGDmD/QOk5EGS4PO8xCRWWWFEcZPoD
	VwVHK/eA==;
Received: from sslproxy03.your-server.de ([88.198.220.132])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xB7vo-000KOD-39;
	Mon, 28 Sep 2026 11:45:57 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy03.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xB7vo-000Jep-22;
	Mon, 28 Sep 2026 11:45:56 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Guido =?ISO-8859-1?Q?G=FAnther?= <agx@sigxcpu.org>,
 Robert Chiras <robert.chiras@nxp.com>, Tim Harvey <tharvey@gateworks.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Frank.Li@oss.nxp.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux@ew.tq-group.com,
 Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH 6/8] arm64: dts: imx: remove unnecessary #address-cells and
 #size-cells
Date: Mon, 28 Sep 2026 11:45:54 +0200
Message-ID: <2280028.irdbgypaU6@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20260925-cleanup_dtb_warning-v1-6-f999fafbca60@nxp.com>
References: <20260925-cleanup_dtb_warning-v1-0-f999fafbca60@nxp.com>
 <20260925-cleanup_dtb_warning-v1-6-f999fafbca60@nxp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Virus-Scanned: Clear (ClamAV 1.4.3/28137/Mon Sep 28 08:24:12 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_104600_565056_8632C0CB 
X-CRM114-Status: GOOD (  12.84  )
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

Am Freitag, 25. September 2026, 18:37:55 CEST schrieb Frank.Li@oss.nxp.com:
> From: Frank Li <Frank.Li@nxp.com>
>=20
> Remove unnecessary #address-cells and #size-cells to fix the dtb W=3D1 wa=
rning:
>   Warning (avoid_unnecessary_addr_size): /soc@0/bus@30800000/i2c@30a20000=
/gsc@20: unnecessary #address-cells/#size-cells without "ranges", "dma-rang=
es" or child "reg" or "ranges" property
>=20
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com> # TQMLX2160A

> ---
>  arch/arm64/boot/dts/freescale/fsl-ls1088a-ten64.dts       | 4 ----
>  arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a.dtsi | 4 ----
>  arch/arm64/boot/dts/freescale/imx8mm-venice-gw7901.dts    | 2 --
>  arch/arm64/boot/dts/freescale/imx8mm-venice-gw7902.dts    | 2 --
>  arch/arm64/boot/dts/freescale/imx8mm-venice-gw7903.dts    | 2 --
>  arch/arm64/boot/dts/freescale/imx8mm-venice-gw7904.dts    | 2 --
>  arch/arm64/boot/dts/freescale/imx8mn-venice-gw7902.dts    | 2 --
>  arch/arm64/boot/dts/freescale/imx8mq-nitrogen.dts         | 2 --
>  arch/arm64/boot/dts/freescale/imx91-11x11-frdm-s.dts      | 2 --
>  9 files changed, 22 deletions(-)
>=20
> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1088a-ten64.dts b/arch/a=
rm64/boot/dts/freescale/fsl-ls1088a-ten64.dts
> index f51508952d51c..b762ad555ad9e 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-ls1088a-ten64.dts
> +++ b/arch/arm64/boot/dts/freescale/fsl-ls1088a-ten64.dts
> @@ -312,8 +312,6 @@ &qspi {
> =20
>  	en25s64: flash@0 {
>  		compatible =3D "jedec,spi-nor";
> -		#address-cells =3D <1>;
> -		#size-cells =3D <1>;
>  		reg =3D <0>;
>  		spi-max-frequency =3D <20000000>;
>  		spi-rx-bus-width =3D <4>;
> @@ -363,8 +361,6 @@ partition@600000 {
> =20
>  	nand: flash@1 {
>  		compatible =3D "spi-nand";
> -		#address-cells =3D <1>;
> -		#size-cells =3D <1>;
>  		reg =3D <1>;
>  		spi-max-frequency =3D <20000000>;
>  		spi-rx-bus-width =3D <4>;
> diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a.dtsi b/=
arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a.dtsi
> index cc6b6427ec8a6..aac0ae0ad40c7 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a.dtsi
> +++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a.dtsi
> @@ -41,8 +41,6 @@ &fspi {
>  	flash0: flash@0 {
>  		compatible =3D "jedec,spi-nor";
>  		reg =3D <0>;
> -		#address-cells =3D <1>;
> -		#size-cells =3D <1>;
>  		spi-max-frequency =3D <10000000>;
>  		spi-rx-bus-width =3D <1>;
>  		spi-tx-bus-width =3D <1>;
> @@ -57,8 +55,6 @@ partitions {
>  	flash1: flash@1 {
>  		compatible =3D "jedec,spi-nor";
>  		reg =3D <1>;
> -		#address-cells =3D <1>;
> -		#size-cells =3D <1>;
>  		spi-max-frequency =3D <10000000>;
>  		spi-rx-bus-width =3D <1>;
>  		spi-tx-bus-width =3D <1>;
> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-venice-gw7901.dts b/arc=
h/arm64/boot/dts/freescale/imx8mm-venice-gw7901.dts
> index 272c2b223d167..1bb42116fc0b8 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mm-venice-gw7901.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mm-venice-gw7901.dts
> @@ -366,8 +366,6 @@ gsc: gsc@20 {
>  		interrupts =3D <16 IRQ_TYPE_EDGE_FALLING>;
>  		interrupt-controller;
>  		#interrupt-cells =3D <1>;
> -		#address-cells =3D <1>;
> -		#size-cells =3D <0>;
> =20
>  		adc {
>  			compatible =3D "gw,gsc-adc";
> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-venice-gw7902.dts b/arc=
h/arm64/boot/dts/freescale/imx8mm-venice-gw7902.dts
> index 468c7e993c52b..f53718221ad5b 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mm-venice-gw7902.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mm-venice-gw7902.dts
> @@ -317,8 +317,6 @@ gsc: gsc@20 {
>  		interrupts =3D <6 IRQ_TYPE_EDGE_FALLING>;
>  		interrupt-controller;
>  		#interrupt-cells =3D <1>;
> -		#address-cells =3D <1>;
> -		#size-cells =3D <0>;
> =20
>  		adc {
>  			compatible =3D "gw,gsc-adc";
> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-venice-gw7903.dts b/arc=
h/arm64/boot/dts/freescale/imx8mm-venice-gw7903.dts
> index 636daa3d6ca20..3eafff879e8d5 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mm-venice-gw7903.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mm-venice-gw7903.dts
> @@ -282,8 +282,6 @@ gsc: gsc@20 {
>  		interrupts =3D <26 IRQ_TYPE_EDGE_FALLING>;
>  		interrupt-controller;
>  		#interrupt-cells =3D <1>;
> -		#address-cells =3D <1>;
> -		#size-cells =3D <0>;
> =20
>  		adc {
>  			compatible =3D "gw,gsc-adc";
> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-venice-gw7904.dts b/arc=
h/arm64/boot/dts/freescale/imx8mm-venice-gw7904.dts
> index 99572961d9e16..fcbb40597b12c 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mm-venice-gw7904.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mm-venice-gw7904.dts
> @@ -335,8 +335,6 @@ gsc: gsc@20 {
>  		interrupts =3D <26 IRQ_TYPE_EDGE_FALLING>;
>  		interrupt-controller;
>  		#interrupt-cells =3D <1>;
> -		#address-cells =3D <1>;
> -		#size-cells =3D <0>;
> =20
>  		adc {
>  			compatible =3D "gw,gsc-adc";
> diff --git a/arch/arm64/boot/dts/freescale/imx8mn-venice-gw7902.dts b/arc=
h/arm64/boot/dts/freescale/imx8mn-venice-gw7902.dts
> index 5aa0e2cd155ec..ecc12645d7691 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mn-venice-gw7902.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mn-venice-gw7902.dts
> @@ -315,8 +315,6 @@ gsc: gsc@20 {
>  		interrupts =3D <6 IRQ_TYPE_EDGE_FALLING>;
>  		interrupt-controller;
>  		#interrupt-cells =3D <1>;
> -		#address-cells =3D <1>;
> -		#size-cells =3D <0>;
> =20
>  		adc {
>  			compatible =3D "gw,gsc-adc";
> diff --git a/arch/arm64/boot/dts/freescale/imx8mq-nitrogen.dts b/arch/arm=
64/boot/dts/freescale/imx8mq-nitrogen.dts
> index b91509bfc9c00..1043bf074f8e4 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mq-nitrogen.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mq-nitrogen.dts
> @@ -287,8 +287,6 @@ &lcdif {
>  };
> =20
>  &mipi_dsi {
> -	#address-cells =3D <1>;
> -	#size-cells =3D <0>;
>  	status =3D "okay";
> =20
>  	ports {
> diff --git a/arch/arm64/boot/dts/freescale/imx91-11x11-frdm-s.dts b/arch/=
arm64/boot/dts/freescale/imx91-11x11-frdm-s.dts
> index c6019d76b9981..f3b647267c300 100644
> --- a/arch/arm64/boot/dts/freescale/imx91-11x11-frdm-s.dts
> +++ b/arch/arm64/boot/dts/freescale/imx91-11x11-frdm-s.dts
> @@ -202,8 +202,6 @@ &flexspi1 {
>  	flash@0 {
>  		compatible =3D "spi-nand";
>  		reg =3D <0>;
> -		#address-cells =3D <1>;
> -		#size-cells =3D <1>;
>  		spi-max-frequency =3D <104000000>;
>  		spi-rx-bus-width =3D <4>;
>  		spi-tx-bus-width =3D <4>;
>=20
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



