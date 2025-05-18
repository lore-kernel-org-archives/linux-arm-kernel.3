Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E71DC3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 May 2025 22:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3vhXblRFFwM/P/okDicuxONQXGTlkPhFwvYUgdAVGKI=; b=S3gDxoe+AuahVrCpdUsXFbnktR
	eEPfegc7lf3CwVxzF3yzqF9ZHgnnFWVQ0UMx/1BLP+HsGLIGYqNq2z8w2PcjkmMPbuFwp7gv+69iK
	5h+ECJTye956aNVdHL79wyz84XJzneTU+STtWHKC9NE+JUdDIhBCTakotVyMr9fHl4YmPc0QuDty+
	UfCQFF1swQ73kPYKJFjkdBKhE2OiH1Qr/+tjTSRxhR/o4gojsS1Af4U43D1aaQM/fLeoGi3iGn5B/
	bmjSHN9M71n6eYZRwPRfikImF6HfJCRGdAGqgyVmxuYBNzv6DRSun8lxJ+LNWxjGmCq0Rn/3yHRQH
	6YoFnwlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGmA9-00000007aai-0yD5;
	Sun, 18 May 2025 22:07:17 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGm89-00000007aF2-0MCY;
	Sun, 18 May 2025 22:05:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=3vhXblRFFwM/P/okDicuxONQXGTlkPhFwvYUgdAVGKI=; b=AaF+5M+UvBJEspTTK4LVn+ALh8
	1tcASx13Vmu96SIhGVcZoqQwS68qSQPmMXWw+DQCIb1gvy9MBuot+KgEdqmLiQ/2JWxUuMEVhSCgW
	RCrWq6IYtvVYaSxB/Uo9+CQiuY1CahOj+KBDGiS45wDrHvDGX4GoGbnRRZfY48eOIXWB9fGh/rgf0
	d72g2mrulIATZXkK89mFQ5qWQY+O8e8kPWKqviIbrCeWT8wjIRw37pkSnW4kveR633QUkk5EVNjbY
	AsZ7L5eoYjXTpiPdA1VxT+0M53HSZEkr6Cw8SUEHbSS87Ol3UMX42n3yyDJwxdEnntVftpCoJHnvW
	aq5ibW2Q==;
Received: from i53875a50.versanet.de ([83.135.90.80] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uGm80-0004gv-Bq; Mon, 19 May 2025 00:05:04 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	ziyao@disroot.org,
	kever.yang@rock-chips.com,
	nicolas.frattaroli@collabora.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/6] arm64: dts: rockchip: move rk3528 pinctrl node outside the soc node
Date: Mon, 19 May 2025 00:04:46 +0200
Message-ID: <20250518220449.2722673-5-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250518220449.2722673-1-heiko@sntech.de>
References: <20250518220449.2722673-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250518_150513_144364_143C5258 
X-CRM114-Status: GOOD (  12.26  )
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

The non-mmio pinctrl node is not supposed to be inside the soc simple-bus
as dtc points out:

../arch/arm64/boot/dts/rockchip/rk3528.dtsi:870.20-936.5: Warning (simple_bus_reg): /soc/pinctrl: missing or empty reg/ranges property

Move the pinctrl node outside and adapt the indentation.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 arch/arm64/boot/dts/rockchip/rk3528.dtsi | 136 +++++++++++------------
 1 file changed, 68 insertions(+), 68 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3528.dtsi b/arch/arm64/boot/dts/rockchip/rk3528.dtsi
index b2724c969a76..d1c72b52aa4e 100644
--- a/arch/arm64/boot/dts/rockchip/rk3528.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3528.dtsi
@@ -95,6 +95,74 @@ scmi_clk: protocol@14 {
 		};
 	};
 
