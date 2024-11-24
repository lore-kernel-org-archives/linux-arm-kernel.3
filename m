Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 069C2E668A4
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 Nov 2024 10:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UiQBOSUat6/MpEQMZ5WV5NXHN8wVFmRDt81qJzKgjzo=; b=xAzI4S/NCud2vFKfVzuXy1f2R7
	4d9IAr+MGHITDcbKI8Pg5dF8t8XHQuBaX9dX5C571tD8gkDNjDn2vNtYDrz8jM0330cyMbOTnkNhf
	dSPoWLW0mXgfjveYFku5o3e4phTcbMGHY+HP96Q5F0IQRU8HSC1uHnpjJNIZbECRmbCkt1t64tYVi
	fdy8lMrnwjs+ami8MPyxgH0IC9x7xVrK1hKStRrTusrP2kYQwz6UmJDpPTi+cmdLOx8vnhOspn0ef
	dP78KHyizrpWfh3fVDlnyTZ8HkVcVBQUnTe5iURkO9eSWRx89Fd/J+vVtclzmqe7dbRv8E/QFASkR
	572U3lqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFAFI-00000005eFY-37BA;
	Sun, 24 Nov 2024 10:53:40 +0000
Received: from mail-ej1-x641.google.com ([2a00:1450:4864:20::641])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFAD3-00000005dUA-2G6v
	for linux-arm-kernel@lists.infradead.org;
	Sun, 24 Nov 2024 10:51:24 +0000
Received: by mail-ej1-x641.google.com with SMTP id a640c23a62f3a-aa1e6ecd353so245439966b.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 24 Nov 2024 02:51:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1732445480; x=1733050280; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UiQBOSUat6/MpEQMZ5WV5NXHN8wVFmRDt81qJzKgjzo=;
        b=OLETzhtzf2t/ii4hCAnQNeFiI+l8G6qjtLJhXLcG/KIhp+iTqQ18RLKBt5kCDkPxzG
         xvSKSANzTTn3cW/KQldY177MCSc5lc9RbxmpBpjzbEWcsiYY4cSpxaMiVP6agT23EiK4
         mK4LVAkrRk5SLIBp3FxUgCHYojg4P4PmLlpty/NrPkZZEOPAm9wTz/yochNZRtd9ltR5
         TI/S/jJVVjlDUmKdTrJk2aAJN1j3qXy6NI8t+PsHtE9da2VM0N+5NEEXtpi5QTJM1+r+
         Oiuave1IYwaAelR+4OFbRvfhG1x0Z+yUnn1+MAPQw9lrmq7ucVRuaQ4rFqupwVqPnEcf
         rUGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732445480; x=1733050280;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UiQBOSUat6/MpEQMZ5WV5NXHN8wVFmRDt81qJzKgjzo=;
        b=c35laMaXJm3rfR3qWco+EKI49rTsDLA9hZzrYewqQe/GTkFoFzaCJ5B9hvYUdsw8HN
         6Lc1b4Kp5dpgbi1EQ7l2zs7gWyIFB4hT7WmeVxNB0Cy9xKJT1FHEaASE06VDN2QZ3aQn
         ith78yZYpihnUbYcyzmBXu8LEuXIKaK2HDauJfuVcqTTT2nAzKTwtzrXG/RkuaQv3CLo
         06O2Dc2C5DcxHvbGifdtFsPPgBYYJs2o5EQo09S/WIiZYXv33lu1NfDmBTkDddNYYsC2
         0HiaAySs1t3DfKnYtiSNoVmKL3MEYY1/MQeZD+hcEpVOrMn3dFvRMB5CAsjmEAkqmKnr
         A0aQ==
X-Forwarded-Encrypted: i=1; AJvYcCWY2EdIeNDptyy+u9EuAtNYPPkuU2wLZ4MYxiLyNTPZl8HVbm7utaP9aR+SGOSf3Mp3bD1DcsgzifVrOY3g1EzA@lists.infradead.org
X-Gm-Message-State: AOJu0YwzsWk1FcbUpfKSLg9NjGsR9pRuOMTeT0ajLC5o0lIk+ZKOfaPx
	TFgbM9YlE4dafbB2rVh6iJXW0nEhujNpdwbrL/Ud6+cZv/ZEUzWv5D5OCt/lZv8=
