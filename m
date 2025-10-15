Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2619DCCD190
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 07:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hNYCsh4ACCDXc4G8bRdplbcprbg3mmVtRScw7seYMhk=; b=v4hQQOSLXL3Y2NWmvSQJhIBe9L
	6mIrDa+U0U/3fLpYzqdUmyTlNmrYj/NzlpHnRQ+MS3yWVmSK57gKAEk9o8XyZdX5amMer2MgeMjOZ
	w8jKU8p5BfPr2tZNVVQU6rGvKivWmSpx8MRlRqqs9G7PqMAfmtSB9ZICetduj/W475jRimAXyAAlQ
	eLO1izf1+RA8e5c9jHGvEBvLYniiedn1ntwvTaShxfyNzU1geHaWefJSD1YURzK8mGX6SBT54sKe/
	QwBVrX2MNle7XJZYCqPNAxD0BeI/gDDQ5qSaSZG7cdU7/AN3seSFyFy3hvwPAFlZLD+oP7ASt5fOM
	8RODoBOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8wKq-00000000obh-0o2K;
	Wed, 15 Oct 2025 07:54:12 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8wKm-00000000oZN-3nMS;
	Wed, 15 Oct 2025 07:54:10 +0000
Received: from pendragon.ideasonboard.com (87-94-110-32.bb.dnainternet.fi [87.94.110.32])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 5ADAB190D;
	Wed, 15 Oct 2025 09:52:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1760514748;
	bh=Uxgf1oxP9kkN4+H9BmWzXKT3e8oWnSdrgQRWaAUajUs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IiRPjPZiLYusQGUslHhwVs6tUuPrcEjK1qqsG1VQeEFunGEJC5YWvwOu0YQFgOygg
	 k2cdkMolsljfitcQAuNJ+Yxsr4UKYgE1YGdenBeR0gcEl5r9nzKZQhttDLXEfsKhFD
	 DkNingh/dABrDaHjSlyo/zYM+ByoMqa9MKHlsjJg=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v2 03/25] media: meson-g2d: Drop unneeded v4l2_m2m_get_vq() NULL check
Date: Wed, 15 Oct 2025 10:53:26 +0300
Message-ID: <20251015075353.22625-4-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251015075353.22625-1-laurent.pinchart@ideasonboard.com>
References: <20251015075353.22625-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_005409_082917_A2F6D275 
X-CRM114-Status: GOOD (  10.04  )
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
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/media/platform/amlogic/meson-ge2d/ge2d.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/media/platform/amlogic/meson-ge2d/ge2d.c b/drivers/media/platform/amlogic/meson-ge2d/ge2d.c
index 5744853a4003..c51c6f4e41dc 100644
--- a/drivers/media/platform/amlogic/meson-ge2d/ge2d.c
+++ b/drivers/media/platform/amlogic/meson-ge2d/ge2d.c
@@ -632,13 +632,8 @@ static int vidioc_s_fmt_cap(struct file *file, void *priv, struct v4l2_format *f
 static int vidioc_g_fmt(struct file *file, void *priv, struct v4l2_format *f)
 {
 	struct ge2d_ctx *ctx = file_to_ge2d_ctx(file);
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


