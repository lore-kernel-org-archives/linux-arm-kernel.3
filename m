Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A2D2C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Jun 2025 15:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=po4hRDSGCZuh9pjG/L2z6feCTEmaDMC+4+ptAw6xPXg=; b=hNIsHO/SwknjjZf3zCmXL1XRNe
	zzi3wBk9X234oR5JhXwinbY44TkteeHr2jwaVpBcuKt1RxheyMp7AHhvQKRy6ktBx5RGma+N5ysns
	HHfNZ8oOEugDQeJMgFoztq/ukZZHfA+PQf3gX/g+E2JFBP5lR3ZTF3K0rK1+kuoxaipwC5lbAUO/X
	nPe0v1uZFIOrSidaXsNp4r4SuNVGStJgWJOg42gVCwTRXDctRRZvurTvQGa6WBOTsnskl5qp3fJp5
	bFI6ZSdCTfYXdtusxo6DeU0zej16yJLhS6AftIE/vRN6xPWSzU+d2fEhpLm4mwgdrXxHl2x8DFMg9
	/w48uqig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMqCc-0000000DiY0-13l8;
	Wed, 04 Jun 2025 15:38:54 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMqAV-0000000DiMr-2rOc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Jun 2025 15:36:45 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-442f4a3a4d6so298255e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Jun 2025 08:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749051402; x=1749656202; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=po4hRDSGCZuh9pjG/L2z6feCTEmaDMC+4+ptAw6xPXg=;
        b=ASwRMBR/zvDwOBfV9AQY8l7JDBRjLLq6gvQTQ+bc7c9k1xHixMXsI/kQd2BioU6m33
         yTzKmn1boIGVfd/2utaCFZ773JbHMH68ALX9SSMfWrFsdsxn7n/s6oMXB/LDbhO+KQrI
         LLtkwcO+m70p6EuRdQGAP8iR4Nuc8J+PGDowts5742TinJDwG5ToaGnKEZnztdoiOd1X
         CJaKxvGeFMs4UwgFdkbUMbpUOCMg+xQIOv/Rj0kuo32xhNfxgOzs7mpJSH4RjAM9IXQn
         rimAA5pe7N2GEokrPghXPhbe5nm+zmikOVZskDGJMufV9gRrTqu7XiCfdI86MyTLc/Sh
         270A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749051402; x=1749656202;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=po4hRDSGCZuh9pjG/L2z6feCTEmaDMC+4+ptAw6xPXg=;
        b=e16mNGWU11latK2SyFgdeNWc2ps0oA4ZPyO3RxUzsH59hmYeJBJSGgNz7BStDuoI99
         H66DPQ4oJ1CI++LKeCZKmFUMhp9XdLLH/N8Ks9J0PLUDfO3liRUyDz++gNq3MqcqTv4P
         rwFwXFjBWDbTCaIzN6YpniayHRa8cO407IpiEry8rc/VoBZtUMtA+7VtAJdsJM2QA6/Y
         yTTn7H5Hoi4qJa/Wkfy3jWpeHSKl747bwnjOF3oSONe//7NYExqYKi4yd4kXf4+gc0nw
         TREZs/iAjzNca7kaOGHrUata+NLPnyh+bi7z0htRmZTo+alvPbchbVFD6V9Z63QEta2l
         Zryg==
X-Forwarded-Encrypted: i=1; AJvYcCXX2c6muJmdao9UCEFixJOS8PbEcX7rKTJH1GnAG8Z55ZG8o437Hr4WI8nvquLb8oGlFyy/B+3xf6hIkWQJ969Q@lists.infradead.org
X-Gm-Message-State: AOJu0YxJ/RusLdPom/qRWgNuK9J1KFNQ0rpdBymlK5zPLOCCNiwLxoRl
	z77HmVLQPIKcQifw3DqPVmQh79ohW8UUOIvyV2Q6wtkE2B2vfPKzikxq
