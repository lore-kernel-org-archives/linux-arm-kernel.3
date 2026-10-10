Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80E1ACA9EBE
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Oct 2026 08:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zH6m+w6xMQU2A38JJmsvgTuDYjoefP1cdy0+2a/7HSM=; b=QS+0u8L4qBIqRgsD5OtHjZ4fTa
	/pajdZpFu/hn8s1sHpcyCiWrUtSNbDLU7OvPWgklCBO22epQ8D7v8/UGafZXgHrKInxGRyQpneYXk
	SvfBAuJJRW4xp1n3N6x8cd8RH51Xox7pcPnX2i9YAdiLUjn4durFf+1nxPzQ4woxynfNIz7oGvPIy
	PAasiuTdQhPXPdd5qBqUo1NxEfvj0mXhzrA01kWF9eMgDKvx1YzpbpLbPILfhKjF7JMqQ3k8+H52t
	J8+uhx/HfHyn6+AQqDTJNO0nHQwj1YeW5zQ5vGEwteCCc2zPgI3LOpNZG/SMTSPH1hrf39HUVxzcl
	kdZEkVKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFSZI-00000007fbj-0s6K;
	Sat, 10 Oct 2026 08:36:36 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFSZA-00000007fTn-3Aq8;
	Sat, 10 Oct 2026 08:36:32 +0000
X-UUID: ad312ebac48511f1afed4741b24580c9-20261010
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=zH6m+w6xMQU2A38JJmsvgTuDYjoefP1cdy0+2a/7HSM=;
	b=Dbp/Da7o/MM/f0ylpaZZq2eBOLi+19PntYrYPOvPhbQuKEaeQ+v9gIkHbVGkalJgD0tmhfaPmE0JhRDsjmao0irP/r7MWDqty4wtMRwHyKi3/TWzBz/+yHNFNypNWPRTtgM/8kWerda6BQg2hS+mImb+YPxkrf/jxa1mG8zYUoQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.20,REQID:0dc2e552-84aa-41ee-ab90-01cece27fc1b,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:291e20b,CLOUDID:1c28edb8-514b-419b-be8a-53f1868a3ee6,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|136|836|865|888|898,TC:-5,Content:0|
	15|50|99,EDM:-3|-100,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL
	:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: ad312ebac48511f1afed4741b24580c9-20261010
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1123928521; Sat, 10 Oct 2026 01:36:24 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sat, 10 Oct 2026 16:36:21 +0800
Received: from gcnsap21.gcn.mediatek.inc (10.17.81.22) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Sat, 10 Oct 2026 16:36:19 +0800
From: Kyrie Wu <kyrie.wu@mediatek.com>
To: Tiffany Lin <tiffany.lin@mediatek.com>, Andrew-CT Chen
	<andrew-ct.chen@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Kyrie Wu <kyrie.wu@mediatek.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, Ricardo Ribalda
	<ribalda@chromium.org>, Kees Cook <kees@kernel.org>, Hans Verkuil
	<hverkuil+cisco@kernel.org>, Fei Shao <fshao@chromium.org>, Haoxiang Li
	<haoxiang_li2024@163.com>, Chen-Yu Tsai <wenst@chromium.org>, Laurent
 Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Tomasz Figa
	<tfiga@chromium.org>, Philipp Zabel <p.zabel@pengutronix.de>, Benjamin
 Gaignard <benjamin.gaignard@collabora.com>, Qianfeng Rong
	<rongqianfeng@vivo.com>, Irui Wang <irui.wang@mediatek.com>, Jacopo Mondi
	<jacopo.mondi@ideasonboard.com>, Fan Wu <fanwu01@zju.edu.cn>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
CC: Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCH v8 03/14] media: mediatek: vcodec: add driver to support vcp encoder
Date: Sat, 10 Oct 2026 16:36:02 +0800
Message-ID: <c2a0025b6962f96d8d05de5970863ef6329baf0e.1791619743.git.kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1791619742.git.kyrie.wu@mediatek.com>
References: <cover.1791619742.git.kyrie.wu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_013631_360291_EE2AE48F 
X-CRM114-Status: GOOD (  17.86  )
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

Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
---
 .../vcodec/common/mtk_vcodec_fw_vcp.c         | 52 ++++++++++++++++---
 .../vcodec/common/mtk_vcodec_fw_vcp.h         |  1 +
 .../mediatek/vcodec/encoder/mtk_vcodec_enc.c  |  1 -
 .../mediatek/vcodec/encoder/mtk_vcodec_enc.h  |  2 +
 4 files changed, 47 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.c b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.c
