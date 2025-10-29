Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32DC5CCF9EB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 19:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5pWDmbZrTdABcUlBNCeOKZzPd6c0px/j6MB6LEuyup4=; b=c+J0uxgf9YuCtaqYHblmRw3dzk
	hkj1gYeanGScofmbAsF6IgDCSHy3fUajxf+Kk/QvwKrapn7WIGvoHKiwn1F3QN5NW8Tex3CNTDOQi
	rEG23Qh6N0XFzQf86e6RF3/vdKSIKrUYCUoAXP/mhRyYOteRYOupepOxOiAfLIWO3wtty3ke3pQYl
	syjG0gN5xZNvc6PtaYYwDD66Flp1A9CIIls1HWOUzf5BHqk2LHpQnccK/Xo24wEzrcoexYU3Wb6jL
	NTmcpFHQLtpgQOF3s84omuFHScHhxj/FE7GR2gMS2pjBlN9wkTXYmQ5evOMfZYK1Ob7RuMrBWH7G/
	/4qPh3sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEBrG-00000002bWb-3bxC;
	Wed, 29 Oct 2025 19:29:22 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEBr7-00000002bQW-11vU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 19:29:14 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-b5b823b4f3dso37663166b.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Oct 2025 12:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761766151; x=1762370951; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5pWDmbZrTdABcUlBNCeOKZzPd6c0px/j6MB6LEuyup4=;
        b=H9aLKzZFHKjw7yYnNXvp2Nkcof+DkoalnRTK+VYlmVdjcfkN6xYB4VK/igdmlLlgez
         h2nzudZfo0JVAo5Zrj0dzwRWUkf5V4HHdMKLbkFeXdgkxagGcHc+SRF0zlhwWeHIaG9A
         pc3b+LgF1tXQScvN1Weq9MDIpp7S1UZ2g02jlteA7/4sLbIJLtoc0bTV2/iJ+65LJUWW
         sP57vNoVzA+X6smt/jOMHGmLLqRPXCAI9wxedg7YHAi7w25hpFLi4SarunS5srYVyMnh
         /gkB05vamhFcc+jaGa9CsVDYzl1Ybmp0hu1R4h4lOwjtk47Wk+qp24bZn3UVsKF1XRhH
         rYGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761766151; x=1762370951;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5pWDmbZrTdABcUlBNCeOKZzPd6c0px/j6MB6LEuyup4=;
        b=IJMLNHbkNJx+EvLMvV4VWhdRHmAgbbCsQST+EKpoxtBbLnFJPWwZumQ7qmF/eDScPO
         Oq4ltQJAdKN/j6uy8PhUS27orle/oZCvLVmVZplwlX2euTzuaCH2ZfshUF+1s+K/XK9q
         8KlXUgNtEtU29cZPzW4F4vkh3+Tqc9/5XSxqc53QRB4Qew76Rvd8w7f7YyduZ7TEely3
         EcP7bLvFYbG0CJ1yWDzxM+W0aUCTYhjanODOmwodnWJWU97Y25rAnSjnuyPPWJwrWDi9
         OX68LxmSb9eiaBpR3wSVXg6sZyXUUWnWLzmMY5CdsnawhXj28mTl972aL8ql3VNlBxDS
         /WCw==
X-Forwarded-Encrypted: i=1; AJvYcCXZHFWxGvN51Zev3INIdJeGKJOFzGDnOA/V7S4/YMXdqKSVwHEvRr5fRwzM0ZF0r6jbr5yowGowHZeJnF6shrcU@lists.infradead.org
X-Gm-Message-State: AOJu0Yyx/DNHcRRFGHHTbKTgu/aa8LoQhK5/4+w8xoY6g1ElhhaYzWGQ
	il4X7OM+am/o240ulnCSQ6KeM6glPkqE8rjNjjKFqz/ZmtC3R8+3Da7D
X-Gm-Gg: ASbGncsuR59E4P2vhRHBgVe0XoFAjGSqcGyEcVwqHMpawxW3GW2fdMr9KbTnzdkxmo+
	R9J+0OEM210pfGxxr785b9PAsIFNbews/mxHjriIOvVshSuI7kAEtj6grBkw3/wNQ5Jcmjgptap
	hz+CazsnJGT8KpMRA/o882NsLn3RllzdWMhb3mEre9gMsS0/lyma4ONRDkIQFsb1Vl8Pv9ihAqq
	W9f7WKARRb4yqTSyCBaqihno0Ts5mhWukbYLDtms0z+qDIKEWSB909/QC7Eq1XH3S4Z9jiURNCO
	D6jJ/mpF3/ar0NX6eMq7+DsOfpnG3zvW9mW+u6y12n0x8JbbmZIxo8521KUWAe31wTUXlCPt4QO
	+J62gzMiec0arr5eyQ0MNRiKeTItVVohQu7bL0oVFgGFnv8+D290O9pA5iIuOdglaXhDMui/I3p
	i5k1wHeHnYAafZrIh4NYJMuW7EiiJ+A+EsAF3MXyEq0vwOwkikfxO/gR92EoEyEQ==
