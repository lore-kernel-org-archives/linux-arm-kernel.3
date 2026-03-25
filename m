Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D7F5109C027
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 14:52:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KiaNVFcKBUOG+7y65a8Ef/4/6TN28uo08L6KOj85jrA=; b=B464EexrtaRteJlSTlxG8nOCsL
	XhNPG0S+kmxiCTdvwwVOdUXu9klbphCQyvcvcKk4GqqW1DN/uMd8twF08uQMLmf23LrlZZ0LoLSp0
	yXs1ftDC+ChwqY1FWuFFJt3kJW/DQxhCWU//WcdaNVG1bFBIjmSe+y/13muw6nE2x3ATt8dC74zyY
	LIsPOyg1EfPwJfMpxCp13i76uLchOgN8k0hUJE14EaU6ia/Q4tZuWvkRpcHAyHDJASvvLhSoSAOw0
	Aa0Q2m7huJlKiubz6iuzU5Yb5/hUqoQjKLjk+w4c0bLiqh4EAHhwa8/hoLH40yP/tYUOiqUf5adva
	WJuItbmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Pax-00000003hOa-3TeX;
	Wed, 25 Mar 2026 14:52:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5PZk-00000003fiN-2AJr
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 25 Mar 2026 14:51:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=KiaNVFcKBUOG+7y65a8Ef/4/6TN28uo08L6KOj85jrA=; b=edfMFlAfX33sQn/4zNTB/J5dat
	zwIrQy5wZHvW40Ip6mTSEDtU0caTHJnbLkxEmh9tYdtasxreZbus8KSxWq6k0TEG/zmlof19pHlFe
	Hq0tI07njQVZ8tXlWNCuH8WrIO5nECZMioKbO8Pc9TMj7Zv5nFWYfVqLva7dDvakzLCdEKzILPcLi
	16OhdSO3A15WTjDkiQ+OshQRLBhKjnPqRUXMZ/qUSFhm+I9MfTg3+v0p2NyknLE0YE5A/CMgG9CDI
	PmA4/aky1wQLW4+QqNB2ZnWIRtLHuHEewSnigIb5lMraq2R/jr6a1ZstKMfSq31J1KM2vcrgezO/e
	cew4L4Bw==;
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5PZd-00000006OaJ-3ziJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 14:51:14 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=peter.mobile.pengutronix.de)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.pueschel@pengutronix.de>)
	id 1w5PZV-00050C-Up; Wed, 25 Mar 2026 15:51:01 +0100
From: =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
Date: Wed, 25 Mar 2026 15:50:52 +0100
Subject: [PATCH v4 21/27] media: rockchip: rga: remove size from rga_frame
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260325-spu-rga3-v4-21-e90ec1c61354@pengutronix.de>
References: <20260325-spu-rga3-v4-0-e90ec1c61354@pengutronix.de>
In-Reply-To: <20260325-spu-rga3-v4-0-e90ec1c61354@pengutronix.de>
To: Jacob Chen <jacob-chen@iotwrt.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, kernel@pengutronix.de, nicolas@ndufresne.ca, 
 sebastian.reichel@collabora.com, 
 =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>
X-Mailer: b4 0.15.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.pueschel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_145110_096817_BF9642C4 
X-CRM114-Status: GOOD (  15.33  )
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

The size member is only used for the mmu page table mapping.
Therefore avoid storing the value and instead only calculate it
in place. This also avoids the calculation entirely when an external
iommu is used.

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Signed-off-by: Sven Püschel <s.pueschel@pengutronix.de>
---
 drivers/media/platform/rockchip/rga/rga-buf.c | 6 +++++-
 drivers/media/platform/rockchip/rga/rga.c     | 8 ++------
 drivers/media/platform/rockchip/rga/rga.h     | 1 -
 3 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/rockchip/rga/rga-buf.c b/drivers/media/platform/rockchip/rga/rga-buf.c
index 4e82ca1a5e8d9..c0cc885ba58a8 100644
--- a/drivers/media/platform/rockchip/rga/rga-buf.c
+++ b/drivers/media/platform/rockchip/rga/rga-buf.c
@@ -79,6 +79,8 @@ static int rga_buf_init(struct vb2_buffer *vb)
 	struct rockchip_rga *rga = ctx->rga;
 	struct rga_frame *f = rga_get_frame(ctx, vb->vb2_queue->type);
 	size_t n_desc = 0;
+	u32 size = 0;
+	u8 i;
 
 	if (IS_ERR(f))
 		return PTR_ERR(f);
@@ -86,7 +88,9 @@ static int rga_buf_init(struct vb2_buffer *vb)
 	if (!rga_has_internal_iommu(rga))
 		return 0;
 
-	n_desc = DIV_ROUND_UP(f->size, PAGE_SIZE);
+	for (i = 0; i < f->pix.num_planes; i++)
+		size += f->pix.plane_fmt[i].sizeimage;
+	n_desc = DIV_ROUND_UP(size, PAGE_SIZE);
 
 	rbuf->n_desc = n_desc;
 	rbuf->dma_desc = dma_alloc_coherent(rga->dev,
diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/platform/rockchip/rga/rga.c
index eb7b211a99e66..2695bc5077a03 100644
--- a/drivers/media/platform/rockchip/rga/rga.c
+++ b/drivers/media/platform/rockchip/rga/rga.c
@@ -221,7 +221,6 @@ static int rga_open(struct file *file)
 	};
 
 	def_frame.stride = (def_width * def_frame.fmt->depth) >> 3;
-	def_frame.size = def_frame.stride * def_height;
 
 	ctx = kzalloc_obj(*ctx);
 	if (!ctx)
@@ -459,9 +458,6 @@ static int vidioc_s_fmt(struct file *file, void *priv, struct v4l2_format *f)
 	frm = rga_get_frame(ctx, f->type);
 	if (IS_ERR(frm))
 		return PTR_ERR(frm);
-	frm->size = 0;
-	for (i = 0; i < pix_fmt->num_planes; i++)
-		frm->size += pix_fmt->plane_fmt[i].sizeimage;
 	frm->fmt = rga_fmt_find(rga, pix_fmt->pixelformat);
 	frm->stride = pix_fmt->plane_fmt[0].bytesperline;
 
@@ -485,10 +481,10 @@ static int vidioc_s_fmt(struct file *file, void *priv, struct v4l2_format *f)
 	frm->pix = *pix_fmt;
 
 	v4l2_dbg(debug, 1, &rga->v4l2_dev,
-		 "[%s] fmt - %p4cc %dx%d (stride %d, sizeimage %d)\n",
+		 "[%s] fmt - %p4cc %dx%d (stride %d)\n",
 		  V4L2_TYPE_IS_OUTPUT(f->type) ? "OUTPUT" : "CAPTURE",
 		  &frm->fmt->fourcc, pix_fmt->width, pix_fmt->height,
-		  frm->stride, frm->size);
+		  frm->stride);
 
 	for (i = 0; i < pix_fmt->num_planes; i++) {
 		v4l2_dbg(debug, 1, &rga->v4l2_dev,
diff --git a/drivers/media/platform/rockchip/rga/rga.h b/drivers/media/platform/rockchip/rga/rga.h
index 95fa7fd1c509a..2838fc7785f72 100644
--- a/drivers/media/platform/rockchip/rga/rga.h
+++ b/drivers/media/platform/rockchip/rga/rga.h
@@ -34,7 +34,6 @@ struct rga_frame {
 
 	/* Variables that can calculated once and reused */
 	u32 stride;
-	u32 size;
 };
 
 struct rga_dma_desc {

-- 
2.53.0


