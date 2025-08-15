Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 683A4CA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 09:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tQBsvhrt8U4jRDvYim4ISpMoYGz+FkkDdT4pQKZQR+Q=; b=JbVRO2JHp1UeSmBbPiI0DFa5V+
	YoD0KuOQiqbRVEvn/2ts0MSxUw5/4+LluzO+ABXIV+kclEn/NRKT/d/DwI9HdPsfrJlReGXmUB54r
	rpeAIH82RWrr5mj0zDMuVSZEpNWh6PJA3YAm5Mk94yB6q/IS2z31sMr1T26e8GPgNNNBTAiej6xyR
	ZfsGPxPqiCh71hpJcAub5Wwvha4rQClMbSOsMwzk2H+DU60HBIRLTfPikAP6fKFhDnzCC7WAt+zsP
	mfs/hOPtG2h9NGHoGrFNndPfrc99FU6YnadIkYHV6oJrBx6ChbBVCHyXDk/oitxVGwe5g0GFB+m0G
	sJEcB8zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umr9p-000000027lK-3BtR;
	Fri, 15 Aug 2025 09:55:33 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umqBO-00000001v54-4BD0;
	Fri, 15 Aug 2025 08:53:08 +0000
X-UUID: 411d176479b511f09f706fa2197c6ceb-20250815
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=tQBsvhrt8U4jRDvYim4ISpMoYGz+FkkDdT4pQKZQR+Q=;
	b=mwR3SlyUWLa9frrB5G5GRD0VrfB4rLH3Hi0lcN1UDUA1g+LfjUpwWU6pKk2/HJ3CHh7bUATKBQz3fB2s8oXY4TwqZlc+ffc2QIiz3qRaHcZbFfZMmkKeXwdMQlxb5sk284uU4w7Vmk0Rg6ZG7sv2fBhrDoMdaDES0gk0K+uLBUk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.3,REQID:e575921b-f286-4423-b1c1-af39808d7631,IP:0,UR
	L:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:-5
X-CID-META: VersionHash:f1326cf,CLOUDID:a384416d-c2f4-47a6-876f-59a53e9ecc6e,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:-5,Content:0|15|50,EDM:
	-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 411d176479b511f09f706fa2197c6ceb-20250815
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw01.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 771531004; Fri, 15 Aug 2025 01:53:03 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Fri, 15 Aug 2025 16:53:00 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Fri, 15 Aug 2025 16:53:00 +0800
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
Subject: [PATCH v2 14/14] media: mediatek: decoder: support av1 extend vsi
Date: Fri, 15 Aug 2025 16:52:27 +0800
Message-ID: <20250815085232.30240-15-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250815085232.30240-1-yunfei.dong@mediatek.com>
References: <20250815085232.30240-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_015307_044588_87710733 
X-CRM114-Status: GOOD (  14.63  )
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

The driver can't access tile buffer address for extend architecture,
set tile group information in vcp and share it with kernel.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 .../vcodec/decoder/vdec/vdec_av1_req_lat_if.c | 46 ++++++++++++++++---
 1 file changed, 39 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_lat_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_lat_if.c
index 6070485e26c4..43541faeea87 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_lat_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_lat_if.c
@@ -25,6 +25,8 @@
 
 #define AV1_INVALID_IDX			-1
 