+	pinctrl: pinctrl {
+		compatible = "rockchip,rk3528-pinctrl";
+		rockchip,grf = <&ioc_grf>;
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		gpio0: gpio@ff610000 {
+			compatible = "rockchip,gpio-bank";
+			reg = <0x0 0xff610000 0x0 0x200>;
+			clocks = <&cru PCLK_GPIO0>, <&cru DBCLK_GPIO0>;
+			interrupts = <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&pinctrl 0 0 32>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		gpio1: gpio@ffaf0000 {
+			compatible = "rockchip,gpio-bank";
+			reg = <0x0 0xffaf0000 0x0 0x200>;
+			clocks = <&cru PCLK_GPIO1>, <&cru DBCLK_GPIO1>;
+			interrupts = <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&pinctrl 0 32 32>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		gpio2: gpio@ffb00000 {
+			compatible = "rockchip,gpio-bank";
+			reg = <0x0 0xffb00000 0x0 0x200>;
+			clocks = <&cru PCLK_GPIO2>, <&cru DBCLK_GPIO2>;
+			interrupts = <GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&pinctrl 0 64 32>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		gpio3: gpio@ffb10000 {
+			compatible = "rockchip,gpio-bank";
+			reg = <0x0 0xffb10000 0x0 0x200>;
+			clocks = <&cru PCLK_GPIO3>, <&cru DBCLK_GPIO3>;
+			interrupts = <GIC_SPI 76 IRQ_TYPE_LEVEL_HIGH>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&pinctrl 0 96 32>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		gpio4: gpio@ffb20000 {
+			compatible = "rockchip,gpio-bank";
+			reg = <0x0 0xffb20000 0x0 0x200>;
+			clocks = <&cru PCLK_GPIO4>, <&cru DBCLK_GPIO4>;
+			interrupts = <GIC_SPI 78 IRQ_TYPE_LEVEL_HIGH>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&pinctrl 0 128 32>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
 	psci {
 		compatible = "arm,psci-1.0", "arm,psci-0.2";
 		method = "smc";
@@ -866,74 +934,6 @@ dmac: dma-controller@ffd60000 {
 			#dma-cells = <1>;
 			arm,pl330-periph-burst;
 		};
-
-		pinctrl: pinctrl {
-			compatible = "rockchip,rk3528-pinctrl";
-			rockchip,grf = <&ioc_grf>;
-			#address-cells = <2>;
-			#size-cells = <2>;
-			ranges;
-
-			gpio0: gpio@ff610000 {
-				compatible = "rockchip,gpio-bank";
-				reg = <0x0 0xff610000 0x0 0x200>;
-				clocks = <&cru PCLK_GPIO0>, <&cru DBCLK_GPIO0>;
-				interrupts = <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>;
-				gpio-controller;
-				#gpio-cells = <2>;
-				gpio-ranges = <&pinctrl 0 0 32>;
-				interrupt-controller;
-				#interrupt-cells = <2>;
-			};
-
-			gpio1: gpio@ffaf0000 {
-				compatible = "rockchip,gpio-bank";
-				reg = <0x0 0xffaf0000 0x0 0x200>;
-				clocks = <&cru PCLK_GPIO1>, <&cru DBCLK_GPIO1>;
-				interrupts = <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
-				gpio-controller;
-				#gpio-cells = <2>;
-				gpio-ranges = <&pinctrl 0 32 32>;
-				interrupt-controller;
-				#interrupt-cells = <2>;
-			};
-
-			gpio2: gpio@ffb00000 {
-				compatible = "rockchip,gpio-bank";
-				reg = <0x0 0xffb00000 0x0 0x200>;
-				clocks = <&cru PCLK_GPIO2>, <&cru DBCLK_GPIO2>;
-				interrupts = <GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH>;
-				gpio-controller;
-				#gpio-cells = <2>;
-				gpio-ranges = <&pinctrl 0 64 32>;
-				interrupt-controller;
-				#interrupt-cells = <2>;
-			};
-
-			gpio3: gpio@ffb10000 {
-				compatible = "rockchip,gpio-bank";
-				reg = <0x0 0xffb10000 0x0 0x200>;
-				clocks = <&cru PCLK_GPIO3>, <&cru DBCLK_GPIO3>;
-				interrupts = <GIC_SPI 76 IRQ_TYPE_LEVEL_HIGH>;
-				gpio-controller;
-				#gpio-cells = <2>;
-				gpio-ranges = <&pinctrl 0 96 32>;
-				interrupt-controller;
-				#interrupt-cells = <2>;
-			};
-
-			gpio4: gpio@ffb20000 {
-				compatible = "rockchip,gpio-bank";
-				reg = <0x0 0xffb20000 0x0 0x200>;
-				clocks = <&cru PCLK_GPIO4>, <&cru DBCLK_GPIO4>;
-				interrupts = <GIC_SPI 78 IRQ_TYPE_LEVEL_HIGH>;
-				gpio-controller;
-				#gpio-cells = <2>;
-				gpio-ranges = <&pinctrl 0 128 32>;
-				interrupt-controller;
-				#interrupt-cells = <2>;
-			};
-		};
 	};
 };
 
-- 
2.47.2


