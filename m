Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66AF4CCD1BC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 10:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KaIqVjC080ehs+M4YMocjMvAP2vggOM8cTfTrGcUD3Q=; b=3l7R2SrHiPt/Prm9oQLjHoUTNU
	fLOqLUqXCxQ7qUcCu/uIvSnlaIhCh2RgJAsJ+jcFKu/5xi+LmoqcjHWgx1tWvfNKL//sHI7pYbC96
	/Kw59j0wElT1skMLia5YwgS7U3b0vWxuBA+FMl6vkiDkwii93AYqyes3JRty1EH/b6MGslgv8PJRe
	MYlv5YT3EIAzwz/fXfiNezXjukbQNFo1RrR7cL5vCHFGLUDAtWSJGCDKITaUwfBbUsuWr0/xIwQAo
	aXbqL1hVKdW3gGiJa2szcZeh4ygPmHxomhaIlnBIPm5mJIrJEYymNUhtsK53wHADCJwSXUHVQUn4o
	42HLfPEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBsfj-00000005vfp-0pQX;
	Thu, 23 Oct 2025 10:35:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBsfh-00000005veu-2QoL
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 23 Oct 2025 10:35:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=KaIqVjC080ehs+M4YMocjMvAP2vggOM8cTfTrGcUD3Q=; b=GmE1j6Vp5QSOnwAMQ2u4KvQuGN
	659jZ2Lm+wc3EJnCJU9a8vHIMMmzpawflaZUNb8lsTtxOMW98yIJbCq2tOzIDIw1SpHy1RSjN1kaC
	Hxu5fB5DJcB41N8hpz2jAPqCCK2i6gxYZvKEM6sSlF+4aiYHsv/TFQgrfQooHdPzBljQKFwD4mCKh
	iOcv0hDVL7rp+mmyCla0b1plTg4mu5MU5m1gXbt8go5hvvTg96Q7xtFVuSQR6BKS/TSY2zQRFad1p
	nxilBbEB4Bc6WHomzHHXr/tTAmJlCbHrh8tXJdN6Z//FYhoDe7rzfw6goy+ZGVp/dsR1IWeAbfFNu
	8r5ANiPg==;
Received: from cp2.siel.si ([46.19.12.180])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBrnj-00000001Fdb-0TpJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Oct 2025 09:40:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=KaIqVjC080ehs+M4YMocjMvAP2vggOM8cTfTrGcUD3Q=; b=Pwxz1Y/+dhLSy+qAY3X3bmHxPN
	QiGy/MseMEXz9E5ficRSjb/d/H8V7O1eShNSVWlbru+ZRf5xZKjvFRSLGz2AAlZKjQESOoRRSqWvq
	ujokKs9FhOG3GOj2ChcReOxgpBzMzoYrgnKvD8nBxDUT8fmDb2mmzdZBgmafxuII4wV/hjxlI/bD0
	+HOnUgv/cAeqgPVXfPrR2uCdMjqnrw9U4qQC8MeajGTvIPAwDv3gXk3pKlDhi8hpwiWP+Z3aAtcP6
	yracWIgsq4nVba7PAGhItOI+7vGXYw1wEhGq3mDBnYSyIjIY8ZnGdxV/OMnwLcfbT0Fso2OeOarCc
	kGpwiYuw==;
Received: from 89-212-21-243.static.t-2.net ([89.212.21.243]:50686 helo=localhost.localdomain)
	by cp2.siel.si with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <primoz.fiser@norik.com>)
	id 1vBseN-00000005s0B-0vOg;
	Thu, 23 Oct 2025 12:34:27 +0200
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
Subject: [PATCH] arm64: dts: freescale: imx93-phy{core,board}: Add i2c bus recovery
Date: Thu, 23 Oct 2025 12:34:26 +0200
Message-Id: <20251023103426.3606647-1-primoz.fiser@norik.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cp2.siel.si
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cp2.siel.si: authenticated_id: primoz.fiser@norik.com
X-Authenticated-Sender: cp2.siel.si: primoz.fiser@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_104023_149278_1D492E27 
X-CRM114-Status: UNSURE (   6.87  )
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

