Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4E10CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 15:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RsGkU0Y7aLcfMV7uNd562UzJ6jaObjl/wBsHTw30G/M=; b=gskVeVuVNMnys++4zz2Eh37Edd
	WF/LR0jSRZalnv07beLO9rVxDFw5/RkHJx1CVqF0gFgn1+BLPTRr4aY0fWRgKzO7t6+lrDrp5RKhW
	JoaB4YhNQwrAGkPuKgThzk6hyCaMxGa8CbkCdz7TuhpYOEii5oD6+6DGmBCudmcN4No7txJUmPZCk
	if+UMz2tCqrNbtnkF8x0KS/ib1Ik+es91jhQOa9ESdelzia+MsA338jYbGbRrdP7MPqNGB8N5QoOk
	OqS6rp2mmBrXd8cgend7r4NXC5q3h5A4YsYjqRVPlxmCR4MH4kUkLjejZ9CZroKX3imJoyy3k9qIy
	imo1XyBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFwU1-0000000A9h5-2OiE;
	Mon, 03 Nov 2025 15:28:37 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFwTz-0000000A9gN-3I3W
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 15:28:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E34EB436CD;
	Mon,  3 Nov 2025 15:28:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85465C116B1;
	Mon,  3 Nov 2025 15:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762183714;
	bh=Xq/dCk1WgAkB9VEwNe7lHwdtfzlS+p4TEfMc2Az0jnc=;
	h=From:To:Cc:Subject:Date:From;
	b=DbeNCjIGBy4SXe4Kiv0oTk6BcxUqZLQwmja/+Wo3p7orZDWbAJENQYp3CDwv06Ywa
	 zSM2/hPPOP2xIlYFx+OAd7Jq2ao8cn9yGJFfncB1RDkyS/C7qxBI8KQsY79Shc/bCp
	 ifWJQB7XnpMsL7NV0B+IWX5rTgO51YwShvg5cCVbzd0yhCmXhCXSZauvodv7hY0AvI
	 dhdlG8QgP2QNkM9uviwMSQGtQR68AOYhLqWAt2SOT5qQkhzRVvkUJI7iY7NBHLVeF0
	 cHM/AyHkuUF1eTGZoMDusHwDpecu0EP8VgPG1t7CaFMifDlzogkmyLqbovkPqWOSrf
	 F8a2jMuf4dmXg==
From: Michael Walle <mwalle@kernel.org>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michael Walle <mwalle@kernel.org>,
	Udit Kumar <u-kumar1@ti.com>
Subject: [PATCH] arm64: dts: ti: k3-am62p-j722s-common-main: move audio_refclk here
Date: Mon,  3 Nov 2025 16:28:18 +0100
Message-ID: <20251103152826.1608309-1-mwalle@kernel.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_072835_860928_D9CBBFA8 
X-CRM114-Status: GOOD (  11.03  )
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

Since commit 9dee9cb2df08 ("arm64: dts: ti: k3-j722s-main: fix the audio
refclk source") the clock nodes of the am62p and j722 are the same. Move
them into the commit dtsi.

Please note, that for the j722s the nodes are renamed from clock@ to
clock-controller@.

Suggested-by: Udit Kumar <u-kumar1@ti.com>
Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 .../dts/ti/k3-am62p-j722s-common-main.dtsi    | 18 +++++++++++++++++
 arch/arm64/boot/dts/ti/k3-am62p-main.dtsi     | 20 -------------------
 arch/arm64/boot/dts/ti/k3-j722s-main.dtsi     | 18 -----------------
 3 files changed, 18 insertions(+), 38 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
index 3289244eca13..0a42fefb6915 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
@@ -46,6 +46,24 @@ main_conf: bus@100000 {
 		#size-cells = <1>;
 		ranges = <0x00 0x00 0x00100000 0x20000>;
 
+		audio_refclk0: clock-controller@82e0 {
+			compatible = "ti,am62-audio-refclk";
+			reg = <0x82e0 0x4>;
+			clocks = <&k3_clks 157 0>;
+			assigned-clocks = <&k3_clks 157 0>;
+			assigned-clock-parents = <&k3_clks 157 16>;
+			#clock-cells = <0>;
+		};
+
+		audio_refclk1: clock-controller@82e4 {
+			compatible = "ti,am62-audio-refclk";
+			reg = <0x82e4 0x4>;
+			clocks = <&k3_clks 157 18>;
+			assigned-clocks = <&k3_clks 157 18>;
+			assigned-clock-parents = <&k3_clks 157 34>;
+			#clock-cells = <0>;
+		};
+
 		phy_gmii_sel: phy@4044 {
 			compatible = "ti,am654-phy-gmii-sel";
 			reg = <0x4044 0x8>;
diff --git a/arch/arm64/boot/dts/ti/k3-am62p-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-main.dtsi
index 908cc0760e7d..13d32cbff186 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p-main.dtsi
@@ -42,26 +42,6 @@ &inta_main_dmss {
 	ti,interrupt-ranges = <5 69 35>;
 };
 
-&main_conf {
-	audio_refclk0: clock-controller@82e0 {
-		compatible = "ti,am62-audio-refclk";
-		reg = <0x82e0 0x4>;
-		clocks = <&k3_clks 157 0>;
-		assigned-clocks = <&k3_clks 157 0>;
-		assigned-clock-parents = <&k3_clks 157 16>;
-		#clock-cells = <0>;
-	};
-
-	audio_refclk1: clock-controller@82e4 {
-		compatible = "ti,am62-audio-refclk";
-		reg = <0x82e4 0x4>;
-		clocks = <&k3_clks 157 18>;
-		assigned-clocks = <&k3_clks 157 18>;
-		assigned-clock-parents = <&k3_clks 157 34>;
-		#clock-cells = <0>;
-	};
-};
-
 &main_gpio0 {
 	gpio-ranges = <&main_pmx0 0 0 32>, <&main_pmx0 32 33 38>,
 			<&main_pmx0 70 72 22>;
diff --git a/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi b/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi
index 04de29da40f1..fc85a08428c3 100644
--- a/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi
@@ -462,24 +462,6 @@ serdes_ln_ctrl: mux-controller@4080 {
 		mux-reg-masks = <0x00 0x3>, /* SERDES0 lane0 select */
 				<0x10 0x3>; /* SERDES1 lane0 select */
 	};
-
-	audio_refclk0: clock@82e0 {
-		compatible = "ti,am62-audio-refclk";
-		reg = <0x82e0 0x4>;
-		clocks = <&k3_clks 157 0>;
-		assigned-clocks = <&k3_clks 157 0>;
-		assigned-clock-parents = <&k3_clks 157 16>;
-		#clock-cells = <0>;
-	};
-
-	audio_refclk1: clock@82e4 {
-		compatible = "ti,am62-audio-refclk";
-		reg = <0x82e4 0x4>;
-		clocks = <&k3_clks 157 18>;
-		assigned-clocks = <&k3_clks 157 18>;
-		assigned-clock-parents = <&k3_clks 157 34>;
-		#clock-cells = <0>;
-	};
 };
 
 &wkup_conf {
-- 
2.47.3


