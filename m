Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C18CCAC5AC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Sep 2025 14:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KitI7b+7U0nR22Go6VFY8lUStlJA9zAZoRz6hJJa2/M=; b=G/gPls5vuKNu+u9eYux7kr/LTT
	9IzIjskhIV+uJRktQ8sD69dsyDs+HfLI4Fl//+VV1sSKRiaBvY4szOxUdSxEH6Uo/UslhMzKm9vWB
	Y0cQzGyxcYgTKxHph1EyBJHUpbsuauT5DiXxxy/Zc0/XSYdqPxFIj1IFV2Mh4fjIJmGThUAZEDFYh
	WcuBKiX1xPinzJrn2ZnaXbS+mfgWEUQGrSrulzm8T6P/D4qJpUniCW4/GrgLG+tRUALZNwEVxzEoO
	VNbfFHaB3yGryzq4BkSzaUcGppLlIZdRflnHt+1hCFDCFkUzY5xEaroVjRmvbHyj5gy5ixDco6fPL
	QajJ9frA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v13bY-0000000Ddbj-35hQ;
	Tue, 23 Sep 2025 14:02:52 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v13bX-0000000DdaV-1uIa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Sep 2025 14:02:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D329C60282;
	Tue, 23 Sep 2025 14:02:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DD4DC4AF09;
	Tue, 23 Sep 2025 14:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758636170;
	bh=rx7cTQhbHRFL+3YWoqnP53MCOR0zwAA48Z7BXBg9pb8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Cjh9lXJinGubymHzTR8iqkFWHo4/T+IVyPeOOJTqk5xNF0ysF0BFzz5ZP6X33I6iU
	 kjmFzhh9y0LP49AaQBa2TRdJrcu3gjyAsZLWMCCvuAlxdiJjlKbo4oqteslU5Jbv87
	 6iGmWxUmXiG6Rd4NU56EbrhPsOmiffgbU/AKhn8iaxfGJhaa7CbFNqci2nUutt0DZP
	 sAP7ZkImbREwAF5fu1W8oQB1juq9445HPePL88N+R+4Yu2hABq0Gl+460ssA+0wrX1
	 AYxVt63e7BKzqhLdN1sQ88s5SfUQkW01kkqBI1DBdLagBdwfrAo2eeRqIRVNZbwbsb
	 j0XG6YcGPjcbQ==
Received: by wens.tw (Postfix, from userid 1000)
	id 35554606A9; Tue, 23 Sep 2025 22:02:48 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andre Przywara <andre.przywara@arm.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>
Subject: [PATCH net-next v7 4/6] arm64: dts: allwinner: a527: cubie-a5e: Enable second Ethernet port
Date: Tue, 23 Sep 2025 22:02:44 +0800
Message-ID: <20250923140247.2622602-5-wens@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250923140247.2622602-1-wens@kernel.org>
References: <20250923140247.2622602-1-wens@kernel.org>
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

From: Chen-Yu Tsai <wens@csie.org>

On the Radxa Cubie A5E board, the second Ethernet controller, aka the
GMAC200, is connected to a second external Maxio MAE0621A PHY. The PHY
uses an external 25MHz crystal, and has the SoC's PJ16 pin connected to
its reset pin.

Enable the second Ethernet port. Also fix up the label for the existing
external PHY connected to the first Ethernet port. An enable delay for the
PHY supply regulator is added to make sure the PHY's internal regulators
are fully powered and the PHY is operational.

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---

Changes since v1:
- Switch to generic (tx|rx)-internal-delay-ps properties
- Add PHY regulator delay
---
 .../dts/allwinner/sun55i-a527-cubie-a5e.dts   | 28 +++++++++++++++++--
 1 file changed, 26 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts b/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts
index f82a8d121697..bfdf1728cd14 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts
+++ b/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts
@@ -14,6 +14,7 @@ / {
 
 	aliases {
 		ethernet0 = &gmac0;
+		ethernet1 = &gmac1;
 		serial0 = &uart0;
 	};
 
@@ -75,7 +76,7 @@ &ehci1 {
 
 &gmac0 {
 	phy-mode = "rgmii-id";
-	phy-handle = <&ext_rgmii_phy>;
+	phy-handle = <&ext_rgmii0_phy>;
 	phy-supply = <&reg_cldo3>;
 
 	allwinner,tx-delay-ps = <300>;
@@ -84,13 +85,24 @@ &gmac0 {
 	status = "okay";
 };
 
+&gmac1 {
+	phy-mode = "rgmii-id";
+	phy-handle = <&ext_rgmii1_phy>;
+	phy-supply = <&reg_cldo4>;
+
+	tx-internal-delay-ps = <300>;
+	rx-internal-delay-ps = <400>;
+
+	status = "okay";
+};
+
 &gpu {
 	mali-supply = <&reg_dcdc2>;
 	status = "okay";
 };
 
 &mdio0 {
-	ext_rgmii_phy: ethernet-phy@1 {
+	ext_rgmii0_phy: ethernet-phy@1 {
 		compatible = "ethernet-phy-ieee802.3-c22";
 		reg = <1>;
 		reset-gpios = <&pio 7 8 GPIO_ACTIVE_LOW>; /* PH8 */
@@ -99,6 +111,16 @@ ext_rgmii_phy: ethernet-phy@1 {
 	};
 };
 
+&mdio1 {
+	ext_rgmii1_phy: ethernet-phy@1 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <1>;
+		reset-gpios = <&pio 9 16 GPIO_ACTIVE_LOW>; /* PJ16 */
+		reset-assert-us = <10000>;
+		reset-deassert-us = <150000>;
+	};
+};
+
 &mmc0 {
 	vmmc-supply = <&reg_cldo3>;
 	cd-gpios = <&pio 5 6 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>; /* PF6 */
@@ -250,6 +272,8 @@ reg_cldo4: cldo4 {
 				regulator-min-microvolt = <3300000>;
 				regulator-max-microvolt = <3300000>;
 				regulator-name = "vcc-pj-phy";
+				/* enough time for the PHY to fully power on */
+				regulator-enable-ramp-delay = <150000>;
 			};
 
 			reg_cpusldo: cpusldo {
-- 
2.47.3


