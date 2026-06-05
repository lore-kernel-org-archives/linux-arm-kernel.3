Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94F1BCD6E79
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 13:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2b96RzL24b32qsigcpX/IeM7BHzRhqo+9WcOKSubB3k=; b=vouRZn4ygbUKTY8lLnd21UB65R
	rz4vXfEKgbi4BCffpQVk37HDHfSh65Kvj97XQGGfEtZOa5vezJ7IjWR1Ah6uvO8mzCBpl2wxOiN6k
	4KtBKU74Rr0GOaFBFiHbPSw74ZLG+j5w/6avzzYZvq7SQtk56J9bxGNCfDIzvMVKKKm62IYnuxbyt
	R/C8SDdF4ChsKfaq/OBFaaowkPPszSqaBIZncQbmW7TnlB+tXHhXEKb2QZvCDvQGZygYAxHxqi6H9
	3XCqUszjWvKIrhZIrbe4qJfZElcjPnr7SlBjXZXQQyucEm6QQK80u7eez9l2UqM4S5ixeEzvfkm5H
	wIg4Q5RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVUeu-00000000gEf-160F;
	Fri, 05 Jun 2026 13:32:24 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVUes-00000000gE8-1H0b
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Jun 2026 13:32:23 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=peter.mobile.pengutronix.de)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.pueschel@pengutronix.de>)
	id 1wVUee-0000cf-1N; Fri, 05 Jun 2026 15:32:08 +0200
From: =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
Date: Fri, 05 Jun 2026 15:32:01 +0200
Subject: [PATCH] media: rockchip: rga: don't change RGB quantization
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260605-spu-fixrga3quantization-v1-1-1059d984dc6e@pengutronix.de>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWMQQ6CMBAAv0L2bJMtxmr8ivGwlAXWQ8VuS4iEv
 7vqcZKZ2UA5Cytcmw0yL6LyTAb+0ECcKI3spDeGFtuAAU9O5+oGWfNIx1elVORNxRqHwcdz8OT
 7C4LVc2bTfufb/c9auwfH8t3Bvn8AsZjEBHsAAAA=
X-Change-ID: 20260605-spu-fixrga3quantization-061c761a1d80
To: Jacob Chen <jacob-chen@iotwrt.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@pengutronix.de, Philipp Zabel <p.zabel@pengutronix.de>, 
 Michael Tretter <m.tretter@pengutronix.de>, 
 =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
X-Mailer: b4 0.15.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.pueschel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_063222_346269_DAA1291F 
X-CRM114-Status: GOOD (  16.49  )
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

Don't change the quantization of an RGB format when converting between
RGB and YUV with the RGA3. As the RGA3 only supports doing conversions
to full range YUV with BT601, it wants to announce it through
try_fmt/s_fmt.

As it is only relevant, when converting between RGB and YUV, it's
guarded by a given condition. But the condition also causes the
RGB format quantization to be adjusted to limited range, which
is incorrect.

Therefore simplify the condition to only apply when the current format
is a YUV format. Also document the reason for checking if the other
format is an RGB format.

Fixes: 24a63d4c9d3c ("media: rockchip: rga: add rga3 support")
Signed-off-by: Sven Püschel <s.pueschel@pengutronix.de>
---
This patch is a fix to the upcoming RGA3 support. By mistake it'll also
adjust the RGB quantization instead of only adjusting the quantization
of the YUV formats. Therefore remove the incorrect conditions and
document why we also check the format of the other side.

I've just noticed this flawed condition and didn't check/reproduce it in
a practical scenario.

    v4l2-compliance 1.32.0, 64 bits, 64-bit time_t
    ....
    	Card type        : rga3
    ...
    Total for rockchip-rga device /dev/video0: 48, Succeeded: 48, Failed: 0, Warnings: 0

    v4l2-compliance 1.32.0, 64 bits, 64-bit time_t
    ...
    	Card type        : rga2
    ...
    Total for rockchip-rga device /dev/video1: 48, Succeeded: 48, Failed: 0, Warnings: 0
---
 drivers/media/platform/rockchip/rga/rga3-hw.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/rockchip/rga/rga3-hw.c b/drivers/media/platform/rockchip/rga/rga3-hw.c
index ca1c268303dd4..c4a71306278ba 100644
--- a/drivers/media/platform/rockchip/rga/rga3-hw.c
+++ b/drivers/media/platform/rockchip/rga/rga3-hw.c
@@ -450,10 +450,14 @@ static void *rga3_adjust_and_map_format(struct rga_ctx *ctx,
 	other_format = is_output ? &ctx->out.pix : &ctx->in.pix;
 	other_format_info = v4l2_format_info(other_format->pixelformat);
 
-	if ((v4l2_is_format_rgb(format_info) &&
-	     v4l2_is_format_yuv(other_format_info)) ||
-	    (v4l2_is_format_yuv(format_info) &&
-	     v4l2_is_format_rgb(other_format_info))) {
+	/*
+	 * Only apply the quantization restrictions when we need to
+	 * convert between RGB and YUV. Otherwise there is no point
+	 * to limit the quantization for operations like scaling or
+	 * rotations.
+	 */
+	if (v4l2_is_format_yuv(format_info) &&
+	    v4l2_is_format_rgb(other_format_info)) {
 		/*
 		 * The RGA3 only supports BT601, BT709 and BT2020 RGB<->YUV conversions
 		 * Additionally BT709 and BT2020 only support limited range YUV.

---
base-commit: 6a75e3d4f6428b90f398354212e3a2e0172851d6
change-id: 20260605-spu-fixrga3quantization-061c761a1d80

Best regards,
--  
Sven Püschel <s.pueschel@pengutronix.de>


