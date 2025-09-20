Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6508CCAC597
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 20 Sep 2025 11:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hlte/xdFQ20rDApChCw7zZxPwoZLjNm49RujG5Uk/QU=; b=yg9OLZiQWQOyALbSehT4/MNetm
	DubxBL8qMzf+d8m3x8TxarOsvr000vrZ1eV4SCOTRMWEVy1uYw27A5ZWEz9Vn2nGCfNhAFfX2U0cU
	teN6jXbY1rPifRT5rC7Rb3QzI9j9yJP6MHegaF+tO2yj1WGF/5+1rL8UpnRxXjYhWgyybycOle48J
	buybt80yo0xnC0jPVzg6cB0fGWVw6ArgXREb4a0Xwab8UHlG/+u9O/wWA+mLwWncWsFZRIu6RIA1F
	sSCZrni+9j/JvC2NYmF5ErfI7bbz14hIk9NSLnQtWrJjU80ztDxFp3HIVTUN+d5cGXYPhpn2n+pJC
	uAguscYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzvxu-00000005GAr-4Bzp;
	Sat, 20 Sep 2025 11:41:19 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzvxs-00000005G9C-3TgH
	for linux-arm-kernel@lists.infradead.org;
	Sat, 20 Sep 2025 11:41:18 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-45f2313dd86so25392285e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 20 Sep 2025 04:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758368475; x=1758973275; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hlte/xdFQ20rDApChCw7zZxPwoZLjNm49RujG5Uk/QU=;
        b=PcI6ZC8k7vFzEVOgaR9u79yePgnFU4tgu9+ordFsil/Ctl0ZhGYPg7JfDTGR7wZ3u8
         Hk+o6dA7rWt2C7JWg22U/Ho5f83JadEOOtuaLAmYrpWHiFEiSUTlfwlR4zPemkKg5ArA
         tJ99DRnO+TH/AE7sjtfTi4gPNFIN2pgxc5vIjZsMOJFpgsOXX+diFTKmVT1QPPWqDM2A
         ZtHhAg0Oqf4nRhflaHSfCxsFXqbvj7xIO5329JmYp5kuYxZeSpTCKcG8xbaAXk/wv4vM
         9LVwEUxEPuMDzMN00QAFHrWcng86lPPtOBrCrbn0SYkUjWk01kjuljdqH72AiUWFEVLL
         aVpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758368475; x=1758973275;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hlte/xdFQ20rDApChCw7zZxPwoZLjNm49RujG5Uk/QU=;
        b=JcwM6t6DWBmZTbCINT3ETr21q3zMPTZJeyxdKUhvLFmRSwfpI/kndjrGvYFY2LWvvL
         PKMT+7oQRUoO61EZE8YM3A7s/rUrdcTvPYxqdHVzPkqNuZ9pxHRdXICZW+Ka2oM1IvOT
         DTQTfZEZfhflmNdW4kH9dAzmVjT3jGwI+8eQW8Z7FZS2E8B1rIxY1mhb3xCejg9IzHBc
         uOaY1+Dysjw9/JVelOKeH0HvKpg1VvcvLFMInntxc/OfNAfIWRuBTsXwRpm6msCsfaJ6
         105cQs0EqZE29U9x6qb2xJDLNzz4KRbXYXiaLCSx8uBXTjAuNHnodZodZ9i5sOKlCo3u
         SJHQ==
X-Forwarded-Encrypted: i=1; AJvYcCVCcV+fEeAsXvleUJ/eOZCj+JMgIcCzW5bRkKA+tuLf5Q3JokwKi+s1NGqT6UY6nRaQ7VMqvNUptwkRaMzw4X17@lists.infradead.org
X-Gm-Message-State: AOJu0YzxL5Z1Liaj5qiek1/P0xgJihI1LJseW+fHFkreqo73g7KB22aq
	uxmKceEs8QTjkgvGdBecFztvule0k6IyoKqK4i+WY5q3AwfRarC/q4bk
