Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6349E68959
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 07:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GCnU0AlgJ+Xl/oJOwKlruR9Q0I8g/bm7rJ3CtcqHN2Q=; b=QSkTzwbQvzAxgb9omBwfJO7uem
	maC+Yq86DLqLDuLZUkDbM1DO98LU+TG6HbNS1t70bj0b5Fa2ZIzhPVoTQ71WAsm0sgBIqQlyVZC7y
	FDDt4ynOYMSXrNGubaUtPP8RZHF7e5sMyc2zV2zLlAtcS4ise7Qi+3hZ3JxBrNSJAb3L/9mhEd3US
	R9MKCDSpX7nT9jyHbcV6WbvO4/d69+CaL4UuspY8WONiJlFbLwAHJYBvBKOWtuPrBx734gMvlStmS
	6PEPY4YP2DX3wYl6gb80qIqywh+nxl/geG/EofWAk0L4nE3XYeC6ls5CK7OXmKQh5vEruydvpYaAh
	PtJktphA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6PVM-00000002nR1-1XKi;
	Thu, 31 Oct 2024 07:22:04 +0000
Received: from thales.epochal.quest ([51.222.15.28])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6PDO-00000002kVs-38G9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Oct 2024 07:03:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=epochal.quest;
	s=default; t=1730358209;
	bh=GAI+JxmxQAyxNiN5ndHrGW83jif5+/YkLkstTry27TU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YtMGcXQ1SID1v4pgdcEhkufRJU5/wJrIL+RPeDknvJHDNbNSCg10hAmPea+B/COhW
	 hNTRGGOCwQlISoewvbOqC5k7zQoOYNM7Xyc2PxoaKo7eDa6yNnZpoMX5iBTvUmFJHW
	 WWws924uIjCzjCdc/8NdWnOwcMcCRtg92jjtPYpqlgBXmor3uvD1Shzs0egMApqFQi
	 fJ/KMAM0h3Jw36XHCAOlD7HUWMuGiVD88CbsyXyC+jwwpsMRdk6e47Ls17qhL6u2zQ
	 S/5ldj9z9iX05LrBJfrBfolRrZwRUFKC3k0ur650DmGIzHn7OdDI75k/7SR+XA/Qrr
	 l/9NYcMCxWE6g==
X-Virus-Scanned: by epochal.quest
From: Cody Eksal <masterr3c0rd@epochal.quest>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Nishanth Menon <nm@ti.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Viresh Kumar <vireshk@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Yangtao Li <tiny.windzz@gmail.com>,
	Parthiban <parthiban@linumiz.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Cody Eksal <masterr3c0rd@epochal.quest>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 13/13] arm64: dts: allwinner: a100: Add CPU Operating Performance Points table
Date: Thu, 31 Oct 2024 04:02:26 -0300
Message-ID: <20241031070232.1793078-14-masterr3c0rd@epochal.quest>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241031070232.1793078-1-masterr3c0rd@epochal.quest>
References: <20241031070232.1793078-1-masterr3c0rd@epochal.quest>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_000331_154740_DF62B301 
X-CRM114-Status: GOOD (  13.66  )
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

From: Shuosheng Huang <huangshuosheng@allwinnertech.com>

Add an Operating Performance Points table for the CPU cores to
enable Dynamic Voltage & Frequency Scaling on the A100.

Signed-off-by: Shuosheng Huang <huangshuosheng@allwinnertech.com>
[masterr3c0rd@epochal.quest: fix typos in -cpu-opp, use compatible]
Signed-off-by: Cody Eksal <masterr3c0rd@epochal.quest>
---
Changes in V2:
 - Rename cpu-opp-table to opp-table-cpu
 - Use single cell version of opp-microvolt-speedX

 .../allwinner/sun50i-a100-allwinner-perf1.dts |  5 ++
 .../dts/allwinner/sun50i-a100-cpu-opp.dtsi    | 90 +++++++++++++++++++
 .../arm64/boot/dts/allwinner/sun50i-a100.dtsi |  8 ++
 3 files changed, 103 insertions(+)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-a100-cpu-opp.dtsi

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a100-allwinner-perf1.dts b/arch/arm64/boot/dts/allwinner/sun50i-a100-allwinner-perf1.dts
index d418fc272b3c..1fb629df9f1d 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a100-allwinner-perf1.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a100-allwinner-perf1.dts
@@ -6,6 +6,7 @@
 /dts-v1/;
 
 #include "sun50i-a100.dtsi"
+#include "sun50i-a100-cpu-opp.dtsi"
 
 #include <dt-bindings/gpio/gpio.h>
 
@@ -68,6 +69,10 @@ &usb_otg {
 	status = "okay";
 };
 
