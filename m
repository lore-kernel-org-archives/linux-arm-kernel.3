Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FD1BD59D99
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Dec 2025 21:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tM/GDAHbcq8iQ+ECF/3alHpWVJkwLioPe4BjvZMs1mE=; b=lkgY30nbo5kidK/5L75K4HSc79
	I4XbsczNxCQOOTw6Dg4e3XXor0LPHvwjnaz/M+g9ZjkLPU7BYZcb23eF2xwwTdupS7NqcbfXmgpys
	WmexKf29pfWMAzLGi962i5MNR6lyP6YTwXhilTaokNWPAeuOIzJR/lzb0CttKaMB4e9STvyjW8sn/
	lS5CqoXyqIY1P87xqv0qHbAuZRXYvmJJyWRgyQcVY9SzPjg2I7waDV5oGwud2cebV1srRxowNE/sF
	Hd5mm0BAQqBomrG03YiHt+9rHXwrbcGfttW7kYX3Af9oYBcq2wsz6VTrWj5COvKymFQXiTIIJKTTE
	YiRTQeiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUu1t-00000002lAf-17bd;
	Sun, 14 Dec 2025 21:53:28 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUu1g-00000002l3r-2bzh
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Dec 2025 21:53:17 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-42fbab737f5so1123370f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 14 Dec 2025 13:53:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765749191; x=1766353991; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tM/GDAHbcq8iQ+ECF/3alHpWVJkwLioPe4BjvZMs1mE=;
        b=FUEBv5AR5krIvqax/PwiqglQZaNpJ8ExWd5fOnN2aFcty8pcvzXCzPUaBijlTpZb7u
         yHl/D5z4sRANCK61JeoTmjltM01Bt4rlUEbDsV3VnRqm0O4iFCwIPUA5v1mtTQrXrhcN
         nV8VDEdCvbfniQum9CPOpFdgF9O/LxkMmszOYN+r/4uK3qD20JdtkaQUo693nDfVs/Q3
         qlvvV+Mi/VuPRDSz7mGNGJSoXsjO0OO2fYIuyahuZZPfvLVVTUEKKCF7pN0kTOwTiJuq
         Ep3z1J56L75GcdO4ax2Z+pCQRv0YYx5pDbIhWNAgFXl0nZP2JKqJh90LVkvT4eDYiG/q
         KqMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765749191; x=1766353991;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tM/GDAHbcq8iQ+ECF/3alHpWVJkwLioPe4BjvZMs1mE=;
        b=sg6FdeKzjELzitDlGWMCBNaMDiV0ynWC9B/CXsF9jQssekVfre4rKwds0Mgc9WRssk
         ndMt4g0AVwvjaCd/wLe7EYCVyFWQCC0z4GEbo+m0Xbn4pFqgrU904ALGvFNtEotfOvMc
         AEAjJlt05MQl0pPjMTWMlxdlMcNBHH8fJqPqWMy5W6T/YvQJ6vQk4sQZIWFAm2DHNQwV
         yrcr9geT1MJuruMmSxeY6+s6TfmJOIWRRP8Wn61yPi/eMcHCw/5JsVmi/9Hsk4nXWPll
         /AQCvdZeH19Il2k104EdLtTORy03Edxvage8WymbjDNE2pfn1sKgN0fneSNzgJiVbIp4
         sdsA==
X-Forwarded-Encrypted: i=1; AJvYcCUCRhf3PsLaTXJMIWY3eYYDXNckJdMqfb3ybAl7qTJarXRXxoJBMQhg2vFCWDZioVy4K6x8QCaQpLNEjrqQTVad@lists.infradead.org
X-Gm-Message-State: AOJu0YwTm4CLsdlhkP9+GcKn9P8EL4pspA0HvB5afaolaswHLN7cfaIq
	xpY8BF+mZdiSSLnRqOogOogD7rYytfmh80SLcTb3dvFk+L5kSp7f0yXg
