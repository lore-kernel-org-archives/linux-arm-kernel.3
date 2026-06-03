Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F043CD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 13:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LItmvUsB8D4hbVjxhrNTZcvzqIugkVhfkUtCucFdaKU=; b=wXB81p97OKM7FQosgJk+Z7xkDT
	gE/rmLKuT+cY2/AiyRTdJde3dW+/1pRsKIxbSOvMQ4j5z+TuCFbqZ257qIwGJks1Qt5tZqogqqaWg
	2E2jE1mzCgF6vK3xK5CfJMTZgxDFKw03NPyEnuKSKapzQf7MK5yMoekej2WQ7YCerz+g6Bz59qoZW
	pIATtTG0ZpyZTxcja6++tiEouLLsXDhih2TgtF/6dsOmYn8JuNV6Mc0V7Ovl/wxu2nYYUeJ3p4FMr
	0vwx0aqJoVXlIlbpmhGf0sYjZlIRCgcq4J4w7aF3VMQE4um/ljkZz3baiUGCXVZc0jFlmAar/xeSa
	4O5W16dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUlP4-0000000F8eC-1fat;
	Wed, 03 Jun 2026 13:13:02 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUlP1-0000000F8aF-1WvW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 13:13:00 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-5aa6c66e6c5so2325305e87.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Jun 2026 06:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780492377; x=1781097177; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LItmvUsB8D4hbVjxhrNTZcvzqIugkVhfkUtCucFdaKU=;
        b=ak0LAnj3crmv5A/P4XljV5k1gjBkyFMzbKdjxVbfT0bftsIxpYXJKIkIvVSVG9KOCT
         7Xi5ITs3W+wk8uChHyDguyhCVEJ8deOGMJ0lSVJMHH3tGzcU/+bPr0Q03lxOO0X8GbLJ
         eMvn2qaTIC8sp3E4w90Hhk6UvGwAj250iZWlXkV/qqrulBaclihuqORiTta77V+Gj0Nt
         O++m5k6GKtmVFrnweoyBFZjQgflzb4S9fyTgSFA3erhTzj+HkDuZAXx7vTHge92hWbtg
         gmqM+MyRsFDXxt+HPuW7D9TmHErmTvHsiDw1E8ePdt2sXcxeEEN9CUG8OmxKyNpvd5nI
         12Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780492377; x=1781097177;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LItmvUsB8D4hbVjxhrNTZcvzqIugkVhfkUtCucFdaKU=;
        b=rjeThc/YaOn1Cw38KdaERyPNIR4yoTIuvYiWGituPJ6OALhww76OLigISnOkyPkzcz
         gK0jn8AgST5QDFm7wJ4jOpRbgIJ4FZ7rU02Why8/oJU1H98gzNJ7V3ORignIZMUJjVgY
         RazL+LQrJUsDQ9IgSSYMWBv0hyFajUThyx4iKLqenfvOpzZmh8YU826WtPeJ5VqbSTdW
         yPKSohSd+qqS8c9Ur0dhVYBQ2yHbLYczY0+8Jxt4D3MvHj6RlpO0zJ56tJljMsr32iYU
         3AkTa8Vf4ObLrpCRa6sA8s1QtpsfxyvitmDbm6QVych5eMqFpShINwLIvmnLa05cJCxn
         TffA==
X-Forwarded-Encrypted: i=1; AFNElJ+QRhE9IXAYnDDnFw9o8AVXtTnAK27hTZw+jfQJ6geoBmQUTUrKzn53SYC/cukiEecv/1D7siuNdXxkW+b1a1BP@lists.infradead.org
X-Gm-Message-State: AOJu0YzDCVF0Z8n12ZyqnBX4Hprhc45Cw6i+x827OfBUZOOuUu1lJg1k
	kbSXjMvpudDlXVI/5s8xl0PzW/yBYp/zK9GUokwkUmEKFXkn6xYc9KMK
