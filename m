Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B51CCF6BE3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 02:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fwh9PuD0dQ+5lr4ebj8Yq6KOwgz2GRT95RyRjR6iAUg=; b=XkLrZe21Jwlb5Z3DBvp2uASZ3A
	yv+6iZoFecwrMPIn7KxwkxDBUcLTuHG6/Cr+4DpQycVeoxSPxQ+fv5TxaLWSmadnQpbn1PAYOsKzC
	oZj7gdFYC9/C4bGusOTE3iXU+1ISIzO5/aXUg6MkGEGiIQq+CrQ8+4sxkRWoXQXAiKrs23D9Jkptv
	2f1UMOQXVJaCGG/31VdqynQvJMUTw5HV6Ens+cQyg/hgmEXiHNrHUWGw+VbDcgJ+SC6kJP3QWf6yq
	tn5a8JhyVJmVJtz1xXhgnF3x1GK5oiYn2C2Susw2tBVv37q7S/jQ9GwEG69tR9yZBweAyYefvBx7N
	XMn9Ab+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdJ0M-0000000E2ZO-3GdF;
	Wed, 07 Jan 2026 02:10:34 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdJ05-0000000E2HE-1005;
	Wed, 07 Jan 2026 02:10:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E9AD94440C;
	Wed,  7 Jan 2026 02:10:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AED1AC16AAE;
	Wed,  7 Jan 2026 02:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767751816;
	bh=LMeelO8gLtnnbvvu5xzPh8wTl8wU3Gtpg/HJn4KVftg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ih/Gm4TPH+eDejcIkAtUiP4sxYx+2oVEvnNszmk8tMys/2TQEbuN1edLIuhwoIOuE
	 +m/cFKJuioswgVkKNJU/COwR5O2izLE6PRFq1E2itm/qc5XBVrICg1m9XM+H76eqZI
	 mec4ifcCndeC216s5aBWrMzqwjWn670gp3OPBgy3qifQgjbnnJfy7ZLVP4hD4GNXK7
	 MvuDQRs58aMpGKMJlECVA5WOgI/6VLmv49AQpZqYe2ISNGvhkWZo6doA5dSXi+miAS
	 7Qu3DECwbGUIrH7yV58cR0jVxr8dh/9eLSQFHOsXYR6yhvfLTyVwjLTqP2EQxoz8XT
	 6fgNWxhceZ/RA==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Tue, 06 Jan 2026 20:09:49 -0600
Subject: [PATCH 10/13] arm64: dts: broadcom: northstar2: Rework clock nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260106-dt-dtbs-broadcom-fixes-v1-10-ba45874e4553@kernel.org>
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
X-CRM114-CacheID: sfid-20260106_181017_707657_93D57F1D 
X-CRM114-Status: GOOD (  16.87  )
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

The nd2-clocks.dtsi is oddly included in the middle of a bus node and is
only included in one place, so collapse it into ns2.dtsi. Move the fixed
and fixed-factor clock nodes to the root as they are not part of the
bus. Rename the node names to use preferred names.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../boot/dts/broadcom/northstar2/ns2-clock.dtsi    | 105 ---------------------
 arch/arm64/boot/dts/broadcom/northstar2/ns2.dtsi   |  73 +++++++++++++-
 2 files changed, 71 insertions(+), 107 deletions(-)

diff --git a/arch/arm64/boot/dts/broadcom/northstar2/ns2-clock.dtsi b/arch/arm64/boot/dts/broadcom/northstar2/ns2-clock.dtsi
deleted file mode 100644
index 99009fdf10a4..000000000000
--- a/arch/arm64/boot/dts/broadcom/northstar2/ns2-clock.dtsi
+++ /dev/null
@@ -1,105 +0,0 @@
-/*
- *  BSD LICENSE
- *
- *  Copyright (c) 2016 Broadcom.  All rights reserved.
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
- *    * Neither the name of Broadcom Corporation nor the names of its
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
- * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
- */
-
-#include <dt-bindings/clock/bcm-ns2.h>
-
-	osc: oscillator {
-		#clock-cells = <0>;
-		compatible = "fixed-clock";
-		clock-frequency = <25000000>;
-	};
-
-	lcpll_ddr: lcpll_ddr@6501d058 {
-		#clock-cells = <1>;
-		compatible = "brcm,ns2-lcpll-ddr";
-		reg = <0x6501d058 0x20>,
-		      <0x6501c020 0x4>,
-		      <0x6501d04c 0x4>;
-		clocks = <&osc>;
-		clock-output-names = "lcpll_ddr", "pcie_sata_usb",
-				     "ddr", "ddr_ch2_unused",
-				     "ddr_ch3_unused", "ddr_ch4_unused",
-				     "ddr_ch5_unused";
-	};
-
-	lcpll_ports: lcpll_ports@6501d078 {
-		#clock-cells = <1>;
-		compatible = "brcm,ns2-lcpll-ports";
-		reg = <0x6501d078 0x20>,
-		      <0x6501c020 0x4>,
-		      <0x6501d054 0x4>;
-		clocks = <&osc>;
-		clock-output-names = "lcpll_ports", "wan", "rgmii",
-				     "ports_ch2_unused",
-				     "ports_ch3_unused",
-				     "ports_ch4_unused",
-				     "ports_ch5_unused";
-	};
-
-	genpll_scr: genpll_scr@6501d098 {
-		#clock-cells = <1>;
-		compatible = "brcm,ns2-genpll-scr";
-		reg = <0x6501d098 0x32>,
-		      <0x6501c020 0x4>,
-		      <0x6501d044 0x4>;
-		clocks = <&osc>;
-		clock-output-names = "genpll_scr", "scr", "fs",
-				     "audio_ref", "scr_ch3_unused",
-				     "scr_ch4_unused", "scr_ch5_unused";
-	};
-
-	iprocmed: iprocmed {
-		#clock-cells = <0>;
-		compatible = "fixed-factor-clock";
-		clocks = <&genpll_scr BCM_NS2_GENPLL_SCR_SCR_CLK>;
-		clock-div = <2>;
-		clock-mult = <1>;
-	};
-
-	iprocslow: iprocslow {
-		#clock-cells = <0>;
-		compatible = "fixed-factor-clock";
-		clocks = <&genpll_scr BCM_NS2_GENPLL_SCR_SCR_CLK>;
-		clock-div = <4>;
-		clock-mult = <1>;
-	};
-
-	genpll_sw: genpll_sw@6501d0c4 {
-		#clock-cells = <1>;
-		compatible = "brcm,ns2-genpll-sw";
-		reg = <0x6501d0c4 0x32>,
-		      <0x6501c020 0x4>,
-		      <0x6501d044 0x4>;
-		clocks = <&osc>;
-		clock-output-names = "genpll_sw", "rpe", "250", "nic",
-				     "chimp", "port", "sdio";
-	};
diff --git a/arch/arm64/boot/dts/broadcom/northstar2/ns2.dtsi b/arch/arm64/boot/dts/broadcom/northstar2/ns2.dtsi
index 0de9d6265701..c9bf77b3566e 100644
--- a/arch/arm64/boot/dts/broadcom/northstar2/ns2.dtsi
+++ b/arch/arm64/boot/dts/broadcom/northstar2/ns2.dtsi
@@ -113,6 +113,28 @@ pmu {
 				     <&A57_3>;
 	};
 
