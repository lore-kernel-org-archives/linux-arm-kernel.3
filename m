Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C8C1C83038
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 19:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9+fIV9wX3BY0VMwxiQuNe46v6bLBI43GvekAUirgLOE=; b=tCB81akuY2jPHqbakDDhppUnfw
	d0qrVo8E491tD8dqz213wL5uV3ksI/1XeX4i6Y910Xjpid4W2cv6fk4zkUxMdwXRLxJG1JTnB0VCp
	FD3n9wIwsDeo2JsRJfCn1ohOcfxwLqEw5gF4GtmY4Bh0+aqpBZjIHvr0bewXLZ/2Gxr3tKvgp6hZ6
	7GOli8YtKI2sJqL6+duvluclFQW4wzc1whHHPffsLvpwPgtODon+FkJBDMk8N9vLu5H3QReiL1BEu
	ohP043RsNIKSx6PqhuzSjANJzB6uutfs+vGj4YSYQjIrao5l6bnI2WwNgEDXvgJGHlhO0GEsQ71ie
	iWU9sqwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWghV-00000006Tf3-1mS8;
	Tue, 01 Jul 2025 19:31:29 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWeJ9-000000068bd-2IG4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 16:58:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0307B61444;
	Tue,  1 Jul 2025 16:58:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A569EC4CEF2;
	Tue,  1 Jul 2025 16:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751389090;
	bh=2Z/sxjaBMHzyciR0Amj3yQU+atAainaF8NZKa+qbDFE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OkPUm/PU7LW9I3SOA8qW+bkFi+253rrDVigh2nSqieuGt1WWZ2DEIAbG5Fun5F0U6
	 J4uH7mQrqHQH6l/xxsKFo3GTn1tMecCHsYCYQ6RzFRCYJpmSnz1OowvOSbG+UZcoxG
	 wbgdqaINBCIKgTzkAZ/SfdS2Txwe3Got4APL+maZitPIbcBYkkfp+A81OJ3GNotn9v
	 A8iwyKoZv6lrqxBNhf1GOh/1hkO5a5dol+UGbr1DKn3TIStxfP8qLo6Z2rBJdsmf91
	 YQE9Lg6IDVLD5/DhYCY0gsqMSivymnB+IJL1aAg9GaIjNXPFbzW/S3Zyo+uPYeyeN1
	 kEfRVqxjR6jcw==
Received: by wens.tw (Postfix, from userid 1000)
	id 1BE306013F; Wed,  2 Jul 2025 00:58:06 +0800 (CST)
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
	Andre Przywara <andre.przywara@arm.com>
Subject: [PATCH RFT net-next 09/10] arm64: dts: allwinner: t527: avaota-a1: enable second Ethernet port
Date: Wed,  2 Jul 2025 00:57:55 +0800
Message-Id: <20250701165756.258356-10-wens@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250701165756.258356-1-wens@kernel.org>
References: <20250701165756.258356-1-wens@kernel.org>
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

Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 .../dts/allwinner/sun55i-t527-avaota-a1.dts   | 26 +++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts b/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
index 9a2f29201d3c..62bc9a6b0292 100644
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
@@ -76,8 +77,19 @@ &gmac0 {
 	status = "okay";
 };
 
+&gmac1 {
+	phy-mode = "rgmii-id";
+	phy-handle = <&ext_rgmii1_phy>;
+	phy-supply = <&reg_dcdc4>;
+
+	allwinner,tx-delay-ps = <100>;
+	allwinner,rx-delay-ps = <100>;
+
+	status = "okay";
+};
+
 &mdio0 {
-	ext_rgmii_phy: ethernet-phy@1 {
+	ext_rgmii0_phy: ethernet-phy@1 {
 		compatible = "ethernet-phy-ieee802.3-c22";
 		reg = <1>;
 		reset-gpios = <&pio 7 8 GPIO_ACTIVE_LOW>; /* PH8 */
@@ -86,6 +98,16 @@ ext_rgmii_phy: ethernet-phy@1 {
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


