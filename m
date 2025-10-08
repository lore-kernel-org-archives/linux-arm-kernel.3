Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6AAECCA470
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Oct 2025 17:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zHHYGlmhgtzvIQX7LZw1qGsL0XAmpdR4NmtH2uy7hb4=; b=WVB56ykmJqiJysncs/Snff8HyA
	gBDWuoWdKmTRBkfDXpGSPwlRJ6v5vLfmwYV03BG16FSfSkFiTrJ8rj/qI0iNS+a5QcJ7k2ZyBmuzS
	l8XTI9gagNlme9d5NFrz0TTQ0XASEm7rfx/sbsvlx3gZCyN/HwAuVjIjZvao/KYYOb8DtbcrG2LKV
	JyuS3HrJQthOQHn6IpLcZMO9Cz/J7KoshdWg+f85s1fU2qCfyKCCCKi+R+A8wWcMwneVgpd+oJ+3j
	sKks+QEePW6J6Hs3AFKiFMfZYbYRK296PIuJbDx4L//fdJqI7M1TaOduqvt7oOYa6wgmH+F4pXfir
	yJH1gGXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6YJj-00000004PEX-31kH;
	Wed, 08 Oct 2025 17:51:11 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6YJf-00000004P9p-2Gmu;
	Wed, 08 Oct 2025 17:51:09 +0000
Received: from pendragon.ideasonboard.com (82-203-166-19.bb.dnainternet.fi [82.203.166.19])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id F23D11E3A;
	Wed,  8 Oct 2025 19:49:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1759945771;
	bh=/c/M6dN55o/aLTOruXQriqJCzqFxJD0UbyfBCqPUydg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FhhRXZ4iSSZUBAXI6Df1p8KLG2iszNH46eVF9br9q7J+FOIgFyiwxvcHvJwrevHMp
	 Np+g/lvBeRq2w0jQ/N9yOoXwiaabPJTnGi4EeNgGjcwO0qz27corpYVRA/x1Qumx0k
	 t2XxP19L/rFLxMSoiMUZgkB4ZOFA4BtSmFaeZopA=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH 03/25] media: meson-g2d: Drop unneeded v4l2_m2m_get_vq() NULL check
Date: Wed,  8 Oct 2025 20:50:30 +0300
Message-ID: <20251008175052.19925-4-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20251008175052.19925-1-laurent.pinchart@ideasonboard.com>
References: <20251008175052.19925-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_105107_730607_96310EE1 
X-CRM114-Status: GOOD (  10.20  )
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

The v4l2_m2m_get_vq() function never returns NULL. The check was
probably intended to catch invalid format types, but that's not needed
as the V4L2 core picks the appropriate VIDIOC_G_FMT ioctl handler based
on the format type, so the type can't be incorrect. Drop the unneeded
return value check and, as the return value is not used for other
purposes and the function has no side effect, the function call as well.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/amlogic/meson-ge2d/ge2d.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/media/platform/amlogic/meson-ge2d/ge2d.c b/drivers/media/platform/amlogic/meson-ge2d/ge2d.c
index 0c004bb8ba05..a9323b383547 100644
--- a/drivers/media/platform/amlogic/meson-ge2d/ge2d.c
+++ b/drivers/media/platform/amlogic/meson-ge2d/ge2d.c
@@ -627,13 +627,8 @@ static int vidioc_s_fmt_cap(struct file *file, void *priv, struct v4l2_format *f
 static int vidioc_g_fmt(struct file *file, void *priv, struct v4l2_format *f)
 {
 	struct ge2d_ctx *ctx = priv;
-	struct vb2_queue *vq;
 	struct ge2d_frame *frm;
 
-	vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type);
-	if (!vq)
-		return -EINVAL;
-
 	frm = get_frame(ctx, f->type);
 
 	f->fmt.pix = frm->pix_fmt;
-- 
Regards,

Laurent Pinchart