+	osc: clock-25000000 {
+		#clock-cells = <0>;
+		compatible = "fixed-clock";
+		clock-frequency = <25000000>;
+	};
+
+	iprocmed: iprocmed {
+		#clock-cells = <0>;
+		compatible = "fixed-factor-clock";
+		clocks = <&genpll_scr BCM_NS2_GENPLL_SCR_SCR_CLK>;
+		clock-div = <2>;
+		clock-mult = <1>;
+	};
+
+	iprocslow: iprocslow {
+		#clock-cells = <0>;
+		compatible = "fixed-factor-clock";
+		clocks = <&genpll_scr BCM_NS2_GENPLL_SCR_SCR_CLK>;
+		clock-div = <4>;
+		clock-mult = <1>;
+	};
+
 	pcie0: pcie@20020000 {
 		compatible = "brcm,iproc-pcie";
 		reg = <0 0x20020000 0 0x1000>;
@@ -197,8 +219,6 @@ soc: soc {
 		#size-cells = <1>;
 		ranges = <0 0 0 0xffffffff>;
 
-		#include "ns2-clock.dtsi"
-
 		enet: ethernet@61000000 {
 			compatible = "brcm,ns2-amac";
 			reg = <0x61000000 0x1000>,
@@ -334,6 +354,55 @@ smmu: iommu@64000000 {
 			#iommu-cells = <1>;
 		};
 
+		lcpll_ddr: clock-controller@6501d058 {
+			#clock-cells = <1>;
+			compatible = "brcm,ns2-lcpll-ddr";
+			reg = <0x6501d058 0x20>,
+			      <0x6501c020 0x4>,
+			      <0x6501d04c 0x4>;
+			clocks = <&osc>;
+			clock-output-names = "lcpll_ddr", "pcie_sata_usb",
+					     "ddr", "ddr_ch2_unused",
+					     "ddr_ch3_unused", "ddr_ch4_unused",
+					     "ddr_ch5_unused";
+		};
+
+		lcpll_ports: clock-controller@6501d078 {
+			#clock-cells = <1>;
+			compatible = "brcm,ns2-lcpll-ports";
+			reg = <0x6501d078 0x20>,
+			      <0x6501c020 0x4>,
+			      <0x6501d054 0x4>;
+			clocks = <&osc>;
+			clock-output-names = "lcpll_ports", "wan", "rgmii",
+					     "ports_ch2_unused",
+					     "ports_ch3_unused",
+					     "ports_ch4_unused",
+					     "ports_ch5_unused";
+		};
+
+		genpll_scr: clock-controller@6501d098 {
+			#clock-cells = <1>;
+			compatible = "brcm,ns2-genpll-scr";
+			reg = <0x6501d098 0x32>,
+			      <0x6501c020 0x4>,
+			      <0x6501d044 0x4>;
+			clocks = <&osc>;
+			clock-output-names = "genpll_scr", "scr", "fs",
+					     "audio_ref", "scr_ch3_unused",
+					     "scr_ch4_unused", "scr_ch5_unused";
+		};
+
+		genpll_sw: clock-controller@6501d0c4 {
+			#clock-cells = <1>;
+			compatible = "brcm,ns2-genpll-sw";
+			reg = <0x6501d0c4 0x32>,
+			      <0x6501c020 0x4>,
+			      <0x6501d044 0x4>;
+			clocks = <&osc>;
+			clock-output-names = "genpll_sw", "rpe", "250", "nic",
+					     "chimp", "port", "sdio";
+		};
 		pinctrl: pinctrl@6501d130 {
 			compatible = "brcm,ns2-pinmux";
 			reg = <0x6501d130 0x08>,

-- 
2.51.0


