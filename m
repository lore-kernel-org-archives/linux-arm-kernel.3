Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D71BCC61DB9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 14:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aDxfxf1fgYjMSBidSGAbLNiPBiqyv8EGm8NAQD08B68=; b=qy69sYK805/vZNNi2B4sZQx6Wg
	pZoipqEiZZZna9VWg12ygHNYXODZbstEF72EtACPmtpMmQ8E40nJ7QgIfVDX0563R568v+hjg0THa
	n+9pBHcFePcyN4AgWE8+76PdAC9CGYDVkcVK9mSROmXAz8yAJfQRAn/eVwvPjllOxxxI4X/wLClWs
	7SNwvSq7RU1hyIxb3YLsTMpo67mxcSpWUYpP8C2Hg0juegvQ3XSOeF9/QIMGBgrQHIaoFn3r923Ws
	T/8jBsDq3ublc1JUlg0gkHtrGI6AbkIxxl8fHZWDr98R70U3A2YJnaZY4NEzWFRKSD5uciZbNCtCa
	h9e4UXGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wysXV-00000000zo6-21ul;
	Tue, 25 Aug 2026 14:54:13 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wysXT-00000000znq-3DPZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 14:54:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 26F3B405ED;
	Tue, 25 Aug 2026 14:54:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4E6F1F00A3A;
	Tue, 25 Aug 2026 14:54:09 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFT] arm64: dts: renesas: r9a09g047e57-smarc: Update CAN transceivers
Date: Tue, 25 Aug 2026 16:54:05 +0200
Message-ID: <2a759a486337e4cc8156bc94079471a6552faefc.1787669487.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The dual-channel TCAN1046V-Q1 CAN Transceiver on the RZ/G3E SMARC EVK is
currently modelled as two TCAN1042 instances.  Improve hardware
description by describing the actual transceiver.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Compile-tested only due to lack of hardware.

At least the TI AM68 SK DTS should be updated, too.
There may be others ("git grep -wc ti,tcan1042 | grep -v :1$").
---
 .../boot/dts/renesas/r9a09g047e57-smarc.dts   | 25 +++++++++++--------
 .../boot/dts/renesas/renesas-smarc2.dtsi      | 13 +++-------
 2 files changed, 17 insertions(+), 21 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
index 469a6282b2a30c91..14f5834082fa500e 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
@@ -112,7 +112,7 @@ &canfd {
 	channel1 {
 		status = "okay";
 #if (!SW_LCD_EN) && (SW_GPIO9_CAN1_STB)
-		phys = <&can_transceiver1>;
+		phys = <&can_transceiver 1>;
 #endif
 	};
 #endif
@@ -121,22 +121,25 @@ channel1 {
 	channel4 {
 		status = "okay";
 #if (SW_GPIO8_CAN0_STB)
-		phys = <&can_transceiver0>;
+		phys = <&can_transceiver 0>;
 #endif
 	};
 #endif
 };
 
-#if (!SW_LCD_EN) && (SW_GPIO8_CAN0_STB)
-&can_transceiver0 {
-	standby-gpios = <&pinctrl RZG3E_GPIO(5, 4) GPIO_ACTIVE_HIGH>;
-	status = "okay";
-};
+#if (!SW_LCD_EN) && (SW_GPIO8_CAN0_STB || SW_GPIO9_CAN1_STB)
+&can_transceiver {
+	standby-gpios =
+#if (SW_GPIO8_CAN0_STB)
+			<&pinctrl RZG3E_GPIO(5, 4) GPIO_ACTIVE_HIGH>,
+#else
+			<0>,
+#endif
+#if (SW_GPIO9_CAN1_STB)
+			<&pinctrl RZG3E_GPIO(5, 5) GPIO_ACTIVE_HIGH>;
+#else
+			<0>;
 #endif
-
-#if (!SW_LCD_EN) && (SW_GPIO9_CAN1_STB)
-&can_transceiver1 {
-	standby-gpios = <&pinctrl RZG3E_GPIO(5, 5) GPIO_ACTIVE_HIGH>;
 	status = "okay";
 };
 #endif
diff --git a/arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi b/arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi
index 696a933af808a8eb..826a11ab93c7a253 100644
--- a/arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi
+++ b/arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi
@@ -44,16 +44,9 @@ chosen {
 		stdout-path = "serial3:115200n8";
 	};
 
-	can_transceiver0: can-phy0 {
-		compatible = "ti,tcan1042";
-		#phy-cells = <0>;
-		max-bitrate = <8000000>;
-		status = "disabled";
-	};
-
-	can_transceiver1: can-phy1 {
-		compatible = "ti,tcan1042";
-		#phy-cells = <0>;
+	can_transceiver: can-phy {
+		compatible = "ti,tcan1046", "nxp,tja1048";
+		#phy-cells = <1>;
 		max-bitrate = <8000000>;
 		status = "disabled";
 	};
-- 
2.43.0


