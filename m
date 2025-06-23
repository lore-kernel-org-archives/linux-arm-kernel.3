Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D7C2C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 14:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xoGBMUkehkadKd2ddTohckA44FNq1vnDtVhFyqn24wQ=; b=rN3HKR/5oGHPZL1VyptFLthrgI
	6ybiNJadeQoqZ90A/CvQpzhYdCD8QjwXEvY72KhImrOQNjbFme3lUzwXoLI90UoBsStYoRV6MV2XO
	cwvSy3oWlaC/clK17pBW1RG8SCb+sgIj/JgPi6ykhNsvJXWc+IllHMVwuyxhPq9xQJjn05FCKy9jW
	sxLgPkJnv2IUGO3qJ0YJ49cqt+wHBCuUUnR3lCkXUpgl7DKBlt0TqMzB2dXR6kNqPFIMn+g2bk4T7
	kmHhJWv+JnOPiWrtTV+UmX92iJQe7sgeb2yfUXpTObEpp8kW5y1i25I5q1WwVzmSnzJFCvLRTMMaP
	ea2LgZqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uThy5-000000030SK-1Txq;
	Mon, 23 Jun 2025 14:16:17 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTfrJ-00000002aqm-0407;
	Mon, 23 Jun 2025 12:01:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750680067;
	bh=4YZC1yBzz98fnTISzErlxhtsitEhMR41vg8eXDbdCg8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NrDeY5ZPfGNDNpFRaQXvk1zD2HO7zttavLLRmTDmu4irZfjDfBsspNPViZ/Z+PLd1
	 CK3Fr9jGeSoQCbTVIDeWlm+gft14jzIuxi6RIKhspkBCJ378fadHG0oYt1zRvro0qk
	 0CS4Y9LO9/z4NbBBW4jYWVx09CWSGg8ky/7Vp5k9rgqaFwOEZpzv9X8DG1Uz9eqYkt
	 jRGuTMPFBYxgoQ50HI5vFxluE1P6RAxIbJaBYwTNwJn2M7oFHC9iUoeVNp/P+FkYwS
	 64RjiXLwLvNwFJp23qzOu/Ejir2pVTjpo9HO7pzkgUq51Z/rLNsC/Nav4Pn/vFRyRG
	 3pIGLsu9/+XMQ==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A5C2517E10D5;
	Mon, 23 Jun 2025 14:01:06 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: jianjun.wang@mediatek.com
Cc: ryder.lee@mediatek.com,
	bhelgaas@google.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	manivannan.sadhasivam@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-pci@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v1 2/3] dt-bindings: PCI: mediatek-gen3: Add support for MT6991/MT8196
Date: Mon, 23 Jun 2025 14:00:57 +0200
Message-ID: <20250623120058.109036-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250623120058.109036-1-angelogioacchino.delregno@collabora.com>
References: <20250623120058.109036-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_050109_232523_44AB2FBF 
X-CRM114-Status: UNSURE (   7.99  )
X-CRM114-Notice: Please train this message.
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

Add compatible strings for MT8196 and MT6991 (which are fully
compatible between each other) and clock definitions.

These new SoCs don't have tl_96m and tl_32k clocks, but need
an AHB to APB bus clock and a low power clock.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../bindings/pci/mediatek-pcie-gen3.yaml      | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
index 162406e0691a..02cddf0246ce 100644
--- a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
+++ b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
@@ -52,7 +52,12 @@ properties:
               - mediatek,mt8188-pcie
               - mediatek,mt8195-pcie
           - const: mediatek,mt8192-pcie
+      - items:
+          - enum:
+              - mediatek,mt6991-pcie
+          - const: mediatek,mt8196-pcie
       - const: mediatek,mt8192-pcie
+      - const: mediatek,mt8196-pcie
       - const: airoha,en7581-pcie
 
   reg:
@@ -212,6 +217,36 @@ allOf:
 
         mediatek,pbus-csr: false
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - mediatek,mt8196-pcie
+    then:
+      properties:
+        clocks:
+          minItems: 6
+
+        clock-names:
+          items:
+            - const: pl_250m
+            - const: tl_26m
+            - const: bus
+            - const: low_power
+            - const: peri_26m
+            - const: peri_mem
+
+        resets:
+          minItems: 1
+          maxItems: 2
+
+        reset-names:
+          minItems: 1
+          maxItems: 2
+
+        mediatek,pbus-csr: false
+
   - if:
       properties:
         compatible:
-- 
2.49.0


