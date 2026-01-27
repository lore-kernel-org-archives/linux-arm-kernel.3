Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3E86D2F03E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 14:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jckRIKeE+wVYct1Xgq9rRK89TE7faVdFdoHZl5VgObc=; b=tybEgjkKoje4DiY9LwWi20nMZ9
	vH2fYVdI4N2D+HvUJWvbSC288m11DUdVcxfXoums1R5uDy4g1g+vRSEwOJlOQRm+r8kv92cMwkZ4l
	0P+FWVr/6fZLLrR8LB8XKwLTfkBCmjvqyblGEmmvTumsOBV65bJB2R5CGZomTEvgh0Y6b0WBqmzMG
	xCiiYoU1JakOJzWqcUWSgPgLyU2F14ZThEAj/3Odf1kgvN/5I65ftx2tugLlKWehTmmYkyCCYiraV
	+dmrr9NwuTWS7iHGAjHeztdTzD98XYMqBD9SHTF2lKg53PSL5un9AtbnzJcbn1mBCXyYTEFUwMdn6
	zdJ4OFPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkkGu-0000000ERdU-3DHA;
	Tue, 27 Jan 2026 14:42:24 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkkF4-0000000EQ7F-1SoR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 14:40:31 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=peter.mobile.pengutronix.de)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.pueschel@pengutronix.de>)
	id 1vkkEn-0007YT-1K; Tue, 27 Jan 2026 15:40:13 +0100
From: =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
Date: Tue, 27 Jan 2026 15:39:18 +0100
Subject: [PATCH v3 09/27] media: rockchip: rga: announce and sync
 colorimetry
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260127-spu-rga3-v3-9-77b273067beb@pengutronix.de>
References: <20260127-spu-rga3-v3-0-77b273067beb@pengutronix.de>
In-Reply-To: <20260127-spu-rga3-v3-0-77b273067beb@pengutronix.de>
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
X-Mailer: b4 0.14.3
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.pueschel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_064030_418165_E564D7F4 
X-CRM114-Status: GOOD (  15.56  )
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

Announce the capability to adjust the quantization and ycbcr_enc on the
capture side and check if the SET_CSC flag is set when the colorimetry
is changed. Furthermore copy the colorimetry from the output to the
capture side to fix the currently failing v4l2-compliance tests, which
expect exactly this behavior.

Signed-off-by: Sven Püschel <s.pueschel@pengutronix.de>
---
 drivers/media/platform/rockchip/rga/rga.c | 37 +++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/platform/rockchip/rga/rga.c
index 20d1d9cb7625d..cf9d5702598fa 100644
--- a/drivers/media/platform/rockchip/rga/rga.c
+++ b/drivers/media/platform/rockchip/rga/rga.c
@@ -437,6 +437,15 @@ static int vidioc_enum_fmt(struct file *file, void *priv, struct v4l2_fmtdesc *f
 	fmt = &formats[f->index];
 	f->pixelformat = fmt->fourcc;
 
+	if (f->type != V4L2_BUF_TYPE_VIDEO_CAPTURE &&
+	    f->type != V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
+		return 0;
+
+	/* allow changing the quantization and xfer func for YUV formats */
+	if (v4l2_is_format_yuv(v4l2_format_info(f->pixelformat)))
+		f->flags |= V4L2_FMT_FLAG_CSC_QUANTIZATION |
+			    V4L2_FMT_FLAG_CSC_YCBCR_ENC;
+
 	return 0;
 }
 
@@ -459,8 +468,25 @@ static int vidioc_g_fmt(struct file *file, void *priv, struct v4l2_format *f)
 static int vidioc_try_fmt(struct file *file, void *priv, struct v4l2_format *f)
 {
 	struct v4l2_pix_format_mplane *pix_fmt = &f->fmt.pix_mp;
+	struct rga_ctx *ctx = file_to_rga_ctx(file);
 	struct rga_fmt *fmt;
 
+	if (V4L2_TYPE_IS_CAPTURE(f->type)) {
+		const struct rga_frame *frm;
+
+		frm = rga_get_frame(ctx, f->type);
+		if (IS_ERR(frm))
+			return PTR_ERR(frm);
+
+		if (!(pix_fmt->flags & V4L2_PIX_FMT_FLAG_SET_CSC)) {
+			pix_fmt->quantization = frm->pix.quantization;
+			pix_fmt->ycbcr_enc = frm->pix.ycbcr_enc;
+		}
+		/* disallow values not announced in vidioc_enum_fmt */
+		pix_fmt->colorspace = frm->pix.colorspace;
+		pix_fmt->xfer_func = frm->pix.xfer_func;
+	}
+
 	fmt = rga_fmt_find(pix_fmt->pixelformat);
 	if (!fmt)
 		fmt = &formats[0];
@@ -506,6 +532,17 @@ static int vidioc_s_fmt(struct file *file, void *priv, struct v4l2_format *f)
 	frm->fmt = rga_fmt_find(pix_fmt->pixelformat);
 	frm->stride = pix_fmt->plane_fmt[0].bytesperline;
 
+	/*
+	 * Copy colorimetry from output to capture as required by the
+	 * v4l2-compliance tests
+	 */
+	if (V4L2_TYPE_IS_OUTPUT(f->type)) {
+		ctx->out.pix.colorspace = pix_fmt->colorspace;
+		ctx->out.pix.ycbcr_enc = pix_fmt->ycbcr_enc;
+		ctx->out.pix.quantization = pix_fmt->quantization;
+		ctx->out.pix.xfer_func = pix_fmt->xfer_func;
+	}
+
 	/* Reset crop settings */
 	frm->crop.left = 0;
 	frm->crop.top = 0;

-- 
2.52.0


