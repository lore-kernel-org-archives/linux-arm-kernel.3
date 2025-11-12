Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A4B2CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 12:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DL8GJ0K0iNwYW+A1OoM+d4qx21RJUKEPvPuxNBd2KIY=; b=Z7c7+tubVWq97c1vjKAVu56lXN
	7bLRvj4+GiovA35UXRPZMLHRLqgJqiE6kpeyeA7WJ5iSdDZxtHpJ4C9KH9heBamk1IELZ0LQA69FC
	8K5AhitbZ2/DgTrQ0tb9z/PJ0g1fonRsiWzO0sQYaFp8Zw1otyrOgmgdev12jU5e3JSKuKAGQBTxr
	sA0RttwKPofdZTC5W23ZiGitldTfjnDUK8reylewMhN7rm6VzNfGEzyi6MboLoUeQGQcGY1XtRPEz
	SW36to6h4bCH3bCCFpN4dK4gBiN5YMfje+2aHH+Y6bA50BcIpR+jSDmEmx5Q+5NPHapBEq21UT3Bj
	59Y1HMfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJA2h-00000008mEt-1zd9;
	Wed, 12 Nov 2025 12:33:43 +0000
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJA2e-00000008mD9-2dLb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 12:33:41 +0000
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-b522037281bso666133a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 04:33:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762950819; x=1763555619; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=DL8GJ0K0iNwYW+A1OoM+d4qx21RJUKEPvPuxNBd2KIY=;
        b=rRgKDRkcy+IdVfMXTwwZJ8EogdwM8SmhLqnK6XD6BABA+N8HPoc6gtkmycujqhZOu2
         fnu94uUtHdjZ8o++FeHn1v+vCjBAe+FbtOqXLM3+JXlh+rol74dN/zM2+jtg34QihIO8
         60+E4Gh4izSJbTUVFHlpXpDfKzNavEKOZdgfsJEQZRwvSCvNWFFO6DuQnDryx0RibgIe
         36PW6fv5+uaQ6NFGGE/6ssY7uTbK/6AZR1XUfZxnE9YZrO7JSJjQhTMDjgEwhN86ceyK
         715MqlS2fJ9MGiCTR2gh6DGQ+Z6w8ZRzzXE5pu4Dy2XvPbmQNfkqhila5Hw8FoLo1LpP
         14iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762950819; x=1763555619;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DL8GJ0K0iNwYW+A1OoM+d4qx21RJUKEPvPuxNBd2KIY=;
        b=OtDzwVFYNZLrEYNbO4QgYUutr2Yi9iIupVL8O23odJbm3C59DzyZqfQxVtJP4pW0l9
         NXeZfRcEcrsdMx42WrkH6EOKP14hIBgWCbcbmm9yhPudhwK1Z7WnCW/UmiT1G7QiVrzf
         RIw6j+LkhQfc7xdRIWZYQi4ZuAE9gg2r+j89msp2qvzitviR9NOr/PeQ1m+rb/jii80j
         E2Zu7ErBmEwZ9gIMD7E6HJGiw+fs+XFVc5FzpOKHaYXScNOLvTJH56ts1pAsAR5unt1S
         qx8deIDoX3DgK8Eh8mdqMG5Hkw2l1tAKf7HzbPIEto3L40msUQI6AUQtb7Wdqi/I7+a6
         6Kig==
X-Forwarded-Encrypted: i=1; AJvYcCVhC+9ipuHtDuXLDQswyLpVf/533QWqteLNNP2pvGJu5/ljzZuWC+0tsldfmP7KENsEmmLdA14OooKLcR2L+xXv@lists.infradead.org
X-Gm-Message-State: AOJu0YxgDIRibu1FPFuWA8hTqtAzmXzvAvsUZRZPu4cpuvBmJbOwpVgv
	2e3NRtK72bzFiZ2vLBlCIXWJ2oh4Dlu6wxTZM64wdZK9a3mjR7ntxNkH8pRuZeaAfQQjGqtcwuM
	29rpRAA==
X-Google-Smtp-Source: AGHT+IHW6MkJJN6CNX2hfnUNdBNBx+IM3THZOwO6ahE5BTDHOZbstitebr0A6VvJc7/SjssqfaCawsE5+Tw=
X-Received: from dlaj13.prod.google.com ([2002:a05:701b:280d:b0:119:b185:ea6a])
 (user=royluo job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:19c8:b0:295:613f:3d6a
 with SMTP id d9443c01a7336-2984edacc5fmr40942345ad.29.1762950819047; Wed, 12
 Nov 2025 04:33:39 -0800 (PST)
Date: Wed, 12 Nov 2025 12:32:56 +0000
In-Reply-To: <20251112123257.3755489-1-royluo@google.com>
Mime-Version: 1.0
References: <20251112123257.3755489-1-royluo@google.com>
X-Mailer: git-send-email 2.51.2.1041.gc1ab5b90ca-goog
Message-ID: <20251112123257.3755489-2-royluo@google.com>
Subject: [PATCH v6 1/2] dt-bindings: usb: dwc3: Add Google Tensor G5 DWC3
From: Roy Luo <royluo@google.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Peter Griffin <peter.griffin@linaro.org>, 
	"=?UTF-8?q?Andr=C3=A9=20Draszik?=" <andre.draszik@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Joy Chakraborty <joychakr@google.com>, Naveen Kumar <mnkumar@google.com>, Roy Luo <royluo@google.com>, 
	Badhri Jagan Sridharan <badhri@google.com>, Doug Anderson <dianders@google.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_043340_676472_F7A6629A 
X-CRM114-Status: GOOD (  17.65  )
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
2.51.2.1041.gc1ab5b90ca-goog


