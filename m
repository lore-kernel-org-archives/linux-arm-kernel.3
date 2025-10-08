Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77CBECCA470
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Oct 2025 17:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CowRjBqAqORyPFxagYmB3KXN/CbfdVd3mNjFKCOB80U=; b=PRQaeQ3A4JXZ9Wmw8o/hNGZp+d
	MGI0LEC4CqaNWQVmbcMFMxbm7si/r7JXOgBpChbfA+f6SHHk7wmN0e7mST+M508z8nKp9ojz7F6VK
	JM0NYJ/FWOEOlyh19407h+mbHBN34iu/nj7gJtwwFSe1kkAbBSbxMF0oV5kknDBtvvLamKPnxTqZ3
	xT6Vt775Bk+qtIGgwL8ArUBH3+ofLp+wRtAW4UUDp7SlqderIRwIwO9DieYD68EzTn+SXnQ2CeWYl
	G68DI1Jv6g8d3a9Ojpl6q9Hv8AL5/fLWYmFOawngxBQbCZk9/R+RbXdy9n7jHh+dRuxrIE7jKau38
	sVIETTDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6YKB-00000004PfT-1vzA;
	Wed, 08 Oct 2025 17:51:39 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6YK7-00000004PZ8-0aXq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Oct 2025 17:51:37 +0000
Received: from pendragon.ideasonboard.com (82-203-166-19.bb.dnainternet.fi [82.203.166.19])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 89CD7EFE;
	Wed,  8 Oct 2025 19:49:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1759945799;
	bh=U4XDPHzwHTtHzCJ0SP7WwNFhqbaBOg8OWXtYtCgxlT0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nPAXdfk+mpXi4d1x5VdX26bbBmorRErU+wvmXfIwqNO9KnoFPiNYuRgJWrxCcw2ra
	 73nX9vDe7OF/M9QkTK2VKYBeSh8cScxLsqYFx89NEzFUVYcudQomKsyBUKWWiU5BYT
	 agfO0eMmjGqYjVZhXmgCfKUkypnpZr7Iwa5nOuVU=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	=?UTF-8?q?=C5=81ukasz=20Stelmach?= <l.stelmach@samsung.com>
Subject: [PATCH 20/25] media: samsung: s5p-g2d: Drop unneeded v4l2_m2m_get_vq() NULL check
Date: Wed,  8 Oct 2025 20:50:47 +0300
Message-ID: <20251008175052.19925-21-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20251008175052.19925-1-laurent.pinchart@ideasonboard.com>
References: <20251008175052.19925-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_105135_337264_544CB629 
X-CRM114-Status: GOOD (  11.46  )
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
 drivers/media/platform/samsung/s5p-g2d/g2d.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/media/platform/samsung/s5p-g2d/g2d.c b/drivers/media/platform/samsung/s5p-g2d/g2d.c
index ffed16a34493..7b0481c7f953 100644
--- a/drivers/media/platform/samsung/s5p-g2d/g2d.c
+++ b/drivers/media/platform/samsung/s5p-g2d/g2d.c
@@ -306,12 +306,8 @@ static int vidioc_enum_fmt(struct file *file, void *prv, struct v4l2_fmtdesc *f)
 static int vidioc_g_fmt(struct file *file, void *prv, struct v4l2_format *f)
 {
 	struct g2d_ctx *ctx = prv;
-	struct vb2_queue *vq;
 	struct g2d_frame *frm;
 
-	vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type);
-	if (!vq)
-		return -EINVAL;
 	frm = get_frame(ctx, f->type);
 	if (IS_ERR(frm))
 		return PTR_ERR(frm);
-- 
Regards,

Laurent Pinchart


