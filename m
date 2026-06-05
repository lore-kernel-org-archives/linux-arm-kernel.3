Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1045CD8C83
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 09:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5KFVLcgDo1jRKe1Q+kERlK6tAOZRxFwKHRWfbJ0UYVw=; b=y7tYbuPkuQ0CjudbgoF2SDaQXn
	bPbzJhj41/BBMx7oVVdLtCizckzMRwwfhChNZuwBMn+X4eA30DtuNb47zuE2ZCTWKtgDrSDb7By6J
	YPp8f+C6puuG2fn0hdt0o4cVEcVDqSX+Bd+onG4qhHWrOGj5Q7aO4uCJeRRmIoN7eQF3p7m2gEcDR
	cK1eeznbiUR4aIxTkFE0OXwrxPSXObia41cNJMG8BW6FEmtX8eYdYcwf4JHVUU0dpFQ7vGptMP7jd
	sBQH3ISuSolFC1Oh+5BPhq7bkju10XM0Tu60FBaXA3JezSGaMaWrDI6a0SthK293YgAWl4ctuFGOC
	InHwfvGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVQxu-00000000PdX-3xWN;
	Fri, 05 Jun 2026 09:35:46 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVQxq-00000000Pa4-1Isp;
	Fri, 05 Jun 2026 09:35:43 +0000
X-UUID: e998d9c060c111f1acbe4559397dec65-20260605
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=5KFVLcgDo1jRKe1Q+kERlK6tAOZRxFwKHRWfbJ0UYVw=;
	b=ZKcMB43KL60rlMRJhhyXNIgVNtwCd41WWqvk2zhVYPbmK1CiBd89F8c9hydCHTXxam29iGyxZnHjLB3s8jaSXBgH5O/t2KRXfkv0NrikU++pSd05oO8Sz6WhK9Iw+lXZ9KBaUD74IGlS91wnCzWY1c0pBHmw7MIf8gZ6KqAej6I=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.15,REQID:106f549c-c84f-4bcf-af1e-b816960829c9,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:e276073,CLOUDID:81639f49-7779-4525-bfc4-16665fa33dbe,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|136|836|865|888|898,TC:-5,
	Content:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,C
	OL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: e998d9c060c111f1acbe4559397dec65-20260605
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <irui.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1518333612; Fri, 05 Jun 2026 02:35:38 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 5 Jun 2026 17:35:37 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Fri, 5 Jun 2026 17:35:36 +0800
From: Irui Wang <irui.wang@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	<angelogioacchino.delregno@collabora.com>, <nicolas.dufresne@collabora.com>,
	Tiffany Lin <tiffany.lin@mediatek.com>, kyrie wu <kyrie.wu@mediatek.com>
CC: Yunfei Dong <yunfei.dong@mediatek.com>, Maoguang Meng
	<maoguang.meng@mediatek.com>, Longfei Wang <longfei.wang@mediatek.com>, Irui
 Wang <irui.wang@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
Subject: [PATCH v7 4/6] media: mediatek: encoder: Add support for common firmware interface
Date: Fri, 5 Jun 2026 17:35:16 +0800
Message-ID: <20260605093519.13695-5-irui.wang@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20260605093519.13695-1-irui.wang@mediatek.com>
References: <20260605093519.13695-1-irui.wang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_023542_380141_4F2ADC5E 
X-CRM114-Status: GOOD (  21.90  )
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
index 029133e48073..8a69168c350e 100644
--- a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.h
+++ b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.h
@@ -16,6 +16,7 @@
 
 #define MTK_ENC_CTX_IS_EXT(ctx) ((ctx)->dev->venc_pdata->uses_ext)
 #define MTK_ENC_IOVA_IS_34BIT(ctx) ((ctx)->dev->venc_pdata->uses_34bit)
+#define MTK_ENC_DRV_IS_COMM(ctx) (((ctx)->dev->venc_pdata->uses_common_fw_iface))
 
 /**
  * struct mtk_vcodec_enc_pdata - compatible data for each IC
@@ -30,6 +31,7 @@
  * @num_output_formats: number of entries in output_formats
  * @core_id: stand for h264 or vp8 encode index
  * @uses_34bit: whether the encoder uses 34-bit iova
+ * @uses_common_fw_iface: whether the encoder uses common driver interface
  * @fw_type: firmware type (VPU, SCP, or VCP)
  * @fw_init: firmware-specific initialization callback
  * @ipi_id: IPI ID for encoder communication with firmware
@@ -45,6 +47,7 @@ struct mtk_vcodec_enc_pdata {
 	size_t num_output_formats;
 	u8 core_id;
 	bool uses_34bit;
+	bool uses_common_fw_iface;
 	enum mtk_vcodec_fw_type fw_type;
 	struct mtk_vcodec_fw *(*fw_init)(void *priv, enum mtk_vcodec_fw_use fw_use);
 	int ipi_id;
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


