Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2366CCCD19A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 10:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LNLgGteO74R8LscVRaH+8UM1MTWGscJTUU5iZx2tX3c=; b=hS+v/Wg3a+0KZN1l9O8IyoVZ4O
	TkczZEeApqnnD/vdRHhToJbSj7kE6f2lldVvq6+3hZJKJSMGkIW2Qvyo0hr7utJcI9t5+3CxEvKwE
	aem+6bcFD67RTpKK1k2i8Ajs/PUktsdw2PRFSbMT3BtGi3WLb17R354Ego24U2uI4mcGJ2UHxERqv
	IiGh8DGBHaz2H+vAnu4QqDHkfRpwXzjug5O20bM8OCtKO5aCKer3zMphVOE9cMkKnIBlb3bLifa06
	2FpkMG00Rfe5pqh8QjSTjtcej3eq/hfQ/IqB01erilrfrObcCyAASfVpJS810/pzhRtV1J7jBm/oO
	RjWhGwVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9hvp-00000007YxN-0OYB;
	Fri, 17 Oct 2025 10:43:33 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9hvm-00000007Yx3-30k0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 10:43:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 461854B23F;
	Fri, 17 Oct 2025 10:43:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE9EBC4CEE7;
	Fri, 17 Oct 2025 10:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760697810;
	bh=Xz/ka8uQqulMQJ6eacWCSLmkEPgwFHxvwPH1ZnbJNlU=;
	h=From:To:Cc:Subject:Date:From;
	b=dT8aMD5nAIX5M5W2DEBdjWGezkjTIaUgN9q75DrXBmKCBuOBKx4Wky9Sxo2xVOmSz
	 v+WoRG7bIFXR5Nxg886QJWbcWlkvNL5oQIhoichQhJo763Bojjz6+X1Dkrdz8yj4L6
	 IxayfqK8cPdrDZfzEWagJuUP7TGdRMfH+TO5w8sq4nOBibaVVLz1U2GR2w8ZZXrAmw
	 1OYknVVjH4xeNtk+mAJ+JDoXdnU/sX43tfr1fngqrssEM7T0K4sir7B+0aYrTn8YRy
	 QruZHdXhHS5dy0AsxaNxwsdMwTNywlD5eWjN3lIhggPkPit0CHY0CDNkheGSr9F2FH
	 4ap5nBoYIbwiQ==
From: Michael Walle <mwalle@kernel.org>
To: Nishanth Menon <nm@ti.com>,
	Bryan Brattlof <bb@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michael Walle <mwalle@kernel.org>
Subject: [PATCH RESEND] arm64: dts: ti: k3-j722s: add OPP table
Date: Fri, 17 Oct 2025 12:42:55 +0200
Message-ID: <20251017104315.533436-1-mwalle@kernel.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_034330_814933_78EEA5BB 
X-CRM114-Status: GOOD (  10.43  )
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

Add the A53 frequency operation points. The frequencies where taken from
the AM62P SoC and seem to be chosen rather arbitrary.
The SoC doesn't contain it's speed grade in the JTAG USER ID efuse
register, thus it has to be hardcoded in the SoC dtsi and/or board dts.

The SoC is binned into just two speed grades with different core
voltages: J (0.75V, 1.25GHz) and K (0.85V, 1.4GHz). Add the frequencies
that both speed grades support to the SoC dtsi and if a board has a
speed grade K SoC add it to the board device tree.

Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 .../arm64/boot/dts/ti/k3-am67a-beagley-ai.dts |  7 ++++
 arch/arm64/boot/dts/ti/k3-j722s-evm.dts       |  7 ++++
 arch/arm64/boot/dts/ti/k3-j722s.dtsi          | 40 +++++++++++++++++++
 3 files changed, 54 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts b/arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts
index b697035df04e..464dffd46e59 100644
--- a/arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts
+++ b/arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts
@@ -148,6 +148,13 @@ led-1 {
 	};
 };
 
