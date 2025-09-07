Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2F55CA1013
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  7 Sep 2025 09:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RzEQvM++RkeottaJ5vLsxcHwt1Px0R3jVF4cMhjRk7s=; b=CZRwYuFxtkdL5fEX/dLkVdsAKB
	sFP5z57f/dPhiuKGg4mYZ5UKpYx70rcJP5fM2jPac4zXd5MK6ziCCQXVEXWZqo6fsg3UkZX2swfa2
	XVIb2RJfNombEMymwcpi/5bq4J3J0JhUp14wzKQNSYuvkaJJ5+GxeqSC+aaMZOAFk4Jb9saDc0/K8
	Uwi2Y07CjdhH92lJzdHPOGrd37ePYoNAcT2cpZZgGFXmIGPNKBA44IsKKsogOHWamSvHOPF3MauNA
	1wwe4m2ZJhCdoYXfCP2OcNrIxu7btSHPj3pf9+eZDqzbzkGGb6LEXWj7Wd7Xdpt3vJfUwuML+B804
	OvKVsU2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvBwt-0000000ATkO-0BPW;
	Sun, 07 Sep 2025 09:44:39 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvBon-0000000ARaV-07FK;
	Sun, 07 Sep 2025 09:36:18 +0000
X-UUID: 167504b08bce11f09eb0dd999d3936bf-20250907
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=RzEQvM++RkeottaJ5vLsxcHwt1Px0R3jVF4cMhjRk7s=;
	b=EjXnBbBW1X3Sq6mhXILZxk7O0DFMtehgFqOGa7ZGK7D3VhId0h2yth7OboG6AL1S7rpUWM47nQ2sel1HSUMxTF9gfq1Ft+H0hBOFMKS8gRgg8wIkUeFSfBWwOei5LxloR9fTmPV8JZOqi/ddSeGjcBcmWhn4O3nF63UrCnY7UCY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.3,REQID:899c0788-889e-4004-b1fa-d0149ff5f665,IP:0,UR
	L:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-25
X-CID-META: VersionHash:f1326cf,CLOUDID:ba0307f8-ebfe-43c9-88c9-80cb93f22ca4,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:-5,Content:0|15|50,EDM:
	-3,IP:nil,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA
	:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 167504b08bce11f09eb0dd999d3936bf-20250907
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <irui.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2053247782; Sun, 07 Sep 2025 02:36:10 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Sun, 7 Sep 2025 17:36:06 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Sun, 7 Sep 2025 17:36:04 +0800
From: Irui Wang <irui.wang@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>, <nicolas.dufresne@collabora.com>,
	Tiffany Lin <tiffany.lin@mediatek.com>, Yunfei Dong
	<yunfei.dong@mediatek.com>, Qianfeng Rong <rongqianfeng@vivo.com>
CC: Maoguang Meng <maoguang.meng@mediatek.com>, Longfei Wang
	<longfei.wang@mediatek.com>, Irui Wang <irui.wang@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH v3 2/2] media: mediatek: vcodec: use = { } instead of memset()
Date: Sun, 7 Sep 2025 17:35:57 +0800
Message-ID: <20250907093557.8008-3-irui.wang@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250907093557.8008-1-irui.wang@mediatek.com>
References: <20250907093557.8008-1-irui.wang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250907_023617_083488_D5349341 
X-CRM114-Status: GOOD (  16.34  )
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

From: Qianfeng Rong <rongqianfeng@vivo.com>

Based on testing and recommendations by David Lechner et al. [1][2],
using = { } to initialize a structure or array is the preferred way
to do this in the kernel.

Converts memset() to = { }, thereby:
- Eliminating the risk of sizeof() mismatches.
- Simplifying the code.

[1]: https://lore.kernel.org/linux-iio/202505090942.48EBF01B@keescook/
[2]: https://lore.kernel.org/lkml/20250614151844.50524610@jic23-huawei/

Signed-off-by: Qianfeng Rong <rongqianfeng@vivo.com>
---
 .../mediatek/vcodec/decoder/vdec/vdec_vp9_if.c    |  3 +--
 .../mediatek/vcodec/decoder/vdec_vpu_if.c         | 12 ++++--------
 .../mediatek/vcodec/encoder/mtk_vcodec_enc.c      |  6 ++----
 .../mediatek/vcodec/encoder/venc_vpu_if.c         | 15 +++++----------
 4 files changed, 12 insertions(+), 24 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_if.c
