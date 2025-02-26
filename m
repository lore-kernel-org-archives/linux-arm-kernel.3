Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C25FC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 21:49:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hqasg0Pp4KnaZYEOUtHXlCbYHrtQGsgteP6GD2YNVzc=; b=WWxxYocrEiPETnt0IQuIjyhMPQ
	b/XTV4b4WM5SYXrbeM7R2Hhxz/PR4FWm28HR4tTmwSGQvD/hjcLam3EoqhbLx8gU0PVrCWUF7WZtP
	pC1kwhKfZGOwo7/2SSMyZYlPCzyEUn4CLF27ATW41h7jphAnf2xFAM1WxzTq5B4oAtfuJugAP7G5s
	wUe1OB7JfBxLYI+60CCXnxBVXXV0y7sHJiDCFP/tTy2IGTSLc6yrz05KJr/YFb5M7zb99ShddCv43
	nwh3V7x6DMDJXgLK2rfrHNjyQsy5ifx31nEKWC62WBBcbv8aQinWCYyYQkciYOY6IU6wMY7E8PVwN
	Ssw1mTjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnPHk-00000005WUd-1sso;
	Wed, 26 Feb 2025 21:49:44 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnPGC-00000005WAc-1Xp6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 21:48:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E48495C72C8;
	Wed, 26 Feb 2025 21:47:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33FA4C4CEE7;
	Wed, 26 Feb 2025 21:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740606487;
	bh=NdZQtJa0ZOh04+9rg2b+zZfqMIh7fGLxHzRoGo/wQPU=;
	h=From:To:Cc:Subject:Date:From;
	b=hJ/wYJ72T5RjKXMzhBQJarDAqsDZESzXnWGIjAbWtskg4RFrSB1wSsRzLLfPPFmHd
	 5/ov6wSvD3YRa31Acss5MehJj3HvVsIf5wBLA4ewCwy6PwlHUCiSg+RsvGkTh3WbhC
	 ZLPnew8efhF0m/r613hL1raarFRkutVCivDeeoBHPQcay7UXwDpGmzDDkbM1/EVfvN
	 udlPIhr9CJz1HIO0uq9mERN9PHo/3xTE7M+pd8i6fiqta6dq/SkAbbRJgDioD/x37Q
	 K6On/LrCyU36pLcSw5hTrV2OKUd4VbsdZbD7mwxtMxJAvJT0MagtYKC/ha7yVPFX6l
	 aW90udr+qvjQg==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] arm64: dts: marvell: Move arch timer and pmu nodes to top-level
Date: Wed, 26 Feb 2025 15:47:47 -0600
Message-ID: <20250226214751.3751865-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_134808_495832_77C69EAD 
X-CRM114-Status: UNSURE (   9.56  )
X-CRM114-Notice: Please train this message.
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

The Arm arch timer and PMU are not memory-mapped peripherals, and
therefore should not be under a "simple-bus" node. Move them to the
top-level like other platforms.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 arch/arm64/boot/dts/marvell/armada-ap80x.dtsi | 29 ++++++++++---------
 .../boot/dts/marvell/armada-ap810-ap0.dtsi    | 18 ++++++------
 2 files changed, 24 insertions(+), 23 deletions(-)

diff --git a/arch/arm64/boot/dts/marvell/armada-ap80x.dtsi b/arch/arm64/boot/dts/marvell/armada-ap80x.dtsi
index fdf88cd0eb02..e206d03a2867 100644
--- a/arch/arm64/boot/dts/marvell/armada-ap80x.dtsi
+++ b/arch/arm64/boot/dts/marvell/armada-ap80x.dtsi
@@ -48,6 +48,21 @@ tee@4400000 {
 		};
 	};
 
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupt-parent = <&gic>;
+		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
+				<GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
+				<GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
+				<GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
+	};
+
+	pmu {
+		compatible = "arm,cortex-a72-pmu";
+		interrupt-parent = <&pic>;
+		interrupts = <17>;
+	};
+
 	AP_NAME {
 		#address-cells = <2>;
 		#size-cells = <2>;
@@ -122,20 +137,6 @@ gic_v2m3: v2m@2b0000 {
 				};
 			};
 
-			timer {
-				compatible = "arm,armv8-timer";
-				interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
-					     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
-					     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
-					     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
-			};
-
-			pmu {
-				compatible = "arm,cortex-a72-pmu";
-				interrupt-parent = <&pic>;
-				interrupts = <17>;
-			};
-
 			odmi: odmi@300000 {
 				compatible = "marvell,odmi-controller";
 				msi-controller;
diff --git a/arch/arm64/boot/dts/marvell/armada-ap810-ap0.dtsi b/arch/arm64/boot/dts/marvell/armada-ap810-ap0.dtsi
index 2f9ab6b4a2c9..f5a89af154d4 100644
--- a/arch/arm64/boot/dts/marvell/armada-ap810-ap0.dtsi
+++ b/arch/arm64/boot/dts/marvell/armada-ap810-ap0.dtsi
@@ -14,6 +14,7 @@ / {
 	compatible = "marvell,armada-ap810";
 	#address-cells = <2>;
 	#size-cells = <2>;
+	interrupt-parent = <&gic>;
 
 	aliases {
 		serial0 = &uart0_ap0;
@@ -25,11 +26,18 @@ psci {
 		method = "smc";
 	};
 
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
+				<GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
+				<GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
+				<GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
+	};
+
 	ap810-ap0 {
 		#address-cells = <2>;
 		#size-cells = <2>;
 		compatible = "simple-bus";
-		interrupt-parent = <&gic>;
 		ranges;
 
 		config-space@e8000000 {
@@ -62,14 +70,6 @@ gic_its_ap0: msi-controller@3040000 {
 				};
 			};
 
-			timer {
-				compatible = "arm,armv8-timer";
-				interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
-					     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
-					     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
-					     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
-			};
-
 			xor@400000 {
 				compatible = "marvell,armada-7k-xor", "marvell,xor-v2";
 				reg = <0x400000 0x1000>,
-- 
2.47.2


