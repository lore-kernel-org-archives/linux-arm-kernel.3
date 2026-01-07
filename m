Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A482ACF6BE4
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 02:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DOs7j6FjCi8021LTsC+eoEo3aUFL7abb+ui/xf+ogrY=; b=cS+tVz1Jp02ia2B/DxLYBm7eLD
	wWXG51sta4YluzRB+WDc7orIOc5LKL025MGdYkl+7QRwO7owu8+20kKXYSUi4OiJ0LvTp2xYQAuyL
	fzI6ymFa28PZ8ZVBlSSYd1XKMqgQSpDWpdSXI/Rply5N3z8MwkVyJm67yImIXoxRfeyaH5lXB9Stj
	PjlO8hCJgsGXqXp48LjtDkWUa8Ce7VXokIArtMJqmhUaoq2kSSJW5NW40QwMJTZaDy9pD8/KMNBNO
	/QoOuuD3tprMbyZQ7wzgXUZ3gKXwIK3NvBHOGc+JDy3w88d7hFrU6bwsXqNLzElz6qhfNkSBS5SIW
	lrGHxCxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdJ07-0000000E2Jt-2lMR;
	Wed, 07 Jan 2026 02:10:19 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdJ00-0000000E29b-0kub;
	Wed, 07 Jan 2026 02:10:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0D60C443F6;
	Wed,  7 Jan 2026 02:10:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3969C116C6;
	Wed,  7 Jan 2026 02:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767751811;
	bh=zCCnl2SoGRbpALPvPy51LrwANeAzR+gB7klogt3uh/A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=gpixi3ejenhF7pjNi6I2xIo/9C0RnfoZwUBXXeI8vcZ5YJ+3rXNdrg3pAjpMEFDNJ
	 g9n8+0Z5CMqJf/LICFPjXeNCPjtpenfA1TjAm0HjdwRVnWQfHVCwv2xM4p9iz4akeG
	 WPkCR9WNalgfxTggr3GaRkK7tgsU2pGl2yuzAAsaQ/lmRNU3raAhqcFnMjOIetXvuu
	 XZUnUCWlBUxGyuXNW+PxvsowEv1pJPVkdM5waNSU5W02wHduTDTOdmNXxoHVm5lSkO
	 fV2YDP92TA/HfpwiLsKfKgLV4hwaWHCsBypR0ZCiLnwHoYbvJOTgrpPAuta+NnMY1M
	 DrbQ8anT9U2sQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Tue, 06 Jan 2026 20:09:44 -0600
Subject: [PATCH 05/13] arm64: dts: broadcom: stingray: Rework clock nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260106-dt-dtbs-broadcom-fixes-v1-5-ba45874e4553@kernel.org>
References: <20260106-dt-dtbs-broadcom-fixes-v1-0-ba45874e4553@kernel.org>
In-Reply-To: <20260106-dt-dtbs-broadcom-fixes-v1-0-ba45874e4553@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>
Cc: devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_181012_275915_708AB7EB 
X-CRM114-Status: GOOD (  17.46  )
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

The stringray-clocks.dtsi is oddly included in the middle of a bus
node and is only included in one place, so collapse it into
stingray.dtsi. Move the fixed and fixed-factor clock nodes to the root
as they are not part of the bus. Rename the node names to use preferred
names.

Drop the unnecessary 1:1 fixed-factor clock providers.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../boot/dts/broadcom/stingray/stingray-clock.dtsi | 182 ---------------------
 .../arm64/boot/dts/broadcom/stingray/stingray.dtsi | 124 +++++++++++++-
 2 files changed, 120 insertions(+), 186 deletions(-)

