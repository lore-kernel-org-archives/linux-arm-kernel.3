Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 811B5D10DB3
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 07:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rF86hPgASe36tDhPu57qGl4irorvhPrOkYViQu3caaY=; b=X+sQNYvfdpaN4pYr3xeQkzFc46
	yZ9bflDzXg7pwawRdyTC4Qki/DQ6kE+RvYUl9Ra9VXj9U5lNDLUzcq+4EpwCjGbEhlWFoTeriLHd0
	Y5V1oKuASu5mhTcENbZQDySx71Pzp9GcyNYRuqbQgQN/G5P0meFj+lUQhVqXzONSY740FRYrdVJRn
	PAo07dhHJiLSa/GQcTOmVf4MeylKNbom3fgj/xBbFfbfujmYSDdVkuYYCxM4lOMK2WIlR7w+uarOA
	X2NGVVBwdPJJ/q0WERObNOMii0jpGlxbvqyFZ59P9LTDyXMfOAJdV+uCNltH5Rjn2x5FpnqFIYVeV
	8sCstzYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI0tm-00000005INO-3xtG;
	Mon, 02 Dec 2024 07:31:14 +0000
Received: from cpanel.siel.si ([46.19.9.99])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI0kG-00000005GRu-3o7k
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 07:21:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=rF86hPgASe36tDhPu57qGl4irorvhPrOkYViQu3caaY=; b=EoN2RgbhCBnbE09c/jBpePIMot
	nkBCXH6Wpq6g3Iw3B0Kw0VWuQAe69LkX0Eqvcx+UwjoU5kzFAyIVFBXGXItNjjWQmDhl61HrqF0Cb
	4Gt6hTirU+Ie3iB6tmSh0J7/fdhypUPabbtIWXSJh6VQSBbQafg5ZfdCnnKMejVT3kaM9L11BSi0u
	UrOIp4yeYM6dSRFav4/pJSd/BLMUFC1bi3Je4rY+ygv9nWBqvLTx71hSK+Z1PYiVYfiKkyai+8NVz
	Lryb7cHL/cfmMX5YkPl+tM5TfnYgA6ryAdoHlAEsBqe8GlTQ+O77s4nSa8R6GdL+xFuyUSzI6mT+2
	2v6KkF2Q==;
Received: from [89.212.21.243] (port=53766 helo=and-HP-Z4..)
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <andrej.picej@norik.com>)
	id 1tI0kF-007Bva-2C;
	Mon, 02 Dec 2024 08:21:23 +0100
From: Andrej Picej <andrej.picej@norik.com>
To: shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	upstream@lists.phytec.de
Subject: [PATCH v2 09/15] arm64: dts: imx8mm: move bulk of rtc properties to carrierboards
Date: Mon,  2 Dec 2024 08:20:46 +0100
Message-Id: <20241202072052.2195283-10-andrej.picej@norik.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241202072052.2195283-1-andrej.picej@norik.com>
References: <20241202072052.2195283-1-andrej.picej@norik.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel.siel.si
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cpanel.siel.si: authenticated_id: andrej.picej@norik.com
X-Authenticated-Sender: cpanel.siel.si: andrej.picej@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241201_232125_098346_1481F835 
X-CRM114-Status: UNSURE (   6.76  )
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

From: Yannic Moog <y.moog@phytec.de>

Move properties from SoM's dtsi to carrierboard's dts as they are
actually defined by the carrier board design.

Signed-off-by: Yannic Moog <y.moog@phytec.de>
Signed-off-by: Andrej Picej <andrej.picej@norik.com>
---
Changes in v2:
 - also moved pinctrl settings to the carrier boards dts.
---
 .../boot/dts/freescale/imx8mm-phyboard-polis-rdk.dts   | 10 ++++++++++
 arch/arm64/boot/dts/freescale/imx8mm-phycore-som.dtsi  | 10 ----------
 .../boot/dts/freescale/imx8mm-phygate-tauri-l.dts      | 10 ++++++++++
 3 files changed, 20 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-rdk.dts b/arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-rdk.dts
index 7aaf705c7e47..17e5dd40b5d7 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-rdk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-rdk.dts
@@ -221,6 +221,10 @@ &pcie_phy {
 
 /* RTC */
 &rv3028 {
+	interrupt-parent = <&gpio1>;
+	interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
+	pinctrl-0 = <&pinctrl_rtc>;
+	pinctrl-names = "default";
 	aux-voltage-chargeable = <1>;
 	trickle-resistor-ohms = <3000>;
 	wakeup-source;
@@ -410,6 +414,12 @@ MX8MM_IOMUXC_SD2_RESET_B_GPIO2_IO19	0x40
 		>;
 	};
 
+	pinctrl_rtc: rtcgrp {
+		fsl,pins = <
+			MX8MM_IOMUXC_GPIO1_IO03_GPIO1_IO3		0x1c0
+		>;
+	};
+
 	pinctrl_tpm: tpmgrp {
 		fsl,pins = <
 			MX8MM_IOMUXC_SD1_STROBE_GPIO2_IO11      0x140
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-phycore-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-phycore-som.dtsi
index cced82226c6d..672baba4c8d0 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-phycore-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-phycore-som.dtsi
@@ -301,10 +301,6 @@ eeprom@51 {
 	/* RTC */
 	rv3028: rtc@52 {
 		compatible = "microcrystal,rv3028";
-		interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
-		interrupt-parent = <&gpio1>;
-		pinctrl-names = "default";
-		pinctrl-0 = <&pinctrl_rtc>;
 		reg = <0x52>;
 	};
 };
@@ -377,12 +373,6 @@ MX8MM_IOMUXC_I2C1_SCL_GPIO5_IO14		0x1e0
 		>;
 	};
 
-	pinctrl_rtc: rtcgrp {
-		fsl,pins = <
-			MX8MM_IOMUXC_GPIO1_IO03_GPIO1_IO3		0x1c0
-		>;
-	};
-
 	pinctrl_sn65dsi83: sn65dsi83grp {
 		fsl,pins = <
 			MX8MM_IOMUXC_GPIO1_IO10_GPIO1_IO10		0x0
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-phygate-tauri-l.dts b/arch/arm64/boot/dts/freescale/imx8mm-phygate-tauri-l.dts
index c9bf4ac254bb..755cf9cacd22 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-phygate-tauri-l.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-phygate-tauri-l.dts
@@ -215,6 +215,10 @@ &pwm4 {
 
 /* RTC */
 &rv3028 {
+	interrupt-parent = <&gpio1>;
+	interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
+	pinctrl-0 = <&pinctrl_rtc>;
+	pinctrl-names = "default";
 	aux-voltage-chargeable = <1>;
 	trickle-resistor-ohms = <3000>;
 	wakeup-source;
@@ -395,6 +399,12 @@ MX8MM_IOMUXC_SD2_RESET_B_GPIO2_IO19     0x40
 		>;
 	};
 
+	pinctrl_rtc: rtcgrp {
+		fsl,pins = <
+			MX8MM_IOMUXC_GPIO1_IO03_GPIO1_IO3		0x1c0
+		>;
+	};
+
 	pinctrl_tempsense: tempsensegrp {
 		fsl,pins = <
 			MX8MM_IOMUXC_SAI3_TXFS_GPIO4_IO31	0x00
-- 
2.34.1


