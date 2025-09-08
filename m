Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01006CA1016
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 23:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bBUT1ZwXTlUvQ88/wkuJR+6/e3jUTe9SKsFowlAS4Kk=; b=D6U2Fk6+U3Lcc8RlhxxAC9DqdP
	H7XuF9j1t8CJ+1Eu18wjCFnMu6aVnaZ+Z4Z1A5nTqP2N7pHfQsc8+oHvRMWPlxgFXrGeM+DTJbbhL
	NwtkaRgsnVP8FuxvnJqKgFE1zh0seEdruNGjjB2exyjL/XYXyjX5TYHEPJhT56GP7fnMQCNPmvsjI
	gFmJtbMx01sq157a2S9AgghgEo/NChNIberpkZwIHNlEciLhI3izPYixxKfH5BuGScuoyv37dfQDy
	c6ayi7VA4Dg8TvKzzBHtBEouVyjguCAz7A9KxhXpojzTOyAmpwzQpYDinMz9M7g55gfenhoH4NUYr
	Ed2EzcUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvlfF-00000003415-1XWA;
	Mon, 08 Sep 2025 23:52:49 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvgKg-00000001RJ1-11X2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 18:11:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 003B744B0E;
	Mon,  8 Sep 2025 18:11:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5601C4CEFC;
	Mon,  8 Sep 2025 18:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757355073;
	bh=zJ4rq1A7rDmdHeQfB8ynFE9503F7ovKFxfivFN/5hPw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hQ7y1IxUPVquvYgy5yUlyXqwhJc6iLQCwcSIFcqEjolAZNOyLB6+v3SRR2bxwaYTP
	 dn0GnEftM+3JCtzI28l+z6EtBy2t2V6M8qGgtDu2XsnUSIndOr5LBM5CrRiHyydBaa
	 TIg6n5G33v5pQ3tM7uVIf5GiGEXvIbGmX/+3Ece2SGgRMdinljCU6As5Kipc/H9xL7
	 1/dxb+RAntzX9qc8L12Z5ARFPiZvngI4B9DbAd6h+8DdXN7peM19tvbGyUens0F9KP
	 21lN9HzQQNf4b6c52XDkRRmKGzgGQpDPabLAx5UYqUM9TZJSga7yj07X5355fSPi98
	 x8R6mDUh6svYQ==
Received: by wens.tw (Postfix, from userid 1000)
	id 68C9B5FFA1; Tue, 09 Sep 2025 02:11:09 +0800 (CST)
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
Subject: [PATCH net-next v4 10/10] arm64: dts: allwinner: t527: orangepi-4a: Enable Ethernet port
Date: Tue,  9 Sep 2025 02:10:59 +0800
Message-Id: <20250908181059.1785605-11-wens@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250908181059.1785605-1-wens@kernel.org>
References: <20250908181059.1785605-1-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_111114_297652_58CD2151 
X-CRM114-Status: GOOD (  10.55  )
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

On the Orangepi 4A board, the second Ethernet controller, aka the GMAC200,
is connected to an external Motorcomm YT8531 PHY. The PHY uses an external
25MHz crystal, has the SoC's PI15 pin connected to its reset pin, and
the PI16 pin for its interrupt pin.

Enable it.

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---

Changes since v1:
- Switch to generic (tx|rx)-internal-delay-ps properties
---
 .../dts/allwinner/sun55i-t527-orangepi-4a.dts | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts b/arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts
index 38cd8c7e92da..7afd6e57fe86 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts
+++ b/arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts
@@ -15,6 +15,7 @@ / {
 	compatible = "xunlong,orangepi-4a", "allwinner,sun55i-t527";
 
 	aliases {
+		ethernet0 = &gmac1;
 		serial0 = &uart0;
 	};
 
@@ -95,11 +96,33 @@ &ehci1 {
 	status = "okay";
 };
 
+&gmac1 {
+	phy-mode = "rgmii-id";
+	phy-handle = <&ext_rgmii_phy>;
+	phy-supply = <&reg_cldo4>;
+
+	tx-internal-delay-ps = <0>;
+	rx-internal-delay-ps = <300>;
+
+	status = "okay";
+};
+
 &gpu {
 	mali-supply = <&reg_dcdc2>;
 	status = "okay";
 };
 
+&mdio1 {
+	ext_rgmii_phy: ethernet-phy@1 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <1>;
+		interrupts-extended = <&pio 8 16 IRQ_TYPE_LEVEL_LOW>; /* PI16 */
+		reset-gpios = <&pio 8 15 GPIO_ACTIVE_LOW>; /* PI15 */
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


