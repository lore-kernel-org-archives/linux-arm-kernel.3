Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FF19D2F352
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 18:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=P6I7h+bj3CMTWnDZKlX7MR4NLD2YmzpWA7tYI5nxT+A=; b=CYnWf/tqswPVRhcaz84QqxNijV
	+hM0L9WYfxyC7HSNskT9Q0vvZoxvehvteOk3L5yJA2OU8YKzee+51C63Tp8MNR+TjdyCiRJTkusak
	gN+MopmaJt9hU8AFygGVanupUny8+0+2/n8qgnHSLZEN7j/yCgIG0iBdlK0qJLH+JucaiIgYIAVt5
	6T+f6H14pl7W8/FrEGmnGLk0iBDruNEK9TDm0OHAnOt8ThHRZSfBkTE4M4BJ3rXuhT8gdCEa4XjNy
	nAqqn5ZWFjBOyCkwB7pHrTgkX5B4XW1RLuSZ7vp9N9QwILHPLwZFcfwTYJyEI8hj4fPvj68xRhrPd
	0abwMmUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfjAW-00000007aOq-2HtU;
	Tue, 13 Jan 2026 18:31:04 +0000
Received: from mail.netcube.li ([173.249.15.149])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfjAT-00000007aOQ-2r3L;
	Tue, 13 Jan 2026 18:31:03 +0000
dkim-signature: v=1; a=rsa-sha256; d=netcube.li; s=s1;
	c=relaxed/relaxed; q=dns/txt; h=From:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Transfer-Encoding;
	bh=P6I7h+bj3CMTWnDZKlX7MR4NLD2YmzpWA7tYI5nxT+A=;
	b=B51SYI0mLx9lICXLoVzDjZq4lT/LvshEHrhHwH0YivHdD0YzFW5BTTyZVVHpF/sk8X5XoT/VEmTK8A/2SX1bn0EOcoFzT+0Es5hz4+Uq8tzPzo8sbExFnd4UFCzAgzoXyfDC3Qkiom0nKFiyhe1HqkTrQu35wFQHuFvW0wZyKqc=
Received: from lukas-hpz440workstation.lan.sk100508.local (cm70-231.liwest.at [212.241.70.231])
	by mail.netcube.li with ESMTPA
	; Tue, 13 Jan 2026 19:30:24 +0100
From: Lukas Schmid <lukas.schmid@netcube.li>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-sunxi@lists.linux.dev,
	Alex Studer <alex@studer.dev>,
	Lukas Schmid <lukas.schmid@netcube.li>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2] riscv: dts: allwinner: d1: Add CPU thermal sensor and zone
Date: Tue, 13 Jan 2026 19:29:48 +0100
Message-ID: <20260113182951.1059690-1-lukas.schmid@netcube.li>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_103102_049961_2AB2D673 
X-CRM114-Status: GOOD (  13.26  )
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

From: Alex Studer <alex@studer.dev>

The sun20i THS (built in CPU thermal sensor) is supported in code, but
was never added to the device tree. So, add it to the device tree,
along with a thermal zone for the CPU.

Signed-off-by: Alex Studer <alex@studer.dev>

Link: https://lore.kernel.org/r/20250218020629.1476126-1-alex@studer.dev
Changes since v1:
 - Move include before defines in sun20i-d1s.dtsi
 - Fix register size for thermal-sensor@2009400
 - Move thermal-sensor@2009400 in SoC to match register address sorting
 - Add thermal-zone for sun8i-t113s.dtsi and fix missing cooling-cells
Signed-off-by: Lukas Schmid <lukas.schmid@netcube.li>
---
 arch/arm/boot/dts/allwinner/sun8i-t113s.dtsi  | 33 +++++++++++++++++++
 arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi | 31 +++++++++++++++++
 .../boot/dts/allwinner/sunxi-d1s-t113.dtsi    | 16 +++++++++
 3 files changed, 80 insertions(+)

