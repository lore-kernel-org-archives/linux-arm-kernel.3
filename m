Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1E60FF8875
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 19:14:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mK1m9udRxQHj0zYCLQVzg/V9Z3Gw4DlTQK/hyL0gOMA=; b=f/u124seHXYDO96/QgpSaTdy4I
	8lQi2Nb/N8dMHUxbW8fX98ebu2h777aSmwnWOgg3yT10rhrFaOKjjxNHQMfkJn9c7O/YMXdBpKU5a
	bIxQEj1l3mStTSRTIQ5GCNIITwiNx9LdushT3ElNxRsoobMMw9F+cB82ynC6nrY4O/w105nJ/86Wr
	bklSbs84drQNsVQ7NJIv1SC0TA1CuAaYXrLOq0RBoIheJa3EMGQCIgZV16DuPcOjBf1OFCCUcraJ1
	qaIzWAAbgWso3WGn2Ch+kJL82KsV8+1/sEVyPEZZFeXHVEjUzga0kbK6KHUJ6HLJn7y2JoipABTTj
	omCafRtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIAMm-0000000487y-0Kt6;
	Wed, 29 Apr 2026 19:14:36 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIAMj-00000004859-45cj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 19:14:35 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4852a9c6309so830255e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Apr 2026 12:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777490072; x=1778094872; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mK1m9udRxQHj0zYCLQVzg/V9Z3Gw4DlTQK/hyL0gOMA=;
        b=fMr6frsCfegonq0IwhwtTK7UC2LM2075y3Wh/rY/GmeGSLhUCYRqLrbuuqGWYSAIOA
         A1DlsGnaHpH/cvrW7rjtlIkaFp5jDHEK3glvKmemQHT68vBA9HdW0mP/TcJQu1p6ONt6
         8NzOcQg77rzhVMgSRP6mXsuHkp2u6/lhzJcUurKnBalQTCfRgNi8HA+UKPDqJF8Lt5af
         MwMLGUrVSZ0hJ1km12Xzph2vjQT+bPZF+dJUm39ULHTRWDMTTcRx/oBX+UlAhZd/Ezn3
         sDf6o7983O16PFedeor6ZNp8gs80yvWPmm58vioE3ZMx1x5B9hhctXtz8tSnvvAWIAwT
         /Ltw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777490072; x=1778094872;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mK1m9udRxQHj0zYCLQVzg/V9Z3Gw4DlTQK/hyL0gOMA=;
        b=OK2z47Z9KXkOGswJFgdoomgs1ku+bkYObSRd5txKoGqZGUJVvCb9+9411FFNGhmbNw
         C7od+H7cw6ssywNMvlJMwmwnmugish1B+/U0wl0W2/rFzOg/ZVAqf2pdbXpfvtHzr/Yq
         ggPpgNzrie631uVc4QLEidyvY7utQPEh1WYf7KZ/NKkrNgEPiZdX2kF4vu8c9fQLdDPE
         /qxjbQXtd7Al122S19BwQQN1mvBxtkZtHf/eO4cBxzATdbhywmJt3L0f1vYCL9H3mZuF
         TEXZjKQ/N/NWDa5BPTrJJwMGXbQJmQfpZa9UMTJjaFp+mFb9fogAVtdUV//3GcIJmYIk
         dO/Q==
X-Forwarded-Encrypted: i=1; AFNElJ9RfbwnVRgRDHsibPWfoZABOnM4tpobLw/2mk2BbZf71GZylq77c/eV/1lpAQdvDCENaFvXR5sfktrKYlAaFdOo@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+1axDlBaZs0Kw3y9BiDgJpG46u2MM1GhmQ14JJfLBQ2bRY6iy
	XGX/3nxeQp9nq/CDPZSKSTctuW96mxxpLrq4lPagBHckCabERgBCnSR0
X-Gm-Gg: AeBDietF3LIEbPh5IlPYzqhhFw0Ch74YYnBqznHwMw3jQeSLjftJX2kS1teBv04l2VZ
	z+oPfo1JqQnLJZzePsxBL3Omd7sez6kQdJu6n1XsU6EZhy3oMjult9KBp+aJilNoYsBgwmfnvWK
	8UVgvxjo2EsGssvUZDfMX2bcxTub058pyzXrUEr/zz9ffB5bRKE6y8KIcnswGJQxbYqQBblqtg2
	wRsNpBjyAjn8CNmKMCY/eHBWXgSaA6484ObwhjoSqn9O8NB4sKI+85/m0GLgfQf04A8q4mF5OQY
	7/wCDFYQLx7YSyjTKURhVocFRgIvcgSldQ4mwKi3vtVzqEY5GyZo9LpjxiUj+z6HjteiMJC2/H8
	e2OM/WSua1CUhWoHLtgnbphU7g+Pnr2RllnpW5f2KtrqCN5rf0JX2DgurKACYPx2TmtYOeH83Tz
	5e7NAQPag4f1cZH5o/mZ16FfDGtQC1ITGmGEGQYeDGm54=
