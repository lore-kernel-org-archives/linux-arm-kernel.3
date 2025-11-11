Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 435F2CCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 13:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LBcgmCCgSccCX8ofYrFtr94XQUmLnjr3zClogzAcn+A=; b=xLDPYQ1s6HUugtBpTApXDplChR
	m2jnnxGIgkdRN+bfSpw/1foBiecth9pFtRkgU/3L0QOUS4LADQV3ueAaiKXCXI9pVkypjRSBcY2Yw
	daMBbqJqI2RjcUMhJqdkumBAXFKZ8lhXFVDR771FyeoFysGXFo3z/qz626hCYbWOQyaRtPWui/FO5
	lKLmKyInQSKsOsvIqfk7RLrznnTSS47RhpJK/twn966fz48FUujc1iqWWEozkKi1L423Y9r6dlBK2
	cEzU/sxCIrjSSUGWQfD04NfrDvThlvejDoANKmsSzDaXodw6zKPVgC8GbVZL0SgNW+unLLxxK7VzK
	Zx4SygHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIo57-00000007Dqs-01XD;
	Tue, 11 Nov 2025 13:06:45 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIo54-00000007DqJ-1ALd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Nov 2025 13:06:43 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-297e5a18652so36743575ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Nov 2025 05:06:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762866401; x=1763471201; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=LBcgmCCgSccCX8ofYrFtr94XQUmLnjr3zClogzAcn+A=;
        b=AmoIQ3pG/SQQHVzg3HIlbKTiiHXPwcXgs+HT8WE7OPk+G+7/fJGVMHuyg/7kWw0Ulk
         VIjCCET/kFhLWi+bRwm3Gsv+6mSQzhzoatypjdLA8FfA22HjLZLjCBA1Y/yWAI95jh7I
         nuR82v88u6peiaNHu2q6/hSg9hSbfKZggjrm3k8cJHRT2SZ2/3Hdotqoed2iRqOqwb8O
         ZHH7JrNDtOx43MQTi+VYdZPb+EEveRqPd7XkCpm784zUmnkJJoE+bGnBnzdIdg3QuOdv
         dRO3/fEEHT+8fBmiH6dopFLW8ra6GYIH7QrWd0W5ZzlQAzYno154DveV7V+k36U2njXJ
         FB+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762866401; x=1763471201;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LBcgmCCgSccCX8ofYrFtr94XQUmLnjr3zClogzAcn+A=;
        b=XzQrWQNUfVTZfhB67AWNkEPzJ7U/y8ot2zbyGJOb60vzYwLjJ4+bzNwZKFcTQtQFL2
         NJTB+V8tHGv8asSix17U44xvUli9snyC4gB9Zkg6VAyqAQV/ZCgar/ZPx58RIusIgMXV
         B76eyhPo1Gy3Fsoc6SCoF6ngWbRjCB23TA7sjhBnhYvT1UKKhiRFfJoLdXyEGjml/A05
         8PLZirpsWdBo7ZJ6qHnL0oMFGE2rCJmtq0N3gxnkmtF8wxLBvDdgxQXKoGEQKZXnpU9w
         Vr58Xt+1Q3Pf+ZLpsAQSJsS+mImHNicPwu1ClJARfzzKS1Di9iLew2Kh+71PKC/fOlvZ
         6CaA==
X-Forwarded-Encrypted: i=1; AJvYcCW6DEclVV9wx4DvXdIxZxzu2i4t1qLmA35fGaGHxnilnzwP82qtBNxlVSxpP5r6++Jwt6w0DCVuDNcloInT3WlT@lists.infradead.org
X-Gm-Message-State: AOJu0YxsCDs/8xIo2rttQOAwU9RBSY5Bgi4kRTf06YXk0SVipcCSPl35
	TKfz/Xy93PlAEHlSq1iv57saBdmk1Paf2WkjR8eqf+9sPq1T+4lUv7c6TCXZixL7pqHjRGkWcSh
	K6Jg1TQ==
X-Google-Smtp-Source: AGHT+IGQgl9qVH8CJWK20oLI/AcKbny4pU0rW4+H2E7KlvEZI9EtCWUObJzSqnn98ouD2skVKx+kP/Tzbh4=
X-Received: from dlbrj17.prod.google.com ([2002:a05:7022:f411:b0:119:78ff:fe15])
 (user=royluo job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:e888:b0:295:8a21:155a
 with SMTP id d9443c01a7336-297e56d6144mr161827645ad.35.1762866401198; Tue, 11
 Nov 2025 05:06:41 -0800 (PST)
Date: Tue, 11 Nov 2025 13:06:23 +0000
In-Reply-To: <20251111130624.3069704-1-royluo@google.com>
Mime-Version: 1.0
References: <20251111130624.3069704-1-royluo@google.com>
X-Mailer: git-send-email 2.51.2.1041.gc1ab5b90ca-goog
Message-ID: <20251111130624.3069704-2-royluo@google.com>
Subject: [PATCH v5 1/2] dt-bindings: usb: dwc3: Add Google Tensor G5 DWC3
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
X-CRM114-CacheID: sfid-20251111_050642_329776_5E28A22E 
X-CRM114-Status: GOOD (  17.37  )
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
 .../bindings/usb/google,gs5-dwc3.yaml         | 140 ++++++++++++++++++
 1 file changed, 140 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/google,gs5-dwc3.yaml

diff --git a/Documentation/devicetree/bindings/usb/google,gs5-dwc3.yaml b/Documentation/devicetree/bindings/usb/google,gs5-dwc3.yaml
new file mode 100644
index 000000000000..bfaf6cbdfec3
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/google,gs5-dwc3.yaml
@@ -0,0 +1,140 @@
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
+            compatible = "google,gs5-dwc3";
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


