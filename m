Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BCD8C36007
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Mar 2025 09:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=goXx0bw5S/4pcmZaDRo/lhBcOym7XT9NAEh4tbj1ZQs=; b=gtfdoqBUzUjShzhXeHERW7ZIcU
	Sj8Q/jIVsHFkptnXh0ygLNW151P6AvAMSttaVRFgKev6M+xkikL5rvgsZXleP8TDvM1R8OvUw2Cdg
	Y7OgP8DabpoouMRqj30LBvagkDcBUNRrCCgb7EpUDVB8wV+v3jQdV2b69DWHPWTkjlGoRhiljNsAF
	jOHzzcobvUnmG4TJ2OhjrPSHDgUz3EEIRDQBUjSdlDAH91OJU5G7/4mK2TZuHbMm/yYP8mesWET+w
	Ze1cEmMBTAHpolSzbSv1BtlLAvtOISpxbNZ3sJw7jxmNu9DaORwVpvkYy43stVjzYZE4oMC8P9vHU
	f5fiDvSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvZ93-0000000ESJm-2vl3;
	Fri, 21 Mar 2025 09:58:29 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvYmo-0000000ENgM-1qrZ;
	Fri, 21 Mar 2025 09:35:31 +0000
X-UUID: d223f10c063711f0a1e849db4cc18d44-20250321
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=goXx0bw5S/4pcmZaDRo/lhBcOym7XT9NAEh4tbj1ZQs=;
	b=MAVD6chp+/g/ssU5XddmE2z2JosWSLI7KSdXZXSrNHDC9d9HR0WgUw3g5nBv7UI7mzKEx3+VNIJqgi9/tkSVMEpVbf/kNzTZpeb6qflcOh692SVsbS8Fhz+coKXaYxKU5SBj6g5sHCJi1FAAFKpAIhprWx9g5eVz9Vh3YKOUrzM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:2217bc77-16a8-4e4d-9524-fc53bcc20516,IP:0,UR
	L:25,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:b57aa1c6-16da-468a-87f7-8ca8d6b3b9f7,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:11|83|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: d223f10c063711f0a1e849db4cc18d44-20250321
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <paul-pl.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1078889300; Fri, 21 Mar 2025 02:35:26 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Fri, 21 Mar 2025 17:35:23 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Fri, 21 Mar 2025 17:35:23 +0800
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
Subject: [PATCH v2 05/15] dt-bindings: display: mediatek: add OUTPROC yaml for MT8196
Date: Fri, 21 Mar 2025 17:33:34 +0800
Message-ID: <20250321093435.94835-6-paul-pl.chen@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250321093435.94835-1-paul-pl.chen@mediatek.com>
References: <20250321093435.94835-1-paul-pl.chen@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_023530_481657_C2093527 
X-CRM114-Status: GOOD (  11.66  )
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

From: Paul-pl Chen <paul-pl.chen@mediatek.com>

Add mediate,outproc.yaml to support OUTPROC for MT8196.
MediaTek display overlap output processor, namely OVL_OUTPROC
or OUTPROC,handles the post-stage of pixel processing in the
overlapping procedure.

Signed-off-by: Paul-pl Chen <paul-pl.chen@mediatek.com>
---
 .../display/mediatek/mediatek,outproc.yaml    | 54 +++++++++++++++++++
 1 file changed, 54 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,outproc.yaml

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,outproc.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,outproc.yaml
new file mode 100644
index 000000000000..f42e9abc1436
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,outproc.yaml
@@ -0,0 +1,54 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/mediatek/mediatek,outproc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek display overlap output processor
+
+maintainers:
+  - Chun-Kuang Hu <chunkuang.hu@kernel.org>
+  - Philipp Zabel <p.zabel@pengutronix.de>
+
+description: |
+  MediaTek display overlap output processor, namely OVL_OUTPROC or OUTPROC,
+  handles the post-stage of pixel processing in the overlapping procedure.
+  OVL_OUTPROC manages pixels for gamma correction and ensures that pixel
+  values are within the correct range.
+
+properties:
+  compatible:
+    const: mediatek,mt8196-outproc
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        disp_ovl0_outproc0: outproc@32970000 {
+            compatible = "mediatek,mt8196-outproc";
+            reg = <0 0x32970000 0 0x1000>;
+            clocks = <&ovlsys_config_clk 49>;
+            interrupts = <GIC_SPI 450 IRQ_TYPE_LEVEL_HIGH 0>;
+        };
+    };
-- 
2.45.2


