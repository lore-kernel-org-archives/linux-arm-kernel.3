Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D024110F3DCB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Mar 2026 05:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zr29QIJ7AC7NV0NJheGMmv67Zayu6iliKpMT7BdpY5E=; b=eUNfT6X57HjPVWEa11d08JTjai
	73miXEVC9nY0xo0T5pTJQCkMPX4ztIoVbnpCXZsGwn105lSal5Bl2Smn7uQIaISen4uvnZsU9Ef8J
	jpM1dL7s56wSULVD1J3biQ/1OnWC9WGFW+/gAWEjz0kn4wcr8rYeWLEDMtQXMKUgsgHKZsuYCUJ7A
	sjjTYOnO6d0Dwe7wUq8eOuVmAIgkHiZkQu7uRsUtmiOW7kZf4dwE9gpe4ejYBpOlJ4/ikA0vTqVvT
	jcW8Q+HSmKc7AuIbt2YrfRFW6jMDD4XtkhJRprvB17wUZ8f+s7W2duD4vpDCu3ZBNhWXpIezdwrv5
	g3nV44Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6M2c-00000008Yzy-34EP;
	Sat, 28 Mar 2026 05:16:58 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6M2L-00000008YnC-3HCf;
	Sat, 28 Mar 2026 05:16:43 +0000
X-UUID: 4d19d0502a6511f19e7563141e833ce8-20260327
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=Zr29QIJ7AC7NV0NJheGMmv67Zayu6iliKpMT7BdpY5E=;
	b=fu6sxBseL4GXSDZjnnqAnmXRSmSbf8rqDDo8cCm/QGSc2o3NTNowk48LXYaQ6TYRaXk9584Qen1WGJL2eJz1B6FnSNVWsc62rSliew45PpzAbti7J0gVwFOHgyJjfnWwBnwsJYQ5wVpO7om1D4jL6eumVtnUDkMlLWNLvpLahVQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:17b36530-06c7-4cfd-802c-7e7c49a98048,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:e7bac3a,CLOUDID:b4c039d5-060f-4ecc-9ee0-121eeeb4a682,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI
	:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 4d19d0502a6511f19e7563141e833ce8-20260327
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2126791004; Fri, 27 Mar 2026 22:16:39 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sat, 28 Mar 2026 13:16:37 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Sat, 28 Mar 2026 13:16:36 +0800
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
Subject: [PATCH v4 04/14] media: mediatek: vcodec: get share memory address
Date: Sat, 28 Mar 2026 13:16:14 +0800
Message-ID: <20260328051630.7937-5-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20260328051630.7937-1-yunfei.dong@mediatek.com>
References: <20260328051630.7937-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_221641_827045_B222913A 
X-CRM114-Status: GOOD (  16.31  )
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

There is only one share memory for vcp architecture, need to
divide it into many different functions.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 .../vcodec/common/mtk_vcodec_fw_vcp.c         | 20 ++++++++++-
 .../vcodec/common/mtk_vcodec_fw_vcp.h         | 13 +++++++
 .../vcodec/decoder/vdec/vdec_av1_req_lat_if.c | 35 ++++++++++++++++---
 .../decoder/vdec/vdec_h264_req_multi_if.c     |  6 +++-
 .../decoder/vdec/vdec_hevc_req_multi_if.c     |  7 ++--
 .../vcodec/decoder/vdec/vdec_vp9_req_lat_if.c | 22 ++++++++++--
 .../mediatek/vcodec/decoder/vdec_vpu_if.c     | 10 +++++-
 7 files changed, 102 insertions(+), 11 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.c b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.c
index 32d4e566f357..6b69ce44d4bb 100644
--- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.c
+++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.c
@@ -439,8 +439,26 @@ static unsigned int mtk_vcodec_vcp_get_venc_capa(struct mtk_vcodec_fw *fw)
 	return MTK_VENC_4K_CAPABILITY_ENABLE;
 }
 