X-Gm-Gg: ASbGncsDCp6C6DP0Dv5rnT1eLWz1cNonFOLu7o7f9CkhwvDsY5Cuajc+pgA9rjkfUJD
	tLMZYG08etxD4QEGpANyXIszgPVlj4QAfjneeOv2JCfu9gMCRbZAWhUQ5aiKg/yWg9xY/1sbkQS
	ebqJwsaLqDDuBXnZpkIuTgZydKNpJwDPdJb3O3thTnPzSgN9zBJMBa8V3J7NYFaQLqJ13Ce0lPY
	AHtF10ZUEJJnIZvJ3QYu5iBGSS27Ibe0KitzwG9WCpCc88tlVXZmB9FDn74C1aj9uASmiL9QwIt
	Yad7xmJqIGx4ZlejyNWH0FS3MVQJgjbndw16oHz3g5AxKUBQ7ozniY8q7GRcB4XRPGMlROKsY23
	gJl/IYf5pU33CdFjdUbT8Dxkz8Gsu2gh5szY+fmz+oe+cLmPmpf6Rxd2n2cYMNJi3m4Sgi5c=
X-Google-Smtp-Source: AGHT+IH5kAD2sV8JqATkM/kJOCATJRBHmfxFLBLVdZOvAKJbVuLOXp5+JmIJiclyzZmzO6hm9RRH8w==
X-Received: by 2002:a05:600c:c162:b0:45d:e110:e673 with SMTP id 5b1f17b1804b1-467e63be4d0mr58650795e9.4.1758368474689;
        Sat, 20 Sep 2025 04:41:14 -0700 (PDT)
Received: from Ansuel-XPS24 (host-95-249-236-54.retail.telecomitalia.it. [95.249.236.54])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4613e754140sm161724365e9.21.2025.09.20.04.41.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Sep 2025 04:41:14 -0700 (PDT)
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
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/2] dt-bindings: PCI: mediatek: Add support for Airoha AN7583
Date: Sat, 20 Sep 2025 13:41:02 +0200
Message-ID: <20250920114103.16964-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250920114103.16964-1-ansuelsmth@gmail.com>
References: <20250920114103.16964-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250920_044116_906646_24A9DA46 
X-CRM114-Status: GOOD (  14.16  )
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
 .../bindings/pci/mediatek-pcie.yaml           | 113 ++++++++++++++++++
 1 file changed, 113 insertions(+)

diff --git a/Documentation/devicetree/bindings/pci/mediatek-pcie.yaml b/Documentation/devicetree/bindings/pci/mediatek-pcie.yaml
index f6c391c4add2..77fd4907b134 100644
--- a/Documentation/devicetree/bindings/pci/mediatek-pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/mediatek-pcie.yaml
@@ -20,6 +20,7 @@ properties:
       - items:
           - const: airoha,en7523-pcie
           - const: mediatek,mt7622-pcie
+      - const: airoha,an7583-pcie
 
   reg:
     minItems: 1
@@ -62,6 +63,17 @@ properties:
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
 
@@ -146,6 +158,8 @@ allOf:
             - const: pcie-phy1
             - const: pcie-phy2
 
+        mediatek,pbus-csr: false
+
       required:
         - resets
         - reset-names
@@ -186,6 +200,8 @@ allOf:
           items:
             - enum: [ pcie-phy0, pcie-phy1 ]
 
+        mediatek,pbus-csr: false
+
       required:
         - interrupts
         - interrupt-names
@@ -228,6 +244,8 @@ allOf:
 
         phy-names: false
 
+        mediatek,pbus-csr: false
+
       required:
         - interrupts
         - interrupt-names
@@ -271,6 +289,8 @@ allOf:
           items:
             - enum: [ pcie-phy0, pcie-phy1 ]
 
+        mediatek,pbus-csr: false
+
       required:
         - interrupts
         - interrupt-names
@@ -308,10 +328,50 @@ allOf:
 
         power-domain: false
 
+        mediatek,pbus-csr: false
+
+      required:
+        - interrupts
+        - interrupt-names
+        - interrupt-controller
+
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
       required:
         - interrupts
         - interrupt-names
         - interrupt-controller
+        - mediatek,pbus-csr
 
 unevaluatedProperties: false
 
@@ -562,3 +622,56 @@ examples:
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
+            status = "disabled";
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


