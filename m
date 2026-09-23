Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFD0DC9830B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 19:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LfzNAPun3QfgyrfQ0AalSAcIX1q+GxGMokSjC8c+Aro=; b=WdxMLnUAaYvl4vhV6ANiDdF8nE
	Npab3EjL/Baxzg/kz+H3z3UoZf27LO/HB6Mx9mXWGMrhOuLWBEg3JIYdmr/wQIFSB/zIMjmxH46l3
	zlpk1/5JPi8pBuI9zrp/X2AkKO8NmRmvh+n1M3vSfyiLOEraahUKxklf4HrXTevZFTMzo8XySws3j
	Pt2rKvnbW2KUDMXGiQbcUYX4dVH7EXVAORE1f0Xasdbjf1UILF9Og2Yr/t/vnTt0iVwhKTqZUt8G7
	/QVX0stJUM3UOv+1QCqRnWBpszgIRh/QAN2G3NOWqV27lqE4lKD6zXbXiecC5A8OTCNj9D55cSFGV
	0zhIHwFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9SRd-00000009JG9-44ex;
	Wed, 23 Sep 2026 19:15:54 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9SRc-00000009JFZ-2ULh;
	Wed, 23 Sep 2026 19:15:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A537C600AA;
	Wed, 23 Sep 2026 19:15:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 263A31F000FF;
	Wed, 23 Sep 2026 19:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790190951;
	bh=LfzNAPun3QfgyrfQ0AalSAcIX1q+GxGMokSjC8c+Aro=;
	h=From:To:Cc:Subject:Date;
	b=fVP6HfkLAXWcUzphziNJN7eEDSmmN69m2vrUKsHXa4E+6z+rHChjym6bn4gNl7D1/
	 ThA2pXoKKCFYGWh+DsbbkuvhqG9CYGRLI6qE5xWT/iHb8KXGo9MdvX/o3bxXEj064P
	 zOP8qBxiE6aNIcPi5/nhASftTMm1aCUGu/AXujrrvysdbvuTzF12X8OHdViIlwWitl
	 luwRBeaOlFdtQ/lO7kiMqNYG7NrvEXlf6nJtsUN2FZekVdBeB0n8dUUWgYOX3QxQx+
	 061xOF2nqX3gjGrtgcXC/beEQRpIAIMEu9Ve3DHPeRkimnp+uNVBUicEJhf6YjDp7J
	 C9Wt1+34wfC5g==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Yong Wu <yong.wu@mediatek.com>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: iommu@lists.linux.dev,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2] dt-bindings: iommu: Describe MT8195 infra IRQs
Date: Wed, 23 Sep 2026 14:15:45 -0500
Message-ID: <20260923191546.2209201-1-robh@kernel.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The MT8195 infra IOMMU has one fault interrupt per IOMMU bank with 5 banks.
Keep other MediaTek IOMMUs limited to one unnamed interrupt.

Assisted-by: LLM
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
v2:
 - Drop unnecessary 'interrupt-names' addition
---
 .../bindings/iommu/mediatek,iommu.yaml         | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml b/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
index 79c573c47b08..cbda221a4fc5 100644
--- a/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
+++ b/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
@@ -100,7 +100,10 @@ properties:
     maxItems: 1
 
   interrupts:
-    maxItems: 1
+    minItems: 1
+    maxItems: 5
+    description:
+      A single interrupt or one interrupt per bank.
 
   clocks:
     items:
@@ -155,6 +158,19 @@ required:
   - '#iommu-cells'
 
 allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: mediatek,mt8195-iommu-infra
+    then:
+      properties:
+        interrupts:
+          minItems: 5
+    else:
+      properties:
+        interrupts:
+          maxItems: 1
   - if:
       properties:
         compatible:
-- 
2.53.0


