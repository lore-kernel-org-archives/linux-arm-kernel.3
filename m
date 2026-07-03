Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4CC3C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 15:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QGZm4+XMD1ngU96wT2Oojs/SHdS870fkpgs5aUT2QU0=; b=u/q/snf1B/v8jv/sR76HJagOKo
	E7uqA2SMjB4H5MC5UMvHMPWTLrEDhhiAb39xe/BcIBLiPYay/aFF14+l0ZO87nbHoT6SR5JxVuF9c
	2Qswsn/4XBV86u9XUd6daoObfBHAnEKJcTErw/dfJL5aY3srjUQAIoKzz7gLbofLvSXjXCLhPdEtc
	IikUGxdkg4UFxg1+VKD+a6dpYJscCcDyYbDttA82DxL3xc96NlBinRzyVVImFXGodpQg81MdetnPf
	aiEd9gZT1SL4Z9ofWjrpGkkCAbJQcVmIPSsV5TgTbPmhpC99X114YwCqPUU4mClHGrVWi+X/zyYeq
	1ZfJGdOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wffnq-00000007P1t-2aEP;
	Fri, 03 Jul 2026 15:27:42 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wffno-00000007P1X-1OAs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 15:27:41 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-47362928f65so677628f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Jul 2026 08:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783092458; x=1783697258; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QGZm4+XMD1ngU96wT2Oojs/SHdS870fkpgs5aUT2QU0=;
        b=SB/Eaz7kcm41psaA09sfxJSNmJQJMXB8pOuPeMrN8vtxxGqVn4lzjGZnri/tTHeA/G
         tHZsg160EO+8p829yW5qbE9MWcGprCk1y3eeDRUI03av+Rg4fxpxLNcolaq9eDWW8BsN
         cwYuHjx/88aR1BW2RdzcZmSbbmtKbW/sqRFF70C0X9TkxtLiumJUgee9e1rcQzaYB3VG
         cGc5V+bCyokL/Jz5DFr1uzgbpn8Wcp3nNmZrmxlf01DEYkaC4BCKWWAlkLJIcqbmJkIR
         9itFW/005hiael+/R0XABb5KuQRHdNqcWUMkZ2mQSxhMTYhmoYCvbzEvOqe5ncYEWZy6
         D/bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783092458; x=1783697258;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QGZm4+XMD1ngU96wT2Oojs/SHdS870fkpgs5aUT2QU0=;
        b=LdvYmNW3c8RIOBOYOJ8ZuNupRhESlbWK6B2MO6SkOZpbOQRbuV0geMffJLxd9knB1z
         VqNULAJJ4+kknuNUa1YX3mnpqaXa3JdzcPETbw5vuK4huBRmVzhI32EuDFGuMrh/UeBW
         sLfvahjAEUfygy+hzIGg2KElukp/YHgSLW/ERp6VvoB44w6VRMRDgvbQ4EfwbDS6yyyP
         ZQpQg7zG8O0b0ptMN6Mebyi6ibnHjOVg9akqJRTTTgd74dZhtLFk33L4s2GduMRRMKGD
         pnr3AGAagjl2YKrJGTi4IG5LmlHjxifRsFvA1/YAPhpaz0PYAQIrByq5EiJUPbrnlAZc
         R5FA==
X-Forwarded-Encrypted: i=1; AHgh+Romz8QAed3cW5mtPi5SlN2an1Rs0zDR6J27dRIPe1Hp/xq4Tz2yrrQl5z9dh46mm8nEpBKXYftLtJp78/gMxX5j@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+chEN6vAWQmEQufdvbW3PY3yiHdNl3e+YRzTpf2YMfq4Cz8DK
	VkXIPOJaAWWsaLE8LxhMrDBFpDvLgDjj9P2XE8R4I9YKuvR8vGwH0HF+XaA7cg==
X-Gm-Gg: AfdE7cn/BJ6L/n3VucAE5ffrpcZg6UcyOrpcf+Dc0sO+BrFQ1VYAIbKCK7rwcqZBtnd
	1kjZVfeJWuHDEee9WnHIW1BsGV7okZb3niCPsiu0xpX5837GOuZRKmBiXYYMDlcig7rGohRzqaX
	6yfeAzeva9nh2s3MHTkzBqpkRxzYWT8tSD0gwtFT38fY0USCZ9PfsIxFdimJCmPbr1x0CDVLuPx
	MKSvFV///N2zdn6KVruJy7VkMJI20fHALr8G+HtC8UDKcD30KqGwX0y36CfCDxFSAwV5w2/Kz7M
	SpN/4x2ePAROTyBSjaUtCQ5ihPcQFkAxy8gXMp/wVTavJWlXM0kSUJnckTv7Vql84TFXMwCtFbH
	sLAvxa30YWtQpcLsjpzAwhUwQT7/aHue/uF80jPoVAweRgb3P5WCLRwmonL/fx2NPcTc8zRin1H
	YfHxcIE/IHfpl4V1n7ZxKqDvfRWBzlT1jpbt4xFiyYpjLw0rh5qZduEUkbylX0aq0Yy+z62N4gr
	wKLurLa6umzmMY6AgYVUK/fXBA=
