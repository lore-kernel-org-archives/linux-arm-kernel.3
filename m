Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F652CD343F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 15:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ooGrv1fqA+bFK84NDIt4DE8E7M6cwWtPQH2NoVP43vY=; b=OsSpbt5LG+GUtUd8yeqQUgFs/I
	VxC6/v/n8G1i4E1YXfR24dJNqWAJhh7k5A01KsdKJBRge1Fa0/YCYOuJ5Ipq7rmVAxs6FrrBruuMF
	3X7GTu2AFYHtPzmXj4v1b1kCFfztwNgjTnTi0MskcAsh02xB28F916jXvd+YyfkJfd/fZGu5Xbnor
	OoH2Qzp6xbylAFoKSZILrT6JX6fi+rADIWSNDPSMhXhFU7qCT5P/ra7cIoSuBiX78NDHGe8KxOsX+
	I+lZWfKxrRznimWJSIa2i6/E1+JCsBriDfTHQpNkISvXXQbXvQgiJJiR+qyMRLzSWe9cqcrKbTwBs
	cXST+wPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNuY1-00000008jfA-1aoV;
	Fri, 15 May 2026 15:33:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNuXv-00000008jPv-0WLQ
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 15 May 2026 15:33:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=ooGrv1fqA+bFK84NDIt4DE8E7M6cwWtPQH2NoVP43vY=; b=QZM/MYEH8XeW29rqqaaSdVQMpH
	fNEqlLIGe30g98rhlNr8nUM7hfpIMmJ65iBK5QiX1FVd0iUHkAzHcqBXaikI/mUdUUb27iAdEm0kn
	LUWg6mUFgdQ/r/2Xdz6FZtVHrN3IFLO6/3rSfkWLIcbMe26S5m8lTGQyrsWmFLbw0HMhwS8GJiCg1
	A2smdpmAoGsUTxJZNzuVi3soWR1yfK2vYUgX5ahsm8M+yFDt32NG+eG/yZlbxbP3B1rJrAAqez3oK
	0Xu0aO7MQFYWxgWR8HkFxbttB9kvS9pUf3rN+EPrbUHoPLTRs+nnmYzBZVLpwIl/m6MoIdo4cUmFx
	+L50zqSg==;
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNuXr-00000005a3r-1jU0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 15:33:49 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=peter.mobile.pengutronix.de)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.pueschel@pengutronix.de>)
	id 1wNuXB-0005OF-VM; Fri, 15 May 2026 17:33:06 +0200
From: =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
Date: Fri, 15 May 2026 17:32:45 +0200
Subject: [PATCH v6 19/28] media: rockchip: rga: change offset to
 dma_addresses
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260515-spu-rga3-v6-19-e547152eb9c9@pengutronix.de>
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
X-CRM114-CacheID: sfid-20260515_163347_880237_4356B8B9 
X-CRM114-Status: GOOD (  21.37  )
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

Change the offset to dma_addresses, as the current naming is misleading.
The offset naming comes from the fact that it references the offset in
the mapped iommu address space. But from the hardware point of view this
is an address, as also pointed out by the register naming
(e.g. RGA_DST_Y_RGB_BASE_ADDR). Therefore also change the type to
dma_addr_t, as with an external iommu driver this would also be the
correct type.

This change is a preparation for the RGA3 support, which uses an external
iommu and therefore just gets an dma_addr_t for each buffer. The field
renaming allows to reuse the existing fields of rga_vb_buffer to store
these values.

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Signed-off-by: Sven Püschel <s.pueschel@pengutronix.de>

---
Changes in v6:
- Also changed dma_addrs variable type to dma_addr_t. Flagged by Sashiko
  https://sashiko.dev/#/patchset/20260428-spu-rga3-v5-0-eb7f5d019d86%40pengutronix.de?part=20
---
 drivers/media/platform/rockchip/rga/rga-buf.c |  12 +--
 drivers/media/platform/rockchip/rga/rga-hw.c  | 105 +++++++++++++-------------
 drivers/media/platform/rockchip/rga/rga.h     |  12 +--
 3 files changed, 64 insertions(+), 65 deletions(-)