X-Gm-Gg: AY/fxX5jdIRp2w60H5z7rSS2dZ/Nsp5VwU9gLtsF59P/KrkvmZzUsNuoIp1syakC421
	h+y5IrrOJgjoahfrAh8YH6WuaXG3HbHMIDJ1wIdnsc+70HH5p3JMBRVnIdFUrRwV/OwK8ICOgUZ
	/l3CVwgY/mZuuwt+7UB2VR2287XIKfvhbo0gSF2qjZUIHHX95pwkcguCP0Ftg19e7LdK/bPqTXX
	DgaqscYwdH273VdWx3bnWaVR0x6zgkfLDfF0d63b8z60ULkp4hNrqQXi0sWZypmtHHdN+1TKjvm
	PyN/JeRSMtzVjdq3RdmPW+oEoSHtceOHgbImZvIUv3O9GVgrH48ssHOsdjQayxO1BmvdIqX5RdB
	b3cG6x+yesAZp8dh5oat+ZWMsRWZRBBkp3bExpczfoRSRoR0l/plcO1gH5qHySkMtNjiVRFPz2r
	OQo6+5fN1P6ibdXCQhpkfZSzPLsTARBGIYZPvXvRxIjb3dsRp2UD3BIo74/clig+ESSGuuzY1li
	GvY22174DKJWGw=
X-Google-Smtp-Source: AGHT+IE0IMq/1tUZxhnQGiJzgtJjbUC5CSa+FGAkLQyEctAaGf7usWM7SccW7nJPbd0Qiddz4/h6GA==
X-Received: by 2002:a05:6000:2908:b0:430:fcbc:dc52 with SMTP id ffacd0b85a97d-430fcbcdd84mr1760945f8f.30.1765749190606;
        Sun, 14 Dec 2025 13:53:10 -0800 (PST)
Received: from Lord-Beerus.station (net-5-94-28-5.cust.vodafonedsl.it. [5.94.28.5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-430f6a42c8csm7625568f8f.16.2025.12.14.13.53.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Dec 2025 13:53:09 -0800 (PST)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 6/6] arm64: dts: imx8mp-var-som: Add support for TSC2046 touchscreen
Date: Sun, 14 Dec 2025 22:52:53 +0100
Message-ID: <20251214215256.5812-7-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251214215256.5812-1-stefano.r@variscite.com>
References: <20251214215256.5812-1-stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251214_135315_164468_447D782C 
X-CRM114-Status: GOOD (  11.00  )
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

The VAR-SOM-MX8MP integrates a TSC2046 resistive touchscreen controller.
The controller is physically located on the SOM, and its signals are
routed to the SOM pins, allowing carrier boards to make use of it.

This patch adds the TSC2046 node and the appropriate SPI controller.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 .../boot/dts/freescale/imx8mp-var-som.dtsi    | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi
index 6da5df11c44a..49467b48d0b0 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi
@@ -100,6 +100,37 @@ &A53_3 {
 	cpu-supply = <&buck2>;
 };
 
+&ecspi1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_ecspi1>;
+	cs-gpios = <&gpio5 17 GPIO_ACTIVE_LOW>;
+	status = "okay";
+
+	/* Resistive touch controller */
+	tsc2046: touchscreen@0 {
+		compatible = "ti,tsc2046";
+		reg = <0>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_restouch>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <12 IRQ_TYPE_EDGE_FALLING>;
+		spi-max-frequency = <1500000>;
+		pendown-gpio = <&gpio1 12 GPIO_ACTIVE_LOW>;
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
 &eqos {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_eqos>;
@@ -347,6 +378,15 @@ MX8MP_IOMUXC_SD1_RESET_B__GPIO2_IO10                            0xc0
 		>;
 	};
 
+	pinctrl_ecspi1: ecspi1grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_I2C1_SCL__ECSPI1_SCLK                              0x12
+			MX8MP_IOMUXC_I2C1_SDA__ECSPI1_MOSI                              0x12
+			MX8MP_IOMUXC_I2C2_SCL__ECSPI1_MISO                              0x12
+			MX8MP_IOMUXC_I2C2_SDA__GPIO5_IO17                               0x12
+		>;
+	};
+
 	pinctrl_eqos: eqosgrp {
 		fsl,pins = <
 			MX8MP_IOMUXC_ENET_MDC__ENET_QOS_MDC				0x2
@@ -381,6 +421,12 @@ MX8MP_IOMUXC_SPDIF_RX__GPIO5_IO04				0x1c0
 		>;
 	};
 
+	pinctrl_restouch: restouchgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_GPIO1_IO12__GPIO1_IO12                             0xc0
+		>;
+	};
+
 	pinctrl_sai3: sai3grp {
 		fsl,pins = <
 			MX8MP_IOMUXC_SAI3_TXFS__AUDIOMIX_SAI3_TX_SYNC                   0xd6
-- 
2.47.3


