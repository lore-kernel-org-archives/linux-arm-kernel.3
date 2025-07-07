Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C1BCC83F07
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 01:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZzMOl2Ky58KKtiKwQ5AlruNWO0UQZa7Vyr+LxTHTVVA=; b=PLeNYLcR5c4IjdEQvGM8iISOlG
	0fT+P/3DPx2henCaXObrrySHufpz6tuZRWb9qGJyZc7XYgLhmpXDKq/+mjan4IWukcbYUMfPnBhj4
	muhsnMdhauxonNAuR4T7YcswIvOXXDmxkuxEiF2oeD3251wo98EtyrSFCUmQFHlZ5MiKf9R/GYy56
	BXcQ71K+5I7YTkc4PbhQqHvKz2C75AatjQNSH+r0Jhdjr6tV1gIR+Lq46k7rjAB53bg25VrmWIThs
	gGDNbruU0AERLWI/bEmRoI5mPSQ8ZN+/ftiIE9KkhwMMVEdIXKmp9zwiHM25iNUVpoHR2i/d5hGL/
	aPXbJ5Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYap8-000000017mc-3ojv;
	Mon, 07 Jul 2025 01:39:14 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYaiH-000000016BE-2K2l;
	Mon, 07 Jul 2025 01:32:10 +0000
X-UUID: 31b516ca5ad211f09eb0dd999d3936bf-20250706
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=ZzMOl2Ky58KKtiKwQ5AlruNWO0UQZa7Vyr+LxTHTVVA=;
	b=BnlR651ZLf8lepxYjBZEC0oULSHtlh94pqeeAXfu9Ve2NThVjSbYJSwSKUaJA8KB7EWNG4jVezf3VCYv2/uMpvkkRQFPbZrIITQkasYaz4KOuuTw8YhVvEQ0M7hkgNzYiBzVURFFFWI0vy7+qbL15L8ASkPApkvJvjN08N4IYMQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.2,REQID:d006673e-f1b2-4a86-9d37-07f094d2746f,IP:0,UR
	L:25,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:20
