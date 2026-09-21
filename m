Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7732AC982ED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 23:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Z4j95iorbULZW94KfX9vH9S7sD5hTc6RHIL3XgcCWVU=; b=BtWLwXXIC3H2ts1OVt3JUZcbvN
	Nk95y1Nrcidut/BazO209WtDgcV/Ym0rORrKDi68ZuBVjDliNXzXmS7wP7RvBmPftETeT22ZlZBDP
	t+mVcu7Xzj2PW3MoPog1CHFB8gh63zKSbdjFyzQTXpP/tzzXxsxs4tRZ82By1L6fy1QDt73nERV0C
	b3z9+Uqxqpz3DQlIViopGUCfYxc+5+RDpqunNM9sIUrUeenheatlkjTCI6jz7Y4yivLGzJyGYF74J
	wrIUqoRp6XPDzLHNi3YxTqIhblMGNmlnPd8J2F0oECCX15RBprMF048pbsGgJvuLEGJnoMq3iW1p+
	xR/+GvxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8nQ2-00000003faL-0sBu;
	Mon, 21 Sep 2026 23:27:30 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8nQ1-00000003fZx-0diI;
	Mon, 21 Sep 2026 23:27:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9428760235;
	Mon, 21 Sep 2026 23:27:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 161AF1F000FF;
	Mon, 21 Sep 2026 23:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790033248;
	bh=Z4j95iorbULZW94KfX9vH9S7sD5hTc6RHIL3XgcCWVU=;
	h=From:To:Cc:Subject:Date;
	b=LXcAx7dk9Cvfcmws4NMjLKDSkYUgwfCaLkhBMMPXb2fgDdLs1WjcJXvmmTkd4TlDr
	 +jiXPfKkSL8P7ZnXZoXuqkRlysBOGRbAylJS/0jqRL9L5E2HyWz38k73nf3jdOFxrT
	 FPxeeXd1rdv/QPDf14WiwPbQ/elhYZE3XzJ6sxzLi3Q0S6rt162Zwm2LpV4b8PnmvG
	 Js6ejO/r5xOMdgqqlEaxyBRsr18Izr2qnlN4o6/pLFkBmr5f6FH6hVaGXfItrkxSu9
	 /o/f2aUB6/1Pzy86sXPO+lWGOmJH9ne1fmiTEhLlgC7gN6XPXHFqTeER73epYSNGgq
	 iCQCmJS4raLOA==
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
Subject: [PATCH] dt-bindings: iommu: Describe MT8195 infra IRQs
Date: Mon, 21 Sep 2026 18:27:15 -0500
Message-ID: <20260921232716.3134140-1-robh@kernel.org>
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

The MT8195 infra IOMMU has one fault interrupt per IOMMU bank. Require
the five bank interrupts, named bank0 through bank4, for this
compatible. Keep other MediaTek IOMMUs limited to one unnamed interrupt.

Assisted-by: LLM
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/iommu/mediatek,iommu.yaml        | 30 ++++++++++++++++++-
 arch/arm64/boot/dts/mediatek/mt8195.dtsi      |  2 ++
 2 files changed, 31 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml b/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
index 79c573c47b08..4dc5621c17e1 100644
--- a/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
+++ b/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
@@ -100,7 +100,11 @@ properties:
     maxItems: 1
 
   interrupts:
-    maxItems: 1
+    minItems: 1
+    maxItems: 5
+
+  interrupt-names:
+    description: Names of IOMMU banks providing fault interrupts.
 
   clocks:
     items:
@@ -155,6 +159,30 @@ required:
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
+        interrupt-names:
+          items:
+            - const: bank0
+            - const: bank1
+            - const: bank2
+            - const: bank3
+            - const: bank4
+      required:
+        - interrupt-names
+    else:
+      properties:
+        interrupts:
+          maxItems: 1
+        interrupt-names: false
+
   - if:
       properties:
         compatible:
diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
index 9aaf8b6edcb5..3e46ffaa44c6 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -937,6 +937,8 @@ iommu_infra: infra-iommu@10315000 {
 				     <GIC_SPI 797 IRQ_TYPE_LEVEL_HIGH 0>,
 				     <GIC_SPI 798 IRQ_TYPE_LEVEL_HIGH 0>,
 				     <GIC_SPI 799 IRQ_TYPE_LEVEL_HIGH 0>;
+			interrupt-names = "bank0", "bank1", "bank2", "bank3",
+					  "bank4";
 			#iommu-cells = <1>;
 		};
 
-- 
2.53.0