+&a53_opp_table {
+	opp-1400000000 {
+		opp-hz = /bits/ 64 <1400000000>;
+		clock-latency-ns = <6000000>;
+	};
+};
+
 &main_pmx0 {
 	main_i2c0_pins_default: main-i2c0-default-pins {
 		pinctrl-single,pins = <
diff --git a/arch/arm64/boot/dts/ti/k3-j722s-evm.dts b/arch/arm64/boot/dts/ti/k3-j722s-evm.dts
index e0e303da7e15..ce3ed1b0f24d 100644
--- a/arch/arm64/boot/dts/ti/k3-j722s-evm.dts
+++ b/arch/arm64/boot/dts/ti/k3-j722s-evm.dts
@@ -228,6 +228,13 @@ csi23_mux: mux-controller-1 {
 	};
 };
 
+&a53_opp_table {
+	opp-1400000000 {
+		opp-hz = /bits/ 64 <1400000000>;
+		clock-latency-ns = <6000000>;
+	};
+};
+
 &cpsw_mac_syscon {
 	bootph-all;
 };
diff --git a/arch/arm64/boot/dts/ti/k3-j722s.dtsi b/arch/arm64/boot/dts/ti/k3-j722s.dtsi
index 0165db6e4437..acb15307addc 100644
--- a/arch/arm64/boot/dts/ti/k3-j722s.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j722s.dtsi
@@ -55,6 +55,7 @@ cpu0: cpu@0 {
 			d-cache-line-size = <64>;
 			d-cache-sets = <128>;
 			next-level-cache = <&l2_0>;
+			operating-points-v2 = <&a53_opp_table>;
 			clocks = <&k3_clks 135 0>;
 			#cooling-cells = <2>;
 		};
@@ -71,6 +72,7 @@ cpu1: cpu@1 {
 			d-cache-line-size = <64>;
 			d-cache-sets = <128>;
 			next-level-cache = <&l2_0>;
+			operating-points-v2 = <&a53_opp_table>;
 			clocks = <&k3_clks 136 0>;
 			#cooling-cells = <2>;
 		};
@@ -87,6 +89,7 @@ cpu2: cpu@2 {
 			d-cache-line-size = <64>;
 			d-cache-sets = <128>;
 			next-level-cache = <&l2_0>;
+			operating-points-v2 = <&a53_opp_table>;
 			clocks = <&k3_clks 137 0>;
 			#cooling-cells = <2>;
 		};
@@ -103,11 +106,48 @@ cpu3: cpu@3 {
 			d-cache-line-size = <64>;
 			d-cache-sets = <128>;
 			next-level-cache = <&l2_0>;
+			operating-points-v2 = <&a53_opp_table>;
 			clocks = <&k3_clks 138 0>;
 			#cooling-cells = <2>;
 		};
 	};
 
+	a53_opp_table: opp-table {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp-200000000 {
+			opp-hz = /bits/ 64 <200000000>;
+			clock-latency-ns = <6000000>;
+		};
+
+		opp-400000000 {
+			opp-hz = /bits/ 64 <400000000>;
+			clock-latency-ns = <6000000>;
+		};
+
+		opp-600000000 {
+			opp-hz = /bits/ 64 <600000000>;
+			clock-latency-ns = <6000000>;
+		};
+
+		opp-800000000 {
+			opp-hz = /bits/ 64 <800000000>;
+			clock-latency-ns = <6000000>;
+		};
+
+		opp-1000000000 {
+			opp-hz = /bits/ 64 <1000000000>;
+			clock-latency-ns = <6000000>;
+		};
+
+		opp-1250000000 {
+			opp-hz = /bits/ 64 <1250000000>;
+			clock-latency-ns = <6000000>;
+			opp-suspend;
+		};
+	};
+
 	l2_0: l2-cache0 {
 		compatible = "cache";
 		cache-unified;
-- 
2.47.3


