Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C4FDC0219B
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Feb 2025 18:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wJKDfculBOHtXbp+LXdjmesbR5G8ZOrp7jrKY9ENQi4=; b=3xJX3OLgQL9oN5pgaW8uRZunn0
	ETGUZCy8SKHJtP6KIYardLGXk16WDVbue3G+JzfK8FcH8AVvUz9Btl64ljBRWbK9+V+fPHi+lU+ga
	UBmrZQav42Myi0585zBt5EDHXG63oOkWDRNsrPGiYJlDmXP6Y/n/M5zd41+VkP7yCpJ524cGh1tQd
	j2Ofrf1dH8HTHACLeSPaN2lLDE2WEVjm/03NE5VhMK/2sIDdxO2KCMjet5afn46mOfTFZwg1NqagI
	1tp0r6R9hHeWGplhNKhhQcGLw5ZRlUmp4ut0ExPB3x7sXit6mptJc/WnA7pFUWB+FWAZcoFCqlQOA
	Re6/DzTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thBkY-0000000FJSC-289O;
	Sun, 09 Feb 2025 18:09:46 +0000
Received: from mout-p-101.mailbox.org ([80.241.56.151])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thBhp-0000000FIzh-0RSI
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Feb 2025 18:06:58 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4YrbJC36VFz9syb;
	Sun,  9 Feb 2025 19:06:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1739124411;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wJKDfculBOHtXbp+LXdjmesbR5G8ZOrp7jrKY9ENQi4=;
	b=C/LILRsIo4dn0sV0YEBvXKWd63dW8wArQmfM5MR2bkiPaZ2zpowEm6hEw4uGtbW8WL3YMH
	AkQWG9eAp2Em/MMUla1K7lx/CNj+04oEIp3/vJ2H+ST3TSR/p4hgtN3VjzTPE2vBVoIljl
	rZC/yXcSmuTrq9vQwH+QRQdPNu98WLYCH5jl89WzrCCulofrG3tl5nOdoizb8t02k0IdFC
	904lwsU7DPgjgZvqyP2DnrUUCwW85NIn6hEOJDFdk3Gud9PAjCQG1tyZeMiJ74tleNxYfO
	3xdAYCZwryqxIATOB7u/xXltFTjKphWgxZZalu5kbGd9Jq5apvK3Gg24/bltvA==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1739124409;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wJKDfculBOHtXbp+LXdjmesbR5G8ZOrp7jrKY9ENQi4=;
	b=TgbRXOdyeSH5qbAx71L2kv3/YuzH+TxoPwQilILZWAtFiwcJ2tuNH7/HTC3qL9AwNAIH8O
	SeYfdiOq2hxPp3FumQJt7dUz1KbnGpYcaneYVLRkpb0xlsA7OmPbNyXr4hoOxpA1Zky8yP
	nUWe22aQa44ro/0ICOBP3yvjSZNQIJE76kPKqIN1pk4vR/7XLTe10TPbSMTcb8DWiahuZp
	Nx4iVKUU+hz5fZ77GxSA2OKDOmeRZI+j2li6flIUd7fGxkMNoo5Cg2rlDGqA28SspHW4BO
	nLAduO0x3za4X919eqq8SONI3YUNeGLaWHKscbEhg4A9BgWUHDrvVCTRdPvBNA==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 3/3] arm64: dts: renesas: Add boot phase tags marking to Renesas RZ/G2
Date: Sun,  9 Feb 2025 19:05:06 +0100
Message-ID: <20250209180616.160253-3-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20250209180616.160253-1-marek.vasut+renesas@mailbox.org>
References: <20250209180616.160253-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: c7858d5b6611a482886
X-MBO-RS-META: sswwhmetmsnqycbsxqobmkbrftm115ge
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250209_100657_284575_7ED908F4 
X-CRM114-Status: GOOD (  15.75  )
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

bootph-all as phase tag was added to dt-schema (dtschema/schemas/bootph.yaml)
to describe various node usage during boot phases with DT. Add bootph-all for
all nodes that are used in the bootloader on Renesas RZ/G2 SoC.

All SoC require CPG clock and its input clock, RST Reset, PFC pin control and
PRR ID register access during all stages of the boot process, those are marked
using bootph-all property, and so is the SoC bus node which contains these IP.

Each board console UART is also marked as bootph-all to make it available in
all stages of the boot process.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
 arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi | 1 +
 arch/arm64/boot/dts/renesas/hihope-common.dtsi      | 1 +
 arch/arm64/boot/dts/renesas/r8a774a1.dtsi           | 8 ++++++++
 arch/arm64/boot/dts/renesas/r8a774b1.dtsi           | 8 ++++++++
 arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts     | 1 +
 arch/arm64/boot/dts/renesas/r8a774c0.dtsi           | 7 +++++++
 arch/arm64/boot/dts/renesas/r8a774e1.dtsi           | 8 ++++++++
 arch/arm64/boot/dts/renesas/rz-smarc-common.dtsi    | 1 +
 8 files changed, 35 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi b/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi
