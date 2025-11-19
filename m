Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00733CF258C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 09:38:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ubuvZu8UXjwzbNHQQ4TMJLE6NP3+wMZqSlEavbkbwfE=; b=2Ehffm08NqOHFGcP8V27mLmP68
	lLjv6Q7MmMz0lRZAGRhNr3of+Z2Zw5hxbHwN6YcEs4e+bdrDMOoYQUX6d3s+LSQiDglrYbtRSg++r
	ePua/LgBHgl2XPNgnNiNkwqyi/2iNPLtixLM7QoYtHDwCBEanQQnsN9E+g/ts8gEk508aTTcggQHZ
	njGcjeFNAtLPQLbXEqJ3ile1LGF8ZVI01NHPU5hAj+L9K0bjREjeH5P3N6LRqbndW49QlPNPhB+gw
	+tZcdWXI+NTHQD2Y1BtpvqhN2Or3dbG3dl3a7i1UPalpS6ikVNNr2L1tcythFVqIQGnWRcpeDJzpt
	IULz0xDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLedX-00000002shu-0z5P;
	Wed, 19 Nov 2025 09:38:03 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLedU-00000002sgF-2iO1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 09:38:02 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-3438744f11bso12650316a91.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Nov 2025 01:38:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763545079; x=1764149879; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ubuvZu8UXjwzbNHQQ4TMJLE6NP3+wMZqSlEavbkbwfE=;
        b=TEtowETjmkkkSy+0dyaODi3VzomDSjc+mhQPMM5KvElf65NsDjvbmdCgUpP340qy09
         QqNQOy+jShtzCUzZk8mhar0Dk1DVJ5tVjUiCzmqNemMGA8NsxljP7uIAkaSX3AejonUb
         PQqwlCABt2t4zbIQnbMPbIPtjffYmJ+CH/NuY5otK8ouFVx395OzBK+8ExwMuDo2wLMB
         K+NWKsVu0ePm/ct5Xl0IeL7IpEncRXJ1GDUPQUBsAusJgpY/emD6EeehdQAuOjl7EeUh
         IQlM6UXu3/2FAdiep3yAZu4fUJluw6FjXfwqNrgXs578Z8zrPoywzRHYhOVekShRdR7p
         UYNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763545080; x=1764149880;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ubuvZu8UXjwzbNHQQ4TMJLE6NP3+wMZqSlEavbkbwfE=;
        b=cs2kTYP2IoTh/0wyPLBgkwX5rYduqHYZXO0lK+4VrNoZL8QI2MkvziUiEM9W0WXasF
         K1C3NWL3JRfpDveEZRO5O36YTIo1gtP+D/xaL1SPKbp2bTn1DGnBm3UrQ5mdy3Vskw/Q
         vgE6BldyWmVlXvBUoZywaenfhQSlUja0UOQSDybDUQvMG5cpSN5Gf1XCPV4bUYHm6a+L
         ZqdzlcKvAqhAG6Ko0KrDZA7MraA/EgE+er0c4OJAsqLapxGIkFPqvshwHzD+qEeKS47E
         zxfdo3kWQyV5RbSMuu/BDur5VJSqy1T4xoexcu/AahDPrwJHIxPltRY6kyPizmX7p0fv
         7U8Q==
X-Forwarded-Encrypted: i=1; AJvYcCVXRqwutUo3ptCY1DIbSOBvP+u4XIMDC8bTaknXDcjhplvPSA8aXok9K4/xGsV54fWSzOLNQscu+hQDvA4WPnA5@lists.infradead.org
X-Gm-Message-State: AOJu0YxoVG47N4dtMaQSaPShbqYTPCY68/2HB3kkNFHVO0oBs5YBx2qr
	mb/hbtAg7GhM9Ym0GkUqbJLWgvkFeK/0HE15jo53+Njic4boVy5uBv9rBep360D3kQs3S87hdQd
	n920d8A==
