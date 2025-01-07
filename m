Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14124E77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 13:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=foGSh8Qx+tHz2jBBjTQp3yHR2idqHu77k8B9vJZUK4U=; b=W2jqZXFjsASmVXlRecx3XrJfAT
	/0i/ztSpFx0SIl1Geuh1SDRhgXGQHNc8/Cg7k+b21r7J/7iiqx4RP668N3bY/lgr56rH9/o2yIHNG
	qkwHSsF2HPISqfY5IrxUNopfot/HmvLIMnuvxRxd0hFWeq40lPlBizWrsUJgHKjTiPHz05Q95K8Cn
	o3g/JPLibIGw1yZl5/+MmWijMgT5ZXgKQqkNU9IdVJK+n7PwjYUYx71vtuvIyFf480rbUy/KuAxJ5
	NlmwCt4poMfErvRJ0Msi7nsAgPi28NNT4GLAcewYtFEBRxnv93gVw7S1Nbh8cskkqSK6ytRmUCGsZ
	wCR6ur4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV9My-00000004wrr-0EZ5;
	Tue, 07 Jan 2025 13:11:40 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV9Lg-00000004wTq-2WCk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 13:10:24 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-436230de7a3so24000105e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jan 2025 05:10:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736255419; x=1736860219; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=foGSh8Qx+tHz2jBBjTQp3yHR2idqHu77k8B9vJZUK4U=;
        b=PnJg9dmZw/a3ZOV7zEAPb+LqG1Hpxv4Ic5IIWMNN49lHsZyqSAVXz/Db7kb3kX+Sr1
         5DtIfN006EAl3VNP6esFE7LNUtSjJWhX2Ukrr/IUU1MAkv6GZQtbcnqeKa7RXp5ITzVL
         pnROjO1Shrp7+Xjyqifow+F98RhazDpbaObFUAClT0u+JVL4vD41qWyAbswcPtG5n930
         PG7FPgzX+WZwFpjmMDHVdJGIA+l48rv82XK8BLI+ek++NqYk7eY9k/kffazmQkRyByd5
         YmDQNeGpjMeJpPcJwM/OCpTFAs1J0cRscuXkAAEjJ2e3MWbWPBOc6jIOfqp0SaF7N0+m
         4O1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736255419; x=1736860219;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=foGSh8Qx+tHz2jBBjTQp3yHR2idqHu77k8B9vJZUK4U=;
        b=JvZW5GLHSV0C4u8c8Bpn0kfQJBlHWKONzfNi6EppMGPEZ7QLfrmuAqUftlwOw4QWuQ
         laYIIJq8v83JjmzyMXZStnzHGC5PlDf1zhW2YKbdWShYVQ0b+BrGz9PlPnGZHYOkN2vZ
         ctl5Kvj+Hne8ThMYViJy+ugwzNZKa74ZtiBwt2rNSz3DgvNk7C/3s4fnoMLe6lgxgFWO
         8dTUQstad4L1kn1JYq774qNaAn2eD/H6VC4p2mUSMLLb7JRR1McVFNWMflAI1u6MOv5W
         FwTD4NKlfu/Tcx9AN4sn451at/arvgnC8/VdH5+XcGCzf6ABsk7VMRRXCo1WjNu/4Ao6
         kCGg==
X-Forwarded-Encrypted: i=1; AJvYcCX8RxIQHblrZsl6v8gxS3eXzr5JSJ14EXxNeRQE/xcECiZUQcGvtrli2uLcjr7KrjQarp+VL3ACGPxi9pUtnudg@lists.infradead.org
X-Gm-Message-State: AOJu0Yxn+T3HnAgSeqYE33y+fHNGuctANdU1fP9NQ2ebRaIBIQ5mTf22
	YpOeSzkoX4vP8Z9JPv9564P6DAb65flvY1zFiJeMgr/h2LDW8ICL6iKu5KRzEmc=
X-Gm-Gg: ASbGncuPsJhJSHpWEi7DW2i69OZIcwe95GTSPUGDk2awHWISlsmAkNro7bXKqp8DAPv
	lCr/tFYXVBO7+2ow1+3aENWlvHRs4qZBZtYu1Qt1im+ocyHcg+kVKuc2DNuimTJEXqPEFIdR/hO
	kShmANl3SgX6aQdir5mF8sJSk2N6FKlbnkafMcSjJYf86AvgUdJyMRP+0F1BVNMhF/Q/WCk9+Y1
	4biou6fpkC3wCbsxkmZo/ahS3F3tAZsHl5xaMLp0zvC+0r2uS/S2XbPej7wmxCLgqdyF8A=
