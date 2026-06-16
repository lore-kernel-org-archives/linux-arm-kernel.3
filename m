Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C2D8CD98E6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 20:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rUmYrMa2a929oow4K0kGQmeQ8euSAQ5ozU/DAB8krW0=; b=fWfikGDLf6wzqQpKmLzxIAKE5X
	P+wJ7tXEDgNgrroTtKGSbHlv98ZC3HwcRRjx/YaB+yHr6BaTZA4LWy4tUiN+O/2cQ8t7rNaOQllj7
	0e750GSI+dQEna5nBMZO4yiQLQI6thMN3Wi7aKFg/TmYfE3fnTPW58taU/BG4hXKL2/ZMp0jBHUwB
	Q8v2SlrRVNL++7LnYQfhaTfdx0jRvguAXVjxyHQfk1oczNH677gvHgfKNJph4ZbGW4vBZewJtfqt/
	IWYlT8SQ8SWZeMWpcpc6oB/MdeBhlxYWCpO8fES4WXwefPBHpkmz9TlyyV2lTrdo9cEc80sdDPw58
	ejCKyQTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZaNA-0000000GHqL-2kZ2;
	Tue, 16 Jun 2026 20:27:00 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZaN6-0000000GHpD-46Jw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Jun 2026 20:26:58 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4921e4dd62dso2252395e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Jun 2026 13:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781641615; x=1782246415; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rUmYrMa2a929oow4K0kGQmeQ8euSAQ5ozU/DAB8krW0=;
        b=E/nCnxs/iIz9rwgkQprOtQVrH6NjXp30LTO40UDuBICCARWQURuJsFg59VFIs/yBL8
         ToHhBv0I56G4vznxGWwU//wTAANhOUkyNXfbhNi6hazOMGQ2jRXpbDZUYYl+gbBN86x7
         JliLtZlc/6GcTuxFRMJm+eMKHRUrRIyyxEGxnnCaj/QjUwmABoteZHVuPKEGbahWzDRB
         LQ92mHmmRRQ2V6aSmatNCQ8GkkzSjMfUMhnvNBJivga0RBi+W0IZTlarOV4DDgmAK7om
         7GtamVTTg3xet7Iwg91ie2inE8rtnHHSGaNmYJwy8yRXiTFE2QZCpSO4TYnQ1OeiP8so
         fVrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781641615; x=1782246415;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rUmYrMa2a929oow4K0kGQmeQ8euSAQ5ozU/DAB8krW0=;
        b=eWBJip0soQCpoN8eFyKUwg49iU1Eko33Tk89Q1vxzg5n1qsSfWfPPHWC9UOz34Vzg0
         uAuK2mQ4vGpbsX+3fkY0SSgeKdjNpAOcEFx0XkORpscPXH5nLh+ChOY9l3b5khjPLqIm
         hoquWBLscHH4mNmMsOTd8LukQJTQtbbfGlMEpKGiYllKcp76wCbt5RoGJa2pzWxpHyS9
         3m3waM/v6muN1WCc4bStO8XvvFbGo/s2U/LAGY2cbQfb6DdxcEbJbfhD1oFYRkGAej2/
         FFaCaGVaEfCoIjH1IINxIxevYH+xjTvpVSe3isjG9gyPWGUAz3Q0vBgKRO5j2i5VqXcN
         x1Iw==
X-Forwarded-Encrypted: i=1; AFNElJ8Zjz4MgVtPmbNlAfZHJFGr+8xJWkAWiyVWCepcqW2g8L0QIeo8Jmujn8IdBHc2xDV+a2Dektkh6vJQ3kqvjxgE@lists.infradead.org
X-Gm-Message-State: AOJu0YzMnz4lJ888imLcPTrSFtNU6R94WcH+IpYLZuNoE7caEqSrp0Hu
	h/uwA3LqA/QQvuEyaLdJfWSWZ/26oQ1Q1+PRn9IYH5SI/8TQPOVu+Wze
X-Gm-Gg: Acq92OE/MUVwqp9sR57Z7QWLj1BzGU2yAGN24gCSVnTyier8PfgK5+7SEhvJmlh1Dl0
	Gb28CBlbTciG/rvjdvZybQtfR7paYJljGtjljnDfgEKMlKNy5dpPnmJAoyYCYz0iOHZae67D6Lg
	tZTDlYeW+/cd765dRXD87u9OX4sYEDpqloIjW5VcarCu3lxQsAk55u57VDKmPfMUjwzo/luK8Gv
	hE+/e0exwdIgEXLTT3/vB3+R1mmXYXxlaQwHffs0GF+HiD0XWmjp6BhMxpm2DalZUfJjNVUlind
	hWAyA1jPNQFD3yt3DV0jm8lcYBzo7gr5UC9+JXP6+/6b6dn3IKBvPibW2IEPvFM/zeXW37uNAlu
	3I9817vDF9TD2E1oVyvycaaU3FUsZITghlWMAeszv7XbHrGMzz72K9+J8rNXyLY4teFlhfImlLB
	O7Jgb5tx1iX0H/XOb77oJWCbKrU86mft6OpA==