-static void *mtk_vcodec_vcp_dm_addr(struct mtk_vcodec_fw *fw, u32 dtcm_dmem_addr)
+static void *mtk_vcodec_vcp_dm_addr(struct mtk_vcodec_fw *fw, u32 mem_type)
 {
+	unsigned char *vsi_core = fw->vcp->vsi_core_addr;
+
+	switch (mem_type) {
+	case ENCODER_MEM:
+	case VCODEC_LAT_MEM:
+		return fw->vcp->vsi_addr;
+	case VCODEC_CORE_MEM:
+		return vsi_core;
+	case VP9_FRAME_MEM:
+		return vsi_core + VCODEC_VSI_LEN;
+	case AV1_CDF_MEM:
+		return vsi_core + VCODEC_VSI_LEN + VP9_FRAME_SIZE;
+	case AV1_IQ_MEM:
+		return vsi_core + VCODEC_VSI_LEN + VP9_FRAME_SIZE + AV1_CDF_SIZE;
+	default:
+		break;
+	}
+
 	return NULL;
 }
 
diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.h b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.h
index c0632a872892..9abc9aaba9a1 100644
--- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.h
+++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.h
@@ -13,6 +13,19 @@ typedef void (*vcp_ipi_handler_t) (void *data, unsigned int len, void *priv);
 #define VCP_SHARE_BUF_SIZE 64
 
 #define VCODEC_VSI_LEN (0x2000)
+#define VP9_FRAME_SIZE (0x1000)
+#define AV1_CDF_SIZE (0xFE80)
+#define AV1_IQ_TABLE_SIZE (0x12200)
+
+/* enum mtk_vcp_mem_type - memory type for different hardware */
+enum mtk_vcp_mem_type {
+	ENCODER_MEM,
+	VCODEC_LAT_MEM,
+	VCODEC_CORE_MEM,
+	VP9_FRAME_MEM,
+	AV1_CDF_MEM,
+	AV1_IQ_MEM,
+};
 
 /* enum mtk_vcp_ipi_index - index used to separate different hardware */
 enum mtk_vcp_ipi_index {
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_lat_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_lat_if.c
index 756fbb7778b1..4932ef469594 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_lat_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_lat_if.c
@@ -765,6 +765,15 @@ static void *vdec_av1_get_ctrl_ptr(struct mtk_vcodec_dec_ctx *ctx, int id)
 	return ctrl->p_cur.p;
 }
 