X-Google-Smtp-Source: AGHT+IH39DkPJVWh8PafMTPXRemOXm/34TIro/3P9lD0JdYV/DGP9CY4oekqiAbO683Y/GqNrRLsmw==
X-Received: by 2002:a05:600c:1d1f:b0:436:17f4:9b3d with SMTP id 5b1f17b1804b1-43668b602c1mr206813905e9.4.1736255418875;
        Tue, 07 Jan 2025 05:10:18 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656af6c42sm631416065e9.9.2025.01.07.05.10.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 05:10:18 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Justin Chen <justin.chen@broadcom.com>,
	Al Cooper <alcooperx@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Benjamin Bara <benjamin.bara@skidata.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Ahmad Zainie <wan.ahmad.zainie.wan.mohamad@intel.com>,
	Del Regno <angelogioacchino.delregno@collabora.com>,
	Tianping Fang <tianping.fang@mediatek.com>,
	Jassi Brar <jaswinder.singh@linaro.org>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] dt-bindings: usb: Correct indentation and style in DTS example
Date: Tue,  7 Jan 2025 14:10:13 +0100
Message-ID: <20250107131015.246461-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_051020_654884_3AC00C1B 
X-CRM114-Status: GOOD (  13.99  )
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

DTS example in the bindings should be indented with 2- or 4-spaces and
aligned with opening '- |', so correct any differences like 3-spaces or
mixtures 2- and 4-spaces in one binding.

No functional changes here, but saves some comments during reviews of
new patches built on existing code.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/usb/aspeed,usb-vhub.yaml         | 40 +++++++++----------
 .../devicetree/bindings/usb/brcm,bdc.yaml     | 14 +++----
 .../devicetree/bindings/usb/cypress,hx3.yaml  | 24 +++++------
 .../devicetree/bindings/usb/dwc2.yaml         |  4 +-
 .../devicetree/bindings/usb/fcs,fsa4480.yaml  | 20 +++++-----
 .../bindings/usb/intel,keembay-dwc3.yaml      | 30 +++++++-------
 .../devicetree/bindings/usb/ite,it5205.yaml   | 18 ++++-----
 .../bindings/usb/maxim,max3420-udc.yaml       | 28 ++++++-------
 .../bindings/usb/nvidia,tegra210-xusb.yaml    |  4 +-
 .../bindings/usb/renesas,rzv2m-usb3drd.yaml   | 36 ++++++++---------
 .../bindings/usb/renesas,usb3-peri.yaml       | 24 +++++------
 .../devicetree/bindings/usb/ti,hd3ss3220.yaml | 38 +++++++++---------
 .../bindings/usb/ti,tusb73x0-pci.yaml         |  6 +--
 .../devicetree/bindings/usb/ti,usb8020b.yaml  | 20 +++++-----
 .../devicetree/bindings/usb/ti,usb8041.yaml   | 16 ++++----
 15 files changed, 161 insertions(+), 161 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/aspeed,usb-vhub.yaml b/Documentation/devicetree/bindings/usb/aspeed,usb-vhub.yaml
