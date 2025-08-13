Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08281C87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 11:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SM+zyPuzmR2HGY3T3v9tWbjhmCuFlgdsbGIWF0aqVTU=; b=YqlxfJxxb734Aq0m/CgMl+XpM5
	zXpevcfr2mgucqHlLxDObRU/S9XTmqAHYtQo0NHUnx4AnZlb41hvAoSBJhPRbXoUACqHbUoH4W5ud
	Xm+7heOF7xYv8L7JJU5pCfPJWifdNMFyLvZXg+FfrdY7cR/ppDlFfCvB5d7Nle8Xn1HIOxWzyCJel
	K9NNBY7a9K6Jb55q9ZSnMV5VIy1BPNmAn/gfkL+ukNxwuMQqIxKbJUV8QNcSz58SlTixQCgtwvvtt
	NiLwDt0BTrLFPb7Z1BTfnLmyaQgM9IoOfK/V0ryfvb7UxaeezJXdTwkg1gBQno+ODo4Pnb9mhaFP1
	R8HwdBOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um9Sl-0000000DUni-1yfy;
	Wed, 13 Aug 2025 11:16:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um8BC-0000000DHpA-0pbS
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 13 Aug 2025 09:53:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Reply-To:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Content-ID:Content-Description;
	bh=SM+zyPuzmR2HGY3T3v9tWbjhmCuFlgdsbGIWF0aqVTU=; b=q6kCm0YmMIoQM3xxusKVrZUKWw
	Xfbx1zgp8XvYydAwqGW1gQwHWPM5IItXwVj0XCKus5KsRsP/NrleHkBrNAFFJsD0C8lpr/21Jqqox
	SBhzZJNQ1nejIKK2wPpsz0dED/M6Iotpnr1YCyExqynXaVdtVUhSV+LwZLPulCSekpPD6RiTIry2u
	VLJafkMtpXQnVieP4aUhefxZau552rpCnT4d90dYGgJ1zoZuHw8JwR2lXuY/7irXbso0UcN/OI+cT
	xODSJzfinbi15SWOLHQIRBUlTnDbmwYNkm/W2oQKlmyms736s4nsRomx4zTWrWQKlxrov7xc9/Bej
	LzhlVAlw==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um8B7-0000000G3JO-2Vrj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 09:53:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B2F5445C2E;
	Wed, 13 Aug 2025 09:53:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 67D49C113D0;
	Wed, 13 Aug 2025 09:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755078830;
	bh=jPN0v70OwcYjIXRSNqY0ScIhvStfXtDwvU1h2Fu7Gd8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=AmFRHX0YbjrxGtdZCqlqhva6zJNa7kBM2325QEIGyAtRnvgSvqDxCqLIj17U2JFFY
	 Z2zhYjAzJsPST6ghMzAxaLgz/TiK53DpD/iQG99XeDMItG71pYU4EZpRvylWvCXv1i
	 n7CgJw07gabP8AelcYoS1BzalZ/ZQaLDV84zkX0Xl89sAROYl9pvDjjFnUrZb1zaAo
	 BCr3gOlRRRNsmStmSMh4nxxswCQv3m7hjf9GqILXetXEgYKBup9zSu0xECJPWqI80t
	 Zi0GKtP8t6GC6kWls0dx7aCWIMBdx884u/+8DT/7WYILm4COpKiuqjWhyavQ5MrSCO
	 rouFkaTF6ekMQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60A3CCA0EE0;
	Wed, 13 Aug 2025 09:53:50 +0000 (UTC)
From: Janne Grunau via B4 Relay <devnull+j.jannau.net@kernel.org>
Date: Wed, 13 Aug 2025 11:53:37 +0200
Subject: [PATCH 5/5] arm64: dts: apple: Add devicetreee for t8112-j415
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250813-apple-dt-sync-6-17-v1-5-209f15d10aa0@jannau.net>
References: <20250813-apple-dt-sync-6-17-v1-0-209f15d10aa0@jannau.net>
In-Reply-To: <20250813-apple-dt-sync-6-17-v1-0-209f15d10aa0@jannau.net>
To: Sven Peter <sven@kernel.org>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Mark Kettenis <kettenis@openbsd.org>, 
 Hector Martin <marcan@marcan.st>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Janne Grunau <j@jannau.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3232; i=j@jannau.net;
 s=yk2024; h=from:subject:message-id;
 bh=j/SpJUpMBqqMJF/E/m3nXQjyW/Z6PJx2/BxKhkTfoIQ=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhow5CWtKgtY+0FL7/rDyr1WzSVPh57e6DjMEJqlIz/m97
 IvM9HsHO0pZGMS4GGTFFFmStF92MKyuUYypfRAGM4eVCWQIAxenAExkbzPDf5e47DdhOWoftrt3
 vN5i/O3nw651SzO4DM6b62aUJM3sv8jI8PasQ8mfAIt2HQflkjXiFR4y3I+ya5d9vvHiIxuj8Sl
 bLgA=
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419
X-Endpoint-Received: by B4 Relay for j@jannau.net/yk2024 with auth_id=264
X-Original-From: Janne Grunau <j@jannau.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_105354_125351_EF902755 
X-CRM114-Status: GOOD (  13.79  )
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
Reply-To: j@jannau.net
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Janne Grunau <j@jannau.net>

