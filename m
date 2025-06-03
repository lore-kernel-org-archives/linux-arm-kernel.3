Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C058DC5AE59
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Jun 2025 22:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AasV4AhfzhQyQlDU4kMPcfNlkriRO1pkLB0grduEWyk=; b=VHpshOVBKeKwI2mUoCferrI/Sh
	vOYqVuMLY3fkrTeAV9VyQmBTDu4hf1+WkHtzLd0dR9fIIdwd2NdkEx9gxg4Qe4n7zq1Sv01GN9Oeo
	7Dk1D6JmWG/8NWQ/4IPvBUelAvv2PAFP31nTIHBpMd20RmZkidx1O7eowiAuEFbR7Cv5JbPa5JE2+
	bsXTQ9fsK0+s77tnk5Kvux/IDh7NBEp4HnVEaNKUpdX2a+UBXsmKTfTlcfZyuApk+Xkr6jYWup/mQ
	t8tNm8saU0NpRT+7BcOOo0xYsct+i2iA4FrHPCzgWEwAUc4FUir5su+Go9xd0dfddNpvNLP7fqF/I
	xcaG2i/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMZwH-0000000BwbQ-2c7q;
	Tue, 03 Jun 2025 22:16:57 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMZu8-0000000BwPK-15YJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Jun 2025 22:14:45 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-43ea40a6e98so68233695e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Jun 2025 15:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748988882; x=1749593682; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AasV4AhfzhQyQlDU4kMPcfNlkriRO1pkLB0grduEWyk=;
        b=VPopEwzAKjZVFk/9DN48Rn0FzuWB/Q5DgFGKihX2sfm1VWklGIdUff5aCf4WLZvqo9
         BOfnF5/N/3N3H/OCd2OZDTlldI88fQ4ZAy391pDbQfgd7wJZGu5IYkMXTKnDnCtQhXrA
         tZXDvOY04Fo5qTjzVxSr5Dh4+1sJ2U/Bia8ANHZO2WfXNVa9rgXLouTG+xs1JfiHUrMu
         NYUONeX5fTo5GU2DI4byI1M263Ase9ULV6WJpHhmeCtEM39HxdWAT9Z76R2Iuzv82jQO
         +2/7wYOR3POdLsRDSsBcl1BLLsk+iohMZ/FjE5Zr+QPGZngiLjtG05cNjnMeIw9zXwSQ
         ueBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748988882; x=1749593682;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AasV4AhfzhQyQlDU4kMPcfNlkriRO1pkLB0grduEWyk=;
        b=KbJwPKl1kCLI2IFAS2jkxJfNVaFwjnqH93vlXwTOPYZ5Nic32VaD0aQycKJpONjdAU
         fJG2MNcHueG+BAZXgs2NonnMnyAf06nLd7n7jBvQ2bACY2TUirXINdpgxoqmIYrSD9lI
         Ir3JDSQ3gHl5QjUbO1E2YxYZ6YVgNXKe42Jal1pElpFsSr7EtxaNNkByx05YmrZvk7E2
         3f299KIXCwfy9d8zE8JKojpAdQrf+LAB+d7QfSL9fymOQ9xlkcDaN1NaQ6P8XoJ4uBt2
         HzLkxg3oZ+6ApbO9RZSj1u0lb1Mb8U00QO8+q1/5p+hLpAlcwM5pNMz/aARg61PY6QuB
         KdNw==
X-Forwarded-Encrypted: i=1; AJvYcCUXHU8shoPGjpHG7Y+mKYCf9Jhd2f/K8WuRe5Y0X95WQ+ZkbCCqHYSS+ccMfRWb2FHqm5shEU4oQ+dYrUb2V7aH@lists.infradead.org
X-Gm-Message-State: AOJu0YzGNsQNW7mheIlvFC7KeIGVBjPPZKhNn2T/s+8ntAySFNoGt/Wp
	gkC09rLMgLo1wKy28xyBzgRRZyjtG+2Za0GSakVEG7xbGu2IOc2tP6iC
X-Gm-Gg: ASbGncu97gukMFxZaOzk9J59oKCViV2sDtejllpHDprZ9LAyvIfx4EYX0KHij9FwnQm
	krkEo0A2vdELjqFGk0YoOty9J01Qck7OUefqTMNLmpOzyhAx9fxLgAMoFZKTKYHRAJTssFZdj5O
	db9e5hRB/jH+MfjMoSSPVbu1PnILUOqjSFpPam2HSOB5x4+4UsTLV15+/z/FSfrhpvOO8/tNzWx
	CmIwX4K05E9BccAG/iAJwaGlWAbled18oK8TT7pq2Y9YCOp0ecitO4xv5S7eYrcMkXGB0CrK7JL
	aP6nStmwf3hUgPOimXlNn6bSZCioSBHxZ6pFDmmONCmiUT0T4SDqiCRvxbz7rELbjkxgFaCO2VO
	I4Z0mgHMJAhQ+lQuvGeYBEZvPqV9wZGZdZmFz0gXK85aV9zg=
X-Google-Smtp-Source: AGHT+IGQNvReqdBMLwSisULLtaJXvRqZHVZBjcgTB3FTflxOyIo48suFe1T2k8yCJFnJA8gYjQjHew==
X-Received: by 2002:a05:600c:1e89:b0:44b:eb56:1d45 with SMTP id 5b1f17b1804b1-451f0aa7ff9mr3002575e9.15.1748988881667;
        Tue, 03 Jun 2025 15:14:41 -0700 (PDT)
Received: from Lord-Beerus.tastitalia.local (net-93-70-53-177.cust.vodafonedsl.it. [93.70.53.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450d7f8f1c6sm179832435e9.8.2025.06.03.15.14.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 15:14:41 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: stefano.radaelli21@gmail.com,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [v1] arm64: dts: freescale: imx93-var-som: update eqos support for MaxLinear PHY
Date: Wed,  4 Jun 2025 00:14:15 +0200
Message-ID: <20250603221416.74523-1-stefano.radaelli21@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_151444_302777_40E92844 
X-CRM114-Status: GOOD (  15.48  )
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
 .../boot/dts/freescale/imx93-var-som.dtsi     | 40 ++++++++++++-------
 1 file changed, 25 insertions(+), 15 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx93-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx93-var-som.dtsi
index 783938245e4f..402a28d0ed8d 100644
--- a/arch/arm64/boot/dts/freescale/imx93-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93-var-som.dtsi
@@ -19,19 +19,6 @@ mmc_pwrseq: mmc-pwrseq {
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
@@ -39,6 +26,7 @@ &eqos {
 	pinctrl-0 = <&pinctrl_eqos>;
 	phy-mode = "rgmii";
 	phy-handle = <&ethphy0>;
+	snps,clk-csr = <5>;
 	status = "okay";
 
 	mdio {
@@ -51,6 +39,27 @@ ethphy0: ethernet-phy@0 {
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
@@ -75,14 +84,15 @@ MX93_PAD_ENET1_RD0__ENET_QOS_RGMII_RD0			0x57e
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


