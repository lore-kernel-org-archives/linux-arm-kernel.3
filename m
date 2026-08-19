Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12356C5DF8A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 11:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J8Wa3QuzAlTQLc+gqcWoEzUsH/pQiTvOEBpBsJb6Vuk=; b=K9g+b+fyu2z2RjBsFKqpC+Ut4K
	gnN5oKBKIbGGQUUii0nYUmOm4QfLmzaodYwDOacJXO5bPkVFTmu8GsngjLpzGOco1HqmHnT/+bma/
	X04LrPVl+m/FfJ4jANKsdU6OMPqJqmMUeljsjKxQZZDnv0yRzOGGQn/AjvsUX94jG7XSFFcpK1Ag+
	ZHg+e5k4jEc4BN75tPDnHZetHWC2+EWJLm6tTeT3xNwqPtzKnNxtZsQP3EmcS8nr4Sy2yupTqxm9v
	nmTfWEJOQcUVzjY0xKRokgFqlMp0aD7hZlXueTC/ua1nm043fiZP6kTVTxxbf/2RoF0CkLRnGjTuL
	i1VPXJ8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwe6o-00000009cH2-3g6t;
	Wed, 19 Aug 2026 11:05:26 +0000
Received: from mx1.white.stw.pengutronix.de ([185.203.200.13])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwe6i-00000009cAd-2B57;
	Wed, 19 Aug 2026 11:05:22 +0000
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 115AE20240D;
	Wed, 19 Aug 2026 13:05:18 +0200 (CEST)
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1wwe6f-002HRc-2m;
	Wed, 19 Aug 2026 13:05:17 +0200
Received: from [::1] (helo=dude02.red.stw.pengutronix.de)
	by dude02.red.stw.pengutronix.de with esmtp (Exim 4.98.2)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1wwe6f-00000004K0O-2l4X;
	Wed, 19 Aug 2026 13:05:17 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
Date: Wed, 19 Aug 2026 12:37:35 +0200
Subject: [PATCH 6/7] media: verisilicon: Enforce a minimum sizeimage for
 the JPEG decoder
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260819-rk3588-jpegdec-v1-6-33d74cdf369c@pengutronix.de>
References: <20260819-rk3588-jpegdec-v1-0-33d74cdf369c@pengutronix.de>
In-Reply-To: <20260819-rk3588-jpegdec-v1-0-33d74cdf369c@pengutronix.de>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>, 
 Hans Verkuil <hverkuil@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lucas Sinn <lucas.sinn@wolfvision.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787137517; l=3156;
 i=s.hauer@pengutronix.de; s=20230412; h=from:subject:message-id;
 bh=M4825LiLv/KbiKqUXpMLG6Q5hDE5v3ila/71BoMl6bA=;
 b=7IE47SAdua7MiX5F+haXrSfXYWiLdoIjMFNXtNEwjOskmBtoCeMc4mymC/V1B2ypfl1hDHdZa
 07GEXwdJJ+pA+u33NLBvTV0GK8J+NiowhmrcWrwo2mBdkmRFAqPf99M
X-Developer-Key: i=s.hauer@pengutronix.de; a=ed25519;
 pk=4kuc9ocmECiBJKWxYgqyhtZOHj5AWi7+d0n/UjhkwTg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_040520_732215_F51325B5 
X-CRM114-Status: GOOD (  17.64  )
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

From: Lucas Sinn <lucas.sinn@wolfvision.net>

The VPU720 JPEG decoder is driven like a stateful decoder: userspace
hands it a whole frame per source buffer and never looks inside the
bitstream, so it has no way of knowing how large a frame can get.
GStreamer picks a source buffer size of its own, which is large enough at
low resolutions and too small once the resolution grows.

A frame that does not fit is lost.  There is no way to report a partially
consumed buffer, so the driver can only refuse it;
rockchip_vpu720_jpeg_dec_run() notices by finding no EOI marker at the end
of the payload and returns -EINVAL.  Every frame then fails, which is a
poor way to tell an application that its buffers are too small.

For coded formats hantro_try_fmt() computes the worst case frame size and
uses it only when the application asks for zero.  Use it as a lower bound
for the JPEG decoder instead, so an application that asks for less gets
buffers that can hold any frame of the negotiated resolution.  The other
codecs are stateless, userspace parses the bitstream itself and knows the
frame sizes, so they keep the existing behaviour.

This is not free.  max_depth is 2 for V4L2_PIX_FMT_JPEG, so a 1080p source
buffer cannot be smaller than 4 MiB and a 4K one not smaller than 16 MiB,
while a typical JPEG frame is an order of magnitude below that.  The
alternative is to let userspace keep its own size and take the decode
failures, which is worse in practice.

Signed-off-by: Lucas Sinn <lucas.sinn@wolfvision.net>
Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 drivers/media/platform/verisilicon/hantro_v4l2.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/verisilicon/hantro_v4l2.c b/drivers/media/platform/verisilicon/hantro_v4l2.c
index b9b1848e43b30..156d0c5453e5a 100644
--- a/drivers/media/platform/verisilicon/hantro_v4l2.c
+++ b/drivers/media/platform/verisilicon/hantro_v4l2.c
@@ -386,14 +386,26 @@ static int hantro_try_fmt(const struct hantro_ctx *ctx,
 			pix_mp->plane_fmt[0].sizeimage +=
 				hantro_av1_mv_size(pix_mp->width,
 						   pix_mp->height);
-	} else if (!pix_mp->plane_fmt[0].sizeimage) {
+	} else {
+		u32 sizeimage = fmt->header_size +
+				pix_mp->width * pix_mp->height * fmt->max_depth;
+
 		/*
 		 * For coded formats the application can specify
 		 * sizeimage. If the application passes a zero sizeimage,
 		 * let's default to the maximum frame size.
+		 *
+		 * The JPEG decoder is the exception. Applications drive it
+		 * without parsing the bitstream, so they cannot know how large
+		 * a frame gets and pick a size that works at low resolutions
+		 * and silently truncates frames further up. Treat the maximum
+		 * as a minimum there.
 		 */
-		pix_mp->plane_fmt[0].sizeimage = fmt->header_size +
-			pix_mp->width * pix_mp->height * fmt->max_depth;
+		if (fmt->codec_mode == HANTRO_MODE_JPEG_DEC)
+			pix_mp->plane_fmt[0].sizeimage =
+				max(pix_mp->plane_fmt[0].sizeimage, sizeimage);
+		else if (!pix_mp->plane_fmt[0].sizeimage)
+			pix_mp->plane_fmt[0].sizeimage = sizeimage;
 	}
 
 	return 0;

-- 
2.47.3