X-Received: by 2002:a05:600c:8b83:b0:489:32b:ac0b with SMTP id 5b1f17b1804b1-492340c5eb5mr3321645e9.6.1781641614915;
        Tue, 16 Jun 2026 13:26:54 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.51.220])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49230a458f2sm89987005e9.3.2026.06.16.13.26.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 13:26:54 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Tue, 16 Jun 2026 23:26:21 +0300
Subject: [PATCH RFC v4 01/12] dt-bindings: clk: zte: Add zx297520v3 top
 clock and reset bindings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260616-zx29clk-v4-1-ca994bd22e9d@gmail.com>
References: <20260616-zx29clk-v4-0-ca994bd22e9d@gmail.com>
In-Reply-To: <20260616-zx29clk-v4-0-ca994bd22e9d@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Brian Masney <bmasney@redhat.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=9380;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=EhdBvdiVrO8rOSTQ2CUBEIa8UYk8Rkh7tz54zYD05Qk=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBqMbGGN3MQD58npdh76POdP4gdkZzPN/KGEJEmI
 DYwcSBZmKiJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCajGxhhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiJxMQ//dg9SlBJQ1UP2n6iVcOpfOYchqn0lSiV
 O33z7NFotUzB5JIjX7aZqEfFOvjPZIgRXhmn0vJCLhT0janHH6Un//79duLKb22k0ZVlnZjI9ph
 xFJ5egU9kU4rWhDF7W9AiWqcrMGQDFThWiPW7lyPmOzUeqJYqu76ucPFfA01ovE2ZWIOSj6tNZf
 ownA4vjBzzeZis802xJ3fUaPbQ0Vwswb5UiZ1c5v2/4S8igElO71YnGOjtR+KKUQRJ74VGTMZfp
 dV3VYbQem/KSJh6dyH8y0lmjizSKzaf81TYGByRa+zOdRuEx/MvnEzqmPUwMizrerCHNXhXqFTN
 SbqJD2ivCCOgwamCO9N6pG5aYJ+sjAAc3Hbda55icVQH/p/oeNvQH5rGVYdrc6nxQ+jRbGIEt9A
 DBJ4zxALEoP3KqTfh7SjKFpjOhHpVw/88QxTwUBPyIp0lDSUb7jwckOmLi1p9T1d6bgGT/Yq+Dv
 Oz4yqmQ4B5dFvac0NkSO6xCn6LQ8Fd6sLNS0G05rK8D3Ke1mTdC8EnOKwAIg5K4A/90XHJQNd1+
 y88DdUKEJHs/Ccz6JL6rIkay4FFUc7+rRX9YK900ht8pdRPG69B18d2cjCNhlQpeiqt0zT99esF
 JxsL6QEg/7iNIC+QnsY7meeb8P0joAavw1beIVyeD0JWipZ65diM=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_132657_068322_009017D9 
X-CRM114-Status: GOOD (  26.98  )
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

These SoCs have 3 clock and reset controllers: Top, Matrix and LSP. The
separation of concerns between Top and Matrix and the interface between
them is poorly defined in the hardware, so the bindings list all
potential PLL clocks that might be passed between them.

Generally every device has two clocks (one work clock, and one that
connects it to the bus, I call it PCLK), two reset bits (I don't know
what the difference is - sometimes asserting one is enough to reset the
device, sometimes both need to be asserted). PCLK and WCLK are
controlled by individual gates. Some devices have a mux and/or a
divider for their work clock. Some devices, like the GPIO controller,
only have reset bits and no clocks.

The top clock controller is fed by a 26mhz external oscillator and has 4
PLLs to generate other clock rates. ZTE's kernel mostly relies on the
boot ROM to set up PLLs, but one LTE-Related PLL is not configured
on some boards. Therefore my driver contains code to program PLLs. It
produces identical settings as the boot ROM for the pre-programmed
frequencies.

