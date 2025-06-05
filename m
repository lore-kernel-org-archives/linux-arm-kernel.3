Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BBABC5B543
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Jun 2025 09:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ogjVDhDiMnU/s3WI4h7hVLm4gcfXJF8zSM1Pe2+EESo=; b=bfhNAtX8b74gbBfyPDlH973VcR
	92pLUL/fh8mC8mevzc4hc2x56Kj+3izfbpVO0Vx3tbLWLVp+wgWGm0t5+T8rdiL/UjXh8QrFqyeHV
	edUHPJlFhbIpQFW3w39eGHVPP8Qbrg0Xw/AUMoK1qma/j7J2NYqjaESAE5pi3j2FVhk7zdl0RHDou
	51berMCzJ8Eb5hOzChHGNHCSUIZan69+0JdCh+QWvipof3QYtTSA6wqBigExQsrotD22mUePtBNqI
	QWUL6QJ9Qlo0QvjoAIuG77voP3+3uDShUWaFuq5PdFTkmxcDvbD6oLaZcyzqzfx/T19DabUZqQUZQ
	8HxOFxyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN6U6-0000000F7Yr-1GdD;
	Thu, 05 Jun 2025 09:02:02 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN6Rr-0000000F7Hk-1cg6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Jun 2025 08:59:44 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-3a52874d593so560058f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Jun 2025 01:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749113981; x=1749718781; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ogjVDhDiMnU/s3WI4h7hVLm4gcfXJF8zSM1Pe2+EESo=;
        b=bKYLGFTS3+2XNMQYua3YhXPgqALj8amEaabbwoXQsWv842HtVlIvZjJwW5pK8Yxv1z
         CeNrUVApxeqr9995cU+oW5nUjnbohn3bH0UZXtI9alAzv/4g8LDWDXsIln/STodpQQ42
         n5UgxbTde1OiPreLRglfqL7M8BkB9WbUp9mBMchQFLXkF2h0kEC8GoC5tBCFh58ZVD4f
         5HlgSxBU92A3si18n9ECT+R1Y3x0VwTKBEBImbAgRpcJ79/BApkigahK6zhRVE32jqjX
         Oaf4OPN2BH2wc1erHXWFKicDl+mU9M/Tlv/AWr6pR3YxIW0zwsxZFHC4SvBFlvVztHIP
         mXJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749113981; x=1749718781;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ogjVDhDiMnU/s3WI4h7hVLm4gcfXJF8zSM1Pe2+EESo=;
        b=JVd8RIzhTloi6GYqm+khs8+KTmqK8PonZSz1XRb3MGZmohqxL0gZaxMOFDhBSj86Mw
         XpC0Mo3+fTs0DhepJrFrxCfNAsG/j/6fa98/kClnOBJkoqQP2rqub84eObCIE6CwsKvR
         N2OJ8tLyNZNhC/iUP6QMDQAw4hg/9Mbfi89q5K4XPhHzBc/rEIe7tu/gZnskhvy/5rnB
         t80HyGthvl+tBL6dOTGzoji93OStupn7+g832nUyCqIB5R7YW7Jt4tNgOmHFVhvQeKgb
         UFxt68ls7uvJ1KISGs9714EDK9lKrYyvDqqw5eFUfPsIFPYEkTifdqwilL+ph8+KeyvL
         qXsA==
X-Forwarded-Encrypted: i=1; AJvYcCW26SjxFoxt9O90Cw4h+BVaUyiIMH81eHyVyLwi03NHVi3Dm9mMkSFrbGbVmCuUQ5MRDwb4P+o9/QV8gqrUiJI1@lists.infradead.org
X-Gm-Message-State: AOJu0Yy50CrkjcdQntAQNvkf+w9+HM/G/1RRPtQfklOMsQHDz3BUWTky
	B0/w2E7cZP4Fw2pJD6gYr97gg0uNJJPNj1p9IQLAXfhcxZ6rg5r/YG4k
X-Gm-Gg: ASbGncvTTx//MXgBKjy/q2HGWP9iY7dAyv+EyCkQ4dgpsUm+wbL90LeCZ0a/IHdi+XE
	64jXfyWT+DY96cIldt6nn+hTaCDI0nBFWCCkdgE5cBE26K/85vpLYlbeB5lQZK6kNd42VRodqNi
	5onpSMpdU1WsTHdCM4T2jTKQJ8a0nCt201TwNOhcHKpf9w2WBZzxU6ykpbvzvmTHkk5Hy73i9HK
	0264pNIx7udtUOPnZLUclMG2njFFOPndEv/9lZripV+piTXWB5I8Cg051Zv1WvHPFNoQyHtFKSm
	CWQAl4ACl8hufmGTWRFyVSeOHRSIBMsypY+Iu4Gr5cBjXTdrKSz4UXRzkhPIfQfIZl5TgTymAr3
	7AD/Ywi/4k73HmSe3R52cnxfY7P7Z+U4rLG0=
X-Google-Smtp-Source: AGHT+IEzo/+1PtqXUJzfqQ4rzJBMvCxovxZsMpL2szL116m7MitSuowtYBLWA/qIIb6W6jeKzOII8w==
X-Received: by 2002:adf:edc3:0:b0:3a5:2465:c0a4 with SMTP id ffacd0b85a97d-3a52465c359mr3054884f8f.20.1749113981006;
        Thu, 05 Jun 2025 01:59:41 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-70-53-177.cust.vodafonedsl.it. [93.70.53.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4f00a00d4sm24281167f8f.92.2025.06.05.01.59.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 01:59:40 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: othacehe@gnu.org,
	andrew@lunn.ch,
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
Subject: [PATCH v3] arm64: dts: freescale: imx93-var-som: update eqos support for MaxLinear PHY
Date: Thu,  5 Jun 2025 10:59:04 +0200
Message-ID: <20250605085904.12199-1-stefano.radaelli21@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_015943_430120_55794916 
X-CRM114-Status: GOOD (  17.17  )
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
ADIN1300BCPZ to the MaxLinear MXL86110, as documented in the
August 2023 revision changelog.
Link: https://variwiki.com/index.php?title=VAR-SOM-MX93_rev_changelog

Update the device tree accordingly:
- Drop the regulator node used to power the previously PHY.
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
v3:
  - Add "PATCH" to subject line.
  - Fix wrong reference to previous PHY in commit message.

v2: https://lore.kernel.org/imx/20250604153510.55689-1-stefano.radaelli21@gmail.com/
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


