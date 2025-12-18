Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF1D9D6E2CA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 19:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+1jAO5OkFctgjgvLFeR5GZWAlUuaUk1lRHaPxMi+Zmg=; b=u3bMlCmts9x5sSWGkngiV7CsQV
	Kp7XMVEa3HdRRS0NdGkCepdZjSH20bUpzKy/dRpYxIVnNE5j/kbfFPjZs/2JIRDs7hpGpYCb/qsAD
	+XOCba82crswGmljwF39C7U72YSikRznDXpFdvUnP+3O0zWtnfOuE3sjCSsLwVsrsFW29KWTmHlmK
	8FcFfiGxCME2MMZYXM8RKiryG35Ice1Prr/MA/eAI2fz4VJvysTf2DJ1nQKoW/8ijlj0at2Z+T150
	mY5iEd6Wka8XiWEn4vU3VN09OPatBDdQNEepAogmSTehrW0kTmNg6V1pigWL+BgTMgLJtpokp8+gr
	r8AtQc/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWJbr-00000009546-33dG;
	Thu, 18 Dec 2025 19:24:23 +0000
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWJbo-0000000952u-0KIU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 19:24:21 +0000
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-c1290abb178so1571522a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Dec 2025 11:24:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1766085859; x=1766690659; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=+1jAO5OkFctgjgvLFeR5GZWAlUuaUk1lRHaPxMi+Zmg=;
        b=Tm9CDBXyTV4du+Hp+xw9z4d1e6eUw01d6813gY5yy8JkJO2CS6fQUO2GjIPOuwu/fI
         yaM6UvLdN9c3xlRD9kZi60fTuDI2fWj8PNuPTir0zJRVBJPI0YhE70laij/zReVd/0C2
         Zavh5bilmu1o4NtFv2FPCuc5H6qgtYDUa5lMC9Kf3I7k/xTDHDRnbQKYm7dM2/JLMWxw
         m0qpBzyXJHvnD5jq4b7XFStwPYUW/xwxJY8LbHLumefeBK4uFPJVznn+G4cpHClRMYUr
         ICv8JTUfBxC4MEgfFy6Cm7nb9vigArjQxlvvXWQvSgmbpEuN20S1sDJyaOrebjQouNwZ
         2qaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766085859; x=1766690659;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+1jAO5OkFctgjgvLFeR5GZWAlUuaUk1lRHaPxMi+Zmg=;
        b=dmo8pMjMBlgiZ/0CMfZc2dbEE+/dlkU6P55bR3HjQ9231lIxL6CgLooDI2rfpJJaK/
         DbMU/29RvDqkED3WCbYcPerp9O5B6zGGJxvNBPR3hFuHWUM320XC2vrnbyuEyplSqtKi
         sbQoRPpVi/9jEeM/4hMTfgT7U+IhJ44qh/widXDgCY2Yx9xHrrsDRHaybF49wQS0vZJh
         R2rvsBDI4dsjJqAMBAl7FYyIpgEYiXQm1NZMhuNdsWzeTD5rKmAJklpKmhPKtWqInFux
         y5Wua5f5ePWj7qlF1h2hQDutziCZ338LSybUjcR1P9GmsqqVshy4VN6XRkBlGpo9d8Ia
         K19w==
X-Forwarded-Encrypted: i=1; AJvYcCXCC6xLzlWapt5pEXGhYnYXM6bFZnlBH94dKYKZBHbtTqX7GgRgsfReAVx+FyLF8yza+Fvr2vZ6zEOGHQUQg0pU@lists.infradead.org
X-Gm-Message-State: AOJu0YyNLw+Xxuy/eB2idfX4ghODKgEo2HAGj73v578NOqIgjcTpTfhr
	6qbJNAp08u2Vd+kywmGIfr0EZ6y8npFsAhzaFFJxRh+PlVX5B3sapbpVhgM+AMV2QDCACEmWabP
	XTIcUBA==
X-Google-Smtp-Source: AGHT+IGKOqN4k5awIv9aD0au2NSr+t5mWfUOKpwiwuv/7H24jzBLzxLGFSCpv0hVhDHUb1AeXCYKsxKfli0=
X-Received: from dybcq12.prod.google.com ([2002:a05:7300:a10c:b0:2ac:20c:bf8c])
 (user=royluo job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:80c2:b0:2ae:4be1:db4a
 with SMTP id 5a478bee46e88-2b05ec02ff2mr657714eec.12.1766085858827; Thu, 18
 Dec 2025 11:24:18 -0800 (PST)
Date: Thu, 18 Dec 2025 19:23:10 +0000
In-Reply-To: <20251218-controller-v10-0-4047c9077274@google.com>
Mime-Version: 1.0
References: <20251218-controller-v10-0-4047c9077274@google.com>
X-Developer-Key: i=royluo@google.com; a=ed25519; pk=nTq1n8WcJActRWe1s8jdcy+TzpTK4a+IYRCIWvQfq5k=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766085855; l=6350;
 i=royluo@google.com; s=20251120; h=from:subject:message-id;
 bh=ZJ0IssI4zNzaruHS9OTE6D+AnYa3QijDEC/j1EyBmMc=; b=PUcZ6OJ1RjmFb8tXgV1sVQsHGGvEo3Vv97eXtlWAeK+4DWJG4ONarYEEtU583jdkdfYW4ozIu
 KmN/hpnsEVoD6SYnoemAwX00Y0hxKWMqP/Qa8iQTxc+vbq9/mm4lhFj
X-Mailer: b4 0.14.2
Message-ID: <20251218-controller-v10-1-4047c9077274@google.com>
Subject: [PATCH v10 1/2] dt-bindings: usb: dwc3: Add Google Tensor G5 DWC3
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
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_112420_133428_8E61B23C 
X-CRM114-Status: GOOD (  17.24  )
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

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Roy Luo <royluo@google.com>
---
 .../devicetree/bindings/usb/google,lga-dwc3.yaml   | 140 +++++++++++++++++++++
 MAINTAINERS                                        |   1 +
 2 files changed, 141 insertions(+)

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
diff --git a/MAINTAINERS b/MAINTAINERS
index 5b11839cba9de1e9e43f63787578edd8c429ca39..5c8fbbb63c610d4d01ed4d78b1632774603eeaa4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10722,6 +10722,7 @@ P:	Documentation/process/maintainer-soc-clean-dts.rst
 C:	irc://irc.oftc.net/pixel6-kernel-dev
 F:	Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
 F:	Documentation/devicetree/bindings/soc/google/google,gs101-pmu-intr-gen.yaml
+F:	Documentation/devicetree/bindings/usb/google,lga-dwc3.yaml
 F:	arch/arm64/boot/dts/exynos/google/
 F:	drivers/clk/samsung/clk-gs101.c
 F:	drivers/soc/samsung/gs101-pmu.c

-- 
2.52.0.322.g1dd061c0dc-goog


