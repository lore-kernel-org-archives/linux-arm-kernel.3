Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91DACC282D1
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Mar 2025 07:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vwkgJINXSjwUUvgbO2ZSw565OHitKWDx0sP8IkNQk48=; b=xcbTshmBLKYT/K/IMA/ZmT6Nc1
	8JPlgPvpMJERrlTu/EDOP+LnCX1hlI9+bXW7TeOIrq/Expv7OLjiIzPG4rpDRECRtiwSHWcXg3PNz
	15n/DfwOX5kg5P6R+0yQBa34gZfHSLb0DzOuIBxFAaXo1hWxl/iQHZTfTKMLMLJ/tMgjwe+iCx0P3
	IMzl1n7UA3tFQ07GCyT7I4vDhuM8hDFkgMLseY0N/k/QGF8dCE5qIyLc3YOgFZIvuNF+RbD2H7R+W
	slrMVfHpN01guLKj6CcR8DjThw1bj+u5dEdZrEJprYLcy/M5Ka1R3GmI58TGilYQeI6NrhO6nTpvG
	Wlxu1EVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trAqd-000000006ZV-0u4f;
	Sun, 09 Mar 2025 07:13:19 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trAkO-0000000064y-1LUf;
	Sun, 09 Mar 2025 07:06:53 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id D216425A8D;
	Sun,  9 Mar 2025 08:06:47 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bGKGTydjp2sh; Sun,  9 Mar 2025 08:06:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1741504003; bh=xxPj1UzkWFvA7Kr54quT460aPH64SiOjiJkHqnKodz8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Y8mvca+AGJ9kv7i8vyPEk7FHn0+qXStgXYitie8w+dkrLY8W+6jbf5Nt7YsG/B4xN
	 H3HKA+QiGiQmKAzXcBkoJFd99kOq+UP+4pwMib8LgrWdR8Ntd9Ao/yuFvKM9qdDKPq
	 pxXT/Ss2lVhy6IYGMwuV907t7LF4lZLweQwurli1ML9T3cYuikIWIt7ngyNAtcKkDl
	 08so+Gad9N5DV7LiRIJv5sw/mtPNXQ9dCRAFFeU7d8wL/BpY7RibArskU9QzDWjiWw
	 4CofhhkkSiAbKhHwBDOH4uxDfp1PLUPtFjW7DviphP0uCHSmxbHeFRxErftS1t0k3p
	 6M240mUHm9odw==
From: Yao Zi <ziyao@disroot.org>
To: Heiko Stuebner <heiko@sntech.de>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonas Karlman <jonas@kwiboo.se>,
	Yao Zi <ziyao@disroot.org>,
	Chukun Pan <amadeus@jmu.edu.cn>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] arm64: dts: rockchip: Add I2C controllers for RK3528
Date: Sun,  9 Mar 2025 07:06:02 +0000
Message-ID: <20250309070603.35254-3-ziyao@disroot.org>
In-Reply-To: <20250309070603.35254-1-ziyao@disroot.org>
References: <20250309070603.35254-1-ziyao@disroot.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250308_230652_487706_57C96C1E 
X-CRM114-Status: UNSURE (   9.00  )
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

Describe I2C controllers shipped by RK3528 in devicetree.

Signed-off-by: Yao Zi <ziyao@disroot.org>
---
 arch/arm64/boot/dts/rockchip/rk3528.dtsi | 104 +++++++++++++++++++++++
 1 file changed, 104 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3528.dtsi b/arch/arm64/boot/dts/rockchip/rk3528.dtsi
index 04ca2e2b3e9b..860b6057e5c2 100644
--- a/arch/arm64/boot/dts/rockchip/rk3528.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3528.dtsi
@@ -19,6 +19,14 @@ / {
 	#size-cells = <2>;
 
 	aliases {
+		i2c0 = &i2c0;
+		i2c1 = &i2c1;
+		i2c2 = &i2c2;
+		i2c3 = &i2c3;
+		i2c4 = &i2c4;
+		i2c5 = &i2c5;
+		i2c6 = &i2c6;
+		i2c7 = &i2c7;
 		gpio0 = &gpio0;
 		gpio1 = &gpio1;
 		gpio2 = &gpio2;
@@ -466,6 +474,102 @@ uart7: serial@ffa28000 {
 			status = "disabled";
 		};
 
+		i2c0: i2c@ffa50000 {
+			compatible = "rockchip,rk3528-i2c",
+				     "rockchip,rk3399-i2c";
+			reg = <0x0 0xffa50000 0x0 0x1000>;
+			clocks = <&cru CLK_I2C0>, <&cru PCLK_I2C0>;
+			clock-names = "i2c", "pclk";
+			interrupts = <GIC_SPI 61 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c1: i2c@ffa58000 {
+			compatible = "rockchip,rk3528-i2c",
+				     "rockchip,rk3399-i2c";
+			reg = <0x0 0xffa58000 0x0 0x1000>;
+			clocks = <&cru CLK_I2C1>, <&cru PCLK_I2C1>;
+			clock-names = "i2c", "pclk";
+			interrupts = <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c2: i2c@ffa60000 {
+			compatible = "rockchip,rk3528-i2c",
+				     "rockchip,rk3399-i2c";
+			reg = <0x0 0xffa60000 0x0 0x1000>;
+			clocks = <&cru CLK_I2C2>, <&cru PCLK_I2C2>;
+			clock-names = "i2c", "pclk";
+			interrupts = <GIC_SPI 63 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c3: i2c@ffa68000 {
+			compatible = "rockchip,rk3528-i2c",
+				     "rockchip,rk3399-i2c";
+			reg = <0x0 0xffa68000 0x0 0x1000>;
+			clocks = <&cru CLK_I2C3>, <&cru PCLK_I2C3>;
+			clock-names = "i2c", "pclk";
+			interrupts = <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c4: i2c@ffa70000 {
+			compatible = "rockchip,rk3528-i2c",
+				     "rockchip,rk3399-i2c";
+			reg = <0x0 0xffa70000 0x0 0x1000>;
+			clocks = <&cru CLK_I2C4>, <&cru PCLK_I2C4>;
+			clock-names = "i2c", "pclk";
+			interrupts = <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c5: i2c@ffa78000 {
+			compatible = "rockchip,rk3528-i2c",
+				     "rockchip,rk3399-i2c";
+			reg = <0x0 0xffa78000 0x0 0x1000>;
+			clocks = <&cru CLK_I2C5>, <&cru PCLK_I2C5>;
+			clock-names = "i2c", "pclk";
+			interrupts = <GIC_SPI 66 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c6: i2c@ffa80000 {
+			compatible = "rockchip,rk3528-i2c",
+				     "rockchip,rk3399-i2c";
+			reg = <0x0 0xffa80000 0x0 0x1000>;
+			clocks = <&cru CLK_I2C6>, <&cru PCLK_I2C6>;
+			clock-names = "i2c", "pclk";
+			interrupts = <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c7: i2c@ffa88000 {
+			compatible = "rockchip,rk3528-i2c",
+				     "rockchip,rk3399-i2c";
+			reg = <0x0 0xffa88000 0x0 0x1000>;
+			clocks = <&cru CLK_I2C7>, <&cru PCLK_I2C7>;
+			clock-names = "i2c", "pclk";
+			interrupts = <GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		saradc: adc@ffae0000 {
 			compatible = "rockchip,rk3528-saradc";
 			reg = <0x0 0xffae0000 0x0 0x10000>;
-- 
2.48.1


