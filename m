Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D273310987A9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 16:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N8yiiAhlu3luDN5GFHiYB80TQdq9vh4IaR8nS3COGi8=; b=HFqevQP61a/kwCYe/DRsy+K6t4
	MXiZNC2rkps1bELgWlkb1T0wAVI6WQSby8Q+O+SPbPyFMpeh9Yk0bypVyv5kO95tvKkjkaIzSiKdV
	etLDGt2WrYzcDBEOrpkLaCsEp05BrTXJZ94fFAjSYMfFhIUSez4g3GkACZnV75gnpPxbixRo8qpcU
	XqTsOkNaJWyUI4ZPqN63MqTL266JMUioh0kZNF64FQ5cTj7Ja8y/hwtMZ+2owEPoGW2eNiw9ZYdkX
	7XrnmtWOk+1mm4sNO8dYxw4/Nb5HU94IrSPpQKuz6AZGvbYqGT9v+G2trNZjV451FsYZqU0Kuepi1
	LQ+1XKJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3d0h-0000000DBbG-1eYz;
	Fri, 20 Mar 2026 16:47:43 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3d0d-0000000DBWw-1ilp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 16:47:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1FDF24398E;
	Fri, 20 Mar 2026 16:47:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC151C4CEF7;
	Fri, 20 Mar 2026 16:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774025259;
	bh=Jfx0Fsvzz4Z6n6+m6jipZ+hJb8968gAtSbrKrHZMyAE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=YBtnrY8L3oIHbXjfd01SOf8UaHSrAfFf7eZE/bKnS74AuwaZaWjx2oJKvX1DhJ9ej
	 y+tHKPjx0/L7gyPe6jiJTSYW9ADdp/vQq7tFHSTuDkZbnHvG3voieqFz0j2t9UP7Um
	 K18tGWBNnNqAHO9NqVuHGCSEVbWPfBTJa3kZ4FHXt+Iqz1a+dj4EVMXnAYjHG6P5Oh
	 fD/iHAoFnz0sDuTyyyzjHNBCypHt3rZv00QUU7RqZj8vkAmGqLi5vcV8TCH1cJX9aQ
	 1bILUREgvCtt0AI6va+gDobtRmi+SaFF7x/8mwnEV9pkA93uZGJMycFdN4CGgukXDz
	 MIlnJPggRZQvA==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Fri, 20 Mar 2026 11:47:17 -0500
Subject: [PATCH 4/5] arm64: dts: arm/corstone1000: Move FVP peripherals to
 separate .dtsi
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260320-dt-corstone1000-a320-v1-4-a549dfcfe8da@kernel.org>
References: <20260320-dt-corstone1000-a320-v1-0-a549dfcfe8da@kernel.org>
In-Reply-To: <20260320-dt-corstone1000-a320-v1-0-a549dfcfe8da@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>, 
 Sudeep Holla <sudeep.holla@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Frazer Carsley <frazer.carsley@arm.com>, 
 Hugues Kamba Mpiana <hugues.kambampiana@arm.com>, 
 Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.15-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_094739_495646_5323A0ED 
X-CRM114-Status: GOOD (  12.11  )
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

The FVPs have a common set of peripherals specific to the FVP. Move
these to a separate .dtsi so they can be shared across FVP platforms.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 arch/arm64/boot/dts/arm/corstone1000-fvp.dts  | 36 +---------------------
 arch/arm64/boot/dts/arm/corstone1000-fvp.dtsi | 44 +++++++++++++++++++++++++++
 2 files changed, 45 insertions(+), 35 deletions(-)

diff --git a/arch/arm64/boot/dts/arm/corstone1000-fvp.dts b/arch/arm64/boot/dts/arm/corstone1000-fvp.dts
index e479c79c1ea7..fac0999b1901 100644
--- a/arch/arm64/boot/dts/arm/corstone1000-fvp.dts
+++ b/arch/arm64/boot/dts/arm/corstone1000-fvp.dts
@@ -8,46 +8,12 @@
 /dts-v1/;
 
 #include "corstone1000.dtsi"
+#include "corstone1000-fvp.dtsi"
 
 / {
 	model = "ARM Corstone1000 FVP (Fixed Virtual Platform)";
 	compatible = "arm,corstone1000-fvp";
 
-	smsc: ethernet@4010000 {
-		compatible = "smsc,lan91c111";
-		reg = <0x40100000 0x10000>;
-		phy-mode = "mii";
-		interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>;
-		reg-io-width = <2>;
-	};
-
-	vmmc_v3_3d: regulator-vmmc {
-		compatible = "regulator-fixed";
-		regulator-name = "vmmc_supply";
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-		regulator-always-on;
-	};
-
-	sdmmc0: mmc@40300000 {
-		compatible = "arm,pl18x", "arm,primecell";
-		reg = <0x40300000 0x1000>;
-		interrupts = <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>;
-		max-frequency = <12000000>;
-		vmmc-supply = <&vmmc_v3_3d>;
-		clocks = <&smbclk>, <&refclk100mhz>;
-		clock-names = "smclk", "apb_pclk";
-	};
-
-	sdmmc1: mmc@50000000 {
-		compatible = "arm,pl18x", "arm,primecell";
-		reg = <0x50000000 0x10000>;
-		interrupts = <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>;
-		max-frequency = <12000000>;
-		vmmc-supply = <&vmmc_v3_3d>;
-		clocks = <&smbclk>, <&refclk100mhz>;
-		clock-names = "smclk", "apb_pclk";
-	};
 	cpus: cpus {
 		#address-cells = <2>;
 		#size-cells = <0>;
diff --git a/arch/arm64/boot/dts/arm/corstone1000-fvp.dtsi b/arch/arm64/boot/dts/arm/corstone1000-fvp.dtsi
new file mode 100644
index 000000000000..dc6d77446e8f
--- /dev/null
+++ b/arch/arm64/boot/dts/arm/corstone1000-fvp.dtsi
@@ -0,0 +1,44 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+/*
+ * Copyright (c) 2022, Arm Limited. All rights reserved.
+ * Copyright (c) 2022, Linaro Limited. All rights reserved.
+ *
+ */
+
+/ {
+	smsc: ethernet@4010000 {
+		compatible = "smsc,lan91c111";
+		reg = <0x40100000 0x10000>;
+		phy-mode = "mii";
+		interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>;
+		reg-io-width = <2>;
+	};
+
+	vmmc_v3_3d: regulator-vmmc {
+		compatible = "regulator-fixed";
+		regulator-name = "vmmc_supply";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
+
+	sdmmc0: mmc@40300000 {
+		compatible = "arm,pl18x", "arm,primecell";
+		reg = <0x40300000 0x1000>;
+		interrupts = <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>;
+		max-frequency = <12000000>;
+		vmmc-supply = <&vmmc_v3_3d>;
+		clocks = <&smbclk>, <&refclk100mhz>;
+		clock-names = "smclk", "apb_pclk";
+	};
+
+	sdmmc1: mmc@50000000 {
+		compatible = "arm,pl18x", "arm,primecell";
+		reg = <0x50000000 0x10000>;
+		interrupts = <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>;
+		max-frequency = <12000000>;
+		vmmc-supply = <&vmmc_v3_3d>;
+		clocks = <&smbclk>, <&refclk100mhz>;
+		clock-names = "smclk", "apb_pclk";
+	};
+};

-- 
2.51.0


