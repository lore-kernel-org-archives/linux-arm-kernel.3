Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CA67D58E4F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 03:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XwLnuNJtzyKlfjAfkT08c0fRKXkLj+nKJ8UIT0tXs4g=; b=fUnC/223gQ39xReVqlkLHAKoCe
	ot39HAS2GS1YBQtxXNV7RyDQ7utJPmZPC7V+6QdhWhqUFzaoLNY9peHTnm3AStEcooKUemzb+I29I
	fTwpCjG/MQbiBhq5GU1/D5I/9nkxa22T6CtgcXIlF7X43BfXC+BH/t4Fd1vleGIRiI0vGm3mR78hQ
	PowsgPZ1c9+tK/SqG0jt/U7YgqtTIWUoet5uU0py0JW0bhUYUMAcbPD1jzfvD84yavUwB/c/dKcHf
	fafQcjZFFszDyxTHvr9hGJ0ID4T0BStSSdfxHvEpxt4QPEuopol11RGCDmXFk3Rz02IixDIzrU2xz
	ss8tz7Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwuL9-0000000CCmn-0tSW;
	Mon, 02 Mar 2026 03:53:03 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwuL5-0000000CCh3-2qxD;
	Mon, 02 Mar 2026 03:53:00 +0000
X-UUID: 4ad4015015eb11f1a16f0188aa809bee-20260301
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=XwLnuNJtzyKlfjAfkT08c0fRKXkLj+nKJ8UIT0tXs4g=;
	b=Pb5+Fb3pS0BQ64BvLTQUOZ76fZtc6o0SDYBG0DxCuhDTvn7xS4J3xty58ipssjwTWoPaSCnU6Qsi7a16r8C7Q4og55y/q47fH+sZv8y4t5DaAd2t24Axt/L2N7X3r1hr1kbYYP0rrK4dBIl2VQdOJdF/WLRkqyvh6MGzSQUcbHA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:3a50ef17-1db9-4161-b117-fc45cb88387f,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:89c9d04,CLOUDID:44c720ea-ef90-4382-9c6f-55f2a0689a6b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI
	:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 4ad4015015eb11f1a16f0188aa809bee-20260301
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <irui.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 313459254; Sun, 01 Mar 2026 20:52:54 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 2 Mar 2026 11:52:52 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Mon, 2 Mar 2026 11:52:51 +0800
From: Irui Wang <irui.wang@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	<wenst@chromium.org>, <angelogioacchino.delregno@collabora.com>,
	<nicolas.dufresne@collabora.com>, Tiffany Lin <tiffany.lin@mediatek.com>,
	kyrie wu <kyrie.wu@mediatek.com>
CC: Yunfei Dong <yunfei.dong@mediatek.com>, Maoguang Meng
	<maoguang.meng@mediatek.com>, Longfei Wang <longfei.wang@mediatek.com>, Irui
 Wang <irui.wang@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
Subject: [PATCH v5 5/6] media: dt-bindings: mediatek,vcodec-encoder: Add MT8196
Date: Mon, 2 Mar 2026 11:52:42 +0800
Message-ID: <20260302035244.8994-6-irui.wang@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20260302035244.8994-1-irui.wang@mediatek.com>
References: <20260302035244.8994-1-irui.wang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260301_195259_756678_CE2F6395 
X-CRM114-Status: GOOD (  12.52  )
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

Add support for MT8196 video encoder which uses VCP (Video Co-Processor)
for firmware management. Unlike previous platforms that use SCP/VPU, MT8196
requires VCP to load and execute the video encoding firmware, with the
encoder communicating through VCP to perform encoding operations.

Add the "mediatek,mt8196-vcodec-enc" compatible string and introduce
the "mediatek,vcp" property to reference the VCP device, which is
required for MT8196 encoder operation.

Signed-off-by: Irui Wang <irui.wang@mediatek.com>
---
 .../media/mediatek,vcodec-encoder.yaml        | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml b/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml
index ebc615584f92..72698456374a 100644
--- a/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml
@@ -24,6 +24,7 @@ properties:
               - mediatek,mt8188-vcodec-enc
               - mediatek,mt8192-vcodec-enc
               - mediatek,mt8195-vcodec-enc
+              - mediatek,mt8196-vcodec-enc
       - items:
           - const: mediatek,mt8186-vcodec-enc
           - const: mediatek,mt8183-vcodec-enc
@@ -58,6 +59,13 @@ properties:
     description:
       Describes point to scp.
 
+  mediatek,vcp:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Reference to the VCP (Video Co-Processor) device that loads and executes
+      the video encoding firmware. The encoder communicates with the firmware
+      through VCP to perform encoding operations.
+
   power-domains:
     maxItems: 1
 
@@ -76,6 +84,20 @@ required:
   - iommus
 
 allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - mediatek,mt8196-vcodec-enc
+
+    then:
+      required:
+        - mediatek,vcp
+    else:
+      properties:
+        mediatek,vcp: false
+
   - if:
       properties:
         compatible:
-- 
2.45.2


