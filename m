Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6492C02194
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 12:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xRnnqccViHY7/lghQF8XBSkl+CSYtWIn8P+USXrKzcc=; b=skBnKxy2b+JmVD9g6vwQ4yh4Br
	25etA4i3x+5/fm/M4nE9Pxu05TlSxsTwxRXOxi22MhwlfIJJdxmUiCjHYySWd2iojjYoYlbAMtiWT
	jeRkdaO6KSOKQXCUC1MkcaY0EXyh3ZPqVcTfMNhHUEVoLaIAx9VrisKUhKYHqwbGSjLlfgfLOzbs2
	9zo2//yVotb/oIxtBJAs0/HLf7SWSvbabJl5mZF+SsHxIBLPGokDODZNzY4enUgsmQgxaywekutKG
	z2fkfIWxB6TU0qxzRlYD/2sIAKwhRHEG02RfRqQ7eVejSYCMgJMLlBNT/HgC0/+yRz+Kpz9l89dtl
	0fpywejg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg0t1-00000006GCS-2EpD;
	Thu, 06 Feb 2025 12:21:39 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tg0oF-00000006FHx-23Eb;
	Thu, 06 Feb 2025 12:16:44 +0000
X-UUID: 35f933c0e48411ef82ff63e91e7eb18c-20250206
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=xRnnqccViHY7/lghQF8XBSkl+CSYtWIn8P+USXrKzcc=;
	b=evF1VNiYvi7/7ZTNV9HxDthbEnLebT1Gh6AXoG7yn1eLDRCQ6WJaiyNKnlmflnQVJMnwCB8gzPbur8GnUFX4HwxgAWZsGdfaKzIxZ0OkipBW/c22FA1LtLPhcrjRVEFRSbuSxCL4AOEEOF/IHU2htRYt1QJWJRZ5cYF0DmqHHFQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:1c6a2498-48bb-4be8-8028-5b79632c2eb6,IP:0,U
	RL:25,TC:0,Content:0,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:003b3fff-c190-4cfe-938d-595d7f10e0dc,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:1|
	19,IP:nil,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA
	:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 35f933c0e48411ef82ff63e91e7eb18c-20250206
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <crystal.guo@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1258812141; Thu, 06 Feb 2025 05:16:36 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Thu, 6 Feb 2025 20:16:33 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Thu, 6 Feb 2025 20:16:33 +0800
From: Crystal Guo <crystal.guo@mediatek.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Crystal Guo
	<crystal.guo@mediatek.com>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [v2,2/2] dt-bindings: memory-controllers: Add MediaTek DRAM controller interface
Date: Thu, 6 Feb 2025 20:16:09 +0800
Message-ID: <20250206121629.12186-3-crystal.guo@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250206121629.12186-1-crystal.guo@mediatek.com>
References: <20250206121629.12186-1-crystal.guo@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_041643_542623_7A50A9EC 
X-CRM114-Status: GOOD (  13.66  )
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

A MediaTek DRAM controller interface to provide the current DDR data rate.

Signed-off-by: Crystal Guo <crystal.guo@mediatek.com>
---
 .../mediatek,common-dramc.yaml                | 129 ------------------
 .../memory-controllers/mediatek,dramc.yaml    |  44 ++++++
 2 files changed, 44 insertions(+), 129 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/memory-controllers/mediatek,common-dramc.yaml
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/mediatek,dramc.yaml

