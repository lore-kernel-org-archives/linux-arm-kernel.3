Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50204C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 10 Aug 2025 02:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zSsZSHYSFzVetZIiHnEl+RA6spVjLYawS7kWFxf6MeM=; b=ZnmX9v7z7S8si1N9QxHCO6yy3K
	oRFX8OW9jERMVSP77c9T+jVoBtAhE1dpnfT1XWtpWOjRpyU9S8j0Idm26k+hal7qXqJ9D7XKgDEBT
	8IHebXS53LLxln+JForQexvOCJF+rLzfqmJ/UctQ9uElkB/vr0eFDo6pK3LHxnv1qKoj1Gob65QmQ
	lP3Oz2E0/eJTGmR2Op1EwHMXlIsWUdRnJZSQKe3KoTP2NijlQ1N6awy0OzL7G++RXEpR4NIyaWABR
	esi3bhetq93sQyUdq4nNVL3G9Ix1oXd/PbUYxjp2ddNp+zlRzYUWzLFjlbmbxV4SzRfNJOBr7Qw4B
	aPnVsUng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukvTM-00000005AcN-2vnb;
	Sun, 10 Aug 2025 02:07:44 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukuvd-000000057jG-1qBx
	for linux-arm-kernel@lists.infradead.org;
	Sun, 10 Aug 2025 01:32:54 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 5A2AC8CB;
	Sun, 10 Aug 2025 03:32:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754789521;
	bh=J2YqhlSkO4rBsv8gjA8t0o3f5oF8H+i91NwRu0XujMo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=u3DMTGKv8ZDvAbZW8KSATAtpd635VqOq1FA82O8ekimzra3yNnnqvZmhubzhDBWEW
	 jYYFq12zMRQgdvIfQM+NLOthZTZdW6htZuR/SfN2pkPOlRv1WhemgezXxTzV9mJ6A3
	 NDeE+w3RQkaxAKdjB6+qKOI99t/j7hinlHJJubnM=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Hans Verkuil <hans@jjverkuil.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	=?UTF-8?q?=C5=81ukasz=20Stelmach?= <l.stelmach@samsung.com>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 55/76] media: s5p-g2d: Access v4l2_fh from file
Date: Sun, 10 Aug 2025 04:30:37 +0300
Message-ID: <20250810013100.29776-56-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250810013100.29776-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20250810013100.29776-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250809_183253_606014_74F7AB64 
X-CRM114-Status: GOOD (  10.38  )
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

From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

The v4l2_fh associated with an open file handle is now guaranteed
to be available in file->private_data, initialised by v4l2_fh_add().

Access the v4l2_fh, and from there the driver-specific structure,
from the file * in all ioctl handlers.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/platform/samsung/s5p-g2d/g2d.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/samsung/s5p-g2d/g2d.c b/drivers/media/platform/samsung/s5p-g2d/g2d.c
index 922262f61e7b..55f5130156b7 100644
--- a/drivers/media/platform/samsung/s5p-g2d/g2d.c
+++ b/drivers/media/platform/samsung/s5p-g2d/g2d.c
@@ -307,7 +307,7 @@ static int vidioc_enum_fmt(struct file *file, void *prv, struct v4l2_fmtdesc *f)
 
 static int vidioc_g_fmt(struct file *file, void *prv, struct v4l2_format *f)
 {
-	struct g2d_ctx *ctx = prv;
+	struct g2d_ctx *ctx = file2ctx(file);
 	struct vb2_queue *vq;
 	struct g2d_frame *frm;
 
@@ -359,7 +359,7 @@ static int vidioc_try_fmt(struct file *file, void *prv, struct v4l2_format *f)
 
 static int vidioc_s_fmt(struct file *file, void *prv, struct v4l2_format *f)
 {
-	struct g2d_ctx *ctx = prv;
+	struct g2d_ctx *ctx = file2ctx(file);
 	struct g2d_dev *dev = ctx->dev;
 	struct vb2_queue *vq;
 	struct g2d_frame *frm;
@@ -400,7 +400,7 @@ static int vidioc_s_fmt(struct file *file, void *prv, struct v4l2_format *f)
 static int vidioc_g_selection(struct file *file, void *prv,
 			      struct v4l2_selection *s)
 {
-	struct g2d_ctx *ctx = prv;
+	struct g2d_ctx *ctx = file2ctx(file);
 	struct g2d_frame *f;
 
 	f = get_frame(ctx, s->type);
@@ -450,7 +450,7 @@ static int vidioc_g_selection(struct file *file, void *prv,
 static int vidioc_try_selection(struct file *file, void *prv,
 				const struct v4l2_selection *s)
 {
-	struct g2d_ctx *ctx = prv;
+	struct g2d_ctx *ctx = file2ctx(file);
 	struct g2d_dev *dev = ctx->dev;
 	struct g2d_frame *f;
 
@@ -478,7 +478,7 @@ static int vidioc_try_selection(struct file *file, void *prv,
 static int vidioc_s_selection(struct file *file, void *prv,
 			      struct v4l2_selection *s)
 {
-	struct g2d_ctx *ctx = prv;
+	struct g2d_ctx *ctx = file2ctx(file);
 	struct g2d_frame *f;
 	int ret;
 
-- 
Regards,

Laurent Pinchart


