Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97E7FC3ABDD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 08:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DrYAp8vKrf1b1Pjp4MlkO99qt0Ac/Y6jW8rueaA+/m4=; b=PfSWaKM9NJDDX48dhy+aQsiDnr
	Fw82xUhDnHpdOp3Ojdb+N6fpXMt06J4fFo5R30ngePk0PahfA08iqDmMQFUFWW5gi2o0+8Eo10rYj
	dg48hx/bI9P2kkaFhU7Jqv/jLIhfiOJ13ZzpmtdKrEr0AQRfWnv2luJGzOdy98EM+gfZttNbg0PiJ
	BeEmaFYRVeeb/GoDeLntE28JXhfdkh6+cd2dUBGzJdibyeGd3evK3AewkdHe/WHP3JOKMV0gkJ7bV
	dojgm6xaepcpgeJFLqZpp9VTJy8T1tWBQRTF4B4KgecHcViiSzD8zG5ehOt+18bhnkNKPLKgi1k74
	MehHJ/6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF7vJ-0000000EaZv-2omd;
	Wed, 14 May 2025 08:57:09 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF7LX-0000000ETiJ-0223;
	Wed, 14 May 2025 08:20:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1747210809;
	bh=9R7sv5oMll/MHroR0RXX+GKrqQL+VOwFRqNH0B+C/Do=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=nYrXrWSVQiyUbR2rX52wDp9qRN+t6YeVDUial7bDiqnR8rxZlIie/aAiAhtNtJz6e
	 ivD3qd0t/Ku5RhdwaGRnth+SBczrl0u64fwDFAZf1IjB+UR56bM/bDXLTB8Ncw3Kh3
	 WiinlpIyy2QojXihdIHpSxcQODAPdr/1p13DS6N/Kl+ol+Se7UbZCtvptIzYfrKmUc
	 jTs/ij8z1ObdQtvXSchOp2Mv0kdonQrmaRXF1GNdmvi4eUr/6O9PMfJCgBr1V3/ZWy
	 hkABQbUWmidyExM27gf3ABC+ZLCiCBiKx7qjW3uVQbjOiJx0C/s2YQlBK8BczkW/aR
	 F6H2bsluoa7fg==
Received: from apertis-1.home (2a01cb0892F2D600c8F85Cf092d4AF51.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:92f2:d600:c8f8:5cf0:92d4:af51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 589C317E07F2;
	Wed, 14 May 2025 10:20:08 +0200 (CEST)
From: Julien Massot <julien.massot@collabora.com>
Date: Wed, 14 May 2025 10:19:57 +0200
Subject: [PATCH v2 2/3] dt-bindings: iommu: mediatek: Support 5 IRQs on
 MT8195 infra IOMMU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250514-mt8395-dtb-errors-v2-2-d67b9077c59a@collabora.com>
References: <20250514-mt8395-dtb-errors-v2-0-d67b9077c59a@collabora.com>
In-Reply-To: <20250514-mt8395-dtb-errors-v2-0-d67b9077c59a@collabora.com>
To: kernel@collabora.com, Sen Chu <sen.chu@mediatek.com>, 
 Sean Wang <sean.wang@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>, 
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>, 
 Hui Liu <hui.liu@mediatek.com>, Yong Wu <yong.wu@mediatek.com>, 
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, 
 Tinghan Shen <tinghan.shen@mediatek.com>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, iommu@lists.linux.dev, 
 Julien Massot <julien.massot@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_012011_204248_DD632589 
X-CRM114-Status: GOOD (  10.20  )
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

The MT8195 Infra IOMMU is currently the only Mediatek IOMMU instance that
uses five interrupts instead of one.

Update the binding to allow either one or five interrupts, depending on
the compatible string. This avoids dtbs_check errors on platforms like
the Radxa NIO 12L using the MT8395 SoC:

mediatek/mt8395-radxa-nio-12l.dtb: infra-iommu@10315000: interrupts:
[[0, 795, 4, 0], [0, 796, 4, 0], [0, 797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]] is too long

Fixes: 3b5838d1d82e3 ("arm64: dts: mt8195: Add iommu and smi nodes")
Signed-off-by: Julien Massot <julien.massot@collabora.com>
---
 .../devicetree/bindings/iommu/mediatek,iommu.yaml      | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml b/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
index 75750c64157c868725c087500ac81be4e282c829..5068617a5146c8a8d61234d83c19d2848d5e708f 100644
--- a/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
+++ b/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
@@ -97,7 +97,8 @@ properties:
     maxItems: 1
 
   interrupts:
-    maxItems: 1
+    minItems: 1
+    maxItems: 5
 
   clocks:
     items:
@@ -201,6 +202,21 @@ allOf:
       required:
         - mediatek,infracfg
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - mediatek,mt8195-iommu-infra
+    then:
+      properties:
+        interrupts:
+          minItems: 5
+    else:
+      properties:
+        interrupts:
+          maxItems: 1
+
   - if: # The IOMMUs don't have larbs.
       not:
         properties:

-- 
2.49.0


