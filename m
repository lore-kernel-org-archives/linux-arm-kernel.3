Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19C48CD4F25
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 15:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ldfd1IxlycMKG7L7Kuolp5HNCR5EoKRyryQlwDGwwB0=; b=0lkwRnj30Jo+cY7FEYYpsgOs/2
	DI3j15cUVil77QAxLsL3BsIqXosszMcx704ifwOgxEJLrFu1FSrrny4jJ1JxfxS6RMa2EGDCyOy33
	/NwUmEE8JOuomtDlf6tkMWJjCMuH2BhCh9S+EpxWj0jkn4z5f8u/f1Vwm4ReKeFjiP5U1THIwvk4k
	wpRag8Fte3tn5MFV4VI3JKOSlNl7C+xVQx08KYuxzyRmnNF+JpBlNUK0o44NFREd8xX5esByXf0TQ
	1zsjL5a1Y4j8LkrTEfWzGnSC3AVxmBZdPx/fhe0I/+i4A5OLHxRtnZ5y85Zazk0Nk/wenwJfbNc1S
	TkfKoc6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNuY1-00000008jgA-43iC;
	Fri, 15 May 2026 15:33:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNuXv-00000008jRm-3Tt5
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 15 May 2026 15:33:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=ldfd1IxlycMKG7L7Kuolp5HNCR5EoKRyryQlwDGwwB0=; b=Dyoy/Kgo4DtZ7vroMTWjjeEEIZ
	WURPRaq8PURSCB0izppSEZy5Rg6uwOg654FZIq/JzgwhKx81ghZiRyyTCX0MbMnly1k0K0L6iRX1v
	w10tKoWd6JyAGX5D+nZcc2e22FW3wjqJ79bLxqAiwnutL4bvFwVUwEMwgJvnL9MJDnR+T2xELo0mJ
	qu489ph/EgWuLtR5DERSgDHHzjgzKdeKT55j5vl08f2PXjrAQNHvq9kMsumC8tOpP3hH8zSFY87aQ
	oJTPjV+ozueyOUAMH4lR4X5GEJak2vzqEZHlpcVONAfw9pzuFeJ3MqreR0N2h8hhoiHfhKh03Zc8C
	gBnCPS+A==;
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNuXs-00000005a4W-1Tj6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 15:33:50 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=peter.mobile.pengutronix.de)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.pueschel@pengutronix.de>)
	id 1wNuXD-0005OF-8W; Fri, 15 May 2026 17:33:07 +0200
From: =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
Date: Fri, 15 May 2026 17:32:46 +0200
Subject: [PATCH v6 20/28] media: rockchip: rga: support external iommus
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260515-spu-rga3-v6-20-e547152eb9c9@pengutronix.de>
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
X-CRM114-CacheID: sfid-20260515_163348_941546_645C735C 
X-CRM114-Status: GOOD (  20.05  )
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

In preparation for the RGA3 add support for external iommus. This is a
transition step to just disable the RGA2 specific mmu table setup code.

Currently a simple rga_hw struct field is used to set the internal iommu.
But to handle the case of more sophisticated detection mechanisms
(e.g. check for an iommu property in the device tree), it is abstracted
by an inline function.

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Signed-off-by: Sven Püschel <s.pueschel@pengutronix.de>

---
Changes in v6:
- Also select VIDEOBUF2_DMA_CONTIG in Kconfig, Flagged by sashiko:
  https://sashiko.dev/#/patchset/20260325-spu-rga3-v4-0-e90ec1c61354%40pengutronix.de?part=10
---
 drivers/media/platform/rockchip/rga/Kconfig   |  1 +
 drivers/media/platform/rockchip/rga/rga-buf.c | 31 ++++++++++++++++++---------
 drivers/media/platform/rockchip/rga/rga-hw.c  |  1 +
 drivers/media/platform/rockchip/rga/rga.c     | 11 ++++++++--
 drivers/media/platform/rockchip/rga/rga.h     |  6 ++++++
 5 files changed, 38 insertions(+), 12 deletions(-)

