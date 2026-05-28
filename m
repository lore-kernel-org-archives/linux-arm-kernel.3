Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46F33CD5BD5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 21:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d/YuXOm7ApYRYRm2PV5ji1302lS9gowdVXZudIgXt9A=; b=sXCenS4mvOfuXyvHHt5Mr1qD9L
	5mZEiFoiitfS8HxsydsEXy1tQF3mKoDsPKHoEJX4rmhCC9AO1jn+ijBYohXafrDUwzY2jgOUuWuvh
	eMUeztOgzDmZb2/mw3GzxBRCneb9EGzibjBcwoAYiT0WbDImoH17ciA3JwRAPLy92auDg8rLBt0No
	zpjky4/YP79fFTGCrJdLN2BnmeMYLFzLZjZvU28iGjFQp+/qDmw+IzLhx9ehKrGvnvMpLigmRxbw6
	8F3Y2JBScu+q00m5OFlIkxD5eTqjpnh5HHLSl6iOC2udzDW0JjlUNLZjY8wPP7wuYEoljdwUczz1Q
	rZY2qHSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSigx-00000006QfG-2aUe;
	Thu, 28 May 2026 21:55:03 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSigv-00000006Qdv-0PDL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 21:55:02 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-48a563e4ef7so94844995e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 May 2026 14:55:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780005299; x=1780610099; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d/YuXOm7ApYRYRm2PV5ji1302lS9gowdVXZudIgXt9A=;
        b=FLrCTd8+T7N/uQJL7i4SIoSPZOeEvKiq61fjKmNxhJr59sCwCX6nkQTrtyX95ckNIv
         ddIzZnqO+5BJcyhMnY1fDLqnv1OnqYe3knVR6DQNhPtZ+HZKz6fV1q9vjo5Ni+OtQXRF
         uS36M71Y8Vdbc5XiZEPjfTO3UwUqkES6dXkxDEFd2QNRqr3Xd11qwuxQHfvRmRmUfwDp
         P9JGw7qY2OAlIc7sg6nEQs+i98Msukbpooj7dBmPzKhojRKG2Ei44cRRclC+/IrRR0Fa
         SCh+XMJSlMTL6RhaLnNDUbh6fWLlYGffBJmWoyYoWwSZm7ueHDS2vdAyi5W+E2ZfZgKu
         +13w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780005299; x=1780610099;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=d/YuXOm7ApYRYRm2PV5ji1302lS9gowdVXZudIgXt9A=;
        b=oChy/38aW2d5J/7QzYxLSr+xOmsi9QASix5Y2Dqs8etQtBVPT66TDJ8KiX1rXNqfue
         4Kb81kbVa8R0sRnJNpjcftPSl4UI8Fw4Q96brTTayFg5jCsci3ZYz/gSJrR45u5CHQS6
         /MMITI3qIL5CtaZK0SGwWJquzMKh8abDQsvDsPN2XdmXVkEf0sNfAUCco3d30Vt4P+6v
         kI3o1xKF6QB7a0LCsjxLCTQKgssbwP60HWeoJsINyN09JfAxKDu0BOEAAHnsS4YyG+Zg
         Hjt91j3IQ79Glk+vsl0H4Q8GDp0Zz3zwVjMA6NF6Cf9CO2BkXUgdYmMlpVbWYiI3OtN5
         9l/A==
X-Forwarded-Encrypted: i=1; AFNElJ+MlqQE0rQgd6WJRjFxX/qdr4BfmXrW/YO9tUAkY9yf87cgCR64l3iBgREOkrhSn7mvIx/+L9eg+qK1NnQOjxy7@lists.infradead.org
X-Gm-Message-State: AOJu0YwLo1uC1FQ/iUahibYA0xrGfwMSlFAl1NAsium29Sw/ZMM8aAkP
	tKOdSVfds2R0XwAZoNfci8g8BPHQXrflYVrMHA6rgsO2NQmorVe+p/BFeaRmQkWJ41rh8w==
X-Gm-Gg: Acq92OF9U3XjouOyzt6Vu8SPKh8BTWJ/TZcxjb1pIRzKoGCK0zQftm481m14JyPW501
	5t8sCaKhRcq2QzQ58GOe+oSRknufl7Rx35MNC9v1O6DQMcVPNyJpQp77np3V6Qv0qkLxfVXY0xJ
	NkDmREnvetrmV7c6WbigybzOUcCAYN91xgBdc9omm5G2knM8bIQ/kYiIHJutJAGtg/l8tT8dJjz
	bl2YBGEHed2O6IuUI88p1y4V1MxMPoMPfYbzTpBJggOvNGApkCKWnpOkgGjgBy1oTj6Bgvu6dJp
	PkKhvzsmX+im0loL4p+XiGJP+7H7TT9Bm57I61hN9TxZAch4uYKqm8K726o/gsOrGEY/B9tCUsG
	Dbobf2M7948wlYz4wglv0aZX8KCh4iFTofMmakhMoN7QjsMiUXG0V8vdRnimabxnUYuprhEFiUq
	SMo+3W2IOlVGZLARcYQ19qKGIEvKjutdbREvNn70D6e4LO
