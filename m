Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7FA3CCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 16:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Veu3Rsq4FjpOJipbhAFeCCYDWDFK0CBkfMfLFx9DhXQ=; b=rAUNMDRXrK1Ql3eRWVH7+XGYw9
	zb3ell7QhA3iDL0m8tpywAQKw7SWT1n8vwTkEGNte3rCNTHP7DUNYMhjzHpQobq1tJilHVxTkKjw7
	n2N0ySECuBdlNOWqxFnfhmKPuSGSfZ4YmqsB6zaopjkQF8vYhGYW3GlwRLBQL742cJ0IKxcg3rnuE
	UufIlTdG1IgKfu8dxox3DQLL2yGbZKl+AZ+VytIgB6kOj5tb5qtcVEykDDae75MeXUrNmD6VAg7vV
	oyIN7OdgplKl5KRGHN7Uus9/wsgTTTLawLtjyruS3D7T0v8nR/TxXGryhOdz+5iiN/sWnJ0WDfUR3
	hg4H3WkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDPo6-0000000EHtI-0IXR;
	Mon, 27 Oct 2025 16:10:54 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDPo2-0000000EHs9-3hwV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 16:10:52 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-b6dbb4a209aso11783066b.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 09:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1761581449; x=1762186249; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Veu3Rsq4FjpOJipbhAFeCCYDWDFK0CBkfMfLFx9DhXQ=;
        b=HpeKlAr97PhefKQNOHlgKS+S3tvbuVPLie//iFxWZiPfXhM/6yLL/XE90yL0AKZKRI
         I5l/5sJwXMvVTWfhhmSWlyRQ0gkZLYvrl7GFtt1ByjLC2jl1Zfp3v+wweDEzGajMrct8
         RIO5YZ0/rvRhPJ8dlhLDLb7VP+2J2OSR4hCx8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761581449; x=1762186249;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Veu3Rsq4FjpOJipbhAFeCCYDWDFK0CBkfMfLFx9DhXQ=;
        b=Bk75UTZi1ETD8m8AzthRXP5jm0jJVILYmplZNsHi5X6NIgj+ejB2Wo3GXOP8bs/ECM
         ihN8DxWQoMMnHL8YwrYyqj7Z12lZF9m/O6EZfBSDOf5BmSf9Xqynxr4/suLDZsCqniHW
         pMTQjKUy3OjnsSpn7Dhda0mLgsnOTneGYpUqwuxFcdb5JlcSx+6ldolgGfm2bshK7hpG
         B3mwyPNeaeshD44K+ab1zBuBN3kVk3r9/1j24OsPF9eIuspLBJ1HROmTN6RjcNWGM7sH
         t0T2olEhpkUs2jIC+qdsYIV17Gd/UyB6XzyKN5Q5pPwlZESceBZLRNK4dORCa4TO29s2
         hVig==
X-Forwarded-Encrypted: i=1; AJvYcCWJ69umB15yzPLQn73EwRdvCbHgRF+Z21pJGUou0yu2K4/ZaWkrJjZ/r3PZqFkfZcq+UkyzcGwFTsvJ5gj0qLIL@lists.infradead.org
X-Gm-Message-State: AOJu0YyDNkoZlJksg73PrKI6his8Fkhsjnkarlb8eZhXfR1BBTZ3ssoX
	gDnm4k1YDxsahdcg/U+BcoANCEtm7Na1BUJ51XFYXro1IDbY1Cx5fu2foC3Su8w6lMM=
X-Gm-Gg: ASbGnctyQi1QF9HMaMADpRdUrMMW8cixoSKyGuf01n5W4WnH4fbYlSSV0qSOCAHKhBV
	/JM727P0unxfCjyMhzgK8NRN9Xn5QjxyaPzdOeG+XUXt20FBlJtjb6YEVwEhjj/KRfQICRU9geM
	jBYHzRJjFxJhnyEz/RkbsPlbj0xWzyPcpYlQAZX10Yn0IW8+VdCsaoj5BEuj/yhsgg/T7hkoALX
	F2CEtfIXF95LTNDtV4BYi7NQaoWsIWZA4RrrISbpe5WWDeDIVa3gypBaD+gd7QHbgHc28IrsbxX
	QVJg+2yNxuyWly4x92Jgigek7WYHyHFclucaBHPoh2kCNdf1C/tuzxUPYiwGzejUrzE7sHg3jjs
	X82lgVMLdtGLAbfSkcm7hRKkos//tIAqGYeekFOoArYVuYGN9De3zkmoSLj8UdDzO5/qxBscZkP
	3e0o5xIhiYEfFXS6YkpejYVfSgmany0EXgBVKT95UiX7okFRBMeAyKLXwPB+JPTu901yLF/Vdf0
	6ushwL9S+4uGAQnzjGsSVdiBG+wXzwyeQiR6W1Y9B4zvBk11pM+S7w=
X-Google-Smtp-Source: AGHT+IHNVBcPF4r1uhIP+zj56hLjLDUq4AexzJeI5WwqZEYSfzmRjyop2h3ZCez24VELoNyVU95XiQ==
X-Received: by 2002:a17:907:86a0:b0:b0b:f228:25a with SMTP id a640c23a62f3a-b6dba5f0b7cmr39405266b.64.1761581448554;
        Mon, 27 Oct 2025 09:10:48 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-82-50-34-170.retail.telecomitalia.it. [82.50.34.170])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d8ceeaffasm742437466b.45.2025.10.27.09.10.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 09:10:48 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>,
	linux-amarula@amarulasolutions.com,
	Mark Brown <broonie@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
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
Subject: [PATCH v2 1/2] ARM: dts: imx28-amarula-rmm: add I2S audio
Date: Mon, 27 Oct 2025 17:10:23 +0100
Message-ID: <20251027161040.2020623-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_091050_959969_56BC7A95 
X-CRM114-Status: GOOD (  12.15  )
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

Changes in v2:
- Rename the codec node to audio-codec@18
- Drop an unnecessary newline

 .../boot/dts/nxp/mxs/imx28-amarula-rmm.dts    | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/mxs/imx28-amarula-rmm.dts b/arch/arm/boot/dts/nxp/mxs/imx28-amarula-rmm.dts
index af59211842fb..ddb64f3d0471 100644
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
@@ -154,6 +177,19 @@ &i2c0 {
 	pinctrl-0 = <&i2c0_pins_a>;
 	status = "okay";
 
+	tlv320aic3x: audio-codec@18 {
+		compatible = "ti,tlv320aic3x";
+		pinctrl-names = "default";
+		pinctrl-0 = <&tlv320aic3x_pins>;
+		reg = <0x18>;
+		reset-gpios = <&gpio2 4 GPIO_ACTIVE_LOW>;
+		#sound-dai-cells = <0>;
+		DVDD-supply = <&reg_1v8>;
+		IOVDD-supply = <&reg_3v3>;
+		AVDD-supply = <&reg_3v3>;
+		DRVDD-supply = <&reg_3v3>;
+	};
+
 	touchscreen: touchscreen@38 {
 		compatible = "edt,edt-ft5306";
 		reg = <0x38>;
@@ -246,6 +282,14 @@ MX28_PAD_PWM1__GPIO_3_17
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
@@ -269,6 +313,12 @@ &pwm {
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

base-commit: dcb6fa37fd7bc9c3d2b066329b0d27dedf8becaa
branch: imx28-amarula-rmm-audio