index a86bcd95100e..7f22f9c031b2 100644
--- a/Documentation/devicetree/bindings/usb/aspeed,usb-vhub.yaml
+++ b/Documentation/devicetree/bindings/usb/aspeed,usb-vhub.yaml
@@ -113,27 +113,27 @@ examples:
   - |
     #include <dt-bindings/clock/aspeed-clock.h>
     vhub: usb-vhub@1e6a0000 {
-            compatible = "aspeed,ast2500-usb-vhub";
-            reg = <0x1e6a0000 0x300>;
-            interrupts = <5>;
-            clocks = <&syscon ASPEED_CLK_GATE_USBPORT1CLK>;
-            aspeed,vhub-downstream-ports = <5>;
-            aspeed,vhub-generic-endpoints = <15>;
-            pinctrl-names = "default";
-            pinctrl-0 = <&pinctrl_usb2ad_default>;
+        compatible = "aspeed,ast2500-usb-vhub";
+        reg = <0x1e6a0000 0x300>;
+        interrupts = <5>;
+        clocks = <&syscon ASPEED_CLK_GATE_USBPORT1CLK>;
+        aspeed,vhub-downstream-ports = <5>;
+        aspeed,vhub-generic-endpoints = <15>;
+        pinctrl-names = "default";
+        pinctrl-0 = <&pinctrl_usb2ad_default>;
 
-            vhub-vendor-id = <0x1d6b>;
-            vhub-product-id = <0x0107>;
-            vhub-device-revision = <0x0100>;
-            vhub-strings {
-                #address-cells = <1>;
-                #size-cells = <0>;
+        vhub-vendor-id = <0x1d6b>;
+        vhub-product-id = <0x0107>;
+        vhub-device-revision = <0x0100>;
+        vhub-strings {
+            #address-cells = <1>;
+            #size-cells = <0>;
 
-                string@409 {
-                        reg = <0x409>;
-                        manufacturer = "ASPEED";
-                        product = "USB Virtual Hub";
-                        serial-number = "0000";
-                };
+            string@409 {
+                reg = <0x409>;
+                manufacturer = "ASPEED";
+                product = "USB Virtual Hub";
+                serial-number = "0000";
             };
+        };
     };
diff --git a/Documentation/devicetree/bindings/usb/brcm,bdc.yaml b/Documentation/devicetree/bindings/usb/brcm,bdc.yaml
index 9e561fee98f1..f9375c69e86b 100644
--- a/Documentation/devicetree/bindings/usb/brcm,bdc.yaml
+++ b/Documentation/devicetree/bindings/usb/brcm,bdc.yaml
@@ -41,10 +41,10 @@ additionalProperties: false
 
 examples:
   - |
-        usb@f0b02000 {
-                compatible = "brcm,bdc-udc-v2";
-                reg = <0xf0b02000 0xfc4>;
-                interrupts = <0x0 0x60 0x0>;
-                phys = <&usbphy_0 0x0>;
-                clocks = <&sw_usbd>;
-        };
+    usb@f0b02000 {
+        compatible = "brcm,bdc-udc-v2";
+        reg = <0xf0b02000 0xfc4>;
+        interrupts = <0x0 0x60 0x0>;
+        phys = <&usbphy_0 0x0>;
+        clocks = <&sw_usbd>;
+    };
diff --git a/Documentation/devicetree/bindings/usb/cypress,hx3.yaml b/Documentation/devicetree/bindings/usb/cypress,hx3.yaml
index e44e88d993d0..1033b7a4b8f9 100644
--- a/Documentation/devicetree/bindings/usb/cypress,hx3.yaml
+++ b/Documentation/devicetree/bindings/usb/cypress,hx3.yaml
@@ -56,21 +56,21 @@ examples:
 
         /* 2.0 hub on port 1 */
         hub_2_0: hub@1 {
-          compatible = "usb4b4,6504";
-          reg = <1>;
-          peer-hub = <&hub_3_0>;
-          reset-gpios = <&gpio1 11 GPIO_ACTIVE_LOW>;
-          vdd-supply = <&reg_1v2_usb>;
-          vdd2-supply = <&reg_3v3_usb>;
+            compatible = "usb4b4,6504";
+            reg = <1>;
+            peer-hub = <&hub_3_0>;
+            reset-gpios = <&gpio1 11 GPIO_ACTIVE_LOW>;
+            vdd-supply = <&reg_1v2_usb>;
+            vdd2-supply = <&reg_3v3_usb>;
         };
 
         /* 3.0 hub on port 2 */
         hub_3_0: hub@2 {
-          compatible = "usb4b4,6506";
-          reg = <2>;
-          peer-hub = <&hub_2_0>;
-          reset-gpios = <&gpio1 11 GPIO_ACTIVE_LOW>;
-          vdd-supply = <&reg_1v2_usb>;
-          vdd2-supply = <&reg_3v3_usb>;
+            compatible = "usb4b4,6506";
+            reg = <2>;
+            peer-hub = <&hub_2_0>;
+            reset-gpios = <&gpio1 11 GPIO_ACTIVE_LOW>;
+            vdd-supply = <&reg_1v2_usb>;
+            vdd2-supply = <&reg_3v3_usb>;
         };
     };