diff --git a/drivers/media/platform/rockchip/rga/rga-buf.c b/drivers/media/platform/rockchip/rga/rga-buf.c
index dcaba66f5c1fc..ab9554c1c4cd9 100644
--- a/drivers/media/platform/rockchip/rga/rga-buf.c
+++ b/drivers/media/platform/rockchip/rga/rga-buf.c
@@ -121,7 +121,7 @@ static int rga_buf_prepare(struct vb2_buffer *vb)
 	size_t curr_desc = 0;
 	int i;
 	const struct v4l2_format_info *info;
-	unsigned int offsets[VIDEO_MAX_PLANES];
+	dma_addr_t dma_addrs[VIDEO_MAX_PLANES];
 
 	if (IS_ERR(f))
 		return PTR_ERR(f);
@@ -145,18 +145,18 @@ static int rga_buf_prepare(struct vb2_buffer *vb)
 				 "Failed to map video buffer to RGA\n");
 			return n_desc;
 		}
-		offsets[i] = curr_desc << PAGE_SHIFT;
+		dma_addrs[i] = curr_desc << PAGE_SHIFT;
 		curr_desc += n_desc;
 	}
 
 	/* Fill the remaining planes */
 	info = v4l2_format_info(f->fmt->fourcc);
 	for (i = info->mem_planes; i < info->comp_planes; i++)
-		offsets[i] = get_plane_offset(f, info, i);
+		dma_addrs[i] = dma_addrs[0] + get_plane_offset(f, info, i);
 
-	rbuf->offset.y_off = offsets[0];
-	rbuf->offset.u_off = offsets[1];
-	rbuf->offset.v_off = offsets[2];
+	rbuf->dma_addrs.y_addr = dma_addrs[0];
+	rbuf->dma_addrs.u_addr = dma_addrs[1];
+	rbuf->dma_addrs.v_addr = dma_addrs[2];
 
 	return 0;
 }
diff --git a/drivers/media/platform/rockchip/rga/rga-hw.c b/drivers/media/platform/rockchip/rga/rga-hw.c
index 43fd023b7571c..99cf57d5ba89d 100644
--- a/drivers/media/platform/rockchip/rga/rga-hw.c
+++ b/drivers/media/platform/rockchip/rga/rga-hw.c
@@ -16,11 +16,11 @@ enum e_rga_start_pos {
 	RB = 3,
 };
 
-struct rga_corners_addr_offset {
-	struct rga_addr_offset left_top;
-	struct rga_addr_offset right_top;
-	struct rga_addr_offset left_bottom;
-	struct rga_addr_offset right_bottom;
+struct rga_corners_addrs {
+	struct rga_addrs left_top;
+	struct rga_addrs right_top;
+	struct rga_addrs left_bottom;
+	struct rga_addrs right_bottom;
 };
 
 static unsigned int rga_get_scaling(unsigned int src, unsigned int dst)
@@ -36,20 +36,20 @@ static unsigned int rga_get_scaling(unsigned int src, unsigned int dst)
 	return (src > dst) ? ((dst << 16) / src) : ((src << 16) / dst);
 }
 
