Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A637DCAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 13:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=APo2jYD1PxrHJsECEd/93gcKH2/sr0pgqf5id/Ryl2g=; b=stLQNXhScgxbVqUYiSKOmjndl1
	DzmVgpC9zIv47WCbnzbjgyxqlkaqur7G6mp4cr+HQhUz/gYPOy2yLjNmrNBI82RRcZ9fkmLs/rxGu
	BYatXqMmcPQqju2PkTTobABORMMTz5l+tGq9VXHH96kTxeUsNQjb2cZ1Drgjz68+XjxtY8WzP4Osw
	q2tAg6DeQH0GqT6rF3wRrKv67wOk9v7zoNhkVamQyQwC4iO9zIYt5N90xRx+dTqUMNLB9vrmBRe77
	Zguh5fK/MFz21ODKPHSeEpP1SFwkneiMzW18lyq8U0h1SbYVOSjaojwlJMk7NPZCnPaN4gy9liLB6
	a1Yf78OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1PE2-0000000052C-47SL;
	Wed, 24 Sep 2025 13:08:02 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1PDw-000000004vG-0KZO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Sep 2025 13:07:57 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-b30ead58e0cso287878966b.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Sep 2025 06:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1758719274; x=1759324074; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=APo2jYD1PxrHJsECEd/93gcKH2/sr0pgqf5id/Ryl2g=;
        b=L94P198P/ftLj1WeXfw2WikcyDKSbLbD02J2UfQbLjj+sVvFC8lhCaXzQe5ucuj+jJ
         c/qonn4YEjhlH3eT2zse8+9AD/8hyoms/dMpPAyd9dmfCid+GegRwz4w1kT7iMTW1tHk
         4ruQfug7WQHwDtYZGYU0QzxRA5e1FPcZUEm2s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758719274; x=1759324074;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=APo2jYD1PxrHJsECEd/93gcKH2/sr0pgqf5id/Ryl2g=;
        b=A1js+Yz/KskDUyHp8u5U4gXAsFsIdeVTykR3Cc1BUalSCaBOklqsGA61x2cWnS543W
         iOcT3M4jQ+qFzOB8MATTa2+PYRdPrgNyE4d9lMmRgp7A44fCKqwgKO+t5xNiOmJ3YZbi
         dliJkcfUmuBGhcT0d+UbawQo7HNca8L84zCa8z0/Mv3/m3xEYOLbZPfEAiasQ8+0Sois
         Ka0+TDOVlvvh1Cu/bUEqCdJ7QzcWRMWKVbwrWvRtqxKObL2hH8ph9bs0JTUuEZp0x/pM
         xSpq478VE4oJbfgdSGy7n25+gn45WJRxlf9E3WWkNUIRxTlO1Riors0AkXNCd4uYyCUK
         x8uw==
X-Forwarded-Encrypted: i=1; AJvYcCUc/x/gTySGEXSPgM8Gt6WMbyKtbqFO3ru1VV5wgYbshpXrzdV1DyZ1wOajNntwvWEOPopgQ9ghpoIZ6cYZsjSd@lists.infradead.org
X-Gm-Message-State: AOJu0YwBbknzR9ABxMSphbHWePOcRLYQidMIOPZd7CRdVqaBh3B20rlb
	r3yd0gsjojndx1YOMyq0vnuwewduRym1fEM5LPD/6K7GnZBJNqAbwlbwJSth29o7ocY=
X-Gm-Gg: ASbGncsx86LhicpE2WRLY+sDmDBABfDC3qGBqbj91f0EYr8Sov9YDiSEhBFAmFucXXW
	QFjFjoeVDYuEyllCKl+DVqZ2exhyBMdmBFuxMGk3I69ZJ+Ri+iRQGJo+nYc5jfNqrJFhaek0v/6
	xHxTAGIAy6jTslInRYERKVXqdP10IlVOKkbb1itLGyoCPS3MFcbPbsLGxFTE+7h6mtZBukkJAi9
	Ae0I+DTq6CdVZqhrfYVrbbx+Oel2MAKR2p0RCkKex50lSgALdLKCAbsCYeKPGL6K0lpNtq8X0+3
	QsYsa8PFnq31PsOC/opwKaxHcruFLPoIsM0QiuDGwC2ZRAn5vBSIBoUe/vxjHT6WYUuddlunPjI
	0sXTiZXd13Zt9dYoDlGbXuTxlhNvLORbWMxUIL0XUwr47eEztZZrEYsjTtpzTgbER0eaKcD0cgm
	bNdZ7IB0PTAHkIA0qDQOl4lxh4gGwP1FZ3waKb0z8D2+v6SLJ3Zi8+1ALoRO4=
