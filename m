Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5B09D68BE1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 16 Nov 2024 03:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XAFnqKkSwcF2bp8hcz0pbKeIV30/71cmFE96nXVmuJo=; b=qq3fb6IjoFfiBpjm6tPmOgxgOj
	wBt9iP2RWEaR8N6AgH/2X0p/XXG6YLQUUHfmSg0m24kFOyoJyvDl19y1hYrceOGR3/i3KmLinkSOk
	cTgq1jxwyYfUZ3Da75KtkXUMB4ycxVITtfR5nHDdbYOnUi6qIdW1llThzUI4Rohi7N00n/3Zne0we
	mOuJ96JS7QouFKYEknKXwb240aXLiOP0SGO+clxwIeN2p8cnh0o7DcPcNHgpvwX9WFJeLbFETfes5
	hKjGXBD0wMcEjBtAqcM6WS6Q3W0XGUWGzgrHyGSNK1J66ppq6jcZZ0CacaeDw6Qaz6sT193hYOyqH
	d8pyAOxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tC9Rn-00000004seW-2MLs;
	Sat, 16 Nov 2024 03:26:07 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tC9JZ-00000004r9N-1W8v;
	Sat, 16 Nov 2024 03:17:38 +0000
X-UUID: 5212d382a3c911ef9048ed6ed365623b-20241115
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=XAFnqKkSwcF2bp8hcz0pbKeIV30/71cmFE96nXVmuJo=;
	b=i8Yrs08il9zHxGXEZAMSEWq/+BpLs8D8V8JGJxaS0VKL8hR+9kzTT/jWAmPdjgLaeX/vbrRoKPjUKmxigCO6rmv0zv137bg8H7I49VIu74WCh1eUqsFE13XUy1ULB4vWfia0mIwsWJUSGkTeeMRG+DSHWqqftoqpATkQ4ctPYNA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.43,REQID:b2b53400-7c3b-4b9b-b5b3-997f1ba6f03e,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:ce19b8a,CLOUDID:92edb85c-f18b-4d56-b49c-93279ee09144,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0,EDM:-3,IP
	:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,
	LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 5212d382a3c911ef9048ed6ed365623b-20241115
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1799958950; Fri, 15 Nov 2024 20:17:33 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Sat, 16 Nov 2024 11:17:28 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Sat, 16 Nov 2024 11:17:27 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
	<nfraprado@collabora.com>, Sebastian Fricke <sebastian.fricke@collabora.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, Hans Verkuil
	<hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, Nathan Hebert <nhebert@chromium.org>,
	Daniel Almeida <daniel.almeida@collabora.com>
CC: Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
	Daniel Vetter <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>, "Yunfei
 Dong" <yunfei.dong@mediatek.com>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v7 3/5] media: mediatek: vcodec: remove media request checking
Date: Sat, 16 Nov 2024 11:17:17 +0800
Message-ID: <20241116031724.15694-4-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241116031724.15694-1-yunfei.dong@mediatek.com>
References: <20241116031724.15694-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--10.511500-8.000000
X-TMASE-MatchedRID: s1WpmjjDH4dmcP5F4hatbcnlbo5l7mGFBLtx+64GFanjsTquy0JRi4ma
	Qfsqx1XAWKuGHPyQzf64VxGFQBNJeCY0eULsNBXlHPYwOJi6PLlu95mt47DzNlfXgfL55inv3oz
	JRX7b4NmFKg32b+87J0iJiJhvpf+911/bObp3yCgSEYfcJF0pRX0tCKdnhB589yM15V5aWpj6C0
	ePs7A07SQvY0ueKrc1jwY/IrEBx9e6DRg6XX9fFprHtTGfESU7RckC8ZNwvw0=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--10.511500-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 33CBB420F46111ACF58A0B40F4B635AB9D396A27EC0949270CFDDDFE1F29847D2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241115_191737_628327_1699222B 
X-CRM114-Status: GOOD (  10.53  )
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

Setting the buffer status to error if the media request of
each source buffer is NULL, then schedule the work to process
again in case of access NULL pointer.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 .../mediatek/vcodec/decoder/mtk_vcodec_dec.c    |  6 ++----
 .../vcodec/decoder/mtk_vcodec_dec_stateless.c   | 17 +++++------------
 2 files changed, 7 insertions(+), 16 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
index 2ccdffbadcda..b16572d5cf54 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
@@ -912,10 +912,8 @@ void vb2ops_vdec_stop_streaming(struct vb2_queue *q)
 					src_buf->vb2_buf.req_obj.req;
 
 				v4l2_m2m_buf_done(src_buf, VB2_BUF_STATE_ERROR);
-				if (req) {
-					v4l2_ctrl_request_complete(req, &ctx->ctrl_hdl);
-					media_request_manual_complete(req);
-				}
+				v4l2_ctrl_request_complete(req, &ctx->ctrl_hdl);
+				media_request_manual_complete(req);
 			}
 		}
 		return;
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
index 1e11c08d708f..dd6ee694382e 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
@@ -264,10 +264,8 @@ static void mtk_vdec_stateless_cap_to_disp(struct mtk_vcodec_dec_ctx *ctx, int e
 		mtk_v4l2_vdec_err(ctx, "dst buffer is NULL");
 	}
 
-	if (src_buf_req) {
-		v4l2_ctrl_request_complete(src_buf_req, &ctx->ctrl_hdl);
-		media_request_manual_complete(src_buf_req);
-	}
+	v4l2_ctrl_request_complete(src_buf_req, &ctx->ctrl_hdl);
+	media_request_manual_complete(src_buf_req);
 }
 
 static struct vdec_fb *vdec_get_cap_buffer(struct mtk_vcodec_dec_ctx *ctx)
@@ -356,10 +354,7 @@ static void mtk_vdec_worker(struct work_struct *work)
 			  ctx->id, bs_src->va, &bs_src->dma_addr, bs_src->size, vb2_src);
 	/* Apply request controls. */
 	src_buf_req = vb2_src->req_obj.req;
-	if (src_buf_req)
-		v4l2_ctrl_request_setup(src_buf_req, &ctx->ctrl_hdl);
-	else
-		mtk_v4l2_vdec_err(ctx, "vb2 buffer media request is NULL");
+	v4l2_ctrl_request_setup(src_buf_req, &ctx->ctrl_hdl);
 
 	ret = vdec_if_decode(ctx, bs_src, NULL, &res_chg);
 	if (ret && ret != -EAGAIN) {
@@ -378,10 +373,8 @@ static void mtk_vdec_worker(struct work_struct *work)
 	if (!IS_VDEC_LAT_ARCH(dev->vdec_pdata->hw_arch) ||
 	    ctx->current_codec == V4L2_PIX_FMT_VP8_FRAME) {
 		v4l2_m2m_buf_done_and_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx, state);
-		if (src_buf_req) {
-			v4l2_ctrl_request_complete(src_buf_req, &ctx->ctrl_hdl);
-			media_request_manual_complete(src_buf_req);
-		}
+		v4l2_ctrl_request_complete(src_buf_req, &ctx->ctrl_hdl);
+		media_request_manual_complete(src_buf_req);
 	} else {
 		if (ret != -EAGAIN) {
 			v4l2_m2m_src_buf_remove(ctx->m2m_ctx);
-- 
2.46.0


