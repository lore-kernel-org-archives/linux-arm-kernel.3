Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41B66C83F07
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 01:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9yxv9B+ZNUkuaWw2CZRUqnNvn+dTrF4fhWFkMUqKXeM=; b=Bk+bcKcyazWtFP6HWB1j5Pb/BB
	s2ZoJ8ZXRVp4WcSBhUgFnwP4PJ7NZgUSiEdYktHBtowdDfBYbQ/rDpAZtAIabCe+ZXRyob8RNK7zr
	S6il42Acj8psv8sK+QlVqc6MwcabHiSFumRT9KC+BAh6Ry431QB2zEnSX+3/QniUDs6ZFxcr9m8R9
	ioVMykyJxAUB0c+TsHlMIAIZkqJn7wpaHG2VtModltynZ4y8nknLOnUZxHtVsR5jyL/mLSBCMCll9
	Ca1Dp3pXGeSdgimiIrse1QjOBC0B9Cq5M7+S8LXOUrt7PbOodF3IRipwCmswF43t2tTgXS+ebhAUy
	Bogq4tyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYamp-000000017ER-3caH;
	Mon, 07 Jul 2025 01:36:51 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYaiG-000000016Ag-27s1;
	Mon, 07 Jul 2025 01:32:09 +0000
X-UUID: 2e6cadca5ad211f09eb0dd999d3936bf-20250706
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=9yxv9B+ZNUkuaWw2CZRUqnNvn+dTrF4fhWFkMUqKXeM=;
	b=QQi3vYKGqQfVstRFHXxuaGbQXHKNUKRbODsaGdOi7JE0n7tz4kIgkYrZ1eyv5VXYLyB5etAM3DyNNuZnqIVGWyNFMQubbErMcSoks0mEvfegGvlQYiOIGZifD+N5niNKjQK/LRkNlU2bxIV11y9ELAJ2WrVi9900zViA40ge7Eg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.2,REQID:ce6932da-9d18-4718-80d6-351979a8133b,IP:0,UR
	L:25,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:25
X-CID-META: VersionHash:9eb4ff7,CLOUDID:2abe0260-2aa0-4c76-8faa-804d844c7164,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:11|97|99|83|106|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:
	0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 2e6cadca5ad211f09eb0dd999d3936bf-20250706
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <shangyao.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1708633604; Sun, 06 Jul 2025 18:32:01 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Mon, 7 Jul 2025 09:31:58 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Mon, 7 Jul 2025 09:31:58 +0800
From: shangyao lin <shangyao.lin@mediatek.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: Shangyao Lin <shangyao.lin@mediatek.com>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<dri-devel@lists.freedesktop.org>, <linaro-mm-sig@lists.linaro.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v2 01/13] dt-bindings: media: mediatek: add camisp binding
Date: Mon, 7 Jul 2025 09:31:42 +0800
Message-ID: <20250707013154.4055874-2-shangyao.lin@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250707013154.4055874-1-shangyao.lin@mediatek.com>
References: <20250707013154.4055874-1-shangyao.lin@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250706_183208_553604_5146EB43 
X-CRM114-Status: GOOD (  12.62  )
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

From: "shangyao.lin" <shangyao.lin@mediatek.com>

Add camera isp7x module device document.

---

Changes in v2:
  - Rename binding file to mediatek,mt8188-camisp.yaml
  - Split bindings into four separate patches (one per YAML file)
  - Various fixes per review comments
  - Update maintainers list

Signed-off-by: shangyao.lin <shangyao.lin@mediatek.com>
---
 .../mediatek/mediatek,mt8188-camisp.yaml      | 68 +++++++++++++++++++
 1 file changed, 68 insertions(+)
 create mode 100755 Documentation/devicetree/bindings/media/mediatek/mediatek,mt8188-camisp.yaml

diff --git a/Documentation/devicetree/bindings/media/mediatek/mediatek,mt8188-camisp.yaml b/Documentation/devicetree/bindings/media/mediatek/mediatek,mt8188-camisp.yaml
new file mode 100755
index 000000000000..53dbf5152e78
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/mediatek/mediatek,mt8188-camisp.yaml
@@ -0,0 +1,68 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (c) 2024 MediaTek Inc.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/mediatek/mediatek,camisp.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: The camisp unit of MediaTek ISP system
+
+maintainers:
+  - Shangyao Lin <shangyao.lin@mediatek.com>
+  - Shu-hsiang Yang <shu-hsiang.yang@mediatek.com>
+  - Shun-yi Wang <shun-yi.wang@mediatek.com>
+  - Teddy Chen <teddy.chen@mediatek.com>
+
+description:
+  MediaTek camisp is the ISP auxiliary unit for camera system in MediaTek SoC.
+
+properties:
+  compatible:
+    const: mediatek,mt8188-camisp
+
+  reg:
+    minItems: 1
+    maxItems: 1
+    description:
+      Base address of the camisp hardware block.
+
+  reg-names:
+    items:
+      - const: base
+    minItems: 1
+    maxItems: 1
+    description:
+      Name for the register region. Must be "base".
+
+  power-domains:
+    minItems: 1
+    maxItems: 1
+    description: Power domain for the camisp block.
+
+  mediatek,scp:
+    description: MediaTek co-process unit for ISP system
+    $ref: /schemas/types.yaml#/definitions/phandle
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - power-domains
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/power/mediatek,mt8188-power.h>
+
+    soc {
+      isp@16000000 {
+        compatible = "mediatek,mt8188-camisp";
+        reg = <0 0x16000000 0 0x1000>;
+        reg-names = "base";
+        mediatek,scp = <&scp_dual>;
+        power-domains = <&spm MT8188_POWER_DOMAIN_CAM_MAIN>;
+      };
+    };
+
+...
\ No newline at end of file
-- 
2.18.0


