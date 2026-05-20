Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F474CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 22:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kMxnPdcTBIEnrhPTH/FcfmDwNV+xCUz1fGXwJS0DjwA=; b=OoJsNoHkAiuyRgIPE3RRGkCS08
	SAsEZqgg3XpzNjPpPL49/OlLx1fjhH50YcaZHS07nFGrbGkmwqSaawJctdrO8FN+VXtvEDMoIDLp7
	+20g/A/dRvFM2Lop9aupMXmv0E73ZsN1KQNa/Xw/V4yUWuZifH1koxxm6VhL0970x4fcwPNWCDx4u
	2BT5KVdk0+cVTDFNzi4uSi4sC7KODHn4tqXd+w+JnrPl47YbLdQxdPuIXhQLBwF58l2PKVt+pKuXe
	DAFjy/ACSTIOj4zzIs4899Zq6VoFfjwzBxKGae8PBjgRpuxMO5TEHt0UJo3ayMq5emHJtuW54znuS
	EMR2GQ3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPpfP-000000061kS-0kYf;
	Wed, 20 May 2026 22:45:31 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPpeq-000000060nj-2TfW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 22:44:59 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=peter.mobile.pengutronix.de)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.pueschel@pengutronix.de>)
	id 1wPpeh-0005vy-Vu; Thu, 21 May 2026 00:44:48 +0200
From: =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
Date: Thu, 21 May 2026 00:44:20 +0200
Subject: [PATCH v7 15/28] media: rockchip: rga: align stride to 4 bytes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260521-spu-rga3-v7-15-3f33e8c7145f@pengutronix.de>
References: <20260521-spu-rga3-v7-0-3f33e8c7145f@pengutronix.de>
In-Reply-To: <20260521-spu-rga3-v7-0-3f33e8c7145f@pengutronix.de>
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
X-CRM114-CacheID: sfid-20260520_154456_705004_158B3A3B 
X-CRM114-Status: GOOD (  15.34  )
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

Add an alignment setting to rga_hw to set the desired stride alignment.
As the RGA2 register for the stride counts in word units, the code
already divides the bytesperline value by 4 when writing it into the
register. Therefore fix the alignment to a multiple of 4 to avoid
potential off by one errors due from the division.

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Signed-off-by: Sven Püschel <s.pueschel@pengutronix.de>

---
Changed in v6:
- Drop unintended change from fmt->fourcc to pix_fmt->pixelformat
  Flagged by Sashiko:
  https://sashiko.dev/#/patchset/20260428-spu-rga3-v5-0-eb7f5d019d86%40pengutronix.de?part=15
---
 drivers/media/platform/rockchip/rga/rga-hw.c |  1 +
 drivers/media/platform/rockchip/rga/rga.c    | 11 ++++++-----
 drivers/media/platform/rockchip/rga/rga.h    |  1 +
 3 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/rockchip/rga/rga-hw.c b/drivers/media/platform/rockchip/rga/rga-hw.c
index 9881c14f908d5..dac3cb6aa17d3 100644
--- a/drivers/media/platform/rockchip/rga/rga-hw.c
+++ b/drivers/media/platform/rockchip/rga/rga-hw.c
@@ -580,6 +580,7 @@ const struct rga_hw rga2_hw = {
 	.max_width = MAX_WIDTH,
 	.min_height = MIN_HEIGHT,
 	.max_height = MAX_HEIGHT,
+	.stride_alignment = 4,
 
 	.start = rga_hw_start,
 	.handle_irq = rga_handle_irq,
diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/platform/rockchip/rga/rga.c
index bf6bbcbfc869b..d080cb672740b 100644
--- a/drivers/media/platform/rockchip/rga/rga.c
+++ b/drivers/media/platform/rockchip/rga/rga.c
@@ -234,10 +234,10 @@ static int rga_open(struct file *file)
 	ctx->in = def_frame;
 	ctx->out = def_frame;
 
-	v4l2_fill_pixfmt_mp(&ctx->in.pix,
-			    ctx->in.fmt->fourcc, def_width, def_height);
-	v4l2_fill_pixfmt_mp(&ctx->out.pix,
-			    ctx->out.fmt->fourcc, def_width, def_height);
+	v4l2_fill_pixfmt_mp_aligned(&ctx->in.pix, ctx->in.fmt->fourcc,
+				    def_width, def_height, rga->hw->stride_alignment);
+	v4l2_fill_pixfmt_mp_aligned(&ctx->out.pix, ctx->out.fmt->fourcc,
+				    def_width, def_height, rga->hw->stride_alignment);
 
 	if (mutex_lock_interruptible(&rga->mutex)) {
 		ret = -ERESTARTSYS;
@@ -393,7 +393,8 @@ static int vidioc_try_fmt(struct file *file, void *priv, struct v4l2_format *f)
 		fmt = &hw->formats[0];
 
 	v4l2_apply_frmsize_constraints(&pix_fmt->width, &pix_fmt->height, &frmsize);
-	v4l2_fill_pixfmt_mp(pix_fmt, fmt->fourcc, pix_fmt->width, pix_fmt->height);
+	v4l2_fill_pixfmt_mp_aligned(pix_fmt, fmt->fourcc,
+				    pix_fmt->width, pix_fmt->height, hw->stride_alignment);
 	pix_fmt->field = V4L2_FIELD_NONE;
 
 	return 0;
diff --git a/drivers/media/platform/rockchip/rga/rga.h b/drivers/media/platform/rockchip/rga/rga.h
index 04aeb7b429523..38518146910a6 100644
--- a/drivers/media/platform/rockchip/rga/rga.h
+++ b/drivers/media/platform/rockchip/rga/rga.h
@@ -150,6 +150,7 @@ struct rga_hw {
 	size_t cmdbuf_size;
 	u32 min_width, min_height;
 	u32 max_width, max_height;
+	u8 stride_alignment;
 
 	void (*start)(struct rockchip_rga *rga,
 		      struct rga_vb_buffer *src, struct rga_vb_buffer *dst);

-- 
2.54.0