-static struct rga_corners_addr_offset
-rga_get_addr_offset(struct rga_frame *frm, struct rga_addr_offset *offset,
-		    unsigned int x, unsigned int y, unsigned int w, unsigned int h)
+static struct rga_corners_addrs
+rga_get_corner_addrs(struct rga_frame *frm, struct rga_addrs *addrs,
+		     unsigned int x, unsigned int y, unsigned int w, unsigned int h)
 {
-	struct rga_corners_addr_offset offsets;
-	struct rga_addr_offset *lt, *lb, *rt, *rb;
+	struct rga_corners_addrs corner_addrs;
+	struct rga_addrs *lt, *lb, *rt, *rb;
 	const struct v4l2_format_info *format_info;
 	unsigned int x_div = 0,
 		     y_div = 0, uv_stride = 0, pixel_width = 0;
 
-	lt = &offsets.left_top;
-	lb = &offsets.left_bottom;
-	rt = &offsets.right_top;
-	rb = &offsets.right_bottom;
+	lt = &corner_addrs.left_top;
+	lb = &corner_addrs.left_bottom;
+	rt = &corner_addrs.right_top;
+	rb = &corner_addrs.right_bottom;
 
 	format_info = v4l2_format_info(frm->pix.pixelformat);
 	/* x_div is only used for the u/v planes.
@@ -64,29 +64,28 @@ rga_get_addr_offset(struct rga_frame *frm, struct rga_addr_offset *offset,
 	uv_stride = frm->stride / x_div;
 	pixel_width = frm->stride / frm->pix.width;
 
-	lt->y_off = offset->y_off + y * frm->stride + x * pixel_width;
-	lt->u_off = offset->u_off + (y / y_div) * uv_stride + x / x_div;
-	lt->v_off = offset->v_off + (y / y_div) * uv_stride + x / x_div;
+	lt->y_addr = addrs->y_addr + y * frm->stride + x * pixel_width;
+	lt->u_addr = addrs->u_addr + (y / y_div) * uv_stride + x / x_div;
+	lt->v_addr = addrs->v_addr + (y / y_div) * uv_stride + x / x_div;
 
-	lb->y_off = lt->y_off + (h - 1) * frm->stride;
-	lb->u_off = lt->u_off + (h / y_div - 1) * uv_stride;
-	lb->v_off = lt->v_off + (h / y_div - 1) * uv_stride;
+	lb->y_addr = lt->y_addr + (h - 1) * frm->stride;
+	lb->u_addr = lt->u_addr + (h / y_div - 1) * uv_stride;
+	lb->v_addr = lt->v_addr + (h / y_div - 1) * uv_stride;
 
-	rt->y_off = lt->y_off + (w - 1) * pixel_width;
-	rt->u_off = lt->u_off + w / x_div - 1;
-	rt->v_off = lt->v_off + w / x_div - 1;
+	rt->y_addr = lt->y_addr + (w - 1) * pixel_width;
+	rt->u_addr = lt->u_addr + w / x_div - 1;
+	rt->v_addr = lt->v_addr + w / x_div - 1;
 
-	rb->y_off = lb->y_off + (w - 1) * pixel_width;
-	rb->u_off = lb->u_off + w / x_div - 1;
-	rb->v_off = lb->v_off + w / x_div - 1;
+	rb->y_addr = lb->y_addr + (w - 1) * pixel_width;
+	rb->u_addr = lb->u_addr + w / x_div - 1;
+	rb->v_addr = lb->v_addr + w / x_div - 1;
 
-	return offsets;
+	return corner_addrs;
 }
 
-static struct rga_addr_offset *rga_lookup_draw_pos(struct
-		rga_corners_addr_offset
-		* offsets, u32 rotate_mode,
-		u32 mirr_mode)
+static struct rga_addrs *rga_lookup_draw_pos(struct rga_corners_addrs *corner_addrs,
+					     u32 rotate_mode,
+					     u32 mirr_mode)
 {
 	static enum e_rga_start_pos rot_mir_point_matrix[4][4] = {
 		{
@@ -103,18 +102,18 @@ static struct rga_addr_offset *rga_lookup_draw_pos(struct
 		},
 	};
 
-	if (!offsets)
+	if (!corner_addrs)
 		return NULL;
 
 	switch (rot_mir_point_matrix[rotate_mode][mirr_mode]) {
 	case LT:
-		return &offsets->left_top;
+		return &corner_addrs->left_top;
 	case LB:
-		return &offsets->left_bottom;
+		return &corner_addrs->left_bottom;
 	case RT:
-		return &offsets->right_top;
+		return &corner_addrs->right_top;
 	case RB:
-		return &offsets->right_bottom;
+		return &corner_addrs->right_bottom;
 	}
 
 	return NULL;
@@ -316,9 +315,9 @@ static void rga_cmd_set_trans_info(struct rga_ctx *ctx)
 }
 
 static void rga_cmd_set_src_info(struct rga_ctx *ctx,
-				 struct rga_addr_offset *offset)
+				 struct rga_addrs *addrs)
 {
-	struct rga_corners_addr_offset src_offsets;
+	struct rga_corners_addrs src_corner_addrs;
 	u32 *dest = ctx->cmdbuf_virt;
 	unsigned int src_h, src_w, src_x, src_y;
 
@@ -330,22 +329,22 @@ static void rga_cmd_set_src_info(struct rga_ctx *ctx,
 	/*
 	 * Calculate the source framebuffer base address with offset pixel.
 	 */
-	src_offsets = rga_get_addr_offset(&ctx->in, offset,
-					  src_x, src_y, src_w, src_h);
+	src_corner_addrs = rga_get_corner_addrs(&ctx->in, addrs,
+						src_x, src_y, src_w, src_h);
 
 	dest[(RGA_SRC_Y_RGB_BASE_ADDR - RGA_MODE_BASE_REG) >> 2] =
-		src_offsets.left_top.y_off;
+		src_corner_addrs.left_top.y_addr;
 	dest[(RGA_SRC_CB_BASE_ADDR - RGA_MODE_BASE_REG) >> 2] =
-		src_offsets.left_top.u_off;
+		src_corner_addrs.left_top.u_addr;
 	dest[(RGA_SRC_CR_BASE_ADDR - RGA_MODE_BASE_REG) >> 2] =
-		src_offsets.left_top.v_off;
+		src_corner_addrs.left_top.v_addr;
 }
 
 static void rga_cmd_set_dst_info(struct rga_ctx *ctx,
-				 struct rga_addr_offset *offset)
+				 struct rga_addrs *addrs)
 {
-	struct rga_addr_offset *dst_offset;
-	struct rga_corners_addr_offset offsets;
+	struct rga_addrs *dst_addrs;
+	struct rga_corners_addrs corner_addrs;
 	u32 *dest = ctx->cmdbuf_virt;
 	unsigned int dst_h, dst_w, dst_x, dst_y;
 	unsigned int mir_mode = 0;
@@ -379,15 +378,15 @@ static void rga_cmd_set_dst_info(struct rga_ctx *ctx,
 	/*
 	 * Configure the dest framebuffer base address with pixel offset.
 	 */
-	offsets = rga_get_addr_offset(&ctx->out, offset, dst_x, dst_y, dst_w, dst_h);
-	dst_offset = rga_lookup_draw_pos(&offsets, rot_mode, mir_mode);
+	corner_addrs = rga_get_corner_addrs(&ctx->out, addrs, dst_x, dst_y, dst_w, dst_h);
+	dst_addrs = rga_lookup_draw_pos(&corner_addrs, rot_mode, mir_mode);
 
 	dest[(RGA_DST_Y_RGB_BASE_ADDR - RGA_MODE_BASE_REG) >> 2] =
-		dst_offset->y_off;
+		dst_addrs->y_addr;
 	dest[(RGA_DST_CB_BASE_ADDR - RGA_MODE_BASE_REG) >> 2] =
-		dst_offset->u_off;
+		dst_addrs->u_addr;
 	dest[(RGA_DST_CR_BASE_ADDR - RGA_MODE_BASE_REG) >> 2] =
-		dst_offset->v_off;
+		dst_addrs->v_addr;
 }
 
 static void rga_cmd_set_mode(struct rga_ctx *ctx)
@@ -426,8 +425,8 @@ static void rga_cmd_set(struct rga_ctx *ctx,
 
 	rga_cmd_set_dst_addr(ctx, dst->dma_desc_pa);
 
-	rga_cmd_set_src_info(ctx, &src->offset);
-	rga_cmd_set_dst_info(ctx, &dst->offset);
+	rga_cmd_set_src_info(ctx, &src->dma_addrs);
+	rga_cmd_set_dst_info(ctx, &dst->dma_addrs);
 
 	rga_write(rga, RGA_CMD_BASE, ctx->cmdbuf_phy);
 
diff --git a/drivers/media/platform/rockchip/rga/rga.h b/drivers/media/platform/rockchip/rga/rga.h
index cee2e75ea89f1..bf21a57555a59 100644
--- a/drivers/media/platform/rockchip/rga/rga.h
+++ b/drivers/media/platform/rockchip/rga/rga.h
@@ -97,10 +97,10 @@ struct rockchip_rga {
 	const struct rga_hw *hw;
 };
 
-struct rga_addr_offset {
-	unsigned int y_off;
-	unsigned int u_off;
-	unsigned int v_off;
+struct rga_addrs {
+	dma_addr_t y_addr;
+	dma_addr_t u_addr;
+	dma_addr_t v_addr;
 };
 
 struct rga_vb_buffer {
@@ -112,8 +112,8 @@ struct rga_vb_buffer {
 	dma_addr_t dma_desc_pa;
 	size_t n_desc;
 
-	/* Plane offsets of this buffer into the mapping */
-	struct rga_addr_offset offset;
+	/* Plane DMA addresses after the MMU mapping of the buffer */
+	struct rga_addrs dma_addrs;
 };
 
 static inline struct rga_vb_buffer *vb_to_rga(struct vb2_v4l2_buffer *vb)

-- 
2.54.0


