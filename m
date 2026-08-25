Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B80B7C61DBD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 21:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R8/CAv9tFHpcqwaeXsGP8T38dFbfxVtBsqIRAdhmicw=; b=R8nDMmEiF5MlTDdMNbWwbXsn/E
	bmpqDV1N4QhB0S/KpC4X/SzipX+J3iEfHFPwO6f3HOSqbzkAswpscoPiyVA+B5pS8eZZliW7gL7RF
	7a5r+wGzYzhtCxedzyA2tDmZ6H3E4WwzSvehBEr2EHxyQIJ5Kozo7TEqJYoWmmcN4pdnbbDpSByZ2
	KoMpbnj9W0KmFZSZi3O/TOUsb/ixPBiz5hp0MwLHNjSpsuhGI73xDGUAjEq2CDJaj9/UPZDCo/g6G
	/jO3sZfdEJMa+MvxlL0581iAG7QCn7wLbSPPaAmnJ6MlRPgWuEw3T2vrlvJnMXEAcxKomUxk/TG2w
	dsIyn/9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyydJ-00000001VYr-06tZ;
	Tue, 25 Aug 2026 21:24:37 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyydF-00000001VWG-1JbL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 21:24:35 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-c207cb16cf5so26841566b.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Aug 2026 14:24:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787693071; x=1788297871; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R8/CAv9tFHpcqwaeXsGP8T38dFbfxVtBsqIRAdhmicw=;
        b=jPWuxq17nwrPb15/9krFUsHNHh1adV6oB5ukaZjsMBPvRxUzURa1RxDQrbF1pugFt0
         1t+GhSzNw+zgABsgsZCxLexgAorrb7P0CW3WCQT+ncVHoN8fRxM6wVXInGKGxcmhM/H/
         LCp0JHm4+i4wy9iXK9pUD/xZLbbA2anF69KqtQmMwfID6ZY3bGHcaG48MVwDO23wiihd
         q7PbYSwaTa+vyTXil8/bSGMC2w9bmd8XnTu1wrGe3y3yFLPRy4uCjDDnRzyIX1R+7I1f
         jlbvLkF2cL8po3D6ndxvFCBrlDK9lwbl/mERuj1UAYFv2VkbDmXkCubZuzo9VOP15hYr
         IVVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787693071; x=1788297871;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R8/CAv9tFHpcqwaeXsGP8T38dFbfxVtBsqIRAdhmicw=;
        b=rHSi2i85SCeSUVNSn63byDiJfD31Xkci2RtybXjDHjXaGkbhaEk4wMYUM0SdRlhf8R
         zolVQYlEoycdvzvMHw6oUqN+MtD1Nc65vwIMTA4m0QDdHqioMwoJ3El5aDdly65FDTJX
         UPd9SuiNcqj6z68Jwj7hviNchZf7/uml0g8dRPv5mZpWFN65meUcdi1albILwFVnDFlN
         PM2Fj5iw697JEPJZw+gAk3figJKzLWblYEpA4X8Y7ou407w1ZEdjQAo7fydfLeY9g/hH
         eh8SbF/cuvbAgvci09XzbYEAZr2FEZ0w7i/XvkulhxfPrVPS4mD4imLZ7PJnOIfxS6pJ
         3hDQ==
X-Forwarded-Encrypted: i=1; AHgh+RqGYesd73KjGY2PLNeCVTudPPt+/NCTPZpv5yBz284PfHeAZxe1uwR6vtqjvciLMCvKvDVAwnSwwDAoYtC7knk0@lists.infradead.org
X-Gm-Message-State: AFuF++lnz3vCZfBPLwpOLJgLdjX+p1v7FzPIV0bJCienCLFEKtzxyISI
	nrAuizaXyRfsB1cpqDOrKZBpHTKNf726UrIIOfwPw2NOhMGwKt5Yy967
