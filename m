Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35AEACCD193
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 07:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=86GBFqWZ9XQcT8JR/6UrK/RsEWpvQoVsTOl37wT3+RU=; b=fegWY2ZBkaDtkKBmPUrC/czGuM
	i5Hk1JavWN4Y8kfyK6fBoKNPwd02ncVF1AqAdxo2teStUti1YRKo579xyZ6p265Bx/LT8Dg7yOuRd
	vUlf/ct/jjPGELBb4/yYnEBGiNuGvTziw6nFUiOHsWHVP0hcjX5U44OQClUiCdiAytTgbVCGKUadx
	Dz9CeC7dzNyv89vjPz34akiG4KFqUsCRieC1Y4iukRFYR0tE0kCsrLkYrNZJie0FtvsnHbqlGWPu/
	rWjk1oFSrzAkNC3nfNF35NoWA9nby41bN3gPHBRn0f9wPG1DlfPGCY0/k0ML5GDLdilTexjDEW8S5
	Pcyxr9WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8wL4-00000000onC-0LJz;
	Wed, 15 Oct 2025 07:54:26 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8wL1-00000000ojQ-1hWJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 07:54:24 +0000
Received: from pendragon.ideasonboard.com (87-94-110-32.bb.dnainternet.fi [87.94.110.32])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 0A43C190D;
	Wed, 15 Oct 2025 09:52:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1760514763;
	bh=gIVjToJ4dGZYaDyjxYRQsimGYclfW6IBnWQW9t0yb8A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nzLLp2cKiShbVVIBhAaqqOAQnggH9sCWuM5VZd6mqv20ctqHgLbOWqvJDDnVA1H1O
	 Y0yAUg5pFc39zA7mX31Nrhlq/pjibSwtNy8V6sq0+iPsDCJxPOecDlCyXk8i8ZKzT7
	 MXP3LDdMwciRuZMGwFrC0f2daHJsbMghZqYkXoTs=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: imx@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2 11/25] media: imx-jpeg: Drop unneeded v4l2_m2m_get_vq() NULL check
Date: Wed, 15 Oct 2025 10:53:34 +0300
Message-ID: <20251015075353.22625-12-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251015075353.22625-1-laurent.pinchart@ideasonboard.com>
References: <20251015075353.22625-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_005423_894008_01132BF5 
X-CRM114-Status: UNSURE (   9.03  )
X-CRM114-Notice: Please train this message.
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

The v4l2_m2m_get_vq() function never returns NULL. The check may have
been intended to catch invalid format types, but that's not needed as
the V4L2 core picks the appropriate VIDIOC_S_FMT ioctl handler based on
the format type, so the type can't be incorrect. Drop the unneeded
return value check.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
index df3ccdf767ba..d41fa4c3139b 100644
--- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
+++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
@@ -2491,8 +2491,6 @@ static int mxc_jpeg_s_fmt(struct mxc_jpeg_ctx *ctx,
 	struct mxc_jpeg_dev *jpeg = ctx->mxc_jpeg;
 
 	vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type);
-	if (!vq)
-		return -EINVAL;
 
 	if (vb2_is_busy(vq)) {
 		v4l2_err(&jpeg->v4l2_dev, "queue busy\n");
@@ -2528,8 +2526,6 @@ static int mxc_jpeg_s_fmt_vid_out(struct file *file, void *priv,
 		return 0;
 
 	dst_vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, cap_type);
-	if (!dst_vq)
-		return -EINVAL;
 
 	if (vb2_is_busy(dst_vq))
 		return 0;
-- 
Regards,

Laurent Pinchart


