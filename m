Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2BB0CAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 20 Sep 2025 16:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e0UgbCyg574tUWuvun0yte5YPn4KHmXOnmj3uYjhOYw=; b=PpjbH0q5MkSbjwGFL3OLXfJ0hn
	2qPdeushCaB/w32LGiJY68Nqr2V2LVQnYjAbqFnHv2Gz4umJqXwAoZAqWNFIDSbbtCNBK32Llxy0Z
	YwwsT8b3TNcFZ/fh9ZJpKhRXTY82SlFWRVe7hlbE1HZ8Y53XH3JdrVFo06Vkhf84yg/Mq/gMP402U
	APC/AYG1IB1NV14yKHacPS2EMHclVl0Wbkg8LjCdVWVTNjhmAmBSP6hJfAvJfvDjdfsNFXQyXv8AS
	iS79fue3bd3M5IuJT51oymQ87BlvXqsy723iVUqUYICMrLRUlWlXEBP1IhPvFVLptDuK0RjY4CNHx
	8QXCiqcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v00OU-00000005bk2-1WH5;
	Sat, 20 Sep 2025 16:25:02 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v00OM-00000005bdd-0kbn;
	Sat, 20 Sep 2025 16:24:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6B80244BD2;
	Sat, 20 Sep 2025 16:24:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 432B0C4CEFB;
	Sat, 20 Sep 2025 16:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758385493;
	bh=vr+vUucMTlHCNRTrav6CDTy/w5gINTD8DBlVa8EbYeg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=MyQwP0bIvozkCW66sMKeL/nIC5Kw9BjmZTVDLQlaseG54xYANBthiySy66N3qC8Rk
	 Gk5WACLw/XuqR+whggOcZZr8TgVMBj/xv4Kohdw/1veE6T4/syshAGJ6E17NOG1dWQ
	 tCJhvdRI6cv6/mZYXRVFV8Wap5n6Z+egXNU/SiEzTh2lV7Y5CxfD5Czk7ZVkTH2A4D
	 OkLHdTLOG6aTihTnyGLnjpou1158deB0wh1PRVKY+KXdiZTTdf5cAVQcEFZxBrGXtZ
	 En2T4FDU+nuAWC8HLv+gL71aIygeso6+qmlKlP3n+Ofz3EFHn85Z3CBSBGVNVGZx6B
	 MpNtuUKrPprIg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3425ACAC5A5;
	Sat, 20 Sep 2025 16:24:53 +0000 (UTC)
From: Cristian Cozzolino via B4 Relay <devnull+cristian_ci.protonmail.com@kernel.org>
Date: Sat, 20 Sep 2025 20:23:28 +0200
Subject: [PATCH 03/10] ARM: dts: mediatek: mt6582: move MMIO devices under
 soc node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250920-mt6582-v1-3-b887720f577d@protonmail.com>
References: <20250920-mt6582-v1-0-b887720f577d@protonmail.com>
In-Reply-To: <20250920-mt6582-v1-0-b887720f577d@protonmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Russell King <linux@armlinux.org.uk>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sean Wang <sean.wang@mediatek.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 phone-devel@vger.kernel.org, 
 Cristian Cozzolino <cristian_ci@protonmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758392693; l=4612;
 i=cristian_ci@protonmail.com; s=20250620; h=from:subject:message-id;
 bh=ygAMw2Q0SfkqnJBPfSCrpCT2WbyasWzsR4XcmLR13kA=;
 b=iYsV2k3gqnQRfJBNS7hWnK0zwFbYkC0sD2NkURCWkQsSwMGSTCgk/CMS5NtaUoD8dBNihHCaI
 GFvlo8/As1mAwsDJAAePOfGBuOtx51MKWZ0txLBmWR71Z3OTuzzO6dT
X-Developer-Key: i=cristian_ci@protonmail.com; a=ed25519;
 pk=xH5IvIPUNHV1Q8R0/pq2CfuVFR/wTiAyuyi6IwedjZY=
X-Endpoint-Received: by B4 Relay for cristian_ci@protonmail.com/20250620
 with auth_id=438
X-Original-From: Cristian Cozzolino <cristian_ci@protonmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250920_092454_265639_82494CB9 
X-CRM114-Status: UNSURE (   9.70  )
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
Reply-To: cristian_ci@protonmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Cristian Cozzolino <cristian_ci@protonmail.com>

Memory mapped devices are part of soc. So, add such node and move those
devices into it.

Signed-off-by: Cristian Cozzolino <cristian_ci@protonmail.com>
---
 arch/arm/boot/dts/mediatek/mt6582.dtsi | 129 +++++++++++++++++----------------
 1 file changed, 68 insertions(+), 61 deletions(-)

diff --git a/arch/arm/boot/dts/mediatek/mt6582.dtsi b/arch/arm/boot/dts/mediatek/mt6582.dtsi
index 4263371784cd15db7af0ceb49dd069b62b623639..37d2b8786188aecb65c0a6e0d31aabc3b66e2bd7 100644
--- a/arch/arm/boot/dts/mediatek/mt6582.dtsi
+++ b/arch/arm/boot/dts/mediatek/mt6582.dtsi
@@ -56,73 +56,80 @@ uart_clk: dummy26m {
 		#clock-cells = <0>;
 	};
 
