Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 306CCFED2F9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 09:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KlXS+bIJdWiNzY3C89u8C7U+uIHIvyHeLx0/QnaBjXE=; b=sYU8SZMfCqpT18Krfzn1NYw7qR
	Y68c1WTbzeOeB+Ml3AVYmdkDmscmfcmSIwNMKPLZphdk9GkjkoBW1bFgF5YMXWTGQ5kdLuVphyGQK
	H8pemZKD4C0OaX3xUQGbAP2GRSsjXJffMv+Oz7rKuBw/YWurcsnA12MSdIgeOvzkOGcu3slNZ3q5N
	WfiZxwmVneUeZnAAele0PLQJui+exutrIglGSeCpH5DjlR3PeBpCTPWKopqYcEKaqKOD6roOxh7BK
	7UeAAgu0FAMViKt16PEd01yoYPOrmdPSKnDXlQQLNPf+aI2OAs0hWAIiO8F+6DdawWaSIyijHDJ8T
	4GD5PABA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0caH-0000000DnZ5-0wkW;
	Thu, 12 Mar 2026 09:44:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0caF-0000000DnYz-3x0r
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 12 Mar 2026 09:44:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=KlXS+bIJdWiNzY3C89u8C7U+uIHIvyHeLx0/QnaBjXE=; b=k5o8HqzzxHSOWNJ3QjyH8Yu7ot
	+hEvzLLjXCPuGz/IFUXr+fO+sq45FS9L4xJTQfg78r8ul4UJo0TvH3QdHBr8C5gJ/EAcmbXCeA6i8
	RWMH4pJm1yacMIJfgATCtV74PzIIBWZDLy3xy4N5oeC7bmg2cLYDDy8mKK/GRlXUOgeVPTRXqsMeQ
	x5OMgrypR9hlW9Hp4zdPiFFQRRA1yLIxgTeNIiF5ourpUXPNe/2MVVykfQdYjJfzhZ/hWmlk2jzm9
	zHdx/lgoGmmUNmj1wmoBl5ckJuIJlI/x4Zj0mN2tfOTIukfM5SnSSn/pI0qu8tacVDgfF90hs9eiM
	0noMJxrQ==;
Received: from www537.your-server.de ([188.40.3.216])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0caC-00000000rJD-3U34
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 09:43:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=KlXS+bIJdWiNzY3C89u8C7U+uIHIvyHeLx0/QnaBjXE=; b=dhbiHZRSbxNCJjDul/a88SGVOl
	cdanrp5cQi5yxZgAv1/bnUTHyhU8UhUgZwj7mUGouS/uCj8j6OZb/9CuDbvAhusrxhHsHKs7jjGtB
	x/HajCxwtUO4lH6AgN0z7OTx8uqGq5K8n7/gGXhyQvW70BBW1RVKmTdeiLO8Tas9dktsl4OsRX54D
	nhSBYg6HbN7guBKj40ymAXln2N9ZHpPg8zbUGZ2GrfsGmVnmqiAFnsxrDjwaNLhc+aYerZ8ey63EI
	pvhGcWF1IBNkNhKXMAEfp/C3oSZwVKxV9Ed8THRTBv1cO/1XFojTq/Fh7esaePVgevjzeiagCN76q
	kusCsNbw==;
Received: from sslproxy05.your-server.de ([78.46.172.2])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w0ca4-0005Yk-1H;
	Thu, 12 Mar 2026 10:43:48 +0100