diff --git a/drivers/media/platform/rockchip/rga/Kconfig b/drivers/media/platform/rockchip/rga/Kconfig
index 727a0f6ea4664..846e555829f38 100644
--- a/drivers/media/platform/rockchip/rga/Kconfig
+++ b/drivers/media/platform/rockchip/rga/Kconfig
@@ -3,6 +3,7 @@ config VIDEO_ROCKCHIP_RGA
 	depends on V4L_MEM2MEM_DRIVERS
 	depends on VIDEO_DEV
 	depends on ARCH_ROCKCHIP || COMPILE_TEST
+	select VIDEOBUF2_DMA_CONTIG
 	select VIDEOBUF2_DMA_SG
 	select V4L2_MEM2MEM_DEV
 	help
diff --git a/drivers/media/platform/rockchip/rga/rga-buf.c b/drivers/media/platform/rockchip/rga/rga-buf.c
index ab9554c1c4cd9..cd6904d5fe5a6 100644
--- a/drivers/media/platform/rockchip/rga/rga-buf.c
+++ b/drivers/media/platform/rockchip/rga/rga-buf.c
@@ -12,6 +12,7 @@
 #include <media/v4l2-ioctl.h>
 #include <media/v4l2-mem2mem.h>
 #include <media/videobuf2-dma-sg.h>
+#include <media/videobuf2-dma-contig.h>
 #include <media/videobuf2-v4l2.h>
 
 #include "rga.h"
@@ -82,6 +83,9 @@ static int rga_buf_init(struct vb2_buffer *vb)
 	if (IS_ERR(f))
 		return PTR_ERR(f);
 
+	if (!rga_has_internal_iommu(rga))
+		return 0;
+
 	n_desc = DIV_ROUND_UP(f->size, PAGE_SIZE);
 
 	rbuf->n_desc = n_desc;
@@ -136,17 +140,21 @@ static int rga_buf_prepare(struct vb2_buffer *vb)
 	for (i = 0; i < vb->num_planes; i++) {
 		vb2_set_plane_payload(vb, i, f->pix.plane_fmt[i].sizeimage);
 
-		/* Create local MMU table for RGA */
-		n_desc = fill_descriptors(&rbuf->dma_desc[curr_desc],
-					  rbuf->n_desc - curr_desc,
-					  vb2_dma_sg_plane_desc(vb, i));
-		if (n_desc < 0) {
-			v4l2_err(&ctx->rga->v4l2_dev,
-				 "Failed to map video buffer to RGA\n");
-			return n_desc;
+		if (rga_has_internal_iommu(ctx->rga)) {
+			/* Create local MMU table for RGA */
+			n_desc = fill_descriptors(&rbuf->dma_desc[curr_desc],
+						  rbuf->n_desc - curr_desc,
+						  vb2_dma_sg_plane_desc(vb, i));
+			if (n_desc < 0) {
+				v4l2_err(&ctx->rga->v4l2_dev,
+					 "Failed to map video buffer to RGA\n");
+				return n_desc;
+			}
+			dma_addrs[i] = curr_desc << PAGE_SHIFT;
+			curr_desc += n_desc;
+		} else {
+			dma_addrs[i] = vb2_dma_contig_plane_dma_addr(vb, i);
 		}
-		dma_addrs[i] = curr_desc << PAGE_SHIFT;
-		curr_desc += n_desc;
 	}
 
 	/* Fill the remaining planes */
@@ -176,6 +184,9 @@ static void rga_buf_cleanup(struct vb2_buffer *vb)
 	struct rga_ctx *ctx = vb2_get_drv_priv(vb->vb2_queue);
 	struct rockchip_rga *rga = ctx->rga;
 
+	if (!rga_has_internal_iommu(rga))
+		return;
+
 	dma_free_coherent(rga->dev, rbuf->n_desc * sizeof(*rbuf->dma_desc),
 			  rbuf->dma_desc, rbuf->dma_desc_pa);
 }
