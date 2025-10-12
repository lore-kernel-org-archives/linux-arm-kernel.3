Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18776CCD18E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Oct 2025 20:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ALuuSU+7OMf38Yq7lgs2vGROJq6nvro7orSmMW4CmOM=; b=sHU3Wfz0TaReVEejrfrQu3mcB1
	tQ7ROmcSU6OVpqx7LLstbOm4sh0z96VeZUktzGq394OztwtPHQ1P52b37orz0q9r7POwFSUh+m//z
	qep9gRqotQMuFQ3IhYV93VCMeSbwCHJd86T8ZfimgA2tTAzOgZnMTjVLmYjoKEHP0qxBzh3R4NDlk
	eaY/X2dG4mWqE01FBcFhi64QmR29Fuks9goSJ5laq0ekss3HoT/VQAK5+M+rJybA6/cUA6Lxti7+U
	XRMbKl2MX4+hPh3VY3UjYOuzzhJ374cQK2zvcSgStJD8078FMxQCddTqDzNhtRsc1F7CkACFIEWaN
	l4NnZmOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v839w-0000000BlXD-3ft0;
	Sun, 12 Oct 2025 20:59:16 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v839t-0000000BlRg-2w0B
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Oct 2025 20:59:15 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-46e3cdc1a6aso25712855e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Oct 2025 13:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760302752; x=1760907552; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ALuuSU+7OMf38Yq7lgs2vGROJq6nvro7orSmMW4CmOM=;
        b=JgrVl8Sws1Viv3jJF+j7p9d5qHaQhfKY98SkBT3nN+E+6caX5ZiFq2AfjIaAme8O8N
         iS5lzGpXmjVMOvDXRIHAwGRbTON76BF4m16i3U4tt4KHHV+y8Io19s1TpCjBXY4/pevG
         QB7tWqvV2YPPBmg7xJqkwp6nwVWjMiL2dAtpepwx96dqW7bZXK1kYzNhN/lC0Bvm1DWM
         NlIKzIMtt4u7YdtotIQ5CiuiZXNubjLPueNE3z67W8Ic2wiOo85pjPXviU9ZcPj6tNt1
         OMkNEXipb6knfomFSQKoM3ebw0Zok7+tzUWigsbWtL2Zbp28edMUuBl0kpMlPZKh7ybd
         aznA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760302752; x=1760907552;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ALuuSU+7OMf38Yq7lgs2vGROJq6nvro7orSmMW4CmOM=;
        b=n8dvJw41pCM3Ia/hS+Wb/Q8UahQV0S66GwHpzjuA5HlDMP62aE7k6+9cCHqwKrvB1t
         vUI7xC1p/bjqo0Cb7Kbax8g5Db4IG71CeVCbF50prFxSfgYvBuwUMDx52PoX8tv/dx16
         /on74CE79XzNJiFwmU8NUTSsGGHw0FUC5G8uNXH1JrrbLnZ8CICU9+llY6d6F+R/QTM1
         rmxjkbcRedk+acQs6NwGLWa4p4jgZIbQLFYG6XC7n3ZhRY4JWQCD/OOgvKqZHDyfVvth
         4AUl82dxT/CiserCnDCx2NfEpnfL9NuQlw8u4Rt4IYB6ajhA3ZoWA1MuzDx22CXYJT36
         Gvjw==
X-Forwarded-Encrypted: i=1; AJvYcCVossJaPA1F/xYLBEmXhX2V9DFTHKGS2vXIa3w9ST1yqisnigPpQAxJ0NW9+ndtwMw77588JyHIcugKrW9KvueJ@lists.infradead.org
X-Gm-Message-State: AOJu0YyKVrXsMBQc2BY81Gbl887miyG/EnIB2ZYSOTqoBPQs+l8S7TwI
	LpMd/DgIrwWwJGaVE8OCFX4gbL6vYptFWeViytoi6pZbjkW3pYeYhQ8P
X-Gm-Gg: ASbGncu+1cceDaeqRqFz/uENaxWxG1C0UEQlqvzzPILXjSYxN9ToR0bM/Ea1FKG9sSQ
	h3Re1XQBSIlO5wOv6395eOgmFgijTQpvnXROEqg+cgZrPYHH0klG9xrZ3xmfaHB8soE85DCJ2Jr
	NHw9KIiAIV1cmQslF1ruwLD7JEhx7wLM7wY/4zvRVGNnBpqfxpjSXSGytNlicjS7Ir7JfZ1NEXu
	9h7XjTEq4CwPW27MOwn34lmymPFD7YIyaD51FBbfq8HvHNAqJEgFiqY+rFOpP2kMw1/H+7hnE3Z
	M+D/t9J7K7psiWMikbNY2QX6FnA0nWnGkLMxLTpmQ3WLP0mqOBrr71Ef75ONk5ooiU9csEYQctR
	gORwRCy1MRi8sjOXGI//kA3j1MhxHZuf8wb3gwQShpo9zmrS/5+xU1KT10guCh4WOYZvaTJJOll
	i4X992hSv4
X-Google-Smtp-Source: AGHT+IG/dpUbIS0g2Y3eod2I3EyF2R8BKbiMyTePG06XGuV1O4BBygByLPvF2RP+JjrNujG+8ex+nQ==
X-Received: by 2002:a7b:ca44:0:b0:46d:e5bd:2ba4 with SMTP id 5b1f17b1804b1-46fa29ffedemr100671465e9.18.1760302751667;
        Sun, 12 Oct 2025 13:59:11 -0700 (PDT)
Received: from Ansuel-XPS24 (93-34-92-177.ip49.fastwebnet.it. [93.34.92.177])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-46fb489197dsm156506505e9.10.2025.10.12.13.59.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 13:59:11 -0700 (PDT)
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
	linux-arm-kernel@lists.infradead.org,
	upstream@airoha.com
Subject: [PATCH v5 3/5] dt-bindings: PCI: mediatek: Add support for Airoha AN7583
Date: Sun, 12 Oct 2025 22:56:57 +0200
Message-ID: <20251012205900.5948-4-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251012205900.5948-1-ansuelsmth@gmail.com>
References: <20251012205900.5948-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251012_135913_810754_F3F6294B 
X-CRM114-Status: GOOD (  14.06  )
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


