Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B1E2C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jul 2025 07:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dkQUz9omaIloVa64s9phQV1SIkeACbbWCC29GfBqFac=; b=WsJyDfjA8Dw5GVHSp4RBOrZS6Q
	W74FmLWbS/o+mFmAXecqBUHPIFKdWz3qVKBzfA6rSXm5d2PKoauVw2Mu+ApbrxuPXAUjV+YEYo+fW
	2VT8L/9BExeiuIHAwq2J9T6ihyiVXTmLu7o93LVD6qoMOfzw4ylzdBO3r59QmZpeK8XuU+3Xi3zTP
	OGts+b1SkTbr5OX4mbSMw3BC8vaVRlC7EByJT4TSLrLi1Wy7SO+egXp/TTLrmIr5UWABF8PE1nCxf
	0vikwIAZl4LNTVfnOt+a99DhKXLsTrSsg/DnFcf4nIgf88Zeuex7d4ICN07ZhClcJJRvlS/J9eMDd
	C4jU92Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubwQB-00000006ztO-0gA8;
	Wed, 16 Jul 2025 07:19:19 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubwM0-00000006yxG-3E8D;
	Wed, 16 Jul 2025 07:15:01 +0000
X-UUID: 931db39c621411f09eb0dd999d3936bf-20250716
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=dkQUz9omaIloVa64s9phQV1SIkeACbbWCC29GfBqFac=;
	b=Cw/LudKlLnF9vTEv74+HzBJ5areiOSp4/QJH6cY+VTjGzID2xm5IGIM6qtSB1p+f3oPBSTshv1Hc+YBrA1TPh/8S6T8KhnG56U9dwHFGWnPAznPIetdynDjSLE1QJsjbcxeSeL59BwS8DCQ09154yji5dSZPuYm1CZrsotH0u4c=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.2,REQID:8b37489b-a3fc-48ed-8830-a247d42ca78f,IP:0,UR
	L:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-25
X-CID-META: VersionHash:9eb4ff7,CLOUDID:220942d8-b768-4ffb-8a44-cd8427608ba6,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 931db39c621411f09eb0dd999d3936bf-20250716
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
	(envelope-from <irui.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1358823938; Wed, 16 Jul 2025 00:14:55 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Wed, 16 Jul 2025 15:14:51 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Wed, 16 Jul 2025 15:14:51 +0800
From: Irui Wang <irui.wang@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>, <nicolas.dufresne@collabora.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	Yunfei Dong <yunfei.dong@mediatek.com>, Longfei Wang
	<longfei.wang@mediatek.com>, Irui Wang <irui.wang@mediatek.com>
Subject: [PATCH v2] media: mediatek: encoder: Fix uninitialized scalar variable issue
Date: Wed, 16 Jul 2025 15:14:50 +0800
Message-ID: <20250716071450.8214-1-irui.wang@mediatek.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_001500_844802_DB9E7114 
X-CRM114-Status: GOOD (  14.10  )
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

UNINIT checker finds some instances of variables that are used
without being initialized, for example using the uninitialized
value enc_result.is_key_frm can result in unpredictable behavior,
so initialize these variables after declaring.

Fixes: 4e855a6efa54 ("[media] vcodec: mediatek: Add Mediatek V4L2 Video Encoder Driver")

Signed-off-by: Irui Wang <irui.wang@mediatek.com>
---
v2:
 - Add Fixes tag, update commit message
 - Remove unnecessary memset
 - Move memset to before the first usage
---
 .../media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c   | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c
index a01dc25a7699..3065f3e66336 100644
--- a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c
+++ b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c
@@ -865,7 +865,7 @@ static void vb2ops_venc_buf_queue(struct vb2_buffer *vb)
 static int vb2ops_venc_start_streaming(struct vb2_queue *q, unsigned int count)
 {
 	struct mtk_vcodec_enc_ctx *ctx = vb2_get_drv_priv(q);
-	struct venc_enc_param param;
+	struct venc_enc_param param = { 0 };
 	int ret;
 	int i;
 
@@ -1036,6 +1036,7 @@ static int mtk_venc_encode_header(void *priv)
 			  ctx->id, dst_buf->vb2_buf.index, bs_buf.va,
 			  (u64)bs_buf.dma_addr, bs_buf.size);
 
+	memset(&enc_result, 0, sizeof(enc_result));
 	ret = venc_if_encode(ctx,
 			VENC_START_OPT_ENCODE_SEQUENCE_HEADER,
 			NULL, &bs_buf, &enc_result);
@@ -1185,6 +1186,7 @@ static void mtk_venc_worker(struct work_struct *work)
 			  (u64)frm_buf.fb_addr[1].dma_addr, frm_buf.fb_addr[1].size,
 			  (u64)frm_buf.fb_addr[2].dma_addr, frm_buf.fb_addr[2].size);
 
+	memset(&enc_result, 0, sizeof(enc_result));
 	ret = venc_if_encode(ctx, VENC_START_OPT_ENCODE_FRAME,
 			     &frm_buf, &bs_buf, &enc_result);
 
-- 
2.46.0


