Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAD06D5B16E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Dec 2025 11:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KS2inHSkLCkU7sr8x8nyHZWnAt9HgwanjJVsRDuujGk=; b=FzcSqfTmtGSIASmJ1f7pINJo7X
	xftwuVnldl3Uo0nqu9+116Muo+Cdl2DkMhRgu5147Qyo8YzB7e/jwOAXK0yM9+z4b16con6d3I4uv
	RiDCXRgz6MCKiRLLaLzn+0+j6mdMMwuPSoLCXejrBnRQ9agDxxVDZi58BZz5dV2egkmw3z3RzyKNS
	J6766pV0nIdEMptWDH2XT+barjTaN7kjmfcy8/zXrAby7N+oe15IPO1b6IXJp/x48ebALUVyNnPqH
	yEDTKVyCA+9PgU1VdjRfY5ly/4bZ2CvOkWmPNjkC92bxlx6isg43BRiYaJ0rP4y01zJTCCVv8Kp3o
	PvcrxB6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUjvN-00000002Ncz-0ZxG;
	Sun, 14 Dec 2025 11:06:01 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUjvJ-00000002NZm-3CH0
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Dec 2025 11:05:58 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-47a8195e515so20734825e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 14 Dec 2025 03:05:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765710356; x=1766315156; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KS2inHSkLCkU7sr8x8nyHZWnAt9HgwanjJVsRDuujGk=;
        b=eleOQP/ZEH00fmfyO7xZaFgemGghL+a3CN9DHshRNpMZ0w3W5v2kVaiH5wzKwURe89
         S0qJq8NSnQ8k1hPqT5FX2hpMQBpj7+xMcCxucs2LznQ5aBRcEvoRLa+5VM9mwlmZ5ons
         KUKmcQ0zZD8KTSmQaNZCUCMlu92ay0L5orx55fNkKZFe7Kux1NIcYebNq0gBhv66YEyk
         FjibynJjILLDLi0qQTsf/xNKAZQCEO45Cb2aa7KTnJWQShTnHR/O+Xdw4nnC6Yb8tlwA
         diWp1P3YJIvAGndKvFuAtnQpkHfVKghyllvOtkXvp6vLeSvN9rZHqpf0wkMBIW3OJDm0
         28qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765710356; x=1766315156;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KS2inHSkLCkU7sr8x8nyHZWnAt9HgwanjJVsRDuujGk=;
        b=kqz4s9i+9/kG7YAxCA38pGBzg1xb1iVEhrwSACywUnPF+lNWMEFBvYxAYR/menx3XS
         8qJFQi8Kdcf5019WWTAEwBzHXhvyfPvAoSy2yVA1J70dArSthQsZ6X080FOb8rRv60S3
         W2BIz524MfbPX7iOn/W3Z9ib1gEMo2XuIV0iSotmiFWhjAcNGjfjL/os11aJh4bawPPf
         AxWAhh2YmrhoL/h0XGmjNUybjixcYakvG3DPEGnU9h2C6IERwfMFJ1IlAAI/Rr3RsM5R
         hB3HZP4jttUkUJdgueFOjJsIYCtS7+kvgZmb1DFjJ3YkWzBH/fxK2xuztqjRrlxA8xnm
         y+6A==
X-Forwarded-Encrypted: i=1; AJvYcCXEF0YmpjNZNlFdAc7SSIB3MmtGSrU76WUk7QU1X261Egp9KjUQ7cqgQMCOEgV8SRA7j89fNoBATle/1fvCS9MY@lists.infradead.org
X-Gm-Message-State: AOJu0YxSS/DMgz3pjZT9N6LFUEH3rC1eqtQfrvF+YgKZaRmVWDYnI5JO
	EMZYjuczZsxbtSlvOl+s7Bo88HdbaOyONQoO5nkhILQkb/ucvEqVv0BG
X-Gm-Gg: AY/fxX5W6TTN5j3BiqTFoN27ZYwPxsPA6O5sB0RCt5YBxwaD9N6u7rWg0tJ65z7xAuM
	Ylc9RVd9zFreqUBbKeNisvaiLTnT5cKb45PpkOCaFQF9CoIEtkEqIk1ZY7+a4PCPoo+zdUZ3Vtn
	F+6VrrrJuHEF5BMd2lVDqHFXZvJaqOpt2npI/L/Ww1cwYHMYpKk/4RQ54vohm89GKO2lglxpp1r
	lAkKx/89DfV6R4TaZe/9jNpzQC6uyKXl5Ub22G9aEGw4IFnNy/SpiFPjSdDwJBZdhOmv9Vw/ObV
	j0l9ijVkDoduxuQ/1YDWmJjO7yV8XpP/MJI7c0/KzZTweRhSvS7HVQ883jiy7d8nqdoSp4IR1mY
	wvyMtVwYfqt4WkdgB2txASBsjii1U8vhLpx3Mugika2trL2AIgxDnKP5l18mxZyFZobt7G6RYAq
	mgP4/kZoK/MzIE/6xKp6wfXC0xz8WFl2XpeF5kXlI+SyfVrHWpwUud/FjEVTVUsQyBCehF5ppdW
	XmLf21yVC8gcsc=
X-Google-Smtp-Source: AGHT+IGcS0RwgGVBlNe8lVebHczMSiBY6IRZ2F343Ze4Z7S+9GdrqUIDHIw2U32XGAlYd+RgQfN1pw==
X-Received: by 2002:a05:600c:4f14:b0:475:dcbb:7903 with SMTP id 5b1f17b1804b1-47a8f8bd9a7mr81322325e9.9.1765710355640;
        Sun, 14 Dec 2025 03:05:55 -0800 (PST)
Received: from Lord-Beerus.station (net-5-94-28-5.cust.vodafonedsl.it. [5.94.28.5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-430f36b6a19sm7823660f8f.38.2025.12.14.03.05.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Dec 2025 03:05:55 -0800 (PST)
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
Subject: [PATCH v3 6/6] arm64: dts: imx8mp-var-som: Add support for ADS7846 touchscreen
Date: Sun, 14 Dec 2025 12:05:29 +0100
Message-ID: <20251214110531.9475-7-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251214110531.9475-1-stefano.r@variscite.com>
References: <20251214110531.9475-1-stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251214_030557_843541_56FC3F70 
X-CRM114-Status: GOOD (  11.23  )
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

The VAR-SOM-MX8MP integrates an ADS7846 resistive touchscreen controller.
The controller is physically located on the SOM, and its signals are
routed to the SOM pins, allowing carrier boards to make use of it.

This patch adds the ADS7846 node and the appropriate SPI controller.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 .../boot/dts/freescale/imx8mp-var-som.dtsi    | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi
index 6da5df11c44a..8ab0e32879cc 100644
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
+	ads7846: touchscreen@0 {
+		compatible = "ti,ads7846";
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


