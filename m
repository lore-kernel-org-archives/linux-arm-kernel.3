Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35C5AD5E124
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 03:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VbALDG+lb6sw983dnZskMXc+0uIRSnCleXv02AS+6S0=; b=UX5JruR5xaw4Grda650B+7duPx
	Zqq/6rjZIwTVHX0WxRLG0VftZYbiPMAGXZjfGiuBLHtncvMOMRD19ZXLq/snxIcui8gJcXfNGESiM
	ThJysmHMcI2kW5IJflsKpntvJ0fOP/eNv1/NtDyTpkH1CS106/M24yFbzrhzsUgq4s5cx8ezpkrFF
	s8DHJZ2dZ2ScBNSYIiy6Ls3JQp9AVoRgsXfOzX/iBRVq9MX4tJ6rPzuN4mnODndl1bpSOJ4fdIKAw
	WfCbZWxisPbhYJD8Sja+37keoJ49ebMf5ERHzD7kh67IBxE1Cv5Vh974Iq9Ch0TUOhl4f0hWRwGmV
	rAL4vV+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Fn4-000000099Oc-1Co2;
	Fri, 08 Nov 2024 03:36:06 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Fja-000000098lz-0AXI;
	Fri, 08 Nov 2024 03:32:32 +0000
X-UUID: 140ebb7a9d8211ef9048ed6ed365623b-20241107
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=VbALDG+lb6sw983dnZskMXc+0uIRSnCleXv02AS+6S0=;
	b=ee7/K76h/tMb25jZD+oxJpR31kUv4EeXEhMhBB5uMaUIQo6a1G6VzheA9Q3QmGytZQ4mem+VzMAANQ+Nxi/rRGpoCTNR3ZcGyLhI0FFtJxw88IWQCXklvezEafQZPwz0W2eZKonWEOhUQeeQMZerqefQjFILqTtOEIQBf4GNgho=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.42,REQID:5d60347c-4587-4323-af63-8f0824a30faf,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:b0fcdc3,CLOUDID:7f58b6ca-91e6-4060-9516-6ba489b4e2dc,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 140ebb7a9d8211ef9048ed6ed365623b-20241107
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 21878087; Thu, 07 Nov 2024 20:32:27 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 8 Nov 2024 11:32:25 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 8 Nov 2024 11:32:24 +0800
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
Subject: [PATCH v6 4/5] media: mediatek: vcodec: store current vb2 buffer to decode again
Date: Fri, 8 Nov 2024 11:32:13 +0800
Message-ID: <20241108033219.19804-5-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241108033219.19804-1-yunfei.dong@mediatek.com>
References: <20241108033219.19804-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_193230_114751_125C54F4 
X-CRM114-Status: GOOD (  16.07  )
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

All the src vb2 buffer are removed from ready list when STREAMOFF
capture queue, may remove a non exist vb2 buffer if lat is working
currently. The driver also need to use current vb2 buffer to decode
again to wait for enough resource when lat decode error.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 .../vcodec/decoder/mtk_vcodec_dec_drv.h       |  2 ++
 .../vcodec/decoder/mtk_vcodec_dec_stateless.c | 30 +++++++++++++++----
 2 files changed, 26 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
index 1fabe8c5b7a4..886fa385e2e6 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
@@ -155,6 +155,7 @@ struct mtk_vcodec_dec_pdata {
  * @last_decoded_picinfo: pic information get from latest decode
  * @empty_flush_buf: a fake size-0 capture buffer that indicates flush. Used
  *		     for stateful decoder.
+ * @cur_src_buffer: current vb2 buffer for the latest decode.
  * @is_flushing: set to true if flushing is in progress.
  *
  * @current_codec: current set input codec, in V4L2 pixel format
@@ -201,6 +202,7 @@ struct mtk_vcodec_dec_ctx {
 	struct work_struct decode_work;
 	struct vdec_pic_info last_decoded_picinfo;
 	struct v4l2_m2m_buffer empty_flush_buf;
+	struct vb2_v4l2_buffer *cur_src_buffer;
 	bool is_flushing;
 
 	u32 current_codec;
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
index 750f98c1226d..3f94654ebc73 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
@@ -324,7 +324,8 @@ static void mtk_vdec_worker(struct work_struct *work)
 	struct mtk_vcodec_dec_ctx *ctx =
 		container_of(work, struct mtk_vcodec_dec_ctx, decode_work);
 	struct mtk_vcodec_dec_dev *dev = ctx->dev;
-	struct vb2_v4l2_buffer *vb2_v4l2_src;
+	struct vb2_v4l2_buffer *vb2_v4l2_src = ctx->cur_src_buffer;
+	struct vb2_v4l2_buffer *vb2_v4l2_dst;
 	struct vb2_buffer *vb2_src;
 	struct mtk_vcodec_mem *bs_src;
 	struct mtk_video_dec_buf *dec_buf_src;
@@ -333,7 +334,7 @@ static void mtk_vdec_worker(struct work_struct *work)
 	bool res_chg = false;
 	int ret;
 
-	vb2_v4l2_src = v4l2_m2m_next_src_buf(ctx->m2m_ctx);
+	vb2_v4l2_src = vb2_v4l2_src ? vb2_v4l2_src : v4l2_m2m_src_buf_remove(ctx->m2m_ctx);
 	if (!vb2_v4l2_src) {
 		v4l2_m2m_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx);
 		mtk_v4l2_vdec_dbg(1, ctx, "[%d] no available source buffer", ctx->id);
@@ -385,12 +386,29 @@ static void mtk_vdec_worker(struct work_struct *work)
 	    ctx->current_codec == V4L2_PIX_FMT_VP8_FRAME) {
 		if (src_buf_req)
 			v4l2_ctrl_request_complete(src_buf_req, &ctx->ctrl_hdl);
-		v4l2_m2m_buf_done_and_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx, state);
-	} else {
-		if (ret != -EAGAIN)
-			v4l2_m2m_src_buf_remove(ctx->m2m_ctx);
+		vb2_v4l2_dst = v4l2_m2m_dst_buf_remove(ctx->m2m_ctx);
+		v4l2_m2m_buf_done(vb2_v4l2_dst, state);
+		v4l2_m2m_buf_done(vb2_v4l2_src, state);
+
 		v4l2_m2m_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx);
+		return;
 	}
+
+	/*
+	 * If each codec return -EAGAIN to decode again, need to backup current source
+	 * buffer, then the driver will get this buffer next time.
+	 *
+	 * If each codec decode error, must to set buffer done with error status for
+	 * this buffer have been removed from ready list.
+	 */
+	ctx->cur_src_buffer = (ret != -EAGAIN) ? NULL : vb2_v4l2_src;
+	if (ret && ret != -EAGAIN) {
+		if (src_buf_req)
+			v4l2_ctrl_request_complete(src_buf_req, &ctx->ctrl_hdl);
+		v4l2_m2m_buf_done(vb2_v4l2_src, state);
+	}
+
+	v4l2_m2m_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx);
 }
 
 static void vb2ops_vdec_stateless_buf_queue(struct vb2_buffer *vb)
-- 
2.46.0


