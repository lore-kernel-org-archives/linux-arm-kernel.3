Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D568CAC5B3
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 10:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=APo2jYD1PxrHJsECEd/93gcKH2/sr0pgqf5id/Ryl2g=; b=Zz+yQbeHxZHzHu+E0cuGZYQhUm
	sio2vBZQwOgGU3vMAkCVMxFqY64Aeb36t8Nm02CllSmfm3mCD5JGwYQCbqQ7BI0nkGxW9Hbb7TPcQ
	pJHwuVxqpisZT+yUpgs044KG+bJF4GY0Bw1kTMW2B3xTtq18EhvvBqSL19nK4bSTGp19WjDJjRbro
	/TE+5LxVa/e/7fEFV9NP5JIF0gGmrK2c5kbKSLCBC5lgVpUzOjBG6jDCF76fNGJiYyBWWM8zOGxSd
	w8wy07nufzpxXxclxcl7pGOwTBFsnr1J6hxLNCfpnviqcyyyZT+SrYoc0mGIPuG0zFwMRj6u3/DFt
	DwNILPYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1MYK-0000000GPup-0HWL;
	Wed, 24 Sep 2025 10:16:48 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1MYI-0000000GPsN-1ISy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Sep 2025 10:16:47 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-b33d785db6fso40057366b.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Sep 2025 03:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1758709004; x=1759313804; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=APo2jYD1PxrHJsECEd/93gcKH2/sr0pgqf5id/Ryl2g=;
        b=Y+m2I5aKpm0uP89LGOMNwjbRus0bY7Exi1oAuUoSAOk3+QmGSnqMsTxMUFCwpnrYG3
         DYzOxD6mh8n/KNi8OAn6GtZFAZlv2UKQhPJ/SdmlyEKryuWUh4p46e2ezLBZb9L/mQhe
         e+kqY8FdfoYI/M92kxh64peGUbixmwtBVJ7mY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758709004; x=1759313804;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=APo2jYD1PxrHJsECEd/93gcKH2/sr0pgqf5id/Ryl2g=;
        b=a2S6+s1oTaFt6lndq2YMpf0SKRrLQNFADyTqDXyJPE1LwVIPKkj/Fdxk8XnSOBeGuw
         jZ0IgD+qIrCzpXGeAbRsfwbk+geEnYmgaBVkN3PGhA2zvux+HPVEuvk95mVo5CHKFJPN
         kChEpx1+Qql4xUQHU/0oSsVr2Dw7Mi9ydcPDeDHM4s1DPcmMBjhOkvSpcDPEnZKT55zm
         gI2D5kc8FHhkbHV7RnSG6K1zI5OoHOlvMDUuGsESjU9hvt2WXbJJjk4VrNCcsxfN56MV
         R1fNUSNjclM8LvhQRZiru3xLWkyPJPZxBVmVUKVZY88H7Tnyc69jXLMFNg8zQnLzkhPy
         D2oQ==
X-Forwarded-Encrypted: i=1; AJvYcCX9/XZPMPAeR43CWFEQ0wjtb8VkTODhYLrv3EaWho+tmeEn4B/bm7zNZfP+QEC1ZkvgRnouQFk68Wn24P6VAPg3@lists.infradead.org
X-Gm-Message-State: AOJu0Yxsoo6wHwfmfpjfiiZxCSZAV8om8RaXCGXfy4od3lS9AEpZ4pbp
	mZUcnrtx0lSreJWCfsrJ48udRgT0zmeWqV7asYMv0gcSsv8/lsVxr7AS7+8ABIjXkko=
X-Gm-Gg: ASbGncsZbNviJnL/V+MYHNolUJscdlNEKQfYiswAUzsdULLwI3HwrpXQbzL1RCPO0TH
	44GwAKXFYr7kl3Jo4i3159dN8R++4KvaKA5pS7cdKe/SwGPpF52thcnDdTpu3e0CnrcQbeUQ8MV
	3c8tVUb/qs8p4TRBzkbbHAHguB8YKWODtrbNlbw1hf5ZQVsry88EVBrXmOqdbhjMeNbAvq3mgPR
	RiUVn5ReVjGm/yYsWP2n+o38viySBv2cKYHa6AZ6u1Y8g60gHjlVuzmpLynXHYF2rMP+Bm2n7ZG
	3czQMcjCg6PU7AhzsCxRiu7YNiwz9pyxawXTVUSnI4dNP6pA8MVzYYuKR/bTDfxHWngXgAPF9e/
	RcSVzZqtnMORwTIdo/iCHBwkByTkgB8iO5sWttsBwrpFxu4wAGPAitOQ/VRAvS6vM0ftXtaXlNa
	cM3CuG3YhWQ7AMoD1LhMFgvXoD7EYlPNy1gb5AhzbG6mP9kmlt2ZGlhK7Z6yE=
X-Google-Smtp-Source: AGHT+IFpgDJanqCTLTKh+/RXRTMpj1SXZmnA3vhBPvdRPeNe6cdiq1+fp18qRHYn/FojREkTohVOcg==
X-Received: by 2002:a17:907:d8c:b0:b2f:faf6:dfc3 with SMTP id a640c23a62f3a-b30260c9c01mr624226666b.3.1758709004422;
        Wed, 24 Sep 2025 03:16:44 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com (host-82-56-38-125.retail.telecomitalia.it. [82.56.38.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b28d206bd13sm949712766b.31.2025.09.24.03.16.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 03:16:44 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Michael Trimarchi <michael@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/3] ARM: dts: imx28-amarula-rmm: add I2S audio
Date: Wed, 24 Sep 2025 12:16:26 +0200
Message-ID: <20250924101640.2942635-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250924101640.2942635-1-dario.binacchi@amarulasolutions.com>
References: <20250924101640.2942635-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_031646_361997_B4245D5D 
X-CRM114-Status: GOOD (  12.51  )
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

