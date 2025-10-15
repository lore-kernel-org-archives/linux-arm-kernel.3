Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3315FCCD185
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 07:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HwcQLm0WgGh0gtSw8tMU5pScJIRXeeZyiXsWYCjApS0=; b=zj3dg1BvPDlgZAQnf7wgSj4GWv
	nOp7AWSjVlljO8XkHkYTxCUyLlQMTBQfVBtLwZC74bNjMdXrRxZt1qOflQ0Kr7HA6FjzuioALfuRZ
	big63rDtp+FvWaNmCfEgxZ2Oj12sfYWsGyMXk5l+UL4ldyh8gH49u6TSNa0PI+kxpkAbJqqS3DiwJ
	aJ6/7SF/B41EujmnUncfRewaKJEYHvYQZYm6KRACKJwAKAIJMEBvUcbd5NhH5gyJG4WyKOn314ujR
	/01SzMfrzTsPjInTr3UuUI7rzpt8owIUufGuaCkshnqC/u3cghyQaFYMNFi6FLcQnvOU9x+v5qF4X
	iFy81K9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8wLL-00000000p6t-1kl8;
	Wed, 15 Oct 2025 07:54:43 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8wLH-00000000p1R-3y6Y
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 07:54:41 +0000
Received: from pendragon.ideasonboard.com (87-94-110-32.bb.dnainternet.fi [87.94.110.32])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 94234162B;
	Wed, 15 Oct 2025 09:52:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1760514779;
	bh=vHIS+X/E2gwQu1VSEmM8K+NCq8ZotuMJmBLuRCNeq9U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KittMIf9UtTziwhMevIH54STwV1PDNH/F8ZfujYTXKFzMHj7Vm58zhVrn3iP/a2nf
	 H1FCXtu605Czbo7sVOs6s1a1rvrOiGsoSxB3XGrVd9vBmjelIFGGl4QyDGE5+2jvH1
	 rhRMXQrNTt70dFsRkzu8bPzWRBQUxhuCG/Bqkn7o=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-media@vger.kernel.org
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	=?UTF-8?q?=C5=81ukasz=20Stelmach?= <l.stelmach@samsung.com>
Subject: [PATCH v2 20/25] media: samsung: s5p-g2d: Drop unneeded v4l2_m2m_get_vq() NULL check
Date: Wed, 15 Oct 2025 10:53:43 +0300
Message-ID: <20251015075353.22625-21-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251015075353.22625-1-laurent.pinchart@ideasonboard.com>
References: <20251015075353.22625-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_005440_123624_E303E2C1 
X-CRM114-Status: GOOD (  11.45  )
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
Reviewed-by: Łukasz Stelmach <l.stelmach@samsung.com>
---
 drivers/media/platform/samsung/s5p-g2d/g2d.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/media/platform/samsung/s5p-g2d/g2d.c b/drivers/media/platform/samsung/s5p-g2d/g2d.c
index ffb9bee6cb9d..e765dfcc2830 100644
--- a/drivers/media/platform/samsung/s5p-g2d/g2d.c
+++ b/drivers/media/platform/samsung/s5p-g2d/g2d.c
@@ -308,12 +308,8 @@ static int vidioc_enum_fmt(struct file *file, void *priv, struct v4l2_fmtdesc *f
 static int vidioc_g_fmt(struct file *file, void *priv, struct v4l2_format *f)
 {
 	struct g2d_ctx *ctx = file2ctx(file);
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


