Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F9E7FF886D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 09:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SoakLqdzTJaiPdsOG9Tq37jQThilhxUcE71fHtnVtus=; b=DVe6XftBoun+c0i2m0GOo07GLF
	0/1UnKRr8qYomUvOZYL6dDUQ58OkugkfacdD2Q9r1jiN7xY5g4JikK/7Z/abDYs4qwTQX6/k4XBw9
	hGkncDi9TgokJ9lXA2oPiD6SVNhovQgY1ZmrORPuD7DmlqN5xsNWw5o9tHlaq7Ino9fXelJJx4Xmq
	cAT4Y7MPk7BWOZCfflDo5AvPf/IenYKx12R1+55x5wmWe0R004p1IRhSELvThBsF6dNx+l1tjtkW1
	Zq7UAtsoC4q0vlc7FENf7ppgRz9Oo41p/4eOC6eKqETl37dL2IToEraBGaWMLRvivx2K0RVhXxC8x
	5NH4eaFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHeLG-00000000zRr-1P0L;
	Tue, 28 Apr 2026 09:02:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHeKB-00000000yCO-2zpM
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 28 Apr 2026 09:01:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=SoakLqdzTJaiPdsOG9Tq37jQThilhxUcE71fHtnVtus=; b=aE4VVR4Ff4pSoNUQisdm1kVQTW
	SI0iwT5QwcHwQOpz3KegEekK9R3gsiXFMX3igqHbxuIm0RCvlpa+Lq3iEk9nXfasCsPcgksNUyRU6
	RlBtfC7b68S1lqsKU9e76i3c5W8KOstvj1cy4bxG0d/QycslgaSM85YV9p7xNE4oCVHOIUPp+bndb
	yIdKlsQwVFdxobtE4FI4RfutdYjlB2JxzHR9977ZgGW1nPeShYBQVeY8fJI/hivjyPBP98waE7K1+
	67GASr14La5VJMmUNBaYSLrouJAlef3AHa9grY2ObmT87FWkqz0k6GEV7tyDeL4HC3KSacOV8wJs8
	2IdsTaOA==;
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHeJy-00000002VWY-0Nsb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 09:01:46 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=peter.mobile.pengutronix.de)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.pueschel@pengutronix.de>)
	id 1wHeJK-0004Lz-HC; Tue, 28 Apr 2026 11:00:54 +0200
From: =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
Date: Tue, 28 Apr 2026 11:00:58 +0200
Subject: [PATCH v5 23/29] media: rockchip: rga: remove size from rga_frame
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260428-spu-rga3-v5-23-eb7f5d019d86@pengutronix.de>
References: <20260428-spu-rga3-v5-0-eb7f5d019d86@pengutronix.de>
In-Reply-To: <20260428-spu-rga3-v5-0-eb7f5d019d86@pengutronix.de>
To: Jacob Chen <jacob-chen@iotwrt.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, kernel@pengutronix.de, nicolas@ndufresne.ca, 
 sebastian.reichel@collabora.com, 
 =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>
X-Mailer: b4 0.15.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.pueschel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_100134_636455_AE8CE426 
X-CRM114-Status: GOOD (  15.37  )
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
2.54.0