diff --git a/Documentation/devicetree/bindings/memory-controllers/mediatek,common-dramc.yaml b/Documentation/devicetree/bindings/memory-controllers/mediatek,common-dramc.yaml
deleted file mode 100644
index c9e608c7f183..000000000000
--- a/Documentation/devicetree/bindings/memory-controllers/mediatek,common-dramc.yaml
+++ /dev/null
@@ -1,129 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
-# Copyright (c) 2024 MediaTek Inc.
-%YAML 1.2
----
-$id: http://devicetree.org/schemas/memory-controllers/mediatek,common-dramc.yaml#
-$schema: http://devicetree.org/meta-schemas/core.yaml#
-
-title: MediaTek Common DRAMC (DRAM Controller)
-
-maintainers:
-  - Crystal Guo <crystal.guo@mediatek.com>
-
-description: |
-  The DRAM controller of MediaTek SoC provides an interface to
-  get the current data rate of DRAM.
-
-properties:
-  compatible:
-    const: mediatek,common-dramc
-
-  reg:
-    minItems: 9
-    items:
-      - description: DRAMC_AO_CHA_BASE
-      - description: DRAMC_AO_CHB_BASE
-      - description: DRAMC_AO_CHC_BASE
-      - description: DRAMC_AO_CHD_BASE
-      - description: DRAMC_NAO_CHA_BASE
-      - description: DRAMC_NAO_CHB_BASE
-      - description: DRAMC_NAO_CHC_BASE
-      - description: DRAMC_NAO_CHD_BASE
-      - description: DDRPHY_AO_CHA_BASE
-      - description: DDRPHY_AO_CHB_BASE
-      - description: DDRPHY_AO_CHC_BASE
-      - description: DDRPHY_AO_CHD_BASE
-      - description: DDRPHY_NAO_CHA_BASE
-      - description: DDRPHY_NAO_CHB_BASE
-      - description: DDRPHY_NAO_CHC_BASE
-      - description: DDRPHY_NAO_CHD_BASE
-      - description: SLEEP_BASE
-
-  support-ch-cnt:
-    maxItems: 1
-
-  fmeter-version:
-    maxItems: 1
-    description:
-      Fmeter version for calculating dram data rate
-
-  crystal-freq:
-    maxItems: 1
-    description:
-      Reference clock rate in MHz
-
-  shu-of:
-    maxItems: 1
-
-  pll-id: true
-  shu-lv: true
-  sdmpcw: true
-  posdiv: true
-  fbksel: true
-  dqsopen: true
-  async-ca: true
-  dq-ser-mode: true
-
-required:
-  - compatible
-  - reg
-  - support-ch-cnt
-  - fmeter-version
-  - crystal-freq
-  - pll-id
-  - shu-lv
-  - shu-of
-  - sdmpcw
-  - posdiv
-  - fbksel
-  - dqsopen
-  - async-ca
-  - dq-ser-mode
-
-additionalProperties: false
-
-examples:
-  - |
-    soc {
-        #address-cells = <2>;
-        #size-cells = <2>;
-
-        dramc: dramc@10230000 {
-            compatible = "mediatek,common-dramc";
-            reg = <0 0x10230000 0 0x2000>, /* DRAMC_AO_CHA_BASE */
-                <0 0x10240000 0 0x2000>, /* DRAMC_AO_CHB_BASE */
-                <0 0x10250000 0 0x2000>, /* DRAMC_AO_CHC_BASE */
-                <0 0x10260000 0 0x2000>, /* DRAMC_AO_CHD_BASE */
-                <0 0x10234000 0 0x1000>, /* DRAMC_NAO_CHA_BASE */
-                <0 0x10244000 0 0x1000>, /* DRAMC_NAO_CHB_BASE */
-                <0 0x10254000 0 0x1000>, /* DRAMC_NAO_CHC_BASE */
-                <0 0x10264000 0 0x1000>, /* DRAMC_NAO_CHD_BASE */
-                <0 0x10238000 0 0x2000>, /* DDRPHY_AO_CHA_BASE */
-                <0 0x10248000 0 0x2000>, /* DDRPHY_AO_CHB_BASE */
-                <0 0x10258000 0 0x2000>, /* DDRPHY_AO_CHC_BASE */
-                <0 0x10268000 0 0x2000>, /* DDRPHY_AO_CHD_BASE */
-                <0 0x10236000 0 0x2000>, /* DDRPHY_NAO_CHA_BASE */
-                <0 0x10246000 0 0x2000>, /* DDRPHY_NAO_CHB_BASE */
-                <0 0x10256000 0 0x2000>, /* DDRPHY_NAO_CHC_BASE */
-                <0 0x10266000 0 0x2000>, /* DDRPHY_NAO_CHD_BASE */
-                <0 0x10006000 0 0x1000>; /* SLEEP_BASE */
-            support-ch-cnt = <4>;
-            fmeter-version = <1>;
-            crystal-freq = <26>;
-            pll-id = <0x0e98 0x02000000 25>;
-            shu-lv = <0x0e98 0x0000c000 14>;
-            shu-of = <0x700>;
-            sdmpcw = <0x0908 0x0007fff8 3>,
-                <0x0928 0x0007fff8 3>;
-            posdiv = <0x090c 0x00003800 11>,
-                <0x092c 0x00003800 11>;
-            fbksel = <0x0910 0x00000040 6>,
-                <0x0910 0x00000040 6>;
-            dqsopen = <0x0d94 0x04000000 26>,
-                <0x0d94 0x04000000 26>;
-            async-ca = <0x0d08 0x00000001 0>,
-                <0x0d08 0x00000001 0>;
-            dq-ser-mode = <0x0dc4 0x00000018 3>,
-                <0x0dc4 0x00000018 3>;
-        };
-    };
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


