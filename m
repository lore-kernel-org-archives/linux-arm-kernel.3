Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 661E1CCD1A5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 11:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ET/WdgCX7blN4pSkYOyw5+NcHdAYpJFzGJ0hMhYQ6fk=; b=bBdpuPOk2Bq1I16IY7X6oUdKeW
	kgCg9cQqbz4MF2nDXqCFA81K89brh5XLtCtl9S0SQxk/+nBM2gbGgFWO44D3D/KJOt6SyCBH3Pian
	Pjy4yJsNpTzyKO4LPe0klu1LBcwvKykRJdqxesXfnLudtJJSty0LJVwDsoV9D+CAIYN+I/sjqcIm8
	zRDf3domEZrkayeP3SQeKHQYmg3IWJrSkULxx1CCL0Pfl14glJS3OgAvOp5C1gw2bAO6lT7Ooel4R
	W0pr79B0mGFUj8m9SPDbwYfIfxPs/Ek0gb5395i+1NfOI2+0pfoHvMogsoHcWZH0arpcE/a49zFZz
	5I2hr7WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAnnm-0000000D10B-07Wv;
	Mon, 20 Oct 2025 11:11:46 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAnnj-0000000D0wn-1O7R
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 11:11:44 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-426ff694c1fso3327608f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Oct 2025 04:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760958701; x=1761563501; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ET/WdgCX7blN4pSkYOyw5+NcHdAYpJFzGJ0hMhYQ6fk=;
        b=HWbJbm0PhZuSC4Z4knQVNUi8bYZ5DRGUs9zxrA7HfbA9zhr6mQCjz/CZCORNYzp/Xf
         05tV5XaKnGWSIfE4dzW0GCF8y9ZhKJfJuo1uIrTkknhN6vNm+ZIoLH/02T8jTluHEkYc
         zTpdg3awILjehUXSfo+3gWSoykHCs+U6/5ATbNkcCgjBCjsic3Ed2n/u4iSeBeCf7eAD
         YX1OaSCzEV61x1rv8cgUe7OUTiJCvpNLlSNvmb2JfLPhhsHplUfae+PdiVGJQ/tGSa3r
         9UKz8T8L5hNu/qgwL+U/QWG1QcAtSNuErYbbmmAH8FSE9FfDlROH4WOxARa9zA7nAW+Z
         m+sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760958701; x=1761563501;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ET/WdgCX7blN4pSkYOyw5+NcHdAYpJFzGJ0hMhYQ6fk=;
        b=Gk319TlRhL9975pD0d7NkWmua2ducm/ugVTFi9Ll4j6JjAzEcO6FEfS/AlaXAa51AQ
         LEFTVDVigVrrCzxqIwN+OpWFrlfZ0qfcHp+DlP93L9wH6Ki8ut3yD51QyZDfDLbIEuhl
         K7N2zXM+CRjcXfhS34jBbYspLEZuLBDuWvkQKKzBKRyiAe/orvyqnJV3Qqge9nPj1WEP
         0tFYQFIMNC2vUCkSKuZWPYtMq0nFnPpCuHqIDnEsrn4Ackw0rROUfty2uwhvhoR+DxmS
         wVIMxkhUTnmCGQf7xU/0ADo0eQwXGQbCHCoGQjLvhh1KUIU1ozpNCA6sOS23mQJo9VHX
         YDtg==
X-Forwarded-Encrypted: i=1; AJvYcCU39NvqYb1Pc1deyKNsiRxcfpxxrQcAoObe2UVnwN29iL0ZuzMTSyv7yDuI5h7tl9RMJRb8cksSqqiG2WRSzGHU@lists.infradead.org
X-Gm-Message-State: AOJu0YyBdwb9HyR+svUkGNyAskfAoD8cpcZHcwlN3gHzz/0antRHThMW
	nfWiD82vbEfE0WGuaHwVhoqH1abPcEhyWmppUbTMGt3sEUVHAR+xi5HY