X-Received: by 2002:a05:600c:530f:b0:488:b241:2c5f with SMTP id 5b1f17b1804b1-48a77b298b3mr135131605e9.26.1777490072141;
        Wed, 29 Apr 2026 12:14:32 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.51.50])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7c316d7esm23315005e9.24.2026.04.29.12.14.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 12:14:31 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Wed, 29 Apr 2026 22:13:16 +0300
Subject: [PATCH v7 5/6] ARM: dts: zte: Add D-Link DWR-932M support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260429-send-v7-5-b432e00d2db8@gmail.com>
References: <20260429-send-v7-0-b432e00d2db8@gmail.com>
In-Reply-To: <20260429-send-v7-0-b432e00d2db8@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Russell King <linux@armlinux.org.uk>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Linus Walleij <linusw@kernel.org>, Drew Fustini <fustini@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 soc@lists.linux.dev, linux-serial@vger.kernel.org, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=6135;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=7LiDLxjelI1MRSngPzWRBkqRNsscbkTyc8tG8Vfm5PA=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBp8lh1tloJjoHTz5voAxHKCRFWLmhY6bogPiefG
 IyMGNt2a96JAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCafJYdRsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiKS5w/+NyLFdHQ/LwCkbgeqQ3GufVgE0dd5DoK
 cRlXxYxtphF+Lv5/bOgLDme3hrWzpHqHpkGaRBCkd00oBRRlpTdL38en49eQuJZVHrvma2TqoTU
 9rqOFZcJ3N31UWuJ/urEcfHNFT6KkLa8k4mzRSp9VGdpQQQr3PvaybOgqBmfGs5T8tFn+rRO1Bp
 76+AAhs1aOjv1GLIExEwiE6RWiCB4WIwEWoHllkdSec4pn04S2ItHiYp6yqcpRE4s/vFVDOdO+o
 rihGz8U45p01J05ssBBkbSYZJWIM5Cor4hKRQ5gi9Jyf3HczyuGB8OBzJsY4n1Ubrz4E5fPSRO7
 e1dGUlCe+v+/R39MRyX9I7zbIoyGwi/lhCG/gqAxQNXpTrI8wjSe9qu5TYj+o2aTvlzSe4i7yte
 zcw0rnYtahTzM6hIgRgfeoXaMZ7POVVReLcBOzdHGEeY8o1oxPU9dqtnc/qD0msFntFgBm4nitn
 tDpSlps9k08RIXHUC3/tlM9J/YfNq8o5/G8obxDrGCKFCuvnFsB4x90iXFzGvykKdyJz1lxd0zg
 ytzzicSoiQkhLVoOuVJaRdBUdm72MrQX4ANfGnzZhbfbMZaW9BCwMuCzN8lLvcvBdP6/bJXU+AE
 +n8AqzPfZwlX0y1TFWq8MZP8Mab7EOq3bmswyD9VyceVXjeCUrRo=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_121434_054852_F278F969 
X-CRM114-Status: GOOD (  23.80  )
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

This adds base DT definition for zx297520v3 and one board that consumes it.

The stock kernel does not use the armv7 timer, but it seems to work
fine. The board has other board-specific timers that would need a driver
and I see no reason to bother with them since the arm standard timer
works.

The caveat is the non-standard GIC setup needed to handle the timer's
level-low PPI. This is the responsibility of the boot loader and
documented in Documentation/arch/arm/zte/zx297520v3.rst.

Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>

---

Changes in
v6: Squash board + timer + uart patches into one
v5: Prepend the SoC name in the device specific DTS filename.
v4:
  Declare all uarts
  Remove the UART aliases for now. I can revisit this when I get my
  hands on a board that exposes two UARTs.
---
 MAINTAINERS                                        |   1 +
 arch/arm/boot/dts/Makefile                         |   1 +
 arch/arm/boot/dts/zte/Makefile                     |   3 +
 arch/arm/boot/dts/zte/zx297520v3-dlink-dwr932m.dts |  22 +++++
 arch/arm/boot/dts/zte/zx297520v3.dtsi              | 103 +++++++++++++++++++++
 5 files changed, 130 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e707176c2114..6f51ba1c5ada 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3775,6 +3775,7 @@ F:	drivers/video/fbdev/wmt_ge_rops.*
 ARM/ZTE ZX29 SOC SUPPORT
 M:	Stefan Dösinger <stefandoesinger@gmail.com>
 F:	Documentation/devicetree/bindings/arm/zte.yaml