diff --git a/drivers/media/platform/rockchip/rga/rga-hw.c b/drivers/media/platform/rockchip/rga/rga-hw.c
index 99cf57d5ba89d..73584706a47e2 100644
--- a/drivers/media/platform/rockchip/rga/rga-hw.c
+++ b/drivers/media/platform/rockchip/rga/rga-hw.c
@@ -577,6 +577,7 @@ static struct rga_fmt formats[] = {
 
 const struct rga_hw rga2_hw = {
 	.card_type = "rga2",
+	.has_internal_iommu = true,
 	.formats = formats,
 	.num_formats = ARRAY_SIZE(formats),
 	.cmdbuf_size = RGA_CMDBUF_SIZE,
diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/platform/rockchip/rga/rga.c
index 91775b43ff617..e3c99c3f7c5be 100644
--- a/drivers/media/platform/rockchip/rga/rga.c
+++ b/drivers/media/platform/rockchip/rga/rga.c
@@ -23,6 +23,7 @@
 #include <media/v4l2-ioctl.h>
 #include <media/v4l2-mem2mem.h>
 #include <media/videobuf2-dma-sg.h>
+#include <media/videobuf2-dma-contig.h>
 #include <media/videobuf2-v4l2.h>
 
 #include "rga.h"
@@ -98,7 +99,10 @@ queue_init(void *priv, struct vb2_queue *src_vq, struct vb2_queue *dst_vq)
 	src_vq->io_modes = VB2_MMAP | VB2_DMABUF;
 	src_vq->drv_priv = ctx;
 	src_vq->ops = &rga_qops;
-	src_vq->mem_ops = &vb2_dma_sg_memops;
+	if (rga_has_internal_iommu(ctx->rga))
+		src_vq->mem_ops = &vb2_dma_sg_memops;
+	else
+		src_vq->mem_ops = &vb2_dma_contig_memops;
 	src_vq->gfp_flags = __GFP_DMA32;
 	src_vq->buf_struct_size = sizeof(struct rga_vb_buffer);
 	src_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
@@ -113,7 +117,10 @@ queue_init(void *priv, struct vb2_queue *src_vq, struct vb2_queue *dst_vq)
 	dst_vq->io_modes = VB2_MMAP | VB2_DMABUF;
 	dst_vq->drv_priv = ctx;
 	dst_vq->ops = &rga_qops;
-	dst_vq->mem_ops = &vb2_dma_sg_memops;
+	if (rga_has_internal_iommu(ctx->rga))
+		dst_vq->mem_ops = &vb2_dma_sg_memops;
+	else
+		dst_vq->mem_ops = &vb2_dma_contig_memops;
 	dst_vq->gfp_flags = __GFP_DMA32;
 	dst_vq->buf_struct_size = sizeof(struct rga_vb_buffer);
 	dst_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
diff --git a/drivers/media/platform/rockchip/rga/rga.h b/drivers/media/platform/rockchip/rga/rga.h
index bf21a57555a59..b180df5c48370 100644
--- a/drivers/media/platform/rockchip/rga/rga.h
+++ b/drivers/media/platform/rockchip/rga/rga.h
@@ -150,6 +150,7 @@ static inline void rga_mod(struct rockchip_rga *rga, u32 reg, u32 val, u32 mask)
 
 struct rga_hw {
 	const char *card_type;
+	bool has_internal_iommu;
 	struct rga_fmt *formats;
 	u32 num_formats;
 	size_t cmdbuf_size;
@@ -165,6 +166,11 @@ struct rga_hw {
 	void (*get_version)(struct rockchip_rga *rga);
 };
 
+static inline bool rga_has_internal_iommu(const struct rockchip_rga *rga)
+{
+	return rga->hw->has_internal_iommu;
+}
+
 extern const struct rga_hw rga2_hw;
 
 #endif

-- 
2.54.0


