Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DB0CC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 11:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=loNjfzD7XzJZlNyz06pFRAe4/by1nmcVqFTo0T/668M=; b=lwGhqqrbXXvvcYU+86jw7XdtD8
	zAR5wR1tOdHqLxjXcZtRTQm+4N+44iNgIe7I3eJ4SPny9eeQvNCtu184UrFFFUmh7QZ3k5LiZE0u/
	puUDecnCIc2unq0gDVS5mziQbEMDnMwHQf5qFdaXTDkmFzuRgV20DnjNrFYTUPLl19dA1Spl9cr8S
	IxM5afovgDqi2zd/nsrcPMhnWNLbtkkeYainx2x1PvtDsF5Kcq5W1zN6JQcKXn0EQb74/8ES/K3IV
	NEy1bkihy53+23yqX4cuUp8cjssznXF3LG3bfzBa6SjqzEs+HIubziUsXLT5yBIn6iFrFpnkkTGEj
	yS5cFhvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7C4J-000000070FC-3RiL;
	Tue, 22 Apr 2025 11:45:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7BJL-00000006qlq-3KDb
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 22 Apr 2025 10:57:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=loNjfzD7XzJZlNyz06pFRAe4/by1nmcVqFTo0T/668M=; b=fMUat5mj48gmIHru1wmUe6UD2f
	jzXFFiTWdbti7SYXhO++YUNrpH0GrgI2MqcKlsJyw9RQsO2fZp5UYcuklPI+iQk0GgPWQPjsqj94L
	1eQg4h8BKoa6htb5glVqm9UYT5n6HFMMxu2cmuvn8JHLOmVsneg53RB5HApYZfKnOOY/thysRJu52
	WnUvKeHSwRngIHwCgcE6v8TOqApTR7Z6sIqm0l8yq2r8LwsFWqgxGJYivxDvT6lABDbNKYJXTLhO+
	M0CjCFnvbRML1eOQ5e+Y5g4+oamWuNo80KO+ltZw2PlYjwNBYcNpEVwLTZ4aN9W4K4XxkvM0FMLbs
	c30nemXg==;
Received: from cpanel.siel.si ([46.19.9.99])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u7BJH-0000000BBMg-0wPJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 10:57:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=loNjfzD7XzJZlNyz06pFRAe4/by1nmcVqFTo0T/668M=; b=EiBjB8yyvkjbKlfy0T/WxsBpVH
	P2fFIMONF6CER2gN2XsSPgmmsbSiEHzHA6/L2yH3Fzec93SSnctR0UKZxQEMXHKnbSv8jhHbgm3i/
	khlUertmOOcxMSGWcUlsu+mqPhcwnLnl106BMSJqhn7FcdAReNRgss9qXclKZ2TQijQ13hy5QNR4c
	/hUz1pOFslQFzkZ3DqWxRgQPZs/hqvuufI9i5SCT8jSp5WFrsJM/FYuzV+Nsp5Fa9AzAjutaPknbl
	LinYcJgq2bOqtjiQiE0RWO1wg4Gdesg+dhSHokdKbjDPfX4nXB/Uur/kawBP07wCTidEe3nIfvPKZ
	pFyWATOA==;
Received: from [89.212.21.243] (port=36562 helo=localhost.localdomain)
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <primoz.fiser@norik.com>)
	id 1u7BIz-008kyr-25;
	Tue, 22 Apr 2025 12:56:45 +0200
From: Primoz Fiser <primoz.fiser@norik.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	upstream@lists.phytec.de
Subject: [PATCH v4 01/15] arm64: dts: freescale: imx93-phycore-som: Add PMIC support
Date: Tue, 22 Apr 2025 12:56:30 +0200
Message-Id: <20250422105644.2725168-2-primoz.fiser@norik.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250422105644.2725168-1-primoz.fiser@norik.com>
References: <20250422105644.2725168-1-primoz.fiser@norik.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel.siel.si
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cpanel.siel.si: authenticated_id: primoz.fiser@norik.com
X-Authenticated-Sender: cpanel.siel.si: primoz.fiser@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_115703_613186_654582FA 
X-CRM114-Status: UNSURE (   7.25  )
X-CRM114-Notice: Please train this message.
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

PMIC driver for PCA9451A used on phyCORE-i.MX93 SOM is available since
commit 5edeb7d31262 ("regulator: pca9450: add pca9451a support"). Add
support for it in the SOM device-tree.

Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
Changes in v4:
- no changes

 .../boot/dts/freescale/imx93-phycore-som.dtsi | 97 +++++++++++++++++++
 1 file changed, 97 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi b/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
index 88c2657b50e6..507a71f9294b 100644
--- a/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
@@ -72,6 +72,90 @@ ethphy1: ethernet-phy@1 {
 	};
 };
 
+/* I2C3 */
+&lpi2c3 {
+	clock-frequency = <400000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_lpi2c3>;
+	status = "okay";
+
+	pmic@25 {
+		compatible = "nxp,pca9451a";
+		reg = <0x25>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_pmic>;
+		interrupt-parent = <&gpio4>;
+		interrupts = <27 IRQ_TYPE_LEVEL_LOW>;
+
+		regulators {
+			buck1: BUCK1 {
+				regulator-name = "VDD_SOC";
+				regulator-min-microvolt = <610000>;
+				regulator-max-microvolt = <950000>;
+				regulator-boot-on;
+				regulator-always-on;
+				regulator-ramp-delay = <3125>;
+			};
+
+			buck2: BUCK2 {
+				regulator-name = "VDDQ_0V6";
+				regulator-min-microvolt = <600000>;
+				regulator-max-microvolt = <600000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			buck4: BUCK4 {
+				regulator-name = "VDD_3V3_BUCK";
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			buck5: BUCK5 {
+				regulator-name = "VDD_1V8";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			buck6: BUCK6 {
+				regulator-name = "VDD_1V1";
+				regulator-min-microvolt = <1100000>;
+				regulator-max-microvolt = <1100000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			ldo1: LDO1 {
+				regulator-name = "PMIC_SNVS_1V8";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			ldo4: LDO4 {
+				regulator-name = "VDD_0V8";
+				regulator-min-microvolt = <800000>;
+				regulator-max-microvolt = <800000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			ldo5: LDO5 {
+				regulator-name = "NVCC_SD2";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+		};
+	};
+};
+
 /* eMMC */
 &usdhc1 {
 	pinctrl-names = "default";
@@ -108,6 +192,19 @@ MX93_PAD_I2C1_SDA__GPIO1_IO01		0x31e
 		>;
 	};
 
+	pinctrl_lpi2c3: lpi2c3grp {
+		fsl,pins = <
+			MX93_PAD_GPIO_IO28__LPI2C3_SDA		0x40000b9e
+			MX93_PAD_GPIO_IO29__LPI2C3_SCL		0x40000b9e
+		>;
+	};
+
+	pinctrl_pmic: pmicgrp {
+		fsl,pins = <
+			MX93_PAD_ENET2_RD3__GPIO4_IO27		0x31e
+		>;
+	};
+
 	pinctrl_usdhc1: usdhc1grp {
 		fsl,pins = <
 			MX93_PAD_SD1_CLK__USDHC1_CLK		0x179e
-- 
2.34.1


