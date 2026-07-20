Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 999D1C44512
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 01:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mqn6xVTYxscmZp7LbzLmm4SdugHdG+lA/grqWYF4P1o=; b=I7YZturKKpQ+fyZo0IPNGh0v6M
	TphX0JOUSB0t0Y7HQT7rhovtasG/WECqu0b67jCStGCXwzT8W3Niine9Li6wMakJWxkvlwMuQ9YMq
	smFSmpwK6FTcQp9EpZ4REQFyPZBXbKOEum0jDKkN9ICCtfhbaRoEq5P7P1Hc6+MXxPaXp8dK7C1UK
	bHZ+M/LujdQy/DyP1FI/b0CN6u1WS9kAHGuT/LK/RJNbzQ4QEbfPeb+HFvsNfV9H49VyqUMCtjyUI
	nVhjmhczggne+JQB2ZWLeApTQUxf98ggXwPAn01AYYyt/esh1Db1+6b1EzLI1jRdjyBxSaj+4L/rh
	zqKK+PQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlchB-00000005amu-1w4Z;
	Mon, 20 Jul 2026 01:21:25 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlch0-00000005ad3-0zfZ;
	Mon, 20 Jul 2026 01:21:15 +0000
X-UUID: 49b9f26e83d911f1acbe4559397dec65-20260719
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=mqn6xVTYxscmZp7LbzLmm4SdugHdG+lA/grqWYF4P1o=;
	b=pqXcsiIvp6avphKs+IL3Ypmajhc6ULStG2n75mIRqbiY10VOJQx2tglRqZf4fERzSNzssM3GZm1CwH1jyDnntgUDtnSLCne8Bmeg25oDh96ZrPfgYN8J3UtBzoCBLhDuCifLSDqJIbQpaQP16PQ9XEs3t+p6u7LBOD0yWZcPuPg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.18,REQID:52e5b8c2-a4bb-4fa6-8bc7-92feab9eb1f1,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:8a735a6,CLOUDID:cbe8f99b-75c7-410a-a98f-13895d3131d4,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,
	OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 49b9f26e83d911f1acbe4559397dec65-20260719
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 611725296; Sun, 19 Jul 2026 18:21:09 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 20 Jul 2026 09:21:06 +0800
Received: from gcnsap21.gcn.mediatek.inc (10.17.81.22) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Mon, 20 Jul 2026 09:21:05 +0800
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
	<tfiga@chromium.org>, Sebastian Fricke <sebastian.fricke@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, Qianfeng Rong <rongqianfeng@vivo.com>,
	Irui Wang <irui.wang@mediatek.com>, Jacopo Mondi
	<jacopo.mondi@ideasonboard.com>, Fan Wu <fanwu01@zju.edu.cn>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
CC: Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCH v6 04/14] media: mediatek: vcodec: get different firmware ipi id
Date: Mon, 20 Jul 2026 09:20:46 +0800
Message-ID: <20260720012056.1026551-5-kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260720012056.1026551-1-kyrie.wu@mediatek.com>
References: <20260720012056.1026551-1-kyrie.wu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260719_182114_300002_760AECBF 
X-CRM114-Status: GOOD (  14.54  )
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

Getting ipi(inter-processor interrupt) id according to firmware
type and hardware index for different architecture.

Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
---
 .../mediatek/vcodec/common/mtk_vcodec_fw.c         | 14 ++++++++++++++
 .../mediatek/vcodec/common/mtk_vcodec_fw.h         |  1 +
 .../vcodec/decoder/vdec/vdec_av1_req_lat_if.c      |  5 +++--
 .../vcodec/decoder/vdec/vdec_h264_req_multi_if.c   |  5 +++--
 .../vcodec/decoder/vdec/vdec_hevc_req_multi_if.c   |  5 +++--
 .../mediatek/vcodec/decoder/vdec/vdec_vp8_req_if.c |  5 +++--
 .../vcodec/decoder/vdec/vdec_vp9_req_lat_if.c      |  5 +++--
 7 files changed, 30 insertions(+), 10 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.c b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.c