X-Gm-Gg: ASbGncsKhnOYvfPqinu7N1sjsf9xjb87fDffqv8nIbThbHmDK9VxkIB+E59p1G1NZ4s
	bDT2w7wapS0qWbhmLi0mgHiFUF+nG6YezDiV9nauBPjSmvXImD6kfLLL6DtE0r7anCEumuqUCMI
	L/tfQ5/KyF9JIVYhVH9+f5Al7uAMtxmJa+OvaSiaN2AnQeokdGGFj5x8QecylHpmCANqFo0bGiw
	xELtCRxsKneHDMO3U8W/E1Ho41mpGO+/A31ZImBq1S6sl+HfOZwGOm47T+aEAHel5oYtIj4HmDW
	zu7rTyzi+TTdi3xWSi1t
X-Google-Smtp-Source: AGHT+IEcECfGErqOSiWGkH1B+1YRUlZYbqaKGgzHEHX7/TvPd1s9m12D5z2Knlx9Qs/dc2Xn6uFf1g==
X-Received: by 2002:a05:6402:27c9:b0:5ce:de19:472a with SMTP id 4fb4d7f45d1cf-5d02065f517mr7869583a12.16.1732445480000;
        Sun, 24 Nov 2024 02:51:20 -0800 (PST)
Received: from localhost (host-79-49-220-127.retail.telecomitalia.it. [79.49.220.127])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d01d3fc6besm2899729a12.55.2024.11.24.02.51.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Nov 2024 02:51:19 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
To: Andrea della Porta <andrea.porta@suse.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof Wilczynski <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Derek Kiernan <derek.kiernan@amd.com>,
	Dragan Cvetic <dragan.cvetic@amd.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Saravana Kannan <saravanak@google.com>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Herve Codina <herve.codina@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>
Subject: [PATCH v4 01/10] dt-bindings: clock: Add RaspberryPi RP1 clock bindings
Date: Sun, 24 Nov 2024 11:51:38 +0100
Message-ID: <5281e7b5aeb1cfc2f80c3234d9c3178c13b3b5b4.1732444746.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1732444746.git.andrea.porta@suse.com>
References: <cover.1732444746.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241124_025121_567786_2B96C01B 
X-CRM114-Status: GOOD (  17.27  )
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

Add device tree bindings for the clock generator found in RP1 multi
function device, and relative entries in MAINTAINERS file.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 .../clock/raspberrypi,rp1-clocks.yaml         | 58 ++++++++++++++++++
 MAINTAINERS                                   |  6 ++
 .../clock/raspberrypi,rp1-clocks.h            | 61 +++++++++++++++++++
 3 files changed, 125 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/raspberrypi,rp1-clocks.yaml
 create mode 100644 include/dt-bindings/clock/raspberrypi,rp1-clocks.h

