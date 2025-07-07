Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3B15C83F03
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 01:44:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3MQIv0Ru2TodCm/r0/qlTSRfO8/nzt6MirQPs9V9tbU=; b=yJF3nbf046vZ/Z9W/937q9dRve
	f0Eh8W2uhcOrspyAElsjHwx2icTKR91DmhnMx99xa74LFfdB7kGCJu2HWGT8Zsu7xV8lbDM0GsqCb
	QUblReKv2Uc9wkD6x1vuwGk3kXd7NP1P5gBM1ofNlmpy0FYdDyLpq9I0t60quPjn7tz58Ekw+JLbz
	hhfUcwYbPJ73wmIexyfhtFZ7AMKGDEDow7O/XamqFvsw61i2bFpbukruGD8vLmNxFQswHnTXIbb8J
	fKn0lJqpFrOBol47y8HHjffvnQ3D1A3KWd7mTR/f/6HwTi/FjGyF+MkNsOI688hzxj7upNygec9be
	D2wQX2Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYato-000000018a2-39wn;
	Mon, 07 Jul 2025 01:44:04 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYaiT-000000016E8-2Q2g;
	Mon, 07 Jul 2025 01:32:22 +0000
X-UUID: 3838dfd65ad211f09eb0dd999d3936bf-20250706
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=3MQIv0Ru2TodCm/r0/qlTSRfO8/nzt6MirQPs9V9tbU=;
	b=st3sr5EXUXuPKVhj9f0duRSDTa+IMiefDGyJawJXhBW0N78sJTZ7g4wRwATefqrp/2hn3JXafYbEZq+VHRD0/lknj7sjcYmk2AdpDkcrKmx4SckhIdQ+NtcQmh8KberVVtTUnJDN+ZtZkr9pbjAaqc8WVdyjRpUDTsJvgkIxdFs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.2,REQID:920e1ef3-284d-4b0b-a357-0337eaf2752d,IP:0,UR
	L:25,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:25