diff --git a/Documentation/devicetree/bindings/usb/dwc2.yaml b/Documentation/devicetree/bindings/usb/dwc2.yaml
index a5f2e3442a0e..e83d30a91b88 100644
--- a/Documentation/devicetree/bindings/usb/dwc2.yaml
+++ b/Documentation/devicetree/bindings/usb/dwc2.yaml
@@ -192,7 +192,7 @@ unevaluatedProperties: false
 
 examples:
   - |
-      usb@101c0000 {
+    usb@101c0000 {
         compatible = "rockchip,rk3066-usb", "snps,dwc2";
         reg = <0x10180000 0x40000>;
         interrupts = <18>;
@@ -200,6 +200,6 @@ examples:
         clock-names = "otg";
         phys = <&usbphy>;
         phy-names = "usb2-phy";
-      };
+    };
 
 ...
diff --git a/Documentation/devicetree/bindings/usb/fcs,fsa4480.yaml b/Documentation/devicetree/bindings/usb/fcs,fsa4480.yaml
index 8b25b9a01ced..e3a7df91f7f1 100644
--- a/Documentation/devicetree/bindings/usb/fcs,fsa4480.yaml
+++ b/Documentation/devicetree/bindings/usb/fcs,fsa4480.yaml
@@ -87,21 +87,21 @@ examples:
         #size-cells = <0>;
 
         typec-mux@42 {
-          compatible = "fcs,fsa4480";
-          reg = <0x42>;
+            compatible = "fcs,fsa4480";
+            reg = <0x42>;
 
-          interrupts-extended = <&tlmm 2 IRQ_TYPE_LEVEL_LOW>;
+            interrupts-extended = <&tlmm 2 IRQ_TYPE_LEVEL_LOW>;
 
-          vcc-supply = <&vreg_bob>;
+            vcc-supply = <&vreg_bob>;
 
-          mode-switch;
-          orientation-switch;
+            mode-switch;
+            orientation-switch;
 
-          port {
-            fsa4480_ept: endpoint {
-              remote-endpoint = <&typec_controller>;
+            port {
+                fsa4480_ept: endpoint {
+                    remote-endpoint = <&typec_controller>;
+                };
             };
-          };
         };
     };
 ...
diff --git a/Documentation/devicetree/bindings/usb/intel,keembay-dwc3.yaml b/Documentation/devicetree/bindings/usb/intel,keembay-dwc3.yaml
index d3511f48cd55..1a75544a8c31 100644
--- a/Documentation/devicetree/bindings/usb/intel,keembay-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/intel,keembay-dwc3.yaml
@@ -58,20 +58,20 @@ examples:
     #define KEEM_BAY_A53_AUX_USB_SUSPEND
 
     usb {
-          compatible = "intel,keembay-dwc3";
-          clocks = <&scmi_clk KEEM_BAY_A53_AUX_USB>,
-                   <&scmi_clk KEEM_BAY_A53_AUX_USB_REF>,
-                   <&scmi_clk KEEM_BAY_A53_AUX_USB_ALT_REF>,
-                   <&scmi_clk KEEM_BAY_A53_AUX_USB_SUSPEND>;
-          clock-names = "async_master", "ref", "alt_ref", "suspend";
-          ranges;
-          #address-cells = <1>;
-          #size-cells = <1>;
+        compatible = "intel,keembay-dwc3";
+        clocks = <&scmi_clk KEEM_BAY_A53_AUX_USB>,
+                 <&scmi_clk KEEM_BAY_A53_AUX_USB_REF>,
+                 <&scmi_clk KEEM_BAY_A53_AUX_USB_ALT_REF>,
+                 <&scmi_clk KEEM_BAY_A53_AUX_USB_SUSPEND>;
+        clock-names = "async_master", "ref", "alt_ref", "suspend";
+        ranges;
+        #address-cells = <1>;
+        #size-cells = <1>;
 
-          usb@34000000 {
-                compatible = "snps,dwc3";
-                reg = <0x34000000 0x10000>;
-                interrupts = <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>;
-                dr_mode = "peripheral";
-          };
+        usb@34000000 {
+            compatible = "snps,dwc3";
+            reg = <0x34000000 0x10000>;
+            interrupts = <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>;
+            dr_mode = "peripheral";
+        };
     };
