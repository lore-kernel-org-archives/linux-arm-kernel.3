Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B8CCCD6E57
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 14:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2r42H6aMK4b6UNRgIksoOLm8aN27wEuwsly03FlTjcQ=; b=mEJYSJzcoRiQPyqeD/oC/ljHde
	ghHJPxpqLlEEcZtm744CfP60eoHtl9FvIDN0f5hM/YQ7ggq6QqXrc/xPwGjpkkIpzFBmXcAm1yWO9
	bL+mrbBbI1g3ta3+zvufm2mJ5UyO+frxpgAXT2hfV4j7KIlx4PrCBrg3w6eSgMOPYb6cBzDGIm+7r
	mCuU5CO4uR5EiYgF4Un4qBhqJFDt7CEYFilkw0tqz2A+kZ/qIL7rjrVtvKlkEZ9cGCuCojRh3QquE
	C+Ho3+ackxmiMcM+K5GTS12T7gc2p1cwWDbYSJQlJDK6P+0y4ZBJbU2ylLMs5QdQNJeiIYS/3nlQ0
	CzY0z0jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUmjA-0000000FHE2-0Psc;
	Wed, 03 Jun 2026 14:37:52 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUmj1-0000000FGyq-2cks
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 14:37:44 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-490b2b037d2so17505845e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Jun 2026 07:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780497462; x=1781102262; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2r42H6aMK4b6UNRgIksoOLm8aN27wEuwsly03FlTjcQ=;
        b=K1o890049cuxw0BP4sQC1PHVz0UYEmt+bq96InpgZi3I1doVy/GpviuxJWbj1vLZFz
         tPhO5GWv1wleqUsIzMUEJ2hkAiB2pLKX0ZZ5gic+4FFd9Yo+y8NXmmkcvTMOknKuGrIw
         esGBULj5MlvqIbmJRqTaP/Ka/QBJt3EvitPhGqM7vXMFCah4C8KaWEJhzSVB7e2NEOiJ
         JefX2pJg74LXlJurYbDOFkQ3TU4jklEZ+NIYiOpBiGUMTMDADWahwWrixQ9Rh/M/bwrx
         ns4T64PPp5ZZ7h9uCn7bTzYgfL1JPSCr72owksWbSi+kKvah3VWqLg6y5IlW3Ff/hIVy
         +EhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780497462; x=1781102262;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2r42H6aMK4b6UNRgIksoOLm8aN27wEuwsly03FlTjcQ=;
        b=pv7mFvdY9JeCOZS6xoDkcbhSpLcLsZD5hizuwISmbaGxG0cOs+Et42pHooqVHs536f
         HYUWfKI2tNNQG9ES1lXs6TwWh2F81F+9Mek0xO7cO0KGGG5AuTviGk+H+WoRVEGPDj30
         Hq0vhZ6bRmIQ3Jyh1tIGjTMxO02DN5De3L0YQDq49D6JCzuROJXIF9JiXsF1zsObfBET
         lX3YnmpWUJU+yzY1NnsbcsYunCNQqkzrKRBdvwZ28l+wOBwP8rp5He5tp6gO/2XQwMzV
         bvRCHWHnvthbZEtA2A9aa3qF1i407f+1GzxRBDFdMy+AfQ8gVdn7oJWduZ581LIU0M1B
         NLCQ==
X-Forwarded-Encrypted: i=1; AFNElJ95B1Fuc16NofSBggifY1REndA4ehq//TXQxJJZEf7dJFh3Yv+tBKkSOFBMZuC8eTDLv/rVYaGEKq8Aefc7gd98@lists.infradead.org
X-Gm-Message-State: AOJu0YzpgqKiJyVUThlpCqX6qcExJgH6UIPvXM4anCaEUVVUNYj3NlPl
	GwBqlk2ROfaU/oXTTQMfMxaAk2YJsicEMkxJP3ICs3TlHPLxpN6qlpJD
X-Gm-Gg: Acq92OFVSxgSnsx+NMg+eQamvgwbzhD49fcS7MRFpx6Iy2H2Thxa89DJIJvvDs28Xvh
	Zegc6Fx4Xg9p5Kcz6POj2Pe0RVWcZqYCSjWGsnZiClP1+nt/Iug4bew2Cu5GJ93R9xD2Q9ji8kz
	/pJ2YlJ6qvDnV+4PKwifIpMWA/V3648SymzsQ8Cyp+LM5Q5SB7nV6K18gGjYOIalhsmKX2U/dHf
	oRDPUbWXJFoPeaz6GUGkaALPRsmsmJgmjeQoGsP2UjbtB3CZ68OdBa4LMd+xB0WzStNQou277Mj
	7nuhaJxQLe8Vu+9SpNxQY8j2eN/uQzMREPWmXI9qlgZBloMfg8O0vmtUWEnalCGkUhbIjs57GAF
	Fc6Hr8miWqeHPdLdfd1m0JTs33pcrGAJEKSXUp/r9JtbdXB+ZmGOnH4IEt4dmGIF7H7Vo4QVy21
	9goD5M+PNk8bdXGQf+wcQoopg9l5f/BTZyLA9pS4xG4UhzLz3jNpv55TDqGt8Va7f//cKSuBc65
	rM/Ml9hrf5ZyM+4smnrs8upuJz/8rhzzxMz3WSbNmKcfWu1
X-Received: by 2002:a05:600c:c163:b0:490:b5d0:598e with SMTP id 5b1f17b1804b1-490b5fe9575mr65008075e9.21.1780497461900;
        Wed, 03 Jun 2026 07:37:41 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b6150bfcsm120267855e9.3.2026.06.03.07.37.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 07:37:41 -0700 (PDT)
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
Subject: [PATCH v3 14/14] arm64: dts: freescale: imx8mp-var-som: add I2C1 bus recovery GPIOs
Date: Wed,  3 Jun 2026 16:37:21 +0200
Message-ID: <aa740b2d684362627b46d35912c979c01f8c2c36.1780497188.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780497188.git.stefano.r@variscite.com>
References: <cover.1780497188.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_073743_692990_C5FF8C05 
X-CRM114-Status: GOOD (  12.05  )
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

Add the GPIO pinctrl state and GPIO descriptors required for I2C1 bus
recovery on the VAR-SOM-MX8M-PLUS.

This allows the I2C controller to recover the bus if SDA or SCL are held
low by a device.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v2->v3:
 - 

 arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi
index 49467b48d0b0..61786eee0e82 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi
@@ -180,8 +180,11 @@ led@1 {
 
 &i2c1 {
 	clock-frequency = <400000>;
-	pinctrl-names = "default";
+	pinctrl-names = "default", "gpio";
 	pinctrl-0 = <&pinctrl_i2c1>;
+	pinctrl-1 = <&pinctrl_i2c1_gpio>;
+	scl-gpios = <&gpio2 6 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	sda-gpios = <&gpio2 7 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 	status = "okay";
 
 	pmic@25 {
@@ -415,6 +418,13 @@ MX8MP_IOMUXC_SD1_DATA5__I2C1_SDA				0x400001c2
 		>;
 	};
 
+	pinctrl_i2c1_gpio: i2c1gpiogrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD1_DATA4__GPIO2_IO06				0x1c2
+			MX8MP_IOMUXC_SD1_DATA5__GPIO2_IO07				0x1c2
+		>;
+	};
+
 	pinctrl_pmic: pmicgrp {
 		fsl,pins = <
 			MX8MP_IOMUXC_SPDIF_RX__GPIO5_IO04				0x1c0
-- 
2.47.3