X-Received: by 2002:a05:6000:52:b0:46f:f12b:e44b with SMTP id ffacd0b85a97d-4775be03161mr11748719f8f.31.1783092458177;
        Fri, 03 Jul 2026 08:27:38 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.vodafonedsl.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0960b06sm85460f8f.28.2026.07.03.08.27.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 08:27:37 -0700 (PDT)
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
Subject: [PATCH v1 1/1] arm64: dts: freescale: imx9-var-dart-sonata: fix Ethernet PHY configuration
Date: Fri,  3 Jul 2026 17:27:31 +0200
Message-ID: <20260703152731.236793-1-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_082740_416613_B068FCD5 
X-CRM114-Status: GOOD (  11.89  )
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

Fix the Ethernet PHY description on the DART-MX9 Sonata boards.

The GPIO previously described as the PHY reset line is actually a
board-level enable signal required by the PHY. Model it accordingly and
remove the incorrect reset GPIO description from the PHY nodes.

On i.MX91 and i.MX93 the signal is described as a fixed regulator,
whereas the existing regulator description on i.MX95 is reused.

Keeping the PHY enable asserted during boot ensures that Ethernet
initialization completes successfully.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 .../boot/dts/freescale/imx91-var-dart-sonata.dts   | 14 +++++++++++---
 .../boot/dts/freescale/imx93-var-dart-sonata.dts   | 14 +++++++++++---
 .../boot/dts/freescale/imx95-var-dart-sonata.dts   |  3 ---
 3 files changed, 22 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx91-var-dart-sonata.dts b/arch/arm64/boot/dts/freescale/imx91-var-dart-sonata.dts
index 3f0fd321d95f..f7e32f9375f5 100644
--- a/arch/arm64/boot/dts/freescale/imx91-var-dart-sonata.dts
+++ b/arch/arm64/boot/dts/freescale/imx91-var-dart-sonata.dts
@@ -97,6 +97,17 @@ reg_rgb_sel: regulator-rgb-enable {
 		enable-active-high;
 	};
 
+	reg_phy1_supply: regulator-phy1 {
+		compatible = "regulator-fixed";
+		regulator-name = "SUPPLY_PHY1";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&pca6408_2 0 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		startup-delay-us = <10000>;
+		regulator-always-on;
+	};
+
 	reg_usdhc2_vmmc: regulator-vmmc-usdhc2 {
 		compatible = "regulator-fixed";
 		pinctrl-names = "default";
@@ -139,9 +150,6 @@ mdio {
 		ethphy1: ethernet-phy@1 {
 			compatible = "ethernet-phy-ieee802.3-c22";
 			reg = <1>;
-			reset-gpios = <&pca6408_2 0 GPIO_ACTIVE_LOW>;
-			reset-assert-us = <15000>;
-			reset-deassert-us = <100000>;
 
 			leds {
 				#address-cells = <1>;
diff --git a/arch/arm64/boot/dts/freescale/imx93-var-dart-sonata.dts b/arch/arm64/boot/dts/freescale/imx93-var-dart-sonata.dts
index 5513d3b148a2..1ca3ec8330d0 100644
--- a/arch/arm64/boot/dts/freescale/imx93-var-dart-sonata.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-var-dart-sonata.dts
@@ -103,6 +103,17 @@ reg_vref_1v8: regulator-adc-vref {
 		regulator-min-microvolt = <1800000>;
 	};
 
+	reg_phy1_supply: regulator-phy1 {
+		compatible = "regulator-fixed";
+		regulator-name = "SUPPLY_PHY1";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&pca6408_2 0 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		startup-delay-us = <10000>;
+		regulator-always-on;
+	};
+
 	reg_usdhc2_vmmc: regulator-vmmc-usdhc2 {
 		compatible = "regulator-fixed";
 		regulator-name = "VDD_SD2_3V3";
@@ -180,9 +191,6 @@ mdio {
 		ethphy1: ethernet-phy@1 {
 			compatible = "ethernet-phy-ieee802.3-c22";
 			reg = <1>;
-			reset-assert-us = <15000>;
-			reset-deassert-us = <100000>;
-			reset-gpios = <&pca6408_2 0 GPIO_ACTIVE_LOW>;
 
 			leds {
 				#address-cells = <1>;
diff --git a/arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dts b/arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dts
index 7a58ad38ffb4..ccf7e77016e4 100644
--- a/arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dts
@@ -346,9 +346,6 @@ &netc_emdio {
 	ethphy1: ethernet-phy@1 {
 		compatible = "ethernet-phy-ieee802.3-c22";
 		reg = <1>;
-		reset-gpios = <&pca6408_2 0 GPIO_ACTIVE_LOW>;
-		reset-assert-us = <10000>;
-		reset-deassert-us = <100000>;
 
 		leds {
 			#address-cells = <1>;
-- 
2.47.3


