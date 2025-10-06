Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60E0CCCD184
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Oct 2025 23:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EoPxQXwQ5XFM/6+OUgDgFqK1K2D8fPLQvjVzNWUSG1k=; b=Q0sbkvpCI0olv0cJ2XsknvwljW
	cl+hzDxEQk4Cn7Ao7O7IWsSsSDdhH574D0An4DBxcg8x7FT806sbyeQAzJLtmQrnP7wtHpE1+I+rD
	zisDgEpHUQrzWEK6sqE/qMXw5DySHLGABcLA/M3c17rQFI5sZmCW1eUcMphyrOMe6t7Q8w8Josa82
	IrgjC5+uWs5XyA0WtGr56l18xf2JQKXLUNMAxKamWjEHu2zrz1SUzLSgjmuQbbTDL/6/mnOC9plcW
	y9Nt7awHCpcTWw0lsfbBtGF5ZPm2ru8DgUnoH8WBia0Rs5cpKRu87ITQnHsBpgSy6t4NdVIKimAj7
	+KTknOGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5uWp-00000000ztP-1Cgm;
	Mon, 06 Oct 2025 23:22:03 +0000
Received: from mail-oa1-x4a.google.com ([2001:4860:4864:20::4a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5uWm-00000000zqZ-41lN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Oct 2025 23:22:02 +0000
Received: by mail-oa1-x4a.google.com with SMTP id 586e51a60fabf-3a5620fde02so7881767fac.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Oct 2025 16:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759792919; x=1760397719; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=EoPxQXwQ5XFM/6+OUgDgFqK1K2D8fPLQvjVzNWUSG1k=;
        b=RlchLN1eSpZZL/rgvoISFnEh4lUQUed/B7Eg+Zwz5H3arqZqWOIFrAEOyZKYhGUFKJ
         dWFMpT6OHQPlH7PNvh9BWpj425hcRzr3tYpcaLDXL8Z23Pk72k6tz3UTmwiQWKclHEB6
         FkDTaW/EkHHiVUL5mvs2x9va9Gq7JlTPgOGSlNg/ckfEcauzFVZ1rHq4ZyUm8vlTvFNt
         j+MJuzG8hFWpHCNqVYY+O4u99Tpniq/ZJYjfUAXHJiKc0EeM5PlQoi0Rw1q3yaNcoXwU
         ydL9nbKnx1jlVliw3w5UA3TqMNhZ5WhsF7Ti4+4XhCLBMpSPuhYnMBOR1SQ1rHKMvu5D
         L0Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759792919; x=1760397719;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EoPxQXwQ5XFM/6+OUgDgFqK1K2D8fPLQvjVzNWUSG1k=;
        b=rFBi1CqXM5ovqgIViztF+Mv+GRsefvjVmic7cs4tPtEWrdKNiAyOJh8xcTBLVgAP9H
         u4ZKbTRVoyxi6uRmCkJ/sT5f0BNrlt1F7V/0LHNrRekElXQvNUVO8dCYo51uTaj06TqK
         ToEVb7yZ4nz9sMBAkhbhEO+5S/pTyeFxV0XLwC9vlUWf9BmGoI9dtdbsdvr0T7egS0Zz
         TFh4AYAxPTQJKS37AdAxvF/Kcjsa0Vry2+DGXwh+DtyY0/4WNXZ2uLDuochLrTgwBF9r
         9A9IAzRqzgrNPyWwE5anXJTjovHDVGKCJzguWBltfQI3yQgstFK58qM/RQXpwu8u+7vX
         Dxtg==
X-Forwarded-Encrypted: i=1; AJvYcCViVneT7cENx0ZNjB9ePHATj1Q3K8u5TJmo3NEZEsPr2PBiAvaGoDz7+quhLB+1/ZBz/xhL5ou7CPgD3w3svXRe@lists.infradead.org
X-Gm-Message-State: AOJu0Yy03UORY+DD4cn3PuzbxT9EZabZnF6ST8NMvPwI9aRBJ6kxgqtI
	cNMTQN9ElnMWN8lKu5jbawaoXwLg2pnq279rAcYJcTJGl9nwi38k/laiLgqoGo9B1rwA0z45xbC
	kRj12lg==
X-Google-Smtp-Source: AGHT+IHuvSLSe+7hqIjhfAafsJ/Rg53JuStEyumsyKGui3lJI0P+5OWjCcwfbXPLbHA2q9kxTGLsRs1awBo=
X-Received: from oala19.prod.google.com ([2002:a05:6870:b153:b0:359:cc61:b60e])
 (user=royluo job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6870:959a:b0:345:bbd6:b0a1
 with SMTP id 586e51a60fabf-3b10283e13cmr8039798fac.30.1759792915730; Mon, 06
 Oct 2025 16:21:55 -0700 (PDT)
Date: Mon,  6 Oct 2025 23:21:23 +0000
In-Reply-To: <20251006232125.1833979-1-royluo@google.com>
Mime-Version: 1.0
References: <20251006232125.1833979-1-royluo@google.com>
X-Mailer: git-send-email 2.51.0.618.g983fd99d29-goog
Message-ID: <20251006232125.1833979-3-royluo@google.com>
Subject: [PATCH v1 2/4] dt-bindings: usb: dwc3: Add Google SoC DWC3 USB
From: Roy Luo <royluo@google.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Peter Griffin <peter.griffin@linaro.org>, 
	"=?UTF-8?q?Andr=C3=A9=20Draszik?=" <andre.draszik@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Joy Chakraborty <joychakr@google.com>, Naveen Kumar <mnkumar@google.com>, Roy Luo <royluo@google.com>, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251006_162201_008020_7B401EAD 
X-CRM114-Status: GOOD (  14.37  )
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

Document the DWC3 USB bindings for Google Tensor SoCs.

Signed-off-by: Roy Luo <royluo@google.com>
---
 .../bindings/usb/google,snps-dwc3.yaml        | 144 ++++++++++++++++++
 1 file changed, 144 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/google,snps-dwc3.yaml

diff --git a/Documentation/devicetree/bindings/usb/google,snps-dwc3.yaml b/Documentation/devicetree/bindings/usb/google,snps-dwc3.yaml
new file mode 100644
index 000000000000..3e8bcc0c2cef
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/google,snps-dwc3.yaml
@@ -0,0 +1,144 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright (c) 2025, Google LLC
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/google,snps-dwc3.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Google DWC3 USB SoC Controller
+
+maintainers:
+  - Roy Luo <royluo@google.com>
+
+description:
+  Describes the Google DWC3 USB block, based on Synopsys DWC3 IP.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - google,lga-dwc3
+      - const: google,snps-dwc3
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
+            compatible = "google,lga-dwc3", "google,snps-dwc3";
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
2.51.0.618.g983fd99d29-goog


