Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31E47CD4F4D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 15:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2F0h6IEMxDxvMksG6aGfcOoLuwIxCQctxRZTNMN5Tzs=; b=ww5HpbotiCA5sEqgp5mQr/JMXQ
	x8O/5JEzzh1LyCX9N6EszG1A9THr4X5Gp+T7nG/AQ6M5GfuvyPQx+/wefi3cQBPGQJ2pNZJEdOcCu
	6eUFtNzIyN7lA3SN3IhCwMaN0BVccpoDh800tvZtNRKinNba8swMUBrqBnyOFMlmpElLQ6Eiy4daB
	LiYk6q+3QLYibNPWPIyu0dqIx4yt3o6JsQZ3WGgDr41VlXG/s5bjPTFgSmygKHx/DTVNkSw7H7c11
	OlDsBuFi84k7YGUeRPXu3LEAb9GZNhUn3waIgd+LLHLIzfv6YPSJjjZu7xmZy4dj6Pb4y7JliIReF
	wX9mm9ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNuXq-00000008jII-3vUp;
	Fri, 15 May 2026 15:33:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNuXh-00000008iy8-1pWa
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 15 May 2026 15:33:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=2F0h6IEMxDxvMksG6aGfcOoLuwIxCQctxRZTNMN5Tzs=; b=C31pOyj2PwdUbZjmIktKJXsyTU
	rHkdR57e6ySPprA4Ffv0NobOa75tzTdQqMQZn1+y3D1MTkwJYmdF0gJuIEsYtzAKqZh1evJ7AYwT3
	2HgJFAFfFfsaEwvrLgbIKOAbN0Vyxy5f5azell6vdpZEyPEEqL4kFBJF3dhe1VnCLeCu8HqEaF265
	SHi4BbuS7GZBQTQykClYhq7IqDUeThRAlMi2nVF3fjel2llukhvqYtaV3Jq2/2/HIV2NAHaZoYRCm
	2GBBQrZ4Lg769Ue23ONDCH2J9xfi6NU1eUMG6cMtwyKqXX4rrcqd97IXgkHJk0CZR1FNWEAhyva/j
	eUWPUgOw==;
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNuXd-00000005Zyy-39hH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 15:33:36 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=peter.mobile.pengutronix.de)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.pueschel@pengutronix.de>)
	id 1wNuX2-0005OF-Ga; Fri, 15 May 2026 17:32:56 +0200
From: =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
Date: Fri, 15 May 2026 17:32:38 +0200
Subject: [PATCH v6 12/28] media: rockchip: rga: avoid odd frame sizes for
 YUV formats
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260515-spu-rga3-v6-12-e547152eb9c9@pengutronix.de>
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
X-CRM114-CacheID: sfid-20260515_163334_736287_4421F22F 
X-CRM114-Status: GOOD (  13.03  )
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

Avoid odd frame sizes for YUV formats, as they may cause undefined
behavior. This is done in preparation for the RGA3, which hangs when the
output format is set to 129x129 pixel YUV420 SP (NV12).

This requirement is documented explicitly for the RGA3 in  section 5.6.3
of the RK3588 TRM Part 2. For the RGA2 the RK3588 TRM Part 2
(section 6.1.2) and RK3568 TRM Part 2 (section 14.2) only mentions the
x/y offsets and stride aligning requirements. But the vendor driver for
the RGA2 also contains checks for the width and height to be aligned to
2 bytes.

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Signed-off-by: Sven Püschel <s.pueschel@pengutronix.de>
---
 drivers/media/platform/rockchip/rga/rga.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/platform/rockchip/rga/rga.c
index f599c992829dd..77b8c7ab74274 100644
--- a/drivers/media/platform/rockchip/rga/rga.c
+++ b/drivers/media/platform/rockchip/rga/rga.c
@@ -337,6 +337,19 @@ static int vidioc_try_fmt(struct file *file, void *priv, struct v4l2_format *f)
 	struct rga_ctx *ctx = file_to_rga_ctx(file);
 	const struct rga_hw *hw = ctx->rga->hw;
 	struct rga_fmt *fmt;
+	struct v4l2_frmsize_stepwise frmsize = {
+		.min_width = hw->min_width,
+		.max_width = hw->max_width,
+		.min_height = hw->min_height,
+		.max_height = hw->max_height,
+		.step_width = 1,
+		.step_height = 1,
+	};
+
+	if (v4l2_is_format_yuv(v4l2_format_info(pix_fmt->pixelformat))) {
+		frmsize.step_width = 2;
+		frmsize.step_height = 2;
+	}
 
 	if (V4L2_TYPE_IS_CAPTURE(f->type)) {
 		const struct rga_frame *frm;
@@ -358,11 +371,7 @@ static int vidioc_try_fmt(struct file *file, void *priv, struct v4l2_format *f)
 	if (!fmt)
 		fmt = &hw->formats[0];
 
-	pix_fmt->width = clamp(pix_fmt->width,
-			       hw->min_width, hw->max_width);
-	pix_fmt->height = clamp(pix_fmt->height,
-				hw->min_height, hw->max_height);
-
+	v4l2_apply_frmsize_constraints(&pix_fmt->width, &pix_fmt->height, &frmsize);
 	v4l2_fill_pixfmt_mp(pix_fmt, fmt->fourcc, pix_fmt->width, pix_fmt->height);
 	pix_fmt->field = V4L2_FIELD_NONE;
 

-- 
2.54.0