index eb3354192853..80554b2c26c0 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_if.c
@@ -548,10 +548,9 @@ static bool vp9_wait_dec_end(struct vdec_vp9_inst *inst)
 static struct vdec_vp9_inst *vp9_alloc_inst(struct mtk_vcodec_dec_ctx *ctx)
 {
 	int result;
-	struct mtk_vcodec_mem mem;
+	struct mtk_vcodec_mem mem = { };
 	struct vdec_vp9_inst *inst;
 
-	memset(&mem, 0, sizeof(mem));
 	mem.size = sizeof(struct vdec_vp9_inst);
 	result = mtk_vcodec_mem_alloc(ctx, &mem);
 	if (result)
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c
index 145958206e38..d5e943f81c15 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c
@@ -181,12 +181,11 @@ static int vcodec_vpu_send_msg(struct vdec_vpu_inst *vpu, void *msg, int len)
 
 static int vcodec_send_ap_ipi(struct vdec_vpu_inst *vpu, unsigned int msg_id)
 {
-	struct vdec_ap_ipi_cmd msg;
+	struct vdec_ap_ipi_cmd msg = { };
 	int err = 0;
 
 	mtk_vdec_debug(vpu->ctx, "+ id=%X", msg_id);
 
-	memset(&msg, 0, sizeof(msg));
 	msg.msg_id = msg_id;
 	if (vpu->fw_abi_version < 2)
 		msg.vpu_inst_addr = vpu->inst_addr;
@@ -201,7 +200,7 @@ static int vcodec_send_ap_ipi(struct vdec_vpu_inst *vpu, unsigned int msg_id)
 
 int vpu_dec_init(struct vdec_vpu_inst *vpu)
 {
-	struct vdec_ap_ipi_init msg;
+	struct vdec_ap_ipi_init msg = { };
 	int err;
 
 	init_waitqueue_head(&vpu->wq);
@@ -225,7 +224,6 @@ int vpu_dec_init(struct vdec_vpu_inst *vpu)
 		}
 	}
 
-	memset(&msg, 0, sizeof(msg));
 	msg.msg_id = AP_IPIMSG_DEC_INIT;
 	msg.ap_inst_addr = (unsigned long)vpu;
 	msg.codec_type = vpu->codec_type;
@@ -245,7 +243,7 @@ int vpu_dec_init(struct vdec_vpu_inst *vpu)
 
 int vpu_dec_start(struct vdec_vpu_inst *vpu, uint32_t *data, unsigned int len)
 {
-	struct vdec_ap_ipi_dec_start msg;
+	struct vdec_ap_ipi_dec_start msg = { };
 	int i;
 	int err = 0;
 
@@ -254,7 +252,6 @@ int vpu_dec_start(struct vdec_vpu_inst *vpu, uint32_t *data, unsigned int len)
 		return -EINVAL;
 	}
 
-	memset(&msg, 0, sizeof(msg));
 	msg.msg_id = AP_IPIMSG_DEC_START;
 	if (vpu->fw_abi_version < 2)
 		msg.vpu_inst_addr = vpu->inst_addr;
@@ -273,7 +270,7 @@ int vpu_dec_start(struct vdec_vpu_inst *vpu, uint32_t *data, unsigned int len)
 int vpu_dec_get_param(struct vdec_vpu_inst *vpu, uint32_t *data,
 		      unsigned int len, unsigned int param_type)
 {
-	struct vdec_ap_ipi_get_param msg;
+	struct vdec_ap_ipi_get_param msg = { };
 	int err;
 
 	if (len > ARRAY_SIZE(msg.data)) {
@@ -281,7 +278,6 @@ int vpu_dec_get_param(struct vdec_vpu_inst *vpu, uint32_t *data,
 		return -EINVAL;
 	}
 
-	memset(&msg, 0, sizeof(msg));
 	msg.msg_id = AP_IPIMSG_DEC_GET_PARAM;
 	msg.inst_id = vpu->inst_id;
 	memcpy(msg.data, data, sizeof(unsigned int) * len);
diff --git a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c
index acf6ddca1c88..d10e41e8e9ce 100644
--- a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c
+++ b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c
@@ -1064,7 +1064,7 @@ static int mtk_venc_encode_header(void *priv)
 
 static int mtk_venc_param_change(struct mtk_vcodec_enc_ctx *ctx)
 {
-	struct venc_enc_param enc_prm;
+	struct venc_enc_param enc_prm = { };
 	struct vb2_v4l2_buffer *vb2_v4l2 = v4l2_m2m_next_src_buf(ctx->m2m_ctx);
 	struct mtk_video_enc_buf *mtk_buf;
 	int ret = 0;
@@ -1075,7 +1075,6 @@ static int mtk_venc_param_change(struct mtk_vcodec_enc_ctx *ctx)
 
 	mtk_buf = container_of(vb2_v4l2, struct mtk_video_enc_buf, m2m_buf.vb);
 
-	memset(&enc_prm, 0, sizeof(enc_prm));
 	if (mtk_buf->param_change == MTK_ENCODE_PARAM_NONE)
 		return 0;
 
@@ -1138,7 +1137,7 @@ static void mtk_venc_worker(struct work_struct *work)
 	struct mtk_vcodec_enc_ctx *ctx = container_of(work, struct mtk_vcodec_enc_ctx,
 				    encode_work);
 	struct vb2_v4l2_buffer *src_buf, *dst_buf;
-	struct venc_frm_buf frm_buf;
+	struct venc_frm_buf frm_buf = { };
 	struct mtk_vcodec_mem bs_buf;
 	struct venc_done_result enc_result = { };
 	int ret, i;
@@ -1168,7 +1167,6 @@ static void mtk_venc_worker(struct work_struct *work)
 		return;
 	}
 
-	memset(&frm_buf, 0, sizeof(frm_buf));
 	for (i = 0; i < src_buf->vb2_buf.num_planes ; i++) {
 		frm_buf.fb_addr[i].dma_addr =
 				vb2_dma_contig_plane_dma_addr(&src_buf->vb2_buf, i);
diff --git a/drivers/media/platform/mediatek/vcodec/encoder/venc_vpu_if.c b/drivers/media/platform/mediatek/vcodec/encoder/venc_vpu_if.c
index 51bb7ee141b9..55627b71348d 100644
--- a/drivers/media/platform/mediatek/vcodec/encoder/venc_vpu_if.c
+++ b/drivers/media/platform/mediatek/vcodec/encoder/venc_vpu_if.c
@@ -132,7 +132,7 @@ static int vpu_enc_send_msg(struct venc_vpu_inst *vpu, void *msg,
 int vpu_enc_init(struct venc_vpu_inst *vpu)
 {
 	int status;
-	struct venc_ap_ipi_msg_init out;
+	struct venc_ap_ipi_msg_init out = { };
 
 	init_waitqueue_head(&vpu->wq_hd);
 	vpu->signaled = 0;
@@ -148,7 +148,6 @@ int vpu_enc_init(struct venc_vpu_inst *vpu)
 		return -EINVAL;
 	}
 
-	memset(&out, 0, sizeof(out));
 	out.msg_id = AP_IPIMSG_ENC_INIT;
 	out.venc_inst = (unsigned long)vpu;
 	if (vpu_enc_send_msg(vpu, &out, sizeof(out))) {
@@ -191,11 +190,10 @@ int vpu_enc_set_param(struct venc_vpu_inst *vpu,
 	size_t msg_size = is_ext ?
 		sizeof(struct venc_ap_ipi_msg_set_param_ext) :
 		sizeof(struct venc_ap_ipi_msg_set_param);
-	struct venc_ap_ipi_msg_set_param_ext out;
+	struct venc_ap_ipi_msg_set_param_ext out = { };
 
 	mtk_venc_debug(vpu->ctx, "id %d ->", id);
 
-	memset(&out, 0, sizeof(out));
 	out.base.msg_id = AP_IPIMSG_ENC_SET_PARAM;
 	out.base.vpu_inst_addr = vpu->inst_addr;
 	out.base.param_id = id;
@@ -258,11 +256,10 @@ static int vpu_enc_encode_32bits(struct venc_vpu_inst *vpu,
 	size_t msg_size = is_ext ?
 		sizeof(struct venc_ap_ipi_msg_enc_ext) :
 		sizeof(struct venc_ap_ipi_msg_enc);
-	struct venc_ap_ipi_msg_enc_ext out;
+	struct venc_ap_ipi_msg_enc_ext out = { };
 
 	mtk_venc_debug(vpu->ctx, "bs_mode %d ->", bs_mode);
 
-	memset(&out, 0, sizeof(out));
 	out.base.msg_id = AP_IPIMSG_ENC_ENCODE;
 	out.base.vpu_inst_addr = vpu->inst_addr;
 	out.base.bs_mode = bs_mode;
@@ -302,12 +299,11 @@ static int vpu_enc_encode_34bits(struct venc_vpu_inst *vpu,
 				 struct mtk_vcodec_mem *bs_buf,
 				 struct venc_frame_info *frame_info)
 {
-	struct venc_ap_ipi_msg_enc_ext_34 out;
+	struct venc_ap_ipi_msg_enc_ext_34 out = { };
 	size_t msg_size = sizeof(struct venc_ap_ipi_msg_enc_ext_34);
 
 	mtk_venc_debug(vpu->ctx, "bs_mode %d ->", bs_mode);
 
-	memset(&out, 0, sizeof(out));
 	out.msg_id = AP_IPIMSG_ENC_ENCODE;
 	out.vpu_inst_addr = vpu->inst_addr;
 	out.bs_mode = bs_mode;
@@ -367,9 +363,8 @@ int vpu_enc_encode(struct venc_vpu_inst *vpu, unsigned int bs_mode,
 
 int vpu_enc_deinit(struct venc_vpu_inst *vpu)
 {
-	struct venc_ap_ipi_msg_deinit out;
+	struct venc_ap_ipi_msg_deinit out = { };
 
-	memset(&out, 0, sizeof(out));
 	out.msg_id = AP_IPIMSG_ENC_DEINIT;
 	out.vpu_inst_addr = vpu->inst_addr;
 	if (vpu_enc_send_msg(vpu, &out, sizeof(out))) {
-- 
2.45.2


