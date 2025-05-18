Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E17D7C3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 May 2025 22:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YbcM1bOFMt6WdPHExqK4799CzGHt6PhTiCIlQuVNo5o=; b=T1UryemsV8VFU+7ft4dja7fYOG
	zfyMF3H1HNVd3tHycK+mQK6vK/yrVHSiGc0DzXmScwdbeeqtykkSS2GW7HVXu2QEi+rpuyUEdDJEY
	qjJj3NGIgNau5GhTkDeP1ulTJU1r+gcP6JGsBwFxb6YlAT0h9TUDPmxPqLLN3APFf86xTRKbWH5q5
	Pk9lQIMGQSf7XN3ysRq07V/TgjB9TDPbVVURuafdHmFsNzW9vbQQ+rhAv9wV4KhTXbZ7yKVKGb/HV
	0ByWs0I68ZpudDUPfGDeC4camA6dPX9FvzUprZrX7VI35zC5rSOdaNKEaedbbL5ePuEWIHX2kCGX5
	73n+2HlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGmC7-00000007b4x-2UIe;
	Sun, 18 May 2025 22:09:19 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGm89-00000007aF0-0NAp;
	Sun, 18 May 2025 22:05:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=YbcM1bOFMt6WdPHExqK4799CzGHt6PhTiCIlQuVNo5o=; b=XxIy6clMJgBIwEyNeZA5bMadZY
	HfHalAUEd+mwkWXQsNs7T/Y2nfipGe4tETLYMVWvoBH2J6ggxhO6z7o9/VhjcOcTk8PCIake1OLxV
	efIzEe61rGf+81NSHcDII5ZdEXV1LDR+exWgNBzv95QyRfY3SUpIK3kDZ6SaMQwBNjvF3iciwu2QC
	9ZCBB6Lf+sUN6YASaZqc9yQN9tcEXEWqE5K2BacZ/RdVZS00GRzpo5qEBXWx87QaK1sF9JZBU2CsE
	UKNrx0Xgx2/vPPSRqO9UYZjzgOBLlTNlKp3sTclqDDZ8O4YsjzU5vFPPQvccTKFdC/eJnWMLlp/ID
	UGcD8KPQ==;
Received: from i53875a50.versanet.de ([83.135.90.80] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uGm7z-0004gv-Cj; Mon, 19 May 2025 00:05:03 +0200
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
	linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: [PATCH 2/6] arm64: dts: rockchip: move rk3576 pinctrl node outside the soc node
Date: Mon, 19 May 2025 00:04:44 +0200
Message-ID: <20250518220449.2722673-3-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250518220449.2722673-1-heiko@sntech.de>
References: <20250518220449.2722673-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250518_150513_145751_BB594437 
X-CRM114-Status: GOOD (  11.99  )
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

../arch/arm64/boot/dts/rockchip/rk3576.dtsi:2351.20-2417.5: Warning (simple_bus_reg): /soc/pinctrl: missing or empty reg/ranges property

Move the pinctrl node outside and adapt the indentation.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202505150745.PQT9TLYX-lkp@intel.com/
Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 arch/arm64/boot/dts/rockchip/rk3576.dtsi | 136 +++++++++++------------
 1 file changed, 68 insertions(+), 68 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576.dtsi b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
index 3b62e037772a..0e0a37849874 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
@@ -429,6 +429,74 @@ simple-audio-card,cpu {
 		};
 	};
 
