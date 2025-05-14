Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1C83C3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 13:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bup6NhA6evSSr2vJWZ/rxyhkcFN8+wVdFF6iyZzNxv0=; b=Jr77MR/4WfuBp3ecaLDYGid+o7
	4hvqnrg4c0nNWJ7JjKN0AqcygJhN4VJxrI/7EOhYOHW8SaV/KiwX8bDEAQMqfmCFMGmSLtBEdnGfD
	iHdeoxEbR4JgXRGFL+KYWKftT1sH/cpnbCBU9vbJuUWO4xNUgScLaWWOyahFpieVFKWFZp8vZ9Cs6
	Zc6/S71gcdP3459AKIE5csAyV6n4VOjA+JAj+ldD3C/RLJ3wZ45cMgTj+pU1bAMi/SDnaPeH6LTis
	J8VDY5eb2gg19ocryTqahnx+fbXEfq5wtg97ySQdniWYqWOi75M+sPN7sXXzI0oLX/zjmM52KsB8i
	/yIJAAmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFBpg-0000000FA2t-28RO;
	Wed, 14 May 2025 13:07:36 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFAvK-0000000Eyzl-1x7m;
	Wed, 14 May 2025 12:09:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=bup6NhA6evSSr2vJWZ/rxyhkcFN8+wVdFF6iyZzNxv0=; b=Kn5WA/IgtVwya2trKCfDWwBt4L
	Ax8KEO0MFmCad8uHSBjVGREVqgK9JppRgf9qN1yx/iR/dc1UXV8hUvFsBqM5N+kuN3KRdlGZtNxA+
	kEMLBspjNg/2GcRjfKUaIhWRd/jwUJCTYSwv1bHXcrXwdIugoWIA8OIxa6E9wHfkuVmonl5g1Bt7E
	axhbBtp0o7sbKJC/yFfy2KS83rCPhbQo6JiuVDLG6EFbk/Kjww14En+c5PI4s5PQA2RRrHpOPyhDU
	sj0X6rFjHZ/VRRlZ7zUJL7e4wLzZ3fEnCwCFd1p4Ed7SVbpBnrbxFvL2EJUmpCR97PexiFdpjRiYK
	A3xCtekg==;
Received: from i53875a50.versanet.de ([83.135.90.80] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uFAvI-0005f9-VP; Wed, 14 May 2025 14:09:21 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: quentin.schulz@cherry.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Heiko Stuebner <heiko.stuebner@cherry.de>
Subject: [PATCH v3 2/6] arm64: dts: rockchip: move reset to dedicated eth-phy node on ringneck
Date: Wed, 14 May 2025 14:09:02 +0200
Message-ID: <20250514120906.2412588-3-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250514120906.2412588-1-heiko@sntech.de>
References: <20250514120906.2412588-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_050922_518313_6D07105A 
X-CRM114-Status: GOOD (  12.75  )
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

From: Heiko Stuebner <heiko.stuebner@cherry.de>

Using snps,reset-* properties to handle the ethernet-phy resets is
deprecated and instead a real phy node should be used.

Move the Ringneck phy-reset properties to such a node

Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
Tested-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 .../boot/dts/rockchip/px30-ringneck.dtsi      | 22 ++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/px30-ringneck.dtsi b/arch/arm64/boot/dts/rockchip/px30-ringneck.dtsi
index 142244d52706..ab232e5c7ad6 100644
--- a/arch/arm64/boot/dts/rockchip/px30-ringneck.dtsi
+++ b/arch/arm64/boot/dts/rockchip/px30-ringneck.dtsi
@@ -83,9 +83,7 @@ &emmc {
 
 /* On-module TI DP83825I PHY but no connector, enable in carrierboard */
 &gmac {
-	snps,reset-gpio = <&gpio3 RK_PB0 GPIO_ACTIVE_LOW>;
-	snps,reset-active-low;
-	snps,reset-delays-us = <0 50000 50000>;
+	phy-handle = <&dp83825>;
 	phy-supply = <&vcc_3v3>;
 	clock_in_out = "output";
 };
@@ -344,6 +342,18 @@ &io_domains {
 	status = "okay";
 };
 
+&mdio {
+	dp83825: ethernet-phy@0 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <0x0>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&phy_rst>;
+		reset-assert-us = <50000>;
+		reset-deassert-us = <50000>;
+		reset-gpios = <&gpio3 RK_PB0 GPIO_ACTIVE_LOW>;
+	};
+};
+
 &pinctrl {
 	emmc {
 		emmc_reset: emmc-reset {
@@ -351,6 +361,12 @@ emmc_reset: emmc-reset {
 		};
 	};
 
+	ethernet {
+		phy_rst: phy-rst {
+			rockchip,pins = <3 RK_PB0 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
 	leds {
 		module_led_pin: module-led-pin {
 			rockchip,pins = <1 RK_PB0 RK_FUNC_GPIO &pcfg_pull_none>;
-- 
2.47.2


