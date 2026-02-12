Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34E0CEB48F2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 10:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ETVfqfmP4dLo67UFVgL8iHJ8qPdamPbjvNHPQneCnRM=; b=xTZoUKC2mjRMGwLoEwZGRQKZcS
	lNpLYPjq7MmEqoHGjplLovVz6RvvOUDF05PE1r5Au4Ox3aIvUHUB4SQGQTuGSTrDdRKdXLcS0DWjG
	0XyAv/p1534ssZuMQB/YSpFCyT01KZwWy1YOxIaM5nB2DuiRmBLF8/mbNHVFukUK3Eqq+nVzGffdV
	GK5gbV1v4h91QKJEgk68kxmlKRwzThwpf542ypxFNDy7QDc9OQtAri2W1ftHQo71gV4D0jOPpxLGx
	M4EM6RuDWURUnqe7xCi/xIHJEml1g7t5h2Ec/2o8pD9YuL5WcUKpi6DYKnX9RJ61H016gptiyWF2X
	XqM1DFsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqTVp-00000001sk8-0QNI;
	Thu, 12 Feb 2026 10:01:29 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqTVi-00000001sdB-0eYK;
	Thu, 12 Feb 2026 10:01:23 +0000
X-UUID: c5cf965807f911f1a16f0188aa809bee-20260212
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=ETVfqfmP4dLo67UFVgL8iHJ8qPdamPbjvNHPQneCnRM=;
	b=VnHX1oDUOAFf2cCicMR6Bg+p2XNlYrMLl3vRk1kyHj2u+VJ+FWQz5hki/dV5tw8fWr7D3EnDbi2ZrE1hl+bSTh5jELESUs/zTILRz5pSafH7f0GCNgQMqMx0JfqCbFJ+9g7oUlHCBqCwaP9I8uNiAbA0JUFOKn5fE+u3ov8U97w=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:4d3a5899-09d2-4570-8ab6-8e92e96e7abe,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:89c9d04,CLOUDID:910be27a-8c8a-4fc4-88c0-3556e7711556,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI
	:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: c5cf965807f911f1a16f0188aa809bee-20260212
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <irui.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1423155202; Thu, 12 Feb 2026 03:01:17 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 12 Feb 2026 18:01:14 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Thu, 12 Feb 2026 18:01:13 +0800
From: Irui Wang <irui.wang@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	<wenst@chromium.org>, <angelogioacchino.delregno@collabora.com>,
	<nicolas.dufresne@collabora.com>, <sebastian.fricke@collabora.com>, Tiffany
 Lin <tiffany.lin@mediatek.com>, kyrie wu <kyrie.wu@mediatek.com>
CC: Yunfei Dong <yunfei.dong@mediatek.com>, Maoguang Meng
	<maoguang.meng@mediatek.com>, Longfei Wang <longfei.wang@mediatek.com>, Irui
 Wang <irui.wang@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
Subject: [PATCH v4 2/6] media: mediatek: encoder: Add support for common firmware interface
Date: Thu, 12 Feb 2026 18:00:59 +0800
Message-ID: <20260212100104.11863-3-irui.wang@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20260212100104.11863-1-irui.wang@mediatek.com>
References: <20260212100104.11863-1-irui.wang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_020122_212090_BB954DD1 
X-CRM114-Status: GOOD (  22.75  )
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

The existing encoder firmware interface implied just one type of codec:
H.264. Future encoders may support additional codecs; however adding
entire sets of interfaces for them is not scalable.

Instead, a new "common" firmware interface is defined for non codec
specific messages. The new messages encapsulate the old ones for
backward compatibility.

This patch adds support for these new messages.

Signed-off-by: Irui Wang <irui.wang@mediatek.com>
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
 .../vcodec/encoder/mtk_vcodec_enc_drv.h       |  3 ++
 .../mediatek/vcodec/encoder/venc_drv_if.c     |  3 +-
 .../mediatek/vcodec/encoder/venc_ipi_msg.h    | 26 +++++++++++++++
 .../mediatek/vcodec/encoder/venc_vpu_if.c     | 33 ++++++++++++-------
 4 files changed, 52 insertions(+), 13 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.h b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.h
