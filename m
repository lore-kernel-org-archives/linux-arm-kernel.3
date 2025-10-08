Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27680CCD188
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Oct 2025 17:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zJ4sEHuJtpnGcdmoXRxAGwhrsrERPCJBZd/MfOXQ8bw=; b=vj/dVwvTW2aPoH9qnIfgHQ26s9
	xEboQTZuo3/nUMcJxHdQLLItWrnpqskBsSvC/etm56njW5EdbOVjOQsNEEJW3Xaxd9Pf16cE2eMMw
	+FABtSOHZ+5l0tOXmfWyPgo8qa8oJ2ARRIgcem3xVPQ+PD+piaTCh4J78pDjcHdkXjsjsGnGCpU/y
	2yTreO3HvmdvCcTK8TWTcVFNB8yyNI7h/MRTxTafy3rLYIvEpP7tWoul/ZB2E4pbAKC4VEG9SYv0N
	ef6FAW/T3ZYEJxgizcINdhw1HYkQfVoh5CJIhbgbApFnOmtigrF7AujwdnBWsnzsvSNPSlXmXsM7s
	EFJYnhCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6YKD-00000004PiA-199D;
	Wed, 08 Oct 2025 17:51:41 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6YKA-00000004Pcs-3Ena
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Oct 2025 17:51:40 +0000
Received: from pendragon.ideasonboard.com (82-203-166-19.bb.dnainternet.fi [82.203.166.19])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 2D3D51E3A;
	Wed,  8 Oct 2025 19:50:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1759945803;
	bh=XkimHfS9iI8iciAt6GWBkHgYuw7rZ850GjnUqpnVzB4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sEXPQ+UxiVRWU9OAhzXSMUBAuujOUuRNOj5TaP89pKSBCukP3rV+kW7IqFjkjzdOs
	 yUrG+Eeykb49IPESPQePkprP3aYrFYz1gayzOFSH799QgDKHVBQptzOmOsnYtIjged
	 4y6h9qG9xhJaJ7l0wXom2kW5CIjWRa9SNSp/DVpk=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Jiasheng Jiang <jiashengjiangcool@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>
Subject: [PATCH 22/25] media: stm32: dma2d: Drop unneeded v4l2_m2m_get_vq() NULL check
Date: Wed,  8 Oct 2025 20:50:49 +0300
Message-ID: <20251008175052.19925-23-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20251008175052.19925-1-laurent.pinchart@ideasonboard.com>
References: <20251008175052.19925-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_105138_981076_31AC93EC 
X-CRM114-Status: GOOD (  10.83  )
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
 drivers/media/platform/st/stm32/dma2d/dma2d.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/media/platform/st/stm32/dma2d/dma2d.c b/drivers/media/platform/st/stm32/dma2d/dma2d.c
index 48fa781aab06..643913adc1f3 100644
--- a/drivers/media/platform/st/stm32/dma2d/dma2d.c
+++ b/drivers/media/platform/st/stm32/dma2d/dma2d.c
@@ -353,13 +353,8 @@ static int vidioc_enum_fmt(struct file *file, void *prv, struct v4l2_fmtdesc *f)
 static int vidioc_g_fmt(struct file *file, void *prv, struct v4l2_format *f)
 {
 	struct dma2d_ctx *ctx = prv;
-	struct vb2_queue *vq;
 	struct dma2d_frame *frm;
 
-	vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type);
-	if (!vq)
-		return -EINVAL;
-
 	frm = get_frame(ctx, f->type);
 	f->fmt.pix.width		= frm->width;
 	f->fmt.pix.height		= frm->height;
-- 
Regards,

Laurent Pinchart


