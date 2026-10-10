Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E835CA9EC0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Oct 2026 08:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T/vpP0OK0D1mFMy/+611inzLXJXf1ODaDBwah2sD8x8=; b=rjjGmbv2B8XdLbOZK6RTkXvbMF
	LWNlwG2y34L6gc848gnUuZ+iIUao5Gn4eGlgvqHLdYn05Glbyb618dF05Su/OuUi/hUDi0/oKhID1
	ioTAtJcknA6Le7SB3QGxT+P64F522hVltH315i8OOn/SkSRq77GHyozpYt6JR4nR0AetSntqWfkxm
	NT6H/2vi+qvHVM3aU13Sd94x0lXIAZyn6wFo1twlg8d//hHDFtFWA68es06Dj7babl9pxNCPix7S/
	DTzvZr4V4Tl6pv9X5vRXalVEoeciElGdIIpJL5loXvXInfdgGCh2WGBeuVi8usYjK2vtddCUlQxI3
	mKJjdcNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFSZP-00000007fno-2R7s;
	Sat, 10 Oct 2026 08:36:43 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFSZJ-00000007fdB-2Mc9;
	Sat, 10 Oct 2026 08:36:39 +0000
X-UUID: b20a53f8c48511f1acbe4559397dec65-20261010
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=T/vpP0OK0D1mFMy/+611inzLXJXf1ODaDBwah2sD8x8=;
	b=Csn+/rl+T2WbHD6+5JG6dzSJ4ylZG7RXgPuTDw5zTn3NXjhoHvw7XPLqcEWu3DPV/4SpCnTZKUrFJz9Y/N+9MvlJLq44E7So+93riuQCUIQdRHVtRs2K7XsO/JuMxNLcsj7/k+3Nc03d5SUuGGBAALSGPmrX8zGUAZ6JMc5sqRg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.20,REQID:06ed34ab-aaf7-437a-9efd-7cde774c851e,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:291e20b,CLOUDID:5028edb8-514b-419b-be8a-53f1868a3ee6,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,
	OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: b20a53f8c48511f1acbe4559397dec65-20261010
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1963980132; Sat, 10 Oct 2026 01:36:32 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sat, 10 Oct 2026 16:36:29 +0800
Received: from gcnsap21.gcn.mediatek.inc (10.17.81.22) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Sat, 10 Oct 2026 16:36:28 +0800
From: Kyrie Wu <kyrie.wu@mediatek.com>
To: Tiffany Lin <tiffany.lin@mediatek.com>, Andrew-CT Chen
	<andrew-ct.chen@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Kyrie Wu <kyrie.wu@mediatek.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, Ricardo Ribalda
	<ribalda@chromium.org>, Kees Cook <kees@kernel.org>, Hans Verkuil
	<hverkuil+cisco@kernel.org>, Fei Shao <fshao@chromium.org>, Haoxiang Li
	<haoxiang_li2024@163.com>, Chen-Yu Tsai <wenst@chromium.org>, Laurent
 Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Tomasz Figa
	<tfiga@chromium.org>, Philipp Zabel <p.zabel@pengutronix.de>, Benjamin
 Gaignard <benjamin.gaignard@collabora.com>, Qianfeng Rong
	<rongqianfeng@vivo.com>, Irui Wang <irui.wang@mediatek.com>, Jacopo Mondi
	<jacopo.mondi@ideasonboard.com>, Fan Wu <fanwu01@zju.edu.cn>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
CC: Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCH v8 08/14] dt-bindings: media: mediatek,vcodec-subdev-decoder: Add MT8196
Date: Sat, 10 Oct 2026 16:36:07 +0800
Message-ID: <e756699a4be5b530338e373842365e6698ed066b.1791619743.git.kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1791619742.git.kyrie.wu@mediatek.com>
References: <cover.1791619742.git.kyrie.wu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_013637_614548_B71B28D0 
X-CRM114-Status: GOOD (  11.24  )
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

Compared to previous ICs, the MT8196 supports a 10-bit decoder
and has a decoding capability of 4K@120fps. It also supports
36-bit DRAM IOVA address and Video Power Control to optimize
bandwidth and voltage usage.

Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
Acked-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
 .../media/mediatek,vcodec-subdev-decoder.yaml | 49 ++++++++++++++++++-
 1 file changed, 48 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml b/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml
index d1d209cb..d8f25ccd 100644
--- a/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml
@@ -76,6 +76,7 @@ properties:
       - mediatek,mt8186-vcodec-dec
       - mediatek,mt8188-vcodec-dec
       - mediatek,mt8195-vcodec-dec
+      - mediatek,mt8196-vcodec-dec
 
   reg:
     minItems: 1
@@ -96,6 +97,11 @@ properties:
       The node of system control processor (SCP), using
       the remoteproc & rpmsg framework.
 
+  mediatek,vcp:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: Phandle to the Video Companion Processor (VCP) that runs the
+      video decoder firmware.
+
   "#address-cells":
     const: 2
 
@@ -163,7 +169,6 @@ required:
   - compatible
   - reg
   - iommus
-  - mediatek,scp
   - ranges
 
 if:
@@ -179,6 +184,48 @@ then:
     - interrupts
 
 allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: mediatek,mt8196-vcodec-dec
+
+    then:
+      required:
+        - mediatek,vcp
+
+      properties:
+        mediatek,scp: false
+
+      patternProperties:
+        '^video-codec@[0-9a-f]+$':
+          properties:
+            compatible:
+              enum:
+                - mediatek,mtk-vcodec-core
+                - mediatek,mtk-vcodec-lat
+
+            clock-names:
+              items:
+                - const: sel
+                - const: vdec
+                - const: lat
+                - const: top
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - mediatek,mt8192-vcodec-dec
+              - mediatek,mt8186-vcodec-dec
+              - mediatek,mt8188-vcodec-dec
+              - mediatek,mt8195-vcodec-dec
+
+    then:
+      required:
+        - mediatek,scp
+
   - if:
       properties:
         compatible:

