Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC05CE6F07E
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  2 Nov 2024 03:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ULWUQV2euOeJnEAJ3CyxZrGsfmuHWmE0j0muWaOqgrQ=; b=AN/mAWHXGrHs11Q0i6lgs6nt7+
	AY8FIYxiEgMVpMKguPsm/IGPn5FzWYE7rvL+Z6C1eMBEyPqgMYFepTpZ1SdfjwTbBWn/81Vw4Y3Nj
	q1uv8IHS5Ly1U7D31HulBc0psErqSnLL7fh06TipjarQt0T5FnJOaYSPF1zMcGDQ4kwHZkOLbj/4W
	clFuaWsu4j9H9R69pESOATUTxbxvoi/Q0GvyqiNv/odRHtrHrJMxRtUmwOfYUt16lrHbAnUbksiYj
	DtA5qVbTEMpR7v2uWNhatygxxVoyaDT5oed6/NFBZCq7ogzxVGLIEIZMHGYntE3WzNqYxiWwccxxL
	tyPr69Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t74ax-00000008w1E-1pEo;
	Sat, 02 Nov 2024 03:14:35 +0000
Received: from mail.manjaro.org ([2a01:4f8:c0c:51f3::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t74Vz-00000008vSy-3QmJ;
	Sat, 02 Nov 2024 03:09:31 +0000
From: Dragan Simic <dsimic@manjaro.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1730516958;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ULWUQV2euOeJnEAJ3CyxZrGsfmuHWmE0j0muWaOqgrQ=;
	b=WK6owBrL+0sFVsFZHUFDd9/PO+J6TGgQR0g2+EyEyo4l3SaN+0G4WMosbdezAmNunoD7s8
	Tlne6ENA0gkB21AazsUunrvVZxqGNmyEzVhZ62SlDytVN/M7Eb79c+bjGwEzXl4S3NfpYx
	jLwG7c/7Qc6vXBAUGt6QlHGfgiOeP0KQS8YXW/EYJ4lSU2Ew48CFytktHFH3AeRcwGi+rD
	NGF0oSCP6GkIFGiXkI0s7kWPXC9PrOdGA3Pqjqiazrp3Gnsyrey8c6UnWvCfQ2QP9eesrp
	JLtA0NWDZmAxfhnxZFE+TMggaDS/g10WCaysInzRG8N+90Pfeigd6RNLZY+JBA==
To: linux-rockchip@lists.infradead.org
Cc: heiko@sntech.de,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	didi.debian@cknow.org
Subject: [PATCH v2 2/3] arm64: dts: rockchip: Prepare RK356x SoC dtsi files for per-variant OPPs
Date: Sat,  2 Nov 2024 04:09:00 +0100
Message-Id: <77e7450b8280bbdf4e2dc47366c9da85d4d8d1de.1730516702.git.dsimic@manjaro.org>
In-Reply-To: <cover.1730516702.git.dsimic@manjaro.org>
References: <cover.1730516702.git.dsimic@manjaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_200928_189196_B34359FF 
X-CRM114-Status: GOOD (  16.02  )
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

Rename the Rockchip RK356x SoC dtsi files and, consequently, adjust their
contents appropriately, to prepare them for the ability to specify different
CPU and GPU OPPs for each of the supported RK356x SoC variants.

The first new RK356x SoC variant to be introduced is the RK3566T, which the
Pine64 Quartz64 Zero SBC is officially based on. [1]  Some other SBCs are
also based on the RK3566T variant, including Radxa ROCK 3C and ZERO 3E/3W,
but the slight trouble is that Radxa doesn't state that officially.  Though,
it's rather easy to spot the RK3566T on such boards, because their official
specifications state that the maximum frequency for the Cortex-A55 cores is
lower than the "full-fat" RK3566's 1.8 GHz. [2][3][4]

These changes follow the approach used for the Rockchip RK3588 SoC variants,
which was introduced and described further in commit def88eb4d836 ("arm64:
dts: rockchip: Prepare RK3588 SoC dtsi files for per-variant OPPs").  Please
see that commit for a more detailed explanation.

No functional changes are introduced, which was validated by decompiling and
comparing all affected board dtb files before and after these changes.  In
more detail, the affected dtb files have some of their blocks shuffled around
a bit and some of their phandles have different values, as a result of the
changes to the order in which the building blocks from the parent dtsi files
are included, but they effectively remain the same as the originals.

As a side note, due to the nature of introduced changes, this commit is a bit
more readable when viewed using the --break-rewrites option for git-log(1).

[1] https://wiki.pine64.org/wiki/Quartz64
[2] https://dl.radxa.com/rock3/docs/hw/3c/radxa_rock3c_product_brief.pdf
[3] https://dl.radxa.com/zero3/docs/hw/3e/radxa_zero_3e_product_brief.pdf
[4] https://dl.radxa.com/zero3/docs/hw/3w/radxa_zero_3w_product_brief.pdf

Related-to: def88eb4d836 ("arm64: dts: rockchip: Prepare RK3588 SoC dtsi files for per-variant OPPs")
Signed-off-by: Dragan Simic <dsimic@manjaro.org>
---
 .../{rk3566.dtsi => rk3566-base.dtsi}         |   2 +-
 arch/arm64/boot/dts/rockchip/rk3566.dtsi      | 142 +++++++++++++-----
 arch/arm64/boot/dts/rockchip/rk3568.dtsi      | 114 +++++++++++++-
 .../{rk356x.dtsi => rk356x-base.dtsi}         |  87 -----------
 4 files changed, 215 insertions(+), 130 deletions(-)
 copy arch/arm64/boot/dts/rockchip/{rk3566.dtsi => rk3566-base.dtsi} (95%)
 rewrite arch/arm64/boot/dts/rockchip/rk3566.dtsi (87%)
 rename arch/arm64/boot/dts/rockchip/{rk356x.dtsi => rk356x-base.dtsi} (96%)

diff --git a/arch/arm64/boot/dts/rockchip/rk3566.dtsi b/arch/arm64/boot/dts/rockchip/rk3566-base.dtsi
similarity index 95%
copy from arch/arm64/boot/dts/rockchip/rk3566.dtsi
copy to arch/arm64/boot/dts/rockchip/rk3566-base.dtsi
index 6c4b17d27bdc..e56e0b6ba941 100644
--- a/arch/arm64/boot/dts/rockchip/rk3566.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3566-base.dtsi
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: (GPL-2.0+ OR MIT)
 
-#include "rk356x.dtsi"
+#include "rk356x-base.dtsi"
 
 / {
 	compatible = "rockchip,rk3566";
diff --git a/arch/arm64/boot/dts/rockchip/rk3566.dtsi b/arch/arm64/boot/dts/rockchip/rk3566.dtsi
dissimilarity index 87%
index 6c4b17d27bdc..3fcca79279f7 100644
--- a/arch/arm64/boot/dts/rockchip/rk3566.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3566.dtsi
@@ -1,35 +1,107 @@
-// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
-
-#include "rk356x.dtsi"
-
-/ {
-	compatible = "rockchip,rk3566";
-};
-
-&pipegrf {
-	compatible = "rockchip,rk3566-pipe-grf", "syscon";
-};
-
-&power {
-	power-domain@RK3568_PD_PIPE {
-		reg = <RK3568_PD_PIPE>;
-		clocks = <&cru PCLK_PIPE>;
-		pm_qos = <&qos_pcie2x1>,
-			 <&qos_sata1>,
-			 <&qos_sata2>,
-			 <&qos_usb3_0>,
-			 <&qos_usb3_1>;
-		#power-domain-cells = <0>;
-	};
-};
-
-&usb_host0_xhci {
-	phys = <&usb2phy0_otg>;
-	phy-names = "usb2-phy";
-	extcon = <&usb2phy0>;
-	maximum-speed = "high-speed";
-};
-
-&vop {
-	compatible = "rockchip,rk3566-vop";
-};
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+
+#include "rk3566-base.dtsi"
+
+/ {
+	cpu0_opp_table: opp-table-0 {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp-408000000 {
+			opp-hz = /bits/ 64 <408000000>;
+			opp-microvolt = <850000 850000 1150000>;
+			clock-latency-ns = <40000>;
+		};
+
+		opp-600000000 {
+			opp-hz = /bits/ 64 <600000000>;
+			opp-microvolt = <850000 850000 1150000>;
+			clock-latency-ns = <40000>;
+		};
+
+		opp-816000000 {
+			opp-hz = /bits/ 64 <816000000>;
+			opp-microvolt = <850000 850000 1150000>;
+			clock-latency-ns = <40000>;
+			opp-suspend;
+		};
+
+		opp-1104000000 {
+			opp-hz = /bits/ 64 <1104000000>;
+			opp-microvolt = <900000 900000 1150000>;
+			clock-latency-ns = <40000>;
+		};
+
+		opp-1416000000 {
+			opp-hz = /bits/ 64 <1416000000>;
+			opp-microvolt = <1025000 1025000 1150000>;
+			clock-latency-ns = <40000>;
+		};
+
+		opp-1608000000 {
+			opp-hz = /bits/ 64 <1608000000>;
+			opp-microvolt = <1100000 1100000 1150000>;
+			clock-latency-ns = <40000>;
+		};
+
+		opp-1800000000 {
+			opp-hz = /bits/ 64 <1800000000>;
+			opp-microvolt = <1150000 1150000 1150000>;
+			clock-latency-ns = <40000>;
+		};
+	};
+
+	gpu_opp_table: opp-table-1 {
+		compatible = "operating-points-v2";
+
+		opp-200000000 {
+			opp-hz = /bits/ 64 <200000000>;
+			opp-microvolt = <850000 850000 1000000>;
+		};
+
+		opp-300000000 {
+			opp-hz = /bits/ 64 <300000000>;
+			opp-microvolt = <850000 850000 1000000>;
+		};
+
+		opp-400000000 {
+			opp-hz = /bits/ 64 <400000000>;
+			opp-microvolt = <850000 850000 1000000>;
+		};
+
+		opp-600000000 {
+			opp-hz = /bits/ 64 <600000000>;
+			opp-microvolt = <900000 900000 1000000>;
+		};
+
+		opp-700000000 {
+			opp-hz = /bits/ 64 <700000000>;
+			opp-microvolt = <950000 950000 1000000>;
+		};
+
+		opp-800000000 {
+			opp-hz = /bits/ 64 <800000000>;
+			opp-microvolt = <1000000 1000000 1000000>;
+		};
+	};
+};
+
+&cpu0 {
+	operating-points-v2 = <&cpu0_opp_table>;
+};
+
+&cpu1 {
+	operating-points-v2 = <&cpu0_opp_table>;
+};
+
+&cpu2 {
+	operating-points-v2 = <&cpu0_opp_table>;
+};
+
+&cpu3 {
+	operating-points-v2 = <&cpu0_opp_table>;
+};
+
+&gpu {
+	operating-points-v2 = <&gpu_opp_table>;
+};
diff --git a/arch/arm64/boot/dts/rockchip/rk3568.dtsi b/arch/arm64/boot/dts/rockchip/rk3568.dtsi
index 5c54898f6ed1..ecaefe208e3e 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3568.dtsi
@@ -3,11 +3,99 @@
  * Copyright (c) 2021 Rockchip Electronics Co., Ltd.
  */
 
-#include "rk356x.dtsi"
+#include "rk356x-base.dtsi"
 
 / {
 	compatible = "rockchip,rk3568";
 
+	cpu0_opp_table: opp-table-0 {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp-408000000 {
+			opp-hz = /bits/ 64 <408000000>;
+			opp-microvolt = <850000 850000 1150000>;
+			clock-latency-ns = <40000>;
+		};
+
+		opp-600000000 {
+			opp-hz = /bits/ 64 <600000000>;
+			opp-microvolt = <850000 850000 1150000>;
+			clock-latency-ns = <40000>;
+		};
+
+		opp-816000000 {
+			opp-hz = /bits/ 64 <816000000>;
+			opp-microvolt = <850000 850000 1150000>;
+			clock-latency-ns = <40000>;
+			opp-suspend;
+		};
+
+		opp-1104000000 {
+			opp-hz = /bits/ 64 <1104000000>;
+			opp-microvolt = <900000 900000 1150000>;
+			clock-latency-ns = <40000>;
+		};
+
+		opp-1416000000 {
+			opp-hz = /bits/ 64 <1416000000>;
+			opp-microvolt = <1025000 1025000 1150000>;
+			clock-latency-ns = <40000>;
+		};
+
+		opp-1608000000 {
+			opp-hz = /bits/ 64 <1608000000>;
+			opp-microvolt = <1100000 1100000 1150000>;
+			clock-latency-ns = <40000>;
+		};
+
+		opp-1800000000 {
+			opp-hz = /bits/ 64 <1800000000>;
+			opp-microvolt = <1150000 1150000 1150000>;
+			clock-latency-ns = <40000>;
+		};
+
+		opp-1992000000 {
+			opp-hz = /bits/ 64 <1992000000>;
+			opp-microvolt = <1150000 1150000 1150000>;
+			clock-latency-ns = <40000>;
+		};
+	};
+
+	gpu_opp_table: opp-table-1 {
+		compatible = "operating-points-v2";
+
+		opp-200000000 {
+			opp-hz = /bits/ 64 <200000000>;
+			opp-microvolt = <850000 850000 1000000>;
+		};
+
+		opp-300000000 {
+			opp-hz = /bits/ 64 <300000000>;
+			opp-microvolt = <850000 850000 1000000>;
+		};
+
+		opp-400000000 {
+			opp-hz = /bits/ 64 <400000000>;
+			opp-microvolt = <850000 850000 1000000>;
+		};
+
+		opp-600000000 {
+			opp-hz = /bits/ 64 <600000000>;
+			opp-microvolt = <900000 900000 1000000>;
+		};
+
+		opp-700000000 {
+			opp-hz = /bits/ 64 <700000000>;
+			opp-microvolt = <950000 950000 1000000>;
+		};
+
+		opp-800000000 {
+			opp-hz = /bits/ 64 <800000000>;
+			opp-microvolt = <1000000 1000000 1000000>;
+		};
+	};
+
 	sata0: sata@fc000000 {
 		compatible = "rockchip,rk3568-dwc-ahci", "snps,dwc-ahci";
 		reg = <0 0xfc000000 0 0x1000>;
@@ -269,12 +357,24 @@ combphy0: phy@fe820000 {
 	};
 };
 
-&cpu0_opp_table {
-	opp-1992000000 {
-		opp-hz = /bits/ 64 <1992000000>;
-		opp-microvolt = <1150000 1150000 1150000>;
-		clock-latency-ns = <40000>;
-	};
+&cpu0 {
+	operating-points-v2 = <&cpu0_opp_table>;
+};
+
+&cpu1 {
+	operating-points-v2 = <&cpu0_opp_table>;
+};
+
+&cpu2 {
+	operating-points-v2 = <&cpu0_opp_table>;
+};
+
+&cpu3 {
+	operating-points-v2 = <&cpu0_opp_table>;
+};
+
+&gpu {
+	operating-points-v2 = <&gpu_opp_table>;
 };
 
 &pipegrf {
diff --git a/arch/arm64/boot/dts/rockchip/rk356x.dtsi b/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
similarity index 96%
rename from arch/arm64/boot/dts/rockchip/rk356x.dtsi
rename to arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
index 534593f2ed0b..62be06f3b863 100644
--- a/arch/arm64/boot/dts/rockchip/rk356x.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
@@ -56,7 +56,6 @@ cpu0: cpu@0 {
 			clocks = <&scmi_clk 0>;
 			#cooling-cells = <2>;
 			enable-method = "psci";
-			operating-points-v2 = <&cpu0_opp_table>;
 			i-cache-size = <0x8000>;
 			i-cache-line-size = <64>;
 			i-cache-sets = <128>;
@@ -72,7 +71,6 @@ cpu1: cpu@100 {
 			reg = <0x0 0x100>;
 			#cooling-cells = <2>;
 			enable-method = "psci";
-			operating-points-v2 = <&cpu0_opp_table>;
 			i-cache-size = <0x8000>;
 			i-cache-line-size = <64>;
 			i-cache-sets = <128>;
@@ -88,7 +86,6 @@ cpu2: cpu@200 {
 			reg = <0x0 0x200>;
 			#cooling-cells = <2>;
 			enable-method = "psci";
-			operating-points-v2 = <&cpu0_opp_table>;
 			i-cache-size = <0x8000>;
 			i-cache-line-size = <64>;
 			i-cache-sets = <128>;
@@ -104,7 +101,6 @@ cpu3: cpu@300 {
 			reg = <0x0 0x300>;
 			#cooling-cells = <2>;
 			enable-method = "psci";
-			operating-points-v2 = <&cpu0_opp_table>;
 			i-cache-size = <0x8000>;
 			i-cache-line-size = <64>;
 			i-cache-sets = <128>;
@@ -128,54 +124,6 @@ l3_cache: l3-cache {
 		cache-sets = <512>;
 	};
 
-	cpu0_opp_table: opp-table-0 {
-		compatible = "operating-points-v2";
-		opp-shared;
-
-		opp-408000000 {
-			opp-hz = /bits/ 64 <408000000>;
-			opp-microvolt = <850000 850000 1150000>;
-			clock-latency-ns = <40000>;
-		};
-
-		opp-600000000 {
-			opp-hz = /bits/ 64 <600000000>;
-			opp-microvolt = <850000 850000 1150000>;
-			clock-latency-ns = <40000>;
-		};
-
-		opp-816000000 {
-			opp-hz = /bits/ 64 <816000000>;
-			opp-microvolt = <850000 850000 1150000>;
-			clock-latency-ns = <40000>;
-			opp-suspend;
-		};
-
-		opp-1104000000 {
-			opp-hz = /bits/ 64 <1104000000>;
-			opp-microvolt = <900000 900000 1150000>;
-			clock-latency-ns = <40000>;
-		};
-
-		opp-1416000000 {
-			opp-hz = /bits/ 64 <1416000000>;
-			opp-microvolt = <1025000 1025000 1150000>;
-			clock-latency-ns = <40000>;
-		};
-
-		opp-1608000000 {
-			opp-hz = /bits/ 64 <1608000000>;
-			opp-microvolt = <1100000 1100000 1150000>;
-			clock-latency-ns = <40000>;
-		};
-
-		opp-1800000000 {
-			opp-hz = /bits/ 64 <1800000000>;
-			opp-microvolt = <1150000 1150000 1150000>;
-			clock-latency-ns = <40000>;
-		};
-	};
-
 	display_subsystem: display-subsystem {
 		compatible = "rockchip,display-subsystem";
 		ports = <&vop_out>;
@@ -196,40 +144,6 @@ scmi_clk: protocol@14 {
 		};
 	};
 
-	gpu_opp_table: opp-table-1 {
-		compatible = "operating-points-v2";
-
-		opp-200000000 {
-			opp-hz = /bits/ 64 <200000000>;
-			opp-microvolt = <850000 850000 1000000>;
-		};
-
-		opp-300000000 {
-			opp-hz = /bits/ 64 <300000000>;
-			opp-microvolt = <850000 850000 1000000>;
-		};
-
-		opp-400000000 {
-			opp-hz = /bits/ 64 <400000000>;
-			opp-microvolt = <850000 850000 1000000>;
-		};
-
-		opp-600000000 {
-			opp-hz = /bits/ 64 <600000000>;
-			opp-microvolt = <900000 900000 1000000>;
-		};
-
-		opp-700000000 {
-			opp-hz = /bits/ 64 <700000000>;
-			opp-microvolt = <950000 950000 1000000>;
-		};
-
-		opp-800000000 {
-			opp-hz = /bits/ 64 <800000000>;
-			opp-microvolt = <1000000 1000000 1000000>;
-		};
-	};
-
 	hdmi_sound: hdmi-sound {
 		compatible = "simple-audio-card";
 		simple-audio-card,name = "HDMI";
@@ -635,7 +549,6 @@ gpu: gpu@fde60000 {
 		clocks = <&scmi_clk 1>, <&cru CLK_GPU>;
 		clock-names = "gpu", "bus";
 		#cooling-cells = <2>;
-		operating-points-v2 = <&gpu_opp_table>;
 		power-domains = <&power RK3568_PD_GPU>;
 		status = "disabled";
 	};