index 552d0d8a8..8630e871d 100644
--- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.c
+++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.c
@@ -3,6 +3,20 @@
 #include "../decoder/mtk_vcodec_dec_drv.h"
 #include "../encoder/mtk_vcodec_enc_drv.h"
 #include "mtk_vcodec_fw_priv.h"
+#include "mtk_vcodec_fw_vcp.h"
+
+int mtk_vcodec_fw_get_ipi(enum mtk_vcodec_fw_type type, int hw_id)
+{
+	switch (type) {
+	case SCP:
+		return hw_id == MTK_VDEC_LAT0 ? SCP_IPI_VDEC_LAT : SCP_IPI_VDEC_CORE;
+	case VCP:
+		return hw_id == MTK_VDEC_LAT0 ? VCP_IPI_LAT_DECODER : VCP_IPI_CORE_DECODER;
+	default:
+		return -EINVAL;
+	}
+}
+EXPORT_SYMBOL_GPL(mtk_vcodec_fw_get_ipi);
 
 struct mtk_vcodec_fw *mtk_vcodec_fw_select(void *priv, enum mtk_vcodec_fw_use fw_use,
 					   mtk_vcodec_fw_init_func fw_init)
diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.h b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.h
index 50d93d47b..005ac9969 100644
--- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.h
+++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.h
@@ -43,5 +43,6 @@ int mtk_vcodec_fw_ipi_register(struct mtk_vcodec_fw *fw, int id,
 int mtk_vcodec_fw_ipi_send(struct mtk_vcodec_fw *fw, int id,
 			   void *buf, unsigned int len, unsigned int wait);
 int mtk_vcodec_fw_get_type(struct mtk_vcodec_fw *fw);
+int mtk_vcodec_fw_get_ipi(enum mtk_vcodec_fw_type type, int hw_id);
 
 #endif /* _MTK_VCODEC_FW_H_ */
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_lat_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_lat_if.c
index 2d622e85f..756fbb777 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_lat_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_lat_if.c
@@ -1877,6 +1877,7 @@ static int vdec_av1_slice_init(struct mtk_vcodec_dec_ctx *ctx)
 {
 	struct vdec_av1_slice_instance *instance;
 	struct vdec_av1_slice_init_vsi *vsi;
+	enum mtk_vcodec_fw_type fw_type = ctx->dev->fw_handler->type;
 	int ret;
 
 	instance = kzalloc_obj(*instance);
@@ -1884,8 +1885,8 @@ static int vdec_av1_slice_init(struct mtk_vcodec_dec_ctx *ctx)
 		return -ENOMEM;
 
 	instance->ctx = ctx;
-	instance->vpu.id = SCP_IPI_VDEC_LAT;
-	instance->vpu.core_id = SCP_IPI_VDEC_CORE;
+	instance->vpu.id = mtk_vcodec_fw_get_ipi(fw_type, MTK_VDEC_LAT0);
+	instance->vpu.core_id = mtk_vcodec_fw_get_ipi(fw_type, MTK_VDEC_CORE);
 	instance->vpu.ctx = ctx;
 	instance->vpu.codec_type = ctx->current_codec;
 
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c
index 10359ce9b..69d607171 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c
@@ -1204,6 +1204,7 @@ static int vdec_h264_slice_single_decode(void *h_vdec, struct mtk_vcodec_mem *bs
 
 static int vdec_h264_slice_init(struct mtk_vcodec_dec_ctx *ctx)
 {
+	enum mtk_vcodec_fw_type fw_type = ctx->dev->fw_handler->type;
 	struct vdec_h264_slice_inst *inst;
 	int err, vsi_size;
 	unsigned char *temp;
@@ -1214,8 +1215,8 @@ static int vdec_h264_slice_init(struct mtk_vcodec_dec_ctx *ctx)
 
 	inst->ctx = ctx;
 
-	inst->vpu.id = SCP_IPI_VDEC_LAT;
-	inst->vpu.core_id = SCP_IPI_VDEC_CORE;
+	inst->vpu.id = mtk_vcodec_fw_get_ipi(fw_type, MTK_VDEC_LAT0);
+	inst->vpu.core_id = mtk_vcodec_fw_get_ipi(fw_type, MTK_VDEC_CORE);
 	inst->vpu.ctx = ctx;
 	inst->vpu.codec_type = ctx->current_codec;
 	inst->vpu.capture_type = ctx->capture_fourcc;
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_hevc_req_multi_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_hevc_req_multi_if.c
index 02f39954a..dd638ef44 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_hevc_req_multi_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_hevc_req_multi_if.c
@@ -855,6 +855,7 @@ static int vdec_hevc_slice_setup_core_buffer(struct vdec_hevc_slice_inst *inst,
 
 static int vdec_hevc_slice_init(struct mtk_vcodec_dec_ctx *ctx)
 {
+	enum mtk_vcodec_fw_type fw_type = ctx->dev->fw_handler->type;
 	struct vdec_hevc_slice_inst *inst;
 	int err, vsi_size;
 
@@ -864,8 +865,8 @@ static int vdec_hevc_slice_init(struct mtk_vcodec_dec_ctx *ctx)
 
 	inst->ctx = ctx;
 
-	inst->vpu.id = SCP_IPI_VDEC_LAT;
-	inst->vpu.core_id = SCP_IPI_VDEC_CORE;
+	inst->vpu.id = mtk_vcodec_fw_get_ipi(fw_type, MTK_VDEC_LAT0);
+	inst->vpu.core_id = mtk_vcodec_fw_get_ipi(fw_type, MTK_VDEC_CORE);
 	inst->vpu.ctx = ctx;
 	inst->vpu.codec_type = ctx->current_codec;
 	inst->vpu.capture_type = ctx->capture_fourcc;
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp8_req_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp8_req_if.c
index 391e789a5..d65e276f6 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp8_req_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp8_req_if.c
@@ -272,6 +272,7 @@ static int vdec_vp8_slice_get_decode_parameters(struct vdec_vp8_slice_inst *inst
 
 static int vdec_vp8_slice_init(struct mtk_vcodec_dec_ctx *ctx)
 {
+	enum mtk_vcodec_fw_type fw_type = ctx->dev->fw_handler->type;
 	struct vdec_vp8_slice_inst *inst;
 	int err;
 
@@ -281,8 +282,8 @@ static int vdec_vp8_slice_init(struct mtk_vcodec_dec_ctx *ctx)
 
 	inst->ctx = ctx;
 
-	inst->vpu.id = SCP_IPI_VDEC_LAT;
-	inst->vpu.core_id = SCP_IPI_VDEC_CORE;
+	inst->vpu.id = mtk_vcodec_fw_get_ipi(fw_type, MTK_VDEC_LAT0);
+	inst->vpu.core_id = mtk_vcodec_fw_get_ipi(fw_type, MTK_VDEC_CORE);
 	inst->vpu.ctx = ctx;
 	inst->vpu.codec_type = ctx->current_codec;
 	inst->vpu.capture_type = ctx->capture_fourcc;
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
index adbacabdb..1f0479a8f 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
@@ -1844,6 +1844,7 @@ static int vdec_vp9_slice_update_core(struct vdec_vp9_slice_instance *instance,
 
 static int vdec_vp9_slice_init(struct mtk_vcodec_dec_ctx *ctx)
 {
+	enum mtk_vcodec_fw_type fw_type = ctx->dev->fw_handler->type;
 	struct vdec_vp9_slice_instance *instance;
 	struct vdec_vp9_slice_init_vsi *vsi;
 	int ret;
@@ -1853,8 +1854,8 @@ static int vdec_vp9_slice_init(struct mtk_vcodec_dec_ctx *ctx)
 		return -ENOMEM;
 
 	instance->ctx = ctx;
-	instance->vpu.id = SCP_IPI_VDEC_LAT;
-	instance->vpu.core_id = SCP_IPI_VDEC_CORE;
+	instance->vpu.id = mtk_vcodec_fw_get_ipi(fw_type, MTK_VDEC_LAT0);
+	instance->vpu.core_id = mtk_vcodec_fw_get_ipi(fw_type, MTK_VDEC_CORE);
 	instance->vpu.ctx = ctx;
 	instance->vpu.codec_type = ctx->current_codec;
 
-- 
2.51.0.windows.2


