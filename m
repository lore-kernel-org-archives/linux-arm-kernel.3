Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AB0ECD4F48
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 15:33:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tL+NqYfoXXhxAsfm48dTED3mFcnXQMPdFim48qetq44=; b=HqcAu+hfwdynVdz26GQaaYbg1b
	G9DmwcYjqunYPzI+GSsdoZSoSS3xi+iA9ND6uzpuwoIb9nvLgixKhSHPbHptV4ZPi90phNe5unjkF
	S2RG+lDYyu1tNhW6ygBzOiJ7PamqO3YLq+ARj/BdrVKw7+jDpYlCTJhjzmVz5JmnXW8guS2clleKO
	+DrV0pxsHMwO1Va5j/4l9bIalltb3KuRAH+795EUyPO87OxbA1QqaURrTZSqTccTUnZYsfVkltzA2
	kcrOGI7oc1OgQusa5LgL8YsJ0FD9eGdQtwI24Sd9asSt87PFslA5khF2SSSC0BldM3cCNnnTcFnY3
	lqX/fr7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNuXU-00000008ich-3KK4;
	Fri, 15 May 2026 15:33:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNuXR-00000008iVe-3Z9O
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 15 May 2026 15:33:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=tL+NqYfoXXhxAsfm48dTED3mFcnXQMPdFim48qetq44=; b=SpdIu3MgNlFRXFBTLoI8Z4ejZS
	W+sKSf/oSS0N9thvoUK7Hn+PsUOon7J5Up0Um2xcFksaT5qubgfF4Uq3qlqLGLxB9LQspX68R0+4H
	SZVvJjjIFC/LKZDbbAXsLZ2+oii8chFXNg3hAgJEApvLsK2PJkBm6gQAThh3poeacunC/hTIWRexc
	gdHzyx29pIRGq2pYLA5TSwmkw/hEmja/Vg2+gl0tMGPBwHpGHVosQF454r2DtxNWN/UhewkVYOTbU
	QIUBaNLPin2VX+fv7ShX7URjeZdWIDsqeeFQiUCjdQDIKrO/yLMjdvAWeS53ACoQRCOIJBl9b+TSv
	c3J6lwbQ==;
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNuXO-00000005Zsh-2gJa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 15:33:20 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=peter.mobile.pengutronix.de)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.pueschel@pengutronix.de>)
	id 1wNuWw-0005OF-HQ; Fri, 15 May 2026 17:32:50 +0200
From: =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
Date: Fri, 15 May 2026 17:32:34 +0200
Subject: [PATCH v6 08/28] media: rockchip: rga: use stride for offset
 calculation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260515-spu-rga3-v6-8-e547152eb9c9@pengutronix.de>
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
X-CRM114-CacheID: sfid-20260515_163319_129525_3DA82A3E 
X-CRM114-Status: GOOD (  15.82  )
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

Use the stride instead of the width for the offset calculation. This
ensures that the bytesperline value doesn't need to match the width
value of the image.

Furthermore this patch removes the dependency on the uv_factor property
and instead reuses the v4l2_format_info to determine the correct
division factor.

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Signed-off-by: Sven Püschel <s.pueschel@pengutronix.de>
---
 drivers/media/platform/rockchip/rga/rga-buf.c | 14 +++++++++-----
 drivers/media/platform/rockchip/rga/rga.c     | 16 ----------------
 drivers/media/platform/rockchip/rga/rga.h     |  1 -
 3 files changed, 9 insertions(+), 22 deletions(-)

diff --git a/drivers/media/platform/rockchip/rga/rga-buf.c b/drivers/media/platform/rockchip/rga/rga-buf.c
index bb575873f2b24..65fc0d5b4aa10 100644
--- a/drivers/media/platform/rockchip/rga/rga-buf.c
+++ b/drivers/media/platform/rockchip/rga/rga-buf.c
@@ -14,7 +14,6 @@
 #include <media/videobuf2-dma-sg.h>
 #include <media/videobuf2-v4l2.h>
 