X-Gm-Gg: ASbGncuGgD5InQIMeDUFsSWXB1bbMnnu6t/sw51zlUdCaFrT+RauDV4Iwy0ezrA3iG+
	rOCLuMIWoIw+kGXm5MuP08Onb7DvzBRdkNcOwmRdUk1rflvWl3wT7o6hq/Wy0+HusGuM/x1QvEF
	QEumNqNxfRcO2VeUYA/+Q2kRQ00BiWIaBTQF9cSO/z7bVcP2ET6KpGZkUGA9e85TvDfmx/a2G6n
	1rWNjjYLWCxxPS2Tu5qUE4txE1DvOHgag/Cz16tY5pgmOdTBndkvvKrkpHNFaTg55WuvUpodiOH
	1Lw+EOxSdYjHfRhXF/yfxzxTn7zSVr6Kd7gNt4/IlvowAaqAD8hLR0l0+gXKrtOqjVqtw4SLy+Q
	S+3PuI2dJK7mkd3i6Ip2X5ly8rlmBSL/3SKBPiqgzmjf2LsLZScytwwSdNEiZjCS81TJYabvaq1
	oBj0KhLLVt/iLhX5QiOHGpGxxMV4zQhINQj0R0XWzTfGs=
X-Google-Smtp-Source: AGHT+IGsJGvpzKiDD8jBDErgrAbR7/9scZteiyrQ3aNod93FKhU/9cKG3+ipZMkoOjySRQFgqGSHww==
X-Received: by 2002:a05:6000:2389:b0:427:151:3db6 with SMTP id ffacd0b85a97d-42704d8e226mr8837205f8f.24.1760958701102;
        Mon, 20 Oct 2025 04:11:41 -0700 (PDT)
Received: from Ansuel-XPS24 (93-34-92-177.ip49.fastwebnet.it. [93.34.92.177])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4283e7804f4sm12692219f8f.10.2025.10.20.04.11.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 04:11:40 -0700 (PDT)
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
	Russell King <linux@armlinux.org.uk>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	linux-pci@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org,
	upstream@airoha.com
Subject: [PATCH v6 2/5] dt-bindings: PCI: mediatek: Add support for Airoha AN7583
Date: Mon, 20 Oct 2025 13:11:06 +0200
Message-ID: <20251020111121.31779-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251020111121.31779-1-ansuelsmth@gmail.com>
References: <20251020111121.31779-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_041143_436184_81F13E7A 
X-CRM114-Status: GOOD (  14.88  )
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
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/pci/mediatek-pcie.yaml           | 120 ++++++++++++++++++
 1 file changed, 120 insertions(+)

diff --git a/Documentation/devicetree/bindings/pci/mediatek-pcie.yaml b/Documentation/devicetree/bindings/pci/mediatek-pcie.yaml
index fca6cb20d18b..0b8c78ec4f91 100644
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
@@ -40,6 +41,12 @@ properties:
       - enum: [ obff_ck0, obff_ck1 ]
       - enum: [ pipe_ck0, pipe_ck1 ]
 
+  resets:
+    maxItems: 1
+
+  reset-names:
+    const: pcie-rst1
+
   interrupts:
     maxItems: 1
 
@@ -55,6 +62,17 @@ properties:
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
 
@@ -90,6 +108,33 @@ required:
 allOf:
   - $ref: /schemas/pci/pci-host-bridge.yaml#
 
+  - if:
+      properties:
+        compatible:
+          const: airoha,an7583-pcie
+    then:
+      properties:
+        reg-names:
+          const: port1
+
+        clocks:
+          maxItems: 1
+
+        clock-names:
+          const: sys_ck1
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
@@ -104,8 +149,14 @@ allOf:
           minItems: 2
           maxItems: 2
 
+        reset: false
+
+        reset-names: false
+
         power-domains: false
 
+        mediatek,pbus-csr: false
+
       required:
         - phys
         - phy-names
@@ -119,10 +170,16 @@ allOf:
         clocks:
           minItems: 6
 
+        reset: false
+
+        reset-names: false
+
         phys: false
 
         phy-names: false
 
+        mediatek,pbus-csr: false
+
       required:
         - power-domains
 
@@ -135,6 +192,12 @@ allOf:
         clocks:
           minItems: 6
 
+        reset: false
+
+        reset-names: false
+
+        mediatek,pbus-csr: false
+
       required:
         - power-domains
 
@@ -151,12 +214,18 @@ allOf:
         clock-names:
           maxItems: 1
 
+        reset: false
+
+        reset-names: false
+
         phys: false
 
         phy-names: false
 
         power-domain: false
 
+        mediatek,pbus-csr: false
+
 unevaluatedProperties: false
 
 examples:
@@ -316,3 +385,54 @@ examples:
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


