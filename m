Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCD5BEB596A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Feb 2026 05:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sP83mE/V22wNUz2FwAiwzp1tjQcAYyESfEE5KEPt/HY=; b=2IiUCsnEzgVqDH/HiM49GgbZHK
	wVEcBRiu7ukTQ4htxau+6XaBXDrZALq9GNwO3MozuKAcRoHqXpWXDVd2bwqeRcZvwiMSptuBUSHOy
	HYG1kt76g1rPCWfFfqkcTbAdB+SozNepenQ8GV+9vbOA4dfn2RcpWnC4PYJECv1gBBb4zb2EJn5H+
	ggMN8jFgEkUebEmwIkyKFm80G0DGKN5wv3BEJfXDr3l1Eq63LeIxNhFiJj2tSCQ/g9C/oSx+qlZXT
	1LpiwK0+3NTzbhFPHHJtF2NQSFLEwfdxO7hgXlXPCxIaOeJDlfsP7NM2L1xmE8c2ZA2eEQuhX82tk
	l2sI+yxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vq2zt-00000000F1L-0a8a;
	Wed, 11 Feb 2026 05:42:45 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vq2zi-00000000EpC-0gWt;
	Wed, 11 Feb 2026 05:42:36 +0000
X-UUID: 731895b0070c11f1ad39f32c34db0b1c-20260210
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=sP83mE/V22wNUz2FwAiwzp1tjQcAYyESfEE5KEPt/HY=;
	b=U7SWp/HECQH4l+CEHa5wrZ+frQFXYHK+LCGucypkvAu1/WKJ9VxDiKnT1kdF7sILdg4EIDFrWC8Nv7ec94pQUHj253BvOnmxtlV4sdLyc9Bi/HeY9SGu2J3KzlrVd96rOxdzMngZy/kGRkJuoy0IRas95RePagHaqrBZqi7MraA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:a8fa8cf5-c72c-4f24-9c6a-5e0e2615cd5e,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:89c9d04,CLOUDID:13ce91f0-16bd-4243-b4ca-b08ca08ab1d8,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI
	:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 731895b0070c11f1ad39f32c34db0b1c-20260210
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1365293935; Tue, 10 Feb 2026 22:42:27 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 11 Feb 2026 13:42:25 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 11 Feb 2026 13:42:24 +0800
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
Subject: [PATCH v3 04/14] media: mediatek: vcodec: add driver to support vcp encoder
Date: Wed, 11 Feb 2026 13:41:31 +0800
Message-ID: <20260211054149.27249-5-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20260211054149.27249-1-yunfei.dong@mediatek.com>
References: <20260211054149.27249-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260210_214234_455302_7DCA2EFB 
X-CRM114-Status: GOOD (  17.58  )
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

Encoder also need to call vcp interface to communicate with vcp,
add driver to support encoder.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 .../vcodec/common/mtk_vcodec_fw_vcp.c         | 56 ++++++++++++++++---
 .../vcodec/common/mtk_vcodec_fw_vcp.h         |  1 +
 .../mediatek/vcodec/encoder/mtk_vcodec_enc.c  |  1 -
 .../mediatek/vcodec/encoder/mtk_vcodec_enc.h  |  2 +
 4 files changed, 50 insertions(+), 10 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.c b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.c
index 9fee52fed181..32d4e566f357 100644
--- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.c
+++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.c
@@ -13,6 +13,8 @@
 
 #include "../decoder/mtk_vcodec_dec_drv.h"
 #include "../decoder/vdec_ipi_msg.h"
+#include "../encoder/mtk_vcodec_enc.h"
+#include "../encoder/mtk_vcodec_enc_drv.h"
 #include "mtk_vcodec_fw_priv.h"
 
 #define IPI_SEND_TIMEOUT_MS  100U
@@ -226,8 +228,13 @@ static int mtk_vcodec_vcp_msg_ipi_send(struct mtk_vcodec_fw *fw, int id, void *b
 	}
 
 	mutex_lock(&vcp->ipi_mutex);
-	feature_id = VDEC_FEATURE_ID;
-	mailbox_id = IPI_OUT_VDEC_1;
+	if (fw->fw_use == ENCODER) {
+		feature_id = VENC_FEATURE_ID;
+		mailbox_id = IPI_OUT_VENC_0;
+	} else {
+		feature_id = VDEC_FEATURE_ID;
+		mailbox_id = IPI_OUT_VDEC_1;
+	}
 
 	timeout_jiffies = jiffies + msecs_to_jiffies(VCP_SYNC_TIMEOUT_MS);
 	while (!vcp_device->ops->vcp_is_ready(feature_id)) {
@@ -351,10 +358,17 @@ static int mtk_vcodec_vcp_load_firmware(struct mtk_vcodec_fw *fw)
 
 	vcp_device = fw->vcp->vcp_device;
 
-	feature_id = VDEC_FEATURE_ID;
-	mem_id = VDEC_MEM_ID;
-	mailbox_id = IPI_IN_VDEC_1;
-	ipi_id = VCP_IPI_LAT_DECODER;
+	if (fw->fw_use == ENCODER) {
+		feature_id = VENC_FEATURE_ID;
+		mem_id = VENC_MEM_ID;
+		mailbox_id = IPI_IN_VENC_0;
+		ipi_id = VCP_IPI_ENCODER;
+	} else {
+		feature_id = VDEC_FEATURE_ID;
+		mem_id = VDEC_MEM_ID;
+		mailbox_id = IPI_IN_VDEC_1;
+		ipi_id = VCP_IPI_LAT_DECODER;
+	}
 
 	ret = mtk_vcp_mbox_ipc_register(vcp_get_ipidev(vcp_device), mailbox_id,
 					mtk_vcodec_vcp_msg_ack_isr, fw, &fw->vcp->share_data);
@@ -383,6 +397,20 @@ static int mtk_vcodec_vcp_load_firmware(struct mtk_vcodec_fw *fw)
 	mutex_init(&fw->vcp->ipi_desc[ipi_id].lock);
 	mutex_init(&fw->vcp->ipi_mutex);
 
+	if (fw->fw_use == ENCODER) {
+		kthread_run(mtk_vcodec_vcp_msg_process_thread, fw, "vcp_enc_msq_thread");
+
+		fw->vcp->vsi_addr = vcp_device->ops->vcp_get_mem_virt(mem_id);
+		fw->vcp->vsi_size = vcp_device->ops->vcp_get_mem_size(mem_id);
+		fw->vcp->iova_addr = vcp_device->ops->vcp_get_mem_iova(mem_id);
+
+		dev_dbg(&fw->pdev->dev, "enc vcp init done => va: %p size:0x%x iova:%pad.\n",
+			fw->vcp->vsi_addr, fw->vcp->vsi_size, &fw->vcp->iova_addr);
+
+		init_waitqueue_head(&fw->vcp->msg_wq[VCP_IPI_ENCODER]);
+		return 0;
+	}
+
 	kthread_run(mtk_vcodec_vcp_msg_process_thread, fw, "vcp_vdec_msq_thread");
 
 	fw->vcp->vsi_addr = vcp_device->ops->vcp_get_mem_virt(mem_id);
@@ -406,6 +434,11 @@ static unsigned int mtk_vcodec_vcp_get_vdec_capa(struct mtk_vcodec_fw *fw)
 	       MTK_VDEC_IS_SUPPORT_10BIT | MTK_VDEC_IS_SUPPORT_EXT;
 }
 