-#include "rga-hw.h"
 #include "rga.h"
 
 static ssize_t fill_descriptors(struct rga_dma_desc *desc, size_t max_desc,
@@ -95,14 +94,19 @@ static int rga_buf_init(struct vb2_buffer *vb)
 	return 0;
 }
 
-static int get_plane_offset(struct rga_frame *f, int plane)
+static int get_plane_offset(struct rga_frame *f,
+			    const struct v4l2_format_info *info,
+			    int plane)
 {
+	u32 stride = f->pix.plane_fmt[0].bytesperline;
+
 	if (plane == 0)
 		return 0;
 	if (plane == 1)
-		return f->width * f->height;
+		return stride * f->height;
 	if (plane == 2)
-		return f->width * f->height + (f->width * f->height / f->fmt->uv_factor);
+		return stride * f->height +
+		       (stride * f->height / info->hdiv / info->vdiv);
 
 	return -EINVAL;
 }
@@ -148,7 +152,7 @@ static int rga_buf_prepare(struct vb2_buffer *vb)
 	/* Fill the remaining planes */
 	info = v4l2_format_info(f->fmt->fourcc);
 	for (i = info->mem_planes; i < info->comp_planes; i++)
-		offsets[i] = get_plane_offset(f, i);
+		offsets[i] = get_plane_offset(f, info, i);
 
 	rbuf->offset.y_off = offsets[0];
 	rbuf->offset.u_off = offsets[1];
diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/platform/rockchip/rga/rga.c
index 4e710a050cb7c..c07207edffdb6 100644
--- a/drivers/media/platform/rockchip/rga/rga.c
+++ b/drivers/media/platform/rockchip/rga/rga.c
@@ -190,7 +190,6 @@ static struct rga_fmt formats[] = {
 		.color_swap = RGA_COLOR_ALPHA_SWAP,
 		.hw_format = RGA_COLOR_FMT_ABGR8888,
 		.depth = 32,
-		.uv_factor = 1,
 		.y_div = 1,
 		.x_div = 1,
 	},
@@ -199,7 +198,6 @@ static struct rga_fmt formats[] = {
 		.color_swap = RGA_COLOR_RB_SWAP,
 		.hw_format = RGA_COLOR_FMT_ABGR8888,
 		.depth = 32,
-		.uv_factor = 1,
 		.y_div = 1,
 		.x_div = 1,
 	},
@@ -208,7 +206,6 @@ static struct rga_fmt formats[] = {
 		.color_swap = RGA_COLOR_RB_SWAP,
 		.hw_format = RGA_COLOR_FMT_XBGR8888,
 		.depth = 32,
-		.uv_factor = 1,
 		.y_div = 1,
 		.x_div = 1,
 	},
@@ -217,7 +214,6 @@ static struct rga_fmt formats[] = {
 		.color_swap = RGA_COLOR_NONE_SWAP,
 		.hw_format = RGA_COLOR_FMT_RGB888,
 		.depth = 24,
-		.uv_factor = 1,
 		.y_div = 1,
 		.x_div = 1,
 	},
@@ -226,7 +222,6 @@ static struct rga_fmt formats[] = {
 		.color_swap = RGA_COLOR_RB_SWAP,
 		.hw_format = RGA_COLOR_FMT_RGB888,
 		.depth = 24,
-		.uv_factor = 1,
 		.y_div = 1,
 		.x_div = 1,
 	},
@@ -235,7 +230,6 @@ static struct rga_fmt formats[] = {
 		.color_swap = RGA_COLOR_RB_SWAP,
 		.hw_format = RGA_COLOR_FMT_ABGR4444,
 		.depth = 16,
-		.uv_factor = 1,
 		.y_div = 1,
 		.x_div = 1,
 	},
