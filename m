Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26DAFD5E120
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 03:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nXWMIIvriBk3jQUJKGGjusEbJJOv4TyYVS7K8V95l/I=; b=j4WEaVpIRZqF7Kpt4ZWMPhVV3/
	Ai3Au9HRSVNd1EBV3LKP/We20HF4/f+LnV7sBqtFCUBEIYK4fzn1OfHoSBgd8hBsGPhKDMxLNCclV
	PeQoN890Vdgqn4A3MdXBXXNbhJYHz9A6tfER9jm05NjmqXAPc7dzDEBSSI9cLSSK7bDDtaTUcMrzQ
	GcgE7huDTPBXy3Q0j/rrVkh4sf6ixKhzW+Ll7HncHG57/X2kULSyL4ZMrJq3fXdM2hs4T+Ao3vRZO
	zhtA4tRS0d3QiP7+CRMsjE0VlUnZJJKYAakt8riUZFPJTNsA3xuntmtdRuXT+P7kXpEAVpFc4R0c9
	B3OXmtzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9FsB-00000009A1k-3AzA;
	Fri, 08 Nov 2024 03:41:23 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Fje-000000098no-2rGc;
	Fri, 08 Nov 2024 03:32:35 +0000
X-UUID: 12ce97629d8211ef9048ed6ed365623b-20241107
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=nXWMIIvriBk3jQUJKGGjusEbJJOv4TyYVS7K8V95l/I=;
	b=S2ja9ELPEN3tbAfd0IMefjTwMEHSIpAye4/BxtLL7tC6ViYYyJ37rtdL1qseYHbocOjezGt9YR/eWMv7ZDaLGnf8KfjYhUFZkrQ9mZBvPq9Y2rMhsEnNu4hbEAe+wmYHNYobvjBK0KJSJdOBoodqRH+2jJJ+MPPYlq+0beuQsiM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.42,REQID:92b4d824-12cb-4386-ac8b-3b46c5952c6e,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0fcdc3,CLOUDID:ca9cbe06-6ce0-4172-9755-bd2287e50583,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 12ce97629d8211ef9048ed6ed365623b-20241107
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1455606422; Thu, 07 Nov 2024 20:32:25 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 7 Nov 2024 19:32:23 -0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 8 Nov 2024 11:32:22 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
	<nfraprado@collabora.com>, Sebastian Fricke <sebastian.fricke@collabora.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, Hans Verkuil
	<hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, Nathan Hebert <nhebert@chromium.org>
CC: Hsin-Yi Wang <hsinyi@chromium.org>, Chen-Yu Tsai <wenst@chromium.org>,
	Fritz Koenig <frkoenig@chromium.org>, Daniel Vetter <daniel@ffwll.ch>, Steve
 Cho <stevecho@chromium.org>, Yunfei Dong <yunfei.dong@mediatek.com>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v6 2/5] media: mediatek: vcodec: change flush decode order when stream off
Date: Fri, 8 Nov 2024 11:32:11 +0800
Message-ID: <20241108033219.19804-3-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241108033219.19804-1-yunfei.dong@mediatek.com>
References: <20241108033219.19804-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_193234_747371_5526498B 
X-CRM114-Status: GOOD (  16.42  )
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
 .../mediatek/vcodec/decoder/mtk_vcodec_dec.c  | 44 +++++++++----------
 1 file changed, 22 insertions(+), 22 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
index 2b787e60a1f9..fc4ee1fb7cd1 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
@@ -882,27 +882,11 @@ void vb2ops_vdec_stop_streaming(struct vb2_queue *q)
 	mtk_v4l2_vdec_dbg(3, ctx, "[%d] (%d) state=(%x) ctx->decoded_frame_cnt=%d",
 			  ctx->id, q->type, ctx->state, ctx->decoded_frame_cnt);
 
-	if (q->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
-		while ((src_buf = v4l2_m2m_src_buf_remove(ctx->m2m_ctx))) {
-			if (src_buf != &ctx->empty_flush_buf.vb) {
-				struct media_request *req =
-					src_buf->vb2_buf.req_obj.req;
-
-				if (req)
-					v4l2_ctrl_request_complete(req, &ctx->ctrl_hdl);
-				v4l2_m2m_buf_done(src_buf, VB2_BUF_STATE_ERROR);
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
 
@@ -917,8 +901,24 @@ void vb2ops_vdec_stop_streaming(struct vb2_queue *q)
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
+				if (req)
+					v4l2_ctrl_request_complete(req, &ctx->ctrl_hdl);
+				v4l2_m2m_buf_done(src_buf, VB2_BUF_STATE_ERROR);
+			}
+		}
+
+		return;
 	}
-	ctx->state = MTK_STATE_FLUSH;
 
 	while ((dst_buf = v4l2_m2m_dst_buf_remove(ctx->m2m_ctx))) {
 		vb2_set_plane_payload(&dst_buf->vb2_buf, 0, 0);
-- 
2.46.0