+static u32 vdec_av1_get_cdf_table_addr(struct mtk_vcodec_dec_ctx *ctx,
+				       struct vdec_av1_slice_init_vsi *vsi)
+{
+	if (mtk_vcodec_fw_get_type(ctx->dev->fw_handler) == VCP)
+		return AV1_CDF_MEM;
+	else
+		return (u32)vsi->cdf_table_addr;
+}
+
 static int vdec_av1_slice_init_cdf_table(struct vdec_av1_slice_instance *instance)
 {
 	u8 *remote_cdf_table;
@@ -775,7 +784,7 @@ static int vdec_av1_slice_init_cdf_table(struct vdec_av1_slice_instance *instanc
 	ctx = instance->ctx;
 	vsi = instance->vpu.vsi;
 	remote_cdf_table = mtk_vcodec_fw_map_dm_addr(ctx->dev->fw_handler,
-						     (u32)vsi->cdf_table_addr);
+						     vdec_av1_get_cdf_table_addr(ctx, vsi));
 	if (IS_ERR(remote_cdf_table)) {
 		mtk_vdec_err(ctx, "failed to map cdf table\n");
 		return PTR_ERR(remote_cdf_table);
@@ -796,6 +805,15 @@ static int vdec_av1_slice_init_cdf_table(struct vdec_av1_slice_instance *instanc
 	return 0;
 }
 
+static u32 vdec_av1_get_iq_table_addr(struct mtk_vcodec_dec_ctx *ctx,
+				      struct vdec_av1_slice_init_vsi *vsi)
+{
+	if (mtk_vcodec_fw_get_type(ctx->dev->fw_handler) == VCP)
+		return AV1_IQ_MEM;
+	else
+		return (u32)vsi->iq_table_addr;
+}
+
 static int vdec_av1_slice_init_iq_table(struct vdec_av1_slice_instance *instance)
 {
 	u8 *remote_iq_table;
@@ -806,7 +824,7 @@ static int vdec_av1_slice_init_iq_table(struct vdec_av1_slice_instance *instance
 	ctx = instance->ctx;
 	vsi = instance->vpu.vsi;
 	remote_iq_table = mtk_vcodec_fw_map_dm_addr(ctx->dev->fw_handler,
-						    (u32)vsi->iq_table_addr);
+						    vdec_av1_get_iq_table_addr(ctx, vsi));
 	if (IS_ERR(remote_iq_table)) {
 		mtk_vdec_err(ctx, "failed to map iq table\n");
 		return PTR_ERR(remote_iq_table);
@@ -1873,6 +1891,15 @@ static int vdec_av1_slice_update_core(struct vdec_av1_slice_instance *instance,
 	return 0;
 }
 
+static u32 vdec_av1_get_core_vsi_addr(struct mtk_vcodec_dec_ctx *ctx,
+				      struct vdec_av1_slice_init_vsi *vsi)
+{
+	if (mtk_vcodec_fw_get_type(ctx->dev->fw_handler) == VCP)
+		return VCODEC_CORE_MEM;
+	else
+		return (u32)vsi->core_vsi;
+}
+
 static int vdec_av1_slice_init(struct mtk_vcodec_dec_ctx *ctx)
 {
 	struct vdec_av1_slice_instance *instance;
@@ -1904,8 +1931,8 @@ static int vdec_av1_slice_init(struct mtk_vcodec_dec_ctx *ctx)
 		goto error_vsi;
 	}
 	instance->init_vsi = vsi;
-	instance->core_vsi = mtk_vcodec_fw_map_dm_addr(ctx->dev->fw_handler, (u32)vsi->core_vsi);
-
+	instance->core_vsi = mtk_vcodec_fw_map_dm_addr(ctx->dev->fw_handler,
+						       vdec_av1_get_core_vsi_addr(ctx, vsi));
 	if (!instance->core_vsi) {
 		mtk_vdec_err(ctx, "failed to get AV1 core vsi\n");
 		ret = -EINVAL;
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c
index 69d60717181a..544d3bc06564 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c
@@ -1233,7 +1233,11 @@ static int vdec_h264_slice_init(struct mtk_vcodec_dec_ctx *ctx)
 		vsi_size = round_up(vsi_size, VCODEC_DEC_ALIGNED_64);
 		inst->vsi_ext = inst->vpu.vsi;
 		temp = (unsigned char *)inst->vsi_ext;
-		inst->vsi_core_ext = (struct vdec_h264_slice_vsi_ext *)(temp + vsi_size);
+		if (mtk_vcodec_fw_get_type(ctx->dev->fw_handler) == VCP)
+			inst->vsi_core_ext =
+				mtk_vcodec_fw_map_dm_addr(ctx->dev->fw_handler, VCODEC_CORE_MEM);
+		else
+			inst->vsi_core_ext = (struct vdec_h264_slice_vsi_ext *)(temp + vsi_size);
 
 		if (inst->ctx->dev->vdec_pdata->hw_arch == MTK_VDEC_PURE_SINGLE_CORE)
 			inst->decode = vdec_h264_slice_single_decode_ext;
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_hevc_req_multi_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_hevc_req_multi_if.c
index dd638ef44083..a5dd42987452 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_hevc_req_multi_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_hevc_req_multi_if.c
@@ -879,8 +879,11 @@ static int vdec_hevc_slice_init(struct mtk_vcodec_dec_ctx *ctx)
 
 	vsi_size = round_up(sizeof(struct vdec_hevc_slice_vsi), VCODEC_DEC_ALIGNED_64);
 	inst->vsi = inst->vpu.vsi;
-	inst->vsi_core =
-		(struct vdec_hevc_slice_vsi *)(((char *)inst->vpu.vsi) + vsi_size);
+	if (mtk_vcodec_fw_get_type(ctx->dev->fw_handler) == VCP)
+		inst->vsi_core = mtk_vcodec_fw_map_dm_addr(ctx->dev->fw_handler, VCODEC_CORE_MEM);
+	else
+		inst->vsi_core =
+			(struct vdec_hevc_slice_vsi *)(((char *)inst->vpu.vsi) + vsi_size);
 
 	inst->resolution_changed = true;
 	inst->realloc_mv_buf = true;
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
index 1f0479a8f5cb..3f4b70526754 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
@@ -500,6 +500,15 @@ static DEFINE_MUTEX(vdec_vp9_slice_frame_ctx_lock);
 
 static int vdec_vp9_slice_core_decode(struct vdec_lat_buf *lat_buf);
 
+static u32 vdec_vp9_get_frame_ctx_addr(struct mtk_vcodec_dec_ctx *ctx,
+				       struct vdec_vp9_slice_init_vsi *vsi)
+{
+	if (mtk_vcodec_fw_get_type(ctx->dev->fw_handler) == VCP)
+		return VP9_FRAME_MEM;
+	else
+		return (u32)vsi->default_frame_ctx;
+}
+
 static int vdec_vp9_slice_init_default_frame_ctx(struct vdec_vp9_slice_instance *instance)
 {
 	struct vdec_vp9_slice_frame_ctx *remote_frame_ctx;
@@ -514,7 +523,7 @@ static int vdec_vp9_slice_init_default_frame_ctx(struct vdec_vp9_slice_instance
 		return -EINVAL;
 
 	remote_frame_ctx = mtk_vcodec_fw_map_dm_addr(ctx->dev->fw_handler,
-						     (u32)vsi->default_frame_ctx);
+						     vdec_vp9_get_frame_ctx_addr(ctx, vsi));
 	if (!remote_frame_ctx) {
 		mtk_vdec_err(ctx, "failed to map default frame ctx\n");
 		return -EINVAL;
@@ -1842,6 +1851,15 @@ static int vdec_vp9_slice_update_core(struct vdec_vp9_slice_instance *instance,
 	return 0;
 }
 
+static u32 vdec_vp9_get_core_vsi_addr(struct mtk_vcodec_dec_ctx *ctx,
+				      struct vdec_vp9_slice_init_vsi *vsi)
+{
+	if (mtk_vcodec_fw_get_type(ctx->dev->fw_handler) == VCP)
+		return VCODEC_CORE_MEM;
+	else
+		return (u32)vsi->core_vsi;
+}
+
 static int vdec_vp9_slice_init(struct mtk_vcodec_dec_ctx *ctx)
 {
 	enum mtk_vcodec_fw_type fw_type = ctx->dev->fw_handler->type;
@@ -1875,7 +1893,7 @@ static int vdec_vp9_slice_init(struct mtk_vcodec_dec_ctx *ctx)
 	}
 	instance->init_vsi = vsi;
 	instance->core_vsi = mtk_vcodec_fw_map_dm_addr(ctx->dev->fw_handler,
-						       (u32)vsi->core_vsi);
+						       vdec_vp9_get_core_vsi_addr(ctx, vsi));
 	if (!instance->core_vsi) {
 		mtk_vdec_err(ctx, "failed to get VP9 core vsi\n");
 		ret = -EINVAL;
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c
index b35759a0b353..cdb673e6b477 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c
@@ -9,6 +9,14 @@
 #include "vdec_ipi_msg.h"
 #include "vdec_vpu_if.h"
 
+static u32 vpu_dec_get_vsi_addr(struct vdec_vpu_inst *vpu, const struct vdec_vpu_ipi_init_ack *msg)
+{
+	if (mtk_vcodec_fw_get_type(vpu->ctx->dev->fw_handler) == VCP)
+		return VCODEC_LAT_MEM;
+	else
+		return msg->vpu_inst_addr;
+}
+
 static void handle_init_ack_msg(const struct vdec_vpu_ipi_init_ack *msg)
 {
 	struct vdec_vpu_inst *vpu = (struct vdec_vpu_inst *)
@@ -19,7 +27,7 @@ static void handle_init_ack_msg(const struct vdec_vpu_ipi_init_ack *msg)
 	/* mapping VPU address to kernel virtual address */
 	/* the content in vsi is initialized to 0 in VPU */
 	vpu->vsi = mtk_vcodec_fw_map_dm_addr(vpu->ctx->dev->fw_handler,
-					     msg->vpu_inst_addr);
+					     vpu_dec_get_vsi_addr(vpu, msg));
 	vpu->inst_addr = msg->vpu_inst_addr;
 
 	mtk_vdec_debug(vpu->ctx, "- vpu_inst_addr = 0x%x", vpu->inst_addr);
-- 
2.45.2


