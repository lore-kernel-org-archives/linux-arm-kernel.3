Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE26FCCD186
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Oct 2025 06:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fKVxg4WoPrUf/1g2EJBbMsdrqJ7J4uyOel2ApqCtl4o=; b=kPPtaBntXmHgkyf+9rfY6fdceR
	gJXkck+nIMUKnuC9sY+uAyquhluLwjGxfrG5qloGbLxFq9iSSTahkDDu6Oy4HwurrAGPNDbxqD6r7
	SxrV9Cli4fMgsGm78lW01gKMgMeex320Dhb9AkJKhgHr+74Of1MSfFg8SJsNiS3oYT1s/h9YFyzf3
	NDF7cGnnCqa6Cr41d1msQz/PJ9UllhKI3+gp7DAh1hwYZOzfWmHDWBky6N8pUPeeBM1001y1pmqnb
	2KwDWQOSdxV+UTJjZpnXTYbZOAmlQrOz0imfR/YSMDfXIbvEupdoT5rYPlh9M4wUv1IbXbubgAIWI
	f8JanzmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6NDk-00000003FEE-3W88;
	Wed, 08 Oct 2025 06:00:16 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6NDi-00000003FCe-1AXX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Oct 2025 06:00:15 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-2699ebc0319so69938765ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Oct 2025 23:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759903213; x=1760508013; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=fKVxg4WoPrUf/1g2EJBbMsdrqJ7J4uyOel2ApqCtl4o=;
        b=pqtc1jj0Rh4+MCxmJt5VAcieeCf0OYLe4k/bKmb0omVy2RiSVtczHrMHoXH7mw2XQ9
         mAkTvqYu0t0uKjevi1Y3e/Upyo1Xvg3fAvPSXY/iIof6WRHqCFUL249k13eiS5I8xoZX
         UXoTpLJLunGu3LFmUzvo6biZs9AXtiyY29Ruj4+o5q/GdXo3Bi0SLRcI8LyUOocxwAL7
         K+1UBjezt/zdd2pTkIYMgvP50cTUBDCXhHMFOuCwMZxc0Dj/PdFGFFga/Xglbu7elRW0
         h2tUFEYYolJQLbCw6ZJdxSd9WQDtoDdT1gqI2HcppVrxV9AHP4tdKI8KGOOmKthw0tvp
         49tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759903213; x=1760508013;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fKVxg4WoPrUf/1g2EJBbMsdrqJ7J4uyOel2ApqCtl4o=;
        b=SQcjtplkKQJEsvmdPSiqZoPju50+gi5GzAwqU+9PsBm6PnkzXnLM6xOqUMTt2dIz/C
         AG3yyconnSi3ch6fVdTwoBNO1Q78bJwD/DROEoMiGfqdqEKT1ROnY8J5U5gZ6FLoTbFJ
         1ByX0MgZPlEEOp89U4oJd9PdAXdqDo0cCw6SHnYjhSk1j4Aj1gyXms21/B4DB38IcB3M
         A+/q904HjoUVlLFesUlD/Optut0T4VNxrCPmYeIohoynN6n2YSUvncSVXNU2mfgybTYB
         Bf9OCqfh/ID0OKpOwX/Zk9lYejerpQDdfI6bfaak/lq+smP/3bjxt8uy+cL1BFWxu4/m
         OJIQ==
X-Forwarded-Encrypted: i=1; AJvYcCXZbZT+i/5acXffGNEevopyjPwXasntvb3XD7sCZ6eQldt7FnGkOW1XjwO08736B4yUznxzW3Y7PqRQ1VONial+@lists.infradead.org
X-Gm-Message-State: AOJu0YwjBtS7pCMttypmCfavRyu4XD774FYDpi+/KVSqr0ULBLkrmzET
	nGSvPbiJ78V4PVPWip3IIEHOWuNQ+TWJIGhSgC5jEH/dwc27LxVbA9rtogKykyYtHqx6o/y3CS9
	Z5DO1fg==
