Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F7CCCCFA00
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 12:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qu8nOseerJIwiaKexI9V+78CH5dDbgipqtlgAiyDwbk=; b=PVBlIIty2einBIVg9lHlAEwAtI
	7QNphoUwhr98yUVs++luVOtZXu6ei1gM+hfe1sl4EzLRhLkjdUTIlEuje3VUvuPLjHgqy9vk53HB/
	cOzZLU9/7Zyb1Y/wVfdFm3SMBmX+vMT92WHoCD2A/WhS9JEJ+VsRFCNILBCIqSMTKFz1LJjqetLin
	OplOHKyErEA4u6Y2P6UXlwvu/v/fuluUH6ZyAIgpQ5f/MEaOem7CVfR3zFzpjzCgyIP1cRqLgmuiM
	lhBPZ1bLpNN3BSgSXmKAchcjG99ptW1+t0OCVhosN5UcDNvie6or0nzIjn049zxLFl8J8rpPXU85H
	j9swAC6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vERMl-000000045E9-0dhY;
	Thu, 30 Oct 2025 12:02:55 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vERMh-000000045Ay-3lka
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 12:02:53 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-3f2cf786abeso673853f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Oct 2025 05:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761825770; x=1762430570; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qu8nOseerJIwiaKexI9V+78CH5dDbgipqtlgAiyDwbk=;
        b=EIRUecnuIYZGDc8HM0i2vbzydfe+WLZ8XBLAD0+e6Lo19oiNvBkqKv0YBnaIdhT0nO
         GgFWpNUXPvpZubNYhpYJ6gxmfOfOmwD2N3Ogaf6Fe4iSGTuy6Nb2TwDuc++QxR2djn1O
         6eEqWLxomffNJjJgWzxqcJxDOWsSIG25Kp3TcakPeToZgAuQk1YdgANUaH60at5Jc9ER
         HNPl+93jotOyFp/7EfSMXXPq8yWC5h78ClhsYo4M7pGf5vw2M54sDc7Oz4RSffDQKfdc
         XGeVAMGvmH4v0us1fiNXtEFCCtBptZBzUR1x1DsEVpcgDbaYITZEsjI4D+hDjZwG/Azx
         0wog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761825770; x=1762430570;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qu8nOseerJIwiaKexI9V+78CH5dDbgipqtlgAiyDwbk=;
        b=vI9ggbY7h7oyYNP4cNtem4Rgvtc98xD++mf3JO4AG0Lu2QJrcdnfwZmdEcGEy3dkt0
         L5fo4k6iTr+AXTgEsZ+gT9Xb4Nc8dF8XLcIDmaBqeF1+nzYsbFA2v4WZXibQRUfBrolI
         bCpoe2JDKXjzlMOkEkcqUsAbjRNnddm6ueXZv3DKAriz5ZvudU/S5iggr5KXGbZgJxXF
         yYHCoiivWFXyIPJHmyo9mF2F1IhjDBSBCWylWgIQLGznLBG34ZF40OnmsiINLJeSoIlQ
         gHUDy67WXoNKTQDAEec9ejpDN5hQdKDkRnIm1OIYNkuI7lvk0Bp4IofJU7curZXReX9g
         IydQ==
X-Forwarded-Encrypted: i=1; AJvYcCVjrhubT5ggcCmu8Bw1xsHOJsc7Ukq2HU1YSCsQ9uBqsZWcRO7lueCOY+yJGYDIXFDGkt89zn6XnlhG9VwHAW6X@lists.infradead.org
X-Gm-Message-State: AOJu0YzUKMbYDi7sH3EkYfteHgH1BNplZKkV5zAJAxmRgJChUpNfXZKj
	TYd3ANkT/VFG+S+2+LvmwW8Yzdd6EEjPZq/0Vwh5NNgtHWvy/wsAEMPi
X-Gm-Gg: ASbGncs8nb2SOdSXpt3p/AOmVhFtcH/ufQUgscwFpObJJyXqIRZle51YTeg2AjLylmJ
	dtJvSo3ZTIaHtkBrvhPXpH/TVttgX4JhnGNJ+0NbiOpxI3fMP51jCW5NcsFWzHYb7u3w9xDo5fL
	g07wC8dV9Ay51jd1pPWK/FXMlJpYqCpHhGUWChNqeWpTcsmyI9FyVnXxR2IQ6hoGLHkEfrdUzaR
	oO/u8EOgtPgH9f5yLfmrrjg1JQMFbLsESxf5HlGWuW+/EY0kkBVf8tOrRTrs5rtvJx9U3tCwmWI
	jkA0Qcjxye1l1+To29oBzQxt+f89A9FiNOD9G0GGIUcLzdbuSC3rzpLWbxE9pfBaFt/bYnQfXzo
	0fz+axkdM+Zrsneh1USe4uFiQeR6/VbIOPlKshCO6bas8FJhAiMJyeqI65tEc2B7nFt5FgHIcBz
	1ebTG7TyXM8gP+pcJpznd43JLNHo5dR52oQ99HDok7RrvbbxCQyCfgglL+or/nswJZJxNO23fo