X-Received: by 2002:a05:600c:1c21:b0:48a:75b9:b0bc with SMTP id 5b1f17b1804b1-4909ca895b3mr584195e9.29.1780005298887;
        Thu, 28 May 2026 14:54:58 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.51.223])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909c967c6csm1191085e9.2.2026.05.28.14.54.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 14:54:58 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Fri, 29 May 2026 00:52:58 +0300
Subject: [PATCH RFC v3 1/5] dt-bindings: clk: zte: Add zx297520v3 top clock
 and reset bindings.
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260529-zx29clk-v3-1-c7fe54ea388f@gmail.com>
References: <20260529-zx29clk-v3-0-c7fe54ea388f@gmail.com>
In-Reply-To: <20260529-zx29clk-v3-0-c7fe54ea388f@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Brian Masney <bmasney@redhat.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=10725;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=VyO94E/JUVkIrvYxngVXEAe+ktBx8r4qNp/vOl3g2U4=;
 b=kA0DAAgBPRO8yFRPGiIByyZiAGoYuaigL/JhqPPbqglYzfP6xJ0hemA0isaXZASPyem/ijWOF
 IkCTwQAAQgAORYhBEMW9LaqBVsnlTJdbD0TvMhUTxoiBQJqGLmoGxSAAAAAAAQADm1hbnUyLDIu
 NSsxLjEyLDIsMgAKCRA9E7zIVE8aInNrD/9lT2QQugN0SDHaeEBDGss3GAFhRodY3XrNYNfaMQF
 TZr1/ShinlnFHwNtP/QQtHx4/FyYtmSKJn0M1kDOkMQ6q5yyVkaO8unNh2a20f6Z2wgWwRQHbJs
 E41dmF6p1uSGv93xrmlYR1u3jUEoe1IV6mWwPbNFW/KYgXZ2WaHppZxm0+s8RWP6u17t2lXG18T
 RC71UmK+/JjDDqoVUz4BO6KZj50HIvniO/OrjXIoAXQ+pzvnlblBDHM7QeMigkx5DQ3K6PWOL37
 eXlnj476N49y3hmpAuRZneWEYskcvglSEI/LcvcM2W4XOM1STa4JJAGP+KoiXe13dG5/FAkImpu
 wCQFDOFeQok/Gwsqp6/o+9zUH3MaCBGvwOvodPlXAuvyi+mTAKEngPbeQlW5tzyKL1VBf5coBJy
 ieN7jvoWBBBUYCU3NAkqOJTQaigr22+HibQpZV9JwsiLhpx9OsmTurU70mm4sRmQirKRX+40sGC
 LjoMWLPkeD7jH2p6/6qHTV59tIijrdUYHaBvGpxvkL/5vl5Y1kcDTh7Ez9YbvzZQmHJRf7fJFyK
 WqxIp5+scFYyadfg7jt4OAJNtxepNftRvvfeh3eEGHu+hRWdejEB7XYmCgtY4evteuj5ta4/ACP
 lt7SIaKkNvwZITV0ageKPlC7b4YJ9b6TKtcr+AP7Yaw==
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_145501_208804_3255CD85 
X-CRM114-Status: GOOD (  29.26  )
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
them is poorly defined in the hardware, so this patch models Top and
Matrix as one device with two memory regions.

Case in point of their poor separation: The ZSP coprocessor - used for
LTE - has clocks in the Matrix block but a reset control in Top. The
board's main CPU has two reset controls, one in Top and one in Matrix.

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

The "matrix" controller controls the main Cortex A53 CPU, the LTE ZSP,
SDIO and a few others.

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
Others cause an instant hang of the board when disabled. I isolated a
few (SRAM PCLK, arm arch timer clock) where I don't see a reason to
manipulate them. It is quite likely that a handful more clocks will be
added in the future, but not a large number.

Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>
---
 .../bindings/clock/zte,zx297520v3-topclk.yaml      |  95 ++++++++++++++++
 MAINTAINERS                                        |   2 +
 include/dt-bindings/clock/zte,zx297520v3-clk.h     | 121 +++++++++++++++++++++
 3 files changed, 218 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/zte,zx297520v3-topclk.yaml b/Documentation/devicetree/bindings/clock/zte,zx297520v3-topclk.yaml