X-Google-Smtp-Source: AGHT+IEyo0B3o+ZPfKvOdrwXh59jKmgJAQXZpnESAfqmBlS0+CaamSvGek6ShAj0Lt8oc4gS4HOqEV0MfV4=
X-Received: from plhu17.prod.google.com ([2002:a17:903:1251:b0:28e:7f4e:dd17])
 (user=royluo job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:3807:b0:269:8d16:42d1
 with SMTP id d9443c01a7336-290272e1e24mr28143825ad.50.1759903213112; Tue, 07
 Oct 2025 23:00:13 -0700 (PDT)
Date: Wed,  8 Oct 2025 05:59:57 +0000
In-Reply-To: <20251008060000.3136021-1-royluo@google.com>
Mime-Version: 1.0
References: <20251008060000.3136021-1-royluo@google.com>
X-Mailer: git-send-email 2.51.0.710.ga91ca5db03-goog
Message-ID: <20251008060000.3136021-2-royluo@google.com>
Subject: [PATCH v2 1/4] dt-bindings: usb: dwc3: Add Google Tensor G5 DWC3
From: Roy Luo <royluo@google.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Peter Griffin <peter.griffin@linaro.org>, 
	"=?UTF-8?q?Andr=C3=A9=20Draszik?=" <andre.draszik@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Joy Chakraborty <joychakr@google.com>, Naveen Kumar <mnkumar@google.com>, Roy Luo <royluo@google.com>, 
	Badhri Jagan Sridharan <badhri@google.com>, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251007_230014_322275_489862F2 
X-CRM114-Status: GOOD (  16.38  )
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
Google Tensor SoCs, starting with the G5 generation.

The Tensor G5 silicon represents a complete architectural departure from
previous generations (like gs101), including entirely new clock/reset
schemes, top-level wrapper and register interface. Consequently,
existing Samsung/Exynos DWC3 USB bindings and drivers are incompatible,
necessitating this new device tree binding.

The USB controller on Tensor G5 is based on Synopsys DWC3 IP and features
Dual-Role Device single port with hibernation support.

Signed-off-by: Roy Luo <royluo@google.com>
---
 .../bindings/usb/google,gs-dwc3.yaml          | 145 ++++++++++++++++++
 1 file changed, 145 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/google,gs-dwc3.yaml

diff --git a/Documentation/devicetree/bindings/usb/google,gs-dwc3.yaml b/Documentation/devicetree/bindings/usb/google,gs-dwc3.yaml
new file mode 100644
index 000000000000..9eb0bf726e8d
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/google,gs-dwc3.yaml
@@ -0,0 +1,145 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright (c) 2025, Google LLC
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/google,gs-dwc3.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Google Tensor Series (G5+) DWC3 USB SoC Controller
+
+maintainers:
+  - Roy Luo <royluo@google.com>
+
+description: |
+  Describes the DWC3 USB controller block implemented on Google Tensor SoCs,
+  starting with the G5 generation. Based on Synopsys DWC3 IP, the controller
+  features Dual-Role Device single port with hibernation add-on.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - google,gs5-dwc3
+
+  reg:
+    minItems: 3
+    maxItems: 3
+
+  reg-names:
+    description: |
+      The following memory regions must present:
+        - dwc3_core: Core DWC3 IP registers.
+        - host_cfg_csr: Hibernation control registers.
+        - usbint_csr: Hibernation interrupt registers.
+    items:
+      - const: dwc3_core
+      - const: host_cfg_csr
+      - const: usbint_csr
+
+  interrupts:
+    minItems: 3
+    maxItems: 3
+
+  interrupt-names:
+    description: |
+      The following interrupts must present:
+        - dwc_usb3: Core DWC3 interrupt.
+        - hs_pme_irq: High speed remote wakeup interrupt for hibernation.
+        - ss_pme_irq: Super speed remote wakeup interrupt for hibernation.
+    items:
+      - const: dwc_usb3
+      - const: hs_pme_irq
+      - const: ss_pme_irq
+
+  clocks:
+    minItems: 3
+    maxItems: 3
+
+  clock-names:
+    minItems: 3
+    maxItems: 3
+
+  resets:
+    minItems: 5
+    maxItems: 5
+
+  reset-names:
+    items:
+      - const: usbc_non_sticky
+      - const: usbc_sticky
+      - const: usb_drd_bus
+      - const: u2phy_apb
+      - const: usb_top_csr
+
+  power-domains:
+    minItems: 2
+    maxItems: 2
+
+  power-domain-names:
+    description: |
+      The following power domain must present:
+          - usb_psw_pd: The child power domain of usb_top_pd. Turning it on puts the controller
+                         into full power state, turning it off puts the controller into power
+                         gated state.
+          - usb_top_pd: The parent power domain of usb_psw_pd. Turning it on puts the controller
+                         into power gated state, turning it off completely shuts off the
+                         controller.
+    items:
+      - const: usb_psw_pd
+      - const: usb_top_pd
+
+  iommus:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - interrupts
+  - interrupt-names
+  - clocks
+  - resets
+  - reset-names
+  - power-domains
+  - power-domain-names
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
+            compatible = "google,gs5-dwc3";
+            reg = <0 0x0c400000  0 0xd060>, <0 0x0c450000 0 0x14>, <0 0x0c450020 0 0x8>;
+            reg-names = "dwc3_core", "host_cfg_csr", "usbint_csr";
+            interrupts = <GIC_SPI 580 IRQ_TYPE_LEVEL_HIGH 0>,
+                         <GIC_SPI 597 IRQ_TYPE_LEVEL_HIGH 0>,
+                         <GIC_SPI 598 IRQ_TYPE_LEVEL_HIGH 0>;
+            interrupt-names = "dwc_usb3", "hs_pme_irq", "ss_pme_irq";
+            clocks = <&hsion_usbc_non_sticky_clk>,  <&hsion_usbc_sticky_clk>,
+                     <&hsion_u2phy_apb_clk>;
+            clock-names = "usbc_non_sticky", "usbc_sticky", "u2phy_apb";
+            resets = <&hsion_resets_usbc_non_sticky>, <&hsion_resets_usbc_sticky>,
+                     <&hsion_resets_usb_drd_bus>, <&hsion_resets_u2phy_apb>,
+                     <&hsion_resets_usb_top_csr>;
+            reset-names = "usbc_non_sticky", "usbc_sticky",
+                     "usb_drd_bus", "u2phy_apb",
+                     "usb_top_csr";
+            power-domains = <&hsio_n_usb_psw_pd>, <&hsio_n_usb_pd>;
+            power-domain-names = "usb_psw_pd", "usb_top_pd";
+            phys = <&usb_phy 0>;
+            phy-names = "usb2-phy";
+            snps,quirk-frame-length-adjustment = <0x20>;
+            snps,gfladj-refclk-lpm-sel-quirk;
+            snps,incr-burst-type-adjustment = <4>;
+        };
+    };
+...
-- 
2.51.0.710.ga91ca5db03-goog