diff --git a/Documentation/devicetree/bindings/clock/raspberrypi,rp1-clocks.yaml b/Documentation/devicetree/bindings/clock/raspberrypi,rp1-clocks.yaml
new file mode 100644
index 000000000000..b2670cf7403a
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/raspberrypi,rp1-clocks.yaml
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/raspberrypi,rp1-clocks.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: RaspberryPi RP1 clock generator
+
+maintainers:
+  - Andrea della Porta <andrea.porta@suse.com>
+
+description: |
+  The RP1 contains a clock generator designed as three PLLs (CORE, AUDIO,
+  VIDEO), and each PLL output can be programmed though dividers to generate
+  the clocks to drive the sub-peripherals embedded inside the chipset.
+
+  Link to datasheet:
+  https://datasheets.raspberrypi.com/rp1/rp1-peripherals.pdf
+
+properties:
+  compatible:
+    const: raspberrypi,rp1-clocks
+
+  reg:
+    maxItems: 1
+
+  '#clock-cells':
+    const: 1
+    description:
+      The available clocks are defined in
+      include/dt-bindings/clock/raspberrypi,rp1-clocks.h.
+
+  clocks:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - '#clock-cells'
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/raspberrypi,rp1-clocks.h>
+
+    rp1 {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        clocks@c040018000 {
+            compatible = "raspberrypi,rp1-clocks";
+            reg = <0xc0 0x40018000 0x0 0x10038>;
+            #clock-cells = <1>;
+            clocks = <&clk_rp1_xosc>;
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index c27f3190737f..75a66e3e34c9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19380,6 +19380,12 @@ F:	Documentation/devicetree/bindings/media/raspberrypi,pispbe.yaml
 F:	drivers/media/platform/raspberrypi/pisp_be/
 F:	include/uapi/linux/media/raspberrypi/
 
+RASPBERRY PI RP1 PCI DRIVER
+M:	Andrea della Porta <andrea.porta@suse.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/clock/raspberrypi,rp1-clocks.yaml
+F:	include/dt-bindings/clock/rp1.h
+
 RC-CORE / LIRC FRAMEWORK
 M:	Sean Young <sean@mess.org>
 L:	linux-media@vger.kernel.org
diff --git a/include/dt-bindings/clock/raspberrypi,rp1-clocks.h b/include/dt-bindings/clock/raspberrypi,rp1-clocks.h
new file mode 100644
index 000000000000..248efb895f35
--- /dev/null
+++ b/include/dt-bindings/clock/raspberrypi,rp1-clocks.h
@@ -0,0 +1,61 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (C) 2021 Raspberry Pi Ltd.
+ */
+
+#ifndef __DT_BINDINGS_CLOCK_RASPBERRYPI_RP1
+#define __DT_BINDINGS_CLOCK_RASPBERRYPI_RP1
+
+#define RP1_PLL_SYS_CORE		0
+#define RP1_PLL_AUDIO_CORE		1
+#define RP1_PLL_VIDEO_CORE		2
+
+#define RP1_PLL_SYS			3
+#define RP1_PLL_AUDIO			4
+#define RP1_PLL_VIDEO			5
+
+#define RP1_PLL_SYS_PRI_PH		6
+#define RP1_PLL_SYS_SEC_PH		7
+#define RP1_PLL_AUDIO_PRI_PH		8
+
+#define RP1_PLL_SYS_SEC			9
+#define RP1_PLL_AUDIO_SEC		10
+#define RP1_PLL_VIDEO_SEC		11
+
+#define RP1_CLK_SYS			12
+#define RP1_CLK_SLOW_SYS		13
+#define RP1_CLK_DMA			14
+#define RP1_CLK_UART			15
+#define RP1_CLK_ETH			16
+#define RP1_CLK_PWM0			17
+#define RP1_CLK_PWM1			18
+#define RP1_CLK_AUDIO_IN		19
+#define RP1_CLK_AUDIO_OUT		20
+#define RP1_CLK_I2S			21
+#define RP1_CLK_MIPI0_CFG		22
+#define RP1_CLK_MIPI1_CFG		23
+#define RP1_CLK_PCIE_AUX		24
+#define RP1_CLK_USBH0_MICROFRAME	25
+#define RP1_CLK_USBH1_MICROFRAME	26
+#define RP1_CLK_USBH0_SUSPEND		27
+#define RP1_CLK_USBH1_SUSPEND		28
+#define RP1_CLK_ETH_TSU			29
+#define RP1_CLK_ADC			30
+#define RP1_CLK_SDIO_TIMER		31
+#define RP1_CLK_SDIO_ALT_SRC		32
+#define RP1_CLK_GP0			33
+#define RP1_CLK_GP1			34
+#define RP1_CLK_GP2			35
+#define RP1_CLK_GP3			36
+#define RP1_CLK_GP4			37
+#define RP1_CLK_GP5			38
+#define RP1_CLK_VEC			39
+#define RP1_CLK_DPI			40
+#define RP1_CLK_MIPI0_DPI		41
+#define RP1_CLK_MIPI1_DPI		42
+
+/* Extra PLL output channels - RP1B0 only */
+#define RP1_PLL_VIDEO_PRI_PH		43
+#define RP1_PLL_AUDIO_TERN		44
+
+#endif
-- 
2.35.3