@@ -244,7 +238,6 @@ static struct rga_fmt formats[] = {
 		.color_swap = RGA_COLOR_RB_SWAP,
 		.hw_format = RGA_COLOR_FMT_ABGR1555,
 		.depth = 16,
-		.uv_factor = 1,
 		.y_div = 1,
 		.x_div = 1,
 	},
@@ -253,7 +246,6 @@ static struct rga_fmt formats[] = {
 		.color_swap = RGA_COLOR_RB_SWAP,
 		.hw_format = RGA_COLOR_FMT_BGR565,
 		.depth = 16,
-		.uv_factor = 1,
 		.y_div = 1,
 		.x_div = 1,
 	},
@@ -262,7 +254,6 @@ static struct rga_fmt formats[] = {
 		.color_swap = RGA_COLOR_UV_SWAP,
 		.hw_format = RGA_COLOR_FMT_YUV420SP,
 		.depth = 12,
-		.uv_factor = 4,
 		.y_div = 2,
 		.x_div = 1,
 	},
@@ -271,7 +262,6 @@ static struct rga_fmt formats[] = {
 		.color_swap = RGA_COLOR_UV_SWAP,
 		.hw_format = RGA_COLOR_FMT_YUV422SP,
 		.depth = 16,
-		.uv_factor = 2,
 		.y_div = 1,
 		.x_div = 1,
 	},
@@ -280,7 +270,6 @@ static struct rga_fmt formats[] = {
 		.color_swap = RGA_COLOR_NONE_SWAP,
 		.hw_format = RGA_COLOR_FMT_YUV420SP,
 		.depth = 12,
-		.uv_factor = 4,
 		.y_div = 2,
 		.x_div = 1,
 	},
@@ -289,7 +278,6 @@ static struct rga_fmt formats[] = {
 		.color_swap = RGA_COLOR_NONE_SWAP,
 		.hw_format = RGA_COLOR_FMT_YUV420SP,
 		.depth = 12,
-		.uv_factor = 4,
 		.y_div = 2,
 		.x_div = 1,
 	},
@@ -298,7 +286,6 @@ static struct rga_fmt formats[] = {
 		.color_swap = RGA_COLOR_NONE_SWAP,
 		.hw_format = RGA_COLOR_FMT_YUV422SP,
 		.depth = 16,
-		.uv_factor = 2,
 		.y_div = 1,
 		.x_div = 1,
 	},
@@ -307,7 +294,6 @@ static struct rga_fmt formats[] = {
 		.color_swap = RGA_COLOR_NONE_SWAP,
 		.hw_format = RGA_COLOR_FMT_YUV420P,
 		.depth = 12,
-		.uv_factor = 4,
 		.y_div = 2,
 		.x_div = 2,
 	},
@@ -316,7 +302,6 @@ static struct rga_fmt formats[] = {
 		.color_swap = RGA_COLOR_NONE_SWAP,
 		.hw_format = RGA_COLOR_FMT_YUV422P,
 		.depth = 16,
-		.uv_factor = 2,
 		.y_div = 1,
 		.x_div = 2,
 	},
@@ -325,7 +310,6 @@ static struct rga_fmt formats[] = {
 		.color_swap = RGA_COLOR_UV_SWAP,
 		.hw_format = RGA_COLOR_FMT_YUV420P,
 		.depth = 12,
-		.uv_factor = 4,
 		.y_div = 2,
 		.x_div = 2,
 	},
diff --git a/drivers/media/platform/rockchip/rga/rga.h b/drivers/media/platform/rockchip/rga/rga.h
index 2db10acecb405..477cf5b62bbb2 100644
--- a/drivers/media/platform/rockchip/rga/rga.h
+++ b/drivers/media/platform/rockchip/rga/rga.h
@@ -17,7 +17,6 @@
 struct rga_fmt {
 	u32 fourcc;
 	int depth;
-	u8 uv_factor;
 	u8 y_div;
 	u8 x_div;
 	u8 color_swap;

-- 
2.54.0


