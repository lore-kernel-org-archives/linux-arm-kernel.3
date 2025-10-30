Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6716CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 12:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z0mFQTcGqmSkiKPfup/qBvNwcKsotJhGPnyj9Bdv5bM=; b=W4Ht+6Ndg0LeH+we2FBsgSYa3Q
	73kGW8m1Dml8427hlYuscFuWSDgLDYEcUltWXLbKcjxxRJ2a+qdAL5cvloPkxpNPrdJusataZowYU
	GywaXdY3TEXvDmEt2fkKWuy2d1i04Cdn8g76UlBtzDzcloBB1XboyEAS2J/iP9P7tbxpCNQ/PZsPC
	fldatn9ECOn0TJiz5jPRnxM2B1IOBoQ4cDTlhIN1CKZ+q7WdyAYvo2tQt5MejE6X1JGunk0hUXRYx
	m0bSZbEqicxOUSFDiOCBl7JVdPExfldg/1rm+eVo4Jfp00IgUqyV6iiek3B3CgF5ZUmUm51P01RWU
	cviQ4UWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vERMk-000000045DO-2IV8;
	Thu, 30 Oct 2025 12:02:54 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vERMf-0000000459s-0Hmd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 12:02:50 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-47112a73785so7327785e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Oct 2025 05:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761825767; x=1762430567; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z0mFQTcGqmSkiKPfup/qBvNwcKsotJhGPnyj9Bdv5bM=;
        b=m683hOB5vq6fQAaPLvQHHsW9geOOnq/4Yd4g+0ilFKQwVYdQXj1y3uCKhcm3Ha+c48
         fboQlBM5yDNGX7GB0/+m0UJfWwbAvnM/DFAPRpLIMCqgyiIy9mODBHx1mLzCaXvpvlm5
         3Dn/iZ7bm6/LPj+dKOVpA7bEl93rfqnHurolo/gpf1M5PY7A14E18pQHBwKhlHbMUsZM
         iNyaJ3ddy/yzahvKkVMfdtkilYjsIEhBrFcTybqLZbaMfOwki031KubyAXp7B9Qzm66D
         o+wKb9XJgETA6RSXzpbVHJ4wEb+PPKKOdkfHoNzpgHpWIKYy0+siU7JAr+2/hFoc9tEI
         S2Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761825767; x=1762430567;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z0mFQTcGqmSkiKPfup/qBvNwcKsotJhGPnyj9Bdv5bM=;
        b=V5LxSQUm+iK1ym87VEm6g0+q4sBBezktcx5DfzM/XDQLqcY+C2gVnDfvxrMb0LDEHF
         Rjjc3FgdEh1GE5UqrcB+9lBvGG4cSUvqUPQ88D6nCYVn9RCqZS/iS5jnYkhqCWhU1t3x
         FRiKZxdlSP9CEtKn+wqKBRRieEE2QoRTSbePICaLthad/BgXWkXSg/7/69cJ/l900xyO
         0gIFydT/aRLfGyghHxzvP1hO+VEY4ShxbSNpoC5pSdCWv0p2EplX9MiC4uooZRu21bZe
         r7seXgRfHIo9r1VRGxI6P+Qd4UWIHy2/CuArDye6Kpy+kOKPllGATEXuoQ2TM1l0CL6Q
         B9Aw==
X-Forwarded-Encrypted: i=1; AJvYcCX1oZyT+03xN0mHIs2waAIURtNiPemko2+KVmQWC77Lqka6qIPymTCPtHSGJzVYgJq7x9k4knzZz3YxhD9/rgvk@lists.infradead.org
X-Gm-Message-State: AOJu0YyvvUf7VsnTslB8v90u6RIJgNEXFo0KnTfhER6vSL+WHbDnvJCH
	UQaiMVCUznd3ZPNGvk48tnghXqJqxpwrX6wL93gdXIXP6CfJiWCVJShT
X-Gm-Gg: ASbGnctbx+5AeN3vxMMhgO/cVqO+fvvrmG9bYLba3fUwTJHdYbPYVY48EgkuXGbhuiR
	pPKfzOGlj2T8BoQFGdimfb03cP1iSA5fimc9S+IJPuZEJ4JpG2NdY3IkwYWw69pCqpYENwW3fhN
	OYqyUYcCTqlfDxajs9qeIXg5mVZLSmTh8NiypiXQFnbFUPvSyNmn1/JKo1criUZzAJy3JG+1If9
	wr6/wkjOzeR5uGPNywrAxahX/t7Gfzk0W0cHf3wZtj2dQD1gRo2cjfRNgbjyf1AjLbqhWyCljjK
	TOuwuRLM3El8AF1SwRubELfBj2VoRf7jx3Ui5DSyeZV9rqxh3SeXHhkAHeQodf32rdSxYmZ8Dkr
	y9bPEsJx70Y0PL1LI6bJq4c99PYua4xLToq/7T3MYSv9HKUHiFuAZoJk3cA7FCzJ8Tkg6aKoKzs
	Piwo0Gr/UAmC6ttdkJW2qeJF6TfgJDcBk2KVlhlR8pKSG59liYwGk1FmR22mUCMD05SjF3YH6O
X-Google-Smtp-Source: AGHT+IE+1Y1iMggZfF62Rfc9eTffUBllTx25tgqnlq9EBnWiqaF5y6rvo9W+qkPwMxETU1MJsDHwbw==
X-Received: by 2002:a05:6000:240f:b0:3ec:db87:e8fa with SMTP id ffacd0b85a97d-429aef830bbmr5741010f8f.26.1761825766901;
        Thu, 30 Oct 2025 05:02:46 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-146-98-100.cust.vodafonedsl.it. [93.146.98.100])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429b9b436efsm2399848f8f.23.2025.10.30.05.02.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 05:02:46 -0700 (PDT)
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
Subject: [PATCH v2 2/4] arm64: dts: freescale: imx93-var-som: Add PMIC support
Date: Thu, 30 Oct 2025 13:01:22 +0100
Message-ID: <20251030120127.509933-3-stefano.radaelli21@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251030120127.509933-1-stefano.radaelli21@gmail.com>
References: <20251030120127.509933-1-stefano.radaelli21@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_050249_130304_EFBE1DF0 
X-CRM114-Status: GOOD (  11.48  )
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
v2:
 - Fix pinctrl alignment

 .../boot/dts/freescale/imx93-var-som.dtsi     | 98 +++++++++++++++++++
 1 file changed, 98 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx93-var-som.dtsi
index 37f7837fb5ac..85fd9c9c9372 100644
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
+			MX93_PAD_GPIO_IO28__LPI2C3_SDA		0x40000b9e
+			MX93_PAD_GPIO_IO29__LPI2C3_SCL		0x40000b9e
+		>;
+	};
+
+	pinctrl_lpi2c3_gpio: lpi2c3-gpiogrp {
+		fsl,pins = <
+			MX93_PAD_GPIO_IO28__GPIO2_IO28		0x40000b9e
+			MX93_PAD_GPIO_IO29__GPIO2_IO29		0x40000b9e
+		>;
+	};
+
 	pinctrl_lpuart5: lpuart5grp {
 		fsl,pins = <
 			MX93_PAD_DAP_TDO_TRACESWO__LPUART5_TX   0x31e
-- 
2.43.0