diff --git a/Documentation/devicetree/bindings/usb/ite,it5205.yaml b/Documentation/devicetree/bindings/usb/ite,it5205.yaml
index 36ec4251b5f2..889710733de5 100644
--- a/Documentation/devicetree/bindings/usb/ite,it5205.yaml
+++ b/Documentation/devicetree/bindings/usb/ite,it5205.yaml
@@ -54,19 +54,19 @@ examples:
         #size-cells = <0>;
 
         typec-mux@48 {
-          compatible = "ite,it5205";
-          reg = <0x48>;
+            compatible = "ite,it5205";
+            reg = <0x48>;
 
-          mode-switch;
-          orientation-switch;
+            mode-switch;
+            orientation-switch;
 
-          vcc-supply = <&mt6359_vibr_ldo_reg>;
+            vcc-supply = <&mt6359_vibr_ldo_reg>;
 
-          port {
-            it5205_usbss_sbu: endpoint {
-              remote-endpoint = <&typec_controller>;
+            port {
+                it5205_usbss_sbu: endpoint {
+                    remote-endpoint = <&typec_controller>;
+                };
             };
-          };
         };
     };
 ...
diff --git a/Documentation/devicetree/bindings/usb/maxim,max3420-udc.yaml b/Documentation/devicetree/bindings/usb/maxim,max3420-udc.yaml
index 8e0f4ecc010d..6edb1fc5044e 100644
--- a/Documentation/devicetree/bindings/usb/maxim,max3420-udc.yaml
+++ b/Documentation/devicetree/bindings/usb/maxim,max3420-udc.yaml
@@ -50,18 +50,18 @@ additionalProperties: false
 
 examples:
   - |
-      #include <dt-bindings/gpio/gpio.h>
-      #include <dt-bindings/interrupt-controller/irq.h>
-      spi {
-            #address-cells = <1>;
-            #size-cells = <0>;
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
 
-            udc@0 {
-                  compatible = "maxim,max3420-udc";
-                  reg = <0>;
-                  interrupt-parent = <&gpio>;
-                  interrupts = <0 IRQ_TYPE_EDGE_FALLING>, <10 IRQ_TYPE_EDGE_BOTH>;
-                  interrupt-names = "udc", "vbus";
-                  spi-max-frequency = <12500000>;
-            };
-      };
+        udc@0 {
+            compatible = "maxim,max3420-udc";
+            reg = <0>;
+            interrupt-parent = <&gpio>;
+            interrupts = <0 IRQ_TYPE_EDGE_FALLING>, <10 IRQ_TYPE_EDGE_BOTH>;
+            interrupt-names = "udc", "vbus";
+            spi-max-frequency = <12500000>;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/usb/nvidia,tegra210-xusb.yaml b/Documentation/devicetree/bindings/usb/nvidia,tegra210-xusb.yaml
index 90296613b3a5..c0e313c70bba 100644
--- a/Documentation/devicetree/bindings/usb/nvidia,tegra210-xusb.yaml
+++ b/Documentation/devicetree/bindings/usb/nvidia,tegra210-xusb.yaml
@@ -189,7 +189,7 @@ examples:
         #size-cells = <0>;
 
         ethernet@1 {
-                compatible = "usb955,9ff";
-                reg = <1>;
+            compatible = "usb955,9ff";
+            reg = <1>;
         };
     };
