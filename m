Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1230FC54F32
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 24 May 2025 11:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kq/RIYP37aN0j/sweXWMRbMR+f6iN6gPQkEajgOKD/s=; b=P2J0JJoYboK0Tl5AekjeGwnzcT
	0YhRjkusWhyw0fK2mpvWH5hSZfzRCr5xuPoIb/Mh6DAUnF+UIi7k6Tz4ixCQieuUhasyZeA6Bj8+E
	/1OxVo6wVzOrrfatL5V7/IOS0KDUj265LIgdVKyP7SGPoi7Kd6i1wrpu6DpDyuchkIgI6c9mHfPGC
	z19Yw+droJ8p8ndPaQ60fp6Fs1zom9/3mN8/zfpVEzr14j4DO9/jeTf4UPaAt/87iMaI996KrXYL6
	FbT+RKh9MqFw01P58/UDHbKZuhRR9mFnyJ9gfUXjcAfvhC1dPdr2rSguxPOiKgGm1XqGM359QPVLp
	5zP++qjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uInSC-00000005ofm-2XIi;
	Sat, 24 May 2025 11:54:16 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uInPx-00000005oGZ-3rk2;
	Sat, 24 May 2025 11:51:59 +0000
X-UUID: 7b46c716389511f0bed96b30c12bc3d6-20250524
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=kq/RIYP37aN0j/sweXWMRbMR+f6iN6gPQkEajgOKD/s=;
	b=tmW8rKlXb2I/Q2tSIkY1dvhRbQFLqzS2L3f59H7gPZdl65InkE6WmCj4TvIj129K05nqIkWZ++a43uSS2ElUags+adp42XQgYy5A25+qtDKNjPXtyO9XAhDXo1ADVjVDMuLObwNjxU7wgi5e1F/T/YMsQFozXMr9PKBBlbfyal0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:99c2e071-91ac-4166-8d8b-900b7f4587b6,IP:0,UR
	L:25,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:25
X-CID-META: VersionHash:0ef645f,CLOUDID:2db91059-eac4-4b21-88a4-d582445d304a,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:11|97|99|83|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OS
	I:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 7b46c716389511f0bed96b30c12bc3d6-20250524
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <olivia.wen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 750541079; Sat, 24 May 2025 04:51:51 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Sat, 24 May 2025 19:51:48 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Sat, 24 May 2025 19:51:48 +0800
From: Olivia Wen <olivia.wen@mediatek.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Olivia Wen <olivia.wen@mediatek.com>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<teddy.chen@mediatek.com>, <yunkec@chromium.org>
Subject: [PATCH v1 02/10] dt-bindings: media: Add MT8188 ImgSys's LARB
Date: Sat, 24 May 2025 19:49:54 +0800
Message-ID: <20250524115144.3832748-3-olivia.wen@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250524115144.3832748-1-olivia.wen@mediatek.com>
References: <20250524115144.3832748-1-olivia.wen@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250524_045157_973053_4F73AA16 
X-CRM114-Status: GOOD (  14.09  )
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

This patch adds support for the MT8188 Image System's Local Arbiter
(LARB) in the device tree bindings. The LARB is a crucial component in
MediaTek's ImgSys architecture, responsible for managing memory access
and arbitration between various hardware modules.

Signed-off-by: Olivia Wen <olivia.wen@mediatek.com>
---
 .../bindings/media/mediatek,imgsys-larbs.yaml | 75 +++++++++++++++++++
 1 file changed, 75 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,imgsys-larbs.yaml

diff --git a/Documentation/devicetree/bindings/media/mediatek,imgsys-larbs.yaml b/Documentation/devicetree/bindings/media/mediatek,imgsys-larbs.yaml
new file mode 100644
index 000000000000..d2966c64ddb6
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/mediatek,imgsys-larbs.yaml
@@ -0,0 +1,75 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/mediatek,imgsys-larbs.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: LARB Information for MediaTek Camera Image System Hardware
+
+maintainers:
+  - Olivia Wen <olivia.wen@mediatek.com>
+
+description:
+  Detailed configuration for MediaTek Camera Image System's Local Arbiter
+  (LARB) hardware integration.
+
+properties:
+  compatible:
+    enum:
+      - mediatek,mt8188-imgsys-larbs
+
+  iommus:
+    minItems: 1
+    maxItems: 30
+
+  '#address-cells':
+    const: 2
+
+  '#size-cells':
+    const: 2
+
+required:
+  - compatible
+  - iommus
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/memory/mediatek,mt8188-memory-port.h>
+
+    imgsys-l11b {
+        compatible = "mediatek,mt8188-imgsys-larb";
+        #address-cells = <2>;
+        #size-cells = <2>;
+        iommus = <&vpp_iommu M4U_PORT_L11B_WPE_RDMA_0>,
+             <&vpp_iommu M4U_PORT_L11B_WPE_RDMA_1>,
+             <&vpp_iommu M4U_PORT_L11B_WPE_RDMA_4P_0>,
+             <&vpp_iommu M4U_PORT_L11B_WPE_RDMA_4P_1>,
+             <&vpp_iommu M4U_PORT_L11B_WPE_CQ0>,
+             <&vpp_iommu M4U_PORT_L11B_WPE_CQ1>,
+             <&vpp_iommu M4U_PORT_L11B_PIMGI_P1>,
+             <&vpp_iommu M4U_PORT_L11B_PIMGBI_P1>,
+             <&vpp_iommu M4U_PORT_L11B_PIMGCI_P1>,
+             <&vpp_iommu M4U_PORT_L11B_IMGI_T1_C>,
+             <&vpp_iommu M4U_PORT_L11B_IMGBI_T1_C>,
+             <&vpp_iommu M4U_PORT_L11B_IMGCI_T1_C>,
+             <&vpp_iommu M4U_PORT_L11B_SMTI_T1_C>,
+             <&vpp_iommu M4U_PORT_L11B_SMTI_T4_C>,
+             <&vpp_iommu M4U_PORT_L11B_SMTI_T6_C>,
+             <&vpp_iommu M4U_PORT_L11B_YUVO_T1_C>,
+             <&vpp_iommu M4U_PORT_L11B_YUVBO_T1_C>,
+             <&vpp_iommu M4U_PORT_L11B_YUVCO_T1_C>,
+             <&vpp_iommu M4U_PORT_L11B_WPE_WDMA_0>,
+             <&vpp_iommu M4U_PORT_L11B_WPE_WDMA_4P_0>,
+             <&vpp_iommu M4U_PORT_L11B_WROT_P1>,
+             <&vpp_iommu M4U_PORT_L11B_TCCSO_P1>,
+             <&vpp_iommu M4U_PORT_L11B_TCCSI_P1>,
+             <&vpp_iommu M4U_PORT_L11B_TIMGO_T1_C>,
+             <&vpp_iommu M4U_PORT_L11B_YUVO_T2_C>,
+             <&vpp_iommu M4U_PORT_L11B_YUVO_T5_C>,
+             <&vpp_iommu M4U_PORT_L11B_SMTO_T1_C>,
+             <&vpp_iommu M4U_PORT_L11B_SMTO_T4_C>,
+             <&vpp_iommu M4U_PORT_L11B_SMTO_T6_C>,
+             <&vpp_iommu M4U_PORT_L11B_DBGO_T1_C>;
+    };
-- 
2.45.2