X-CID-META: VersionHash:9eb4ff7,CLOUDID:b1be0260-2aa0-4c76-8faa-804d844c7164,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:11|97|99|83|106|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:
	0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 3838dfd65ad211f09eb0dd999d3936bf-20250706
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw02.mediatek.com
	(envelope-from <shangyao.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1067645906; Sun, 06 Jul 2025 18:32:18 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Mon, 7 Jul 2025 09:32:15 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Mon, 7 Jul 2025 09:32:15 +0800
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
Subject: [PATCH v2 04/13] dt-bindings: media: mediatek: add cam-yuv binding
Date: Mon, 7 Jul 2025 09:31:45 +0800
Message-ID: <20250707013154.4055874-5-shangyao.lin@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250707013154.4055874-1-shangyao.lin@mediatek.com>
References: <20250707013154.4055874-1-shangyao.lin@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250706_183221_620982_283E3FE9 
X-CRM114-Status: GOOD (  12.97  )
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
  - Rename binding file to mediatek,mt8188-cam-yuv.yaml
  - Various fixes per review comments
  - Update maintainers list

Signed-off-by: shangyao.lin <shangyao.lin@mediatek.com>
---
 .../mediatek/mediatek,mt8188-cam-yuv.yaml     | 134 ++++++++++++++++++
 1 file changed, 134 insertions(+)
 create mode 100755 Documentation/devicetree/bindings/media/mediatek/mediatek,mt8188-cam-yuv.yaml

diff --git a/Documentation/devicetree/bindings/media/mediatek/mediatek,mt8188-cam-yuv.yaml b/Documentation/devicetree/bindings/media/mediatek/mediatek,mt8188-cam-yuv.yaml
new file mode 100755
index 000000000000..0de120d3c6e8
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/mediatek/mediatek,mt8188-cam-yuv.yaml
@@ -0,0 +1,134 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (c) 2024 MediaTek Inc.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/mediatek/mediatek,cam-yuv.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: The cam-yuv unit of MediaTek ISP system
+
+maintainers:
+  - Shangyao Lin <shangyao.lin@mediatek.com>
+  - Shu-hsiang Yang <shu-hsiang.yang@mediatek.com>
+  - Shun-yi Wang <shun-yi.wang@mediatek.com>
+  - Teddy Chen <teddy.chen@mediatek.com>
+
+description:
+  MediaTek cam-yuv is the camera YUV processing unit in MediaTek SoC.
+
+properties:
+  compatible:
+    const: mediatek,mt8188-cam-yuv
+
+  reg:
+    minItems: 1
+    maxItems: 2
+    description:
+      Base address and optional inner base address of the cam-yuv hardware block.
+
+  reg-names:
+    items:
+      - const: base
+      - const: inner_base
+    minItems: 1
+    maxItems: 2
+    description:
+      Names for each register region. Must be "base" and optionally "inner_base".
+
+  mediatek,larbs:
+    description:
+      List of phandles to the local arbiters in the current SoCs.
+      Refer to bindings/memory-controllers/mediatek,smi-larb.yaml.
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    minItems: 1
+    maxItems: 32
+
+  interrupts:
+    minItems: 1
+    description: Interrupts for the cam-yuv block.
+
+  dma-ranges:
+    minItems: 1
+    description: Address information of IOMMU mapping to memory.
+
+  power-domains:
+    minItems: 1
+    description: Power domains for the cam-yuv block.
+
+  clocks:
+    minItems: 4
+    maxItems: 16
+    description: List of phandles to the clocks required by the cam-yuv block.
+
+  clock-names:
+    items:
+      - const: camsys_cam2mm0_cgpdn
+      - const: camsys_cam2mm1_cgpdn
+      - const: camsys_cam2sys_cgpdn
+      - const: camsys_yuva_larbx
+      - const: camsys_yuva_cam_cgpdn
+      - const: camsys_yuva_camtg_cgpdn
+      - const: camsys_yuvb_larbx_cgpdn
+      - const: camsys_yuvb_cam_cgpdn
+      - const: camsys_yuvb_camtg_cgpdn
+    minItems: 4
+    maxItems: 16
+    description: Names of the clocks, must match the order of the clocks property.
+
+  iommus:
+    minItems: 1
+    maxItems: 32
+    description: Points to the respective IOMMU block with master port as argument.
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - interrupts
+  - power-domains
+  - clocks
+  - clock-names
+  - iommus
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/power/mediatek,mt8188-power.h>
+    #include <dt-bindings/clock/mediatek,mt8188-clk.h>
+    #include <dt-bindings/memory/mediatek,mt8188-memory-port.h>
+
+    soc {
+      yuv@16050000 {
+        compatible = "mediatek,mt8188-cam-yuv";
+        reg = <0 0x16050000 0 0x8000>;
+        reg-names = "base";
+        mediatek,larbs = <&larb17a>;
+        interrupts = <GIC_SPI 301 IRQ_TYPE_LEVEL_HIGH 0>;
+        dma-ranges = <0x2 0x0 0x0 0x40000000 0x1 0x0>;
+        power-domains = <&spm MT8188_POWER_DOMAIN_CAM_SUBA>;
+        clocks = <&camsys CLK_CAM_MAIN_CAM2MM0_GALS>,
+                 <&camsys CLK_CAM_MAIN_CAM2MM1_GALS>,
+                 <&camsys CLK_CAM_MAIN_CAM2SYS_GALS>,
+                 <&camsys_yuva CLK_CAM_YUVA_LARBX>,
+                 <&camsys_yuva CLK_CAM_YUVA_CAM>,
+                 <&camsys_yuva CLK_CAM_YUVA_CAMTG>;
+        clock-names = "camsys_cam2mm0_cgpdn",
+                      "camsys_cam2mm1_cgpdn",
+                      "camsys_cam2sys_cgpdn",
+                      "camsys_yuva_larbx_cgpdn",
+                      "camsys_yuva_cam_cgpdn",
+                      "camsys_yuva_camtg_cgpdn";
+        iommus = <&vpp_iommu M4U_PORT_L17A_YUVO_R1>,
+                 <&vpp_iommu M4U_PORT_L17A_YUVO_R3>,
+                 <&vpp_iommu M4U_PORT_L17A_YUVCO_R1>,
+                 <&vpp_iommu M4U_PORT_L17A_YUVO_R2>,
+                 <&vpp_iommu M4U_PORT_L17A_RZH1N2TO_R1>,
+                 <&vpp_iommu M4U_PORT_L17A_DRZS4NO_R1>,
+                 <&vpp_iommu M4U_PORT_L17A_TNCSO_R1>;
+      };
+    };
+
+...
-- 
2.18.0


