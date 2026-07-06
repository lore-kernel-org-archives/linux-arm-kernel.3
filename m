Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09D41C43602
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 09:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wcLdsxNIFOZhQkIiIBWMcl6LlY0cWDmbztEcoRQjzXg=; b=KMgA9JapMzl0nfRuOq6cvmFo+3
	8g/WPP/0f7/LnRO+ocDV7qO2595MXQl7gwUFcjFMg/XBopjXpiHSnVMLQn4r2GGXoRkqGlQWRaZlC
	D3aOoz8m3kDp6/DshZosu9UFX0HIMrCACFLPLqYAZLk1LX2VCjFx4M95EgjlLpW+LUzHGTCoDUSZu
	SluEmDr2W9PMYteeOroAXCNw+3BWj9MHv/mBENZP+JlsyQvw/GCacDyZcqI7lreMnpUNiOa7RDEyg
	vURvWetVWtqd9jHPh7MQZeqOF5Do2+AugCjiqQAs21ZG20gf+f+wfdjqJKVyVo76PzgrjmUP793fI
	Ujjb9ZsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgfjC-0000000C3DM-3PnY;
	Mon, 06 Jul 2026 09:35:02 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgfj7-0000000C36p-0ji1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 09:34:58 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-493c5220cb7so21244375e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 02:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783330495; x=1783935295; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wcLdsxNIFOZhQkIiIBWMcl6LlY0cWDmbztEcoRQjzXg=;
        b=ju1kuWO99RV+bZlD14deke4Kj0I/SDToXHtqtQRzn0mwQ6BUGXqOqpZffEvyVe3Ta+
         E8dntNBYoljPYeDv7topWN9+CEDsJr1Tqz0EHahJk77tZyoYDrr58exOlEs/g9g+EC2q
         K3i76IxZMRc8AiNTJw9d+Vk5nBKuXiSXipMKxUCJXjS7PwT0fGBoHXv1yR9BRPI8zM8i
         UfPrM6a6E79s1/eiZpO+5Xko6PO7oGic7T6jKLbVR4xMbrGQ8iTPHC/zjc7ZjfWRPQVx
         fPAZTgU3I6tsKuk50T30WAz9PE32Sniv4700wyY4HIgxTivvETYR7l93N30f37s6BDU/
         bCqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783330495; x=1783935295;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wcLdsxNIFOZhQkIiIBWMcl6LlY0cWDmbztEcoRQjzXg=;
        b=pLwbr223ad8AN2E7PqtabbkC1bWfCcJwKu1EAFIjwl9DmW+0s7Paum/7PYf0LNpdnN
         dAhTB0q1i6DPt53AGa5MQPG/GuyB8vqGsLCG1XTLhMnTfjeXz/acUXj7lk3WZBuRDZ30
         g/7fkLGbnL4Pz/rMq/1OdrE3V8nzb9gY5uUqsxscmPXZZ8mG60IKtyL8nEwz1LPOtkJv
         2DWBCwY7vN2mtzUmQZ53xAyjb/i+xuShoFjRS+/r0u0w6IxYGbRcJtsaolHhq7OhU+BX
         mX4GphOjx8uuTR32B3SH3uXOb774gPL1aQGzPtN+PlCjJDfAWl59vM9r2EoYomHrkJ53
         jaKg==
X-Forwarded-Encrypted: i=1; AHgh+RoC10jdNs1h5isfJikvrOOX4hCFNHejsZv7tYIaS2tmgrHaZOjgEGXhzmFegNnJazknec1R4UBn4j3DgnhtObno@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9oSmA47ItAvJM7+h6MBRJ8B/YqebFk2uIiblGr5YE5gstCic3
	1RNwF4bTCXFl7lhGU10XTecuHoa9GKMRfQtGf7lYgXjfuVubzwIYXBeO
X-Gm-Gg: AfdE7ckI8mR3Io0x3plJToH2linRIQtAz6QXcUv4+N9lIbq6SlPqsvcF6fZUx9hrNGt
	xEcMhu1IvrfVZ7/NuP0T2f2FAYvtAi+Cg8DgGXQC+C+eDQ+1aLMFvcrkpg79Ru/ULs1zMqkKc9H
	95iHtUEVn1VvCRfebOk0Vir+ParpAMEje7SMJd309u6kZs0eJ1FbZ7CLwSkiDGvr+HbGWHLeLii
	bOZbZVeS69F6VBaz/nqgc3jIdNu/NZ6n1t0U50yb0RxU8kibgYtdcMkS/kcJV/CVM//ZPx2mtxu
	X26XK15v69Uq7b60g+TMx2Pdy9auEiklzc/WKH5BtgROHKvGt0EyK13CqO8Pj6YpxSIOOAp3/Sr
	G/EI3zgF7mKUPR9Kzo0bieAOewvqMe8gO+p+Kmz2byPxwQ1hNJlx+E/XhalfHuqBOHxGwyamxMQ
	rdykS2e41LQRGxGgi8wRRhqgWkJvAJbNVnAYw/P2oY/t191tVHsI4QRGx4I9h4QFYz6EtdvbkdB
	sr80T2eLWUsloP6DhlPGoSzpw==
