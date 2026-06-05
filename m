Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC882CD6E6B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 08:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VXB/XnlUH5N+OdMSntezinBqogXwuskEjjKrwrJejx8=; b=dzKOy0Yq4LeS7N5cyar/H0OWMJ
	adt4c+q5U7PyD8EQKi0j1yUnFfyvWFNcuTL6w4iVLTJ+QRAbXhcHj+IdFj45eKuez5+7S765sZHmP
	Tj9kqlvnTydC5d9NWgXsT3hm/MIIS0npBd7q+LVIwETFfSswfli4e7AHfP9AC4sgbgSiak987d7ul
	IdxSPrId0rliHb78Oqj6hNuPlQVUzNLUdugUmWTPZCaPle6Qnj5x8vxhbbgcLpTLIWyxNXIOmMWAR
	yevFyBRVu+aTKdrffaibplNOSjEoRBpp/0IjF62WxKnvG8IdBhxR53MzTpN8rz4SuiKr8Sbin/2yA
	ry2nv7NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVPun-00000000JYV-4C3U;
	Fri, 05 Jun 2026 08:28:30 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVPuk-00000000JY2-3kDw;
	Fri, 05 Jun 2026 08:28:28 +0000
X-UUID: 8365881460b811f1acbe4559397dec65-20260605
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=VXB/XnlUH5N+OdMSntezinBqogXwuskEjjKrwrJejx8=;
	b=OVl3P2mKz64rKwcItuGBTgqsxgHe1G39Q06fZqBdHiNQEDo9qcl8QJ1mlBLCKsyVnPhayVrV5yik/JzA9Kz4Nn1OVTHCQrH5plUUR7emutATkH9QNKZYzfoEZDYfuHhRuHy9nmrZ/dEctb3xZi/YWMguWc9+McGIMY9UZnInuI8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.15,REQID:9ce7e2c8-13c2-4519-9d5a-7f485da10246,IP:0,U
	RL:25,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:e276073,CLOUDID:ab158503-5b7c-4de7-bc39-cc187eea3c57,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|136|836|865|888|898,TC:-5,Conten
	t:0|15|50,EDM:-3,IP:nil,URL:11|97|99|83|106|1,File:130,RT:0,Bulk:nil,QS:ni
	l,BEC:-1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 8365881460b811f1acbe4559397dec65-20260605
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <sarang.chaudhari@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1518700745; Fri, 05 Jun 2026 01:28:21 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 5 Jun 2026 16:28:19 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Fri, 5 Jun 2026 16:28:19 +0800
From: Sarang Chaudhari <sarang.chaudhari@mediatek.com>
To: Rob Herring <robh@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
CC: <zhaoyuan.chen@mediatek.com>, <Teddy.Chen@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Sarang Chaudhari
	<sarang.chaudhari@mediatek.com>
Subject: [PATCH v6 1/4] media: dt-bindings: mediatek: Add AIE face detection support for MT8188
Date: Fri, 5 Jun 2026 16:28:00 +0800
Message-ID: <20260605082816.2589809-1-sarang.chaudhari@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_012826_958809_8CB833F7 
X-CRM114-Status: GOOD (  18.21  )
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

Add YAML device tree bindings for the MediaTek AI Engine (AIE) hardware
accelerator found in MT8188 SoCs. The AIE provides hardware-accelerated
face detection, facial landmark detection, and face attribute analysis
capabilities.

Add a MAINTAINERS entry covering the binding, the UAPI header and the
driver directory.

Signed-off-by: Sarang Chaudhari <sarang.chaudhari@mediatek.com>
---
Changes in v6:
- Add ipe-smi-larb12 clock to the binding (was missing in v5 binding
  but present in v5 dtsi).
- Remove iommus from required properties (made optional for platforms
  that can operate without IOMMU).
- Add mediatek,larb as an optional property.
- Improve description text.

Changes in v5:
- Modify the description to make it more concise.
- Delete the description of reg.
- Modify the description of iommus and delete the maxItems of iommus.
- Delete all mediatek,larb.
- Modify the name of clock, change _ to -.

Changes in v4:
- Remove address-cells and size-cells.
- Remove larb12 related content.
- Update id content.

Changes in v3: None

Changes in v2:
- Fix coding style.

 .../bindings/media/mediatek,mt8188-aie.yaml   | 85 +++++++++++++++++++
 MAINTAINERS                                   | 10 +++
 2 files changed, 95 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mt8188-aie.yaml

diff --git a/Documentation/devicetree/bindings/media/mediatek,mt8188-aie.yaml b/Documentation/devicetree/bindings/media/mediatek,mt8188-aie.yaml
new file mode 100644
index 0000000..ab888f0
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/mediatek,mt8188-aie.yaml
@@ -0,0 +1,85 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/mediatek,mt8188-aie.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek AI Engine (AIE) for Face Detection
+
+maintainers:
+  - Fish Wu <fish.wu@mediatek.com>
+  - Bo Kong <bo.kong@mediatek.com>
+
+description: |
+  The MediaTek AI Engine (AIE) provides hardware-accelerated face detection,
+  facial landmark detection, and face attribute analysis. It is found in the
+  IPE (Image Processing Engine) subsystem of MediaTek SoCs.
+
+properties:
+  compatible:
+    enum:
+      - mediatek,mt8188-aie
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: clock for imgsys main ipe
+      - description: clock for ipe fdvt
+      - description: clock for ipe smi larb12
+      - description: clock for ipe top
+
+  clock-names:
+    items:
+      - const: img-ipe
+      - const: ipe-fdvt
+      - const: ipe-smi-larb12
+      - const: ipe-top
+
+  power-domains:
+    maxItems: 1
+
+  iommus:
+    maxItems: 1
+
+  mediatek,larb:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: phandle to the local arbiter (LARB) node
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - power-domains
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/mediatek,mt8188-clk.h>
+    #include <dt-bindings/power/mediatek,mt8188-power.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        aie@15310000 {
+            compatible = "mediatek,mt8188-aie";
+            reg = <0 0x15310000 0 0x1000>;
+            interrupts = <GIC_SPI 600 IRQ_TYPE_LEVEL_HIGH 0>;
+            clocks = <&imgsys CLK_IMGSYS_MAIN_IPE>,
+                     <&ipesys CLK_IPE_FDVT>,
+                     <&ipesys CLK_IPE_SMI_LARB12>,
+                     <&ipesys CLK_IPESYS_TOP>;
+            clock-names = "img-ipe", "ipe-fdvt",
+                          "ipe-smi-larb12", "ipe-top";
+            power-domains = <&spm MT8188_POWER_DOMAIN_IPE>;
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index afb7487..fa631d6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3,6 +3,16 @@ M:	Felix Fietkau <nbd@nbd.name>
 S:	Maintained
 F:	drivers/net/ethernet/mediatek/
 
+MEDIATEK MT8188 AIE DRIVER
+M:	Fish Wu <fish.wu@mediatek.com>
+M:	Bo Kong <bo.kong@mediatek.com>
+L:	linux-media@vger.kernel.org
+L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
+S:	Maintained
+F:	Documentation/devicetree/bindings/media/mediatek,mt8188-aie.yaml
+F:	drivers/media/platform/mediatek/aie/
+F:	include/uapi/linux/mtk_aie_v4l2_controls.h
+
 MEDIATEK MDP DRIVER
 M:	Minghsiu Tsai <minghsiu.tsai@mediatek.com>
 S:	Supported
-- 
2.45.2


