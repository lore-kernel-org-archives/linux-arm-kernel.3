Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD888C3600E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Mar 2025 06:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m+5GZqVRNpSuieco+5vRc0my9hNrDxuZaC3K9GsJiX4=; b=kXGuweXX+dlaBGMwDQzdU/oMQr
	LzRBNpBkkY76zX6EAvb5jhqTB3l8Mlz9kZxl6+SxdLwZVTA/dV1idIBwneH3Bp/JgHWSx4qI5d59L
	Q+GO6RPMknEApXMnuZ2nS26tJ4q0IWSpDhR3YfKi3oiwJGrvmzjWtA6YGuqbAaWm9lzxR3FE/Eh33
	iJ4Wmqac27nizPZkmefGZptcXoqvGrTF5XD8XAp31eLP5TY+WwjVjPaGaL0/Ymoq2z26soumEn9w5
	oZtOVvrY93UxV6OntrCFtAsiNyBkaU+WouShZfl5wFVpkoS9wAqs8/4VrANc0mqaZF/9lhdBwmC1w
	ouB5TM+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txKN3-00000007ftX-2yn1;
	Wed, 26 Mar 2025 06:36:13 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txKHy-00000007fHT-20Ve;
	Wed, 26 Mar 2025 06:30:59 +0000
X-UUID: dcd469600a0b11f0a1e849db4cc18d44-20250325
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=m+5GZqVRNpSuieco+5vRc0my9hNrDxuZaC3K9GsJiX4=;
	b=Unj0yZxZYyAyF1FWzsUWT5eb2Vj1l/WbxjMcKioFA81jmdXJc57Oai2TLL8I1wHdLn+M7AKFnp292vI5d4PlVQo4IDPtCuBloiIWNr4WcR691kH4Bo2Ai/oeY1NZP7LWzMCb7irovu1qXC3Yn1EgsNHlr9Y0+RFa7hXapg7Nvho=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:1560117b-f7c1-417b-afc9-c453dc51b61e,IP:0,UR
	L:25,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:25
X-CID-META: VersionHash:0ef645f,CLOUDID:1355cfc6-16da-468a-87f7-8ca8d6b3b9f7,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:11|83|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: dcd469600a0b11f0a1e849db4cc18d44-20250325
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <crystal.guo@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 387525596; Tue, 25 Mar 2025 23:30:51 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Wed, 26 Mar 2025 14:30:48 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Wed, 26 Mar 2025 14:30:48 +0800
From: Crystal Guo <crystal.guo@mediatek.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Crystal Guo
	<crystal.guo@mediatek.com>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [v3,1/2] dt-bindings: memory-controllers: Add MediaTek DRAM controller interface
Date: Wed, 26 Mar 2025 14:30:31 +0800
Message-ID: <20250326063041.7126-2-crystal.guo@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250326063041.7126-1-crystal.guo@mediatek.com>
References: <20250326063041.7126-1-crystal.guo@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_233058_526966_6B18A736 
X-CRM114-Status: GOOD (  13.39  )
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

A MediaTek DRAM controller interface to provide the current DDR
data rate.

Signed-off-by: Crystal Guo <crystal.guo@mediatek.com>
---
 .../memory-controllers/mediatek,dramc.yaml    | 44 +++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/mediatek,dramc.yaml

diff --git a/Documentation/devicetree/bindings/memory-controllers/mediatek,dramc.yaml b/Documentation/devicetree/bindings/memory-controllers/mediatek,dramc.yaml
new file mode 100644
index 000000000000..8bdacfc36cb5
--- /dev/null
+++ b/Documentation/devicetree/bindings/memory-controllers/mediatek,dramc.yaml
@@ -0,0 +1,44 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (c) 2025 MediaTek Inc.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/memory-controllers/mediatek,dramc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek DRAM Controller (DRAMC)
+
+maintainers:
+  - Crystal Guo <crystal.guo@mediatek.com>
+
+description:
+  A MediaTek DRAM controller interface to provide the current data rate of DRAM.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - mediatek,mt8196-dramc
+
+  reg:
+    items:
+      - description: anaphy registers
+      - description: ddrphy registers
+
+additionalProperties: false
+
+required:
+  - compatible
+  - reg
+
+examples:
+  - |
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        memory-controller@10236000 {
+            compatible = "mediatek,mt8196-dramc";
+            reg = <0 0x10236000 0 0x2000>,
+                  <0 0x10238000 0 0x2000>;
+        };
+    };
-- 
2.18.0