diff --git a/arch/arm/boot/dts/allwinner/sun8i-t113s.dtsi b/arch/arm/boot/dts/allwinner/sun8i-t113s.dtsi
index c7181308ae6f..424f4a2487e2 100644
--- a/arch/arm/boot/dts/allwinner/sun8i-t113s.dtsi
+++ b/arch/arm/boot/dts/allwinner/sun8i-t113s.dtsi
@@ -4,6 +4,7 @@
 #define SOC_PERIPHERAL_IRQ(nr) GIC_SPI nr
 
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/thermal/thermal.h>
 #include <riscv/allwinner/sunxi-d1s-t113.dtsi>
 #include <riscv/allwinner/sunxi-d1-t113.dtsi>
 
@@ -20,6 +21,7 @@ cpu0: cpu@0 {
 			reg = <0>;
 			clocks = <&ccu CLK_CPUX>;
 			clock-names = "cpu";
+			#cooling-cells = <2>;
 		};
 
 		cpu1: cpu@1 {
@@ -28,6 +30,7 @@ cpu1: cpu@1 {
 			reg = <1>;
 			clocks = <&ccu CLK_CPUX>;
 			clock-names = "cpu";
+			#cooling-cells = <2>;
 		};
 	};
 
@@ -56,4 +59,34 @@ pmu {
 			     <GIC_SPI 173 IRQ_TYPE_LEVEL_HIGH>;
 		interrupt-affinity = <&cpu0>, <&cpu1>;
 	};
+
+	thermal-zones {
+		cpu-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&ths>;
+
+			cooling-maps {
+				map0 {
+					trip = <&cpu_alert>;
+					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+
+			trips {
+				cpu_alert: cpu-alert {
+					temperature = <85000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu-crit {
+					temperature = <100000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+	};
 };
diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi b/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
index a7442a508433..3f4ee820ef56 100644
--- a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
+++ b/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
@@ -1,6 +1,8 @@
 // SPDX-License-Identifier: (GPL-2.0+ OR MIT)
 // Copyright (C) 2021-2022 Samuel Holland <samuel@sholland.org>
 
+#include <dt-bindings/thermal/thermal.h>
+
 #define SOC_PERIPHERAL_IRQ(nr)	(nr + 16)
 
 #include "sunxi-d1s-t113.dtsi"
@@ -115,4 +117,33 @@ pmu {
 			<0x00000000 0x0000000e 0xffffffff 0xffffffff 0x00010000>,
 			<0x00000000 0x0000000f 0xffffffff 0xffffffff 0x00020000>;
 	};
+
+	thermal-zones {
+		cpu-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&ths>;
+
+			cooling-maps {
+				map0 {
+					trip = <&cpu_alert>;
+					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+
+			trips {
+				cpu_alert: cpu-alert {
+					temperature = <85000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu-crit {
+					temperature = <100000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+	};
 };
diff --git a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
index 63e252b44973..ef7ebeab21ea 100644
--- a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
+++ b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
@@ -214,6 +214,18 @@ gpadc: adc@2009000 {
 			#io-channel-cells = <1>;
 		};
 
+		ths: thermal-sensor@2009400 {
+			compatible = "allwinner,sun20i-d1-ths";
+			reg = <0x2009400 0x400>;
+			interrupts = <SOC_PERIPHERAL_IRQ(58) IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_THS>;
+			clock-names = "bus";
+			resets = <&ccu RST_BUS_THS>;
+			nvmem-cells = <&ths_calibration>;
+			nvmem-cell-names = "calibration";
+			#thermal-sensor-cells = <0>;
+		};
+
 		dmic: dmic@2031000 {
 			compatible = "allwinner,sun20i-d1-dmic",
 				     "allwinner,sun50i-h6-dmic";
@@ -474,6 +486,10 @@ sid: efuse@3006000 {
 			reg = <0x3006000 0x1000>;
 			#address-cells = <1>;
 			#size-cells = <1>;
+
+			ths_calibration: thermal-sensor-calibration@14 {
+				reg = <0x14 0x8>;
+			};
 		};
 
 		crypto: crypto@3040000 {
-- 
2.47.3



