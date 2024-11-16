Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82014D68BE3
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 16 Nov 2024 03:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HHbwP/c82/8ptLWsKio1TU3AIOhVLAz+mmbbLDs6714=; b=jsKxgIWlVduDhjJsSyACLfuNck
	Y5joUQwA1vxxMHMctUcFxxvzz0QlCEVlvKFW/R5hvpATCDgRbe6FuHG32mMkcF2nWiehOOayfkBmg
	AmiaVQiWnzGybAPpe1Deg9AiHV0rd4gZPxhYeM1CUIRan1dkHRfc3ikNQZJjwez1W99B5LIAPNu9g
	X7fDi9vvCQbfDOjBO8UQkAxGHd7KnbXY8cITEw+ehfYGzibVsKNpV4dB8fcqxtq4yI0ZZBAu5mbC8
	l4dLrJVh7/4T7bIWZgzYPTeRmXYAwNnyPZRr9h20acBFMhmqIbROF/NAXuwkTv/CPVybvGV/hDVOR
	4MfE/++w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tC9QZ-00000004sVh-2Q5M;
	Sat, 16 Nov 2024 03:24:51 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tC9JY-00000004r9Q-1NZk;
	Sat, 16 Nov 2024 03:17:37 +0000
X-UUID: 503664d4a3c911ef82ff63e91e7eb18c-20241115
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=HHbwP/c82/8ptLWsKio1TU3AIOhVLAz+mmbbLDs6714=;
	b=rTm0T9LzBf43c9bxCc5czBpXBwBDLaQ/OvNbOsIovwAZWaBtcFC76QaWX7uBbol7mGAtAznl8K28vQvscV5/D5CXgSnUzHxk13aY/jZhIOJ10b7O89b+XyPcVgsbe9a2Q5qf6PDQ1lX8snZTS43k50iPshCKTCiiXXr9Kx7NtO4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.43,REQID:7a66b00c-741b-44fc-8b10-c96ced034a14,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:ce19b8a,CLOUDID:6bedb85c-f18b-4d56-b49c-93279ee09144,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0,EDM:-3,IP
	:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,
	LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 503664d4a3c911ef82ff63e91e7eb18c-20241115
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 988887159; Fri, 15 Nov 2024 20:17:30 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Sat, 16 Nov 2024 11:17:27 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Sat, 16 Nov 2024 11:17:26 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
	<nfraprado@collabora.com>, Sebastian Fricke <sebastian.fricke@collabora.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, Hans Verkuil
	<hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, Nathan Hebert <nhebert@chromium.org>,
	Daniel Almeida <daniel.almeida@collabora.com>
CC: Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
	Daniel Vetter <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>, Yunfei
 Dong <yunfei.dong@mediatek.com>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v7 2/5] media: mediatek: vcodec: change flush decode order when stream off
Date: Sat, 16 Nov 2024 11:17:16 +0800
Message-ID: <20241116031724.15694-3-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241116031724.15694-1-yunfei.dong@mediatek.com>
References: <20241116031724.15694-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241115_191736_469032_B9D5387D 
X-CRM114-Status: GOOD (  15.31  )
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

The driver status is set to flush when flush_decoder is called.
The order of STREAMOFF ioctl for OUTPUT and CAPTURE are randomly.
If flush_decoder is called in STREAMOFF for capture queue always,
leading to get NULL dst buffer when calling STREAMOFF for output
queue before capture queue.

Need to flush decoder when stream off no matter output or capture
queue is called firstly.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 .../mediatek/vcodec/decoder/mtk_vcodec_dec.c  | 47 +++++++++----------
 1 file changed, 23 insertions(+), 24 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
index d2146724f5de..2ccdffbadcda 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
@@ -882,29 +882,11 @@ void vb2ops_vdec_stop_streaming(struct vb2_queue *q)
 	mtk_v4l2_vdec_dbg(3, ctx, "[%d] (%d) state=(%x) ctx->decoded_frame_cnt=%d",
 			  ctx->id, q->type, ctx->state, ctx->decoded_frame_cnt);
 
-	if (q->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
-		while ((src_buf = v4l2_m2m_src_buf_remove(ctx->m2m_ctx))) {
-			if (src_buf != &ctx->empty_flush_buf.vb) {
-				struct media_request *req =
-					src_buf->vb2_buf.req_obj.req;
-
-				v4l2_m2m_buf_done(src_buf, VB2_BUF_STATE_ERROR);
-				if (req) {
-					v4l2_ctrl_request_complete(req, &ctx->ctrl_hdl);
-					media_request_manual_complete(req);
-				}
-			}
-		}
-		return;
-	}
-
-	if (ctx->state >= MTK_STATE_HEADER) {
-
-		/* Until STREAMOFF is called on the CAPTURE queue
-		 * (acknowledging the event), the driver operates
-		 * as if the resolution hasn't changed yet, i.e.
-		 * VIDIOC_G_FMT< etc. return previous resolution.
-		 * So we update picinfo here
+	if (ctx->state >= MTK_STATE_HEADER && ctx->state != MTK_STATE_FLUSH) {
+		/*
+		 * The resolution hasn't been changed when STREAMOFF is called.
+		 * Update the picinfo here with previous resolution if VIDIOC_G_FMT
+		 * is called.
 		 */
 		ctx->picinfo = ctx->last_decoded_picinfo;
 
@@ -919,8 +901,25 @@ void vb2ops_vdec_stop_streaming(struct vb2_queue *q)
 		ret = ctx->dev->vdec_pdata->flush_decoder(ctx);
 		if (ret)
 			mtk_v4l2_vdec_err(ctx, "DecodeFinal failed, ret=%d", ret);
+
+		ctx->state = MTK_STATE_FLUSH;
+	}
+
+	if (q->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
+		while ((src_buf = v4l2_m2m_src_buf_remove(ctx->m2m_ctx))) {
+			if (src_buf != &ctx->empty_flush_buf.vb) {
+				struct media_request *req =
+					src_buf->vb2_buf.req_obj.req;
+
+				v4l2_m2m_buf_done(src_buf, VB2_BUF_STATE_ERROR);
+				if (req) {
+					v4l2_ctrl_request_complete(req, &ctx->ctrl_hdl);
+					media_request_manual_complete(req);
+				}
+			}
+		}
+		return;
 	}
-	ctx->state = MTK_STATE_FLUSH;
 
 	while ((dst_buf = v4l2_m2m_dst_buf_remove(ctx->m2m_ctx))) {
 		vb2_set_plane_payload(&dst_buf->vb2_buf, 0, 0);
-- 
2.46.0


