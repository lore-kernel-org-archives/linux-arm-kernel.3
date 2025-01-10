Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93D37E7719C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 01:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qt12eD3ygbrwjFK856tEaB3neRXWwSwG+NqCBxWDDq0=; b=SO/RUKsX3YtRG+L8oQsW3/4Ia+
	Qj9XBnbScnifLay+f+EKNmyR5s8Lj5A6ciyHyJodBdaAbH80BseucXrhPJab1I94xtiTuL3DNi/6I
	g0hA68vz5xk42pOHKpvrHr5arVyRCnzx4oat0HteD7sigGK301e5O2CXvLTRDSC3ZghgFlCiPtGiS
	yi/Pw16wG6HgI4g/lHqkA7/gELRUOpJuRv886nOIotxj9/vF+q8CKBphT7DIRXEB9rlplX5fBIcUW
	FrmKqyVr1udZLF5nWWnm9OIbWCtcvSwDGo4oSa+1zKkx5DWvVNiGHoYJUs5Ys3ZlR3jYKmK6K17g/
	9PQ43X8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tW40p-0000000DmQB-0XSR;
	Fri, 10 Jan 2025 01:40:35 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tW3ol-0000000DkNT-3KLL;
	Fri, 10 Jan 2025 01:28:09 +0000
X-UUID: 21c8bf94cef211ef82ff63e91e7eb18c-20250109
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=Qt12eD3ygbrwjFK856tEaB3neRXWwSwG+NqCBxWDDq0=;
	b=QnJ0LVq4J4p76613GwhscxJrDZTeOW1aQXoG5VDabAUZb72k+hNmybJQnl0xExLBtvsrTxkcjrrmCRnyYbQh8gzPjro4mu4Y9u3y14rtwnyIpuYgqFfMEpoZlqxoN7gow+UxgpAJE8NPZ/lcbPRIiArpa0NABg1A84Xv1Fj+7pc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:12e1fb90-0afb-4449-9308-2c1f353e916d,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:dccda637-e11c-4c1a-89f7-e7a032832c40,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 21c8bf94cef211ef82ff63e91e7eb18c-20250109
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 477307199; Thu, 09 Jan 2025 18:28:01 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 10 Jan 2025 09:27:58 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 10 Jan 2025 09:27:58 +0800
From: kyrie.wu <kyrie.wu@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Tzung-Bi Shih <tzungbi@chromium.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, kyrie wu
	<kyrie.wu@mediatek.corp-partner.google.com>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	kyrie.wu <kyrie.wu@mediatek.com>
Subject: [RESEND,V1,07/12] media: mediatek: jpeg: refactor jpeg dst buffer layout
Date: Fri, 10 Jan 2025 09:27:44 +0800
Message-ID: <20250110012749.30072-8-kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250110012749.30072-1-kyrie.wu@mediatek.com>
References: <20250110012749.30072-1-kyrie.wu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_172807_881034_D2875790 
X-CRM114-Status: GOOD (  14.05  )
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

1. change dst buffer size to same as struct mtk_jpeg_src_buf
to make sure all params of mtk_jpeg_src_buf could get a memory.
2. For memory alloc operation:
the v4l2 framework malloc a memory, the base addr is vb2_buffer and
the size is sizeof(struct mtk_jpeg_src_buf), mtk_jpeg_src_buf could get
itself addr by container_of like that:
vb2_buffer -> vb2_v4l2_buffer -> mtk_jpeg_src_buf.
vb2_v4l2_buffer must keep on the top of mtk_jpeg_src_buf.

Signed-off-by: kyrie.wu <kyrie.wu@mediatek.com>
---
 drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c | 2 +-
 drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
index 83f9451fd3ba..3082d0fcf974 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
@@ -1098,7 +1098,7 @@ static int mtk_jpeg_queue_init(void *priv, struct vb2_queue *src_vq,
 	dst_vq->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
 	dst_vq->io_modes = VB2_DMABUF | VB2_MMAP;
 	dst_vq->drv_priv = ctx;
-	dst_vq->buf_struct_size = sizeof(struct v4l2_m2m_buffer);
+	dst_vq->buf_struct_size = sizeof(struct mtk_jpeg_src_buf);
 	dst_vq->ops = jpeg->variant->qops;
 	dst_vq->mem_ops = &vb2_dma_contig_memops;
 	dst_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
index 38672499ca18..ce9f14e711f5 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
@@ -98,10 +98,10 @@ struct mtk_jpeg_variant {
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
2.46.0