-	timer: timer@11008000 {
-		compatible = "mediatek,mt6577-timer";
-		reg = <0x10008000 0x80>;
-		interrupts = <GIC_SPI 112 IRQ_TYPE_LEVEL_LOW>;
-		clocks = <&system_clk>, <&rtc_clk>;
-		clock-names = "system-clk", "rtc-clk";
-	};
+	soc {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		compatible = "simple-bus";
+		ranges;
 
-	sysirq: interrupt-controller@10200100 {
-		compatible = "mediatek,mt6582-sysirq",
-			     "mediatek,mt6577-sysirq";
-		interrupt-controller;
-		#interrupt-cells = <3>;
-		interrupt-parent = <&gic>;
-		reg = <0x10200100 0x1c>;
-	};
+		timer: timer@11008000 {
+			compatible = "mediatek,mt6577-timer";
+			reg = <0x10008000 0x80>;
+			interrupts = <GIC_SPI 112 IRQ_TYPE_LEVEL_LOW>;
+			clocks = <&system_clk>, <&rtc_clk>;
+			clock-names = "system-clk", "rtc-clk";
+		};
 
-	gic: interrupt-controller@10211000 {
-		compatible = "arm,cortex-a7-gic";
-		interrupt-controller;
-		#interrupt-cells = <3>;
-		interrupt-parent = <&gic>;
-		reg = <0x10211000 0x1000>,
-		      <0x10212000 0x2000>,
-		      <0x10214000 0x2000>,
-		      <0x10216000 0x2000>;
-	};
+		sysirq: interrupt-controller@10200100 {
+			compatible = "mediatek,mt6582-sysirq",
+				     "mediatek,mt6577-sysirq";
+			interrupt-controller;
+			#interrupt-cells = <3>;
+			interrupt-parent = <&gic>;
+			reg = <0x10200100 0x1c>;
+		};
 
-	uart0: serial@11002000 {
-		compatible = "mediatek,mt6582-uart",
-			     "mediatek,mt6577-uart";
-		reg = <0x11002000 0x400>;
-		interrupts = <GIC_SPI 51 IRQ_TYPE_LEVEL_LOW>;
-		clocks = <&uart_clk>;
-		status = "disabled";
-	};
+		gic: interrupt-controller@10211000 {
+			compatible = "arm,cortex-a7-gic";
+			interrupt-controller;
+			#interrupt-cells = <3>;
+			interrupt-parent = <&gic>;
+			reg = <0x10211000 0x1000>,
+			      <0x10212000 0x2000>,
+			      <0x10214000 0x2000>,
+			      <0x10216000 0x2000>;
+		};
 
-	uart1: serial@11003000 {
-		compatible = "mediatek,mt6582-uart",
-			     "mediatek,mt6577-uart";
-		reg = <0x11003000 0x400>;
-		interrupts = <GIC_SPI 52 IRQ_TYPE_LEVEL_LOW>;
-		clocks = <&uart_clk>;
-		status = "disabled";
-	};
+		uart0: serial@11002000 {
+			compatible = "mediatek,mt6582-uart",
+				     "mediatek,mt6577-uart";
+			reg = <0x11002000 0x400>;
+			interrupts = <GIC_SPI 51 IRQ_TYPE_LEVEL_LOW>;
+			clocks = <&uart_clk>;
+			status = "disabled";
+		};
 
-	uart2: serial@11004000 {
-		compatible = "mediatek,mt6582-uart",
-			     "mediatek,mt6577-uart";
-		reg = <0x11004000 0x400>;
-		interrupts = <GIC_SPI 53 IRQ_TYPE_LEVEL_LOW>;
-		clocks = <&uart_clk>;
-		status = "disabled";
-	};
+		uart1: serial@11003000 {
+			compatible = "mediatek,mt6582-uart",
+				     "mediatek,mt6577-uart";
+			reg = <0x11003000 0x400>;
+			interrupts = <GIC_SPI 52 IRQ_TYPE_LEVEL_LOW>;
+			clocks = <&uart_clk>;
+			status = "disabled";
+		};
 
-	uart3: serial@11005000 {
-		compatible = "mediatek,mt6582-uart",
-			     "mediatek,mt6577-uart";
-		reg = <0x11005000 0x400>;
-		interrupts = <GIC_SPI 54 IRQ_TYPE_LEVEL_LOW>;
-		clocks = <&uart_clk>;
-		status = "disabled";
-	};
+		uart2: serial@11004000 {
+			compatible = "mediatek,mt6582-uart",
+				     "mediatek,mt6577-uart";
+			reg = <0x11004000 0x400>;
+			interrupts = <GIC_SPI 53 IRQ_TYPE_LEVEL_LOW>;
+			clocks = <&uart_clk>;
+			status = "disabled";
+		};
+
+		uart3: serial@11005000 {
+			compatible = "mediatek,mt6582-uart",
+				     "mediatek,mt6577-uart";
+			reg = <0x11005000 0x400>;
+			interrupts = <GIC_SPI 54 IRQ_TYPE_LEVEL_LOW>;
+			clocks = <&uart_clk>;
+			status = "disabled";
+		};
 
-	watchdog: watchdog@10007000 {
-		compatible = "mediatek,mt6582-wdt",
-			     "mediatek,mt6589-wdt";
-		reg = <0x10007000 0x100>;
+		watchdog: watchdog@10007000 {
+			compatible = "mediatek,mt6582-wdt",
+				     "mediatek,mt6589-wdt";
+			reg = <0x10007000 0x100>;
+		};
 	};
 };

-- 
2.49.0



