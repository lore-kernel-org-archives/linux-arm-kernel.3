Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CE61C5AD55
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 14:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w2RxGy/HDr+ZHJEDxF0FWSRtIXjBooh011FJ3fxMxJo=; b=zNdPvwOqWZ73ef6mYDZBaMUobB
	Alvk0bcBVJB5s41PMsox/WislmIQqznttWRqX/qWNwxw+/aekv3MZ8KtC+3UdON38VOv1nLox4wdM
	3XWwtoDKOB3wiEygiLicovbrdQuMChrMhpUN0v52+jtlV8DZaE055BWF+lPeDy5byv2GT/AZjASCL
	laFOs4H9amyOQnLY07GlES5ywlJkKytQADbRRUVenvJI25Nq87x1Pvho6knKft8Vqp9H+6qTCIqOU
	YhmheWMMJKgthX2qgKnJb5toBuMuQDcU3CFvnErgJnP0MeE52almgcgvGHERFFWwyucdrDER+UmA6
	qbmpfzDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtQsG-0000000BzFj-2s9V;
	Mon, 10 Aug 2026 14:21:08 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtQs2-0000000Bz6I-2R9C
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 14:20:56 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-49800c6a846so18285135e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 07:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786371653; x=1786976453; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w2RxGy/HDr+ZHJEDxF0FWSRtIXjBooh011FJ3fxMxJo=;
        b=PFmEpQEyBhnPSPCS3lrt290ErJ05KVVweceDo1AaxDSiRowW+xhpfvYaG6qwIiZG14
         g/DpR83fA5X2wkMrDv0Ja9dpLBtoaNS6UUPfBRPFsnt63iy84I/nzXFwvv8bPSULPNqQ
         oQPM+/jV2GqHzEUV8PLIJJBPENtnz8u6rulC5AiTf7GziYhxTSowGxLqJoTKIAkdPPAQ
         KANa315oCBXLq13JiC+P7/i/4JOUJ5rILDT2PaCkJMOMJOUw+EiXimos4ItLqDP2cCQw
         i75rMWcOe76l+m64j1/rpk/UiEiWYGSJLVNOVbcyYleR9fxl2BWLd5ws9MLg9FanJpZY
         PQcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786371653; x=1786976453;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=w2RxGy/HDr+ZHJEDxF0FWSRtIXjBooh011FJ3fxMxJo=;
        b=NSUEhZ4AtVjVCi5obmH5/ERSpvu7lAFkDt1rT8i1Za/pbbv4uPZl+eoEG16S6/Kd+9
         7CkgMybvb4tIGnq6px3mYS2Lkry2HFHqIyFAWZk4hAzGanhcoAMT2jy0vj/0oXWWuKGO
         HANcXim4L4hFP933Ce2/6a5qAthQBtc0CTQbPVWJpeWeXj5MW/GIUHh8rsM8OFx8IHWt
         ttz5iOF6875PAeTv3Me7x4TtOD2m3Kn5hoG2wx1gc1jHPa25YPmtMelOq8eVwxsGkm9o
         lQYC4yfF0j4Wqd9t9nJFSx8qxTxWNimExROPNKA6xhYD3vW7ds1wkAFf1zypZEK2CjKk
         Nykw==
X-Forwarded-Encrypted: i=1; AHgh+RrUeFTPoa24eJXiIphHlGuS9vjmARP2hXNYdw1gwVqMVorVE+bEaK9Pw6CDeFucKt5zXnieE4qetHu0OZU3MxB9@lists.infradead.org
X-Gm-Message-State: AOJu0Yxo7xMZzJQUUVaea3kE2R68Ct+pp56W6ah12GyXjrf73Q/IWUJe
	9+Ow7S032MSKCCN8RiufeVXQjAByVONuHet+bnlB0HfsylM0awnyBFbD
X-Gm-Gg: AR+sD13xK2ci3rAP4m/aoHhNGcEUNonEPfI4SEfqxFi6LNLpyELQ/pWf0kwOSd9bazs
	T3QsdabdtJzAkA6GlzBOW9n493VBnOJ8vKsAEr6i/VOLnjwY+G23rnUri+9tnct70vFaDNggifC
	nE3SP1mJLYLgc6FWYw1EqnO1J3YesFFHx+iGZtukq3iE8jyU3VL2UIPkZIjjz+bo8/iqgqY32EH
	AhNA/keO2Em5Pi+RPavmL+Qpyoqj7i/mznKWLBXhqdOAVKU9MIzJFVfJchKi3LpCqswyO0CuCta
	zNwGMpQ3NzA5swrALPnEPr8Wm6vow9bXARQ96fNxezPsJI3cvbuZ9hwuZOMeWvcg60ZOQHYTodh
	jyXmuIb7brI42O30tKWrDa4g4dWc6jLOvgy0ur4sO+k67pw0ZqTNsMNHny4PYJddLukkD59ez/z
	cA0MSepb5gsmf0OwAIJuPEgcNV4wKI4Jhvv7grstgNSeYXqiALbsM8xa4+ANHOmpIIQ8/8lILMd
	HbX9w==