X-Gm-Gg: AR+sD11nTzreu+IN6ArGOSgyxm1dW9amoZAx8wGMRtwdWqNdDbYT1kkzum4qA/az4ys
	I7qKTugNhOeASCq8yhoR5rh/P9YnaN+eG2mQbVvhige45/I75A3GJR5UBFiCrjxGgXvnwRqAzAR
	NS985MHUlzdRrsfqvXU9caWRDT4GUvRK0EQcOJHWY6ZSMXLZGW+qM+OSvFigYZRY+lSV7yV5vP1
	IfGi9+CjOd3yjbxdLOFHOZbV+vphXnpuv5Ybl8Ys9t/SOWa9zWTDcodyvtB13QUtPdkAthXXN2C
	bJ7mSiYtAFnyibt6gsSSmq8olMwTGwkYILWj47Q3GIUullehXB0anXnBJWHPlVm+VgsGIJteElU
	WOZ5RtPz75xK7P39DqHo48t1uqosOaFmeZtVzIzjPAZUlsOG2Tq+CU7qg0TV5AFjlcnRH5UbNPK
	g8LTZMclHT4CUiRZLcR8J2WgrVK6/MLzjfNd57AiJ34M32uy/Wmx1QFi0JE+EzW2ZjJTrHz69m1
	LeF4uV2
X-Received: by 2002:a05:6938:a082:10b0:c25:659:89ba with SMTP id a640c23a62f3a-c250bb7ca3emr150435666b.9.1787693070929;
        Tue, 25 Aug 2026 14:24:30 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.227.34])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a9ec343sm98297866b.57.2026.08.25.14.24.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 14:24:30 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Wed, 26 Aug 2026 00:24:00 +0300
Subject: [PATCH v11 01/12] dt-bindings: clk: zte: Add zx297520v3 top clock
 and reset controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260826-zx29clk-v11-1-f8ad59c6426c@gmail.com>
References: <20260826-zx29clk-v11-0-f8ad59c6426c@gmail.com>
In-Reply-To: <20260826-zx29clk-v11-0-f8ad59c6426c@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Brian Masney <bmasney@redhat.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Russell King <linux@armlinux.org.uk>, Lee Jones <lee@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-phy@lists.infradead.org, mfd@lists.linux.dev, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=16040;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=t7UtG6ODlVkvlx0KIwOCoARjvs/BqPfLHDP07LmZLkQ=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBqjggCU6ADkYfGaUXF788+lf/rPeNB1W8UwFUwZ
 nfhDWq0LB2JAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCao4IAhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiIfsBAAnUDaLpRcvezvrQjNXMdJcYhly547W9T
 MorBc5xiD1LFnzXP3+VlKqu8NJ/CDt1xhgP8FFISyt/H0iHjcuuzNKsaWEECIgapxD+lNP919eA
 BMxaBtwBqf57yB+0pWPW4kdqtzPmtmqKZi2GXhqEJ7pk2zJeoIJvYI6cxIFvNVYZpevhLJntoLB
 6xrME3u+/TELaD+Zqrx4NHKinlJ4Mk5nX2srRhgCu8SWWXZX2bFl740AHcpt0ZbVJ4zPhqxKh9K
 E0qCjucAvny7ixG9NjIh/AS/bSILApgYP6p6xjJJA/cwGb/AxMFSp2pYB07J5b+FW0hnz53z1QH
 T0LDkrnbu7YPxCR+Z8WWkGU16tWgVZCezpd8+uYhaC7zkTtD9U/9wLi+i8D1oi8hD3a++WJauaw
 Uc8SuUbcM53fdkCG9xb+V2kr7+GH144MW9AiYTVuBRmB3OReclmqPfEka0SSSzRqMXgJ4nh9Ze6
 9eJxwG9rYDBzhsUKT7RbMXDWNnubWbhMBuuw3hHlO2JjlO4M7BVE5I9XkDQleb6lZ2jbOJHX7oc
 zu6kpTrT0R0/2ysgUv0DI7kQWJR7qKjisXtWe0hAa7mK69G4Q2kjaJHj/YzLZMGLUcrB6xFWyqo
 MsAnwsOrp0BPBWcqprH85fmbdWSpREftUnNU0yGe8tM6jnR/lzjA=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_142433_511097_27C585A6 