diff --git a/arch/arm64/boot/dts/broadcom/stingray/stingray-clock.dtsi b/arch/arm64/boot/dts/broadcom/stingray/stingray-clock.dtsi
deleted file mode 100644
index 10a106aca229..000000000000
--- a/arch/arm64/boot/dts/broadcom/stingray/stingray-clock.dtsi
+++ /dev/null
@@ -1,182 +0,0 @@
-/*
- *  BSD LICENSE
- *
- *  Copyright(c) 2016-2017 Broadcom.  All rights reserved.
- *
- *  Redistribution and use in source and binary forms, with or without
- *  modification, are permitted provided that the following conditions
- *  are met:
- *
- *    * Redistributions of source code must retain the above copyright
- *      notice, this list of conditions and the following disclaimer.
- *    * Redistributions in binary form must reproduce the above copyright
- *      notice, this list of conditions and the following disclaimer in
- *      the documentation and/or other materials provided with the
- *      distribution.
- *    * Neither the name of Broadcom nor the names of its
- *      contributors may be used to endorse or promote products derived
- *      from this software without specific prior written permission.
- *
- *  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
- *  "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
- *  LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
- *  A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
- *  OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
- *  SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
- *  LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
- *  DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
- *  THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
- *  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
- *  OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
- */
-
-#include <dt-bindings/clock/bcm-sr.h>
-
-		osc: oscillator {
-			#clock-cells = <0>;
-			compatible = "fixed-clock";
-			clock-frequency = <50000000>;
-		};
-
-		crmu_ref25m: crmu_ref25m {
-			#clock-cells = <0>;
-			compatible = "fixed-factor-clock";
-			clocks = <&osc>;
-			clock-div = <2>;
-			clock-mult = <1>;
-		};
-
-		genpll0: genpll0@1d104 {
-			#clock-cells = <1>;
-			compatible = "brcm,sr-genpll0";
-			reg = <0x0001d104 0x32>,
-			      <0x0001c854 0x4>;
-			clocks = <&osc>;
-			clock-output-names = "genpll0", "clk_125m", "clk_scr",
-					     "clk_250", "clk_pcie_axi",
-					     "clk_paxc_axi_x2",
-					     "clk_paxc_axi";
-		};
-
-		genpll2: genpll2@1d1ac {
-			#clock-cells = <1>;
-			compatible = "brcm,sr-genpll2";
-			reg = <0x0001d1ac 0x32>,
-			      <0x0001c854 0x4>;
-			clocks = <&osc>;
-			clock-output-names = "genpll2", "clk_nic",
-					     "clk_ts_500_ref", "clk_125_nitro",
-					     "clk_chimp", "clk_nic_flash",
-					     "clk_fs";
-		};
-
-		genpll3: genpll3@1d1e0 {
-			#clock-cells = <1>;
-			compatible = "brcm,sr-genpll3";
-			reg = <0x0001d1e0 0x32>,
-			      <0x0001c854 0x4>;
-			clocks = <&osc>;
-			clock-output-names = "genpll3", "clk_hsls",
-					     "clk_sdio";
-		};
-
-		genpll4: genpll4@1d214 {
-			#clock-cells = <1>;
-			compatible = "brcm,sr-genpll4";
-			reg = <0x0001d214 0x32>,
-			      <0x0001c854 0x4>;
-			clocks = <&osc>;
-			clock-output-names = "genpll4", "clk_ccn",
-					     "clk_tpiu_pll", "clk_noc",
-					     "clk_chclk_fs4",
-					     "clk_bridge_fscpu";
-		};
-
-		genpll5: genpll5@1d248 {
-			#clock-cells = <1>;
-			compatible = "brcm,sr-genpll5";
-			reg = <0x0001d248 0x32>,
-			      <0x0001c870 0x4>;
-			clocks = <&osc>;
-			clock-output-names = "genpll5", "clk_fs4_hf",
-					     "clk_crypto_ae", "clk_raid_ae";
-		};
-
-		lcpll0: lcpll0@1d0c4 {
-			#clock-cells = <1>;
-			compatible = "brcm,sr-lcpll0";
-			reg = <0x0001d0c4 0x3c>,
-			      <0x0001c870 0x4>;
-			clocks = <&osc>;
-			clock-output-names = "lcpll0", "clk_sata_refp",
-					     "clk_sata_refn", "clk_sata_350",
-					     "clk_sata_500";
-		};
-
-		lcpll1: lcpll1@1d138 {
-			#clock-cells = <1>;
-			compatible = "brcm,sr-lcpll1";
-			reg = <0x0001d138 0x3c>,
-			      <0x0001c870 0x4>;
-			clocks = <&osc>;
-			clock-output-names = "lcpll1", "clk_wan",
-					     "clk_usb_ref",
-					     "clk_crmu_ts";
-		};
-
-		hsls_clk: hsls_clk {
-			#clock-cells = <0>;
-			compatible = "fixed-factor-clock";
-			clocks = <&genpll3 1>;
-			clock-div = <1>;
-			clock-mult = <1>;
-		};
-
-		hsls_div2_clk: hsls_div2_clk {
-			#clock-cells = <0>;
-			compatible = "fixed-factor-clock";
-			clocks = <&genpll3 BCM_SR_GENPLL3_HSLS_CLK>;
-			clock-div = <2>;
-			clock-mult = <1>;
-
-		};
-
-		hsls_div4_clk: hsls_div4_clk {
-			#clock-cells = <0>;
-			compatible = "fixed-factor-clock";
-			clocks = <&genpll3 BCM_SR_GENPLL3_HSLS_CLK>;
-			clock-div = <4>;
-			clock-mult = <1>;
-		};
-
-		hsls_25m_clk: hsls_25m_clk {
-			#clock-cells = <0>;
-			compatible = "fixed-factor-clock";
-			clocks = <&crmu_ref25m>;
-			clock-div = <1>;
-			clock-mult = <1>;
-		};
-
-		hsls_25m_div2_clk: hsls_25m_div2_clk {
-			#clock-cells = <0>;
-			compatible = "fixed-factor-clock";
-			clocks = <&hsls_25m_clk>;
-			clock-div = <2>;
-			clock-mult = <1>;
-		};
-
-		sdio0_clk: sdio0_clk {
-			#clock-cells = <0>;
-			compatible = "fixed-factor-clock";
-			clocks = <&genpll3 BCM_SR_GENPLL3_SDIO_CLK>;
-			clock-div = <1>;
-			clock-mult = <1>;
-		};
-
-		sdio1_clk: sdio1_clk {
-			#clock-cells = <0>;
-			compatible = "fixed-factor-clock";
-			clocks = <&genpll3 BCM_SR_GENPLL3_SDIO_CLK>;
-			clock-div = <1>;
-			clock-mult = <1>;
-		};
diff --git a/arch/arm64/boot/dts/broadcom/stingray/stingray.dtsi b/arch/arm64/boot/dts/broadcom/stingray/stingray.dtsi
index 857fa427e195..9b015b8e1bb1 100644
--- a/arch/arm64/boot/dts/broadcom/stingray/stingray.dtsi
+++ b/arch/arm64/boot/dts/broadcom/stingray/stingray.dtsi
@@ -30,6 +30,7 @@
  *  OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
  */
 