+F:	arch/arm/boot/dts/zte/
 F:	arch/arm/mach-zte/
 
 ARM/ZYNQ ARCHITECTURE
diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index efe38eb25301..28fba538d552 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -39,3 +39,4 @@ subdir-y += unisoc
 subdir-y += vt8500
 subdir-y += xen
 subdir-y += xilinx
+subdir-y += zte
diff --git a/arch/arm/boot/dts/zte/Makefile b/arch/arm/boot/dts/zte/Makefile
new file mode 100644
index 000000000000..f052cfbd636c
--- /dev/null
+++ b/arch/arm/boot/dts/zte/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0-only
+dtb-$(CONFIG_SOC_ZX297520V3) += \
+	zx297520v3-dlink-dwr932m.dtb
diff --git a/arch/arm/boot/dts/zte/zx297520v3-dlink-dwr932m.dts b/arch/arm/boot/dts/zte/zx297520v3-dlink-dwr932m.dts
new file mode 100644
index 000000000000..1700f46aba86
--- /dev/null
+++ b/arch/arm/boot/dts/zte/zx297520v3-dlink-dwr932m.dts
@@ -0,0 +1,22 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2026 Stefan Dösinger <stefandoesinger@gmail.com>
+ */
+
+/dts-v1/;
+
+#include "zx297520v3.dtsi"
+
+/ {
+	model = "D-Link DWR-932M";
+	compatible = "dlink,dwr932m", "zte,zx297520v3";
+
+	memory@20000000 {
+		device_type = "memory";
+		reg = <0x20000000 0x04000000>;
+	};
+};
+
+&uart1 {
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/zte/zx297520v3.dtsi b/arch/arm/boot/dts/zte/zx297520v3.dtsi
new file mode 100644
index 000000000000..ca65797ed926
--- /dev/null
+++ b/arch/arm/boot/dts/zte/zx297520v3.dtsi
@@ -0,0 +1,103 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2026 Stefan Dösinger <stefandoesinger@gmail.com>
+ */
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/ {
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu@0 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0>;
+		};
+	};
+
+	/* Base bus clock and default for the UART. It will be replaced once a clock driver has
+	 * been added.
+	 */
+	uartclk: uartclk: uartclk-26000000 {
+		#clock-cells = <0>;
+		compatible = "fixed-clock";
+		clock-frequency = <26000000>;
+	};
+
+	timer {
+		compatible = "arm,armv7-timer";
+		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
+		clock-frequency = <26000000>;
+		interrupt-parent = <&gic>;
+		/* I don't think uboot sets CNTVOFF and the stock kernel doesn't use the
+		 * arm timer at all. Since this is a single CPU system I don't think it
+		 * really matters that the offset is random though.
+		 */
+		arm,cpu-registers-not-fw-configured;
+	};
+
+	soc {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		compatible = "simple-bus";
+		interrupt-parent = <&gic>;
+		ranges;
+
+		/* The GIC has a non-standard way of configuring ints between level-low/level
+		 * high or rising edge/falling edge at 0xf2202070 and onwards. See AP_INT_MODE_BASE
+		 * and AP_PPI_MODE_REG in the ZTE kernel, although the offsets in the kernel source
+		 * seem wrong.
+		 *
+		 * Everything defaults to active-high/rising edge, but the timer is active-low. We
+		 * currently rely on the boot loader to change timer IRQs to active-low for us for
+		 * now.
+		 */
+		gic: interrupt-controller@f2000000 {
+			compatible = "arm,gic-v3";
+			interrupt-controller;
+			#interrupt-cells = <3>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			reg = <0xf2000000 0x10000>,
+			      <0xf2040000 0x20000>;
+		};
+
+		uart0: serial@131000 {
+			compatible = "arm,primecell";
+			arm,primecell-periphid = <0x0018c011>;
+			reg = <0x00131000 0x1000>;
+			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&uartclk>, <&uartclk>;
+			clock-names = "uartclk", "apb_pclk";
+			status = "disabled";
+		};
+
+		uart1: serial@1408000 {
+			compatible = "arm,pl011", "arm,primecell";
+			arm,primecell-periphid = <0x0018c011>;
+			reg = <0x01408000 0x1000>;
+			interrupts = <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&uartclk>, <&uartclk>;
+			clock-names = "uartclk", "apb_pclk";
+			status = "disabled";
+		};
+
+		uart2: serial@140d000 {
+			compatible = "arm,primecell";
+			arm,primecell-periphid = <0x0018c011>;
+			reg = <0x0140d000 0x1000>;
+			interrupts = <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&uartclk>, <&uartclk>;
+			clock-names = "uartclk", "apb_pclk";
+			status = "disabled";
+		};
+	};
+};

-- 
2.53.0