index 53369adc083b..0529564027c4 100644
--- a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.h
+++ b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.h
@@ -16,6 +16,7 @@
 
 #define MTK_ENC_CTX_IS_EXT(ctx) ((ctx)->dev->venc_pdata->uses_ext)
 #define MTK_ENC_IOVA_IS_34BIT(ctx) ((ctx)->dev->venc_pdata->uses_34bit)
+#define MTK_ENC_DRV_IS_COMM(ctx) (((ctx)->dev->venc_pdata->uses_common_fw_iface))
 
 /**
  * struct mtk_vcodec_enc_pdata - compatible data for each IC
@@ -29,6 +30,7 @@
  * @num_output_formats: number of entries in output_formats
  * @core_id: stand for h264 or vp8 encode index
  * @uses_34bit: whether the encoder uses 34-bit iova
+ * @uses_common_fw_iface: whether the encoder uses common driver interface
  */
 struct mtk_vcodec_enc_pdata {
 	bool uses_ext;
@@ -40,6 +42,7 @@ struct mtk_vcodec_enc_pdata {
 	size_t num_output_formats;
 	u8 core_id;
 	bool uses_34bit;
+	bool uses_common_fw_iface;
 };
 
 /*
diff --git a/drivers/media/platform/mediatek/vcodec/encoder/venc_drv_if.c b/drivers/media/platform/mediatek/vcodec/encoder/venc_drv_if.c
index e83747b8d69a..f8c9349c18c0 100644
--- a/drivers/media/platform/mediatek/vcodec/encoder/venc_drv_if.c
+++ b/drivers/media/platform/mediatek/vcodec/encoder/venc_drv_if.c
@@ -19,13 +19,14 @@
 int venc_if_init(struct mtk_vcodec_enc_ctx *ctx, unsigned int fourcc)
 {
 	int ret = 0;
+	const bool uses_common_fw_iface = MTK_ENC_DRV_IS_COMM(ctx);
 
 	switch (fourcc) {
 	case V4L2_PIX_FMT_VP8:
 		ctx->enc_if = &venc_vp8_if;
 		break;
 	case V4L2_PIX_FMT_H264:
-		ctx->enc_if = &venc_h264_if;
+		ctx->enc_if = uses_common_fw_iface ? &venc_if : &venc_h264_if;
 		break;
 	default:
 		return -EINVAL;
diff --git a/drivers/media/platform/mediatek/vcodec/encoder/venc_ipi_msg.h b/drivers/media/platform/mediatek/vcodec/encoder/venc_ipi_msg.h
index bb16d96a7f57..ce3c2c8059fb 100644
--- a/drivers/media/platform/mediatek/vcodec/encoder/venc_ipi_msg.h
+++ b/drivers/media/platform/mediatek/vcodec/encoder/venc_ipi_msg.h
@@ -45,6 +45,20 @@ struct venc_ap_ipi_msg_init {
 	uint64_t venc_inst;
 };
 
+/**
+ * struct venc_ap_ipi_msg_init_comm - AP to VPU init cmd structure
+ * @base: AP to VPU init cmd structure
+ * @codec_type: encoder type
+ * @reserved: reserved field
+ * @shared_iova: shared iova
+ */
+struct venc_ap_ipi_msg_init_comm {
+	struct venc_ap_ipi_msg_init base;
+	u32 codec_type;
+	u32 reserved;
+	u64 shared_iova;
+};
+
 /**
  * struct venc_ap_ipi_msg_set_param - AP to VPU set_param cmd structure
  * @msg_id:	message id (AP_IPIMSG_XXX_ENC_SET_PARAM)
@@ -175,6 +189,18 @@ struct venc_vpu_ipi_msg_init {
 	uint32_t venc_abi_version;
 };
 
+/**
+ * struct venc_vpu_ipi_msg_init_comm - VPU ack AP init cmd structure
+ * @init_ack: AP init cmd structure
+ * @vpu_vsi_addr: VSI address from VPU
+ * @reserved: reserved field
+ */
+struct venc_vpu_ipi_msg_init_comm {
+	struct venc_vpu_ipi_msg_init init_ack;
+	u32 vpu_vsi_addr;
+	u32 reserved;
+};
+
 /**
  * struct venc_vpu_ipi_msg_set_param - VPU ack AP set_param cmd structure
  * @msg_id:	message id (VPU_IPIMSG_XXX_ENC_SET_PARAM_DONE)
diff --git a/drivers/media/platform/mediatek/vcodec/encoder/venc_vpu_if.c b/drivers/media/platform/mediatek/vcodec/encoder/venc_vpu_if.c
index 0c825aa7224d..7772b8442ebc 100644
--- a/drivers/media/platform/mediatek/vcodec/encoder/venc_vpu_if.c
+++ b/drivers/media/platform/mediatek/vcodec/encoder/venc_vpu_if.c
@@ -10,24 +10,25 @@
 
 static void handle_enc_init_msg(struct venc_vpu_inst *vpu, const void *data)
 {
-	const struct venc_vpu_ipi_msg_init *msg = data;
+	const struct venc_vpu_ipi_msg_init_comm *msg = data;
+	struct mtk_vcodec_fw *fw = vpu->ctx->dev->fw_handler;
 
-	vpu->inst_addr = msg->vpu_inst_addr;
-	vpu->vsi = mtk_vcodec_fw_map_dm_addr(vpu->ctx->dev->fw_handler,
-					     msg->vpu_inst_addr);
+	vpu->inst_addr = msg->init_ack.vpu_inst_addr;
+	vpu->vsi = mtk_vcodec_fw_map_dm_addr(fw, vpu->inst_addr);
 
 	/* Firmware version field value is unspecified on MT8173. */
-	if (mtk_vcodec_fw_get_type(vpu->ctx->dev->fw_handler) == VPU)
+	if (mtk_vcodec_fw_get_type(fw) == VPU)
 		return;
 
 	/* Check firmware version. */
-	mtk_venc_debug(vpu->ctx, "firmware version: 0x%x\n", msg->venc_abi_version);
-	switch (msg->venc_abi_version) {
+	mtk_venc_debug(vpu->ctx, "firmware version: 0x%x\n",
+		       msg->init_ack.venc_abi_version);
+	switch (msg->init_ack.venc_abi_version) {
 	case 1:
 		break;
 	default:
 		mtk_venc_err(vpu->ctx, "unhandled firmware version 0x%x\n",
-			     msg->venc_abi_version);
+			     msg->init_ack.venc_abi_version);
 		vpu->failure = 1;
 		break;
 	}
@@ -133,7 +134,8 @@ static int vpu_enc_send_msg(struct venc_vpu_inst *vpu, void *msg,
 int vpu_enc_init(struct venc_vpu_inst *vpu)
 {
 	int status;
-	struct venc_ap_ipi_msg_init out = { };
+	size_t msg_size;
+	struct venc_ap_ipi_msg_init_comm out = { };
 
 	init_waitqueue_head(&vpu->wq_hd);
 	vpu->signaled = 0;
@@ -149,9 +151,16 @@ int vpu_enc_init(struct venc_vpu_inst *vpu)
 		return -EINVAL;
 	}
 
-	out.msg_id = AP_IPIMSG_ENC_INIT;
-	out.venc_inst = (unsigned long)vpu;
-	if (vpu_enc_send_msg(vpu, &out, sizeof(out))) {
+	out.base.msg_id = AP_IPIMSG_ENC_INIT;
+	out.base.venc_inst = (unsigned long)vpu;
+	if (MTK_ENC_DRV_IS_COMM(vpu->ctx)) {
+		out.codec_type = vpu->ctx->q_data[MTK_Q_DATA_DST].fmt->fourcc;
+		msg_size = sizeof(struct venc_ap_ipi_msg_init_comm);
+	} else {
+		msg_size = sizeof(struct venc_ap_ipi_msg_init);
+	}
+
+	if (vpu_enc_send_msg(vpu, &out, msg_size)) {
 		mtk_venc_err(vpu->ctx, "AP_IPIMSG_ENC_INIT fail");
 		return -EINVAL;
 	}
-- 
2.45.2