X-Received: by 2002:a05:600c:3b04:b0:490:c6c2:52 with SMTP id 5b1f17b1804b1-49959e016f2mr400732305e9.3.1786371652873;
        Mon, 10 Aug 2026 07:20:52 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995919df87sm354413055e9.6.2026.08.10.07.20.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 07:20:52 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Stefan Agner <stefan@agner.ch>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Francesco Dolcini <francesco@dolcini.it>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/4] ARM: dts: vf: add Iris carrier board support for Colibri VF50 and VF61
Date: Mon, 10 Aug 2026 16:20:47 +0200
Message-ID: <20260810142047.2811230-5-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260810142047.2811230-1-mehmet.fide@gmail.com>
References: <20260810140053.2793495-1-mehmet.fide@gmail.com>
 <20260810142047.2811230-1-mehmet.fide@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_072054_650730_A7720D78 
X-CRM114-Status: GOOD (  25.27  )
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

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

Mainline carries Iris device trees for every i.MX Colibri but none for the
Vybrid ones, so a VF50 or VF61 on that carrier has nothing to boot with
except the eval board tree, which describes different hardware.

Add the carrier, following the layout of the i.MX Iris trees: a common
dtsi and one dts per module. It enables the microSD slot, the three UARTs,
SPI, Ethernet, USB and the M41T0 clock on the carrier, switches USB host
VBUS through a regulator on SODIMM 129, and hogs the two GPIOs that turn
the RS232 transceivers on, SODIMM 102 and 104. The touchscreen is an
add-on rather than part of the board, so it is left out.

This describes an Iris V1.1. A V2.0 carries the same signals on the same
pins; what it adds, and what this does not describe, is the regulator on
SODIMM 100 that can cut power to the uSD slot.

Tested on a Colibri VF50 on an Iris V1.1 running 6.18: Ethernet at
100Mbps/Full, a USB dongle enumerating once the VBUS regulator is in
place, the RTC read back over i2c0, all three UARTs, the SPI controller
registering, the microSD slot, and both hogs holding their pins.

Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---
 arch/arm/boot/dts/nxp/vf/Makefile             |   2 +
 arch/arm/boot/dts/nxp/vf/vf-colibri-iris.dtsi | 125 ++++++++++++++++++
 .../boot/dts/nxp/vf/vf500-colibri-iris.dts    |  14 ++
 .../boot/dts/nxp/vf/vf610-colibri-iris.dts    |  13 ++
 4 files changed, 154 insertions(+)
 create mode 100644 arch/arm/boot/dts/nxp/vf/vf-colibri-iris.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/vf/vf500-colibri-iris.dts
 create mode 100644 arch/arm/boot/dts/nxp/vf/vf610-colibri-iris.dts

diff --git a/arch/arm/boot/dts/nxp/vf/Makefile b/arch/arm/boot/dts/nxp/vf/Makefile
index 0a4a7f9..47be8bc 100644
--- a/arch/arm/boot/dts/nxp/vf/Makefile
+++ b/arch/arm/boot/dts/nxp/vf/Makefile
@@ -1,8 +1,10 @@
 # SPDX-License-Identifier: GPL-2.0
 dtb-$(CONFIG_SOC_VF610) += \
 	vf500-colibri-eval-v3.dtb \
+	vf500-colibri-iris.dtb \
 	vf610-bk4.dtb \
 	vf610-colibri-eval-v3.dtb \
+	vf610-colibri-iris.dtb \
 	vf610m4-colibri.dtb \
 	vf610-cosmic.dtb \
 	vf610m4-cosmic.dtb \
