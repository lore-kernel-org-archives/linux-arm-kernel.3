Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4231C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 06:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cSCTcvJ/f5LCH+fsJYEWM0YxPS9S7F+Hvdyj4UuikKE=; b=NZxOQgM4dud0ZruEmXUyjd6Iv0
	Mmah9iCMlGHAlBs4sonJBmWjDbbuM6+8xdf/Ot7AQGMPbWu4aUy2omhV717PxcUCJaL4vyXAJ4sbp
	ifeuB6B8X5lEa1AP8OLpeuczbrTCIt3K7Pkh33nd8Wu1x4XpZM5+6n8Bo7TRsC1Y073WcTUECD7Sq
	Gh2hYkgdV5MndWT6XUgTbjLU5n23vYmun4JELcqkJE8ppNQMAQnsujdKx93I8XjoI526Nm1d9n0UB
	Gl2BVsGSeq3ZggoLJy/0DfA///yucG2V42IIL11e7X6xboT32Cn+O3NoHcd7lHeO/q8kAH7okND+e
	a1pA+eXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5fP5-0000000FIJf-0QdG;
	Fri, 18 Apr 2025 06:40:47 +0000
Received: from cpanel.siel.si ([46.19.9.99])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5fFn-0000000FGeT-0eL3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Apr 2025 06:31:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=cSCTcvJ/f5LCH+fsJYEWM0YxPS9S7F+Hvdyj4UuikKE=; b=h7s63zlCSmKIIfNfZaCWrj85+u
	wsrpHEmTRAC+X/hDbzwA2WxSU33PGIYdiM4ETg+Gv7cGzHiTdlZ9V8YyBcLKnHrsOahjunwENZWp8
	BNF7/KX+ygTZf0ac/TuoEDol3jJt4e5AGDAt80kPsyVCo9HLHdZY6xq+v/ofc9f/TGYxUfXKJINoI
	hot8eTAwmIfC5q9Fc8AwE5m5JJY4ql12eXj56TDDnKVDvkEsVuyx9TLCSKP1Mz7GX0fzNOTUUraM6
	s2fOoobvmAfVJb5uDhj+AIoOvDA5va8h7A89IcHm7H/hsRU0OBdWRdijvLubzvxvVBpIWg4srTngu
	QwsJf6PA==;
Received: from [89.212.21.243] (port=56446 helo=localhost.localdomain)
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <primoz.fiser@norik.com>)
	id 1u5fFh-00AbM0-3A;
	Fri, 18 Apr 2025 08:31:05 +0200
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
Subject: [PATCH v3 01/15] arm64: dts: freescale: imx93-phycore-som: Add PMIC support
Date: Fri, 18 Apr 2025 08:30:50 +0200
Message-Id: <20250418063104.2202085-2-primoz.fiser@norik.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250418063104.2202085-1-primoz.fiser@norik.com>
References: <20250418063104.2202085-1-primoz.fiser@norik.com>
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
X-CRM114-CacheID: sfid-20250417_233111_682513_DD132446 
X-CRM114-Status: UNSURE (   7.00  )
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
Changes in v3:
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


