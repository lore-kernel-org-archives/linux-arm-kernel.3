Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50B72CD3425
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 17:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5BwUXFYlbD6N53XtEJgB9mVWjzWl6gDwebbOYaZsPHA=; b=OhjFP/Cejj3gxCulFmsBfLc9S8
	hlznyYH7masM+2m9m7BHXcNh0VsBzCIQI07Dsck+/NfmHkbO/vaduTOqVemosP6OGNecZ09oyv+sj
	mjSS2LpAxBIOmw0xSmCZX3TW3srehA2PHKj2hYZAsMyHaRftWJSAFT4HmLtdlzNRd/LkFVdmIhQLF
	qyxqezlwp5kj4qfwk2tDMOI8dtyEkXexML8cUFLBhhlkLrHa5p5wyNXr9kl/iMq0OsZoH1i9AVELP
	DKHXIEEIB4TP2JChyc56aL3XprMNItTg1Pg2zExB5fzchE8LSFw8gKcCQ8tJXybUZb4d0qpkChExn
	aHHnzpNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJEUM-00000009ESl-1mWf;
	Wed, 12 Nov 2025 17:18:34 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJEUJ-00000009ERJ-2BnI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 17:18:32 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-b472842981fso157062266b.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 09:18:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1762967909; x=1763572709; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5BwUXFYlbD6N53XtEJgB9mVWjzWl6gDwebbOYaZsPHA=;
        b=c6cxSU175FvNM2Q94J+WIBWRmxdOD+0cIrnx0OboSFWJFWEZXPWEoaari/5ubm12yl
         FGk1t/yfyoim2oXH2Sps3I+jENBeJHdS58vEQ0TM+nk7x4DqqHnY3Qo0+mlTcDwhd+WB
         n2ytB80fH7jmi/UqauPPzScb+ZIR5/qJEfQ8E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762967909; x=1763572709;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5BwUXFYlbD6N53XtEJgB9mVWjzWl6gDwebbOYaZsPHA=;
        b=f1jKhAdAC6L4rn5v6xNmXjMp/TyuSqDlsnM/CrYufLldfFPqKNBCWzV5A1Bcs73gcs
         ez/tOpiEYeOBzpelvAWwxncYEryVKFFR8FvlgqhJ9EN0fz7rhqA0dgpPVK9Q205mNQ0L
         5LJ7dlg9pszaB2UHUAlrUf2gG5x/CUXEqCUKlh/RqWZRNBHFnFaLCQKTZ+NQ7H1ZvKzi
         JGxiWI+wDLrborN/YfHPPv8GwLjwBywfvOUpzDnux8UBMCS7OrbwHqUO/ZmmmX+D+v3n
         My/EX/affVqfMKZp9sMf6xbv4N3zRt2t3TcTiaiCk61eeTyL4RMtpWAP53eQu8N150o+
         9p7Q==
X-Forwarded-Encrypted: i=1; AJvYcCWwmPL6r7IovOVVMuocIF3vIwbN/6oNDlKUGPKCZjkyeVZDJD8Jw0aaj4VzrmJR+lD2tCK4Rl4xng/BZZ7LyXmV@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+VY1mAArNstzARHV9Yni4CODWbipnLSb1eXSqPSaD4hNHoec2
	UlEz4oHKRXUvHARS9qBzJD5+xr5+jHzJ1Nfd7hfQ8R4gxFa+DWDIb3j3XoJpKwE9lg4=
X-Gm-Gg: ASbGncsiesmof9XO6BaOGWaXruEOLaFUKMOKnw6hQRq5+eQS/HVo7eSzboGtPycnl1T
	yQT4j3z6qhFM3I/mEjB+lbb3pFzG9lYWGArfHyc67YYAtLhYvfKQU/oRc5mfJXL/vaYjZxdsHQC
	e8z9lDS73rDAy7rgIJGYtDC4b5dnum284PNVhUQ7gOXjuqrEYO03PRAlFm9EHoDykK9jZZSywYm
	1NKr7lOXct0EijG0aGZE+YGpn/O4yJRVPGHI5LOb3LwqocIlndiR+0GUVtHvM8xLp+pfZTWZndz
	eqB5WY5dgQvVDJT1BawQOBmaVL8nas3lrGBR9/AACgrkU6d4sQIR3y/8hccBC1fSiUc6/VjN6Wn
	LfvKaak/JM0CsUtmgYtVdD84SpJVW729wqAMp5Hy7JTBeDWaVGvVae1rTSAAeQqbdJSTrZpXH7e
	FvonqSvQGV2u9mpBl8V60fKMJfCQ2kaIxY1OGo6sAiBtXOvYWqPiUMg6NLVOeoHS6G6r31b3O7x
	RJU56tl/yLe8r0E0DNhN1zfeBOt0HUMMVcYcYAHVqoH
X-Google-Smtp-Source: AGHT+IGY2/902SKJFzIS3Gu24NoIxJSLCSqdXyB/GpWGp3CPdaOhQYc9wwsjQIgb8wLhfnUpqSpx5w==
X-Received: by 2002:a17:907:6d0d:b0:b70:b5b9:1f82 with SMTP id a640c23a62f3a-b7331a6ef31mr445484266b.31.1762967909196;
        Wed, 12 Nov 2025 09:18:29 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-54-71-163.retail.telecomitalia.it. [79.54.71.163])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b73381dd3besm180731866b.43.2025.11.12.09.18.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 09:18:28 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	linux-amarula@amarulasolutions.com,
	Frank Li <Frank.Li@nxp.com>,
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
Subject: [RESEND PATCH v2 1/2] ARM: dts: imx28-amarula-rmm: add I2S audio
Date: Wed, 12 Nov 2025 18:17:12 +0100
Message-ID: <20251112171820.4046537-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_091831_596946_8797B147 
X-CRM114-Status: GOOD (  11.90  )
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

base-commit: 24172e0d79900908cf5ebf366600616d29c9b417
branch: imx28-amarula-rmm-audio

