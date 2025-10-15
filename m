Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50780CCD185
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 07:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MdMyB9DPJA/wh/rwpNBBmD5kGHvuDHgF3DDoQu/lrvI=; b=UyXidpM+COwU7cqO6/GDlHW52z
	9J0bqutKc9aFs4y+WWEBdp3FkNtGIh0e660us3p+8GE54Vx7y1+RDzOvFk520ZLRVpDmVZGLTT3rP
	H1qOFHDlfAWgqcCCG9ZQ6HzIVvV6uY+6TO/ia3Y33EHN+YNRVVf+A62T41N+sed+ozIoMRB6UBZ8Y
	m7DyFbEX9AXHxN1utX/4F4o7GdV/GkScW9N7Qs2BY80SpEMrKSQpNeJ4ziOhD0JvhOYi9A47tErou
	0cxZxl5ZN7IgbGgvvPxPzfPXFukbYM4jOXr35sRErHmVFwB5xlc6vWVmGOIlVaye9lU/LU5PcRBxy
	TBf8aEBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8wLN-00000000pAB-3s8Y;
	Wed, 15 Oct 2025 07:54:45 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8wLJ-00000000p3Q-2sIp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 07:54:43 +0000
Received: from pendragon.ideasonboard.com (87-94-110-32.bb.dnainternet.fi [87.94.110.32])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 3DCF2EB7;
	Wed, 15 Oct 2025 09:53:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1760514781;
	bh=5ExTISueDck3eSzbG+2J0OnMYAZSzfIqlIz/5v8IkXk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OSJzCGp/OGDmtCa1RdEbaSDUWuAdiS36cuonfnmCOD6KPf5as7LYT/+Zu5muusOfh
	 /+SHP0zzzDg5pdxg56e++E3QZhzrpkw8ockv8M+Slt8rAM7c1Hrctt44+8AZRYurLJ
	 vhtqMldNt0QqSGLROw0te5v5fAvjWih0T9ZTGJz4=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-media@vger.kernel.org
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH v2 21/25] media: samsung: s5p-jpeg: Drop unneeded v4l2_m2m_get_vq() NULL check
Date: Wed, 15 Oct 2025 10:53:44 +0300
Message-ID: <20251015075353.22625-22-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251015075353.22625-1-laurent.pinchart@ideasonboard.com>
References: <20251015075353.22625-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_005441_884141_248ED249 
X-CRM114-Status: GOOD (  11.29  )
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

The v4l2_m2m_get_vq() function never returns NULL.

In the set format handler, the check may have been intended to catch
invalid format types, but that's not needed as the V4L2 core picks the
appropriate VIDIOC_S_FMT ioctl handler based on the format type, so the
type can't be incorrect.

In the get format handler, the return value is not used for any purpose
other than the NULL check, which was therefore probably intended to
catch invalid format types. That's not needed for the same reason as in
the set format handler.

Drop the unneeded return value check and, as the function has no side
effect, the unneeded function call as well.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/samsung/s5p-jpeg/jpeg-core.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/media/platform/samsung/s5p-jpeg/jpeg-core.c b/drivers/media/platform/samsung/s5p-jpeg/jpeg-core.c
index 81792f7f8b16..ff28482759ec 100644
--- a/drivers/media/platform/samsung/s5p-jpeg/jpeg-core.c
+++ b/drivers/media/platform/samsung/s5p-jpeg/jpeg-core.c
@@ -1332,15 +1332,10 @@ static struct s5p_jpeg_q_data *get_q_data(struct s5p_jpeg_ctx *ctx,
 
 static int s5p_jpeg_g_fmt(struct file *file, void *priv, struct v4l2_format *f)
 {
-	struct vb2_queue *vq;
 	struct s5p_jpeg_q_data *q_data = NULL;
 	struct v4l2_pix_format *pix = &f->fmt.pix;
 	struct s5p_jpeg_ctx *ct = file_to_ctx(file);
 
-	vq = v4l2_m2m_get_vq(ct->fh.m2m_ctx, f->type);
-	if (!vq)
-		return -EINVAL;
-
 	if (f->type == V4L2_BUF_TYPE_VIDEO_CAPTURE &&
 	    ct->mode == S5P_JPEG_DECODE && !ct->hdr_parsed)
 		return -EINVAL;
@@ -1593,8 +1588,6 @@ static int s5p_jpeg_s_fmt(struct s5p_jpeg_ctx *ct, struct v4l2_format *f)
 	unsigned int f_type;
 
 	vq = v4l2_m2m_get_vq(ct->fh.m2m_ctx, f->type);
-	if (!vq)
-		return -EINVAL;
 
 	q_data = get_q_data(ct, f->type);
 	BUG_ON(q_data == NULL);
-- 
Regards,

Laurent Pinchart


