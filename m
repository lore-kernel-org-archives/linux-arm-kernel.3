Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 047AFD78333
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 16:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gKkdekEkQC6APNUtDcbNPtKOxI3MaYSozhb65KjuXxU=; b=qpTK+fJMRGDWsG3an4cJA2wkVC
	NsAXWCMcAFdZPNcecW7qD2HdisYXzkmgG92aij+dYzZR2otE17TRu6y/0im5CYELTKZP1AUWlS4Vw
	aGFJqdRlhrJq304uVUWGytaDivrvc+W1Bhdu8lHMBOJYoDX0cDc1gPkbk2HSzb7/NODkTtauJjC6W
	LrDoogUOxTVUrJtrHRVRDKxQUt3G59tvCjcEb5BX1KJdX5NkYLtS6ovvP5NO8wilxqn77DIOk8et5
	JDqV8pypPkpp/C3GGCaYG1/gj8+ngl/v4v2Ik/Tn16nG6P2qwMxf3kWtZwI399/LEFxaHTKuK8Ixd
	iQBl4a4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI9S8-00000006sy9-1qtu;
	Mon, 02 Dec 2024 16:39:16 +0000
Received: from xavier.telenet-ops.be ([2a02:1800:120:4::f00:14])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI9JU-00000006r0S-2jbU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 16:30:22 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:17fe:4001:68cd:b1ae])
	by xavier.telenet-ops.be with cmsmtp
	id jsWE2D00X1yjZj401sWEWe; Mon, 02 Dec 2024 17:30:15 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1tI9JO-0007uJ-OA;
	Mon, 02 Dec 2024 17:30:14 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1tI9JO-007PnW-Le;
	Mon, 02 Dec 2024 17:30:14 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 3/5] arm64: dts: renesas: Factor out White Hawk Single board support
Date: Mon,  2 Dec 2024 17:30:09 +0100
Message-Id: <1661743b18a9ff9fac716f98a663b39fc8488d7e.1733156661.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1733156661.git.geert+renesas@glider.be>
References: <cover.1733156661.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_083020_827031_253C3467 
X-CRM114-Status: GOOD (  10.87  )
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

Move the common parts for the Renesas White Hawk Single board to
white-hawk-single.dtsi, to enable future reuse.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 .../renesas/r8a779g2-white-hawk-single.dts    | 62 +------------------
 ...hawk-single.dts => white-hawk-single.dtsi} | 11 ++--
 2 files changed, 5 insertions(+), 68 deletions(-)
 copy arch/arm64/boot/dts/renesas/{r8a779g2-white-hawk-single.dts => white-hawk-single.dtsi} (78%)

diff --git a/arch/arm64/boot/dts/renesas/r8a779g2-white-hawk-single.dts b/arch/arm64/boot/dts/renesas/r8a779g2-white-hawk-single.dts
index 0062362b0ba06885..48befde389376bf2 100644
--- a/arch/arm64/boot/dts/renesas/r8a779g2-white-hawk-single.dts
+++ b/arch/arm64/boot/dts/renesas/r8a779g2-white-hawk-single.dts
@@ -7,70 +7,10 @@
 
 /dts-v1/;
 #include "r8a779g2.dtsi"
-#include "white-hawk-cpu-common.dtsi"
-#include "white-hawk-common.dtsi"
+#include "white-hawk-single.dtsi"
 
 / {
 	model = "Renesas White Hawk Single board based on r8a779g2";
 	compatible = "renesas,white-hawk-single", "renesas,r8a779g2",
 		     "renesas,r8a779g0";
 };
-
-&hscif0 {
-	uart-has-rtscts;
-};
-
-&hscif0_pins {
-	groups = "hscif0_data", "hscif0_ctrl";
-	function = "hscif0";
-};
-
-&pfc {
-	tsn0_pins: tsn0 {
-		mux {
-			groups = "tsn0_link", "tsn0_mdio", "tsn0_rgmii",
-				 "tsn0_txcrefclk";
-			function = "tsn0";
-		};
-
-		link {
-			groups = "tsn0_link";
-			bias-disable;
-		};
-
-		mdio {
-			groups = "tsn0_mdio";
-			drive-strength = <24>;
-			bias-disable;
-		};
-
-		rgmii {
-			groups = "tsn0_rgmii";
-			drive-strength = <24>;
-			bias-disable;
-		};
-	};
-};
-
-&tsn0 {
-	pinctrl-0 = <&tsn0_pins>;
-	pinctrl-names = "default";
-	phy-mode = "rgmii";
-	phy-handle = <&phy3>;
-	status = "okay";
-
-	mdio {
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		reset-gpios = <&gpio1 23 GPIO_ACTIVE_LOW>;
-		reset-post-delay-us = <4000>;
-
-		phy3: ethernet-phy@0 {
-			compatible = "ethernet-phy-id002b.0980",
-				     "ethernet-phy-ieee802.3-c22";
-			reg = <0>;
-			interrupts-extended = <&gpio4 3 IRQ_TYPE_LEVEL_LOW>;
-		};
-	};
-};
diff --git a/arch/arm64/boot/dts/renesas/r8a779g2-white-hawk-single.dts b/arch/arm64/boot/dts/renesas/white-hawk-single.dtsi
similarity index 78%
copy from arch/arm64/boot/dts/renesas/r8a779g2-white-hawk-single.dts
copy to arch/arm64/boot/dts/renesas/white-hawk-single.dtsi
index 0062362b0ba06885..20e8232f2f3234e2 100644
--- a/arch/arm64/boot/dts/renesas/r8a779g2-white-hawk-single.dts
+++ b/arch/arm64/boot/dts/renesas/white-hawk-single.dtsi
@@ -1,19 +1,16 @@
 // SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 /*
- * Device Tree Source for the R-Car V4H ES2.0 White Hawk Single board
+ * Device Tree Source for the White Hawk Single board
  *
- * Copyright (C) 2023 Glider bv
+ * Copyright (C) 2023-2024 Glider bv
  */
 
-/dts-v1/;
-#include "r8a779g2.dtsi"
 #include "white-hawk-cpu-common.dtsi"
 #include "white-hawk-common.dtsi"
 
 / {
-	model = "Renesas White Hawk Single board based on r8a779g2";
-	compatible = "renesas,white-hawk-single", "renesas,r8a779g2",
-		     "renesas,r8a779g0";
+	model = "Renesas White Hawk Single board";
+	compatible = "renesas,white-hawk-single";
 };
 
 &hscif0 {
-- 
2.34.1