X-Received: by 2002:a05:600c:a01:b0:493:bd2a:93bb with SMTP id 5b1f17b1804b1-493d11ced23mr113677845e9.3.1783330495380;
        Mon, 06 Jul 2026 02:34:55 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.dsl.teletu.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c6375764sm314379715e9.5.2026.07.06.02.34.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 02:34:54 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v2 04/15] arm64: dts: freescale: imx8mn-var-som: Update FEC support with MaxLinear PHY
Date: Mon,  6 Jul 2026 11:34:34 +0200
Message-ID: <8fdacc1d5c213685db8552460d04c44e515e85ea.1783330236.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783330236.git.stefano.r@variscite.com>
References: <cover.1783330236.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_023457_257674_83121EC9 
X-CRM114-Status: GOOD (  16.06  )
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

Update the FEC Ethernet controller on the i.MX8MN VAR-SOM to match the
latest SOM hardware revision using the integrated MaxLinear MXL86110 PHY.

Add the PHY VDDIO supply regulator and adjust reset timings.

The PHY LED signals originate on the SOM, but the actual LEDs are part
of the carrier implementation (RJ45 connector). Move the LED
configuration to the Symphony carrier device tree, matching the
evaluation board LED wiring.

Wake-on-LAN via magic packet is not supported at the VAR-SOM level and
is therefore not enabled in the SOM device tree nor in the official
evaluation carrier board configuration (symphony).
Designs requiring WoL support may enable it in their own carrier-specific
device trees if properly integrated at the hardware level.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v1->v2:
 - Fixed commit message

 .../dts/freescale/imx8mn-var-som-symphony.dts | 20 ++++++++++++++++++-
 .../boot/dts/freescale/imx8mn-var-som.dtsi    | 20 ++++++++++---------
 2 files changed, 30 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts
index 7308613a48b2..520aff23e587 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts
@@ -8,6 +8,7 @@
 
 /dts-v1/;
 
+#include <dt-bindings/leds/common.h>
 #include <dt-bindings/usb/pd.h>
 #include "imx8mn-var-som.dtsi"
 
@@ -74,7 +75,24 @@ reg_per_3v3: regulator-peripheral-3v3 {
 };
 
 &ethphy {
-	reset-gpios = <&pca9534 5 GPIO_ACTIVE_HIGH>;
+	leds {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		led@0 {
+			reg = <0>;
+			color = <LED_COLOR_ID_YELLOW>;
+			function = LED_FUNCTION_LAN;
+			linux,default-trigger = "netdev";
+		};
+
+		led@1 {
+			reg = <1>;
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_LAN;
+			linux,default-trigger = "netdev";
+		};
+	};
 };
 
 &i2c2 {
diff --git a/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi
index 71a2f0866822..09146ab76385 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi
@@ -35,6 +35,13 @@ reg_3v3_fixed: regulator-3v3-fixed {
 		regulator-max-microvolt = <3300000>;
 		regulator-always-on;
 	};
+
+	reg_phy_vddio: regulator-phy-vddio {
+		compatible = "regulator-fixed";
+		regulator-name = "vddio-1v8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+	};
 };
 
 &A53_0 {
@@ -96,24 +103,19 @@ &fec1 {
 	phy-mode = "rgmii";
 	phy-handle = <&ethphy>;
 	phy-supply = <&reg_eth_phy>;
-	fsl,magic-packet;
 	status = "okay";
 
 	mdio {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-		ethphy: ethernet-phy@4 { /* AR8033 or ADIN1300 */
+		ethphy: ethernet-phy@4 {
 			compatible = "ethernet-phy-ieee802.3-c22";
 			reg = <4>;
 			reset-gpios = <&gpio1 9 GPIO_ACTIVE_LOW>;
 			reset-assert-us = <10000>;
-			/*
-			 * Deassert delay:
-			 * ADIN1300 requires 5ms.
-			 * AR8033   requires 1ms.
-			 */
-			reset-deassert-us = <20000>;
+			reset-deassert-us = <100000>;
+			vddio-supply = <&reg_phy_vddio>;
 		};
 	};
 };
@@ -342,7 +344,7 @@ MX8MN_IOMUXC_ENET_TXC_ENET1_RGMII_TXC		0x1f
 			MX8MN_IOMUXC_ENET_RXC_ENET1_RGMII_RXC		0x91
 			MX8MN_IOMUXC_ENET_RX_CTL_ENET1_RGMII_RX_CTL	0x91
 			MX8MN_IOMUXC_ENET_TX_CTL_ENET1_RGMII_TX_CTL	0x1f
-			MX8MN_IOMUXC_GPIO1_IO09_GPIO1_IO9		0x159
+			MX8MN_IOMUXC_GPIO1_IO09_GPIO1_IO9		0x19
 		>;
 	};
 
-- 
2.47.3


