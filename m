Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2EECCCD192
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 15:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rEepjpoQHsg1UgdPFotNZVd0m8loLoC8YXtD9n1Hdes=; b=Zv47Ok94TnlRKDLqQTv5DsuRWI
	iTcota0byXytDtgj7dsI0h+esu9hm/nT+nIToCAQGNSIbQARSR056sL2LUXIvCKXhIokbPcZeV5Tx
	DivkoiwJXfdYG3qcJebk69EatN5HykYf3XGdZr5JJn7fvWApTeqeqmx5B9vT/3M4SA+wy28tfKFFQ
	+1rpQ4KlL/FxD1nT1/nFOBV9uB5JDnB2xcszUuJkYGC3AAdkdN22Omt5A3Zn3q6HdzxhTeFV3tn+/
	sUIcv9xl4g4p4xt9LxKp0fegRT2S2JdZBzqH33ENl/56uDDI9Df6H8br8IEJw5KXrjFljlvkatEgh
	k39kM0OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8gfo-0000000GlIX-2CI8;
	Tue, 14 Oct 2025 15:10:48 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8gfj-0000000GlG7-3E5G;
	Tue, 14 Oct 2025 15:10:45 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1760454628; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=nLN6ADu8nqiOQ2MThJFvzdjYEYgskAVqgDSLkFK3jHJvD2uFb5t8UzfG1qVS3P0l76aNj1FnI6rIP1EtS60XLrlIU6cJeRBUzYRg43OZVGJGmLVl3ZzDmVHRebOMdzR4FgQ5BO3ae3yE1z52BVLlR6dzMx7YqLH5qlvkiWvW8RI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1760454628; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=rEepjpoQHsg1UgdPFotNZVd0m8loLoC8YXtD9n1Hdes=; 
	b=mCUz9X8K/deAwwgetutsjw3tg3344u6RuPdiumDdUWBEnC5qVLQTOWjYrsNOWexkH7cihKUhNkPV0ovMvPRguMVCkeokYf+iD0zXq10jPctqQjZzgSEPNYG/vRsP/EBxKpEWNT5Im1wIunEbtz35Sv45CYBsY6d8dU6sgh6Ne/A=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1760454628;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=rEepjpoQHsg1UgdPFotNZVd0m8loLoC8YXtD9n1Hdes=;
	b=L5hwE4P9r77pCUiLinc7iXSGRLbgqmsp4/X7do6pJDcjRDQ2288roi4W4iDAq9Ac
	ObW4r3mngAzhkugIqfy0LQi1mmEvNtDD8+0dev61WmwoXWZ38+bMAbHykve2/CGmi2j
	IGflJxGr26WmW5MiUcfZfYdFuzhbOP24vYq8uHWs=
Received: by mx.zohomail.com with SMTPS id 1760454626724250.19910245942265;
	Tue, 14 Oct 2025 08:10:26 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Tue, 14 Oct 2025 17:10:05 +0200
Subject: [PATCH 1/5] dt-bindings: ufs: mediatek,ufs: Add mt8196-ufshci
 variant
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251014-mt8196-ufs-v1-1-195dceb83bc8@collabora.com>
References: <20251014-mt8196-ufs-v1-0-195dceb83bc8@collabora.com>
In-Reply-To: <20251014-mt8196-ufs-v1-0-195dceb83bc8@collabora.com>
To: Alim Akhtar <alim.akhtar@samsung.com>, 
 Avri Altman <avri.altman@wdc.com>, Bart Van Assche <bvanassche@acm.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Stanley Chu <stanley.chu@mediatek.com>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Peter Wang <peter.wang@mediatek.com>, Stanley Jhu <chu.stanley@gmail.com>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, 
 kernel@collabora.com, linux-scsi@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-phy@lists.infradead.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_081043_920546_44F34B02 
X-CRM114-Status: GOOD (  10.40  )
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

The MediaTek MT8196 SoC contains the same UFS host controller interface
hardware as the MT8195 SoC. Add it as a variant of MT8195, and extend
its list of allowed clocks, as well as give it the previously absent
resets property.

Also add examples for both MT8195 and the new MT8196, so that the
binding can be verified against examples for these two variants.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 .../devicetree/bindings/ufs/mediatek,ufs.yaml      | 134 +++++++++++++++++++--
 1 file changed, 123 insertions(+), 11 deletions(-)

diff --git a/Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml b/Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml
index 1dec54fb00f3..070ae0982591 100644
--- a/Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml
+++ b/Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml
@@ -11,18 +11,30 @@ maintainers:
 
 properties:
   compatible:
-    enum:
-      - mediatek,mt8183-ufshci
-      - mediatek,mt8192-ufshci
-      - mediatek,mt8195-ufshci
+    oneOf:
+      - enum:
+          - mediatek,mt8183-ufshci
+          - mediatek,mt8195-ufshci
+      - items:
+          - enum:
+              - mediatek,mt8192-ufshci
+          - const: mediatek,mt8183-ufshci
+      - items:
+          - enum:
+              - mediatek,mt8196-ufshci
+          - const: mediatek,mt8195-ufshci
 
   clocks:
     minItems: 1
-    maxItems: 8
+    maxItems: 16
 
   clock-names:
     minItems: 1
-    maxItems: 8
+    maxItems: 16
+
+  freq-table-hz: true
+
+  interrupts: true
 
   phys:
     maxItems: 1
@@ -30,7 +42,15 @@ properties:
   reg:
     maxItems: 1
 
