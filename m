Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FE47CAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Oct 2025 17:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yvbB0g+7lDBWLxdMmxJfFPNd2xan8Xer+55J3IWyYgI=; b=QwXJClZ0Nrlqi+s/XJoZQj2u1v
	4bNPHr5PtKkW0eGFda0xGcUg4a/aUidW3yd8jO66kJTlJOibnqpWD1gH+QasqyBU0qDyrBMjie4XU
	MN+z9jYS8d6geFf1wZ4brvtMfWnYrmXTmu1lITPly0/TiCfklK+4vG7Jlsp4eQnQoMCLlDkszP191
	VHqb8JzT5XUK1c4tZvQUIb4cn2BY2JuiZl6frRvoTi4zeVOn+f4E+ojBTIJwiHpCU58UhcV7Kx8ni
	TSroHxTa7JKAsXiRLqWgu0U9zpVZpPVN8tWVBiI5haL3kz7OO8dKRU1ZQUtjGqDvpHmivSTYye+/X
	U/9gw1XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6YKB-00000004PgF-3ikZ;
	Wed, 08 Oct 2025 17:51:39 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6YK8-00000004Par-3bKD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Oct 2025 17:51:38 +0000
Received: from pendragon.ideasonboard.com (82-203-166-19.bb.dnainternet.fi [82.203.166.19])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 4306519C4;
	Wed,  8 Oct 2025 19:50:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1759945801;
	bh=gx+Glh8duh7DqoFhEgViN0JYENyz0PE6i6OYcitpfHw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=wgyKBxv5sTp1/Vu7/X3Wo8XH0VB7T36rPnqqckpAKNDWqDsY58FyO6ErdO371YTvx
	 X313J5KYSvLm12kCFKngBiWdwK/V/+qla41a10Tx9hZwzJkAoRVTp5euKveF+Ooc2R
	 akD9KHSLXFbA5xshEURIZuh2U22gjYLC51mH1G0g=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH 21/25] media: samsung: s5p-jpeg: Drop unneeded v4l2_m2m_get_vq() NULL check
Date: Wed,  8 Oct 2025 20:50:48 +0300
Message-ID: <20251008175052.19925-22-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20251008175052.19925-1-laurent.pinchart@ideasonboard.com>
References: <20251008175052.19925-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_105137_065930_6481CA9D 
X-CRM114-Status: GOOD (  11.51  )
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
index ac4cf269456a..3211e9d0fda7 100644
--- a/drivers/media/platform/samsung/s5p-jpeg/jpeg-core.c
+++ b/drivers/media/platform/samsung/s5p-jpeg/jpeg-core.c
@@ -1333,15 +1333,10 @@ static struct s5p_jpeg_q_data *get_q_data(struct s5p_jpeg_ctx *ctx,
 
 static int s5p_jpeg_g_fmt(struct file *file, void *priv, struct v4l2_format *f)
 {
-	struct vb2_queue *vq;
 	struct s5p_jpeg_q_data *q_data = NULL;
 	struct v4l2_pix_format *pix = &f->fmt.pix;
 	struct s5p_jpeg_ctx *ct = fh_to_ctx(priv);
 
-	vq = v4l2_m2m_get_vq(ct->fh.m2m_ctx, f->type);
-	if (!vq)
-		return -EINVAL;
-
 	if (f->type == V4L2_BUF_TYPE_VIDEO_CAPTURE &&
 	    ct->mode == S5P_JPEG_DECODE && !ct->hdr_parsed)
 		return -EINVAL;
@@ -1594,8 +1589,6 @@ static int s5p_jpeg_s_fmt(struct s5p_jpeg_ctx *ct, struct v4l2_format *f)
 	unsigned int f_type;
 
 	vq = v4l2_m2m_get_vq(ct->fh.m2m_ctx, f->type);
-	if (!vq)
-		return -EINVAL;
 
 	q_data = get_q_data(ct, f->type);
 	BUG_ON(q_data == NULL);
-- 
Regards,

Laurent Pinchart


