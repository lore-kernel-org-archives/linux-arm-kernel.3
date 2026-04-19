Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACF40EA7199
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Apr 2026 12:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Z/8NIvZlTGiWipL6I5dpvry4E6iD24clZSY8YAOcXr0=; b=tDaFW9pXZpoSBhcFFDA9La7rya
	aWStVpwt6tMmqqHhFuCgLKHHBeuWOJLQuzIuSJdps9tdguzss3Ea8xC7TYFSrLaPuOqBol1lDfCOM
	psvzJbyQtq6+uMgUUiHkr7bO1yktGLg7zAP6ya2RNUMQJ2dRWH4tR2eNGGsz0KHDARD8ZkuMIgQsy
	NVnXZfI2ZMHj2xMuq2PTYg5lC2bEddqcsFm9tzWu6Ag+2Qo0DOw/Pg8ffzSBjoRmJO8IuQXjlXRcV
	A1WikMqhk9oApCiPeeoHNot5paXVPaesaIETfwb+DM233Wk21H0VVIjwTZ5KTdUQ5x3illAT++JF7
	MnNjI+SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEQu1-00000005lR7-1soE;
	Sun, 19 Apr 2026 12:05:29 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEQty-00000005lPi-00gL;
	Sun, 19 Apr 2026 12:05:27 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.99)
	(envelope-from <daniel@makrotopia.org>)
	id 1wEQte-000000006Ha-26VQ;
	Sun, 19 Apr 2026 12:05:06 +0000
Date: Sun, 19 Apr 2026 13:05:01 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Olivia Mackall <olivia@selenic.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Daniel Golle <daniel@makrotopia.org>, linux-crypto@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v3 1/2] dt-bindings: rng: mtk-rng: add SMC-based TRNG variants
Message-ID: <585fc832e4e5d3656bd25ecee6bafb636993104a.1776600269.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260419_050526_051497_1E779646 
X-CRM114-Status: GOOD (  11.41  )
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

Add compatible strings for MediaTek SoCs where the hardware random number
generator is accessed via a vendor-defined Secure Monitor Call (SMC)
rather than direct MMIO register access:

  - mediatek,mt7981-rng
  - mediatek,mt7987-rng
  - mediatek,mt7988-rng

These variants require no reg, clocks, or clock-names properties since
the RNG hardware is managed by ARM Trusted Firmware-A.

Relax the $nodename pattern to also allow 'rng' in addition to the
existing 'rng@...' pattern.

Add a second example showing the minimal SMC variant binding.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
v3:
 * drop not: in compatible conditional
 * add reg/clocks/clock-names: false for mt7981-rng
 * add else: requiring reg/clocks/clock-names for others

v2: express compatibilities with fallback

 .../devicetree/bindings/rng/mtk-rng.yaml      | 32 ++++++++++++++++---
 1 file changed, 28 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/rng/mtk-rng.yaml b/Documentation/devicetree/bindings/rng/mtk-rng.yaml
index 7e8dc62e5d3a6..8fe6c209ab1e5 100644
--- a/Documentation/devicetree/bindings/rng/mtk-rng.yaml
+++ b/Documentation/devicetree/bindings/rng/mtk-rng.yaml
@@ -11,12 +11,13 @@ maintainers:
 
 properties:
   $nodename:
-    pattern: "^rng@[0-9a-f]+$"
+    pattern: "^rng(@[0-9a-f]+)?$"
 
   compatible:
     oneOf:
       - enum:
           - mediatek,mt7623-rng
+          - mediatek,mt7981-rng
       - items:
           - enum:
               - mediatek,mt7622-rng
@@ -25,6 +26,11 @@ properties:
               - mediatek,mt8365-rng
               - mediatek,mt8516-rng
           - const: mediatek,mt7623-rng
+      - items:
+          - enum:
+              - mediatek,mt7987-rng
+              - mediatek,mt7988-rng
+          - const: mediatek,mt7981-rng
 
   reg:
     maxItems: 1
@@ -38,9 +44,23 @@ properties:
 
 required:
   - compatible
-  - reg
-  - clocks
-  - clock-names
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: mediatek,mt7981-rng
+    then:
+      properties:
+        reg: false
+        clocks: false
+        clock-names: false
+    else:
+      required:
+        - reg
+        - clocks
+        - clock-names
 
 additionalProperties: false
 
@@ -53,3 +73,7 @@ examples:
             clocks = <&infracfg CLK_INFRA_TRNG>;
             clock-names = "rng";
     };
+  - |
+    rng {
+            compatible = "mediatek,mt7981-rng";
+    };
-- 
2.53.0

