Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38D89CCD199
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 23:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uBtgf5vnEXmLQ0VM1QPw2ajUDmPAziTO20ovX0Hz/e4=; b=HVPR5g7/EtgpJFeiovWdkQJmWJ
	MtxhPh0Mze9SJrIRBQ/14eE9f4isq19vNecz5pLt41wWC50D1KfzQZQMjQpfKpOlHw5SBvRr/Ov8G
	MDJ1qhMKpvMyzzuDe84BGU9xhbUxcKiFn897YTpLxVLW59YKSQwCsWSiOkVS7DIgL86DI5aO6T4IA
	KdR4mmZLFbO5E8Qic2fCDnz2mqu9K9t8O3lRU6GE/FfPfE7cbgV06n9+cgYweYMx/wPuO2rRElVms
	oc/3eDgOkvmGmio1otY/owc1GiR5hAwxaK9PL9o305aqWSUSBJ+wOjJVHcLKDx2UHKZOny3KONaww
	A52/bhEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9tyl-00000009C5a-01KB;
	Fri, 17 Oct 2025 23:35:23 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9tyh-00000009C2q-05Kp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 23:35:21 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-32edda89a37so2238133a91.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Oct 2025 16:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760744118; x=1761348918; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=uBtgf5vnEXmLQ0VM1QPw2ajUDmPAziTO20ovX0Hz/e4=;
        b=mIycUkA2UCuAMs+/IfdN72PhdgF1b1WaK157Hwq84HWOw5dXBXIg1MNIHNzNMkHZ5Z
         3HKQnYcpRr4yBRxbYf6fishZ2tMwlH+zLwQaCHXFrcZkQ6qG5ffNWbXkfVyShMPNVWuh
         j5+ACENgOIBrc3L/6cFI+c5Nmtjx1qNewMk+SQ+ToZszBrEwMib+35qk3DHEOchDtbhd
         uqnjWOmj/01ppP9Lcgc10IYdfFIr3wT8PRLi6Vu0gHGXxspe1PT8c0FIU29JTXFcrC7Q
         6eUaniEESt0eDgdDVSGqWkA6ScG2IgxX2LdkTq5fQB6UA5ifWGXX2JhOqAyHC4s3ynbY
         /PVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760744118; x=1761348918;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uBtgf5vnEXmLQ0VM1QPw2ajUDmPAziTO20ovX0Hz/e4=;
        b=gKWA/KkAilR2EdSR2pWjG89l3mR/OiRjpeDkfuVi9ctMC5uLz4ixd6APcH3/hqRaZe
         1tDilqYCGFwMnXMM1RSIMYn+kZkRAS+HJub5vtqEKlMbVd+a7C4ETxlStqFYzV6Lo2Nt
         V1JT7mOy+QpvHSPtHTnn8Va3MrcRzLmcXrFAVIMUV5KZv6ppK5apJbuKQvfbuzK9rMQf
         irkWc/7RHRVwpQ0zpevFc1T75SvDYj6L8sbKlG5dkke2XRa/cIbLI7ybGduMqxvqfXr1
         5SOLjG7hbVLzYlAInFq/9kFbwTljpFfoEDpyDwTxlIIFtuNb1UPE90HRHFAZi/rQ7fiX
         CdGw==
X-Forwarded-Encrypted: i=1; AJvYcCUSpooqtG8i8NZV53H0uEUQpXZWeqXriury3Gy7fu5ZvnX2iQ2GTxXF3zyFJzrA16hUVYM6O6zoAsBB80GDzTGr@lists.infradead.org
X-Gm-Message-State: AOJu0YymQMf1yPu6KWt4U9Yjsf5taXkpnn45NWkVyu2t72yN+2QevX0s
	PBwfN9p4KyXa+1NRilUciA6VOby/ZilGXJ0JvvuGj9hmbZwY+vbq/TqsC81f9XHvpsbRjIRNpeo
	yEKQ/2Q==
X-Google-Smtp-Source: AGHT+IFhiZ7zlyGtCjXNqejcRcaQZDSmUdfiNBTRmnq1ief791h4f8sHMX2o8msPyY/DXfgtDuAuhD1mh/U=
X-Received: from pjbsj14.prod.google.com ([2002:a17:90b:2d8e:b0:33b:cfa0:dd8a])
 (user=royluo job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3144:b0:335:2b86:f319
 with SMTP id 98e67ed59e1d1-33bcf919094mr7035036a91.35.1760744118117; Fri, 17
 Oct 2025 16:35:18 -0700 (PDT)
Date: Fri, 17 Oct 2025 23:34:58 +0000
In-Reply-To: <20251017233459.2409975-1-royluo@google.com>
Mime-Version: 1.0
References: <20251017233459.2409975-1-royluo@google.com>
X-Mailer: git-send-email 2.51.0.858.gf9c4a03a3a-goog
Message-ID: <20251017233459.2409975-2-royluo@google.com>
Subject: [PATCH v4 1/2] dt-bindings: usb: dwc3: Add Google Tensor G5 DWC3
From: Roy Luo <royluo@google.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Peter Griffin <peter.griffin@linaro.org>, 
	"=?UTF-8?q?Andr=C3=A9=20Draszik?=" <andre.draszik@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Joy Chakraborty <joychakr@google.com>, Naveen Kumar <mnkumar@google.com>, Roy Luo <royluo@google.com>, 
	Badhri Jagan Sridharan <badhri@google.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_163520_795912_870DC3DD 
X-CRM114-Status: GOOD (  14.15  )
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
existing Samsung/Exynos DWC3 USB bindings are incompatible, necessitating
this new device tree binding.

The USB controller on Tensor G5 is based on Synopsys DWC3 IP and features
Dual-Role Device single port with hibernation support.

Signed-off-by: Roy Luo <royluo@google.com>
---
 .../bindings/usb/google,gs5-dwc3.yaml         | 135 ++++++++++++++++++
 1 file changed, 135 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/google,gs5-dwc3.yaml

diff --git a/Documentation/devicetree/bindings/usb/google,gs5-dwc3.yaml b/Documentation/devicetree/bindings/usb/google,gs5-dwc3.yaml
new file mode 100644
index 000000000000..09756bf6fd3c
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/google,gs5-dwc3.yaml
@@ -0,0 +1,135 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright (c) 2025, Google LLC
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/google,gs5-dwc3.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Google Tensor Series (G5+) DWC3 USB SoC Controller
+
+maintainers:
+  - Roy Luo <royluo@google.com>
+
+description:
+  Describes the DWC3 USB controller block implemented on Google Tensor SoCs,
+  starting with the G5 generation. Based on Synopsys DWC3 IP, the controller
+  features Dual-Role Device single port with hibernation add-on.
+
+properties:
+  compatible:
+    const: google,gs5-dwc3
+
+  reg:
+    items:
+      - description: Core DWC3 IP registers.
+      - description: USB host controller configuration registers.
+      - description: USB custom interrrupts control registers.
+
+  reg-names:
+    items:
+      - const: dwc3_core
+      - const: host_cfg
+      - const: usbint_cfg
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
+required:
+  - compatible
+  - reg
+  - reg-names
+  - interrupts
+  - interrupt-names
+  - clocks
+  - clock-names
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
+            reg = <0 0x0c400000  0 0xd060>, <0 0x0c450000 0 0x14>, <0 0x0c450020 0 0x43>;
+            reg-names = "dwc3_core", "host_cfg", "usbint_cfg";
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
+        };
+    };
+...
-- 
2.51.0.858.gf9c4a03a3a-goog


