Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B2A6CD4F25
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 15:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VLt6FrL1oCiwltoReqO/MKLVt4RIeJYJgVW54ycc/K4=; b=y5h9yDzIlSG99XUnKdz24QTelT
	7DGqGvpIa/7dW8dG3PxPfAjDXwyWIzuFD7XiWPvkX5YYK7Uc2WVW8OkRjxd3uWipt7jH1OucmbvBc
	jlx7kYJ0QNTAal6tRmxAmYA7NbJGV6t1kHEHJSu5q8pc03H7parmB7/ohmKnM/zY+G/vXhPFy4zfh
	4KG2Jcq6Td7DcUtJ+LCAcWADsS5QEwvp8302vM27+oJxsG+olHsXiASgWvEjANfYNpJIZ7uTW3Fny
	5pLKmmQWU0wElMZchPzZTCafqiTgjjpD4yLIN7/nBYgrBYzL+qg2+zqPArlFLrbwtDN/7vfGPEnfG
	TS5BS+wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNuY4-00000008jmW-02H0;
	Fri, 15 May 2026 15:34:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNuXz-00000008jXV-33sY
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 15 May 2026 15:33:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=VLt6FrL1oCiwltoReqO/MKLVt4RIeJYJgVW54ycc/K4=; b=Z72X+jsJS0ImMRG4zBdAq2Gv26
	+jks9+kpwo3Hq9PGl0yYjdqp8fHBVrxIqLtZAupot4LIPrwXygxpVx5Iuqku/pPAiYZAujKngaMIi
	4N9U0nvOAMtCddhMWdax0yMPX03916R9sdSAEfbYcA3AIzUiOOHYqoS3MSJ2IxEZ5qo35mBMm63lI
	5BQiKsfScxLzWo805IUlGY43ZT6r79TXsWxUmCbeg7qGH97sOmOvnrNwAbA0XgKiZcWYHIzTGzLbI
	5mzQ5tAdduf1lbSuQsy96N4HA2faqZiNEV1yd/ZBIHLgAyzkLWwOiixPhEWoVemf091s7tsEG8uvs
	dsbUB/cQ==;
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNuXw-00000005a5R-2BKo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 15:33:54 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=peter.mobile.pengutronix.de)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.pueschel@pengutronix.de>)
	id 1wNuXF-0005OF-Vv; Fri, 15 May 2026 17:33:10 +0200
From: =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
Date: Fri, 15 May 2026 17:32:48 +0200
Subject: [PATCH v6 22/28] media: rockchip: rga: remove size from rga_frame
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260515-spu-rga3-v6-22-e547152eb9c9@pengutronix.de>
References: <20260515-spu-rga3-v6-0-e547152eb9c9@pengutronix.de>
In-Reply-To: <20260515-spu-rga3-v6-0-e547152eb9c9@pengutronix.de>
To: Jacob Chen <jacob-chen@iotwrt.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, kernel@pengutronix.de, nicolas@ndufresne.ca, 
 sebastian.reichel@collabora.com, m.tretter@pengutronix.de, 
 p.zabel@pengutronix.de, 
 =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>
X-Mailer: b4 0.15.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.pueschel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_163352_880580_75CB9FE4 
X-CRM114-Status: GOOD (  14.83  )
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
index cd6904d5fe5a6..092c2bdf6b672 100644
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
index cda3cecb1ce8c..e44e81814b7cb 100644
--- a/drivers/media/platform/rockchip/rga/rga.c
+++ b/drivers/media/platform/rockchip/rga/rga.c
@@ -268,7 +268,6 @@ static int rga_open(struct file *file)
 	};
 
 	def_frame.stride = (def_width * def_frame.fmt->depth) >> 3;
-	def_frame.size = def_frame.stride * def_height;
 
 	ctx = kzalloc_obj(*ctx);
 	if (!ctx)
@@ -481,9 +480,6 @@ static int vidioc_s_fmt(struct file *file, void *priv, struct v4l2_format *f)
 	frm = rga_get_frame(ctx, f->type);
 	if (IS_ERR(frm))
 		return PTR_ERR(frm);
-	frm->size = 0;
-	for (i = 0; i < pix_fmt->num_planes; i++)
-		frm->size += pix_fmt->plane_fmt[i].sizeimage;
 	frm->fmt = rga_fmt_find(rga, pix_fmt->pixelformat);
 	frm->stride = pix_fmt->plane_fmt[0].bytesperline;
 
@@ -508,10 +504,10 @@ static int vidioc_s_fmt(struct file *file, void *priv, struct v4l2_format *f)
 	ctx->cmdbuf_dirty = true;
 
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
index b180df5c48370..d47c6821ce2c9 100644
--- a/drivers/media/platform/rockchip/rga/rga.h
+++ b/drivers/media/platform/rockchip/rga/rga.h
@@ -34,7 +34,6 @@ struct rga_frame {
 
 	/* Variables that can calculated once and reused */
 	u32 stride;
-	u32 size;
 };
 
 struct rga_dma_desc {

-- 
2.54.0