Add bus recovery feature for I2C buses on the PHYTEC phyCORE-i.MX93 SoM
based boards (that is phyBOARD-Nash-i.MX93 and phyBOARD-Segin-i.MX93).
This enables the i2c-imx-lpi2c driver to recover the stuck I2C bus by
switching the SCL and SDA pinmuxing and do the I2C bus bit-banging.

Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
---
 .../arm64/boot/dts/freescale/imx93-phyboard-nash.dts | 12 +++++++++++-
 .../boot/dts/freescale/imx93-phyboard-segin.dts      | 12 +++++++++++-
 arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi | 12 +++++++++++-
 3 files changed, 33 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx93-phyboard-nash.dts b/arch/arm64/boot/dts/freescale/imx93-phyboard-nash.dts
index 5599e296919f..96c58cf13754 100644
--- a/arch/arm64/boot/dts/freescale/imx93-phyboard-nash.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-phyboard-nash.dts
@@ -128,8 +128,11 @@ &flexcan1 {
 /* I2C2 */
 &lpi2c2 {
 	clock-frequency = <400000>;
-	pinctrl-names = "default";
+	pinctrl-names = "default", "gpio";
 	pinctrl-0 = <&pinctrl_lpi2c2>;
+	pinctrl-1 = <&pinctrl_lpi2c2_gpio>;
+	scl-gpios = <&gpio1 2 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	sda-gpios = <&gpio1 3 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 	status = "okay";
 
 	/* RTC */
@@ -253,6 +256,13 @@ MX93_PAD_I2C2_SDA__LPI2C2_SDA		0x40000b9e
 		>;
 	};
 
+	pinctrl_lpi2c2_gpio: lpi2c2gpiogrp {
+		fsl,pins = <
+			MX93_PAD_I2C2_SCL__GPIO1_IO02		0x31e
+			MX93_PAD_I2C2_SDA__GPIO1_IO03		0x31e
+		>;
+	};
+
 	pinctrl_lpspi6: lpspi6grp {
 		fsl,pins = <
 			MX93_PAD_GPIO_IO00__GPIO2_IO00		0x386
diff --git a/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts b/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
index 802d96b19e4c..1850a93dbaa4 100644
--- a/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
@@ -132,8 +132,11 @@ &flexcan1 {
 /* I2C2 */
 &lpi2c2 {
 	clock-frequency = <400000>;
-	pinctrl-names = "default";
+	pinctrl-names = "default", "gpio";
 	pinctrl-0 = <&pinctrl_lpi2c2>;
+	pinctrl-1 = <&pinctrl_lpi2c2_gpio>;
+	scl-gpios = <&gpio1 2 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	sda-gpios = <&gpio1 3 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 	status = "okay";
 
 	/* Codec */
@@ -238,6 +241,13 @@ MX93_PAD_I2C2_SDA__LPI2C2_SDA		0x40000b9e
 		>;
 	};
 
+	pinctrl_lpi2c2_gpio: lpi2c2gpiogrp {
+		fsl,pins = <
+			MX93_PAD_I2C2_SCL__GPIO1_IO02		0x31e
+			MX93_PAD_I2C2_SDA__GPIO1_IO03		0x31e
+		>;
+	};
+
 	pinctrl_reg_usdhc2_vmmc: regusdhc2vmmcgrp {
 		fsl,pins = <
 			MX93_PAD_SD2_RESET_B__GPIO3_IO07	0x31e
diff --git a/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi b/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
index 3f069905cf0b..ebc57841f27f 100644
--- a/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
@@ -93,8 +93,11 @@ ethphy1: ethernet-phy@1 {
 /* I2C3 */
 &lpi2c3 {
 	clock-frequency = <400000>;
-	pinctrl-names = "default";
+	pinctrl-names = "default", "gpio";
 	pinctrl-0 = <&pinctrl_lpi2c3>;
+	pinctrl-1 = <&pinctrl_lpi2c3_gpio>;
+	scl-gpios = <&gpio2 29 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	sda-gpios = <&gpio2 28 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 	status = "okay";
 
 	pmic@25 {
@@ -234,6 +237,13 @@ MX93_PAD_GPIO_IO29__LPI2C3_SCL		0x40000b9e
 		>;
 	};
 
+	pinctrl_lpi2c3_gpio: lpi2c3gpiogrp {
+		fsl,pins = <
+			MX93_PAD_GPIO_IO28__GPIO2_IO28		0x31e
+			MX93_PAD_GPIO_IO29__GPIO2_IO29		0x31e
+		>;
+	};
+
 	pinctrl_pmic: pmicgrp {
 		fsl,pins = <
 			MX93_PAD_ENET2_RD3__GPIO4_IO27		0x31e
-- 
2.34.1