X-CRM114-Status: GOOD (  39.46  )
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

These SoCs have 3 clock and reset controllers: Top, Matrix and LSP.
Clocks go from oscillator -> top -> matrix -> LSP, with a register in
top controlling most clocks that get passed to matrix and a register in
matrix controlling all the clocks that get passed to LSP.

Generally every device has two clocks (one work clock, and one that
connects it to the bus, I call it PCLK), two reset bits (I don't know
what the difference is - sometimes asserting one is enough to reset the
device, sometimes both need to be asserted). PCLK and WCLK are
controlled by individual gates. Some devices have a mux and/or a
divider for their work clock. Some devices, like the GPIO controller,
only have reset bits and no clocks.

The top clock controller is fed by a 26 MHz external oscillator and has 4
PLLs to generate other clock rates. ZTE's kernel mostly relies on the
boot ROM to set up PLLs, but one LTE-related PLL is not configured
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

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>
---

v11: Unchanged content wise

@Sashiko: The USB and HSIC PHY resets are deliberately not in the
binding. They would be provided by the reset MFD child and consumed by
its PHY sibling, resulting in a self-referencing node. Therefore the
PHY MFD child accesses the bits via the shared regmap. The PHY driver is
the exclusive owner of the bits.

This does not impact the USB and HSIC controller resets. These are part
of the binding and consumed by the (future) USB nodes.

@Sashiko: There is no "simple-mfd" compatible because a MFD driver
will bind to the node and (among other things) take care of the reboot
child node.

v9->v10:
*) Rename ZX297520V3_ZSP_RESET to ZX297520V3_ZSP_CORE_RESET in preparation
for a separate reset register in matrixcrm.

*) Fix order of properties in the example code to satisfy dt-check-style
--mode=strict.

Changes v8->v9:
*) "unevaluatedProperties: false" for the syscon child node (Krzysztof)
*) "additionalProperties: false" for the binding itself (Krzysztof)
*) Remove USB PHY resets, but USB controller resets remain unchanged
(Krzysztof)
*) Rename syscon reboot node to "reboot". While both "reboot" and
"syscon-reboot" are common in actual device trees, syscon-reboot.yaml's
own example uses "reboot". DT's Generic Names Recommendation
contains neither (Sashiko, patch 12)

Changes v7->v8 (all Krzysztof):
*) Fold the PHY into the top-level node
*) Start clock indices at 0
*) Rename the phy include file to zte,zx297520v3-topcrm.h.

And a non-change despite/because of new discoveries: USB has more PHY
and DWC controls in a different controller at 0x140000. ZTE calls this
controller SOC_SYS, and it is a textbook case for syscon: It has a lot
of different controls: A remap flag for boot ROM, a control to bring the
A53 up in arm32 vs aarch64 mode, the entrypoint of the LTE DSP, SDIO,
I2S, ...

USB-wise it has a register with PHY and DWC controls: Endianness for the
DWC2 registers, PHY clock adjustments, PHY and DWC host/device switch.
In spite of this I think topcrm is the better home for #phy-cells: The
USB ready flags in topcrm are essential for bringing up the USB devices
whereas the soc_sys controls are a curiosity. Host mode only works if I
externally inject VBUS. Clock adjustment is too inflexible to be of real
value. Flipping the DWC registers to big endian works, but what for? If
I find a use case for changing the default USB values in soc_sys it can
be handled via syscon.

soc_sys also has power controls for a few devices, including USB. This
will be handled via #power-domain-cells.

The self-referencing reset property causes the following boot messages:
/soc/clock-controller@13b000: Fixed dependency cycle(s) with
    /soc/clock-controller@13b000
/soc/clock-controller@13b000: Fixed dependency cycle(s) with
    /soc/clock-controller@13b000