+#include <dt-bindings/clock/bcm-sr.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 
 / {
@@ -159,6 +160,45 @@ mhb: syscon@60401000 {
 		reg = <0 0x60401000 0 0x38c>;
 	};
 
+	osc: clock-50000000 {
+		#clock-cells = <0>;
+		compatible = "fixed-clock";
+		clock-frequency = <50000000>;
+	};
+
+	crmu_ref25m: hsls_25m_clk: clock-25000000 {
+		#clock-cells = <0>;
+		compatible = "fixed-factor-clock";
+		clocks = <&osc>;
+		clock-div = <2>;
+		clock-mult = <1>;
+	};
+
+	hsls_div2_clk: hsls_div2_clk {
+		#clock-cells = <0>;
+		compatible = "fixed-factor-clock";
+		clocks = <&genpll3 BCM_SR_GENPLL3_HSLS_CLK>;
+		clock-div = <2>;
+		clock-mult = <1>;
+
+	};
+
+	hsls_div4_clk: hsls_div4_clk {
+		#clock-cells = <0>;
+		compatible = "fixed-factor-clock";
+		clocks = <&genpll3 BCM_SR_GENPLL3_HSLS_CLK>;
+		clock-div = <4>;
+		clock-mult = <1>;
+	};
+
+	hsls_25m_div2_clk: clock-12500000 {
+		#clock-cells = <0>;
+		compatible = "fixed-factor-clock";
+		clocks = <&hsls_25m_clk>;
+		clock-div = <2>;
+		clock-mult = <1>;
+	};
+
 	scr {
 		compatible = "simple-bus";
 		#address-cells = <1>;
@@ -269,8 +309,6 @@ crmu: crmu {
 		#size-cells = <1>;
 		ranges = <0x0 0x0 0x66400000 0x100000>;
 
-		#include "stingray-clock.dtsi"
-
 		otp: otp@1c400 {
 			compatible = "brcm,ocotp-v2";
 			reg = <0x0001c400 0x68>;
@@ -283,6 +321,84 @@ cdru: syscon@1d000 {
 			reg = <0x0001d000 0x400>;
 		};
 
+		lcpll0: clock-controller@1d0c4 {
+			#clock-cells = <1>;
+			compatible = "brcm,sr-lcpll0";
+			reg = <0x0001d0c4 0x3c>,
+				<0x0001c870 0x4>;
+			clocks = <&osc>;
+			clock-output-names = "lcpll0", "clk_sata_refp",
+						"clk_sata_refn", "clk_sata_350",
+						"clk_sata_500";
+		};
+
+		genpll0: clock-controller@1d104 {
+			#clock-cells = <1>;
+			compatible = "brcm,sr-genpll0";
+			reg = <0x0001d104 0x32>,
+				<0x0001c854 0x4>;
+			clocks = <&osc>;
+			clock-output-names = "genpll0", "clk_125m", "clk_scr",
+						"clk_250", "clk_pcie_axi",
+						"clk_paxc_axi_x2",
+						"clk_paxc_axi";
+		};
+
+		lcpll1: clock-controller@1d138 {
+			#clock-cells = <1>;
+			compatible = "brcm,sr-lcpll1";
+			reg = <0x0001d138 0x3c>,
+				<0x0001c870 0x4>;
+			clocks = <&osc>;
+			clock-output-names = "lcpll1", "clk_wan",
+						"clk_usb_ref",
+						"clk_crmu_ts";
+		};
+
+		genpll2: clock-controller@1d1ac {
+			#clock-cells = <1>;
+			compatible = "brcm,sr-genpll2";
+			reg = <0x0001d1ac 0x32>,
+				<0x0001c854 0x4>;
+			clocks = <&osc>;
+			clock-output-names = "genpll2", "clk_nic",
+						"clk_ts_500_ref", "clk_125_nitro",
+						"clk_chimp", "clk_nic_flash",
+						"clk_fs";
+		};
+
+		genpll3: clock-controller@1d1e0 {
+			#clock-cells = <1>;
+			compatible = "brcm,sr-genpll3";
+			reg = <0x0001d1e0 0x32>,
+				<0x0001c854 0x4>;
+			clocks = <&osc>;
+			clock-output-names = "genpll3", "clk_hsls",
+						"clk_sdio";
+		};
+
+		genpll4: clock-controller@1d214 {
+			#clock-cells = <1>;
+			compatible = "brcm,sr-genpll4";
+			reg = <0x0001d214 0x32>,
+				<0x0001c854 0x4>;
+			clocks = <&osc>;
+			clock-output-names = "genpll4", "clk_ccn",
+						"clk_tpiu_pll", "clk_noc",
+						"clk_chclk_fs4",
+						"clk_bridge_fscpu";
+		};
+
+		genpll5: clock-controller@1d248 {
+			#clock-cells = <1>;
+			compatible = "brcm,sr-genpll5";
+			reg = <0x0001d248 0x32>,
+				<0x0001c870 0x4>;
+			clocks = <&osc>;
+			clock-output-names = "genpll5", "clk_fs4_hf",
+						"clk_crypto_ae", "clk_raid_ae";
+		};
+
 		gpio_crmu: gpio@24800 {
 			compatible = "brcm,iproc-gpio";
 			reg = <0x00024800 0x4c>;
@@ -593,7 +709,7 @@ sdio0: sdhci@3f1000 {
 			reg = <0x003f1000 0x100>;
 			interrupts = <GIC_SPI 204 IRQ_TYPE_LEVEL_HIGH>;
 			bus-width = <8>;
-			clocks = <&sdio0_clk>;
+			clocks = <&genpll3 BCM_SR_GENPLL3_SDIO_CLK>;
 			iommus = <&smmu 0x6002 0x0000>;
 			status = "disabled";
 		};
@@ -603,7 +719,7 @@ sdio1: sdhci@3f2000 {
 			reg = <0x003f2000 0x100>;
 			interrupts = <GIC_SPI 205 IRQ_TYPE_LEVEL_HIGH>;
 			bus-width = <8>;
-			clocks = <&sdio1_clk>;
+			clocks = <&genpll3 BCM_SR_GENPLL3_SDIO_CLK>;
 			iommus = <&smmu 0x6003 0x0000>;
 			status = "disabled";
 		};

-- 
2.51.0