X-Google-Smtp-Source: AGHT+IHwJhZkEKqRnVEte1O7I0899f550vGZfsEycCCZE4aJZvfMSJzZMXQacN9shYw9JF12C9LbCw==
X-Received: by 2002:a17:907:a03:b0:b04:626e:f43d with SMTP id a640c23a62f3a-b703d533318mr342078366b.47.1761766151112;
        Wed, 29 Oct 2025 12:29:11 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-146-98-100.cust.vodafonedsl.it. [93.146.98.100])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d8548eda6sm1496673266b.75.2025.10.29.12.29.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 12:29:10 -0700 (PDT)
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
Subject: [PATCH v1 2/4] arm64: dts: freescale: imx93-var-som: Add PMIC support
Date: Wed, 29 Oct 2025 20:28:47 +0100
Message-ID: <20251029192852.656806-3-stefano.radaelli21@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251029192852.656806-1-stefano.radaelli21@gmail.com>
References: <20251029192852.656806-1-stefano.radaelli21@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_122913_326632_8ECEC595 
X-CRM114-Status: GOOD (  11.33  )
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

The VAR-SOM-MX93 features Dual Freescale/NXP PCA9541 chip as a Power
Management Integrated circuit (PMIC).
The PMIC is programmable via the I2C interface and its associated
register map, and this patch adds its support.

Signed-off-by: Stefano Radaelli <stefano.radaelli21@gmail.com>
---
 .../boot/dts/freescale/imx93-var-som.dtsi     | 98 +++++++++++++++++++
 1 file changed, 98 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx93-var-som.dtsi
index 97198007b545..368530f5831f 100644
--- a/arch/arm64/boot/dts/freescale/imx93-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93-var-som.dtsi
@@ -70,6 +70,90 @@ led@1 {
 	};
 };
 
+&lpi2c3 {
+	clock-frequency = <400000>;
+	pinctrl-names = "default", "sleep", "gpio";
+	pinctrl-0 = <&pinctrl_lpi2c3>;
+	pinctrl-1 = <&pinctrl_lpi2c3_gpio>;
+	pinctrl-2 = <&pinctrl_lpi2c3_gpio>;
+	scl-gpios = <&gpio2 29 GPIO_ACTIVE_HIGH>;
+	sda-gpios = <&gpio2 28 GPIO_ACTIVE_HIGH>;
+	status = "okay";
+
+	pmic@25 {
+		compatible = "nxp,pca9451a";
+		reg = <0x25>;
+
+		regulators {
+			buck1: BUCK1 {
+				regulator-name = "BUCK1";
+				regulator-min-microvolt = <650000>;
+				regulator-max-microvolt = <2237500>;
+				regulator-boot-on;
+				regulator-always-on;
+				regulator-ramp-delay = <3125>;
+			};
+
+			buck2: BUCK2 {
+				regulator-name = "BUCK2";
+				regulator-min-microvolt = <600000>;
+				regulator-max-microvolt = <2187500>;
+				regulator-boot-on;
+				regulator-always-on;
+				regulator-ramp-delay = <3125>;
+			};
+
+			buck4: BUCK4{
+				regulator-name = "BUCK4";
+				regulator-min-microvolt = <600000>;
+				regulator-max-microvolt = <3400000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			buck5: BUCK5{
+				regulator-name = "BUCK5";
+				regulator-min-microvolt = <600000>;
+				regulator-max-microvolt = <3400000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			buck6: BUCK6 {
+				regulator-name = "BUCK6";
+				regulator-min-microvolt = <600000>;
+				regulator-max-microvolt = <3400000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			ldo1: LDO1 {
+				regulator-name = "LDO1";
+				regulator-min-microvolt = <1600000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			ldo4: LDO4 {
+				regulator-name = "LDO4";
+				regulator-min-microvolt = <800000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			ldo5: LDO5 {
+				regulator-name = "LDO5";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+		};
+	};
+};
+
 /* BT module */
 &lpuart5 {
 	pinctrl-names = "default";
@@ -140,6 +224,20 @@ MX93_PAD_UART2_TXD__GPIO1_IO07			0x51e
 		>;
 	};
 
+	pinctrl_lpi2c3: lpi2c3grp {
+		fsl,pins = <
+			MX93_PAD_GPIO_IO28__LPI2C3_SDA                  0x40000b9e
+			MX93_PAD_GPIO_IO29__LPI2C3_SCL                  0x40000b9e
+		>;
+	};
+
+	pinctrl_lpi2c3_gpio: lpi2c3-gpiogrp {
+		fsl,pins = <
+			MX93_PAD_GPIO_IO28__GPIO2_IO28                  0x40000b9e
+			MX93_PAD_GPIO_IO29__GPIO2_IO29                  0x40000b9e
+		>;
+	};
+
 	pinctrl_lpuart5: lpuart5grp {
 		fsl,pins = <
 			MX93_PAD_DAP_TDO_TRACESWO__LPUART5_TX   0x31e
-- 
2.43.0


