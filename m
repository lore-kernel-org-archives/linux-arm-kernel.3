Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41A02D5B161
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Dec 2025 23:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XFBu7h1JZxFW4pexj6Ke1Y08ewGv0xJ1I7XQdP6xSOY=; b=skJUKes5p+PQ/N1RU4ghgapiE8
	Pfbn08N1whZy8s5Qo03HYhxY75U6TKzDKw2ssbv9b4czYHRQhZT7lQ75hdtlame7UG1Ri6RUYC/7t
	olWMhpookDlPenQhXE4/bd2FSfRxpc53yNL58zlNUDGosabG6luOn5zGD0N+E0IMHqqdDJhzgfYcM
	Rx189/aStiBn7xqSoemHd1PD908IF2lKPd0mC3X6LjusyjeIS1LkRFvlWdJkrNHWSs+S38dAtCYQA
	2cak4afiRf0VKAahHggZ8q26g3+sTKtttzPwd4IAYqaLi/oH5joqNT0D9QCEQ6NSpHPE2fk4r26cs
	VZ0sRyWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUYkB-00000001ys9-0lcc;
	Sat, 13 Dec 2025 23:09:43 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUYk6-00000001yoD-2RFj
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Dec 2025 23:09:39 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-477619f8ae5so17619675e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 13 Dec 2025 15:09:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765667377; x=1766272177; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XFBu7h1JZxFW4pexj6Ke1Y08ewGv0xJ1I7XQdP6xSOY=;
        b=CUpKbLfFaa4LNy61oyyfxICnQTSENuxYMalOGLUqpFL/YvzFvRqgEv4o2B/COiNM1g
         tbMgGQlGuI4W9lmyfhSRZ8MG6CTVxgcCN/B1Z5OzbF4yWomEzdN6KGxkkEXsxxa5ECF0
         sAw3Ax2M2Fsahgljb3Qy4AJkO4BSmt6b4J6+5z0nEQHSzXmQvcKwY/gA955IAkHA3WSH
         0PpSu55u94tewqa3bLazsFuGOMZwyS5QnndDl+XFWCXcxxjSffEnwjatKgHHoKPh0MWQ
         3qAjXFwX2DKequKkx16suSzD08F1hgWSJmUFQoC22vliNAGuv16VqhyMQIyltBosmi58
         tfhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765667377; x=1766272177;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XFBu7h1JZxFW4pexj6Ke1Y08ewGv0xJ1I7XQdP6xSOY=;
        b=l5zj596xUkoKojYwN6T8XQwvD/yEWxzY6azcMPLytDzhTp8T5UePoM1EqRfFzT717e
         EAr1kElpYQtQV5B0LW+1arcFX5IDgZIJyCk+40aLDNS48NLu7cc2WmJgJbgwe5nU6HW9
         /KPQs9aSJVDjMlVQJfcO67VKpomB4+44yR+bdxoaT+zddBUTiflOxaUtUh8+XxTJuqHh
         J6wJD5Ab+BhpZZOzeQROprFqgHJlgymhXWZDBXfq5rZYOKgKIqZu12scRV3Dzbdb5dGh
         9v/OuSdX5cAVPSVhaZK513NRtb8LNB243GQXqiuTIc22hSe8E6mfOTLT+dkM8QF9a/8Z
         Mj5w==
X-Forwarded-Encrypted: i=1; AJvYcCX1fp7BRbrjTqztwwlM9ec261qVil43QJHnG6k5V2yBVAXJJ3A1vECTe4EnG5khwOmNAQpJesYV+Ik1Zb0MDlqZ@lists.infradead.org
X-Gm-Message-State: AOJu0YxxA8Ll7vBOTKpC5c0stTihwUBEFW3BJKnnJhZMju1QdYSSHtgP
	IqwV+4Hex4f1FDvSbAw7YBZO8WU7YdKnFKygxYTDxQsi64XOCshmkLQn
X-Gm-Gg: AY/fxX5qHK8+HakYbCiQNjiUlZyBv8WA4iFjcinSPJzU71Q8iawkva5cWLdlMevUbPP
	AXJo3gBzLrSBcyu4AmFfFBB/N//ycZJ4qlq5Du/bNI9hdZKhD7z5+B8Uplovbu43BJGxMaacVSN
	EMKqJQNC4+a1p9u2HE3kEvqy265CzAqnxV19Bxv4BboiilM37jrseu04LhbDiXbAvjELA84Iy6d
	rVxv/CjgVGmG7R+qvVxncqTOgz0o1BzBLJH8CbViu/GnBQgXn7nT70hvdlVbkgKYWg42kmfQZOV
	lcK6OiSuvCNltoxR2UVldRFRFl9iNdd6cefu0WWbAyfglI73KipObWf5A0SbcxAzug5J2RFKjHM
	z/3A6i1GoF39u4+ygN/VcUg/Zm68rCeCAL0UEYUzYIGyLLiWKCWcklLxJnBW3y4eIq6fIONM4H2
	Jd40pQnord9XUhN3XE/9/oiodfj8hu3ZrlpooJ9LXLYdQuJIYRkJtSnGGt2d294zYf+a1/l3c42
	Gp4CG6JFn+eklk=
X-Google-Smtp-Source: AGHT+IHEtlj8IChu5bhTz+/I0sk3TLOpzFD+a5W1lLZsBxV4wDhUBQBzvW9/4MfsDfvwL8cT/egQuw==
X-Received: by 2002:a05:600c:4451:b0:477:9fcf:3ff9 with SMTP id 5b1f17b1804b1-47a8f90f54bmr59911715e9.27.1765667376838;
        Sat, 13 Dec 2025 15:09:36 -0800 (PST)
Received: from Lord-Beerus.station (net-5-94-28-5.cust.vodafonedsl.it. [5.94.28.5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47a8f4f4150sm106040995e9.11.2025.12.13.15.09.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Dec 2025 15:09:36 -0800 (PST)
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
Subject: [PATCH v2 6/6] arm64: dts: imx8mp-var-som: Add support for ADS7846 touchscreen
Date: Sun, 14 Dec 2025 00:09:06 +0100
Message-ID: <20251213230909.16810-7-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251213230909.16810-1-stefano.r@variscite.com>
References: <20251213230909.16810-1-stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251213_150938_628569_D28E3395 
X-CRM114-Status: GOOD (  11.03  )
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
index 169fc6a9c8cb..ebe615a84150 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi
@@ -101,6 +101,37 @@ &A53_3 {
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
@@ -348,6 +379,15 @@ MX8MP_IOMUXC_SD1_RESET_B__GPIO2_IO10                            0xc0
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
@@ -382,6 +422,12 @@ MX8MP_IOMUXC_SPDIF_RX__GPIO5_IO04				0x1c0
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


