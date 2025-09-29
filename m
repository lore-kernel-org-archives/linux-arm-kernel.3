Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 856D7CAC5B5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 11:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M0akVzwetHFuOLRrA1RBETtHcqSI0prdy+4IQvcPTIc=; b=xi2TdWD68NedEC8a94x+FEQaVS
	GHgMEbrEc4pYWJxduwELjjrn5g/GsZN5/EF+YD83qDnY87GvHW4xFJD6M6okuGYDmpNTJYYddNaLg
	LHYFkoxBD3d4sliaAoy7qjr3FJojnOxA8vGfjaKs5Djj1aTlXxR6HJg6kHcQsnkwpWBpPkaen0yUg
	iuyN1eVrii+KXNUg2sIN3IiLHGYo+6VxTJidnDreCfWujs8pkymr/H1byiAvCAmQtL+DKZYWAHjj7
	HUYHJc4tGUyrMuVj69DoBERgRx8EXZczWvYKuAYV+iF5UxM50JY3pVRd0qN4NM4Pi94MK7sTfQzIi
	Nr5yvOtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3CD5-00000002MSC-2eCa;
	Mon, 29 Sep 2025 11:38:27 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3CCz-00000002MLG-1fX3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Sep 2025 11:38:22 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-46e29d65728so30796125e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Sep 2025 04:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759145900; x=1759750700; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M0akVzwetHFuOLRrA1RBETtHcqSI0prdy+4IQvcPTIc=;
        b=HNhjNVylo7gB9RRthlnNIBRqKtKDgaFSImLB5qmXHnWKqQdBgOp/ZI7SItOnX0uuAR
         TrBJl8iPfLJ7D+kVbnDMd4HdA5xE6zBQpNcw606wdddtc3XO9PDYbSLXaWf5V2ffbOjn
         G3O9yCtaCGfnlqMwSjfMOiCfh6IjmJjyr5H1WN8Udi478WbZU23b/jkx0pJGI371h6rf
         Nc2xc5YFe4M0TqpPI0Hx96Pi5eFd4K/eesISuxGW2SZKisUbRCW/TRILPe7Xb2cWoHG6
         W0PRZemAc0XnQovTIRNpAdB0niLtwDVLBnhM/+wAO5EBFv4WB7iSh9QPiPbz1HPV8vhW
         z5ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759145900; x=1759750700;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M0akVzwetHFuOLRrA1RBETtHcqSI0prdy+4IQvcPTIc=;
        b=sXuWvbNE3OCy4A0ovYeyIfhsUl+HCNZVAI4LdvfpK5G/eniBWQq4i9yIBNdQPNuQKt
         6EN30pwqPwjfrZQFo14F6hzw38CU/2O0e3yDo4kZ3Js/qejX+/U4+wETZXHirJ57+TOc
         nw5ysz3aCgvxKBIN0gZ5FvLxFzzJuzPOdcEcVx6d93MP7DM2KHQSbR7N7phMOZmJAYdt
         0/Bi6eO0A+4Ku9fUz9rp2mfxJzNyYl6GcUmP1pxvUm/0epqZgNLOR+SAQuBPHWxDm026
         jVN4eKU82DWYOQiJd1Oc9WNwqOeZeVN2FfzDLqQME4CxRZCU9lcM/OkwzOTsb+LQVDUA
         ZQpA==
X-Forwarded-Encrypted: i=1; AJvYcCWZ7dVdqyVdRmQfA5HB0yi66gD/VQ7rUhqLxEMAIA6oGI23sAamhsY6KgQMCpRWvZvD1mHUjvUauR5pMvMW+24Q@lists.infradead.org
X-Gm-Message-State: AOJu0YwSHJw1NceVVjVMjfSbw4p1tSGwxs4QfLrzpi+7gpoIze+rPBRV
	FVMm6Pz0GwYDNXloKczx+6sCW7D7q4w6Rr+Hu+7Iowi90UXo0XkyIhWR
X-Gm-Gg: ASbGnctY3pSaN+242tVCBNUCkEJoT0NX/J8KPF3JjpofCN/tlkvI7EjahupV3ysabe1
	869yNSIeWIIMBh5YN4l4kBmLDUv/pbi5fKka83rmNIxm5St16x93ZN2BYD60OWMw9RR47/4Cqxu
	48M164PGnHlhxU4iHgYhsNAXhvUz3/dhiaN53TLd4ffikz2mTO3hkf5PaJTZkA844sos1/5fRg3
	VrIdJvtn++34pd520zkEYc6SicSB45OgXgocDCrfaU9MclY2ZNpQ95ePcaKSTaYV/5IoA+7Cu/t
	H/K5U1SB3ZrB/NF7uwn+V7RN3ECENCCk9gPMbJyxiz6NEUvkzbuSBB+AoUnJW1f8CNBul2Yl1c5
	eUM2xttltvXfELmKiPE5URKAkJ1ZmFjf0rFcTvpo3Q5f+bBLiG07+9kD95or8m3NlAV4BXn0cVF
	4Tf1be9g==
X-Google-Smtp-Source: AGHT+IHc2sldTrNgGF8rhPUi/DYc+1Z7wh5Q8HiRuvHW/nw/mJhTW80r4LIKdvY/BzwTBOCgANZI6A==
X-Received: by 2002:a05:600c:181c:b0:46d:996b:826f with SMTP id 5b1f17b1804b1-46e32a02d46mr117755925e9.25.1759145899467;
        Mon, 29 Sep 2025 04:38:19 -0700 (PDT)
