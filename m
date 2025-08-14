Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2C75CA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Aug 2025 09:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xy4AutsWSzEV9WgoSC/90TKzvC8h5+PuLT7188L0doA=; b=H0ZTz4Qk3Dawa7Nx6j3DLABJZa
	PfzpjoBOrZq4GCvEZAlgdU+4p8h/hMzBMkE3IXz0z9a6+ahkmSfTz6Ckamgw4dqmHHwIvbYmpER2e
	xCeMKdaU38mi/+jzoasLMvgd5VraYI/T6DmdNgS6lH1I979qs2ZAn1IGeeqz9p1ErGycB13Eb1kCB
	gMG9UR6JcgVwFQ06y8s3Im8M8Gyx9YjoUOAmWfALRSTBGSeQPGGcGwfUGNXgSg5mjjIGCHAjzuQBQ
	aJ6CkDIaKUyY6mECAfHwQ83FGIjqJ3ZNsHTXYHLRfc84DLPcMdOn6wwleF6E3iFXZuL3oXFC8K/ZY
	z0aF1qdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umUUT-0000000GRSC-2CzP;
	Thu, 14 Aug 2025 09:43:21 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umTla-0000000GJgh-1zx9;
	Thu, 14 Aug 2025 08:56:59 +0000
X-UUID: 9fb2d8f078ec11f09eb0dd999d3936bf-20250814
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=xy4AutsWSzEV9WgoSC/90TKzvC8h5+PuLT7188L0doA=;
	b=LQb3hIGl1xsXCgZKS4AJnGywFwC1c+hFno6DxQCiSSdk9LdkDvf4V3+9BHMOoMHhEywSgurtYDv9rBTuFYKYdrDM3FsHPRx8E4n80uBJCbo2vt5uX6Lu+koAuF1q/rSLa2xaIvknGCf2SyvQ5ALagibk72ZdmnD+1ENs5XQi1Tg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.3,REQID:9ff1f96a-aa14-4af1-8b91-afeefa0d91d9,IP:0,UR
	L:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-25
X-CID-META: VersionHash:f1326cf,CLOUDID:17a3edf3-66cd-4ff9-9728-6a6f64661009,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:-5,Content:0|15|50,EDM:
	-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 9fb2d8f078ec11f09eb0dd999d3936bf-20250814
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 75656107; Thu, 14 Aug 2025 01:56:53 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Thu, 14 Aug 2025 16:56:50 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Thu, 14 Aug 2025 16:56:49 +0800
From: Kyrie Wu <kyrie.wu@mediatek.com>
To: Tiffany Lin <tiffany.lin@mediatek.com>, Andrew-CT Chen
	<andrew-ct.chen@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Kyrie Wu <kyrie.wu@mediatek.com>,
	Hans Verkuil <hverkuil@xs4all.nl>, Nicolas Dufresne
	<nicolas.dufresne@collabora.com>, Christophe JAILLET
	<christophe.jaillet@wanadoo.fr>, Sebastian Fricke
	<sebastian.fricke@collabora.com>, Nathan Hebert <nhebert@chromium.org>, Arnd
 Bergmann <arnd@arndb.de>, Irui Wang <irui.wang@mediatek.com>, George Sun
	<george.sun@mediatek.com>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
CC: Neil Armstrong <neil.armstrong@linaro.org>, Andrzej Pietrasiewicz
	<andrzejtp2010@gmail.com>
Subject: [PATCH v3 2/6] media: mediatek: encoder: Add support for common firmware interface
Date: Thu, 14 Aug 2025 16:56:38 +0800
Message-ID: <20250814085642.17343-3-kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250814085642.17343-1-kyrie.wu@mediatek.com>
References: <20250814085642.17343-1-kyrie.wu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_015658_519863_9DE85B6A 
X-CRM114-Status: GOOD (  22.63  )
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

From: Irui Wang <irui.wang@mediatek.com>

The existing encoder firmware interface implied just one type of codec:
H.264. Future encoders may support additional codecs; however adding
entire sets of interfaces for them is not scalable.

Instead, a new "common" firmware interface is defined for non codec
specific messages. The new messages encapsulate the old ones for
backward compatibility.

This patch adds support for these new messages.

Signed-off-by: Irui Wang <irui.wang@mediatek.com>
---
 .../vcodec/encoder/mtk_vcodec_enc_drv.h       |  3 ++
 .../mediatek/vcodec/encoder/venc_drv_if.c     |  3 +-
 .../mediatek/vcodec/encoder/venc_ipi_msg.h    | 26 +++++++++++++
 .../mediatek/vcodec/encoder/venc_vpu_if.c     | 37 ++++++++++++-------
 4 files changed, 54 insertions(+), 15 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.h b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.h
index b1277bcfcf53..426b1398f815 100644
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
index 51bb7ee141b9..537b9955932e 100644
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
@@ -132,7 +133,8 @@ static int vpu_enc_send_msg(struct venc_vpu_inst *vpu, void *msg,
 int vpu_enc_init(struct venc_vpu_inst *vpu)
 {
 	int status;
-	struct venc_ap_ipi_msg_init out;
+	size_t msg_size;
+	struct venc_ap_ipi_msg_init_comm out;
 
 	init_waitqueue_head(&vpu->wq_hd);
 	vpu->signaled = 0;
@@ -149,9 +151,16 @@ int vpu_enc_init(struct venc_vpu_inst *vpu)
 	}
 
 	memset(&out, 0, sizeof(out));
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
@@ -260,7 +269,7 @@ static int vpu_enc_encode_32bits(struct venc_vpu_inst *vpu,
 		sizeof(struct venc_ap_ipi_msg_enc);
 	struct venc_ap_ipi_msg_enc_ext out;
 
-	mtk_venc_debug(vpu->ctx, "bs_mode %d ->", bs_mode);
+	mtk_venc_debug(vpu->ctx, "%s, bs_mode %d ->", __func__, bs_mode);
 
 	memset(&out, 0, sizeof(out));
 	out.base.msg_id = AP_IPIMSG_ENC_ENCODE;
@@ -305,7 +314,7 @@ static int vpu_enc_encode_34bits(struct venc_vpu_inst *vpu,
 	struct venc_ap_ipi_msg_enc_ext_34 out;
 	size_t msg_size = sizeof(struct venc_ap_ipi_msg_enc_ext_34);
 
-	mtk_venc_debug(vpu->ctx, "bs_mode %d ->", bs_mode);
+	mtk_venc_debug(vpu->ctx, "%s, bs_mode %d ->", __func__, bs_mode);
 
 	memset(&out, 0, sizeof(out));
 	out.msg_id = AP_IPIMSG_ENC_ENCODE;
-- 
2.46.0