+	pinctrl: pinctrl {
+		compatible = "rockchip,rk3576-pinctrl";
+		rockchip,grf = <&ioc_grf>;
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		gpio0: gpio@27320000 {
+			compatible = "rockchip,gpio-bank";
+			reg = <0x0 0x27320000 0x0 0x200>;
+			clocks = <&cru PCLK_GPIO0>, <&cru DBCLK_GPIO0>;
+			gpio-controller;
+			gpio-ranges = <&pinctrl 0 0 32>;
+			interrupts = <GIC_SPI 153 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-controller;
+			#gpio-cells = <2>;
+			#interrupt-cells = <2>;
+		};
+
+		gpio1: gpio@2ae10000 {
+			compatible = "rockchip,gpio-bank";
+			reg = <0x0 0x2ae10000 0x0 0x200>;
+			clocks = <&cru PCLK_GPIO1>, <&cru DBCLK_GPIO1>;
+			gpio-controller;
+			gpio-ranges = <&pinctrl 0 32 32>;
+			interrupts = <GIC_SPI 157 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-controller;
+			#gpio-cells = <2>;
+			#interrupt-cells = <2>;
+		};
+
+		gpio2: gpio@2ae20000 {
+			compatible = "rockchip,gpio-bank";
+			reg = <0x0 0x2ae20000 0x0 0x200>;
+			clocks = <&cru PCLK_GPIO2>, <&cru DBCLK_GPIO2>;
+			gpio-controller;
+			gpio-ranges = <&pinctrl 0 64 32>;
+			interrupts = <GIC_SPI 161 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-controller;
+			#gpio-cells = <2>;
+			#interrupt-cells = <2>;
+		};
+
+		gpio3: gpio@2ae30000 {
+			compatible = "rockchip,gpio-bank";
+			reg = <0x0 0x2ae30000 0x0 0x200>;
+			clocks = <&cru PCLK_GPIO3>, <&cru DBCLK_GPIO3>;
+			gpio-controller;
+			gpio-ranges = <&pinctrl 0 96 32>;
+			interrupts = <GIC_SPI 165 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-controller;
+			#gpio-cells = <2>;
+			#interrupt-cells = <2>;
+		};
+
+		gpio4: gpio@2ae40000 {
+			compatible = "rockchip,gpio-bank";
+			reg = <0x0 0x2ae40000 0x0 0x200>;
+			clocks = <&cru PCLK_GPIO4>, <&cru DBCLK_GPIO4>;
+			gpio-controller;
+			gpio-ranges = <&pinctrl 0 128 32>;
+			interrupts = <GIC_SPI 169 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-controller;
+			#gpio-cells = <2>;
+			#interrupt-cells = <2>;
+		};
+	};
+
 	pmu_a53: pmu-a53 {
 		compatible = "arm,cortex-a53-pmu";
 		interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
@@ -2347,74 +2415,6 @@ scmi_shmem: scmi-shmem@4010f000 {
 			compatible = "arm,scmi-shmem";
 			reg = <0x0 0x4010f000 0x0 0x100>;
 		};
-
-		pinctrl: pinctrl {
-			compatible = "rockchip,rk3576-pinctrl";
-			rockchip,grf = <&ioc_grf>;
-			#address-cells = <2>;
-			#size-cells = <2>;
-			ranges;
-
-			gpio0: gpio@27320000 {
-				compatible = "rockchip,gpio-bank";
-				reg = <0x0 0x27320000 0x0 0x200>;
-				clocks = <&cru PCLK_GPIO0>, <&cru DBCLK_GPIO0>;
-				gpio-controller;
-				gpio-ranges = <&pinctrl 0 0 32>;
-				interrupts = <GIC_SPI 153 IRQ_TYPE_LEVEL_HIGH>;
-				interrupt-controller;
-				#gpio-cells = <2>;
-				#interrupt-cells = <2>;
-			};
-
-			gpio1: gpio@2ae10000 {
-				compatible = "rockchip,gpio-bank";
-				reg = <0x0 0x2ae10000 0x0 0x200>;
-				clocks = <&cru PCLK_GPIO1>, <&cru DBCLK_GPIO1>;
-				gpio-controller;
-				gpio-ranges = <&pinctrl 0 32 32>;
-				interrupts = <GIC_SPI 157 IRQ_TYPE_LEVEL_HIGH>;
-				interrupt-controller;
-				#gpio-cells = <2>;
-				#interrupt-cells = <2>;
-			};
-
-			gpio2: gpio@2ae20000 {
-				compatible = "rockchip,gpio-bank";
-				reg = <0x0 0x2ae20000 0x0 0x200>;
-				clocks = <&cru PCLK_GPIO2>, <&cru DBCLK_GPIO2>;
-				gpio-controller;
-				gpio-ranges = <&pinctrl 0 64 32>;
-				interrupts = <GIC_SPI 161 IRQ_TYPE_LEVEL_HIGH>;
-				interrupt-controller;
-				#gpio-cells = <2>;
-				#interrupt-cells = <2>;
-			};
-
-			gpio3: gpio@2ae30000 {
-				compatible = "rockchip,gpio-bank";
-				reg = <0x0 0x2ae30000 0x0 0x200>;
-				clocks = <&cru PCLK_GPIO3>, <&cru DBCLK_GPIO3>;
-				gpio-controller;
-				gpio-ranges = <&pinctrl 0 96 32>;
-				interrupts = <GIC_SPI 165 IRQ_TYPE_LEVEL_HIGH>;
-				interrupt-controller;
-				#gpio-cells = <2>;
-				#interrupt-cells = <2>;
-			};
-
-			gpio4: gpio@2ae40000 {
-				compatible = "rockchip,gpio-bank";
-				reg = <0x0 0x2ae40000 0x0 0x200>;
-				clocks = <&cru PCLK_GPIO4>, <&cru DBCLK_GPIO4>;
-				gpio-controller;
-				gpio-ranges = <&pinctrl 0 128 32>;
-				interrupts = <GIC_SPI 169 IRQ_TYPE_LEVEL_HIGH>;
-				interrupt-controller;
-				#gpio-cells = <2>;
-				#interrupt-cells = <2>;
-			};
-		};
 	};
 };
 
-- 
2.47.2