Do I need to add post-init-providers? As far as I understand it, this
message is informational and not a problem that needs to be addressed.

Changes v6->v7:
*) Moved the bindings back into clock/ (Krzysztof). Use clock-controller@
in example and in the later DTSI patch.

*) With a lucky find in strings in LTE's cpko.ko blob I could make sense
of the register that controls which clocks get passed from PLLs into
the clock distribution inside topcrm. Importantly that also narrows
which clocks can possibly be passed to Matrix, so I could slim down the
bindings considerably.

*) Add a usb phy child node with the phy schema added in the previous
patch. I don't expect the USB status register to ever be in another
place, so the binding expresses the @84 expectation.

Changes v5->v6:
Set value for syscon-reboot example (Sashiko). It was my intention to
set only the lowest bit, and I think Sashiko is right that without
'value' being set, all other bits are actively set to 0. It shouldn't
matter given my understanding of the hardware (afaics all other bits are
ignored), but actively clearing bits was not my intention.

I haven't changed the name match for "syscon-reboot". I see plenty of
examples of hardcoding this string as opposed to having a regex for
syscon-reboot@12345678 in other bindings.

Changes v4->v5:

Rename from zte,zx297520v3-topclk to zte,zx297520v3-topcrm and move to
soc/zte
Fix path in MAINTAINERS
Add syscon-reboot node to the binding
Give the USB and HSIC PHY resets their own reset control
---
 .../bindings/clock/zte,zx297520v3-topcrm.yaml      | 122 +++++++++++++++++++++
 MAINTAINERS                                        |   4 +
 include/dt-bindings/clock/zte,zx297520v3-clk.h     |  66 +++++++++++
 include/dt-bindings/phy/zte,zx297520v3-topcrm.h    |  12 ++
 include/dt-bindings/reset/zte,zx297520v3-reset.h   |  30 +++++
 5 files changed, 234 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/zte,zx297520v3-topcrm.yaml b/Documentation/devicetree/bindings/clock/zte,zx297520v3-topcrm.yaml
