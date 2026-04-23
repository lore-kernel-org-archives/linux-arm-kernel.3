Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D5EDF99362
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 09:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dv4q3QCS2bw6tsf5AKy0XdoxeBKQtpp9WLzz7tVkqnA=; b=pxN9/9SdwGdoD3aLibykO/U6qK
	TemH/ASc4IdV3l/iqzOlkKG4pRBMRecPkrlRcfUD7zNo6x+1WTCDOtiaYV1ccuLwZLy0ChUrw2kcq
	OmYsNpebhS9wycs+yLOlFazKPX7sew/mH22f8uWKLNAei+QoSCnbr+3bX27yggSdtW0guWTVTUBlq
	0vUcxQuGhDqcE//6l5mwc4scfWW9+SFhFRPlhyZDmQhnrn8udFhY4oLpGU6vITG82JzBs/7hQheL7
	iRNl9HwM8XNSe/bMmf1zvwEmQL+4MHGQBEvjAsuNT9RGQIdvr6j30xsKb1Gg/0/feoG0Ur1NSZMP1
	sHAsBDvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFqeT-0000000BQ7O-3Q3n;
	Thu, 23 Apr 2026 09:47:17 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFqeN-0000000BPzp-2V8r;
	Thu, 23 Apr 2026 09:47:12 +0000
X-UUID: 6409d85c3ef911f1a6de359d7043e138-20260423
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From; bh=Dv4q3QCS2bw6tsf5AKy0XdoxeBKQtpp9WLzz7tVkqnA=;
	b=nEf5OvzpKpndJDVvTNu6P1OxqGDNrazCzseclEfrt9+8XyMfudc+HJzbW6OEpbTqU8YO28Q6jec4Unbf9X9px/l8ce1dBycd+99CbbVadNwC7CUKZKCW+rlExo+kSRBBUitjF+PED4zToeTp+sElYFITk6qDkLo4RkR0+3GBlXM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:cad062bc-755c-43be-9426-bfeaa31f9125,IP:0,U
	RL:0,TC:0,Content:-5,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:-30
X-CID-META: VersionHash:e7bac3a,CLOUDID:c48a3bd6-060f-4ecc-9ee0-121eeeb4a682,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|865|888|898,TC:-5,Cont
	ent:0|15|50,EDM:2,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 6409d85c3ef911f1a6de359d7043e138-20260423
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw02.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1399226508; Thu, 23 Apr 2026 02:47:07 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 23 Apr 2026 17:47:03 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Thu, 23 Apr 2026 17:47:03 +0800
From: Kyrie Wu <kyrie.wu@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Kyrie Wu <kyrie.wu@mediatek.com>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
Subject: [PATCH v14 03/12] media: mediatek: jpeg: fix buffer structure size and layout
Date: Thu, 23 Apr 2026 17:46:47 +0800
Message-ID: <20260423094656.32044-4-kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20260423094656.32044-1-kyrie.wu@mediatek.com>
References: <20260423094656.32044-1-kyrie.wu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_024711_665681_7882A655 
X-CRM114-Status: GOOD (  13.88  )
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

Updates the `buf_struct_size` in the JPEG driver to use the correct
structure `mtk_jpeg_src_buf` instead of `v4l2_m2m_buffer`, ensuring
proper handling of source buffers. The previous buffer size led to
mismatches and potential issues during video buffer handling.

Moves `frame_num` in the `mtk_jpeg_src_buf` structure to align with
other members appropriately. The first field of the driver-specific
buffer structure must be the subsystem-specificstruct
(vb2_v4l2_buffer in the case of V4L2).

Fixes: 5fb1c2361e56 ("mtk-jpegenc: add jpeg encode worker interface")
Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
 drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c | 2 +-
 drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
index 10d3bfd7ddd5..ef7362feb697 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
@@ -1092,7 +1092,7 @@ static int mtk_jpeg_queue_init(void *priv, struct vb2_queue *src_vq,
 	dst_vq->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
 	dst_vq->io_modes = VB2_DMABUF | VB2_MMAP;
 	dst_vq->drv_priv = ctx;
-	dst_vq->buf_struct_size = sizeof(struct v4l2_m2m_buffer);
+	dst_vq->buf_struct_size = sizeof(struct mtk_jpeg_src_buf);
 	dst_vq->ops = jpeg->variant->qops;
 	dst_vq->mem_ops = &vb2_dma_contig_memops;
 	dst_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
index 6be5cf30dea1..148fd41759b7 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
@@ -85,10 +85,10 @@ struct mtk_jpeg_variant {
 };
 
 struct mtk_jpeg_src_buf {
-	u32 frame_num;
 	struct vb2_v4l2_buffer b;
 	struct list_head list;
 	u32 bs_size;
+	u32 frame_num;
 	struct mtk_jpeg_dec_param dec_param;
 
 	struct mtk_jpeg_ctx *curr_ctx;
-- 
2.45.2


