Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1609CFC51E
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Nov 2025 09:32:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6uA4BsZvYHkelguC3jPSh0Ymd2guMG3cKedszSiFxIU=; b=fAhAeTaVZxBrteFTboa20y+CH4
	oth2zWA2aRiMGPIPZ5xh09enGJ8AE9N8XlP4L0mcrDTB3Ycw5Dg4WvyIGH+8v0/cT/DYPbRytSk3L
	GtKvNyMIVAy4QcIq3ElkBbv5lSN8gZiAvinUZvPS1w0H6l9mGJEuvVquit5we2sZa30ulcsr8ygWT
	dkvRhpLF3hQheD+me4c7PT6ZbUwJHbfIZF7oNBW3K/wIq3Iaj1c2h36MoLfJRdUpmLyB/ZNtJ4OoE
	6fD4wX3tOyDiV+AQXUGTb2FXuIRF/7ni1dZn78MVegSDUs2yMUWoOBFtO9ktsc9wTMMMI33kjbRE6
	PlNPkUlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMjyk-00000009QH9-3XI4;
	Sat, 22 Nov 2025 09:32:26 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMjyf-00000009QEJ-2OoR
	for linux-arm-kernel@lists.infradead.org;
	Sat, 22 Nov 2025 09:32:22 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-7ae3e3e0d06so2295080b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 22 Nov 2025 01:32:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763803940; x=1764408740; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=6uA4BsZvYHkelguC3jPSh0Ymd2guMG3cKedszSiFxIU=;
        b=cAqNVbIwZgbjtaQD0LEFtxaBjppwO2QcTAHy5zNoTIBLDZoTdujH1owBJv6ztmRqJ1
         4BF183olHNUvhwaKOqz2ALFyj5L/HOhOkgdmpqDxDsUwUv+b/hZmbfSVSQTfUReK5uN+
         QyaY2wr0S2BadsLOum2ugYdJlCOcOo2ISjF0CpF/uwQMaVo+FcoDSI0/0dGX3S2HngrL
         V1+2KuP1ZPccqfD1k2GOvVsaRL/FPa6DdPbieQvVB7PMPwaPXahLX2YszA0MqHshi9l9
         CYf2X7Fw2rpHtrmoya4nwUwkCBfGr+t8NWSSrQFX4NGhV+CFmxt17gXG6mixA3SPH2HS
         DoPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763803940; x=1764408740;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6uA4BsZvYHkelguC3jPSh0Ymd2guMG3cKedszSiFxIU=;
        b=MNRtLLAl/DAVW1M1ISPqNvgwR0UgGEhgsJY1/OaX4ML2WHHbSTOKbrMmH5gjBheP5d
         J005I+I8+WIGcXNKLwuiLztJMk1sS64Peq9iKK2DZh3iHdGYuDiw9ckQnOtcmVAohl76
         7gD7c/s0Nxg9fZmpiuw44Lt6S9kUbNwOycniagh3Yt1T3Hp8E3gqyVp1gldj4OG9Auk/
         iE+SrIn8Y5rRN5T0YIXncsJlTVHfCK7tGjG49x/WkAOsk/veI7K8ii6aOWrERf2SvB4k
         9B4dEPY6tA1mvVCe3py75kV5d8s1kkAcysOCrjV6VhLyjuW2oMJm3QYUjBwN9ZDdTKmg
         z7HA==
X-Forwarded-Encrypted: i=1; AJvYcCUTrNb8Fm7FSKOCucLotFxinkeoNuJBrp1k5qR3BHa0QuUsAKY0Kp9jJGx5bewFC7MC6sVSFeL+F+Fk/wn/KuBh@lists.infradead.org
X-Gm-Message-State: AOJu0Yxu4x3LH5ylD5v2BCcUIN/3I/kXQZe49XOREWig206No+OW+HJ/
	fI0Rsm08HE4Uk1r5628dyOCTlMwx18pgcsXCrm5S4sTN117jE1oY1NaVjRCAlMwuHkp98unFGsl
	vtwy42A==
X-Google-Smtp-Source: AGHT+IHl5gQjkCpePgnH5NPZtBouFAbOcCvUQ5vBMlaEHVfr4gxBZdKBqng2/CINzcFgZ55QNGdO339e5lw=
X-Received: from dlbbo41.prod.google.com ([2002:a05:7022:43a9:b0:11b:484:b6b7])
 (user=royluo job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:92b:b0:119:e56b:91e9
 with SMTP id a92af1059eb24-11c9d85fd3amr2188921c88.26.1763803939943; Sat, 22
 Nov 2025 01:32:19 -0800 (PST)
Date: Sat, 22 Nov 2025 09:32:05 +0000
In-Reply-To: <20251122-controller-v8-0-e7562e0df658@google.com>
Mime-Version: 1.0
References: <20251122-controller-v8-0-e7562e0df658@google.com>
X-Developer-Key: i=royluo@google.com; a=ed25519; pk=nTq1n8WcJActRWe1s8jdcy+TzpTK4a+IYRCIWvQfq5k=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763803936; l=5662;
 i=royluo@google.com; s=20251120; h=from:subject:message-id;
 bh=BAGJDnv8pWgpuauJ6B3xVihHBjwuUxW9KRVJ9Fls4cg=; b=c5RqE8tk5lSyrGFbsnGQiX+s2zyz8jfFFMR2XGA9DDeckrqRy1SM173yO8GgLEvG6FDdMZLYE
 2yjqeH2Js0hD4RBVoZJI8gVr/hBm4jh1nEcvY30bntKgTmcqlu5Xk1r
X-Mailer: b4 0.14.2
Message-ID: <20251122-controller-v8-1-e7562e0df658@google.com>
Subject: [PATCH v8 1/2] dt-bindings: usb: dwc3: Add Google Tensor G5 DWC3
From: Roy Luo <royluo@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, 
	"=?utf-8?q?Andr=C3=A9_Draszik?=" <andre.draszik@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Badhri Jagan Sridharan <badhri@google.com>, Doug Anderson <dianders@google.com>, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	Joy Chakraborty <joychakr@google.com>, Naveen Kumar <mnkumar@google.com>, Roy Luo <royluo@google.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251122_013221_616590_BCCD308E 
X-CRM114-Status: GOOD (  15.84  )
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
 .../devicetree/bindings/usb/google,lga-dwc3.yaml   | 140 +++++++++++++++++++++
 1 file changed, 140 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/google,lga-dwc3.yaml b/Documentation/devicetree/bindings/usb/google,lga-dwc3.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..95be84c843f5da0e80ef5ef1ac9193019b5eb2a0
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
2.52.0.rc2.455.g230fcf2819-goog


