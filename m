Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAD53CCD183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 06:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R/yxOD9SvhwV6h3QTG3RdIU0HppZxoSPrognPmbzYlQ=; b=Lt+QYKzJM6mJaJpSjcF5JNlHiJ
	qosDMDAQ0Qn/fzbk0Qf0HC0f6i4fleMn2J+uwBeD+ZZaTnHpuHu9keC+UQFBEiYGvY68LkW+RQ6Es
	scPpsPO1rPN1Uq4z9NtiFWdywDASWltw+cPA6RreabdLsLCxkrMvP0OG+Img+yKHFLxHNpXacBw3V
	LER6H4wd2ZnwjA+kCP0s2UH5tV8NT2eK5SCUUECrfEW/G+rUUH0sWtLoEikW+9wRqFobYtO62/AGY
	dhGv3uB/0aqUDslungRfPtaTNh6+RdDyW42N2/vEa3aQoBJTTnVqBQ/nmr34rYe3+HhvuygnekxYV
	5C1YpZQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9H9y-00000003Zpy-0Vqr;
	Thu, 16 Oct 2025 06:08:22 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9H9q-00000003ZfY-1ISw;
	Thu, 16 Oct 2025 06:08:15 +0000
X-UUID: 7cd88834aa5611f0a52f393f94899d25-20251015
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=R/yxOD9SvhwV6h3QTG3RdIU0HppZxoSPrognPmbzYlQ=;
	b=sgH2ZqkG3tWL2tLHZd0qrfCMjHm4iK90ZhH+6zOYaMNnCOruuniVPi3POpPmd5wSf0wMj7+SNUmR/FuqZmdll1q1JXj344CiSh1j7oCjAPG2l0Wn+ApXpVUSULcz17S7qDmwuxDiNhB4s9xi8QbKSfGwmbzzCSRKv//vZ2BD75I=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:4bc308f2-7934-497d-ad20-2f49aca20311,IP:0,UR
	L:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-25
X-CID-META: VersionHash:a9d874c,CLOUDID:66ad7202-eaf8-4c8c-94de-0bc39887e077,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 7cd88834aa5611f0a52f393f94899d25-20251015
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 575642847; Wed, 15 Oct 2025 23:08:08 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Thu, 16 Oct 2025 14:08:05 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1748.10 via Frontend Transport; Thu, 16 Oct 2025 14:08:04 +0800
From: Kyrie Wu <kyrie.wu@mediatek.com>
To: Tiffany Lin <tiffany.lin@mediatek.com>, Andrew-CT Chen
	<andrew-ct.chen@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>, "Mauro
 Carvalho Chehab" <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Kyrie Wu <kyrie.wu@mediatek.com>,
	Hans Verkuil <hverkuil@xs4all.nl>, Nicolas Dufresne
	<nicolas.dufresne@collabora.com>, Christophe JAILLET
	<christophe.jaillet@wanadoo.fr>, Sebastian Fricke
	<sebastian.fricke@collabora.com>, Nathan Hebert <nhebert@chromium.org>, "Arnd
 Bergmann" <arnd@arndb.de>, Irui Wang <irui.wang@mediatek.com>, George Sun
	<george.sun@mediatek.com>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
CC: Neil Armstrong <neil.armstrong@linaro.org>, Andrzej Pietrasiewicz
	<andrzejtp2010@gmail.com>
Subject: [PATCH v4 4/8] media: mediatek: vcodec: Add core-only VP9 decoding support for MT8189
Date: Thu, 16 Oct 2025 14:07:42 +0800
Message-ID: <20251016060747.20648-5-kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20251016060747.20648-1-kyrie.wu@mediatek.com>
References: <20251016060747.20648-1-kyrie.wu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_230814_360883_46272FF3 
X-CRM114-Status: GOOD (  13.57  )
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

Implemented core-only VP9 decoding functions for MT8189.

Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
---
 .../vcodec/decoder/vdec/vdec_vp9_req_lat_if.c | 27 +++++++++++--------
 1 file changed, 16 insertions(+), 11 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
index fa0f406f7726..04197164fb82 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
@@ -23,6 +23,7 @@
 
 #define VP9_TILE_BUF_SIZE 4096
 #define VP9_PROB_BUF_SIZE 2560
+#define VP9_PROB_BUF_4K_SIZE 3840
 #define VP9_COUNTS_BUF_SIZE 16384
 
 #define HDR_FLAG(x) (!!((hdr)->flags & V4L2_VP9_FRAME_FLAG_##x))
@@ -616,7 +617,10 @@ static int vdec_vp9_slice_alloc_working_buffer(struct vdec_vp9_slice_instance *i
 	}
 
 	if (!instance->prob.va) {
-		instance->prob.size = VP9_PROB_BUF_SIZE;
+		instance->prob.size = ((ctx->dev->chip_name == MTK_VDEC_MT8196) ||
+				       (ctx->dev->chip_name == MTK_VDEC_MT8189)) ?
+					VP9_PROB_BUF_4K_SIZE : VP9_PROB_BUF_SIZE;
+
 		if (mtk_vcodec_mem_alloc(ctx, &instance->prob))
 			goto err;
 	}
@@ -696,21 +700,22 @@ static int vdec_vp9_slice_tile_offset(int idx, int mi_num, int tile_log2)
 	return min(offset, mi_num);
 }
 
-static
-int vdec_vp9_slice_setup_single_from_src_to_dst(struct vdec_vp9_slice_instance *instance)
+static int vdec_vp9_slice_setup_single_from_src_to_dst(struct vdec_vp9_slice_instance *instance,
+						       struct mtk_vcodec_mem *bs,
+						       struct vdec_fb *fb)
 {
-	struct vb2_v4l2_buffer *src;
-	struct vb2_v4l2_buffer *dst;
+	struct mtk_video_dec_buf *src_buf_info;
+	struct mtk_video_dec_buf *dst_buf_info;
 
-	src = v4l2_m2m_next_src_buf(instance->ctx->m2m_ctx);
-	if (!src)
+	src_buf_info = container_of(bs, struct mtk_video_dec_buf, bs_buffer);
+	if (!src_buf_info)
 		return -EINVAL;
 
-	dst = v4l2_m2m_next_dst_buf(instance->ctx->m2m_ctx);
-	if (!dst)
+	dst_buf_info = container_of(fb, struct mtk_video_dec_buf, frame_buffer);
+	if (!dst_buf_info)
 		return -EINVAL;
 
-	v4l2_m2m_buf_copy_metadata(src, dst, true);
+	v4l2_m2m_buf_copy_metadata(&src_buf_info->m2m_buf.vb, &dst_buf_info->m2m_buf.vb, true);
 
 	return 0;
 }
@@ -1800,7 +1805,7 @@ static int vdec_vp9_slice_setup_single(struct vdec_vp9_slice_instance *instance,
 	struct vdec_vp9_slice_vsi *vsi = &pfc->vsi;
 	int ret;
 
-	ret = vdec_vp9_slice_setup_single_from_src_to_dst(instance);
+	ret = vdec_vp9_slice_setup_single_from_src_to_dst(instance, bs, fb);
 	if (ret)
 		goto err;
 
-- 
2.45.2