X-CID-META: VersionHash:9eb4ff7,CLOUDID:635b9382-cc21-4267-87cf-e75829fa6365,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:11|97|99|83|106|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:
	0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 31b516ca5ad211f09eb0dd999d3936bf-20250706
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
	(envelope-from <shangyao.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1583099861; Sun, 06 Jul 2025 18:32:07 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Mon, 7 Jul 2025 09:32:04 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Mon, 7 Jul 2025 09:32:04 +0800
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
Subject: [PATCH v2 02/13] dt-bindings: media: mediatek: add seninf-core binding
Date: Mon, 7 Jul 2025 09:31:43 +0800
Message-ID: <20250707013154.4055874-3-shangyao.lin@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250707013154.4055874-1-shangyao.lin@mediatek.com>
References: <20250707013154.4055874-1-shangyao.lin@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250706_183209_597187_B8867ADE 
X-CRM114-Status: GOOD (  17.97  )
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

1. Add camera isp7x module device document

---

Changes in v2:
  - Rename binding file to mediatek,mt8188-seninf-core.yaml
  - Various fixes per review comments
  - Update maintainers list

Question for reviewer (CK):

Hi CK,

Thank you for your review and suggestions on this patch, especially for providing the reference patch (https://patchwork.kernel.org/project/linux-mediatek/list/?series=874617) and for mentioning in another patch ([V1,02/10] MEDIA: PLATFORM: MEDIATEK: ADD SENINF CONTROLLER) the suggestion to "Move the phy part to phy/mediatek/ folder. You could refer to phy/mediatek/phy-mtk-mipi-csi-0-5.c".

After reading your comments and the reference patches, my understanding is that only the seninf-core driver should manage all ports internally, and each port corresponds to a PHY. During probe, the driver will parse each port, obtain the corresponding PHY (e.g., devm_phy_get(dev, "csi0"), devm_phy_get(dev, "csi1"), etc.), and operate the PHY for each port individually during stream on/off or power on/off.

Could you please confirm if my understanding is correct?
If you have any additional reference patches or examples, I would greatly appreciate it.

Thank you for your guidance!

Best regards,
Shangyao

Signed-off-by: shangyao.lin <shangyao.lin@mediatek.com>
---
 .../mediatek/mediatek,mt8188-seninf-core.yaml | 121 ++++++++++++++++++
 1 file changed, 121 insertions(+)
 create mode 100755 Documentation/devicetree/bindings/media/mediatek/mediatek,mt8188-seninf-core.yaml

diff --git a/Documentation/devicetree/bindings/media/mediatek/mediatek,mt8188-seninf-core.yaml b/Documentation/devicetree/bindings/media/mediatek/mediatek,mt8188-seninf-core.yaml
new file mode 100755
index 000000000000..763b96b561cf
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/mediatek/mediatek,mt8188-seninf-core.yaml
@@ -0,0 +1,121 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (c) 2023 MediaTek Inc.
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/media/mediatek,seninf-core.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: The seninf-core top unit of MediaTek ISP system
+
+maintainers:
+  - Shangyao Lin <shangyao.lin@mediatek.com>
+  - Shu-hsiang Yang <shu-hsiang.yang@mediatek.com>
+  - Shun-yi Wang <shun-yi.wang@mediatek.com>
+  - Teddy Chen <teddy.chen@mediatek.com>
+
+description: |
+  MediaTek seninf-core is the ISP sensor interface unit in MediaTek SoC.
+  The sensor interface serves as the MIPI-CSI2 top RX controller.
+
+properties:
+  compatible:
+    const: mediatek,mt8188-seninf-core
+
+  reg:
+    minItems: 1
+    maxItems: 1
+    description: |
+      Base address register region.
+
+  reg-names:
+    items:
+      - const: base
+    minItems: 1
+    maxItems: 1
+
+  mtk_csi_phy_ver:
+    description: Describes MediaTek camera Rx controller version
+    $ref: /schemas/types.yaml#/definitions/string
+
+  interrupts:
+    minItems: 1
+    maxItems: 2
+
+  power-domains:
+    minItems: 1
+    maxItems: 4
+
+  clocks:
+    minItems: 4
+    maxItems: 4
+    description: List of clock phandles required by the controller.
+
+  clock-names:
+    items:
+      - const: clk_cam_seninf
+      - const: clk_top_seninf
+      - const: clk_top_seninf1
+      - const: clk_top_camtm
+    minItems: 4
+    maxItems: 4
+
+  mediatek,larbs:
+    description: |
+      List of phandles to the local arbiters in the current SoCs.
+      Refer to bindings/memory-controllers/mediatek,smi-larb.yaml.
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    minItems: 1
+    maxItems: 32
+
+  dma-ranges:
+    description: |
+      Describes the address information of IOMMU mapping to memory.
+      Defines six fields for the MediaTek IOMMU extended iova, pa, and size.
+    minItems: 1
+
+  phys:
+    description: List of phandle and args to the PHY provider.
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+
+  phy-names:
+    description: Names of the PHYs.
+    $ref: /schemas/types.yaml#/definitions/string-array
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - interrupts
+  - power-domains
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/power/mediatek,mt8188-power.h>
+    #include <dt-bindings/clock/mediatek,mt8188-clk.h>
+
+    seninf@16010000 {
+      compatible = "mediatek,mt8188-seninf-core";
+      reg = <0 0x16010000 0 0x8000>;
+      reg-names = "base";
+      mtk_csi_phy_ver = "mtk_csi_phy_2_0";
+      interrupts = <GIC_SPI 316 IRQ_TYPE_LEVEL_HIGH 0>;
+      power-domains = <&spm MT8188_POWER_DOMAIN_CSIRX_TOP>,
+                      <&spm MT8188_POWER_DOMAIN_CAM_VCORE>,
+                      <&spm MT8188_POWER_DOMAIN_CAM_MAIN>;
+      clocks = <&camsys CLK_CAM_MAIN_SENINF>,
+               <&topckgen CLK_TOP_SENINF>,
+               <&topckgen CLK_TOP_SENINF1>,
+               <&topckgen CLK_TOP_CAMTM>;
+      clock-names = "clk_cam_seninf",
+                    "clk_top_seninf",
+                    "clk_top_seninf1",
+                    "clk_top_camtm";
+    };
+
+...
\ No newline at end of file
-- 
2.18.0