Received: from localhost ([127.0.0.1])
	by sslproxy05.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w0ca3-000OFC-2y;
	Thu, 12 Mar 2026 10:43:47 +0100
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 Frank.Li@nxp.com, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH 2/4] arm64: dts: imx952-evk: Add sound-wm8962 support
Date: Thu, 12 Mar 2026 10:43:47 +0100
Message-ID: <3918649.ElGaqSPkdT@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20260312034912.4007057-3-shengjiu.wang@nxp.com>
References: <20260312034912.4007057-1-shengjiu.wang@nxp.com>
 <20260312034912.4007057-3-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Virus-Scanned: Clear (ClamAV 1.4.3/27938/Thu Mar 12 07:24:01 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_094357_089496_868F224A 
X-CRM114-Status: GOOD (  12.57  )
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

Am Donnerstag, 12. M=E4rz 2026, 04:49:10 CET schrieb Shengjiu Wang:
> Add wm8962 sound card. By connecting with ASRC1, the sound card support
> sample rate conversion.
>=20
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx952-evk.dts | 119 +++++++++++++++++++
>  1 file changed, 119 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/freescale/imx952-evk.dts b/arch/arm64/bo=
ot/dts/freescale/imx952-evk.dts
> index 509704c23e89..ef0058b98573 100644
> --- a/arch/arm64/boot/dts/freescale/imx952-evk.dts
> +++ b/arch/arm64/boot/dts/freescale/imx952-evk.dts
> @@ -110,6 +110,15 @@ reg_vref_1v8: regulator-adc-vref {
>  		regulator-max-microvolt =3D <1800000>;
>  	};
> =20
> +	reg_audio_pwr: regulator-audio-pwr {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "audio-pwr";
> +		regulator-max-microvolt =3D <3300000>;
> +		regulator-min-microvolt =3D <3300000>;
> +		gpio =3D <&i2c4_pcal6408 1 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +	};
> +
>  	reg_usdhc2_vmmc: regulator-usdhc2 {
>  		compatible =3D "regulator-fixed";
>  		pinctrl-names =3D "default";
> @@ -131,6 +140,51 @@ reg_usb_vbus: regulator-vbus {
>  		enable-active-high;
>  	};
> =20
> +	sound-wm8962 {
> +		compatible =3D "fsl,imx-audio-wm8962";
> +		audio-asrc =3D <&asrc1>;
> +		audio-codec =3D <&wm8962>;
> +		audio-cpu =3D <&sai3>;
> +		audio-routing =3D "Headphone Jack", "HPOUTL",
> +				"Headphone Jack", "HPOUTR",
> +				"Ext Spk", "SPKOUTL",
> +				"Ext Spk", "SPKOUTR",
> +				"AMIC", "MICBIAS",
> +				"IN3R", "AMIC",
> +				"IN1R", "AMIC";
> +		hp-det-gpio =3D <&gpio2 11 GPIO_ACTIVE_HIGH>;
> +		model =3D "wm8962-audio";
> +		pinctrl-0 =3D <&pinctrl_hp>;
> +		pinctrl-names =3D "default";
> +	};
> +};
> +
> +&asrc1 {
> +	assigned-clocks =3D <&scmi_clk IMX952_CLK_AUDIOPLL1_VCO>,
> +			  <&scmi_clk IMX952_CLK_AUDIOPLL2_VCO>,
> +			  <&scmi_clk IMX952_CLK_AUDIOPLL1>,
> +			  <&scmi_clk IMX952_CLK_AUDIOPLL2>,
> +			  <&scmi_clk IMX952_CLK_ASRC1>;
> +	assigned-clock-parents =3D <0>, <0>, <0>, <0>,
> +				 <&scmi_clk IMX952_CLK_AUDIOPLL1>;
> +	assigned-clock-rates =3D <3932160000>, <3612672000>,
> +			       <393216000>, <361267200>, <49152000>;
> +	fsl,asrc-rate  =3D <48000>;
> +	status =3D "okay";
> +};
> +
> +&asrc2 {
> +	assigned-clocks =3D <&scmi_clk IMX952_CLK_AUDIOPLL1_VCO>,
> +			  <&scmi_clk IMX952_CLK_AUDIOPLL2_VCO>,
> +			  <&scmi_clk IMX952_CLK_AUDIOPLL1>,
> +			  <&scmi_clk IMX952_CLK_AUDIOPLL2>,
> +			  <&scmi_clk IMX952_CLK_ASRC2>;
> +	assigned-clock-parents =3D <0>, <0>, <0>, <0>,
> +				 <&scmi_clk IMX952_CLK_AUDIOPLL1>;
> +	assigned-clock-rates =3D <3932160000>, <3612672000>,
> +			       <393216000>, <361267200>, <49152000>;
> +	fsl,asrc-rate  =3D <48000>;
> +	status =3D "okay";

Is asrc2 actually required? AFAICS this is not referenced.

Best regards,
Alexander

>  };
> =20
>  /* pin conflict with PDM */
> @@ -185,6 +239,27 @@ &lpi2c4 {
>  	pinctrl-0 =3D <&pinctrl_lpi2c4>;
>  	status =3D "okay";
> =20
> +	wm8962: audio-codec@1a {
> +		compatible =3D "wlf,wm8962";
> +		reg =3D <0x1a>;
> +		clocks =3D <&scmi_clk IMX952_CLK_SAI3>;
> +		AVDD-supply =3D <&reg_audio_pwr>;
> +		CPVDD-supply =3D <&reg_audio_pwr>;
> +		DBVDD-supply =3D <&reg_audio_pwr>;
> +		DCVDD-supply =3D <&reg_audio_pwr>;
> +		gpio-cfg =3D < 0x0000 /* 0:Default */
> +			0x0000 /* 1:Default */
> +			0x0000 /* 2:FN_DMICCLK */
> +			0x0000 /* 3:Default */
> +			0x0000 /* 4:FN_DMICCDAT */
> +			0x0000 /* 5:Default */
> +			>;
> +		MICVDD-supply =3D <&reg_audio_pwr>;
> +		PLLVDD-supply =3D <&reg_audio_pwr>;
> +		SPKVDD1-supply =3D <&reg_audio_pwr>;
> +		SPKVDD2-supply =3D <&reg_audio_pwr>;
> +	};
> +
>  	i2c4_pcal6408: gpio@21 {
>  		compatible =3D "nxp,pcal6408";
>  		reg =3D <0x21>;
> @@ -312,6 +387,24 @@ &lpspi7 {
>  	status =3D "okay";
>  };
> =20
> +&sai3 {
> +	assigned-clocks =3D <&scmi_clk IMX952_CLK_AUDIOPLL1_VCO>,
> +			  <&scmi_clk IMX952_CLK_AUDIOPLL2_VCO>,
> +			  <&scmi_clk IMX952_CLK_AUDIOPLL1>,
> +			  <&scmi_clk IMX952_CLK_AUDIOPLL2>,
> +			  <&scmi_clk IMX952_CLK_SAI3>;
> +	assigned-clock-parents =3D <0>, <0>, <0>, <0>,
> +				 <&scmi_clk IMX952_CLK_AUDIOPLL1>;
> +	assigned-clock-rates =3D <3932160000>, <3612672000>,
> +			       <393216000>, <361267200>, <12288000>;
> +	pinctrl-0 =3D <&pinctrl_sai3>;
> +	pinctrl-1 =3D <&pinctrl_sai3_sleep>;
> +	pinctrl-names =3D "default", "sleep";
> +	fsl,sai-amix-mode =3D "bypass";
> +	fsl,sai-mclk-direction-output;
> +	status =3D "okay";
> +};
> +
>  &scmi_misc {
>  	nxp,ctrl-ids =3D <BRD_SM_CTRL_SD3_WAKE		1
>  			BRD_SM_CTRL_M2E_WAKE		1
> @@ -402,6 +495,12 @@ IMX952_PAD_GPIO_IO27__WAKEUPMIX_TOP_CAN2_RX		0x39e
>  		>;
>  	};
> =20
> +	pinctrl_hp: hpgrp {
> +		fsl,pins =3D <
> +			IMX952_PAD_GPIO_IO11__WAKEUPMIX_TOP_GPIO2_IO_11		0x31e
> +		>;
> +	};
> +
>  	pinctrl_lpi2c2: lpi2c2grp {
>  		fsl,pins =3D <
>  			IMX952_PAD_I2C2_SCL__AONMIX_TOP_LPI2C2_SCL		0x40000b9e
> @@ -476,6 +575,26 @@ IMX952_PAD_SD2_RESET_B__WAKEUPMIX_TOP_GPIO3_IO_7	0x3=
1e
>  		>;
>  	};
> =20
> +	pinctrl_sai3: sai3grp {
> +		fsl,pins =3D <
> +			IMX952_PAD_GPIO_IO17__WAKEUPMIX_TOP_SAI3_MCLK			0x31e
> +			IMX952_PAD_GPIO_IO16__WAKEUPMIX_TOP_AUDMIX_TDM_OUT_TXBCLK	0x31e
> +			IMX952_PAD_GPIO_IO26__WAKEUPMIX_TOP_AUDMIX_TDM_OUT_TXSYNC	0x31e
> +			IMX952_PAD_GPIO_IO20__WAKEUPMIX_TOP_SAI3_RX_DATA_0		0x31e
> +			IMX952_PAD_GPIO_IO21__WAKEUPMIX_TOP_AUDMIX_TDM_OUT_TXDATA	0x31e
> +		>;
> +	};
> +
> +	pinctrl_sai3_sleep: sai3sleepgrp {
> +		fsl,pins =3D <
> +			IMX952_PAD_GPIO_IO17__WAKEUPMIX_TOP_GPIO2_IO_17		0x31e
> +			IMX952_PAD_GPIO_IO16__WAKEUPMIX_TOP_GPIO2_IO_16		0x31e
> +			IMX952_PAD_GPIO_IO26__WAKEUPMIX_TOP_GPIO2_IO_26		0x31e
> +			IMX952_PAD_GPIO_IO20__WAKEUPMIX_TOP_GPIO2_IO_20		0x31e
> +			IMX952_PAD_GPIO_IO21__WAKEUPMIX_TOP_GPIO2_IO_21		0x31e
> +		>;
> +	};
> +
>  	pinctrl_tpm3: tpm3grp {
>  		fsl,pins =3D <
>  			IMX952_PAD_GPIO_IO12__WAKEUPMIX_TOP_TPM3_CH2		0x51e
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



