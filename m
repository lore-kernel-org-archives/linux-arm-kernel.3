Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E682C87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 Aug 2025 21:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zSsZSHYSFzVetZIiHnEl+RA6spVjLYawS7kWFxf6MeM=; b=rfbqYDxsU9Y/Z9WMKuoV5qMDSG
	8m7LZYk01m6TBOuW0NRQMAKmGIyyer+X7YS1AhSbDQdtE/tZSYqQJgBq9EWBFnikl+mak2zubdj7V
	X5PhX53q3HOTHn9gtOLP1D7rIzrwx5KueWp2uC/QqV039rJkqQ7naajkg2mLy5DSQ0hIwLqy+JQJO
	u+I279RPIrjCUTD+B3o5VabEY7Y6VpjdJqNwTUZNwmwuvwrKvTusS7NorhdNyD83kP2CdjyNauNzH
	QzaYuUQ/t5lkFM9+cOZeuw/6OmkOF5xJUDXeb1DQvYQQQoIqcwc5WIh5Nema2y86d8el3ncOyV7hf
	6rOY45Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukrVI-00000004ybQ-16xT;
	Sat, 09 Aug 2025 21:53:28 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukqxg-00000004vud-0rtG
	for linux-arm-kernel@lists.infradead.org;
	Sat, 09 Aug 2025 21:18:45 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 41EBC111D;
	Sat,  9 Aug 2025 23:17:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754774272;
	bh=J2YqhlSkO4rBsv8gjA8t0o3f5oF8H+i91NwRu0XujMo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AL9NKgUVu2N1NhgX6iG/2bn58MuGTgQSXaz3Sl1jQjxivhYGApBdozjOmbnLNh4bh
	 CAcfKzcsAvG8IrxTAfJAyTafELud88LYClmIDCFy3aG1RIIAQ3KsZbVuc03GHilqgp
	 jMWzSgnalYHOTKnED50+EuqL3O4ua2Nnr7xrK/OY=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hans@jjverkuil.nl>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	=?UTF-8?q?=C5=81ukasz=20Stelmach?= <l.stelmach@samsung.com>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 55/76] media: s5p-g2d: Access v4l2_fh from file
Date: Sun, 10 Aug 2025 00:16:32 +0300
Message-ID: <20250809211654.28887-56-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250809211654.28887-1-laurent.pinchart@ideasonboard.com>
References: <20250809211654.28887-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250809_141844_384471_9096EC7B 
X-CRM114-Status: UNSURE (   9.89  )
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