X-Gm-Gg: Acq92OG12w6e7OV95yk94xmTZ3pgNZv5zueZM1mIchzxArB8uurzoxnm6pUW049JIJM
	OZJHOxugPBTgukOduKmq2phtpAd+iP8j4RbAN0s67eqobh0ek/40ZEcgd6EnC1DAGhLPLT55fMz
	bsbDn3mTIvqQwUo+QY9Y7FnMhtQukgZ5nh9ZdhyA/YlY/VYENnqIh9IWUYVdtzT1KH5F4Ut0xXC
	EXhtfD9W9YQ4K6OL1vUGtVes28BSlpypD+p8D2W0OJyUDn0EBmHZbXSypYWwhhZVBm3jHkXWkUo
	L29jF0i9Fx/5VmATzX/Mxo13D0sXD3ynxpANcAKgkzg9HCu9ZpXMykyvDXzrrnFQwK1qRa1+odA
	kKPXFfWlJa1Y546X0P1xSKc64jt5ui8v1on4IuSvtFANharjJVe8Efr1AqLIEkRjFGOqehMMuWq
	pziSGJ13Em4Fc+n6/1GZ3KASxU+UtwE8ALMul+j8NVgAxiSuIcfS+l8JdFmElk23t8vDUUfv2hG
	/MhJ/yNEJqACR7T5J8ODZO8Lou/49WrtS6RzwYx400lXAHPgOxmZ3Zzmg8=
X-Received: by 2002:a05:6512:40cf:10b0:5aa:6e86:55e5 with SMTP id 2adb3069b0e04-5aa7c09b9c5mr1017427e87.13.1780492376896;
        Wed, 03 Jun 2026 06:12:56 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f3444fesm8361306f8f.20.2026.06.03.06.12.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 06:12:56 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2 03/12] arm64: dts: imx8mp-var-som-symphony: add TPM support
Date: Wed,  3 Jun 2026 15:12:41 +0200
Message-ID: <2e7ff00b61aaa855aaa2c6d9ad6e98eb673bacf5.1780492180.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780492180.git.stefano.r@variscite.com>
References: <cover.1780492180.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_061259_450128_7F4B209C 
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

From: Stefano Radaelli <stefano.r@variscite.com>

Add the ST33KTPM2XI2C TPM device on the Symphony carrier board.

Enable the I2C4 bus, add the PCAL6408 GPIO expander used by the TPM and
describe the TPM reset line.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v1->v2:
 - 

 .../dts/freescale/imx8mp-var-som-symphony.dts | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index 76928b005826..6c19a63ce405 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
@@ -116,6 +116,31 @@ typec_dr_sw: endpoint {
 	};
 };
 
+&i2c4 {
+	clock-frequency = <400000>;
+	pinctrl-names = "default", "gpio", "sleep";
+	pinctrl-0 = <&pinctrl_i2c4>;
+	pinctrl-1 = <&pinctrl_i2c4_gpio>;
+	pinctrl-2 = <&pinctrl_i2c4_gpio>;
+	scl-gpios = <&gpio5 20 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	sda-gpios = <&gpio5 21 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	status = "okay";
+
+	pcal6408: gpio@21 {
+		compatible = "nxp,pcal6408";
+		reg = <0x21>;
+		#gpio-cells = <2>;
+		gpio-controller;
+	};
+
+	st33ktpm2xi2c: tpm@2e {
+		compatible = "st,st33ktpm2xi2c", "tcg,tpm-tis-i2c";
+		reg = <0x2e>;
+		label = "tpm";
+		reset-gpios = <&pcal6408 4 GPIO_ACTIVE_LOW>;
+	};
+};
+
 &snvs_pwrkey {
 	status = "okay";
 };
@@ -201,6 +226,20 @@ MX8MP_IOMUXC_I2C3_SDA__GPIO5_IO19				0x1c2
 		>;
 	};
 
+	pinctrl_i2c4: i2c4grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_I2C4_SCL__I2C4_SCL					0x400001c2
+			MX8MP_IOMUXC_I2C4_SDA__I2C4_SDA					0x400001c2
+		>;
+	};
+
+	pinctrl_i2c4_gpio: i2c4gpiogrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_I2C4_SCL__GPIO5_IO20				0x1c2
+			MX8MP_IOMUXC_I2C4_SDA__GPIO5_IO21				0x1c2
+		>;
+	};
+
 	pinctrl_pca9534: pca9534grp {
 		fsl,pins = <
 			MX8MP_IOMUXC_GPIO1_IO15__GPIO1_IO15                             0xc0
-- 
2.47.3


