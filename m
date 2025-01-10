Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39D3CE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 12:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iCYptYbHTJCtMnIRVZL/ESgJRF5lpqvKVREozV6dumE=; b=d1utbPR/p1ftzH89wfL0ApQ08o
	jZJ5nY2Uy5tfGEoOlAFUyaTmkHFdjIYRnM2DzLMfj+iw/Uw2byVis4kZMPJcY0KwaT24tdGcPvC4x
	0SKkD9BRQbQG2o+OD1MfrPtRp8WsYOwvI02lOF8uQ6TnSLGPQhLG9shcI1qoky3RmVjjnR1DvWAr5
	iWtjqGC8/3zVGdN1S8XD+vcIl9WCFN1Ng5O7XnWNXxmBL0yeq2KlE/RkbI72QixkwyCBOHhptwJ5W
	CL5OZRGdSAPngi7dUXXHjI7cWpUx/d//uBkbCNYMDjmIrDRT2paK56kNVa2EvM/YAhqeFCN+WKSMB
	OyMM/3KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWESV-0000000FLjB-3Sb4;
	Fri, 10 Jan 2025 12:49:51 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWEHw-0000000FImf-3rom;
	Fri, 10 Jan 2025 12:38:59 +0000
X-UUID: d6f97a5ecf4f11ef82ff63e91e7eb18c-20250110
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=iCYptYbHTJCtMnIRVZL/ESgJRF5lpqvKVREozV6dumE=;
	b=RoiLabX8Ax/QwYCoBNQy25HxuDvCjY5UHKt80ntcIU5+cNKJ4tRIv+k1tRpl6so6Bc1saBYnperVhmdzjNIZgWquMDM+a1aiD6a9vCXs6HbllJKB2pbFnH20YHZ30PK/aB2IiKGo9diKO0U7PsvqZiC/fQfo3OAZKk/crzJ8Ujs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:28f7276e-a333-4f37-bb68-b306ad16bff4,IP:0,U
	RL:25,TC:0,Content:-25,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,AC
	TION:release,TS:-25
X-CID-META: VersionHash:60aa074,CLOUDID:d26f4e13-8831-4185-8e40-f83b1917e828,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:1,
	IP:nil,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: d6f97a5ecf4f11ef82ff63e91e7eb18c-20250110
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
	(envelope-from <paul-pl.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 394518499; Fri, 10 Jan 2025 05:38:48 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 10 Jan 2025 20:38:45 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 10 Jan 2025 20:38:45 +0800
From: paul-pl.chen <paul-pl.chen@mediatek.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<chunkuang.hu@kernel.org>, <angelogioacchino.delregno@collabora.com>
CC: <matthias.bgg@gmail.com>, <p.zabel@pengutronix.de>,
	<jason-jh.lin@mediatek.com>, <nancy.lin@mediatek.com>,
	<singo.chang@mediatek.com>, <xiandong.wang@mediatek.com>,
	<sirius.wang@mediatek.com>, <paul-pl.chen@mediatek.com>,
	<sunny.shen@mediatek.com>, <fshao@chromium.org>, <treapking@chromium.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH 03/12] dt-bindings: display: mediatek: add EXDMA yaml for MT8196
Date: Fri, 10 Jan 2025 20:33:59 +0800
Message-ID: <20250110123835.2719824-5-paul-pl.chen@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250110123835.2719824-1-paul-pl.chen@mediatek.com>
References: <20250110123835.2719824-1-paul-pl.chen@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_043856_979768_BF42630E 
X-CRM114-Status: GOOD (  13.32  )
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

From: "Paul-pl.Chen" <paul-pl.chen@mediatek.com>

Add mediatek,exdma.yaml to support EXDMA for MT8196.

Signed-off-by: Paul-pl.Chen <paul-pl.chen@mediatek.com>
---
The header used in examples:
#include <dt-bindings/clock/mt8196-clk.h>
#include <dt-bindings/power/mt8196-power.h>
are not upstreamed yet.
It will be sent by related owner soon.
---
 .../display/mediatek/mediatek,exdma.yaml      | 77 +++++++++++++++++++
 1 file changed, 77 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,exdma.yaml

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,exdma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,exdma.yaml
new file mode 100644
index 000000000000..385f5549dfaa
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,exdma.yaml
@@ -0,0 +1,77 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/mediatek/mediatek,exdma.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek EXDMA
+
+maintainers:
+  - Chun-Kuang Hu <chunkuang.hu@kernel.org>
+  - Philipp Zabel <p.zabel@pengutronix.de>
+
+description:
+  The MediaTek display overlap extended DMA engine, namely OVL_EXDMA or EXDMA,
+  primarily functions as a DMA engine for reading data from DRAM with various
+  DRAM footprints and data formats. For input sources in certain color formats
+  and color domains, OVL_EXDMA also includes a color transfer function
+  to process pixels into a consistent color domain.
+
+properties:
+  compatible:
+    const: mediatek,mt8196-exdma
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: EXDMA Clock
+
+  power-domains:
+    maxItems: 1
+
+  mediatek,larb:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    maxItems: 1
+    items:
+      maxItems: 1
+    description: |
+      A phandle to the local arbiters node in the current SoCs.
+      Refer to bindings/memory-controllers/mediatek,smi-larb.yaml.
+
+  iommus:
+    maxItems: 1
+
+  '#dma-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - power-domains
+  - mediatek,larb
+  - iommus
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/mt8196-clk.h>
+    #include <dt-bindings/power/mt8196-power.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        disp_ovl0_exdma2: dma-controller@32850000 {
+            compatible = "mediatek,mt8196-exdma";
+            reg = <0 0x32850000 0 0x1000>;
+            clocks = <&ovlsys_config_clk CLK_OVL_EXDMA2_DISP>;
+            power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL0_DORMANT>;
+            mediatek,larb = <&smi_larb0>;
+            iommus = <&mm_smmu 144>;
+            #dma-cells = <1>;
+        };
+    };
-- 
2.34.1


