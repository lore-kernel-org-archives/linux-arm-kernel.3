Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39A15CCD185
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Oct 2025 08:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GedOwBf2+fFq2MqvodeJfzNJn7bW5TxA8j4IUAdkJ/k=; b=mKhfpKWtJjSisbKi6YZSWebWvk
	L1Fa2K/wkHeUJqNxCgF77pYPoRUgA3yMQaWGcmhEVQ9n6G6O9h3rCOWIBJM6n/adKCJlWvuJd7t3I
	9wbjXUBOllPnBSmGiZKvS2hCR8yfCTHvLcDiKaXUEfYgJ5Ea/vOoGwDycL3frCeUB7ulNRYYQM7bx
	OTyr9W3J3G3kqf5NY1eKvu/eqG8UQsq+lwRVKeQMOOzK5M3lD0RMgeNe/fzSN5ylDcIs04YhOoUQP
	Rh7nrmif6H3LIzN7LAyAxaXOIp9/+0jC9a15wnxYwUHgB06Mb7hZDYAFcIolabfKrY21Pr8XYMaKM
	qFAlIrNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v637x-00000001YRO-3Sun;
	Tue, 07 Oct 2025 08:32:57 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v637s-00000001YKe-1fIE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Oct 2025 08:32:53 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=peter.mobile.pengutronix.de)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.pueschel@pengutronix.de>)
	id 1v637p-0002Hb-J6; Tue, 07 Oct 2025 10:32:49 +0200
From: =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
Date: Tue, 07 Oct 2025 10:31:55 +0200
Subject: [PATCH 02/16] media: rockchip: rga: use stride for offset
 calculation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251007-spu-rga3-v1-2-36ad85570402@pengutronix.de>
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
X-CRM114-CacheID: sfid-20251007_013252_452584_B0F32918 
X-CRM114-Status: GOOD (  14.42  )
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

Signed-off-by: Sven Püschel <s.pueschel@pengutronix.de>
---
 drivers/media/platform/rockchip/rga/rga-buf.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/rockchip/rga/rga-buf.c b/drivers/media/platform/rockchip/rga/rga-buf.c
index 730bdf98565a55704cef92345ccf9f486b99b06e..b5e6b1b527ca81721c64d96d984d5e981449c237 100644
--- a/drivers/media/platform/rockchip/rga/rga-buf.c
+++ b/drivers/media/platform/rockchip/rga/rga-buf.c
@@ -14,7 +14,6 @@
 #include <media/videobuf2-dma-sg.h>
 #include <media/videobuf2-v4l2.h>
 
-#include "rga-hw.h"
 #include "rga.h"
 
 static ssize_t fill_descriptors(struct rga_dma_desc *desc, size_t max_desc,
@@ -92,14 +91,19 @@ static int rga_buf_init(struct vb2_buffer *vb)
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
@@ -145,7 +149,7 @@ static int rga_buf_prepare(struct vb2_buffer *vb)
 	/* Fill the remaining planes */
 	info = v4l2_format_info(f->fmt->fourcc);
 	for (i = info->mem_planes; i < info->comp_planes; i++)
-		offsets[i] = get_plane_offset(f, i);
+		offsets[i] = get_plane_offset(f, info, i);
 
 	rbuf->offset.y_off = offsets[0];
 	rbuf->offset.u_off = offsets[1];

-- 
2.51.0