diff --git a/Documentation/devicetree/bindings/usb/renesas,rzv2m-usb3drd.yaml b/Documentation/devicetree/bindings/usb/renesas,rzv2m-usb3drd.yaml
index ff625600d9af..b87e139c29e5 100644
--- a/Documentation/devicetree/bindings/usb/renesas,rzv2m-usb3drd.yaml
+++ b/Documentation/devicetree/bindings/usb/renesas,rzv2m-usb3drd.yaml
@@ -104,26 +104,26 @@ examples:
         #size-cells = <1>;
 
         usb3host: usb@85060000 {
-           compatible = "renesas,r9a09g011-xhci",
-                        "renesas,rzv2m-xhci";
-           reg = <0x85060000 0x2000>;
-           interrupts = <GIC_SPI 245 IRQ_TYPE_LEVEL_HIGH>;
-           clocks = <&cpg CPG_MOD R9A09G011_USB_ACLK_H>,
-                    <&cpg CPG_MOD R9A09G011_USB_PCLK>;
-           clock-names = "axi", "reg";
-           power-domains = <&cpg>;
-           resets = <&cpg R9A09G011_USB_ARESETN_H>;
+            compatible = "renesas,r9a09g011-xhci",
+                         "renesas,rzv2m-xhci";
+            reg = <0x85060000 0x2000>;
+            interrupts = <GIC_SPI 245 IRQ_TYPE_LEVEL_HIGH>;
+            clocks = <&cpg CPG_MOD R9A09G011_USB_ACLK_H>,
+                     <&cpg CPG_MOD R9A09G011_USB_PCLK>;
+            clock-names = "axi", "reg";
+            power-domains = <&cpg>;
+            resets = <&cpg R9A09G011_USB_ARESETN_H>;
         };
 
         usb3peri: usb3peri@85070000 {
-           compatible = "renesas,r9a09g011-usb3-peri",
-                        "renesas,rzv2m-usb3-peri";
-           reg = <0x85070000 0x400>;
-           interrupts = <GIC_SPI 246 IRQ_TYPE_LEVEL_HIGH>;
-           clocks = <&cpg CPG_MOD R9A09G011_USB_ACLK_P>,
-                    <&cpg CPG_MOD R9A09G011_USB_PCLK>;
-           clock-names = "axi", "reg";
-           power-domains = <&cpg>;
-           resets = <&cpg R9A09G011_USB_ARESETN_P>;
+            compatible = "renesas,r9a09g011-usb3-peri",
+                         "renesas,rzv2m-usb3-peri";
+            reg = <0x85070000 0x400>;
+            interrupts = <GIC_SPI 246 IRQ_TYPE_LEVEL_HIGH>;
+            clocks = <&cpg CPG_MOD R9A09G011_USB_ACLK_P>,
+                     <&cpg CPG_MOD R9A09G011_USB_PCLK>;
+            clock-names = "axi", "reg";
+            power-domains = <&cpg>;
+            resets = <&cpg R9A09G011_USB_ARESETN_P>;
         };
     };
diff --git a/Documentation/devicetree/bindings/usb/renesas,usb3-peri.yaml b/Documentation/devicetree/bindings/usb/renesas,usb3-peri.yaml
index b2b811a0ade8..4e56e4ffeaf2 100644
--- a/Documentation/devicetree/bindings/usb/renesas,usb3-peri.yaml
+++ b/Documentation/devicetree/bindings/usb/renesas,usb3-peri.yaml
@@ -132,19 +132,19 @@ examples:
         usb-role-switch;
 
         ports {
-                #address-cells = <1>;
-                #size-cells = <0>;
-                port@0 {
-                        reg = <0>;
-                        usb3_hs_ep: endpoint {
-                                remote-endpoint = <&hs_ep>;
-                        };
+            #address-cells = <1>;
+            #size-cells = <0>;
+            port@0 {
+                reg = <0>;
+                usb3_hs_ep: endpoint {
+                    remote-endpoint = <&hs_ep>;
                 };
-                port@1 {
-                        reg = <1>;
-                        usb3_role_switch: endpoint {
-                                remote-endpoint = <&hd3ss3220_out_ep>;
-                        };
+            };
+            port@1 {
+                reg = <1>;
+                usb3_role_switch: endpoint {
+                    remote-endpoint = <&hd3ss3220_out_ep>;
                 };
+            };
         };
     };
diff --git a/Documentation/devicetree/bindings/usb/ti,hd3ss3220.yaml b/Documentation/devicetree/bindings/usb/ti,hd3ss3220.yaml
index 54c6586cb56d..bec1c8047bc0 100644
--- a/Documentation/devicetree/bindings/usb/ti,hd3ss3220.yaml
+++ b/Documentation/devicetree/bindings/usb/ti,hd3ss3220.yaml
@@ -56,26 +56,26 @@ examples:
         #size-cells = <0>;
 
         hd3ss3220@47 {
-                compatible = "ti,hd3ss3220";
-                reg = <0x47>;
-                interrupt-parent = <&gpio6>;
-                interrupts = <3>;
+            compatible = "ti,hd3ss3220";
+            reg = <0x47>;
+            interrupt-parent = <&gpio6>;
+            interrupts = <3>;
 
-                ports {
-                        #address-cells = <1>;
-                        #size-cells = <0>;
-                        port@0 {
-                                reg = <0>;
-                                hd3ss3220_in_ep: endpoint {
-                                        remote-endpoint = <&ss_ep>;
-                                };
-                        };
-                        port@1 {
-                                reg = <1>;
-                                hd3ss3220_out_ep: endpoint {
-                                        remote-endpoint = <&usb3_role_switch>;
-                                };
-                        };
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+                port@0 {
+                    reg = <0>;
+                    hd3ss3220_in_ep: endpoint {
+                        remote-endpoint = <&ss_ep>;
+                    };
                 };
+                port@1 {
+                    reg = <1>;
+                    hd3ss3220_out_ep: endpoint {
+                        remote-endpoint = <&usb3_role_switch>;
+                    };
+                };
+            };
         };
     };
