Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD453CAC5B3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 16:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ojrSKhmG/fxO+GWCa4ng/6S+zCuiK4Lwk2+N5nW6KeM=; b=V2djWF3fkA8tMhOyohs/7la5C4
	eJTY155nbU+p0OTXEAAhUIOd5WptXUqU1ADIxxPTfJs/O90A/YEh2G2KUTlMBnOeMslKVdBBpZv/P
	thxPK1RoTj49voORCpIc/jgA/pJMn+sSzGj4KI77gO+srner1QNVUloNgbRkrFeSI4MczCoaJfP9R
	PabLQQH2hEV3WPw0gZgEEmRzghejWLTlRSvObnqcNjvDv6j9x6gaf0whAf1w6GYnTIcoli0+NeAYr
	DfWOP3Y5yCsFcEaTQVmN8evcPcgQaw8duz5HTEDCPGsuzK6eKc1w0WIHqRsKU1fUMymve9N7NM7WC
	D9ZGdqQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1olC-0000000B55F-1wtA;
	Thu, 25 Sep 2025 16:23:58 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1ol6-0000000B4w2-1yoR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 16:23:54 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-45b9a856dc2so7080335e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Sep 2025 09:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758817431; x=1759422231; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ojrSKhmG/fxO+GWCa4ng/6S+zCuiK4Lwk2+N5nW6KeM=;
        b=f/F3g2S1F0sIQ8FAmCw1CLW8ZD9jBZoPK23B3lU4L0qDAOihqhgUJz7PFtNy2oZVJ+
         kUueiEBdQUWGx0RaXTwX5hrAYkuqmPLPvrjSR8Mbcm7Lvl4345nd77EwiiSd5WsC/wcU
         ZuU54yPmv0hQHVYpIfdk0bOAdk/rn2RtC6jXRL5gpx2SScsxlWoGD4RJ4z/gfswEzn83
         tD2Gz6BigiZDt+dmvTvA+QHNz03tTeXy1AvaGXIPMcwunsAc5FK93Bv8iqm2petc94XW
         tdKtp+gOBq/X9GE4LvxnFesFjhXHSed8ddMGOAArObUaBMxN2NpP7XCV6p8lBBUnXMDw
         oUUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758817431; x=1759422231;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ojrSKhmG/fxO+GWCa4ng/6S+zCuiK4Lwk2+N5nW6KeM=;
        b=pTcmdiz2WuBYgOKxLCcHUhakJCH5Zxu4fFsEqpG8MlPZLAS2PN7tjgiqOqIE1ae20E
         WK/Ej9tL/jmKhwQLky5qmgslHZmUTw04ArmPpwyEgLVRkB2XlG99QRDTEvEqrhrsjf6r
         BDKzN2SxwwqK+FUifUk3TDRszuc6sdOiadZKGLPumSOJrR9k7l0VpH+W3BYMTx5YqyKT
         2L/AtwUSgDtIy+05r1I6XtPXrTYA5p3ZIYzKkdHIeYN4aa3fG5xaTG/kH1yUaks3qIq4
         Bl65wKyBGNL3QzhoYmANZM/IMPC6DqCmQUolhKr4ME78HCYlWJyQMOu7XLkAJm3ChIfl
         5RmA==
X-Forwarded-Encrypted: i=1; AJvYcCVD46oK1quJr3iYnWPXX5VKpDWMz7N+uwHhnZa3vc6Ozeiq1Npua3FR2VV3lWbZbLOLSEVLEebWpKf5Jo8hKTIs@lists.infradead.org
X-Gm-Message-State: AOJu0YyX0Q3s32lKv6CLLJMQoN2YN8W5RnheWFdDNVAuQpGAEEEpz7HU
	6q1KhmSurLwVBCsVERr8kMZ7mttoIjCT7uVx2HdXL7IvHoupV2+dc/Oi
X-Gm-Gg: ASbGncvdEKHXyacjG2MzaJc/xza8XUsKDA7dc5li7/yXd48R9B9vYbW2kzeiJy/HBr0
	IhWc1miGu8zi1xFqZLEgfA0GYkoQzgjn/DCRKj2ZkZasZQkPxC77cl79NhlJ9tzXMaK0xgEkzeI
	uSdBnTUZIOO5w2aELGNSw1+Mu4OME960WywKZNhmM1wFMwY8T8TyA0NQPzwxKb5b4wvcdhpudj5
	AE8qOpgqiOKPn5x8+okpK+ILAEOZE1GsMg1hGfv8Yu8AMjCDmrd8RhmaAY03EiPlWdguIWfDRX9
	CakZRCHqFX/jUGJ7opQpqteTWqoWIUPQj59Ss03Z/XJaRdt0caxaWUJhhmcEVAmbmqyQ0cbDGrk
	Bm+77CwNzjIxd9+LR3wEO8mo1+xfWX1XbUUG2AfiIrLRq8VVxbU4JJRh+iL0kDlG15B50eUQ=
X-Google-Smtp-Source: AGHT+IGoQEBIl1V2qVvXVjckSIeQJSaJ6Q4rOdOHbSTXBeT0yFthNPrs3b6Al9NZzt3gqkVk7xB4/w==
X-Received: by 2002:a05:600c:5290:b0:46e:394b:4991 with SMTP id 5b1f17b1804b1-46e394b4b1emr10436875e9.11.1758817430492;
        Thu, 25 Sep 2025 09:23:50 -0700 (PDT)
Received: from Ansuel-XPS24 (host-95-249-236-54.retail.telecomitalia.it. [95.249.236.54])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-40fb985e080sm3534819f8f.24.2025.09.25.09.23.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 09:23:50 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Ryder Lee <ryder.lee@mediatek.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	linux-pci@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	upstream@airoha.com
Subject: [PATCH v3 3/4] dt-bindings: PCI: mediatek: Add support for Airoha AN7583
Date: Thu, 25 Sep 2025 18:23:17 +0200
Message-ID: <20250925162332.9794-4-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250925162332.9794-1-ansuelsmth@gmail.com>
References: <20250925162332.9794-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_092352_603062_E56D0877 
X-CRM114-Status: GOOD (  14.57  )
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
index e3afedb77a01..46000049a6c5 100644
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
@@ -61,6 +62,17 @@ properties:
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
 
@@ -96,6 +108,45 @@ required:
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
@@ -131,6 +182,8 @@ allOf:
 
         power-domains: false
 
+        mediatek,pbus-csr: false
+
       required:
         - phys
         - phy-names
@@ -169,6 +222,8 @@ allOf:
 
         phy-names: false
 
+        mediatek,pbus-csr: false
+
       required:
         - power-domains
 
@@ -209,6 +264,8 @@ allOf:
           items:
             - enum: [ pcie-phy0, pcie-phy1 ]
 
+        mediatek,pbus-csr: false
+
       required:
         - power-domains
 
@@ -243,6 +300,8 @@ allOf:
 
         power-domain: false
 
+        mediatek,pbus-csr: false
+
 unevaluatedProperties: false
 
 examples:
@@ -402,3 +461,54 @@ examples:
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