X-Google-Smtp-Source: AGHT+IF67mD/mI0gnp/TuaWCgcn+3WEoNIAZH9oCfonzva0RaGE9yWAfNCRhfJo9YzLJalRUTsq/KQ==
X-Received: by 2002:a17:907:6e90:b0:b04:25e6:2dbe with SMTP id a640c23a62f3a-b302c1fff60mr622859266b.63.1758719273947;
        Wed, 24 Sep 2025 06:07:53 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com (host-82-56-38-125.retail.telecomitalia.it. [82.56.38.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b1fc5f382b0sm1574379866b.2.2025.09.24.06.07.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 06:07:53 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Michael Trimarchi <michael@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [RESEND PATCH 2/3] ARM: dts: imx28-amarula-rmm: add I2S audio
Date: Wed, 24 Sep 2025 15:07:45 +0200
Message-ID: <20250924130749.3012071-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250924130749.3012071-1-dario.binacchi@amarulasolutions.com>
References: <20250924130749.3012071-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_060756_126671_0067A5F5 
X-CRM114-Status: GOOD (  12.33  )
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

Add support for I2S audio on Amarula rmm board. Audio codec
TLV320AIC3X is connected as slave to SAIF0, which provides
bitclock, frame and MCLK.

Co-developed-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 .../boot/dts/nxp/mxs/imx28-amarula-rmm.dts    | 51 +++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/mxs/imx28-amarula-rmm.dts b/arch/arm/boot/dts/nxp/mxs/imx28-amarula-rmm.dts
index af59211842fb..0c5b52f67178 100644
--- a/arch/arm/boot/dts/nxp/mxs/imx28-amarula-rmm.dts
+++ b/arch/arm/boot/dts/nxp/mxs/imx28-amarula-rmm.dts
@@ -112,6 +112,29 @@ reg_usb1_vbus: regulator-usb1-vbus {
 		enable-active-high;
 		regulator-always-on;
 	};
+
+	sound {
+		compatible = "simple-audio-card";
+		simple-audio-card,name = "imx28-mrmmi-tlv320aic3x-audio";
+		simple-audio-card,format = "i2s";
+		simple-audio-card,bitclock-master = <&cpu_dai>;
+		simple-audio-card,frame-master = <&cpu_dai>;
+		simple-audio-card,widgets =
+			"Headphone", "Headphone Jack";
+		simple-audio-card,routing =
+			"Headphone Jack", "HPROUT",
+			"Headphone Jack", "HPRCOM";
+		simple-audio-card,mclk-fs = <512>;
+
+		cpu_dai: simple-audio-card,cpu {
+			sound-dai = <&saif0>;
+			clocks = <&saif0>;
+		};
+
+		codec_dai: simple-audio-card,codec {
+			sound-dai = <&tlv320aic3x>;
+		};
+	};
 };
 
 &auart0 {
@@ -154,6 +177,20 @@ &i2c0 {
 	pinctrl-0 = <&i2c0_pins_a>;
 	status = "okay";
 
+	tlv320aic3x: tlv320aic3x@18 {
+		compatible = "ti,tlv320aic3x";
+		pinctrl-names = "default";
+		pinctrl-0 = <&tlv320aic3x_pins>;
+		reg = <0x18>;
+		reset-gpios = <&gpio2 4 GPIO_ACTIVE_LOW>;
+		#sound-dai-cells = <0>;
+
+		DVDD-supply = <&reg_1v8>;
+		IOVDD-supply = <&reg_3v3>;
+		AVDD-supply = <&reg_3v3>;
+		DRVDD-supply = <&reg_3v3>;
+	};
+
 	touchscreen: touchscreen@38 {
 		compatible = "edt,edt-ft5306";
 		reg = <0x38>;
@@ -246,6 +283,14 @@ MX28_PAD_PWM1__GPIO_3_17
 		fsl,voltage = <MXS_VOLTAGE_HIGH>;
 	};
 
+	tlv320aic3x_pins: tlv320aic3x-pins@0 {
+		reg = <0>;
+		fsl,pinmux-ids = <MX28_PAD_SSP0_DATA4__GPIO_2_4>;
+		fsl,drive-strength = <MXS_DRIVE_4mA>;
+		fsl,pull-up = <MXS_PULL_ENABLE>;
+		fsl,voltage = <MXS_VOLTAGE_HIGH>;
+	};
+
 	usb0_vbus_enable_pin: usb0-vbus-enable@0 {
 		reg = <0>;
 		fsl,pinmux-ids = <MX28_PAD_SSP0_DATA5__GPIO_2_5>;
@@ -269,6 +314,12 @@ &pwm {
 	status = "okay";
 };
 
+&saif0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&saif0_pins_a>;
+	status = "okay";
+};
+
 /* microSD */
 &ssp0 {
 	compatible = "fsl,imx28-mmc";
-- 
2.43.0

base-commit: cec1e6e5d1ab33403b809f79cd20d6aff124ccfe
branch: microgea-rmm-audio

