Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CF11C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Jul 2025 07:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vq7gy5nQxsQuljOk7mn0HP7Jn24hnv3mEkkxpZ10O5s=; b=AJlWDaF+RMF2msN3e8lDsQTlIS
	6ggIEpcUW9z1LP4QjdfL+/hINiAPzAtfHuWVMFHFLrFurk+PMD1m+ebh21pRbflgKiLbAZQNIuuu/
	rBICRkNpRtmdTqLjpeIvlymTJDtGT4Kj9gGjQQobC6J3siOzmOoda47I7BBNab+tgLk7CSQsd/i+j
	FB6vJIirBRTPSqC2aQ4K/4yKv1ce0N3uBgCyQHiTMW+iX6Z0PrBvkFZh+Z7xEhuvHTlH7yq8rJzMy
	1/S3Z50vhB66P6awYM1R3lOLHEy3OVw8+LvvuN1wESSqBG/ZeH8gcQUGi36cCp71bECDPU4HDVUzr
	v8u+guUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaV2Z-0000000GNgX-46fs;
	Sat, 12 Jul 2025 07:52:59 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaUql-0000000GMlg-2p8U
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Jul 2025 07:40:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2C763A544E1;
	Sat, 12 Jul 2025 07:40:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C6A2C4CEF4;
	Sat, 12 Jul 2025 07:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752306045;
	bh=Q6nAgSUeScunA7Cy3L5NXY072V+uXnej/Z2sR3Zl66U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jK0Zw/U0hjtPWLjojRMurFzl7NBY1lwGSl9bxABYDqnkVy49Y5AbPiq4vmbQcnG0K
	 BVsnmuEznH36Y65UXGM1DHpmPfVhsnWf7gsNwoYpJY6DKr0HfgEnFc3dGOUaQs8A4t
	 kRRa7VKcYRwAQd4M0XIumlRD2KkooOc1PB7uGzkEzIZyKeCkEBjLjnM9JfaMkdzvQ8
	 Ick0/v0ciqMHuVAMKHGmxd3IOvHnsV4vNmamV/UEITLvKYeVbFPsfhQo2ZYj4Tki7T
	 E/9zs0IdmvmhPs85b+SXWaX5y7K2qCAJ+9zl6Mlwr26Lej9Eiu5XFO66612y46Tlq1
	 t4F1KIvEqCIrg==
Received: by wens.tw (Postfix, from userid 1000)
	id 9ED7D5FB60; Sat, 12 Jul 2025 15:40:42 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Andre Przywara <andre.przywara@arm.com>,
	linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH v3 5/5] arm64: dts: allwinner: a523: Add power controller device nodes
Date: Sat, 12 Jul 2025 15:40:21 +0800
Message-Id: <20250712074021.805953-6-wens@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250712074021.805953-1-wens@kernel.org>
References: <20250712074021.805953-1-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250712_004047_774662_26F23949 
X-CRM114-Status: GOOD (  11.38  )
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

The A523 SoC family has two power controllers, one based on the existing
PPU, and one newer one based on ARM's PCK-600.

Add device nodes for both of them.

Reviewed-by: Andre Przywara <andre.przywara@arm.com>
Signed-off-by: Chen-Yu Tsai <wens@csie.org>

---
Changes since v2:
- Fixed pck-600 header path
---
 arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
index cf0bc39aab04..2ac6580b2497 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
@@ -7,6 +7,8 @@
 #include <dt-bindings/clock/sun55i-a523-r-ccu.h>
 #include <dt-bindings/reset/sun55i-a523-ccu.h>
 #include <dt-bindings/reset/sun55i-a523-r-ccu.h>
+#include <dt-bindings/power/allwinner,sun55i-a523-ppu.h>
+#include <dt-bindings/power/allwinner,sun55i-a523-pck-600.h>
 
 / {
 	interrupt-parent = <&gic>;
@@ -576,6 +578,14 @@ mdio0: mdio {
 			};
 		};
 
+		ppu: power-controller@7001400 {
+			compatible = "allwinner,sun55i-a523-ppu";
+			reg = <0x07001400 0x400>;
+			clocks = <&r_ccu CLK_BUS_R_PPU1>;
+			resets = <&r_ccu RST_BUS_R_PPU1>;
+			#power-domain-cells = <1>;
+		};
+
 		r_ccu: clock-controller@7010000 {
 			compatible = "allwinner,sun55i-a523-r-ccu";
 			reg = <0x7010000 0x250>;
@@ -622,6 +632,14 @@ r_i2c_pins: r-i2c-pins {
 			};
 		};
 
+		pck600: power-controller@7060000 {
+			compatible = "allwinner,sun55i-a523-pck-600";
+			reg = <0x07060000 0x8000>;
+			clocks = <&r_ccu CLK_BUS_R_PPU0>;
+			resets = <&r_ccu RST_BUS_R_PPU0>;
+			#power-domain-cells = <1>;
+		};
+
 		r_i2c0: i2c@7081400 {
 			compatible = "allwinner,sun55i-a523-i2c",
 				     "allwinner,sun8i-v536-i2c",
-- 
2.39.5