+&cpu0 {
+	cpu-supply = <&reg_dcdc2>;
+};
+
 &pio {
 	vcc-pb-supply = <&reg_dcdc1>;
 	vcc-pc-supply = <&reg_eldo1>;
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a100-cpu-opp.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a100-cpu-opp.dtsi
new file mode 100644
index 000000000000..c6a2efa037dc
--- /dev/null
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a100-cpu-opp.dtsi
@@ -0,0 +1,90 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+// Copyright (c) 2020 Yangtao Li <frank@allwinnertech.com>
+// Copyright (c) 2020 ShuoSheng Huang <huangshuosheng@allwinnertech.com>
+
+/ {
+	cpu_opp_table: opp-table-cpu {
+		compatible = "allwinner,sun50i-a100-operating-points";
+		nvmem-cells = <&cpu_speed_grade>;
+		opp-shared;
+
+		opp-408000000 {
+			clock-latency-ns = <244144>; /* 8 32k periods */
+			opp-hz = /bits/ 64 <408000000>;
+
+			opp-microvolt-speed0 = <900000>;
+			opp-microvolt-speed1 = <900000>;
+			opp-microvolt-speed2 = <900000>;
+		};
+
+		opp-600000000 {
+			clock-latency-ns = <244144>; /* 8 32k periods */
+			opp-hz = /bits/ 64 <600000000>;
+
+			opp-microvolt-speed0 = <900000>;
+			opp-microvolt-speed1 = <900000>;
+			opp-microvolt-speed2 = <900000>;
+		};
+
+		opp-816000000 {
+			clock-latency-ns = <244144>; /* 8 32k periods */
+			opp-hz = /bits/ 64 <816000000>;
+
+			opp-microvolt-speed0 = <940000>;
+			opp-microvolt-speed1 = <900000>;
+			opp-microvolt-speed2 = <900000>;
+		};
+
+		opp-1080000000 {
+			clock-latency-ns = <244144>; /* 8 32k periods */
+			opp-hz = /bits/ 64 <1080000000>;
+
+			opp-microvolt-speed0 = <1020000>;
+			opp-microvolt-speed1 = <980000>;
+			opp-microvolt-speed2 = <950000>;
+		};
+
+		opp-1200000000 {
+			clock-latency-ns = <244144>; /* 8 32k periods */
+			opp-hz = /bits/ 64 <1200000000>;
+
+			opp-microvolt-speed0 = <1100000>;
+			opp-microvolt-speed1 = <1020000>;
+			opp-microvolt-speed2 = <1000000>;
+		};
+
+		opp-1320000000 {
+			clock-latency-ns = <244144>; /* 8 32k periods */
+			opp-hz = /bits/ 64 <1320000000>;
+
+			opp-microvolt-speed0 = <1160000>;
+			opp-microvolt-speed1 = <1060000>;
+			opp-microvolt-speed2 = <1030000>;
+		};
+
+		opp-1464000000 {
+			clock-latency-ns = <244144>; /* 8 32k periods */
+			opp-hz = /bits/ 64 <1464000000>;
+
+			opp-microvolt-speed0 = <1180000>;
+			opp-microvolt-speed1 = <1180000>;
+			opp-microvolt-speed2 = <1130000>;
+		};
+	};
+};
+
+&cpu0 {
+	operating-points-v2 = <&cpu_opp_table>;
+};
+
+&cpu1 {
+	operating-points-v2 = <&cpu_opp_table>;
+};
+
+&cpu2 {
+	operating-points-v2 = <&cpu_opp_table>;
+};
+
+&cpu3 {
+	operating-points-v2 = <&cpu_opp_table>;
+};
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
index 29ac7716c7a5..6a76858b654a 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
@@ -23,6 +23,7 @@ cpu0: cpu@0 {
 			device_type = "cpu";
 			reg = <0x0>;
 			enable-method = "psci";
+			clocks = <&ccu CLK_CPUX>;
 		};
 
 		cpu1: cpu@1 {
@@ -30,6 +31,7 @@ cpu1: cpu@1 {
 			device_type = "cpu";
 			reg = <0x1>;
 			enable-method = "psci";
+			clocks = <&ccu CLK_CPUX>;
 		};
 
 		cpu2: cpu@2 {
@@ -37,6 +39,7 @@ cpu2: cpu@2 {
 			device_type = "cpu";
 			reg = <0x2>;
 			enable-method = "psci";
+			clocks = <&ccu CLK_CPUX>;
 		};
 
 		cpu3: cpu@3 {
@@ -44,6 +47,7 @@ cpu3: cpu@3 {
 			device_type = "cpu";
 			reg = <0x3>;
 			enable-method = "psci";
+			clocks = <&ccu CLK_CPUX>;
 		};
 	};
 
@@ -142,6 +146,10 @@ efuse@3006000 {
 			ths_calibration: calib@14 {
 				reg = <0x14 8>;
 			};
+
+			cpu_speed_grade: cpu-speed-grade@1c {
+				reg = <0x1c 0x2>;
+			};
 		};
 
 		watchdog@30090a0 {
-- 
2.47.0


