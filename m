Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB11CC5AE59
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 06:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4+K1kG43cpeUg6Nb8vlFU7e5JfdbWrBV2+LwUCGOPio=; b=F/4egTrRagCNYXIvGSgB4YyH1k
	OWi9w6ThMELaYkpuNMK8XI+Ct9BdiUgSerOgydpmTwHLUEAkdZwGuY+E+CL6j8069jknyDKY+Wlcc
	9rTqO2O8C2ognnXk0ryw4GOBxj9p8K9I+ia4UL4p+j37rn80cL5aD5IJPV1DJca0zSTHNW7rjuDFX
	RJxhX17umcXe6Obp+xawb8n8KsQTLrhxC7RUCYn7mH68hLcwutinGjUqGqVX81K8AULsL1k/bEAZx
	KV4HIKzcUs2rRXfTj0MkajOukX/JIoWoTVkIGovFfs5T3J9mRw1dtH2w4lHtnZh4TeApbI4NEnytZ
	takMtLGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKAVZ-0000000CKCj-2hLj;
	Wed, 28 May 2025 06:43:25 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKAPD-0000000CJ9J-28gu;
	Wed, 28 May 2025 06:36:52 +0000
X-UUID: 1ff346ae3b8e11f08d385d50fb11b32d-20250527
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=4+K1kG43cpeUg6Nb8vlFU7e5JfdbWrBV2+LwUCGOPio=;
	b=sLOmJioiooA2m5T19QUbxyjKB4es9i207sDfvUKMyE9UKeB+JsC8ZiAHykc6CvuFA/LGt9oGe8TVrmifynGQmXA/VQbQKPWpEwqGcYn7w0kcKpIy3xPM2aDJ0fKGkCtHWcJn2MBg6rrSvqrjI3JeP2KIjbV/qZceZ+95RCttvzQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:0e386ad3-bf4c-426e-a589-ccc5525b1999,IP:0,UR
	L:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-25
X-CID-META: VersionHash:0ef645f,CLOUDID:6d3e0f58-abad-4ac2-9923-3af0a8a9a079,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 1ff346ae3b8e11f08d385d50fb11b32d-20250527
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw01.mediatek.com
	(envelope-from <irui.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 975699223; Tue, 27 May 2025 23:36:45 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Wed, 28 May 2025 14:36:42 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Wed, 28 May 2025 14:36:42 +0800
From: Irui Wang <irui.wang@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	<angelogioacchino.delregno@collabora.com>, <nicolas.dufresne@collabora.com>,
	<wenst@chromium.org>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Yunfei Dong <yunfei.dong@mediatek.com>,
	Longfei Wang <longfei.wang@mediatek.com>, Irui Wang <irui.wang@mediatek.com>
Subject: [PATCH v2 3/6] media: mediatek: encoder: Add support for VCP encode process
Date: Wed, 28 May 2025 14:36:29 +0800
Message-ID: <20250528063633.14054-4-irui.wang@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250528063633.14054-1-irui.wang@mediatek.com>
References: <20250528063633.14054-1-irui.wang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250527_233651_555059_5D178AC7 
X-CRM114-Status: GOOD (  22.85  )
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

When encoding by VCP interface, encoder driver need change to VCP path:
Firstly, set encoder driver fw type to 'VCP'. Then, allocate RC buffers
by the VCP device. Finally, send the shared memory address into VCP and
map the encoder vsi address by the VCP shared memory address.

Signed-off-by: Irui Wang <irui.wang@mediatek.com>
---
 .../mediatek/vcodec/common/mtk_vcodec_fw.c    |  6 +++++
 .../mediatek/vcodec/common/mtk_vcodec_fw.h    |  1 +
 .../vcodec/common/mtk_vcodec_fw_priv.h        |  1 +
 .../vcodec/common/mtk_vcodec_fw_vcp.c         |  6 +++++
 .../vcodec/encoder/mtk_vcodec_enc_drv.c       |  3 +++
 .../vcodec/encoder/venc/venc_common_if.c      | 23 ++++++++++++++-----
 .../mediatek/vcodec/encoder/venc_vpu_if.c     | 14 ++++++++++-
 7 files changed, 47 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.c b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.c
index 0381acceda25..7a504f093bd8 100644
--- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.c
+++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.c
@@ -105,3 +105,9 @@ int mtk_vcodec_fw_get_type(struct mtk_vcodec_fw *fw)
 	return fw->type;
 }
 EXPORT_SYMBOL_GPL(mtk_vcodec_fw_get_type);
