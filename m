Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B4CACAC58F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 17:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LtfTMnjlE3++qRetN4HBNoW1at6Ufa6Gl5bZA5/z/ak=; b=dQbJ7in87iQrKP2MnLZ/ue9zwk
	DUtVrlEgDrnSzJ7+i4a2eawPx5oUIrE6WoLnK7GZMUaTOIjLlKU9rk0iPKr9idDrAXFqO7ajTQuy4
	ShhLkTx0UQVh9qrnDoJegWJ4c/kA3ZZ/R6QcyHEjpaAI8Eg9kgc99M1motm6DpPCqyjRoHLOsxDm4
	EvWwuvgdT9XL05yDuMY4ZuAnxOq2jMW9QZs+OSBBkwC8yGesFLEA0Sc5TwygSEBmvap9fFi47gCe+
	iFMZxGRTwEOyBWMO9AVDGv8CZeYlSXF9Sa8xKYD5j+PsP0Wmg1xPLL+eiSW2RdAYTAN5NAbGOckcv
	JNxHjZQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwlHn-00000004VjX-1KA9;
	Thu, 11 Sep 2025 17:40:43 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwlHj-00000004VgT-0y9b
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 17:40:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 81C4C6023D;
	Thu, 11 Sep 2025 17:40:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03BDEC4CEF0;
	Thu, 11 Sep 2025 17:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757612438;
	bh=KwQ33/Me6CtoPqF903pwWNvdntE/FNahw7BHgwIWeoE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OXKWDV6/zRIDx8rmJIF19WHTQ1kLiS67cArk4RJNLqqLh/AHyIzr7jna4Yi7RD49O
	 sNolPJdJi+9pg8YW8VaEr58zA5XSiuyR5JfEdr2//hK9Jn9Y9WCX6ehSS9I4jFX86r
	 lzNI9PD+v5010UKCCzPgjcdWe2BSXCin+Ql/OtSDW/lK/QPrqWju5/Dg+SuNkYJ2Aq
	 WjY8mg/puH2u3ZKyMWc+/qrIIcZ+z41aTZ57eCQiY0dXFz3ehRJ5W1fNncZX72jfNR
	 aFZXn2BSnW/j/WlWFfzXfjjj2Z783x6U97TXDkQWSLw7MJXSOt5T0T6DQ15FMbfXhq
	 aT6v7dLkdDOZA==
Received: by wens.tw (Postfix, from userid 1000)
	id 4659F5FEEE; Fri, 12 Sep 2025 01:40:33 +0800 (CST)
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
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH net-next v5 5/6] arm64: dts: allwinner: t527: avaota-a1: enable second Ethernet port
Date: Fri, 12 Sep 2025 01:40:31 +0800
Message-Id: <20250911174032.3147192-6-wens@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250911174032.3147192-1-wens@kernel.org>
References: <20250911174032.3147192-1-wens@kernel.org>
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

On the Avaota A1 board, the second Ethernet controller, aka the GMAC200,
is connected to a second external RTL8211F-CG PHY. The PHY uses an
external 25MHz crystal, and has the SoC's PJ16 pin connected to its
reset pin.

Enable the second Ethernet port. Also fix up the label for the existing
external PHY connected to the first Ethernet port.

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---

Changes since v1:
- Switch to generic (tx|rx)-internal-delay-ps properties
---
 .../dts/allwinner/sun55i-t527-avaota-a1.dts   | 26 +++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts b/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
index e7713678208d..f540965ffaa4 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
+++ b/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
@@ -13,6 +13,7 @@ / {
 
 	aliases {
 		ethernet0 = &gmac0;
+		ethernet1 = &gmac1;
 		serial0 = &uart0;
 	};
 
@@ -67,7 +68,7 @@ &ehci1 {
 
 &gmac0 {
 	phy-mode = "rgmii-id";
-	phy-handle = <&ext_rgmii_phy>;
+	phy-handle = <&ext_rgmii0_phy>;
 	phy-supply = <&reg_dcdc4>;
 
 	allwinner,tx-delay-ps = <100>;
@@ -76,13 +77,24 @@ &gmac0 {
 	status = "okay";
 };
 
+&gmac1 {
+	phy-mode = "rgmii-id";
+	phy-handle = <&ext_rgmii1_phy>;
+	phy-supply = <&reg_dcdc4>;
+
+	tx-internal-delay-ps = <100>;
+	rx-internal-delay-ps = <100>;
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
@@ -91,6 +103,16 @@ ext_rgmii_phy: ethernet-phy@1 {
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
-- 
2.39.5


