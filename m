Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50167C36002
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 22:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zsEMheFdM3P6py7SJSWwUeyNGCIkxX8eSy5GQiAwxMc=; b=xgnqd+/f7XFO+13hSzbQ99XBr6
	XIRnX10F88Jtt7nIQWGg/sgetGRbW3TFHwoPWwPSe3L/4Cl08p/m2tG+iYnAgbZdlNrVXRJPGY+aj
	/7W1MvZKeTdKL2IUEP2tQAvreMT48Nnft6lkFwg7lA8OL0Vj1cq2vZfaLVllHowfEumF5acMjxymR
	b4Kq39aV4CNyq5PceVgsmQYCuM2d9/KfwDOyNyTuYM6jTQvaTimJuKnLIBJ+uP2QypfESJP78QiFG
	KdELqAxoN23jmZpOoGfSrNFrhqAzjDUCf3efORXtRGwq1SVlAm5vjq8TbBnKI4mjGe1BMdYcH3+By
	6b1FOZzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2dXy-00000008fMV-0yIb;
	Wed, 09 Apr 2025 22:05:26 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2dLX-00000008dTg-062S
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 21:52:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6D1EB4A32D;
	Wed,  9 Apr 2025 21:52:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F1375C4CEED;
	Wed,  9 Apr 2025 21:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744235554;
	bh=tDrAT+BbyeoPC1cnbHm+N0m2OZYVHsC6MBKxaijdOFE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=K9jjtyv29hIh4quHKzqIOZFAsLHTicus/m/wRN6J5XGuzpWFVK58fQVW0UY2DPkPP
	 wAn5mm+8S264/+dcpUFBbEMb9rBfFwVe1twam4W8ZSKJMJLHFu5oP7rCGagzeJUfBK
	 N0xaum3ROG6A3bKWYnMlJuRUbHBXW/cfUL+tAg9rvuc+g+RUL6dgUGTwEew9L3MPuq
	 twbcgU8iuSVzn9MbRT+T3mzDnlvwHZ/ma7aNZRFcMACR71bVQQ229vyzHckKUc23nh
	 a1Xyt1BSwLWLVpOABV1p0QeVYDd9C2nuXzPwULEsyF9rMSzqtraYB99ghAZEejCMys
	 O8M5HarrwbJXw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E571DC36002;
	Wed,  9 Apr 2025 21:52:33 +0000 (UTC)
From: Sasha Finkelstein via B4 Relay <devnull+fnkl.kernel.gmail.com@kernel.org>
Date: Wed, 09 Apr 2025 23:52:14 +0200
Subject: [PATCH v4 3/3] arm64: dts: apple: Add SPMI controller nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250409-spmi-v4-3-eb81ecfd1f64@gmail.com>
References: <20250409-spmi-v4-0-eb81ecfd1f64@gmail.com>
In-Reply-To: <20250409-spmi-v4-0-eb81ecfd1f64@gmail.com>
To: Sven Peter <sven@svenpeter.dev>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Stephen Boyd <sboyd@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Neal Gompa <neal@gompa.dev>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Sasha Finkelstein <fnkl.kernel@gmail.com>, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744235552; l=2708;
 i=fnkl.kernel@gmail.com; s=20241124; h=from:subject:message-id;
 bh=GL5MDHX1ynp82oR1XOrB9Oz6SPOYuVIO8f/ENpih52M=;
 b=eQ4cnKeAdHlViCFW86uXUAWuk+qcZDOtzliKB2jTojwIJAhnsrdgxfBvAUS5m5KGemviidJ7+
 hVrUhk3rK6cDV8thV+2YlzTrYJLZlMpMvvPNKo8WS6i069iXeXTce9X
X-Developer-Key: i=fnkl.kernel@gmail.com; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=
X-Endpoint-Received: by B4 Relay for fnkl.kernel@gmail.com/20241124 with
 auth_id=283