diff --git a/arch/arm/boot/dts/nxp/vf/vf-colibri-iris.dtsi b/arch/arm/boot/dts/nxp/vf/vf-colibri-iris.dtsi
new file mode 100644
index 0000000..d0fa107
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/vf/vf-colibri-iris.dtsi
@@ -0,0 +1,125 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright 2026 Mehmet Fide
+ *
+ * Toradex Iris carrier board V1.1, common part for Colibri VF50 and VF61.
+ *
+ * The Colibri modules are pin compatible, so the carrier signals sit on the
+ * same SODIMM pins as they do for the i.MX modules, whose Iris device trees
+ * are already upstream. The two SODIMM pins below are taken from the Colibri
+ * VFxx datasheet (102 -> PTA12 -> PORT0[5], 104 -> PTD28 -> PORT2[2]).
+ *
+ * An Iris V2.0 carries the same signals on the same pins, so everything here
+ * works on it as well. What it adds is a regulator on SODIMM 100 that can cut
+ * power to the uSD slot, which this file does not describe.
+ */
+
+/ {
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	reg_5v0: regulator-5v0 {
+		compatible = "regulator-fixed";
+		regulator-name = "5V";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+	};
+
+	reg_usbh_vbus: regulator-usbh-vbus {
+		compatible = "regulator-fixed";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_usbh1_reg>;
+		regulator-name = "VCC_USB[1-4]";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&gpio2 19 GPIO_ACTIVE_LOW>;	/* SODIMM 129, USBH_PEN */
+		vin-supply = <&reg_5v0>;
+	};
+};
+
+&gpio0 {
+	/*
+	 * The RS232 transceivers on the carrier are switched on by these two
+	 * lines. Delete the hog to turn a transceiver off from userspace.
+	 * The pin group belongs to the gpio controller rather than to iomuxc,
+	 * which would depend on its own child and log a dependency cycle.
+	 */
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_iris_uart1_tx_on>;
+
+	uart1-tx-on-hog {
+		gpio-hog;
+		gpios = <5 GPIO_ACTIVE_HIGH>;	/* SODIMM 102 */
+		output-high;
+	};
+};
+
+&gpio2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_iris_uart25_tx_on>;
+
+	uart25-tx-on-hog {
+		gpio-hog;
+		gpios = <2 GPIO_ACTIVE_HIGH>;	/* SODIMM 104 */
+		output-high;
+	};
+};
+
+&iomuxc {
+	pinctrl_iris_uart1_tx_on: irisuart1txongrp {
+		fsl,pins = <
+			VF610_PAD_PTA12__GPIO_5		0x22ef
+		>;
+	};
+
+	pinctrl_iris_uart25_tx_on: irisuart25txongrp {
+		fsl,pins = <
+			VF610_PAD_PTD28__GPIO_66	0x22ef
+		>;
+	};
+};
+
+/* Colibri SSP, on the extension connector */
+&dspi1 {
+	status = "okay";
+};
+
+&esdhc1 {
+	status = "okay";
+};
+
+&fec1 {
+	status = "okay";
+};
+
+&i2c0 {
+	status = "okay";
+
+	/* M41T0M6 real time clock on the carrier */
+	rtc@68 {
+		compatible = "st,m41t0";
+		reg = <0x68>;
+	};
+};
+
+&uart0 {
+	status = "okay";
+};
+
+&uart1 {
+	status = "okay";
+};
+
+&uart2 {
+	status = "okay";
+};
+
+&usbdev0 {
+	status = "okay";
+};
+
+&usbh1 {
+	vbus-supply = <&reg_usbh_vbus>;
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/nxp/vf/vf500-colibri-iris.dts b/arch/arm/boot/dts/nxp/vf/vf500-colibri-iris.dts
new file mode 100644
index 0000000..53dd252
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/vf/vf500-colibri-iris.dts
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright 2026 Mehmet Fide
+ */
+
+/dts-v1/;
+#include "vf500-colibri.dtsi"
+#include "vf-colibri-iris.dtsi"
+
+/ {
+	model = "Toradex Colibri VF50 on Iris Carrier Board";
+	compatible = "toradex,vf500-colibri_vf50-on-iris", "toradex,vf500-colibri_vf50", "fsl,vf500";
+};
+
diff --git a/arch/arm/boot/dts/nxp/vf/vf610-colibri-iris.dts b/arch/arm/boot/dts/nxp/vf/vf610-colibri-iris.dts
new file mode 100644
index 0000000..2882c87
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/vf/vf610-colibri-iris.dts
@@ -0,0 +1,13 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright 2026 Mehmet Fide
+ */
+
+/dts-v1/;
+#include "vf610-colibri.dtsi"
+#include "vf-colibri-iris.dtsi"
+
+/ {
+	model = "Toradex Colibri VF61 on Iris Carrier Board";
+	compatible = "toradex,vf610-colibri_vf61-on-iris", "toradex,vf610-colibri_vf61", "fsl,vf610";
+};
-- 
2.54.0