index 43f88c199b788..1489bc8d2f4e6 100644
--- a/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi
@@ -282,6 +282,7 @@ &scif_clk {
 &scif2 {
 	pinctrl-0 = <&scif2_pins>;
 	pinctrl-names = "default";
+	bootph-all;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/renesas/hihope-common.dtsi b/arch/arm64/boot/dts/renesas/hihope-common.dtsi
index 659ae1fed2faa..4e78139d52f6c 100644
--- a/arch/arm64/boot/dts/renesas/hihope-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/hihope-common.dtsi
@@ -289,6 +289,7 @@ &rwdt {
 &scif2 {
 	pinctrl-0 = <&scif2_pins>;
 	pinctrl-names = "default";
+	bootph-all;
 
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
index f065ee90649a4..c8b87aed92a36 100644
--- a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
@@ -215,6 +215,7 @@ extal_clk: extal {
 		#clock-cells = <0>;
 		/* This value must be overridden by the board */
 		clock-frequency = <0>;
+		bootph-all;
 	};
 
 	extalr_clk: extalr {
@@ -222,6 +223,7 @@ extalr_clk: extalr {
 		#clock-cells = <0>;
 		/* This value must be overridden by the board */
 		clock-frequency = <0>;
+		bootph-all;
 	};
 
 	/* External PCIe clock - can be overridden by the board */
@@ -262,6 +264,8 @@ scif_clk: scif {
 	soc {
 		compatible = "simple-bus";
 		interrupt-parent = <&gic>;
+		bootph-all;
+
 		#address-cells = <2>;
 		#size-cells = <2>;
 		ranges;
@@ -400,6 +404,7 @@ gpio7: gpio@e6055800 {
 		pfc: pinctrl@e6060000 {
 			compatible = "renesas,pfc-r8a774a1";
 			reg = <0 0xe6060000 0 0x50c>;
+			bootph-all;
 		};
 
 		cmt0: timer@e60f0000 {
@@ -480,11 +485,13 @@ cpg: clock-controller@e6150000 {
 			#clock-cells = <2>;
 			#power-domain-cells = <0>;
 			#reset-cells = <1>;
+			bootph-all;
 		};
 
 		rst: reset-controller@e6160000 {
 			compatible = "renesas,r8a774a1-rst";
 			reg = <0 0xe6160000 0 0x018c>;
+			bootph-all;
 		};
 
 		sysc: system-controller@e6180000 {
@@ -2785,6 +2792,7 @@ port@1 {
 		prr: chipid@fff00044 {
 			compatible = "renesas,prr";
 			reg = <0 0xfff00044 0 4>;
+			bootph-all;
 		};
 	};
 
diff --git a/arch/arm64/boot/dts/renesas/r8a774b1.dtsi b/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
index 117cb6950f91f..f2fc2a2035a1d 100644
--- a/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
@@ -108,6 +108,7 @@ extal_clk: extal {
 		#clock-cells = <0>;
 		/* This value must be overridden by the board */
 		clock-frequency = <0>;
+		bootph-all;
 	};
 
 	extalr_clk: extalr {
@@ -115,6 +116,7 @@ extalr_clk: extalr {
 		#clock-cells = <0>;
 		/* This value must be overridden by the board */
 		clock-frequency = <0>;
+		bootph-all;
 	};
 
 	/* External PCIe clock - can be overridden by the board */
@@ -146,6 +148,8 @@ scif_clk: scif {
 	soc {
 		compatible = "simple-bus";
 		interrupt-parent = <&gic>;
+		bootph-all;
+
 		#address-cells = <2>;
 		#size-cells = <2>;
 		ranges;
@@ -284,6 +288,7 @@ gpio7: gpio@e6055800 {
 		pfc: pinctrl@e6060000 {
 			compatible = "renesas,pfc-r8a774b1";
 			reg = <0 0xe6060000 0 0x50c>;
+			bootph-all;
 		};
 
 		cmt0: timer@e60f0000 {
@@ -364,11 +369,13 @@ cpg: clock-controller@e6150000 {
 			#clock-cells = <2>;
 			#power-domain-cells = <0>;
 			#reset-cells = <1>;
+			bootph-all;
 		};
 
 		rst: reset-controller@e6160000 {
 			compatible = "renesas,r8a774b1-rst";
 			reg = <0 0xe6160000 0 0x0200>;
+			bootph-all;
 		};
 
 		sysc: system-controller@e6180000 {
@@ -2661,6 +2668,7 @@ port@1 {
 		prr: chipid@fff00044 {
 			compatible = "renesas,prr";
 			reg = <0 0xfff00044 0 4>;
+			bootph-all;
 		};
 	};
 
diff --git a/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts b/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
index b78dbd807d155..57a281fc49775 100644
--- a/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
+++ b/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
@@ -378,6 +378,7 @@ &rwdt {
 &scif2 {
 	pinctrl-0 = <&scif2_pins>;
 	pinctrl-names = "default";
+	bootph-all;
 
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi b/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
index 7655d5e3a0341..cc7f7e13c664f 100644
--- a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
@@ -103,6 +103,7 @@ extal_clk: extal {
 		#clock-cells = <0>;
 		/* This value must be overridden by the board */
 		clock-frequency = <0>;
+		bootph-all;
 	};
 
 	/* External PCIe clock - can be overridden by the board */
@@ -134,6 +135,8 @@ scif_clk: scif {
 	soc: soc {
 		compatible = "simple-bus";
 		interrupt-parent = <&gic>;
+		bootph-all;
+
 		#address-cells = <2>;
 		#size-cells = <2>;
 		ranges;
@@ -257,6 +260,7 @@ gpio6: gpio@e6055400 {
 		pfc: pinctrl@e6060000 {
 			compatible = "renesas,pfc-r8a774c0";
 			reg = <0 0xe6060000 0 0x508>;
+			bootph-all;
 		};
 
 		cmt0: timer@e60f0000 {
@@ -337,11 +341,13 @@ cpg: clock-controller@e6150000 {
 			#clock-cells = <2>;
 			#power-domain-cells = <0>;
 			#reset-cells = <1>;
+			bootph-all;
 		};
 
 		rst: reset-controller@e6160000 {
 			compatible = "renesas,r8a774c0-rst";
 			reg = <0 0xe6160000 0 0x0200>;
+			bootph-all;
 		};
 
 		sysc: system-controller@e6180000 {
@@ -1953,6 +1959,7 @@ port@1 {
 		prr: chipid@fff00044 {
 			compatible = "renesas,prr";
 			reg = <0 0xfff00044 0 4>;
+			bootph-all;
 		};
 	};
 
diff --git a/arch/arm64/boot/dts/renesas/r8a774e1.dtsi b/arch/arm64/boot/dts/renesas/r8a774e1.dtsi
index f845ca604de06..e4dbda8c34d9e 100644
--- a/arch/arm64/boot/dts/renesas/r8a774e1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774e1.dtsi
@@ -277,6 +277,7 @@ extal_clk: extal {
 		#clock-cells = <0>;
 		/* This value must be overridden by the board */
 		clock-frequency = <0>;
+		bootph-all;
 	};
 
 	extalr_clk: extalr {
@@ -284,6 +285,7 @@ extalr_clk: extalr {
 		#clock-cells = <0>;
 		/* This value must be overridden by the board */
 		clock-frequency = <0>;
+		bootph-all;
 	};
 
 	/* External PCIe clock - can be overridden by the board */
@@ -326,6 +328,8 @@ scif_clk: scif {
 	soc {
 		compatible = "simple-bus";
 		interrupt-parent = <&gic>;
+		bootph-all;
+
 		#address-cells = <2>;
 		#size-cells = <2>;
 		ranges;
@@ -464,6 +468,7 @@ gpio7: gpio@e6055800 {
 		pfc: pinctrl@e6060000 {
 			compatible = "renesas,pfc-r8a774e1";
 			reg = <0 0xe6060000 0 0x50c>;
+			bootph-all;
 		};
 
 		cmt0: timer@e60f0000 {
@@ -544,11 +549,13 @@ cpg: clock-controller@e6150000 {
 			#clock-cells = <2>;
 			#power-domain-cells = <0>;
 			#reset-cells = <1>;
+			bootph-all;
 		};
 
 		rst: reset-controller@e6160000 {
 			compatible = "renesas,r8a774e1-rst";
 			reg = <0 0xe6160000 0 0x0200>;
+			bootph-all;
 		};
 
 		sysc: system-controller@e6180000 {
@@ -2917,6 +2924,7 @@ port@1 {
 		prr: chipid@fff00044 {
 			compatible = "renesas,prr";
 			reg = <0 0xfff00044 0 4>;
+			bootph-all;
 		};
 	};
 
diff --git a/arch/arm64/boot/dts/renesas/rz-smarc-common.dtsi b/arch/arm64/boot/dts/renesas/rz-smarc-common.dtsi
index 63fa5cf1061b3..b9746ee99ba80 100644
--- a/arch/arm64/boot/dts/renesas/rz-smarc-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/rz-smarc-common.dtsi
@@ -136,6 +136,7 @@ &phyrst {
 &scif0 {
 	pinctrl-0 = <&scif0_pins>;
 	pinctrl-names = "default";
+	bootph-all;
 	status = "okay";
 };
 
-- 
2.47.2


