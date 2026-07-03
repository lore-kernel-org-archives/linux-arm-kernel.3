Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69B74C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 08:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fVUtoItzoPm0+8nMg3WUJmehJ16QEtEOKQagUMReJZE=; b=qV9eNvr4ioDxerRSil0os4iQhn
	kjMJtS2NMf6yBI8V8rXR1BjC7txA/TW/C+NqvTd6mPSuKtXZOzmHgafCYtE8/doAIpzcXLDhYv/AR
	AnhqnswhXOKWK+pv4PRnxVZVaioSFyjczdvcq7QySW902COvYg65ZtqMrWbahnKCQuHERyvEU9bez
	nDh6UM0qiSLT/VlQ8aubTa0GlMDyjC2h+yECnz04hszsGjvyiezudDyvQe3MO9vlhy2keAMvTDroD
	8MwZii/xC2SE0hFJX/NCEYjSZOT+lVg58yPTAKJ2cGjOiGjf1qKQ5HYlPfZTCnS1zis7fjkdHoWW1
	sefaaLug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfZXM-00000006O9m-475i;
	Fri, 03 Jul 2026 08:46:16 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfZXJ-00000006O60-3i49
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 08:46:15 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-493b779003fso1284445e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Jul 2026 01:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783068372; x=1783673172; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fVUtoItzoPm0+8nMg3WUJmehJ16QEtEOKQagUMReJZE=;
        b=mj35ajonrzk0jIbUW1peRAfQzxX5b/9flqDwPBaf8h9TGmQ0gyniL63RQ+sr8ue7hH
         Yx4qTyDaL+gac+neF0BgAz79+oMK14DJGvYOA19+RpDRsGROeupWYUwvTe3MRduotDYW
         e2CDVpYtYACK67Babii9dWtv0mFytAa+70veP3fLkY5P5/aqZq1eD3i+xfPRlVnBl2VT
         rwps1gjWLfusldBL5mme1f0mh52qP9jU2EZelqCasVW1Zt380/SXIi60Tf7BnD6+WVRI
         0Gz4W6r311k64n/MOG7Tt7zIXd1yMoxHeSjZsLhXgUu6Uvdc1Wr6NqVhZf1lWN0mQj1v
         6W8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783068372; x=1783673172;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fVUtoItzoPm0+8nMg3WUJmehJ16QEtEOKQagUMReJZE=;
        b=YMAotFfaeJgru8KX+oBEewsVOhI4GCiHQr5LH0sQG1lKtYr7UPeDIYKlO1TRlFpDPe
         BMOVpVJ28MnK/v8BgUxVIB0NctEnszvWH+eme/i+hJDxxsgW8G5oTLfceTEqoUD+ockG
         NKWjMFe2dkXo2PPlX8pLhDps6ZDLGKloD9zOHGCLBPvGqMAeHlJtGgg1zubwaZ543gKe
         tHpwhpmlhkGtokRdmYFw7JOq84CkCdy76k4rB/bcyWjl3nk3ms82XB22Lap6mDM4AMkf
         QDlC3HWCCbU/FEYyiKd1eE/bXS2/v98ZbjCxHIdeAlU+njRfzv1bx2voKHQJwAhFmzsP
         I/Nw==
X-Forwarded-Encrypted: i=1; AFNElJ9GYun9+lMzL4v76bAqbwiRk4R5WJR2T5+sa/1OYxCJR7gDKCR+jwbf3WmcGC0YBJi+NNPU26LCiPnwJH53oC+j@lists.infradead.org
X-Gm-Message-State: AOJu0YzlJzNuZdAvesloX0aTXsW23PJNlHSmq8IegGvA5+vShLK8BpL/
	vhuhia+I4vzSYcfURQ1mXdBDjRG4PSqnoPJEuSK+8JVHf+r/PCSeaUEl
X-Gm-Gg: AfdE7clFZkksR9OQX2zsah68PaRdLRpDBHhVnRoMq871eT7AsCj0/gAmIh536QjgwmI
	C2qo9FBjOFMMJJNHbsRjDtz71ODEMJtKKFfEc07TQwysRYYoOl6T5iD1jxZuRVez8oP9aCpzc6x
	aDfY90qLMrwtjRXY0WzBDD3Nn3Rb9iNLp83tll4E0iGS6SAN9q3lxhnjwkdWAlsBTp5xBH3XPFR
	EYD3IeEw0SJsM0aLYPKsc+Qfo/YRDPBZL+YUBV0pbAQUu9QqqA/jOZqpda222GehmPCQq77LZob
	iucTCkaJGijBgUU96Uxozzedk3Ug87b81r+px+BtLz+N6xKckBU1NvTkQbKI1iPGLWDJiFSQNFP
	beCcSCuuLNmI/jZwXKjCiKSEJrrobdZLKVIOMjPOTBDI4ineuJsx8xWyNvpv5+yJfiw08UOd8G3
	twjZsAKf4KD7TzXVBlTcX2FF0dKGKtmWMk6s2bxNovOYojChwThKbJGpTbtVlo619jQ5RF3dZTJ
	qWbefD5hKZMb25i7ZiIpRRMUg==
X-Received: by 2002:a05:600c:c118:b0:492:62d9:4e57 with SMTP id 5b1f17b1804b1-493c2b382c2mr105386325e9.2.1783068371937;
        Fri, 03 Jul 2026 01:46:11 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.dsl.teletu.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493cfb6f199sm6335505e9.3.2026.07.03.01.46.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 01:46:11 -0700 (PDT)
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
Subject: [PATCH v1 04/15] arm64: dts: freescale: imx8mn-var-som: Update FEC support with MaxLinear PHY
Date: Fri,  3 Jul 2026 10:45:51 +0200
Message-ID: <bd2a524c39372518dcdf128220f3bb210afa290b.1783067947.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783067947.git.stefano.r@variscite.com>
References: <cover.1783067947.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_014613_951986_D5F2F242 
X-CRM114-Status: GOOD (  15.79  )
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

Add the PHY VDDIO supply regulator, adjust reset timings and add a
pinctrl sleep state for low-power operation.

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