Received: from Ansuel-XPS24 (host-95-249-236-54.retail.telecomitalia.it. [95.249.236.54])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-46e56f53596sm9502465e9.7.2025.09.29.04.38.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 04:38:19 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Ryder Lee <ryder.lee@mediatek.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	linux-pci@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 3/5] dt-bindings: PCI: mediatek: Add support for Airoha AN7583
Date: Mon, 29 Sep 2025 13:38:02 +0200
Message-ID: <20250929113806.2484-4-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250929113806.2484-1-ansuelsmth@gmail.com>
References: <20250929113806.2484-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_043821_474527_A829D9D0 
X-CRM114-Status: GOOD (  14.17  )
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

Introduce Airoha AN7583 SoC compatible in mediatek PCIe controller
binding.

Similar to GEN3, the Airoha AN7583 GEN2 PCIe controller require the
PBUS csr property to permit the correct functionality of the PCIe
controller.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../bindings/pci/mediatek-pcie.yaml           | 110 ++++++++++++++++++
 1 file changed, 110 insertions(+)

diff --git a/Documentation/devicetree/bindings/pci/mediatek-pcie.yaml b/Documentation/devicetree/bindings/pci/mediatek-pcie.yaml
index fca6cb20d18b..b91b13a0220c 100644
--- a/Documentation/devicetree/bindings/pci/mediatek-pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/mediatek-pcie.yaml
@@ -13,6 +13,7 @@ properties:
   compatible:
     oneOf:
       - enum:
+          - airoha,an7583-pcie
           - mediatek,mt2712-pcie
           - mediatek,mt7622-pcie
           - mediatek,mt7629-pcie
@@ -55,6 +56,17 @@ properties:
   power-domains:
     maxItems: 1
 
+  mediatek,pbus-csr:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      - items:
+          - description: phandle to pbus-csr syscon
+          - description: offset of pbus-csr base address register
+          - description: offset of pbus-csr base address mask register
+    description:
+      Phandle with two arguments to the syscon node used to detect if
+      a given address is accessible on PCIe controller.
+
   '#interrupt-cells':
     const: 1
 
@@ -90,6 +102,45 @@ required:
 allOf:
   - $ref: /schemas/pci/pci-host-bridge.yaml#
 
+  - if:
+      properties:
+        compatible:
+          const: airoha,an7583-pcie
+    then:
+      properties:
+        reg:
+          maxItems: 1
+
+        reg-names:
+          const: port1
+
+        clocks:
+          maxItems: 1
+
+        clock-names:
+          const: sys_ck1
+
+        reset:
+          maxItems: 1
+
+        reset-names:
+          const: pcie-rst1
+
+        phys:
+          maxItems: 1
+
+        phy-names:
+          const: pcie-phy1
+
+        power-domain: false
+
+      required:
+        - resets
+        - reset-names
+        - phys
+        - phy-names
+        - mediatek,pbus-csr
+
   - if:
       properties:
         compatible:
@@ -106,6 +157,8 @@ allOf:
 
         power-domains: false
 
+        mediatek,pbus-csr: false
+
       required:
         - phys
         - phy-names
@@ -123,6 +176,8 @@ allOf:
 
         phy-names: false
 
+        mediatek,pbus-csr: false
+
       required:
         - power-domains
 
@@ -135,6 +190,8 @@ allOf:
         clocks:
           minItems: 6
 
+        mediatek,pbus-csr: false
+
       required:
         - power-domains
 
@@ -157,6 +214,8 @@ allOf:
 
         power-domain: false
 
+        mediatek,pbus-csr: false
+
 unevaluatedProperties: false
 
 examples:
@@ -316,3 +375,54 @@ examples:
             };
         };
     };
+
+  # AN7583
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/en7523-clk.h>
+
+    soc_3 {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        pcie@1fa92000 {
+            compatible = "airoha,an7583-pcie";
+            device_type = "pci";
+            linux,pci-domain = <1>;
+            #address-cells = <3>;
+            #size-cells = <2>;
+
+            reg = <0x0 0x1fa92000 0x0 0x1670>;
+            reg-names = "port1";
+
+            clocks = <&scuclk EN7523_CLK_PCIE>;
+            clock-names = "sys_ck1";
+
+            phys = <&pciephy>;
+            phy-names = "pcie-phy1";
+
+            ranges = <0x02000000 0 0x24000000 0x0 0x24000000 0 0x4000000>;
+
+            resets = <&scuclk>; /* AN7583_PCIE1_RST */
+            reset-names = "pcie-rst1";
+
+            mediatek,pbus-csr = <&pbus_csr 0x8 0xc>;
+
+            interrupts = <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>;
+            interrupt-names = "pcie_irq";
+            bus-range = <0x00 0xff>;
+            #interrupt-cells = <1>;
+            interrupt-map-mask = <0 0 0 7>;
+            interrupt-map = <0 0 0 1 &pcie_intc1 0>,
+                            <0 0 0 2 &pcie_intc1 1>,
+                            <0 0 0 3 &pcie_intc1 2>,
+                            <0 0 0 4 &pcie_intc1 3>;
+
+            pcie_intc1_4: interrupt-controller {
+                interrupt-controller;
+                #address-cells = <0>;
+                #interrupt-cells = <1>;
+            };
+        };
+    };
-- 
2.51.0


