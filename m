Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FAC5C369C9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 12:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GnjZpyM1QP3pXGdllhKPi2IVd9GOA9XUE25++9zTLCQ=; b=PWySYVZYnTylJxITNsz7O9fbHP
	CI9N5fYCupYv5BdDuOHfyDASNeqo5yYwmWmG8OtmTYoL+I0+gRP+9OyJ40OMu10Oy6WBnRXb1XwM2
	qvdusqvva9fKqTrAyjlcWiXLRlu3lSbJmqJhVhGy1T0bCCzRGkbhcr28JIE8AcQ/ktEm6Nx2sWZmV
	s6YbqZaeYRhyIJMO8UPhrh09VDWCr6d/aJsVqKDx/JVWKzij36WXAc+j5N0PzN0CbpmbmcsJuP4G7
	1QxGc43kRkNSbIJdUJODF1rZTI+diP4zwPONmlUAbIzYaN2EHJPDEww/RAIdoaiq50pqi5taAhRGW
	MtylJD7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5O9E-0000000Ctx4-2ibD;
	Thu, 17 Apr 2025 12:15:16 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5NwW-0000000CrCn-1hQ1;
	Thu, 17 Apr 2025 12:02:10 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 0DAD825DB0;
	Thu, 17 Apr 2025 14:02:07 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Al1Luu8f9c42; Thu, 17 Apr 2025 14:02:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1744891326; bh=WVUl5TJqOF4iM4ohSNDgaQTgAIPG8NeRelFthy8N2R8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=HNN6S2PMTA66w5dH7hKgrlnTk55qDret6b0aa3NHUxFwOsoilX0nrqt5SHa2We4+N
	 NTcT/n9xXlHbX6runkpD3Ztm9g01YWb1tZTyj1SzmnydvLePX9l1y8ycBEb07GeuWX
	 tr4ub0qRn+9ElRpOZRi/qy35vrT/vmCr9PGcuM6ELkm81nuW1X5yePOYkeKUWz1aoR
	 pT/p8X+VcdhFglCuD4XxFXbwtQq7pneQ0a3sZcgwnR8RbutJUN2Gnn85FVN74F1SBf
	 cU3SXo8vosrmOFvyEaEZUys8aT1Z/0jTIp/sLtO/UQihcD1VmDnTNG6nZ4xASmy3x4
	 8xgRUk09Z41LQ==
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
Subject: [PATCH v2 2/3] arm64: dts: rockchip: Add I2C controllers for RK3528
Date: Thu, 17 Apr 2025 12:01:18 +0000
Message-ID: <20250417120118.17610-5-ziyao@disroot.org>
In-Reply-To: <20250417120118.17610-3-ziyao@disroot.org>
References: <20250417120118.17610-3-ziyao@disroot.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_050208_707167_0EBBE246 
X-CRM114-Status: UNSURE (   7.30  )
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

Describe I2C controllers shipped by RK3528 in devicetree. For I2C-2,
I2C-4 and I2C-7 which come with only a set of possible pins, a default
pin configuration is included.

Signed-off-by: Yao Zi <ziyao@disroot.org>
---
 arch/arm64/boot/dts/rockchip/rk3528.dtsi | 110 +++++++++++++++++++++++
 1 file changed, 110 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3528.dtsi b/arch/arm64/boot/dts/rockchip/rk3528.dtsi
index 826f9be0be19..2c9780069af9 100644
--- a/arch/arm64/boot/dts/rockchip/rk3528.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3528.dtsi
@@ -24,6 +24,14 @@ aliases {
 		gpio2 = &gpio2;
 		gpio3 = &gpio3;
 		gpio4 = &gpio4;
+		i2c0 = &i2c0;
+		i2c1 = &i2c1;
+		i2c2 = &i2c2;
+		i2c3 = &i2c3;
+		i2c4 = &i2c4;
+		i2c5 = &i2c5;
+		i2c6 = &i2c6;
+		i2c7 = &i2c7;
 		serial0 = &uart0;
 		serial1 = &uart1;
 		serial2 = &uart2;
@@ -465,6 +473,108 @@ uart7: serial@ffa28000 {
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
+			pinctrl-names = "default";
+			pinctrl-0 = <&i2c2m1_xfer>;
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
+			pinctrl-names = "default";
+			pinctrl-0 = <&i2c4_xfer>;
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
+			pinctrl-names = "default";
+			pinctrl-0 = <&i2c7_xfer>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		saradc: adc@ffae0000 {
 			compatible = "rockchip,rk3528-saradc";
 			reg = <0x0 0xffae0000 0x0 0x10000>;
-- 
2.49.0


