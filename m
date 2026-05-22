Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9547CD5BAC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 10:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kDG8RjoOKxfQIe1vG3aa/WbKkMzSYKTB9snie6uUrBA=; b=RtLiIYXCiKTFdhD8IlHv5ELfAG
	yMiTd4VkaI81EQpDsf8izu2aLKAkLHez+pAwplAgfjOjPj6+P5LUFTfG22rCPKX1n+pPFCqAxhPv4
	xq0Ekyqf65JN15uBirCM/lYOrH6bOWVWsyOmnMI1adG8JE/8GF7wUdWhlzz9cLvpnrHFPA8/OHdND
	nZWALIMuUdAmTBmREJq+9/EiFXQN2EViWOiqKPwIKPxupm82u+REAliaMsmRiRFk3ac99llk8TW2L
	lmLgBuk8FdpADu7r8h9tVsYfeoTf65jAu+Gz0p3oQYcFzvZSvBWgYxUXFCyjXI9Hb+1wMQvvKAI13
	1QUxm/Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQMxW-0000000ATta-1l1B;
	Fri, 22 May 2026 10:18:26 +0000
Received: from leonov.paulk.fr ([185.233.101.22])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQMxS-0000000ATpD-3fOy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 10:18:24 +0000
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 495353700294
	for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 10:18:02 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 4000CB408D0; Fri, 22 May 2026 10:18:00 +0000 (UTC)
Received: from shepard (unknown [192.168.1.65])
	by laika.paulk.fr (Postfix) with ESMTP id A7598B408D4;
	Fri, 22 May 2026 10:17:13 +0000 (UTC)
From: Paul Kocialkowski <paulk@sys-base.io>
To: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Michael Tretter <m.tretter@pengutronix.de>,
	Paul Kocialkowski <paulk@sys-base.io>
Subject: [PATCH 11/14] media: verisilicon: Add common encoder parm and frameintervals ioctls
Date: Fri, 22 May 2026 12:16:50 +0200
Message-ID: <20260522101653.2565125-12-paulk@sys-base.io>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260522101653.2565125-1-paulk@sys-base.io>
References: <20260522101653.2565125-1-paulk@sys-base.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_031823_303098_82DA79E0 
X-CRM114-Status: GOOD (  17.45  )
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

This introduces the required encoder ioctls for configuring the
frame rate (via the parm timeperframe field) and enumerating available
frame rates (via enum_frameintervals) for the encoder.

Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
---
 drivers/media/platform/verisilicon/hantro.h   |  3 +
 .../media/platform/verisilicon/hantro_drv.c   |  3 +
 .../media/platform/verisilicon/hantro_v4l2.c  | 99 +++++++++++++++++++
 3 files changed, 105 insertions(+)

diff --git a/drivers/media/platform/verisilicon/hantro.h b/drivers/media/platform/verisilicon/hantro.h
index e0fdc4535b2d..badd0b13988c 100644
--- a/drivers/media/platform/verisilicon/hantro.h
+++ b/drivers/media/platform/verisilicon/hantro.h
@@ -258,6 +258,9 @@ struct hantro_ctx {
 	struct v4l2_pix_format_mplane dst_fmt;
 	struct v4l2_pix_format_mplane ref_fmt;
 
+	struct v4l2_fract src_timeperframe;
+	struct v4l2_fract dst_timeperframe;
+
 	struct v4l2_ctrl_handler ctrl_handler;
 	int jpeg_quality;
 	int bit_depth;
diff --git a/drivers/media/platform/verisilicon/hantro_drv.c b/drivers/media/platform/verisilicon/hantro_drv.c
index 6f72e25fa88c..d798ba361b25 100644
--- a/drivers/media/platform/verisilicon/hantro_drv.c
+++ b/drivers/media/platform/verisilicon/hantro_drv.c
@@ -923,8 +923,11 @@ static int hantro_add_func(struct hantro_dev *vpu, unsigned int funcid)
 		vpu->decoder = func;
 		v4l2_disable_ioctl(vfd, VIDIOC_TRY_ENCODER_CMD);
 		v4l2_disable_ioctl(vfd, VIDIOC_ENCODER_CMD);
+		v4l2_disable_ioctl(vfd, VIDIOC_ENUM_FRAMEINTERVALS);
 		v4l2_disable_ioctl(vfd, VIDIOC_G_SELECTION);
 		v4l2_disable_ioctl(vfd, VIDIOC_S_SELECTION);
+		v4l2_disable_ioctl(vfd, VIDIOC_G_PARM);
+		v4l2_disable_ioctl(vfd, VIDIOC_S_PARM);
 	}
 
 	video_set_drvdata(vfd, vpu);
diff --git a/drivers/media/platform/verisilicon/hantro_v4l2.c b/drivers/media/platform/verisilicon/hantro_v4l2.c
index 1001feee5c07..2125f2913d9a 100644
--- a/drivers/media/platform/verisilicon/hantro_v4l2.c
+++ b/drivers/media/platform/verisilicon/hantro_v4l2.c
@@ -213,6 +213,41 @@ static int vidioc_enum_framesizes(struct file *file, void *priv,
 	return 0;
 }
 