X-Gm-Gg: ASbGnctdUZA45RkL49Y+HPULb4GbfupRDXGHY2PDJS8HZwugB9z5592SrcvZUnORGjT
	7JTS1OgycPVuB5lilLB6zRoKlZGTH+sfTnyYO+32yIo4pN8tmodD2E3Mm0fCVKzKudITEpTLwTU
	zkzXKEt2JspOSUBpqvzfkLEr+jFdo2N/487miLFj+LtktPBXvmd6boEKfy+D3TBEMCa5DVz9aL5
	4pgbbhJ4pdGVnJ5uMKRwgrwNkm/6nmYX/aBRQVeUGTq8A17ohhoPiC3D7T2f9Ais+xvwmoaoZ/y
	ZSOHPg0n8kUSN05IQBZgKSoyKzDPG/Gg9MH3d82NHOZK11+w0OCArvs1Mh4DxICJyQDJ1qwRFdF
	yszg/Pz4Qkfw1Q1LD442iX3QRTgHyKcW6FTWKPT+Yh//zQw==
X-Google-Smtp-Source: AGHT+IEiuiACGB5AsupJRC8pwPtzuBvDCDBA2W8wfZMmUi90dxJ20Ue6vRcyhVvfN7K/S5TF5w2O8g==
X-Received: by 2002:a05:600c:8b26:b0:43b:c6a7:ac60 with SMTP id 5b1f17b1804b1-451efe946acmr30208025e9.10.1749051401531;
        Wed, 04 Jun 2025 08:36:41 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-70-53-177.cust.vodafonedsl.it. [93.70.53.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450d8012b09sm200711165e9.37.2025.06.04.08.36.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 08:36:41 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: othacehe@gnu.org,
	Stefano Radaelli <stefano.radaelli21@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [v2] arm64: dts: freescale: imx93-var-som: update eqos support for MaxLinear PHY
Date: Wed,  4 Jun 2025 17:35:09 +0200
Message-ID: <20250604153510.55689-1-stefano.radaelli21@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_083643_721133_CAC0E820 
X-CRM114-Status: GOOD (  16.55  )
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

Variscite has updated the Ethernet PHY on the VAR-SOM-MX93 from the
Murata CYW43353 to the MaxLinear MXL86110, as documented in the
August 2023 revision changelog.
Link: https://variwiki.com/index.php?title=VAR-SOM-MX93_rev_changelog

Update the device tree accordingly:
- Drop the unused regulator node previously used to power the Murata PHY.
- Add support for the reset line using GPIO1_IO07 with proper timings.
- Configure the PHY LEDs via the LED subsystem under /sys/class/leds/,
  leveraging the support implemented in the mxl86110 PHY driver
  (drivers/net/phy/mxl-86110.c).
  Two LEDs are defined to match the LED configuration on the Variscite
  VAR-SOM Carrier Boards:
    * LED@0: Yellow, netdev trigger.
    * LED@1: Green, netdev trigger.
- Adjust the RGMII clock pad control settings to match the updated PHY
  requirements.

These changes ensure proper PHY initialization and LED status indication
for the new MaxLinear MXL86110, improving board compatibility with the
latest hardware revision.

Signed-off-by: Stefano Radaelli <stefano.radaelli21@gmail.com>
---
v2:
  - Clarified the use of 'rgmii' mode by adding a comment in the DT,
    explaining that hardware delays are already implemented on the SOM PCB.

v1: https://lore.kernel.org/imx/20250603221416.74523-1-stefano.radaelli21@gmail.com/

 .../boot/dts/freescale/imx93-var-som.dtsi     | 45 ++++++++++++-------
 1 file changed, 30 insertions(+), 15 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx93-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx93-var-som.dtsi
index 783938245e4f..cea8d792328c 100644
--- a/arch/arm64/boot/dts/freescale/imx93-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93-var-som.dtsi
@@ -19,26 +19,19 @@ mmc_pwrseq: mmc-pwrseq {
 		reset-gpios = <&gpio4 14 GPIO_ACTIVE_LOW>,	/* WIFI_RESET */
 			      <&gpio3 7 GPIO_ACTIVE_LOW>;	/* WIFI_PWR_EN */
 	};
-
-	reg_eqos_phy: regulator-eqos-phy {
-		compatible = "regulator-fixed";
-		pinctrl-names = "default";
-		pinctrl-0 = <&pinctrl_reg_eqos_phy>;
-		regulator-name = "eth_phy_pwr";
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-		gpio = <&gpio1 7 GPIO_ACTIVE_HIGH>;
-		enable-active-high;
-		startup-delay-us = <100000>;
-		regulator-always-on;
-	};
 };
 
 &eqos {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_eqos>;
+	/*
+	 * The required RGMII TX and RX 2ns delays are implemented directly
+	 * in hardware via passive delay elements on the SOM PCB.
+	 * No delay configuration is needed in software via PHY driver.
+	 */
 	phy-mode = "rgmii";
 	phy-handle = <&ethphy0>;
+	snps,clk-csr = <5>;
 	status = "okay";
 
 	mdio {
@@ -51,6 +44,27 @@ ethphy0: ethernet-phy@0 {
 			compatible = "ethernet-phy-ieee802.3-c22";
 			reg = <0>;
 			eee-broken-1000t;
+			reset-gpios = <&gpio1 7 GPIO_ACTIVE_LOW>;
+			reset-assert-us = <10000>;
+			reset-deassert-us = <100000>;
+			leds {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				led@0 {
+					reg = <0>;
+					color = <LED_COLOR_ID_YELLOW>;
+					function = LED_FUNCTION_LAN;
+					linux,default-trigger = "netdev";
+				};
+
+				led@1 {
+					reg = <1>;
+					color = <LED_COLOR_ID_GREEN>;
+					function = LED_FUNCTION_LAN;
+					linux,default-trigger = "netdev";
+				};
+			};
 		};
 	};
 };