+  resets:
+    maxItems: 3
+
+  reset-names:
+    maxItems: 3
+
   vcc-supply: true
+  vccq-supply: true
+  vccq2-supply: true
 
   mediatek,ufs-disable-mcq:
     $ref: /schemas/types.yaml#/definitions/flag
@@ -44,22 +64,19 @@ required:
   - reg
   - vcc-supply
 
-unevaluatedProperties: false
-
 allOf:
   - $ref: ufs-common.yaml
-
   - if:
       properties:
         compatible:
           contains:
-            enum:
-              - mediatek,mt8195-ufshci
+            const: mediatek,mt8195-ufshci
     then:
       properties:
         clocks:
           minItems: 8
         clock-names:
+          minItems: 8
           items:
             - const: ufs
             - const: ufs_aes
@@ -69,6 +86,19 @@ allOf:
             - const: unipro_mp_bclk
             - const: ufs_tx_symbol
             - const: ufs_mem_sub
+            - const: crypt_mux
+            - const: crypt_lp
+            - const: crypt_perf
+            - const: ufs_sel
+            - const: ufs_sel_min_src
+            - const: ufs_sel_max_src
+            - const: ufs_rx_symbol0
+            - const: ufs_rx_symbol1
+        reset-names:
+          items:
+            - const: unipro_rst
+            - const: crypto_rst
+            - const: hci_rst
     else:
       properties:
         clocks:
@@ -76,6 +106,10 @@ allOf:
         clock-names:
           items:
             - const: ufs
+        resets: false
+        reset-names: false
+
+unevaluatedProperties: false
 
 examples:
   - |
@@ -99,3 +133,81 @@ examples:
             vcc-supply = <&mt_pmic_vemc_ldo_reg>;
         };
     };
+  - |
+    ufshci@11270000 {
+        compatible = "mediatek,mt8195-ufshci";
+        reg = <0x11270000 0x2300>;
+        interrupts = <GIC_SPI 137 IRQ_TYPE_LEVEL_HIGH>;
+        phys = <&ufsphy>;
+        clocks = <&infracfg_ao 63>, <&infracfg_ao 64>, <&infracfg_ao 65>,
+                 <&infracfg_ao 54>, <&infracfg_ao 55>,
+                 <&infracfg_ao 56>, <&infracfg_ao 90>,
+                 <&infracfg_ao 93>;
+        clock-names = "ufs", "ufs_aes", "ufs_tick",
+                      "unipro_sysclk", "unipro_tick",
+                      "unipro_mp_bclk", "ufs_tx_symbol",
+                      "ufs_mem_sub";
+        freq-table-hz = <0 0>, <0 0>, <0 0>,
+                        <0 0>, <0 0>, <0 0>,
+                        <0 0>, <0 0>;
+        vcc-supply = <&mt6359_vemc_1_ldo_reg>;
+        mediatek,ufs-disable-mcq;
+    };
+  - |
+    #include <dt-bindings/reset/mediatek,mt8196-resets.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    ufshci@16810000 {
+        compatible = "mediatek,mt8196-ufshci", "mediatek,mt8195-ufshci";
+        reg = <0x16810000 0x2a00>;
+        interrupts = <GIC_SPI 320 IRQ_TYPE_LEVEL_HIGH>;
+
+        clocks = <&ufs_ao_clk 6>,
+                 <&ufs_ao_clk 7>,
+                 <&clk26m>,
+                 <&ufs_ao_clk 3>,
+                 <&clk26m>,
+                 <&ufs_ao_clk 4>,
+                 <&ufs_ao_clk 0>,
+                 <&topckgen 7>,
+                 <&topckgen 41>,
+                 <&topckgen 105>,
+                 <&topckgen 83>,
+                 <&topckgen 42>,
+                 <&topckgen 84>,
+                 <&topckgen 102>,
+                 <&ufs_ao_clk 1>,
+                 <&ufs_ao_clk 2>;
+        clock-names = "ufs",
+                      "ufs_aes",
+                      "ufs_tick",
+                      "unipro_sysclk",
+                      "unipro_tick",
+                      "unipro_mp_bclk",
+                      "ufs_tx_symbol",
+                      "ufs_mem_sub",
+                      "crypt_mux",
+                      "crypt_lp",
+                      "crypt_perf",
+                      "ufs_sel",
+                      "ufs_sel_min_src",
+                      "ufs_sel_max_src",
+                      "ufs_rx_symbol0",
+                      "ufs_rx_symbol1";
+
+        freq-table-hz = <273000000 499200000>, <0 0>, <0 0>, <0 0>, <0 0>,
+                        <0 0>, <0 0>, <0 0>, <0 0>, <0 0>, <0 0>, <0 0>, <0 0>,
+                        <0 0>;
+
+        phys = <&ufsphy>;
+
+        vcc-supply = <&mt6363_vemc>;
+        vccq-supply = <&mt6363_vufs12>;
+        vccq2-supply = <&mt6363_vufs18>;
+
+        resets = <&ufs_ao_clk MT8196_UFSAO_RST1_UFS_UNIPRO>,
+                 <&ufs_ao_clk MT8196_UFSAO_RST1_UFS_CRYPTO>,
+                 <&ufs_ao_clk MT8196_UFSAO_RST1_UFSHCI>;
+        reset-names = "unipro_rst", "crypto_rst", "hci_rst";
+        mediatek,ufs-disable-mcq;
+    };

-- 
2.51.0