X-Google-Smtp-Source: AGHT+IG15jZcElsOZf23LvgWF56vfE6m0WnIv1lETIZF6tDEING2pkP0x4ilHSrzxs+0SfZRZW7P3o1c08k=
X-Received: from dlbdx14.prod.google.com ([2002:a05:7022:e0e:b0:119:49ca:6b84])
 (user=royluo job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:240f:b0:119:e569:f26c
 with SMTP id a92af1059eb24-11b410f54e9mr6703291c88.21.1763545079465; Wed, 19
 Nov 2025 01:37:59 -0800 (PST)
Date: Wed, 19 Nov 2025 09:37:47 +0000
In-Reply-To: <20251119093749.292926-1-royluo@google.com>
Mime-Version: 1.0
References: <20251119093749.292926-1-royluo@google.com>
X-Mailer: git-send-email 2.52.0.rc1.455.g30608eb744-goog
Message-ID: <20251119093749.292926-2-royluo@google.com>
Subject: [PATCH v7 1/2] dt-bindings: usb: dwc3: Add Google Tensor G5 DWC3
From: Roy Luo <royluo@google.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Peter Griffin <peter.griffin@linaro.org>, 
	"=?UTF-8?q?Andr=C3=A9=20Draszik?=" <andre.draszik@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Joy Chakraborty <joychakr@google.com>, Naveen Kumar <mnkumar@google.com>, Roy Luo <royluo@google.com>, 
	Badhri Jagan Sridharan <badhri@google.com>, Doug Anderson <dianders@google.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_013800_737695_0AF36FE8 
X-CRM114-Status: GOOD (  17.69  )
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

Document the device tree bindings for the DWC3 USB controller found in
Google Tensor SoCs, starting with the G5 generation (codename: laguna).

The Tensor G5 silicon represents a complete architectural departure from
previous generations (like gs101), including entirely new clock/reset
schemes, top-level wrapper and register interface. Consequently,
existing Samsung/Exynos DWC3 USB bindings are incompatible, necessitating
this new device tree binding.

The USB controller on Tensor G5 is based on Synopsys DWC3 IP and features
Dual-Role Device single port with hibernation support.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Roy Luo <royluo@google.com>
---
 .../bindings/usb/google,lga-dwc3.yaml         | 140 ++++++++++++++++++
 1 file changed, 140 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/google,lga-dwc3.yaml

diff --git a/Documentation/devicetree/bindings/usb/google,lga-dwc3.yaml b/Documentation/devicetree/bindings/usb/google,lga-dwc3.yaml
new file mode 100644
index 000000000000..95be84c843f5
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/google,lga-dwc3.yaml
@@ -0,0 +1,140 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright (c) 2025, Google LLC
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/google,lga-dwc3.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Google Tensor Series G5 (Laguna) DWC3 USB SoC Controller
+
+maintainers:
+  - Roy Luo <royluo@google.com>
+
+description:
+  Describes the DWC3 USB controller block implemented on Google Tensor SoCs,
+  starting with the G5 generation (laguna). Based on Synopsys DWC3 IP, the
+  controller features Dual-Role Device single port with hibernation add-on.
+
+properties:
+  compatible:
+    const: google,lga-dwc3
+
+  reg:
+    items:
+      - description: Core DWC3 IP registers.
+
+  interrupts:
+    items:
+      - description: Core DWC3 interrupt.
+      - description: High speed power management event for remote wakeup.
+      - description: Super speed power management event for remote wakeup.
+
+  interrupt-names:
+    items:
+      - const: core
+      - const: hs_pme
+      - const: ss_pme
+
+  clocks:
+    items:
+      - description: Non-sticky module clock.
+      - description: Sticky module clock.
+
+  clock-names:
+    items:
+      - const: non_sticky
+      - const: sticky
+
+  resets:
+    items:
+      - description: Non-sticky module reset.
+      - description: Sticky module reset.
+      - description: DRD bus reset.
+      - description: Top-level reset.
+
+  reset-names:
+    items:
+      - const: non_sticky
+      - const: sticky
+      - const: drd_bus
+      - const: top
+
+  power-domains:
+    items:
+      - description: Power switchable domain, the child of top domain.
+          Turning it on puts the controller into full power state,
+          turning it off puts the controller into power gated state.
+      - description: Top domain, the parent of power switchable domain.
+          Turning it on puts the controller into power gated state,
+          turning it off completely shuts off the controller.
+
+  power-domain-names:
+    items:
+      - const: psw
+      - const: top
+
+  iommus:
+    maxItems: 1
+
+  google,usb-cfg-csr:
+    description:
+      A phandle to a syscon node used to access the USB configuration
+      registers. These registers are the top-level wrapper of the USB
+      subsystem and provide control and status for the integrated USB
+      controller and USB PHY.
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      - items:
+          - description: phandle to the syscon node.
+          - description: USB host controller configuration register offset.
+          - description: USB custom interrrupts control register offset.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-names
+  - clocks
+  - clock-names
+  - resets
+  - reset-names
+  - power-domains
+  - power-domain-names
+  - google,usb-cfg-csr
+
+allOf:
+  - $ref: snps,dwc3-common.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        usb@c400000 {
+            compatible = "google,lga-dwc3";
+            reg = <0 0x0c400000  0 0xd060>;
+            interrupts = <GIC_SPI 580 IRQ_TYPE_LEVEL_HIGH 0>,
+                         <GIC_SPI 597 IRQ_TYPE_LEVEL_HIGH 0>,
+                         <GIC_SPI 598 IRQ_TYPE_LEVEL_HIGH 0>;
+            interrupt-names = "core", "hs_pme", "ss_pme";
+            clocks = <&hsion_usbc_non_sticky_clk>,  <&hsion_usbc_sticky_clk>;
+            clock-names = "non_sticky", "sticky";
+            resets = <&hsion_resets_usbc_non_sticky>, <&hsion_resets_usbc_sticky>,
+                     <&hsion_resets_usb_drd_bus>, <&hsion_resets_usb_top>;
+            reset-names = "non_sticky", "sticky", "drd_bus", "top";
+            power-domains = <&hsio_n_usb_psw>, <&hsio_n_usb>;
+            power-domain-names = "psw", "top";
+            phys = <&usb_phy 0>;
+            phy-names = "usb2-phy";
+            snps,quirk-frame-length-adjustment = <0x20>;
+            snps,gfladj-refclk-lpm-sel-quirk;
+            snps,incr-burst-type-adjustment = <4>;
+            google,usb-cfg-csr = <&usb_cfg_csr 0x0 0x20>;
+        };
+    };
+...
-- 
2.52.0.rc1.455.g30608eb744-goog


