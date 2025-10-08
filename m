Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A7DBCAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Oct 2025 17:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D6/h8/byKWvfB/BnIAYV2rkAWJS0BiAa58RlqLfIM4Q=; b=yl3kMiTdHljxU9w2w8RJCY/KlG
	sUqrYOB2u/cxQcWq6TrHbJOKK09j8TVS+jXnMIN9G6msD9sTsV3dTON5ayc0s3mqgtymfHf4GUUx3
	sk/WyZ306uAzGoLecQSLvf1n04A9iBmGvc/9t7uDv2iSpptR885XCTS0AEzQcvgLNA8hbfjAfhF0h
	tL4rQtTBUHvH73muRCTZra0aTyaAf32rs8Vq7/PVHUJON5sQHVNWIj3slLAn+GbW1G4x5AXOUMlTu
	IX1e7/uQH3X1kCrSTQ5z5cO3G0DRt/iquq14EmwhTXbTwg1dxwlWPmL6Cp4LZGyH/wF/X1Chg3zrP
	KfVEWZzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6YK9-00000004Pbz-0Fur;
	Wed, 08 Oct 2025 17:51:37 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6YK5-00000004PXa-2KGE;
	Wed, 08 Oct 2025 17:51:35 +0000
Received: from pendragon.ideasonboard.com (82-203-166-19.bb.dnainternet.fi [82.203.166.19])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id CB9DF1E45;
	Wed,  8 Oct 2025 19:49:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1759945798;
	bh=tQsikKNPuxlTDZUFn8qypyiY9ILHvGdiLuivDEV8nc0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=haI7BWakdjxisAizqTmJ6ZgCVUB7y0Xf3adWLpzOlwjkcK5sny4kE84eJzySIsn3d
	 zmHOWRRBsOtsaGfjlqkLjc4WCQs3eSlPkAnw+4SbhO4epjjGvkOhqGyqo3u+95X8jR
	 BKk+l7yiHvttw59I5IplQshWeHE63iJBfg9aet+Q=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Jacob Chen <jacob-chen@iotwrt.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH 19/25] media: platform: rga: Drop unneeded v4l2_m2m_get_vq() NULL check
Date: Wed,  8 Oct 2025 20:50:46 +0300
Message-ID: <20251008175052.19925-20-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20251008175052.19925-1-laurent.pinchart@ideasonboard.com>
References: <20251008175052.19925-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_105133_738435_2D8D23DF 
X-CRM114-Status: GOOD (  11.58  )
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
 drivers/media/platform/rockchip/rga/rga.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/platform/rockchip/rga/rga.c
index 3dccab5fa4a1..48b88da59da0 100644
--- a/drivers/media/platform/rockchip/rga/rga.c
+++ b/drivers/media/platform/rockchip/rga/rga.c
@@ -465,12 +465,8 @@ static int vidioc_g_fmt(struct file *file, void *prv, struct v4l2_format *f)
 {
 	struct v4l2_pix_format_mplane *pix_fmt = &f->fmt.pix_mp;
 	struct rga_ctx *ctx = prv;
-	struct vb2_queue *vq;
 	struct rga_frame *frm;
 
-	vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type);
-	if (!vq)
-		return -EINVAL;
 	frm = rga_get_frame(ctx, f->type);
 	if (IS_ERR(frm))
 		return PTR_ERR(frm);
-- 
Regards,

Laurent Pinchart


