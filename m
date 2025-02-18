Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59C4BC021AA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 02:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5AA+a4IxbsmGiRmLLlpgl3OVaLWtMwq00DaT2+GNKdU=; b=wNCD4BHGDpbNYB5tft4GiNNp/s
	3Pv5XHYwLc0xx4UP3+5Bb23eBYFtSGqp7jQnXMvXg0+zJ7PGTagHffjPt1mIfJVELWRBbxOKZ3f+G
	K0vudfbpf9UmRiGsVrDGOXmD/kCKkABQDzA+rGDmGe8ULr+XHoYgcJ+to8QHcitA0L8MqEdaocPsa
	+AEdX+nywISCw1XFMcLy1+ZwklI50IvwDfmXQmIHnOJbYJ2aHf0ylirpk0nXBW5O3k7mJqEvb/uiK
	LqKjdb4ZmrzFwOGbVKmiHBb8lPWlzrZcKoYSPHS+jn4pL5oendg+guh6oEzF4vvP5QBStNEbIpdt3
	lfztI1Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkD4C-00000006UgC-2UEn;
	Tue, 18 Feb 2025 02:10:32 +0000
Received: from mail-b.studer.dev ([3.21.136.164])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkD2j-00000006URm-1i0m;
	Tue, 18 Feb 2025 02:09:02 +0000
Received: from mail.studer.dev (mail.studer.dev [168.62.161.121])
	by mail-b.studer.dev (Postfix) with ESMTPSA id 0913840028;
	Tue, 18 Feb 2025 02:08:58 +0000 (UTC)
dkim-signature: v=1; a=rsa-sha256; d=studer.dev; s=hmail;
	c=relaxed/relaxed; q=dns/txt; h=From:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Transfer-Encoding;
	bh=5AA+a4IxbsmGiRmLLlpgl3OVaLWtMwq00DaT2+GNKdU=;
	b=pJHRuUoirhakSXgBVi1wAqvRu8P4O5UhqKep0hqV2Xm+WPpeDjpMf3G2SiBDyTQhaAaDOfdFtTYMEPzp399MtvTka7gVjb6ZBsbCbBJaMrgKXEXbAGHz0hAhcftTB8Xud/hBqZeqB073X/MIdu4SF8SNzXmNiQ0do5RANUV+/rJkWqsCAuskK5ao+8lcCEQFsUQS3wWnBNUzP5CGZttjyshujt4jXO4/rfTzMVM/tuGw+Sw7BGTlPw0AH2
	lHGT6PIWkXU98F36Tl8JlhswCK38SkV9nb58J1kGjYtkq8+iQ6II+Dc441In2meOCQfjINh3wYQSJ1yFwKP4iRZMbXmA==
Received: from alex-framework.mynetworksettings.com (pool-68-239-44-167.bstnma.fios.verizon.net [68.239.44.167])
	by mail.studer.dev with ESMTPSA
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256)
	; Tue, 18 Feb 2025 02:08:55 +0000
From: Alex Studer <alex@studer.dev>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Alex Studer <alex@studer.dev>
Subject: [PATCH] riscv: dts: allwinner: d1: Add CPU thermal sensor and zone
Date: Mon, 17 Feb 2025 21:06:29 -0500
Message-ID: <20250218020629.1476126-1-alex@studer.dev>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_180901_519095_505B5375 
X-CRM114-Status: GOOD (  10.96  )
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

The sun20i THS (built in CPU thermal sensor) is supported in code, but
was never added to the device tree. So, add it to the device tree,
along with a thermal zone for the CPU.

Signed-off-by: Alex Studer <alex@studer.dev>
---
 arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi | 31 +++++++++++++++++++
 .../boot/dts/allwinner/sunxi-d1s-t113.dtsi    | 16 ++++++++++
 2 files changed, 47 insertions(+)

diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi b/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
index 6367112e6..bdde82aa8 100644
--- a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
+++ b/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
@@ -3,6 +3,8 @@
 
 #define SOC_PERIPHERAL_IRQ(nr)	(nr + 16)
 
+#include <dt-bindings/thermal/thermal.h>
+
 #include "sunxi-d1s-t113.dtsi"
 
 / {
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
index e4175adb0..fcfcaf06c 100644
--- a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
+++ b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
@@ -426,6 +426,10 @@ sid: efuse@3006000 {
 			reg = <0x3006000 0x1000>;
 			#address-cells = <1>;
 			#size-cells = <1>;
+
+			ths_calibration: thermal-sensor-calibration@14 {
+				reg = <0x14 0x8>;
+			};
 		};
 
 		crypto: crypto@3040000 {
@@ -934,5 +938,17 @@ rtc: rtc@7090000 {
 			clock-names = "bus", "hosc", "ahb";
 			#clock-cells = <1>;
 		};
+
+		ths: thermal-sensor@2009400 {
+			compatible = "allwinner,sun20i-d1-ths";
+			reg = <0x2009400 0x100>;
+			interrupts = <SOC_PERIPHERAL_IRQ(58) IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_THS>;
+			clock-names = "bus";
+			resets = <&ccu RST_BUS_THS>;
+			nvmem-cells = <&ths_calibration>;
+			nvmem-cell-names = "calibration";
+			#thermal-sensor-cells = <0>;
+		};
 	};
 };
-- 
2.48.1