index 150d842c..ece4e3e8 100644
--- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.c
+++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.c
@@ -13,6 +13,8 @@
 
 #include "../decoder/mtk_vcodec_dec_drv.h"
 #include "../decoder/vdec_ipi_msg.h"
+#include "../encoder/mtk_vcodec_enc.h"
+#include "../encoder/mtk_vcodec_enc_drv.h"
 #include "mtk_vcodec_fw_priv.h"
 
 #define IPI_SEND_TIMEOUT_MS  100U
@@ -223,8 +225,13 @@ static int mtk_vcodec_vcp_msg_ipi_send(struct mtk_vcodec_fw *fw, int id, void *b
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
 	while (!vcp_device->ops->vcp_is_ready(vcp_device, feature_id)) {
@@ -348,7 +355,7 @@ static void mtk_vcodec_vcp_put_device(struct mtk_vcodec_fw *fw)
 static int mtk_vcodec_vcp_load_firmware(struct mtk_vcodec_fw *fw)
 {
 	struct mtk_vcp_device *vcp_device;
-	int ret, feature_id, mem_id, mailbox_id, ipi_id;
+	int ret, feature_id, mem_id, mailbox_id;
 	int i;
 
 	if (fw->vcp->is_init_done) {
@@ -363,10 +370,15 @@ static int mtk_vcodec_vcp_load_firmware(struct mtk_vcodec_fw *fw)
 
 	vcp_device = fw->vcp->vcp_device;
 
-	feature_id = VDEC_FEATURE_ID;
-	mem_id = VDEC_MEM_ID;
-	mailbox_id = IPI_IN_VDEC_1;
-	ipi_id = VCP_IPI_LAT_DECODER;
+	if (fw->fw_use == ENCODER) {
+		feature_id = VENC_FEATURE_ID;
+		mem_id = VENC_MEM_ID;
+		mailbox_id = IPI_IN_VENC_0;
+	} else {
+		feature_id = VDEC_FEATURE_ID;
+		mem_id = VDEC_MEM_ID;
+		mailbox_id = IPI_IN_VDEC_1;
+	}
 
 	ret = mtk_vcp_mbox_ipc_register(vcp_get_ipidev(vcp_device), mailbox_id,
 					mtk_vcodec_vcp_msg_ack_isr, fw, &fw->vcp->share_data);
@@ -402,6 +414,26 @@ static int mtk_vcodec_vcp_load_firmware(struct mtk_vcodec_fw *fw)
 		mutex_init(&fw->vcp->ipi_desc[i].lock);
 	mutex_init(&fw->vcp->ipi_mutex);
 
+	if (fw->fw_use == ENCODER) {
+		init_waitqueue_head(&fw->vcp->msg_wq[VCP_IPI_ENCODER]);
+		fw->vcp->msg_thread =
+			kthread_run(mtk_vcodec_vcp_msg_process_thread, fw, "vcp_enc_msq_thread");
+		if (IS_ERR(fw->vcp->msg_thread)) {
+			ret = PTR_ERR(fw->vcp->msg_thread);
+			fw->vcp->msg_thread = NULL;
+			goto err_deregister_feature;
+		}
+
+		fw->vcp->vsi_addr = vcp_device->ops->get_mem_virt(vcp_device, mem_id);
+		fw->vcp->vsi_size = vcp_device->ops->get_mem_size(vcp_device, mem_id);
+		fw->vcp->iova_addr = vcp_device->ops->get_mem_iova(vcp_device, mem_id);
+
+		dev_dbg(&fw->pdev->dev, "enc vcp init done => va: %p size:0x%x iova:%pad.\n",
+			fw->vcp->vsi_addr, fw->vcp->vsi_size, &fw->vcp->iova_addr);
+
+		return 0;
+	}
+
 	init_waitqueue_head(&fw->vcp->msg_wq[VCP_IPI_LAT_DECODER]);
 	init_waitqueue_head(&fw->vcp->msg_wq[VCP_IPI_CORE_DECODER]);
 	fw->vcp->msg_thread =
@@ -530,7 +562,11 @@ struct mtk_vcodec_fw *mtk_vcodec_fw_vcp_init(void *priv, enum mtk_vcodec_fw_use
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
index 83742096..97ba642d 100644
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
index 0d4e9446..48cb5dde 100644
--- a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c
+++ b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c
@@ -26,7 +26,6 @@
 
 #define MTK_DEFAULT_FRAMERATE_NUM 1001
 #define MTK_DEFAULT_FRAMERATE_DENOM 30000
-#define MTK_VENC_4K_CAPABILITY_ENABLE BIT(0)
 
 static void mtk_venc_worker(struct work_struct *work);
 
diff --git a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.h b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.h
index 908d8179..84156c10 100644
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