@@ -75,14 +89,15 @@ MX93_PAD_ENET1_RD0__ENET_QOS_RGMII_RD0			0x57e
 			MX93_PAD_ENET1_RD1__ENET_QOS_RGMII_RD1			0x57e
 			MX93_PAD_ENET1_RD2__ENET_QOS_RGMII_RD2			0x57e
 			MX93_PAD_ENET1_RD3__ENET_QOS_RGMII_RD3			0x57e
-			MX93_PAD_ENET1_RXC__CCM_ENET_QOS_CLOCK_GENERATE_RX_CLK	0x5fe
+			MX93_PAD_ENET1_RXC__CCM_ENET_QOS_CLOCK_GENERATE_RX_CLK	0x58e
 			MX93_PAD_ENET1_RX_CTL__ENET_QOS_RGMII_RX_CTL		0x57e
 			MX93_PAD_ENET1_TD0__ENET_QOS_RGMII_TD0			0x57e
 			MX93_PAD_ENET1_TD1__ENET_QOS_RGMII_TD1			0x57e
 			MX93_PAD_ENET1_TD2__ENET_QOS_RGMII_TD2			0x57e
 			MX93_PAD_ENET1_TD3__ENET_QOS_RGMII_TD3			0x57e
-			MX93_PAD_ENET1_TXC__CCM_ENET_QOS_CLOCK_GENERATE_TX_CLK	0x5fe
+			MX93_PAD_ENET1_TXC__CCM_ENET_QOS_CLOCK_GENERATE_TX_CLK	0x58e
 			MX93_PAD_ENET1_TX_CTL__ENET_QOS_RGMII_TX_CTL		0x57e
+			MX93_PAD_UART2_TXD__GPIO1_IO07				0x51e
 		>;
 	};
 

base-commit: a9dfb7db96f7bc1f30feae673aab7fdbfbc94e9c
prerequisite-patch-id: 2335ebcc90360b008c840e7edf7e34a595880edf
-- 
2.43.0


