Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0FA9E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 09:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dqppRzeqdb6ThffmNF8i7KeoIR9iuy9PBiocW458+tc=; b=qogjRuWgREbWF/rDXVtnQVHH2t
	SetAYt3V7v1kYSiX9RlnVKYbcW9WQ/nNe4afFUh37T6o/qLVAsjcxIZWV+03c2f3mb8w0vO8ts7A2
	9xaF1Enb0hX8GOQioQxWBL33jKZzXyxloiMouNUswgqm/ZdcOTje59izhHLIcNjn2GtSiLxnUWvfL
	MHiANxPDunvhcUkcs7q9DUllXI59E9MupbAaFTZi70vXFIlDn7u0zpUVkZ2uvw6HJbTECqmT69as6
	p9B/KntndrOnV8ctMnDJsU0SXH2REI5ZMqat+pO3V8j8jANXzM0W/J8miEi41pKLwXLO5ePO2/CDV
	7T84PZ5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLfN5-0000000HSo1-44lr;
	Thu, 12 Dec 2024 09:20:35 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLfJA-0000000HRuI-2alK;
	Thu, 12 Dec 2024 09:16:34 +0000
X-UUID: 9bdcaed6b86711ef9048ed6ed365623b-20241212
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=dqppRzeqdb6ThffmNF8i7KeoIR9iuy9PBiocW458+tc=;
	b=l6NKFIZvoZOnYozb8s51ZzPbrjtkXzg3TdWmUHAJv/UXmlKPBC16hy0YO8O+6q4I3zbvEEh+hUhADlUqrwKj1OgU2dgBOd5wxxj5GOshzXitSV59aa272O6lYA+rSFHThMcPjRIufAdRDDEykV6m0QLZy0MblAwSeSVYl/p6e+k=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:a4214469-3508-46bf-b4e5-d0f213014995,IP:0,U
	RL:25,TC:0,Content:0,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:6493067,CLOUDID:fafc0413-8f5d-4ac6-9276-7b9691c7b8d6,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0,EDM:1|19,
	IP:nil,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 9bdcaed6b86711ef9048ed6ed365623b-20241212
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw02.mediatek.com
	(envelope-from <crystal.guo@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1030628017; Thu, 12 Dec 2024 02:01:00 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 12 Dec 2024 17:00:58 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 12 Dec 2024 17:00:58 +0800
From: Crystal Guo <crystal.guo@mediatek.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Crystal Guo
	<crystal.guo@mediatek.com>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH 2/2] dt-bindings: memory-controllers: Add mediatek common-dramc dt-bindings
Date: Thu, 12 Dec 2024 16:59:48 +0800
Message-ID: <20241212090029.13692-3-crystal.guo@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241212090029.13692-1-crystal.guo@mediatek.com>
References: <20241212090029.13692-1-crystal.guo@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_011632_651795_736CB596 
X-CRM114-Status: GOOD (  13.72  )
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

Add devicetree binding for mediatek common-dramc driver.

The DRAM controller of MediaTek SoC provides an interface to
get the current data rate of DRAM.

Signed-off-by: Crystal Guo <crystal.guo@mediatek.com>
---
 .../mediatek,common-dramc.yaml                | 129 ++++++++++++++++++
 1 file changed, 129 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/mediatek,common-dramc.yaml