Not all clocks will have an explicit user in the end. I am defining a
lot of them simply to shut them off. The boot loader sets up a few of
the proprietary timers, which will send regular IRQs (although the
kernel of course doesn't need to listen to them). I don't plan to add a
driver for the proprietary timer as I see no use for them - the ARM arch
timer works just fine. I will add a driver for the very similar
proprietary watchdog though.

The clock list in this patch is pretty complete but not exhaustive.
There are other bits that are enabled, but I couldn't deduce what they
are controlling by trial and error. Some of them seem to do nothing.
Others cause an instant hang of the board when disabled. It is quite
likely that a handful more clocks will be added in the future, but not a
large number.

Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>
---
 .../bindings/clock/zte,zx297520v3-topclk.yaml      |  70 ++++++++++++
 MAINTAINERS                                        |   2 +
 include/dt-bindings/clock/zte,zx297520v3-clk.h     | 118 +++++++++++++++++++++
 3 files changed, 190 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/zte,zx297520v3-topclk.yaml b/Documentation/devicetree/bindings/clock/zte,zx297520v3-topclk.yaml
new file mode 100644
index 000000000000..374f63891288
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/zte,zx297520v3-topclk.yaml
@@ -0,0 +1,70 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/zte,zx297520v3-topclk.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ZTE zx297520v3 SoC top clock and reset controller
+
+maintainers:
+  - Stefan Dösinger <stefandoesinger@gmail.com>
+
+description: |
+  The zx297520v3's top clock controller generates clocks for core devices on the
+  board like the main bus, USB and timers. In addition to clocks it has reset
+  controls for peripherals, a global board reset and watchdog reset controls.
+
+  The controller has two clock inputs: a 26 MHz and a 32 KHz external
+  oscillator. They need to be provided as input clocks. The controller provides
+  clocks to the downstream Matrix clock controller.
+
+  All available clocks are defined as preprocessor macros in the
+  'dt-bindings/clock/zte,zx297520v3-clk.h' header.
+
+properties:
+  compatible:
+    items:
+      - const: zte,zx297520v3-topclk
+      - const: syscon
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: 26 MHz external oscillator
+      - description: 32 KHz external oscillator
+
+  clock-names:
+    items:
+      - const: osc26m
+      - const: osc32k
+
+  "#clock-cells":
+    const: 1
+
+  "#reset-cells":
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - '#clock-cells'
+  - '#reset-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/zte,zx297520v3-clk.h>
+
+    clock-controller@13b000 {
+        compatible = "zte,zx297520v3-topclk", "syscon";
+        reg = <0x0013b000 0x400>;
+        clocks = <&osc26m>, <&osc32k>;
+        clock-names = "osc26m", "osc32k";
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 8629ed2aa82f..0cc1ede3c80c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3867,8 +3867,10 @@ L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Odd fixes
 F:	Documentation/arch/arm/zte/
 F:	Documentation/devicetree/bindings/arm/zte.yaml
+F:	Documentation/devicetree/zte,zx297520v3-*
 F:	arch/arm/boot/dts/zte/
 F:	arch/arm/mach-zte/
+F:	include/dt-bindings/clock/zte,zx297520v3-clk.h
 
 ARM/ZYNQ ARCHITECTURE
 M:	Michal Simek <michal.simek@amd.com>
diff --git a/include/dt-bindings/clock/zte,zx297520v3-clk.h b/include/dt-bindings/clock/zte,zx297520v3-clk.h
new file mode 100644
index 000000000000..cf436ff20dfe
--- /dev/null
+++ b/include/dt-bindings/clock/zte,zx297520v3-clk.h
@@ -0,0 +1,118 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (C) Stefan Dösinger.
+ */
+
+#ifndef __DT_BINDINGS_CLOCK_ZX297520V3_H
+#define __DT_BINDINGS_CLOCK_ZX297520V3_H
+
+#define ZX297520V3_M0_WCLK			1
+#define ZX297520V3_SRAM1_PCLK			2
+#define ZX297520V3_SRAM2_PCLK			3
+#define ZX297520V3_UART0_WCLK			4
+#define ZX297520V3_UART0_PCLK			5
+#define ZX297520V3_I2C0_WCLK			6
+#define ZX297520V3_I2C0_PCLK			7
+#define ZX297520V3_RTC_WCLK			8
+#define ZX297520V3_RTC_PCLK			9
+#define ZX297520V3_LPM_GSM_WCLK			10
+#define ZX297520V3_LPM_GSM_PCLK			11
+#define ZX297520V3_LPM_LTE_WCLK			12
+#define ZX297520V3_LPM_LTE_PCLK			13
+#define ZX297520V3_LPM_TD_WCLK			14
+#define ZX297520V3_LPM_TD_PCLK			15
+#define ZX297520V3_LPM_W_WCLK			16
+#define ZX297520V3_LPM_W_PCLK			17
+#define ZX297520V3_TIMER_T08_WCLK		18
+#define ZX297520V3_TIMER_T08_PCLK		19
+#define ZX297520V3_TIMER_T09_WCLK		20
+#define ZX297520V3_TIMER_T09_PCLK		21
+#define ZX297520V3_MPLL				22
+#define ZX297520V3_MPLL_D2			23
+#define ZX297520V3_MPLL_D3			24
+#define ZX297520V3_MPLL_D4			25
+#define ZX297520V3_MPLL_D5			26
+#define ZX297520V3_MPLL_D6			27
+#define ZX297520V3_MPLL_D8			28
+#define ZX297520V3_MPLL_D12			29
+#define ZX297520V3_MPLL_D16			30
+#define ZX297520V3_MPLL_D26			31
+#define ZX297520V3_UPLL				32
+#define ZX297520V3_UPLL_D2			33
+#define ZX297520V3_UPLL_D3			34
+#define ZX297520V3_UPLL_D4			35
+#define ZX297520V3_UPLL_D5			36
+#define ZX297520V3_UPLL_D6			37
+#define ZX297520V3_UPLL_D8			38
+#define ZX297520V3_UPLL_D12			39
+#define ZX297520V3_UPLL_D16			40
+#define ZX297520V3_DPLL				41
+#define ZX297520V3_DPLL_D2			42
+#define ZX297520V3_DPLL_D3			43
+#define ZX297520V3_DPLL_D4			44
+#define ZX297520V3_DPLL_D5			45
+#define ZX297520V3_DPLL_D6			46
+#define ZX297520V3_DPLL_D8			47
+#define ZX297520V3_DPLL_D12			48
+#define ZX297520V3_DPLL_D16			49
+#define ZX297520V3_GPLL				50
+#define ZX297520V3_GPLL_D2			51
+#define ZX297520V3_GPLL_D3			52
+#define ZX297520V3_GPLL_D4			53
+#define ZX297520V3_GPLL_D5			54
+#define ZX297520V3_GPLL_D6			55
+#define ZX297520V3_GPLL_D8			56
+#define ZX297520V3_GPLL_D12			57
+#define ZX297520V3_GPLL_D16			58
+#define ZX297520V3_PMM_WCLK			59
+#define ZX297520V3_PMM_PCLK			60
+#define ZX297520V3_OUT0_WCLK			61
+#define ZX297520V3_OUT1_WCLK			62
+#define ZX297520V3_OUT2_WCLK			63
+#define ZX297520V3_OUT32K_WCLK			64
+#define ZX297520V3_RMIIPHY_WCLK			65
+#define ZX297520V3_TIMER_T12_WCLK		66
+#define ZX297520V3_TIMER_T12_PCLK		67
+#define ZX297520V3_TIMER_T13_WCLK		68
+#define ZX297520V3_TIMER_T13_PCLK		69
+#define ZX297520V3_TIMER_T14_WCLK		70
+#define ZX297520V3_TIMER_T14_PCLK		71
+#define ZX297520V3_TIMER_T15_WCLK		72
+#define ZX297520V3_TIMER_T15_PCLK		73
+#define ZX297520V3_TIMER_T16_WCLK		74
+#define ZX297520V3_TIMER_T16_PCLK		75
+#define ZX297520V3_TIMER_T17_WCLK		76
+#define ZX297520V3_TIMER_T17_PCLK		77
+#define ZX297520V3_WDT_T18_WCLK			78
+#define ZX297520V3_WDT_T18_PCLK			79
+#define ZX297520V3_USIM1_WCLK			80
+#define ZX297520V3_USIM1_PCLK			81
+#define ZX297520V3_AHB_WCLK			82
+#define ZX297520V3_AHB_PCLK			83
+#define ZX297520V3_USB_WCLK			84
+#define ZX297520V3_USB_PCLK			85
+#define ZX297520V3_HSIC_WCLK			86
+#define ZX297520V3_HSIC_PCLK			87
+
+#define ZX297520V3_ZSP_RESET			0
+#define ZX297520V3_UART0_RESET			1
+#define ZX297520V3_I2C0_RESET			2
+#define ZX297520V3_RTC_RESET			3
+#define ZX297520V3_TIMER_T08_RESET		4
+#define ZX297520V3_TIMER_T09_RESET		5
+#define ZX297520V3_PMM_RESET			6
+#define ZX297520V3_GPIO_RESET			7
+#define ZX297520V3_GPIO8_RESET			8
+#define ZX297520V3_TIMER_T12_RESET		9
+#define ZX297520V3_TIMER_T13_RESET		10
+#define ZX297520V3_TIMER_T14_RESET		11
+#define ZX297520V3_TIMER_T15_RESET		12
+#define ZX297520V3_TIMER_T16_RESET		13
+#define ZX297520V3_TIMER_T17_RESET		14
+#define ZX297520V3_WDT_T18_RESET		15
+#define ZX297520V3_USIM1_RESET			16
+#define ZX297520V3_AHB_RESET			17
+#define ZX297520V3_USB_RESET			18
+#define ZX297520V3_HSIC_RESET			19
+
+#endif /* __DT_BINDINGS_CLOCK_ZX297520V3_H */

-- 
2.53.0