X-Original-From: Sasha Finkelstein <fnkl.kernel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_145235_109373_6477FA4E 
X-CRM114-Status: UNSURE (   9.82  )
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
Reply-To: fnkl.kernel@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Sasha Finkelstein <fnkl.kernel@gmail.com>

Add device tree entries for the SPMI controller

Reviewed-by: Nick Chan <towinchenmi@gmail.com>
Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
---
 arch/arm64/boot/dts/apple/t600x-die0.dtsi | 7 +++++++
 arch/arm64/boot/dts/apple/t8103.dtsi      | 8 ++++++++
 arch/arm64/boot/dts/apple/t8112.dtsi      | 7 +++++++
 3 files changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t600x-die0.dtsi b/arch/arm64/boot/dts/apple/t600x-die0.dtsi
index e9b3140ba1a996eeb91b3f60470833060b632bd2..4c224e686ffe5602329f7f394d3354559c4130ab 100644
--- a/arch/arm64/boot/dts/apple/t600x-die0.dtsi
+++ b/arch/arm64/boot/dts/apple/t600x-die0.dtsi
@@ -45,6 +45,13 @@ pinctrl_smc: pinctrl@290820000 {
 				<AIC_IRQ 0 749 IRQ_TYPE_LEVEL_HIGH>;
 	};
 
+	nub_spmi0: spmi@2920a1300 {
+		compatible = "apple,t6000-spmi", "apple,spmi";
+		reg = <0x2 0x920a1300 0x0 0x100>;
+		#address-cells = <2>;
+		#size-cells = <0>;
+	};
+
 	wdt: watchdog@2922b0000 {
 		compatible = "apple,t6000-wdt", "apple,wdt";
 		reg = <0x2 0x922b0000 0x0 0x4000>;
diff --git a/arch/arm64/boot/dts/apple/t8103.dtsi b/arch/arm64/boot/dts/apple/t8103.dtsi
index 97b6a067394e311ed19392a34237c74936dbb7d7..bdb1cb9e406a441e458b1c735359b0148146e91b 100644
--- a/arch/arm64/boot/dts/apple/t8103.dtsi
+++ b/arch/arm64/boot/dts/apple/t8103.dtsi
@@ -11,6 +11,7 @@
 #include <dt-bindings/interrupt-controller/apple-aic.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/pinctrl/apple.h>
+#include <dt-bindings/spmi/spmi.h>
 
 / {
 	compatible = "apple,t8103", "apple,arm-platform";
@@ -741,6 +742,13 @@ pcie_pins: pcie-pins {
 			};
 		};
 
+		nub_spmi: spmi@23d0d9300 {
+			compatible = "apple,t8103-spmi", "apple,spmi";
+			reg = <0x2 0x3d0d9300 0x0 0x100>;
+			#address-cells = <2>;
+			#size-cells = <0>;
+		};
+
 		pinctrl_nub: pinctrl@23d1f0000 {
 			compatible = "apple,t8103-pinctrl", "apple,pinctrl";
 			reg = <0x2 0x3d1f0000 0x0 0x4000>;
diff --git a/arch/arm64/boot/dts/apple/t8112.dtsi b/arch/arm64/boot/dts/apple/t8112.dtsi
index d9b966d68e4fae2dfb21d6fb7a97ebba81643ae8..950d1f906ba3023c1d118179207a2099345aae94 100644
--- a/arch/arm64/boot/dts/apple/t8112.dtsi
+++ b/arch/arm64/boot/dts/apple/t8112.dtsi
@@ -782,6 +782,13 @@ wdt: watchdog@23d2b0000 {
 			interrupts = <AIC_IRQ 379 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		nub_spmi: spmi@23d714000 {
+			compatible = "apple,t8112-spmi", "apple,spmi";
+			reg = <0x2 0x3d714000 0x0 0x100>;
+			#address-cells = <2>;
+			#size-cells = <0>;
+		};
+
 		pinctrl_smc: pinctrl@23e820000 {
 			compatible = "apple,t8112-pinctrl", "apple,pinctrl";
 			reg = <0x2 0x3e820000 0x0 0x4000>;

-- 
2.49.0