X-Google-Smtp-Source: AGHT+IHFni13l9ewEcMuX6++qZosCb8kSPle7LBBV+o9CF/LKnPDmcWv4Piuhrw/JZlMYaZ2eGkiDw==
X-Received: by 2002:a05:6000:1a87:b0:3e9:3b91:e846 with SMTP id ffacd0b85a97d-429b4c73527mr2728446f8f.10.1761825769830;
        Thu, 30 Oct 2025 05:02:49 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-146-98-100.cust.vodafonedsl.it. [93.146.98.100])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429b9b436efsm2399848f8f.23.2025.10.30.05.02.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 05:02:49 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Stefano Radaelli <stefano.radaelli21@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 4/4] arm64: dts: freescale: imx93-var-som: Add support for ADS7846 touchscreen
Date: Thu, 30 Oct 2025 13:01:24 +0100
Message-ID: <20251030120127.509933-5-stefano.radaelli21@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251030120127.509933-1-stefano.radaelli21@gmail.com>
References: <20251030120127.509933-1-stefano.radaelli21@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_050251_954033_34105AB8 
X-CRM114-Status: GOOD (  11.91  )
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

The VAR-SOM-MX93 integrates an ADS7846 resistive touchscreen controller.
The controller is physically located on the SOM, and its signals are
routed to the SOM pins, allowing carrier boards to make use of it.

This patch adds the ADS7846 node and the appropriate SPI controller.

Signed-off-by: Stefano Radaelli <stefano.radaelli21@gmail.com>
---
v2:
 - Fix pinctrl alignment

 .../boot/dts/freescale/imx93-var-som.dtsi     | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx93-var-som.dtsi
index 0b7f6740e5ad..2dc8b18ae91e 100644
--- a/arch/arm64/boot/dts/freescale/imx93-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93-var-som.dtsi
@@ -212,6 +212,38 @@ wm8904: audio-codec@1a {
 	};
 };
 
+&lpspi8 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_lpspi8>;
+	cs-gpios = <&gpio2 12 GPIO_ACTIVE_LOW>;
+	status = "okay";
+
+	/* Resistive touch controller */
+	ads7846: touchscreen@0 {
+		compatible = "ti,ads7846";
+		reg = <0>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_restouch>;
+		interrupt-parent = <&gpio4>;
+		interrupts = <29 IRQ_TYPE_EDGE_FALLING>;
+		spi-max-frequency = <1000000>;
+		pendown-gpio = <&gpio4 29 0>;
+		vcc-supply = <&buck5>;
+		ti,x-min = /bits/ 16 <125>;
+		ti,x-max = /bits/ 16 <4008>;
+		ti,y-min = /bits/ 16 <282>;
+		ti,y-max = /bits/ 16 <3864>;
+		ti,x-plate-ohms = /bits/ 16 <180>;
+		ti,pressure-max = /bits/ 16 <255>;
+		ti,debounce-max = /bits/ 16 <10>;
+		ti,debounce-tol = /bits/ 16 <3>;
+		ti,debounce-rep = /bits/ 16 <1>;
+		ti,settle-delay-usec = /bits/ 16 <150>;
+		ti,keep-vref-on;
+		wakeup-source;
+	};
+};
+
 /* BT module */
 &lpuart5 {
 	pinctrl-names = "default";
@@ -307,6 +339,15 @@ MX93_PAD_GPIO_IO29__GPIO2_IO29		0x40000b9e
 		>;
 	};
 
+	pinctrl_lpspi8: lpspi8grp {
+		fsl,pins = <
+			MX93_PAD_GPIO_IO12__GPIO2_IO12		0x31e
+			MX93_PAD_GPIO_IO13__LPSPI8_SIN		0x31e
+			MX93_PAD_GPIO_IO14__LPSPI8_SOUT		0x31e
+			MX93_PAD_GPIO_IO15__LPSPI8_SCK		0x31e
+		>;
+	};
+
 	pinctrl_lpuart5: lpuart5grp {
 		fsl,pins = <
 			MX93_PAD_DAP_TDO_TRACESWO__LPUART5_TX   0x31e
@@ -316,6 +357,12 @@ MX93_PAD_DAP_TCLK_SWCLK__LPUART5_CTS_B  0x31e
 		>;
 	};
 
+	pinctrl_restouch: restouchgrp {
+		fsl,pins = <
+			MX93_PAD_CCM_CLKO4__GPIO4_IO29		0x31e
+		>;
+	};
+
 	pinctrl_sai1: sai1grp {
 		fsl,pins = <
 			MX93_PAD_SAI1_TXC__SAI1_TX_BCLK		0x31e
-- 
2.43.0