The 15-inch M2 MacBook Air was released a year after the 13-inch one
thus missed in initial submission of devicetrees for M2 based devices.
It is currently a copy of t8112-j413 with edited identifiers but will
eventually differ in a meaningful way. It has for example a different
speaker configuration than the 13-inch model.

Signed-off-by: Janne Grunau <j@jannau.net>
---
 arch/arm64/boot/dts/apple/Makefile       |  1 +
 arch/arm64/boot/dts/apple/t8112-j415.dts | 80 ++++++++++++++++++++++++++++++++
 2 files changed, 81 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/Makefile b/arch/arm64/boot/dts/apple/Makefile
index 4f337bff36cdf51837ac7d50122692895026ce14..df4ba8ef6213c9f7e4ef02a50d7250008977cc71 100644
--- a/arch/arm64/boot/dts/apple/Makefile
+++ b/arch/arm64/boot/dts/apple/Makefile
@@ -80,5 +80,6 @@ dtb-$(CONFIG_ARCH_APPLE) += t6001-j316c.dtb
 dtb-$(CONFIG_ARCH_APPLE) += t6001-j375c.dtb
 dtb-$(CONFIG_ARCH_APPLE) += t6002-j375d.dtb
 dtb-$(CONFIG_ARCH_APPLE) += t8112-j413.dtb
+dtb-$(CONFIG_ARCH_APPLE) += t8112-j415.dtb
 dtb-$(CONFIG_ARCH_APPLE) += t8112-j473.dtb
 dtb-$(CONFIG_ARCH_APPLE) += t8112-j493.dtb
diff --git a/arch/arm64/boot/dts/apple/t8112-j415.dts b/arch/arm64/boot/dts/apple/t8112-j415.dts
new file mode 100644
index 0000000000000000000000000000000000000000..b54e218e5384ca89155e4350d6680a28a531f408
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/t8112-j415.dts
@@ -0,0 +1,80 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple MacBook Air (15-inch, M2, 2023)
+ *
+ * target-type: J415
+ *
+ * Copyright The Asahi Linux Contributors
+ */
+
+/dts-v1/;
+
+#include "t8112.dtsi"
+#include "t8112-jxxx.dtsi"
+#include <dt-bindings/leds/common.h>
+
+/ {
+	compatible = "apple,j415", "apple,t8112", "apple,arm-platform";
+	model = "Apple MacBook Air (15-inch, M2, 2023)";
+
+	aliases {
+		bluetooth0 = &bluetooth0;
+		wifi0 = &wifi0;
+	};
+
+	led-controller {
+		compatible = "pwm-leds";
+		led-0 {
+			pwms = <&fpwm1 0 40000>;
+			label = "kbd_backlight";
+			function = LED_FUNCTION_KBD_BACKLIGHT;
+			color = <LED_COLOR_ID_WHITE>;
+			max-brightness = <255>;
+			default-state = "keep";
+		};
+	};
+};
+
+/*
+ * Force the bus number assignments so that we can declare some of the
+ * on-board devices and properties that are populated by the bootloader
+ * (such as MAC addresses).
+ */
+&port00 {
+	bus-range = <1 1>;
+	wifi0: wifi@0,0 {
+		compatible = "pci14e4,4433";
+		reg = <0x10000 0x0 0x0 0x0 0x0>;
+		/* To be filled by the loader */
+		local-mac-address = [00 10 18 00 00 10];
+		apple,antenna-sku = "XX";
+		brcm,board-type = "apple,snake";
+	};
+
+	bluetooth0: bluetooth@0,1 {
+		compatible = "pci14e4,5f71";
+		reg = <0x10100 0x0 0x0 0x0 0x0>;
+		/* To be filled by the loader */
+		local-bd-address = [00 00 00 00 00 00];
+		brcm,board-type = "apple,snake";
+	};
+};
+
+&i2c0 {
+	/* MagSafe port */
+	hpm5: usb-pd@3a {
+		compatible = "apple,cd321x";
+		reg = <0x3a>;
+		interrupt-parent = <&pinctrl_ap>;
+		interrupts = <8 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-names = "irq";
+	};
+};
+
+&i2c4 {
+	status = "okay";
+};
+
+&fpwm1 {
+	status = "okay";
+};

-- 
2.50.1



