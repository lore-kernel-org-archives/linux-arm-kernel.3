Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5E53C021AD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 07:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GBpfUY9olAAkhSfL2VXX5zsMPlwbrPBi5J4Rr2vR3II=; b=2Jsya4h1N/mp1e1B14xa+3CcUg
	jQe1p/KW00JQYLcywxFrMZ2Z661FT1kDG7AeuH7bGgZMXi9e6uSyVVWCwIjXsxPWsqxT2EPleML83
	y5pyJaMmmmacdLuo+ZyohNo2QkVLjnXCqNJ+VQFXKcMUZUap2a24uAuwx9jLlYJJj4yGO26PPvbCh
	H8MiOdXAO8AadRfm3azUIqYr4i/iBCtC/jVp7XNHiwF472o+I4xiRm37ZXXnVkII6wUbQtpOMTwFx
	OQaAN/QLJWxTI6sPd9BxiecVcqoPynaRr0V50DSIM1YgBoeIG0e8LItsnEF02BMVJ4qpc6AyqAC4w
	+bJqZt8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl0fH-0000000H4Ks-0DE4;
	Thu, 20 Feb 2025 07:08:07 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl0Ym-0000000H2eX-22vM;
	Thu, 20 Feb 2025 07:01:27 +0000
X-UUID: 7c27212aef5811ef83f2a1c9db70dae0-20250220
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=GBpfUY9olAAkhSfL2VXX5zsMPlwbrPBi5J4Rr2vR3II=;
	b=tIGBH5ZfeygUKKBwCD4R4nA3uDBXIXQxgmgI14ICScfAegsL8npBgfsG7IlKIALZqdSx4OTFa78A+Sg4o3wOcA6nFmxss12NGohuUfeyLs4rbHVbEGDwxn/lyMtD4080WyDGCceSV9VCtX3U96HeGxxz+UObahQWsTe+giKSR0o=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:0bf40813-6def-4c53-9a13-d0b92579cb20,IP:0,U
	RL:25,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:146e56a4-5c06-4e72-8298-91cabc9efadf,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 7c27212aef5811ef83f2a1c9db70dae0-20250220
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <bo.kong@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 982584092; Thu, 20 Feb 2025 00:01:19 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Thu, 20 Feb 2025 15:01:16 +0800
Received: from mszsdhlt06.gcn.mediatek.inc (10.16.6.206) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Thu, 20 Feb 2025 15:01:16 +0800
From: bo.kong <bo.kong@mediatek.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Conor
 Dooley <conor+dt@kernel.org>, mtk29348 <Bo.Kong@mediatek.com>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<zhaoyuan.chen@mediatek.com>, <teddy.chen@mediatek.com>
Subject: [PATCH v4 1/4] media: dt-bindings: add MT8188 AIE
Date: Thu, 20 Feb 2025 14:59:50 +0800
Message-ID: <20250220070114.15015-2-bo.kong@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250220070114.15015-1-bo.kong@mediatek.com>
References: <20250220070114.15015-1-bo.kong@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_230124_586762_EF67884A 
X-CRM114-Status: GOOD (  14.01  )
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

From: Bo Kong <Bo.Kong@mediatek.com>

Add YAML device tree bindings for MT8188 AIE.

Signed-off-by: Bo Kong <Bo.Kong@mediatek.com>
---
Changes in v4:
1. Remove address-cells and size-cells
2. Remove larb12 related content
3. Update id content

Changes in v3:
None

Changes in v2:
1. Fix coding style
---
 .../bindings/media/mediatek,mt8188-aie.yaml   | 90 +++++++++++++++++++
 1 file changed, 90 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mt8188-aie.yaml

diff --git a/Documentation/devicetree/bindings/media/mediatek,mt8188-aie.yaml b/Documentation/devicetree/bindings/media/mediatek,mt8188-aie.yaml
new file mode 100644
index 000000000000..232b5afc2ad3
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/mediatek,mt8188-aie.yaml
@@ -0,0 +1,90 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/mediatek,mt8188-aie.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: The AI Engine Unit of MediaTek Camera System
+
+maintainers:
+  - Bo Kong <bo.kong@mediatek.com>
+
+description:
+  AIE(AI Engine) is one of the units in mt8188 ISP which
+  provides hardware accelerated face detection function,
+  it can detect different sizes of faces in a raw image.
+
+properties:
+  compatible:
+    items:
+      - const: mediatek,mt8188-aie
+
+  reg:
+    maxItems: 1
+    description: Physical base address and length of the register space.
+
+  interrupts:
+    maxItems: 1
+
+  mediatek,larb:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Must contain the local arbiters in the current SoCs, see
+      Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml
+      for details.
+
+  iommus:
+    maxItems: 4
+    description:
+      Points to the respective IOMMU block with master port as argument, see
+      Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml for details.
+      Ports are according to the HW.
+
+  power-domains:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: clock for imgsys main ipe
+      - description: clock for ipe fdvt
+      - description: clock for ipe top
+
+  clock-names:
+    items:
+      - const: img_ipe
+      - const: ipe_fdvt
+      - const: ipe_top
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - iommus
+  - power-domains
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/memory/mediatek,mt8188-memory-port.h>
+    #include <dt-bindings/power/mediatek,mt8188-power.h>
+    #include <dt-bindings/clock/mediatek,mt8188-clk.h>
+    aie@15310000 {
+      compatible = "mediatek,mt8188-aie";
+      reg = <0x15310000 0x1000>;
+      interrupts = <GIC_SPI 787 IRQ_TYPE_LEVEL_HIGH 0>;
+      iommus = <&vpp_iommu M4U_PORT_L12_FDVT_RDA_0>,
+               <&vpp_iommu M4U_PORT_L12_FDVT_RDB_0>,
+               <&vpp_iommu M4U_PORT_L12_FDVT_WRA_0>,
+               <&vpp_iommu M4U_PORT_L12_FDVT_WRB_0>;
+      power-domains = <&spm MT8188_POWER_DOMAIN_IPE>;
+      clocks = <&imgsys CLK_IMGSYS_MAIN_IPE>,
+               <&ipesys CLK_IPE_FDVT>,
+               <&ipesys CLK_IPESYS_TOP>;
+      clock-names = "img_ipe",
+                    "ipe_fdvt",
+                    "ipe_top";
+    };
-- 
2.45.2