diff --git a/Documentation/devicetree/bindings/memory-controllers/mediatek,common-dramc.yaml b/Documentation/devicetree/bindings/memory-controllers/mediatek,common-dramc.yaml
new file mode 100644
index 000000000000..c9e608c7f183
--- /dev/null
+++ b/Documentation/devicetree/bindings/memory-controllers/mediatek,common-dramc.yaml
@@ -0,0 +1,129 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+# Copyright (c) 2024 MediaTek Inc.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/memory-controllers/mediatek,common-dramc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek Common DRAMC (DRAM Controller)
+
+maintainers:
+  - Crystal Guo <crystal.guo@mediatek.com>
+
+description: |
+  The DRAM controller of MediaTek SoC provides an interface to
+  get the current data rate of DRAM.
+
+properties:
+  compatible:
+    const: mediatek,common-dramc
+
+  reg:
+    minItems: 9
+    items:
+      - description: DRAMC_AO_CHA_BASE
+      - description: DRAMC_AO_CHB_BASE
+      - description: DRAMC_AO_CHC_BASE
+      - description: DRAMC_AO_CHD_BASE
+      - description: DRAMC_NAO_CHA_BASE
+      - description: DRAMC_NAO_CHB_BASE
+      - description: DRAMC_NAO_CHC_BASE
+      - description: DRAMC_NAO_CHD_BASE
+      - description: DDRPHY_AO_CHA_BASE
+      - description: DDRPHY_AO_CHB_BASE
+      - description: DDRPHY_AO_CHC_BASE
+      - description: DDRPHY_AO_CHD_BASE
+      - description: DDRPHY_NAO_CHA_BASE
+      - description: DDRPHY_NAO_CHB_BASE
+      - description: DDRPHY_NAO_CHC_BASE
+      - description: DDRPHY_NAO_CHD_BASE
+      - description: SLEEP_BASE
+
+  support-ch-cnt:
+    maxItems: 1
+
+  fmeter-version:
+    maxItems: 1
+    description:
+      Fmeter version for calculating dram data rate
+
+  crystal-freq:
+    maxItems: 1
+    description:
+      Reference clock rate in MHz
+
+  shu-of:
+    maxItems: 1
+
+  pll-id: true
+  shu-lv: true
+  sdmpcw: true
+  posdiv: true
+  fbksel: true
+  dqsopen: true
+  async-ca: true
+  dq-ser-mode: true
+
+required:
+  - compatible
+  - reg
+  - support-ch-cnt
+  - fmeter-version
+  - crystal-freq
+  - pll-id
+  - shu-lv
+  - shu-of
+  - sdmpcw
+  - posdiv
+  - fbksel
+  - dqsopen
+  - async-ca
+  - dq-ser-mode
+
+additionalProperties: false
+
+examples:
+  - |
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        dramc: dramc@10230000 {
+            compatible = "mediatek,common-dramc";
+            reg = <0 0x10230000 0 0x2000>, /* DRAMC_AO_CHA_BASE */
+                <0 0x10240000 0 0x2000>, /* DRAMC_AO_CHB_BASE */
+                <0 0x10250000 0 0x2000>, /* DRAMC_AO_CHC_BASE */
+                <0 0x10260000 0 0x2000>, /* DRAMC_AO_CHD_BASE */
+                <0 0x10234000 0 0x1000>, /* DRAMC_NAO_CHA_BASE */
+                <0 0x10244000 0 0x1000>, /* DRAMC_NAO_CHB_BASE */
+                <0 0x10254000 0 0x1000>, /* DRAMC_NAO_CHC_BASE */
+                <0 0x10264000 0 0x1000>, /* DRAMC_NAO_CHD_BASE */
+                <0 0x10238000 0 0x2000>, /* DDRPHY_AO_CHA_BASE */
+                <0 0x10248000 0 0x2000>, /* DDRPHY_AO_CHB_BASE */
+                <0 0x10258000 0 0x2000>, /* DDRPHY_AO_CHC_BASE */
+                <0 0x10268000 0 0x2000>, /* DDRPHY_AO_CHD_BASE */
+                <0 0x10236000 0 0x2000>, /* DDRPHY_NAO_CHA_BASE */
+                <0 0x10246000 0 0x2000>, /* DDRPHY_NAO_CHB_BASE */
+                <0 0x10256000 0 0x2000>, /* DDRPHY_NAO_CHC_BASE */
+                <0 0x10266000 0 0x2000>, /* DDRPHY_NAO_CHD_BASE */
+                <0 0x10006000 0 0x1000>; /* SLEEP_BASE */
+            support-ch-cnt = <4>;
+            fmeter-version = <1>;
+            crystal-freq = <26>;
+            pll-id = <0x0e98 0x02000000 25>;
+            shu-lv = <0x0e98 0x0000c000 14>;
+            shu-of = <0x700>;
+            sdmpcw = <0x0908 0x0007fff8 3>,
+                <0x0928 0x0007fff8 3>;
+            posdiv = <0x090c 0x00003800 11>,
+                <0x092c 0x00003800 11>;
+            fbksel = <0x0910 0x00000040 6>,
+                <0x0910 0x00000040 6>;
+            dqsopen = <0x0d94 0x04000000 26>,
+                <0x0d94 0x04000000 26>;
+            async-ca = <0x0d08 0x00000001 0>,
+                <0x0d08 0x00000001 0>;
+            dq-ser-mode = <0x0dc4 0x00000018 3>,
+                <0x0dc4 0x00000018 3>;
+        };
+    };
-- 
2.18.0