+
+struct device *mtk_vcodec_fw_get_dev(struct mtk_vcodec_fw *fw)
+{
+	return fw->ops->get_fw_dev(fw);
+}
+EXPORT_SYMBOL_GPL(mtk_vcodec_fw_get_dev);
diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.h b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.h
index e7304a7dd3e0..56c26b91651e 100644
--- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.h
+++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.h
@@ -43,5 +43,6 @@ int mtk_vcodec_fw_ipi_send(struct mtk_vcodec_fw *fw, int id,
 int mtk_vcodec_fw_get_type(struct mtk_vcodec_fw *fw);
 int mtk_vcodec_fw_get_ipi(enum mtk_vcodec_fw_type type, int hw_id);
 int mtk_vcodec_fw_get_venc_ipi(enum mtk_vcodec_fw_type type);
+struct device *mtk_vcodec_fw_get_dev(struct mtk_vcodec_fw *fw);
 
 #endif /* _MTK_VCODEC_FW_H_ */
diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_priv.h b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_priv.h
index 0a2a9b010244..710c83c871f4 100644
--- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_priv.h
+++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_priv.h
@@ -29,6 +29,7 @@ struct mtk_vcodec_fw_ops {
 	int (*ipi_send)(struct mtk_vcodec_fw *fw, int id, void *buf,
 			unsigned int len, unsigned int wait);
 	void (*release)(struct mtk_vcodec_fw *fw);
+	struct device *(*get_fw_dev)(struct mtk_vcodec_fw *fw);
 };
 
 #if IS_ENABLED(CONFIG_VIDEO_MEDIATEK_VCODEC_VPU)
diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.c b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.c
index f6b93e1bcbf3..646e3944dd4f 100644
--- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.c
+++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.c
@@ -432,6 +432,11 @@ static void mtk_vcodec_vcp_release(struct mtk_vcodec_fw *fw)
 {
 }
 
+static struct device *mtk_vcodec_vcp_get_fw_dev(struct mtk_vcodec_fw *fw)
+{
+	return fw->vcp->vcp_device->dev;
+}
+
 static const struct mtk_vcodec_fw_ops mtk_vcodec_vcp_msg = {
 	.load_firmware = mtk_vcodec_vcp_load_firmware,
 	.get_vdec_capa = mtk_vcodec_vcp_get_vdec_capa,
@@ -440,6 +445,7 @@ static const struct mtk_vcodec_fw_ops mtk_vcodec_vcp_msg = {
 	.ipi_register = mtk_vcodec_vcp_set_ipi_register,
 	.ipi_send = mtk_vcodec_vcp_ipi_send,
 	.release = mtk_vcodec_vcp_release,
+	.get_fw_dev = mtk_vcodec_vcp_get_fw_dev,
 };
 
 struct mtk_vcodec_fw *mtk_vcodec_fw_vcp_init(void *priv, enum mtk_vcodec_fw_use fw_use)
diff --git a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.c b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.c
index a1e4483abcdb..bb913dfe5f04 100644
--- a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.c
+++ b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.c
@@ -252,6 +252,9 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 	} else if (!of_property_read_u32(pdev->dev.of_node, "mediatek,scp",
 					 &rproc_phandle)) {
 		fw_type = SCP;
+	} else if (!of_property_read_u32(pdev->dev.of_node, "mediatek,vcp",
+					 &rproc_phandle)) {
+		fw_type = VCP;
 	} else {
 		dev_err(&pdev->dev, "[MTK VCODEC] Could not get venc IPI device");
 		return -ENODEV;
diff --git a/drivers/media/platform/mediatek/vcodec/encoder/venc/venc_common_if.c b/drivers/media/platform/mediatek/vcodec/encoder/venc/venc_common_if.c
index 8092929e9297..61aa7d9d70c9 100644
--- a/drivers/media/platform/mediatek/vcodec/encoder/venc/venc_common_if.c
+++ b/drivers/media/platform/mediatek/vcodec/encoder/venc/venc_common_if.c
@@ -478,8 +478,13 @@ static void venc_free_rc_buf(struct venc_inst *inst,
 {
 	int i;
 	struct device *dev;
+	struct mtk_vcodec_fw *fw = inst->ctx->dev->fw_handler;
+
+	if (mtk_vcodec_fw_get_type(fw) == VCP)
+		dev = mtk_vcodec_fw_get_dev(fw);
+	else
+		dev = &inst->ctx->dev->plat_dev->dev;
 
-	dev = &inst->ctx->dev->plat_dev->dev;
 	mtk_venc_mem_free(inst, dev, &bufs->rc_code);
 
 	for (i = 0; i < core_num; i++)
@@ -528,12 +533,18 @@ static int venc_alloc_rc_buf(struct venc_inst *inst,
 	struct device *dev;
 	void *tmp_va;
 
-	dev = &inst->ctx->dev->plat_dev->dev;
-	if (mtk_venc_mem_alloc(inst, dev, &bufs->rc_code))
-		return -ENOMEM;
+	if (mtk_vcodec_fw_get_type(fw) == VCP) {
+		dev = mtk_vcodec_fw_get_dev(fw);
+		if (mtk_venc_mem_alloc(inst, dev, &bufs->rc_code))
+			return -ENOMEM;
+	} else {
+		dev = &inst->ctx->dev->plat_dev->dev;
+		if (mtk_venc_mem_alloc(inst, dev, &bufs->rc_code))
+			return -ENOMEM;
 
-	tmp_va = mtk_vcodec_fw_map_dm_addr(fw, bufs->rc_code.pa);
-	memcpy(bufs->rc_code.va, tmp_va, bufs->rc_code.size);
+		tmp_va = mtk_vcodec_fw_map_dm_addr(fw, bufs->rc_code.pa);
+		memcpy(bufs->rc_code.va, tmp_va, bufs->rc_code.size);
+	}
 
 	for (i = 0; i < core_num; i++) {
 		if (mtk_venc_mem_alloc(inst, dev, &bufs->rc_info[i]))
diff --git a/drivers/media/platform/mediatek/vcodec/encoder/venc_vpu_if.c b/drivers/media/platform/mediatek/vcodec/encoder/venc_vpu_if.c
index 537b9955932e..80db7d97ab3f 100644
--- a/drivers/media/platform/mediatek/vcodec/encoder/venc_vpu_if.c
+++ b/drivers/media/platform/mediatek/vcodec/encoder/venc_vpu_if.c
@@ -8,13 +8,23 @@
 #include "venc_ipi_msg.h"
 #include "venc_vpu_if.h"
 
+#define VSI_OFFSET_MASK 0x0FFFFFFF
+
 static void handle_enc_init_msg(struct venc_vpu_inst *vpu, const void *data)
 {
 	const struct venc_vpu_ipi_msg_init_comm *msg = data;
 	struct mtk_vcodec_fw *fw = vpu->ctx->dev->fw_handler;
+	u64 pa_start, vsi_offset;
 
 	vpu->inst_addr = msg->init_ack.vpu_inst_addr;
-	vpu->vsi = mtk_vcodec_fw_map_dm_addr(fw, vpu->inst_addr);
+
+	if (mtk_vcodec_fw_get_type(fw) == VCP) {
+		pa_start = (u64)fw->vcp->iova_addr;
+		vsi_offset = (msg->vpu_vsi_addr & VSI_OFFSET_MASK) - (pa_start & VSI_OFFSET_MASK);
+		vpu->vsi = mtk_vcodec_fw_map_dm_addr(fw, ENCODER_MEM) + vsi_offset;
+	} else {
+		vpu->vsi = mtk_vcodec_fw_map_dm_addr(fw, vpu->inst_addr);
+	}
 
 	/* Firmware version field value is unspecified on MT8173. */
 	if (mtk_vcodec_fw_get_type(fw) == VPU)
@@ -155,6 +165,8 @@ int vpu_enc_init(struct venc_vpu_inst *vpu)
 	out.base.venc_inst = (unsigned long)vpu;
 	if (MTK_ENC_DRV_IS_COMM(vpu->ctx)) {
 		out.codec_type = vpu->ctx->q_data[MTK_Q_DATA_DST].fmt->fourcc;
+		if (mtk_vcodec_fw_get_type(vpu->ctx->dev->fw_handler) == VCP)
+			out.shared_iova = vpu->ctx->dev->fw_handler->vcp->iova_addr;
 		msg_size = sizeof(struct venc_ap_ipi_msg_init_comm);
 	} else {
 		msg_size = sizeof(struct venc_ap_ipi_msg_init);
-- 
2.45.2