+static unsigned int mtk_vcodec_vcp_get_venc_capa(struct mtk_vcodec_fw *fw)
+{
+	return MTK_VENC_4K_CAPABILITY_ENABLE;
+}
+
 static void *mtk_vcodec_vcp_dm_addr(struct mtk_vcodec_fw *fw, u32 dtcm_dmem_addr)
 {
 	return NULL;
@@ -438,8 +471,8 @@ static void mtk_vcodec_vcp_release(struct mtk_vcodec_fw *fw)
 	if (!fw->vcp->is_register_done)
 		return;
 
-	feature_id = VDEC_FEATURE_ID;
-	ret = vcp_device->ops->vcp_deregister_feature(vcp_device, VDEC_FEATURE_ID);
+	feature_id = fw->fw_use == ENCODER ? VENC_FEATURE_ID : VDEC_FEATURE_ID;
+	ret = vcp_device->ops->vcp_deregister_feature(vcp_device, feature_id);
 	if (ret < 0) {
 		dev_err(dev, "deregister feature_id(%d) fail(%d)\n", feature_id, ret);
 		return;
@@ -452,6 +485,7 @@ static void mtk_vcodec_vcp_release(struct mtk_vcodec_fw *fw)
 static const struct mtk_vcodec_fw_ops mtk_vcodec_vcp_msg = {
 	.load_firmware = mtk_vcodec_vcp_load_firmware,
 	.get_vdec_capa = mtk_vcodec_vcp_get_vdec_capa,
+	.get_venc_capa = mtk_vcodec_vcp_get_venc_capa,
 	.map_dm_addr = mtk_vcodec_vcp_dm_addr,
 	.ipi_register = mtk_vcodec_vcp_set_ipi_register,
 	.ipi_send = mtk_vcodec_vcp_ipi_send,
@@ -465,7 +499,11 @@ struct mtk_vcodec_fw *mtk_vcodec_fw_vcp_init(void *priv, enum mtk_vcodec_fw_use
 	struct mtk_vcodec_fw *fw;
 	int i;
 
-	if (fw_use == DECODER) {
+	if (fw_use == ENCODER) {
+		struct mtk_vcodec_enc_dev *enc_dev = priv;
+
+		plat_dev = enc_dev->plat_dev;
+	} else if (fw_use == DECODER) {
 		struct mtk_vcodec_dec_dev *dec_dev = priv;
 
 		plat_dev = dec_dev->plat_dev;
diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.h b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.h
index fada786124d5..c0632a872892 100644
--- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.h
+++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.h
@@ -16,6 +16,7 @@ typedef void (*vcp_ipi_handler_t) (void *data, unsigned int len, void *priv);
 
 /* enum mtk_vcp_ipi_index - index used to separate different hardware */
 enum mtk_vcp_ipi_index {
+	VCP_IPI_ENCODER,
 	VCP_IPI_LAT_DECODER,
 	VCP_IPI_CORE_DECODER,
 	VCP_IPI_MAX,
diff --git a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c
index 0d4e94463685..48cb5dded70a 100644
--- a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c
+++ b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c
@@ -26,7 +26,6 @@
 
 #define MTK_DEFAULT_FRAMERATE_NUM 1001
 #define MTK_DEFAULT_FRAMERATE_DENOM 30000
-#define MTK_VENC_4K_CAPABILITY_ENABLE BIT(0)
 
 static void mtk_venc_worker(struct work_struct *work);
 
diff --git a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.h b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.h
index 908d8179b2d2..84156c102d8d 100644
--- a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.h
+++ b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.h
@@ -23,6 +23,8 @@
 #define MTK_VENC_IRQ_STATUS_OFFSET	0x05C
 #define MTK_VENC_IRQ_ACK_OFFSET	0x060
 
+#define MTK_VENC_4K_CAPABILITY_ENABLE BIT(0)
+
 /**
  * struct mtk_video_enc_buf - Private data related to each VB2 buffer.
  * @m2m_buf:	M2M buffer
-- 
2.45.2