+#define AV1_NON_EXT_VSI_SIZE		0xD50
+
 #define AV1_DIV_ROUND_UP_POW2(value, n)			\
 ({							\
 	typeof(n) _n  = n;				\
@@ -641,6 +643,8 @@ struct vdec_av1_slice_fb {
  * @frame:		current frame info
  * @state:		status after decode done
  * @cur_lst_tile_id:	tile id for large scale
+ * @tile_group:	tile group info
+ * @reserved:		reserved
  */
 struct vdec_av1_slice_vsi {
 	/* lat */
@@ -665,6 +669,8 @@ struct vdec_av1_slice_vsi {
 	struct vdec_av1_slice_frame frame;
 	struct vdec_av1_slice_state state;
 	u32 cur_lst_tile_id;
+	struct vdec_av1_slice_tile_group tile_group;
+	unsigned int reserved[4];
 };
 
 /**
@@ -1394,13 +1400,18 @@ static int vdec_av1_slice_setup_tile_group(struct vdec_av1_slice_instance *insta
 					   struct vdec_av1_slice_vsi *vsi)
 {
 	struct v4l2_ctrl_av1_tile_group_entry *ctrl_tge;
-	struct vdec_av1_slice_tile_group *tile_group = &instance->tile_group;
+	struct vdec_av1_slice_tile_group *tile_group;
 	struct vdec_av1_slice_uncompressed_header *uh = &vsi->frame.uh;
 	struct vdec_av1_slice_tile *tile = &uh->tile;
 	struct v4l2_ctrl *ctrl;
 	u32 tge_size;
 	int i;
 
+	if (IS_VDEC_SUPPORT_EXT(instance->ctx->dev->dec_capability))
+		tile_group = &vsi->tile_group;
+	else
+		tile_group = &instance->tile_group;
+
 	ctrl = v4l2_ctrl_find(&instance->ctx->ctrl_hdl, V4L2_CID_STATELESS_AV1_TILE_GROUP_ENTRY);
 	if (!ctrl)
 		return -EINVAL;
@@ -1601,6 +1612,7 @@ static void vdec_av1_slice_setup_lat_buffer(struct vdec_av1_slice_instance *inst
 					    struct vdec_lat_buf *lat_buf)
 {
 	struct vdec_av1_slice_work_buffer *work_buffer;
+	u32 num_tiles;
 	int i;
 
 	vsi->bs.dma_addr = bs->dma_addr;
@@ -1635,12 +1647,18 @@ static void vdec_av1_slice_setup_lat_buffer(struct vdec_av1_slice_instance *inst
 
 	vsi->tile.buf = instance->tile.dma_addr;
 	vsi->tile.size = instance->tile.size;
-	memcpy(lat_buf->tile_addr.va, instance->tile.va, 64 * instance->tile_group.num_tiles);
 
 	vsi->cdf_table.buf = instance->cdf_table.dma_addr;
 	vsi->cdf_table.size = instance->cdf_table.size;
 	vsi->iq_table.buf = instance->iq_table.dma_addr;
 	vsi->iq_table.size = instance->iq_table.size;
+
+	if (IS_VDEC_SUPPORT_EXT(instance->ctx->dev->dec_capability))
+		num_tiles = vsi->tile_group.num_tiles;
+	else
+		num_tiles = instance->tile_group.num_tiles;
+
+	memcpy(lat_buf->tile_addr.va, instance->tile.va, 64 * num_tiles);
 }
 
 static void vdec_av1_slice_setup_seg_buffer(struct vdec_av1_slice_instance *instance,
@@ -1663,7 +1681,7 @@ static void vdec_av1_slice_setup_tile_buffer(struct vdec_av1_slice_instance *ins
 					     struct vdec_av1_slice_vsi *vsi,
 					     struct mtk_vcodec_mem *bs)
 {
-	struct vdec_av1_slice_tile_group *tile_group = &instance->tile_group;
+	struct vdec_av1_slice_tile_group *tile_group;
 	struct vdec_av1_slice_uncompressed_header *uh = &vsi->frame.uh;
 	struct vdec_av1_slice_tile *tile = &uh->tile;
 	u32 tile_num, tile_row, tile_col;
@@ -1674,6 +1692,11 @@ static void vdec_av1_slice_setup_tile_buffer(struct vdec_av1_slice_instance *ins
 	u32 *tile_info_buf = instance->tile.va;
 	u64 pa = (u64)bs->dma_addr;
 
+	if (IS_VDEC_SUPPORT_EXT(instance->ctx->dev->dec_capability))
+		tile_group = &vsi->tile_group;
+	else
+		tile_group = &instance->tile_group;
+
 	if (uh->disable_cdf_update == 0)
 		allow_update_cdf = 1;
 
@@ -1887,7 +1910,7 @@ static int vdec_av1_slice_init(struct mtk_vcodec_dec_ctx *ctx)
 {
 	struct vdec_av1_slice_instance *instance;
 	struct vdec_av1_slice_init_vsi *vsi;
-	int ret;
+	int ret, vsi_size = AV1_NON_EXT_VSI_SIZE;
 
 	instance = kzalloc(sizeof(*instance), GFP_KERNEL);
 	if (!instance)
@@ -1926,9 +1949,18 @@ static int vdec_av1_slice_init(struct mtk_vcodec_dec_ctx *ctx)
 		goto error_vsi;
 	}
 
-	if (vsi->vsi_size != sizeof(struct vdec_av1_slice_vsi))
-		mtk_vdec_err(ctx, "remote vsi size 0x%x mismatch! expected: 0x%zx\n",
-			     vsi->vsi_size, sizeof(struct vdec_av1_slice_vsi));
+	if (IS_VDEC_SUPPORT_EXT(ctx->dev->dec_capability)) {
+		vsi_size = sizeof(struct vdec_av1_slice_vsi);
+		vsi->iq_table_size = AV1_IQ_TABLE_SIZE;
+		vsi->cdf_table_size = AV1_CDF_SIZE;
+	}
+
+	if (vsi->vsi_size != vsi_size) {
+		mtk_vdec_err(ctx, "remote vsi size 0x%x mismatch! expected: 0x%x\n",
+			     vsi->vsi_size, vsi_size);
+		ret = -EINVAL;
+		goto error_vsi;
+	}
 
 	instance->irq_enabled = 1;
 	instance->inneracing_mode = IS_VDEC_INNER_RACING(instance->ctx->dev->dec_capability);
-- 
2.45.2


