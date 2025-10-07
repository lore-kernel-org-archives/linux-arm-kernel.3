Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09531CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Oct 2025 08:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LvH4EV0WddGfISSNAIwBmEzT8KkNjc3mX3Tnkv93KVM=; b=cwXlvXQa32Du3pLi8OCmyjoBUl
	PFDNt8sSA16CLvR5WD7U7UohuReB1mwt0e0CAO2LhFz7Mq2oKBSj+MFD199+oQksepSwevnadgwIs
	wM3ewbVqqgKWmi3HqL4ZwDgJRMWEVAbufLDZUIEVSgclSgCPDQzCGTyr3KKiJiM2gU3675HXqfBjd
	wV9ZGbje3LxkR58UsmKKEFPTNnL4K9c/nIcyRrsjJ5s5SoE7UzoSMvaCBKPZ03D4JPSb3EhDE5ipC
	V8Lwqq5ZBhvqwzrUoWWENNjulIowBYQ4LbuUdITurgtVDO4lJ2IwNlm/QcRvQh7X0OPckea9/yMEQ
	MOS/1IXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v638C-00000001Yji-0PqT;
	Tue, 07 Oct 2025 08:33:12 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v637v-00000001YOu-3cEF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Oct 2025 08:32:57 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=peter.mobile.pengutronix.de)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.pueschel@pengutronix.de>)
	id 1v637u-0002Hb-C4; Tue, 07 Oct 2025 10:32:54 +0200
From: =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
Date: Tue, 07 Oct 2025 10:32:01 +0200
Subject: [PATCH 08/16] media: rockchip: rga: remove size from rga_frame
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251007-spu-rga3-v1-8-36ad85570402@pengutronix.de>
References: <20251007-spu-rga3-v1-0-36ad85570402@pengutronix.de>
In-Reply-To: <20251007-spu-rga3-v1-0-36ad85570402@pengutronix.de>
To: Jacob Chen <jacob-chen@iotwrt.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, kernel@pengutronix.de, 
 =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
X-Mailer: b4 0.14.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.pueschel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251007_013255_909641_AC243D76 
X-CRM114-Status: GOOD (  14.80  )
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

Signed-off-by: Sven Püschel <s.pueschel@pengutronix.de>
---
 drivers/media/platform/rockchip/rga/rga-buf.c | 6 +++++-
 drivers/media/platform/rockchip/rga/rga.c     | 8 ++------
 drivers/media/platform/rockchip/rga/rga.h     | 1 -
 3 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/rockchip/rga/rga-buf.c b/drivers/media/platform/rockchip/rga/rga-buf.c
index 26b66b0c7e008308c24433f061a738a3985484b6..e44fe870fb9e34aa93404b7a60022fe441adf8f9 100644
--- a/drivers/media/platform/rockchip/rga/rga-buf.c
+++ b/drivers/media/platform/rockchip/rga/rga-buf.c
@@ -79,9 +79,13 @@ static int rga_buf_init(struct vb2_buffer *vb)
 	struct rockchip_rga *rga = ctx->rga;
 	struct rga_frame *f = rga_get_frame(ctx, vb->vb2_queue->type);
 	size_t n_desc = 0;
+	u32 size = 0;
+	u8 i;
 
 	if (rga_has_internal_iommu(rga)) {
-		n_desc = DIV_ROUND_UP(f->size, PAGE_SIZE);
+		for (i = 0; i < f->pix.num_planes; i++)
+			size += f->pix.plane_fmt[i].sizeimage;
+		n_desc = DIV_ROUND_UP(size, PAGE_SIZE);
 
 		rbuf->n_desc = n_desc;
 		rbuf->dma_desc = dma_alloc_coherent(rga->dev,
diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/platform/rockchip/rga/rga.c
index b8e4be3f9acd8a73a3d4e947aeeef9095543fb49..c5f25869d0cd08a794330954ec414f0428b647d8 100644
--- a/drivers/media/platform/rockchip/rga/rga.c
+++ b/drivers/media/platform/rockchip/rga/rga.c
@@ -222,7 +222,6 @@ static int rga_open(struct file *file)
 	};
 
 	def_frame.stride = (def_frame.width * def_frame.fmt->depth) >> 3;
-	def_frame.size = def_frame.stride * def_frame.height;
 
 	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
 	if (!ctx)
@@ -407,9 +406,6 @@ static int vidioc_s_fmt(struct file *file, void *priv, struct v4l2_format *f)
 		return PTR_ERR(frm);
 	frm->width = pix_fmt->width;
 	frm->height = pix_fmt->height;
-	frm->size = 0;
-	for (i = 0; i < pix_fmt->num_planes; i++)
-		frm->size += pix_fmt->plane_fmt[i].sizeimage;
 	frm->fmt = rga_fmt_find(rga, pix_fmt->pixelformat);
 	frm->stride = pix_fmt->plane_fmt[0].bytesperline;
 	frm->colorspace = pix_fmt->colorspace;
@@ -423,10 +419,10 @@ static int vidioc_s_fmt(struct file *file, void *priv, struct v4l2_format *f)
 	frm->pix = *pix_fmt;
 
 	v4l2_dbg(debug, 1, &rga->v4l2_dev,
-		 "[%s] fmt - %p4cc %dx%d (stride %d, sizeimage %d)\n",
+		 "[%s] fmt - %p4cc %dx%d (stride %d)\n",
 		  V4L2_TYPE_IS_OUTPUT(f->type) ? "OUTPUT" : "CAPTURE",
 		  &frm->fmt->fourcc, frm->width, frm->height,
-		  frm->stride, frm->size);
+		  frm->stride);
 
 	for (i = 0; i < pix_fmt->num_planes; i++) {
 		v4l2_dbg(debug, 1, &rga->v4l2_dev,
diff --git a/drivers/media/platform/rockchip/rga/rga.h b/drivers/media/platform/rockchip/rga/rga.h
index 82ead58719f3baadb77575896ca2d430aa8e3dc6..5aedda2f187e4bfef42c8755c4fc4b1ee5453e8e 100644
--- a/drivers/media/platform/rockchip/rga/rga.h
+++ b/drivers/media/platform/rockchip/rga/rga.h
@@ -42,7 +42,6 @@ struct rga_frame {
 
 	/* Variables that can calculated once and reused */
 	u32 stride;
-	u32 size;
 };
 
 struct rga_dma_desc {

-- 
2.51.0