new file mode 100644
index 000000000000..968820bde755
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/zte,zx297520v3-topclk.yaml
@@ -0,0 +1,95 @@
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
+  board like the CPU, RAM, PMIC. In addition to clocks it has reset controls for
+  peripherals as well as the ability to reset the entire board. It has two
+  distinct IO regions, but because their responsibilites are poorly separated
+  they are modelled as one device.
+
+  The controller has two clock inputs: a 26 MHz and a 32 KHz external
+  oscillator. They need to be provided as input clocks. The controller provides
+  clocks to the downstream LSP clock controller.
+
+  The controller controls core devices on the board: The CPU, DRAM, MMC, LTE
+  and Ethernet related clocks are found here.
+
+  All available clocks are defined as preprocessor macros in the
+  'dt-bindings/clock/zte,zx297520v3-clk.h' header.
+
+properties:
+  compatible:
+    const: zte,zx297520v3-topclk
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
+  reg:
+    items:
+      - description: Top clock memory region
+      - description: Matrix clock memory region
+
+  reg-names:
+    items:
+      - const: top
+      - const: matrix
+
+required:
+  - compatible
+  - reg
+  - reg-names
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
+    osc26m: osc26m {
+      compatible = "fixed-clock";
+      clock-frequency = <26000000>;
+      #clock-cells = <0>;
+    };
+
+    osc32k: osc32k {
+      compatible = "fixed-clock";
+      clock-frequency = <32768>;
+      #clock-cells = <0>;
+    };
+
+    topclk: clk@13b000 {
+        compatible = "zte,zx297520v3-topclk";
+        reg = <0x0013b000 0x400>,
+              <0x01306000 0x400>;
+        reg-names = "top", "matrix";
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+        clocks = <&osc26m>, <&osc32k>;
+        clock-names = "osc26m", "osc32k";
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 4ae1e77c2fd7..ae51d590d440 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3864,8 +3864,10 @@ L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
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
index 000000000000..4d85251a0ce5
--- /dev/null
+++ b/include/dt-bindings/clock/zte,zx297520v3-clk.h
@@ -0,0 +1,121 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (C) Stefan Dösinger.
+ */
+
+#ifndef __DT_BINDINGS_CLOCK_ZX297520V3_H
+#define __DT_BINDINGS_CLOCK_ZX297520V3_H
+
+#define ZX297520V3_AHB_WCLK			0
+#define ZX297520V3_AHB_PCLK			1
+#define ZX297520V3_PMM_WCLK			2
+#define ZX297520V3_PMM_PCLK			3
+#define ZX297520V3_USB_24M			4
+#define ZX297520V3_USB_AHB			5
+#define ZX297520V3_TIMER_T08_WCLK		6
+#define ZX297520V3_TIMER_T08_PCLK		7
+#define ZX297520V3_TIMER_T09_WCLK		8
+#define ZX297520V3_TIMER_T09_PCLK		9
+#define ZX297520V3_TIMER_T12_WCLK		10
+#define ZX297520V3_TIMER_T12_PCLK		11
+#define ZX297520V3_TIMER_T13_WCLK		12
+#define ZX297520V3_TIMER_T13_PCLK		13
+#define ZX297520V3_TIMER_T14_WCLK		14
+#define ZX297520V3_TIMER_T14_PCLK		15
+#define ZX297520V3_TIMER_T15_WCLK		16
+#define ZX297520V3_TIMER_T15_PCLK		17
+#define ZX297520V3_TIMER_T16_WCLK		18
+#define ZX297520V3_TIMER_T16_PCLK		19
+#define ZX297520V3_TIMER_T17_WCLK		20
+#define ZX297520V3_TIMER_T17_PCLK		21
+#define ZX297520V3_WDT_T18_WCLK			22
+#define ZX297520V3_WDT_T18_PCLK			23
+#define ZX297520V3_UART0_WCLK			24
+#define ZX297520V3_UART0_PCLK			25
+#define ZX297520V3_I2C0_WCLK			26
+#define ZX297520V3_I2C0_PCLK			27
+#define ZX297520V3_RTC_WCLK			28
+#define ZX297520V3_RTC_PCLK			29
+#define ZX297520V3_LPM_GSM_WCLK			30
+#define ZX297520V3_LPM_GSM_PCLK			31
+#define ZX297520V3_LPM_LTE_WCLK			32
+#define ZX297520V3_LPM_LTE_PCLK			33
+#define ZX297520V3_LPM_TD_WCLK			34
+#define ZX297520V3_LPM_TD_PCLK			35
+#define ZX297520V3_LPM_W_WCLK			36
+#define ZX297520V3_LPM_W_PCLK			37
+#define ZX297520V3_USIM1_WCLK			38
+#define ZX297520V3_USIM1_PCLK			39
+#define ZX297520V3_M0_WCLK			40
+#define ZX297520V3_OUT0_WCLK			41
+#define ZX297520V3_OUT1_WCLK			42
+#define ZX297520V3_OUT2_WCLK			43
+#define ZX297520V3_OUT32K_WCLK			44
+#define ZX297520V3_CPU_WCLK			45
+#define ZX297520V3_CPU_PCLK			46
+#define ZX297520V3_SD0_WCLK			47
+#define ZX297520V3_SD0_PCLK			48
+#define ZX297520V3_SD0_CDET			49
+#define ZX297520V3_SD1_WCLK			50
+#define ZX297520V3_SD1_PCLK			51
+#define ZX297520V3_SD1_CDET			52
+#define ZX297520V3_NAND_WCLK			53
+#define ZX297520V3_NAND_PCLK			54
+#define ZX297520V3_SSC_WCLK			55
+#define ZX297520V3_SSC_PCLK			56
+#define ZX297520V3_EDCP_WCLK			57
+#define ZX297520V3_EDCP_PCLK			58
+#define ZX297520V3_VOU_WCLK			59
+#define ZX297520V3_VOU_PCLK			60
+#define ZX297520V3_PDCFG_WCLK			61
+#define ZX297520V3_PDCFG_PCLK			62
+#define ZX297520V3_GMAC_WCLK			63
+#define ZX297520V3_GMAC_RMII			64
+#define ZX297520V3_GMAC_PCLK			65
+#define ZX297520V3_ZSP_WCLK			66
+#define ZX297520V3_MBOX_PCLK			67
+#define ZX297520V3_DMA_PCLK			68
+#define ZX297520V3_LSP_MPLL_D5_WCLK		69
+#define ZX297520V3_LSP_MPLL_D4_WCLK		70
+#define ZX297520V3_LSP_MPLL_D6_WCLK		71
+#define ZX297520V3_LSP_MPLL_D8_WCLK		72
+#define ZX297520V3_LSP_MPLL_D12_WCLK		73
+#define ZX297520V3_LSP_OSC26M_WCLK		74
+#define ZX297520V3_LSP_OSC32K_WCLK		75
+#define ZX297520V3_LSP_PCLK			76
+#define ZX297520V3_LSP_TDM_WCLK			77
+#define ZX297520V3_LSP_DPLL_D4_WCLK		78
+#define ZX297520V3_TOPCLK_END			79
+
+#define ZX297520V3_AHB_RESET			0
+#define ZX297520V3_TIMER_T08_RESET		1
+#define ZX297520V3_TIMER_T09_RESET		2
+#define ZX297520V3_TIMER_T12_RESET		3
+#define ZX297520V3_TIMER_T13_RESET		4
+#define ZX297520V3_TIMER_T14_RESET		5
+#define ZX297520V3_TIMER_T15_RESET		6
+#define ZX297520V3_TIMER_T16_RESET		7
+#define ZX297520V3_TIMER_T17_RESET		8
+#define ZX297520V3_WDT_T18_RESET		9
+#define ZX297520V3_UART0_RESET			10
+#define ZX297520V3_I2C0_RESET			11
+#define ZX297520V3_RTC_RESET			12
+#define ZX297520V3_USIM1_RESET			13
+#define ZX297520V3_PMM_RESET			14
+#define ZX297520V3_GPIO8_RESET			15
+#define ZX297520V3_GPIO_RESET			16
+#define ZX297520V3_ZSP_RESET			17
+#define ZX297520V3_USB_RESET			18
+#define ZX297520V3_CPU_RESET			19
+#define ZX297520V3_SD0_RESET			20
+#define ZX297520V3_SD1_RESET			21
+#define ZX297520V3_NAND_RESET			22
+#define ZX297520V3_SSC_RESET			23
+#define ZX297520V3_EDCP_RESET			24
+#define ZX297520V3_VOU_RESET			25
+#define ZX297520V3_PDCFG_RESET			26
+#define ZX297520V3_GMAC_RESET			27
+#define ZX297520V3_DMA_RESET			28
+#define ZX297520V3_TOPRST_END			29
+
+#endif /* __DT_BINDINGS_CLOCK_ZX297520V3_H */

-- 
2.53.0


