Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88AC0C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 Aug 2025 21:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sryvobwow46E50dCMqdfx84wExvLnx3ndZUCx8XjTI0=; b=QAiyEwR0ZtqlCeh/VSOMROBhcX
	QgW8dLSAawTr+KAoMsCDGnJMRwT9VfF8dRyto8aIh8rtgcsd90afBG64Wg7LINqJEik8ArLrXvtzd
	GoHh7iM7DONylmTT65UtUUb/PeniPmlGmhPeHoWUfWzxBonFfWqB1jRkDgKVqEK+gEC16mTD0lfDu
	NrDCYov5rIp53YJJLsbMtAcAfn6cefavNQydbZLfqmqlPsroYy32B/h8m7ZoV8ZeJiamsKXVeoiia
	sOTHx2f928I9kQtj/lxM9WtDM4jEF31/uRMDK9mlPGFw4Cp6e04v7ghQfb3/iOkLpUppPCAjD5bLo
	Pu5/PYYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukr3x-00000004wtM-1fwk;
	Sat, 09 Aug 2025 21:25:13 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukqxC-00000004vmp-092w;
	Sat, 09 Aug 2025 21:18:15 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 224A1502;
	Sat,  9 Aug 2025 23:17:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754774242;
	bh=SCnMn609VAUM2KKbbQUq8jpo/bDnKWvrBzI4LeCjjl4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TLh6kOS3eulgwUUuo7+SnXvHDqTnp0MOCXrrBPUGrMOsYjv1GkIoVL9Ix+q8UUX33
	 DA7dXD88lQhbp3JUhtRERqD5ob02R8yY75MUq9zr9D9aJt2b2yEUreI99NxPqU4mo6
	 XuEzCbOqQANcEzeH9XEh20GlhAM1ehykuAoHyqOg=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hans@jjverkuil.nl>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 37/76] media: meson-ge2d: Access v4l2_fh from file
Date: Sun, 10 Aug 2025 00:16:14 +0300
Message-ID: <20250809211654.28887-38-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250809211654.28887-1-laurent.pinchart@ideasonboard.com>
References: <20250809211654.28887-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250809_141814_211356_1F0AFC6C 
X-CRM114-Status: UNSURE (   9.21  )
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
 drivers/media/platform/amlogic/meson-ge2d/ge2d.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/amlogic/meson-ge2d/ge2d.c b/drivers/media/platform/amlogic/meson-ge2d/ge2d.c
index b1b0b6535fb1..5744853a4003 100644
--- a/drivers/media/platform/amlogic/meson-ge2d/ge2d.c
+++ b/drivers/media/platform/amlogic/meson-ge2d/ge2d.c
@@ -457,7 +457,7 @@ static int vidioc_enum_fmt(struct file *file, void *priv, struct v4l2_fmtdesc *f
 static int vidioc_g_selection(struct file *file, void *priv,
 			      struct v4l2_selection *s)
 {
-	struct ge2d_ctx *ctx = priv;
+	struct ge2d_ctx *ctx = file_to_ge2d_ctx(file);
 	struct ge2d_frame *f;
 	bool use_frame = false;
 
@@ -507,7 +507,7 @@ static int vidioc_g_selection(struct file *file, void *priv,
 static int vidioc_s_selection(struct file *file, void *priv,
 			      struct v4l2_selection *s)
 {
-	struct ge2d_ctx *ctx = priv;
+	struct ge2d_ctx *ctx = file_to_ge2d_ctx(file);
 	struct meson_ge2d *ge2d = ctx->ge2d;
 	struct ge2d_frame *f;
 	int ret = 0;
@@ -574,8 +574,8 @@ static void vidioc_setup_cap_fmt(struct ge2d_ctx *ctx, struct v4l2_pix_format *f
 
 static int vidioc_try_fmt_cap(struct file *file, void *priv, struct v4l2_format *f)
 {
+	struct ge2d_ctx *ctx = file_to_ge2d_ctx(file);
 	const struct ge2d_fmt *fmt = find_fmt(f);
-	struct ge2d_ctx *ctx = priv;
 	struct v4l2_pix_format fmt_cap;
 
 	vidioc_setup_cap_fmt(ctx, &fmt_cap);
@@ -595,7 +595,7 @@ static int vidioc_try_fmt_cap(struct file *file, void *priv, struct v4l2_format
 
 static int vidioc_s_fmt_cap(struct file *file, void *priv, struct v4l2_format *f)
 {
-	struct ge2d_ctx *ctx = priv;
+	struct ge2d_ctx *ctx = file_to_ge2d_ctx(file);
 	struct meson_ge2d *ge2d = ctx->ge2d;
 	struct vb2_queue *vq;
 	struct ge2d_frame *frm;
@@ -631,7 +631,7 @@ static int vidioc_s_fmt_cap(struct file *file, void *priv, struct v4l2_format *f
 
 static int vidioc_g_fmt(struct file *file, void *priv, struct v4l2_format *f)
 {
-	struct ge2d_ctx *ctx = priv;
+	struct ge2d_ctx *ctx = file_to_ge2d_ctx(file);
 	struct vb2_queue *vq;
 	struct ge2d_frame *frm;
 
@@ -670,7 +670,7 @@ static int vidioc_try_fmt_out(struct file *file, void *priv, struct v4l2_format
 
 static int vidioc_s_fmt_out(struct file *file, void *priv, struct v4l2_format *f)
 {
-	struct ge2d_ctx *ctx = priv;
+	struct ge2d_ctx *ctx = file_to_ge2d_ctx(file);
 	struct meson_ge2d *ge2d = ctx->ge2d;
 	struct vb2_queue *vq;
 	struct ge2d_frame *frm, *frm_cap;
-- 
Regards,

Laurent Pinchart