diff --git a/Documentation/devicetree/bindings/usb/ti,tusb73x0-pci.yaml b/Documentation/devicetree/bindings/usb/ti,tusb73x0-pci.yaml
index ddda734f36fb..c4a91b3d6612 100644
--- a/Documentation/devicetree/bindings/usb/ti,tusb73x0-pci.yaml
+++ b/Documentation/devicetree/bindings/usb/ti,tusb73x0-pci.yaml
@@ -48,8 +48,8 @@ examples:
         device_type = "pci";
 
         usb@0 {
-              compatible = "pci104c,8241";
-              reg = <0x0 0x0 0x0 0x0 0x0>;
-              ti,pwron-active-high;
+            compatible = "pci104c,8241";
+            reg = <0x0 0x0 0x0 0x0 0x0>;
+            ti,pwron-active-high;
         };
     };
diff --git a/Documentation/devicetree/bindings/usb/ti,usb8020b.yaml b/Documentation/devicetree/bindings/usb/ti,usb8020b.yaml
index 8ef117793e11..61217da8b2f3 100644
--- a/Documentation/devicetree/bindings/usb/ti,usb8020b.yaml
+++ b/Documentation/devicetree/bindings/usb/ti,usb8020b.yaml
@@ -51,19 +51,19 @@ examples:
 
         /* 2.0 hub on port 1 */
         hub_2_0: hub@1 {
-          compatible = "usb451,8027";
-          reg = <1>;
-          peer-hub = <&hub_3_0>;
-          reset-gpios = <&pio 7 GPIO_ACTIVE_HIGH>;
-          vdd-supply = <&usb_hub_fixed_3v3>;
+            compatible = "usb451,8027";
+            reg = <1>;
+            peer-hub = <&hub_3_0>;
+            reset-gpios = <&pio 7 GPIO_ACTIVE_HIGH>;
+            vdd-supply = <&usb_hub_fixed_3v3>;
         };
 
         /* 3.0 hub on port 2 */
         hub_3_0: hub@2 {
-          compatible = "usb451,8025";
-          reg = <2>;
-          peer-hub = <&hub_2_0>;
-          reset-gpios = <&pio 7 GPIO_ACTIVE_HIGH>;
-          vdd-supply = <&usb_hub_fixed_3v3>;
+            compatible = "usb451,8025";
+            reg = <2>;
+            peer-hub = <&hub_2_0>;
+            reset-gpios = <&pio 7 GPIO_ACTIVE_HIGH>;
+            vdd-supply = <&usb_hub_fixed_3v3>;
         };
     };
diff --git a/Documentation/devicetree/bindings/usb/ti,usb8041.yaml b/Documentation/devicetree/bindings/usb/ti,usb8041.yaml
index c2e29bd61e11..bce730a5e237 100644
--- a/Documentation/devicetree/bindings/usb/ti,usb8041.yaml
+++ b/Documentation/devicetree/bindings/usb/ti,usb8041.yaml
@@ -51,17 +51,17 @@ examples:
 
         /* 2.0 hub on port 1 */
         hub_2_0: hub@1 {
-          compatible = "usb451,8142";
-          reg = <1>;
-          peer-hub = <&hub_3_0>;
-          reset-gpios = <&gpio1 11 GPIO_ACTIVE_LOW>;
+            compatible = "usb451,8142";
+            reg = <1>;
+            peer-hub = <&hub_3_0>;
+            reset-gpios = <&gpio1 11 GPIO_ACTIVE_LOW>;
         };
 
         /* 3.0 hub on port 2 */
         hub_3_0: hub@2 {
-          compatible = "usb451,8140";
-          reg = <2>;
-          peer-hub = <&hub_2_0>;
-          reset-gpios = <&gpio1 11 GPIO_ACTIVE_LOW>;
+            compatible = "usb451,8140";
+            reg = <2>;
+            peer-hub = <&hub_2_0>;
+            reset-gpios = <&gpio1 11 GPIO_ACTIVE_LOW>;
         };
     };
-- 
2.43.0