new file mode 100644
index 000000000000..8510ffde2924
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/zte,zx297520v3-topcrm.yaml
@@ -0,0 +1,122 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/zte,zx297520v3-topcrm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ZTE zx297520v3 SoC top clock and reset controller
+
+maintainers:
+  - Stefan Dösinger <stefandoesinger@gmail.com>
+
+description: |
+  The zx297520v3 top clock and reset controller generates clocks for core
+  devices on the board like the main bus, USB and timers. In addition to clocks
+  it has reset controls for peripherals, a global board reset, watchdog reset
+  controls and a USB status register.
+
+  The controller has two clock inputs: a 26 MHz and a 32 kHz external
+  oscillator. They need to be provided as input clocks. The controller provides
+  PLL output frequencies to downstream clock controllers.
+
+  The USB PHY is exposed as two PHYs, one for USB and another for HSIC. Note
+  that while the controls for both PHYs are always present, the PHYs themselves
+  may be absent. If this is the case the controller never signals that the
+  missing PHY is ready.
+
+  All available clocks are defined as preprocessor macros in the
+  "include/dt-bindings/clock/zte,zx297520v3-clk.h" header. The resets are
+  defined in the "include/dt-bindings/reset/zte,zx297520v3-reset.h" header. PHY
+  defines are found in "include/dt-bindings/phy/zte,zx297520v3-topcrm.h".
+
+properties:
+  compatible:
+    items:
+      - const: zte,zx297520v3-topcrm
+      - const: syscon
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: 26 MHz external oscillator
+      - description: 32 kHz external oscillator
+
+  clock-names:
+    items:
+      - const: osc26m
+      - const: osc32k
+
+  interrupts:
+    items:
+      - description: IRQ reporting USB connection
+      - description: IRQ reporting USB disconnection
+      - description: IRQ reporting HSIC connection
+      - description: IRQ reporting HSIC disconnection
+
+  interrupt-names:
+    items:
+      - const: usb-up
+      - const: usb-down
+      - const: hsic-up
+      - const: hsic-down
+
+  "#clock-cells":
+    const: 1
+
+  "#phy-cells":
+    const: 1
+
+  "#reset-cells":
+    const: 1
+
+  reboot:
+    type: object
+    $ref: /schemas/power/reset/syscon-reboot.yaml#
+    unevaluatedProperties: false
+    description:
+      Reboot method for the SoC.
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - interrupts
+  - interrupt-names
+  - reboot
+  - "#clock-cells"
+  - "#phy-cells"
+  - "#reset-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/reset/zte,zx297520v3-reset.h>
+    #include <dt-bindings/phy/zte,zx297520v3-topcrm.h>
+    #include <dt-bindings/clock/zte,zx297520v3-clk.h>
+
+    clock-controller@13b000 {
+        compatible = "zte,zx297520v3-topcrm", "syscon";
+        reg = <0x0013b000 0x400>;
+        #clock-cells = <1>;
+        clocks = <&osc26m>, <&osc32k>;
+        clock-names = "osc26m", "osc32k";
+        interrupts = <GIC_SPI 42 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 43 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 45 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 46 IRQ_TYPE_EDGE_RISING>;
+        interrupt-names = "usb-up", "usb-down", "hsic-up", "hsic-down";
+        #phy-cells = <1>;
+        #reset-cells = <1>;
+
+        reboot {
+          compatible = "syscon-reboot";
+          mask = <0x1>;
+          offset = <0x0>;
+          value = <0x1>;
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index fe10d29b7657..e929ebb3836a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3901,8 +3901,12 @@ L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Odd fixes
 F:	Documentation/arch/arm/zte/
 F:	Documentation/devicetree/bindings/arm/zte.yaml
+F:	Documentation/devicetree/bindings/clock/zte,zx297520v3-topcrm.yaml
 F:	arch/arm/boot/dts/zte/
 F:	arch/arm/mach-zte/
+F:	include/dt-bindings/clock/zte,zx297520v3-clk.h
+F:	include/dt-bindings/phy/zte,zx297520v3-topcrm.h
+F:	include/dt-bindings/reset/zte,zx297520v3-reset.h
 
 ARM/ZYNQ ARCHITECTURE
 M:	Michal Simek <michal.simek@amd.com>
diff --git a/include/dt-bindings/clock/zte,zx297520v3-clk.h b/include/dt-bindings/clock/zte,zx297520v3-clk.h
new file mode 100644
index 000000000000..3aed94ccc26f
--- /dev/null
+++ b/include/dt-bindings/clock/zte,zx297520v3-clk.h
@@ -0,0 +1,66 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (C) Stefan Dösinger.
+ */
+
+#ifndef __DT_BINDINGS_CLOCK_ZX297520V3_H
+#define __DT_BINDINGS_CLOCK_ZX297520V3_H
+
+#define ZX297520V3_M0_WCLK			0
+#define ZX297520V3_SRAM1_PCLK			1
+#define ZX297520V3_SRAM2_PCLK			2
+#define ZX297520V3_UART0_WCLK			3
+#define ZX297520V3_UART0_PCLK			4
+#define ZX297520V3_I2C0_WCLK			5
+#define ZX297520V3_I2C0_PCLK			6
+#define ZX297520V3_RTC_WCLK			7
+#define ZX297520V3_RTC_PCLK			8
+#define ZX297520V3_LPM_GSM_WCLK			9
+#define ZX297520V3_LPM_GSM_PCLK			10
+#define ZX297520V3_LPM_LTE_WCLK			11
+#define ZX297520V3_LPM_LTE_PCLK			12
+#define ZX297520V3_LPM_TD_WCLK			13
+#define ZX297520V3_LPM_TD_PCLK			14
+#define ZX297520V3_LPM_W_WCLK			15
+#define ZX297520V3_LPM_W_PCLK			16
+#define ZX297520V3_TIMER_T08_WCLK		17
+#define ZX297520V3_TIMER_T08_PCLK		18
+#define ZX297520V3_TIMER_T09_WCLK		19
+#define ZX297520V3_TIMER_T09_PCLK		20
+#define ZX297520V3_MPLL				21
+#define ZX297520V3_MPLL_D5			22
+#define ZX297520V3_DPLL				23
+#define ZX297520V3_GPLL				24
+#define ZX297520V3_GPLL_D2			25
+#define ZX297520V3_GATED_OSC26M			26
+#define ZX297520V3_PMM_WCLK			27
+#define ZX297520V3_PMM_PCLK			28
+#define ZX297520V3_OUT0_WCLK			29
+#define ZX297520V3_OUT1_WCLK			30
+#define ZX297520V3_OUT2_WCLK			31
+#define ZX297520V3_OUT32K_WCLK			32
+#define ZX297520V3_RMIIPHY_WCLK			33
+#define ZX297520V3_TIMER_T12_WCLK		34
+#define ZX297520V3_TIMER_T12_PCLK		35
+#define ZX297520V3_TIMER_T13_WCLK		36
+#define ZX297520V3_TIMER_T13_PCLK		37
+#define ZX297520V3_TIMER_T14_WCLK		38
+#define ZX297520V3_TIMER_T14_PCLK		39
+#define ZX297520V3_TIMER_T15_WCLK		40
+#define ZX297520V3_TIMER_T15_PCLK		41
+#define ZX297520V3_TIMER_T16_WCLK		42
+#define ZX297520V3_TIMER_T16_PCLK		43
+#define ZX297520V3_TIMER_T17_WCLK		44
+#define ZX297520V3_TIMER_T17_PCLK		45
+#define ZX297520V3_WDT_T18_WCLK			46
+#define ZX297520V3_WDT_T18_PCLK			47
+#define ZX297520V3_USIM1_WCLK			48
+#define ZX297520V3_USIM1_PCLK			49
+#define ZX297520V3_AHB_WCLK			50
+#define ZX297520V3_AHB_PCLK			51
+#define ZX297520V3_USB_WCLK			52
+#define ZX297520V3_USB_PCLK			53
+#define ZX297520V3_HSIC_WCLK			54
+#define ZX297520V3_HSIC_PCLK			55
+
+#endif /* __DT_BINDINGS_CLOCK_ZX297520V3_H */
diff --git a/include/dt-bindings/phy/zte,zx297520v3-topcrm.h b/include/dt-bindings/phy/zte,zx297520v3-topcrm.h
new file mode 100644
index 000000000000..b36ccf2f54ef
--- /dev/null
+++ b/include/dt-bindings/phy/zte,zx297520v3-topcrm.h
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (C) Stefan Dösinger.
+ */
+
+#ifndef __DT_BINDINGS_PHY_ZTE_ZX297520V3_TOPCRM_H
+#define __DT_BINDINGS_PHY_ZTE_ZX297520V3_TOPCRM_H
+
+#define ZX297520V3_USB_PHY	0
+#define ZX297520V3_HSIC_PHY	1
+
+#endif /* __DT_BINDINGS_PHY_ZTE_ZX297520V3_TOPCRM_H */
diff --git a/include/dt-bindings/reset/zte,zx297520v3-reset.h b/include/dt-bindings/reset/zte,zx297520v3-reset.h
new file mode 100644
index 000000000000..4a0eaec0e981
--- /dev/null
+++ b/include/dt-bindings/reset/zte,zx297520v3-reset.h
@@ -0,0 +1,30 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (C) Stefan Dösinger.
+ */
+
+#ifndef __DT_BINDINGS_RESET_ZX297520V3_H
+#define __DT_BINDINGS_RESET_ZX297520V3_H
+
+#define ZX297520V3_ZSP_CORE_RESET		0
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
+#endif /* __DT_BINDINGS_RESET_ZX297520V3_H */

-- 
2.54.0