+static int vidioc_enum_frameintervals(struct file *file, void *priv,
+				      struct v4l2_frmivalenum *fival)
+{
+	struct v4l2_frmsizeenum fsize = { 0 };
+	unsigned int width = fival->width;
+	unsigned int height = fival->height;
+	int ret;
+
+	if (fival->index > 0)
+		return -EINVAL;
+
+	/* First check that the provided format and dimensions are valid. */
+	fsize.pixel_format = fival->pixel_format;
+	ret = vidioc_enum_framesizes(file, priv, &fsize);
+	if (ret)
+		return ret;
+
+	if (width < fsize.stepwise.min_width ||
+	    width > fsize.stepwise.max_width ||
+	    height < fsize.stepwise.min_height ||
+	    height > fsize.stepwise.max_height)
+		return -EINVAL;
+
+	/* Any possible frame interval is acceptable. */
+	fival->type = V4L2_FRMIVAL_TYPE_CONTINUOUS;
+	fival->stepwise.min.numerator = 1;
+	fival->stepwise.min.denominator = USHRT_MAX;
+	fival->stepwise.max.numerator = USHRT_MAX;
+	fival->stepwise.max.denominator = 1;
+	fival->stepwise.step.numerator = 1;
+	fival->stepwise.step.denominator = 1;
+
+	return 0;
+}
+
 static int vidioc_enum_fmt(struct file *file, void *priv,
 			   struct v4l2_fmtdesc *f, bool capture)
 
@@ -484,10 +519,23 @@ hantro_reset_raw_fmt(struct hantro_ctx *ctx, int bit_depth, bool need_postproc)
 	return ret;
 }
 
+static void
+hantro_reset_timeperframe(struct hantro_ctx *ctx)
+{
+	struct v4l2_fract *timeperframe = &ctx->src_timeperframe;
+	struct v4l2_fract *timeperframe_propagate = &ctx->dst_timeperframe;
+
+	timeperframe->numerator = 1;
+	timeperframe->denominator = 25;
+
+	*timeperframe_propagate = *timeperframe;
+}
+
 void hantro_reset_fmts(struct hantro_ctx *ctx)
 {
 	hantro_reset_encoded_fmt(ctx);
 	hantro_reset_raw_fmt(ctx, HANTRO_DEFAULT_BIT_DEPTH, HANTRO_AUTO_POSTPROC);
+	hantro_reset_timeperframe(ctx);
 }
 
 static void
@@ -739,6 +787,54 @@ static int vidioc_s_selection(struct file *file, void *priv,
 	return 0;
 }
 
+static int vidioc_g_parm(struct file *file, void *priv,
+			 struct v4l2_streamparm *parm)
+{
+	struct hantro_ctx *ctx = file_to_ctx(file);
+	struct v4l2_fract *timeperframe;
+
+	if (V4L2_TYPE_IS_OUTPUT(parm->type)) {
+		timeperframe = &ctx->src_timeperframe;
+		parm->parm.output.capability = V4L2_CAP_TIMEPERFRAME;
+		parm->parm.output.timeperframe = *timeperframe;
+	} else {
+		timeperframe = &ctx->dst_timeperframe;
+		parm->parm.capture.capability = V4L2_CAP_TIMEPERFRAME;
+		parm->parm.capture.timeperframe = *timeperframe;
+	}
+
+	return 0;
+}
+
+static int vidioc_s_parm(struct file *file, void *priv,
+			 struct v4l2_streamparm *parm)
+{
+	struct hantro_ctx *ctx = file_to_ctx(file);
+	struct v4l2_fract *timeperframe_propagate;
+	struct v4l2_fract *timeperframe_ctx;
+	struct v4l2_fract *timeperframe;
+
+	if (V4L2_TYPE_IS_OUTPUT(parm->type)) {
+		parm->parm.output.capability = V4L2_CAP_TIMEPERFRAME;
+		timeperframe = &parm->parm.output.timeperframe;
+		timeperframe_ctx = &ctx->src_timeperframe;
+		timeperframe_propagate = &ctx->dst_timeperframe;
+	} else {
+		parm->parm.capture.capability = V4L2_CAP_TIMEPERFRAME;
+		timeperframe = &parm->parm.capture.timeperframe;
+		timeperframe_ctx = &ctx->dst_timeperframe;
+		timeperframe_propagate = NULL;
+	}
+
+	*timeperframe_ctx = *timeperframe;
+
+	/* Propagate from source to destination. */
+	if (timeperframe_propagate)
+		*timeperframe_propagate = *timeperframe;
+
+	return 0;
+}
+
 static const struct v4l2_event hantro_eos_event = {
 	.type = V4L2_EVENT_EOS
 };
@@ -774,6 +870,7 @@ static int vidioc_encoder_cmd(struct file *file, void *priv,
 const struct v4l2_ioctl_ops hantro_ioctl_ops = {
 	.vidioc_querycap = vidioc_querycap,
 	.vidioc_enum_framesizes = vidioc_enum_framesizes,
+	.vidioc_enum_frameintervals = vidioc_enum_frameintervals,
 
 	.vidioc_try_fmt_vid_cap_mplane = vidioc_try_fmt_cap_mplane,
 	.vidioc_try_fmt_vid_out_mplane = vidioc_try_fmt_out_mplane,
@@ -801,6 +898,8 @@ const struct v4l2_ioctl_ops hantro_ioctl_ops = {
 
 	.vidioc_g_selection = vidioc_g_selection,
 	.vidioc_s_selection = vidioc_s_selection,
+	.vidioc_g_parm = vidioc_g_parm,
+	.vidioc_s_parm = vidioc_s_parm,
 
 	.vidioc_decoder_cmd = v4l2_m2m_ioctl_stateless_decoder_cmd,
 	.vidioc_try_decoder_cmd = v4l2_m2m_ioctl_stateless_try_decoder_cmd,
-- 
2.53.0


