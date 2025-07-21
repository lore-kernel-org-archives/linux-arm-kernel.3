Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62132C83F25
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 11:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sImni/6N+T5NOHRu/8SX7ThFct7Brb6go8aahtLYgJk=; b=nLzF7HlpkdLVqac+yW5kaOTW2M
	MlcJEvbVKcATz7RpT/a7Y9tAqZvCXdJ/9osAcieDx/vIIbNhCDgSENEiRS/78uGBTy/XcqUv6UlGV
	gKvODVBCaDqwOiWPsYJ/qCKbiGFX+yJJqYxPlbALwuI61RKFZ3+c4M9kWeVQI0xOQ2HeB8GGIYmZk
	eu395q1m1U1s+J9TFbzdJUZbFUKOf7m515jamK8t1tC8j/z8h1YH4nmkC9i4u6GSMwTFeaRadJPT+
	Op304/pn/ATdqCJSYs4tf9tc/RwLvOXmv0I7j5aiIyERss7Zm+V2ID5gkZ/ZrrfH7Q1eQjO3zKbXT
	YUCYtt4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udp6V-0000000HC7z-3UiS;
	Mon, 21 Jul 2025 11:54:47 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udnvZ-0000000GyJ3-16GT;
	Mon, 21 Jul 2025 10:39:26 +0000
X-UUID: f6187b72661e11f09eb0dd999d3936bf-20250721
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From; bh=sImni/6N+T5NOHRu/8SX7ThFct7Brb6go8aahtLYgJk=;
	b=fCkK+DnLBcJikjywvPgxFwMv4srrc7sZstMnRwvhbycXP4R8bmOrHyl9iXz+/8Drba3zKHk4Dnd8GsMFgpxksunSvWernetjg3F5tkpkfARbMIsl1zWKurXKhFTZh28lWp/Zl99jQueuCMQ2QdympRqrc9hLAh97OjQThNYfeBI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.2,REQID:840b5af0-3645-4360-9d1a-de8e74e2b096,IP:0,UR
	L:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-25
X-CID-META: VersionHash:9eb4ff7,CLOUDID:34073d73-f565-4a89-86be-304708e7ad47,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: f6187b72661e11f09eb0dd999d3936bf-20250721
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 815973927; Mon, 21 Jul 2025 03:39:21 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Mon, 21 Jul 2025 18:39:18 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Mon, 21 Jul 2025 18:39:17 +0800
From: Kyrie Wu <kyrie.wu@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Kyrie Wu <kyrie.wu@mediatek.com>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
Subject: [PATCH v1 5/8] media: mediatek: vcodec: fix vp9 4096x2176 fail for profile2
Date: Mon, 21 Jul 2025 18:39:01 +0800
Message-ID: <20250721103905.5393-6-kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250721103905.5393-1-kyrie.wu@mediatek.com>
References: <20250721103905.5393-1-kyrie.wu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_033925_316077_52377EDA 
X-CRM114-Status: GOOD (  13.57  )
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

The dram addr of vp9 decoder tile number, which use dram mode
to set tile information, may reach to 36bits for 4096x2176.
It needs to get the highest 4bit of tile buffer address to
set tile buffer address.

Fixes: 5d418351ca8f1 ("media: mediatek: vcodec: support stateless VP9 decoding")
Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
---
 .../mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c       | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
index 04197164fb82..416d8c0c04ce 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
@@ -1140,7 +1140,10 @@ static int vdec_vp9_slice_setup_tile_buffer(struct vdec_vp9_slice_instance *inst
 			tiles->size[i][j] = size;
 			if (tiles->mi_rows[i]) {
 				*tb++ = (size << 3) + ((offset << 3) & 0x7f);
-				*tb++ = pa & ~0xf;
+				*tb = pa & ~0xf;
+				if (IS_ENABLED(CONFIG_ARCH_DMA_ADDR_T_64BIT))
+					*tb |= (pa >> 32) & 0xf;
+				tb++;
 				*tb++ = (pa << 3) & 0x7f;
 				mi_row = (tiles->mi_rows[i] - 1) & 0x1ff;
 				mi_col = (tiles->mi_cols[j] - 1) & 0x3f;
-- 
2.46.0


