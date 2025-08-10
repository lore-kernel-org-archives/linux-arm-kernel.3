Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83352C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 10 Aug 2025 01:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mUnk7XAE9DNxLZqUvi6saWJN3ahQyBUjPxHjGAyKBvg=; b=eIu6NJYOUFXTmveAsOiqP3J4yk
	5ZWnajYoaXzcYiMUHTcSSG5/vL4GgeTSpcyOfKQ8ukvAkcoMuFIdyJUuI//cMf7UkHscZNaZrV1Fj
	gv9EwShzLIq1T16PjLz0i9X0sL7wC0BSk5N0/GbI5+MbTLXLAzDhUjjzFRqkGjYeLdMeyTjNLr0Wx
	Kdp/AZbk96j8tUscvGjv8R0rOpRomjPsAUUonxDFxVC8+1FXlHbSTbVFb+u5K5uf2Z58/6k+5DLP+
	y0KJCJFZAHX4g0uAxSYO9uktKn7jC9r2bdjf3PbK9Owj1SgSZO1w4L4qWvP/DDTyj4G/Uuq012xi/
	XTHZ6bmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukv9Q-000000059BD-1RwV;
	Sun, 10 Aug 2025 01:47:08 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukuvK-000000057br-0KoW;
	Sun, 10 Aug 2025 01:32:35 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id F272E104D;
	Sun, 10 Aug 2025 03:31:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754789502;
	bh=OalqXRX2BlFGyxMJdGnLlToeFLxIFE59sf/mpzpkEFk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ft+WpgzJ5TKvLfgzbdV8vv2daDiEGd/rGYkAfT0DpXtoDYpnnqqmU5H6bsTznNCMS
	 JzAQo8ts6cQ1vpLWGx/QKQKsvDJ2Ye+tyGrPWCxk6xBDICkm/RXjMOO0joFSRIorYz
	 1RInpb1NKhl147NS8mNQRxGs5ZFu4UVZa2Fsa+/c=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Hans Verkuil <hans@jjverkuil.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v3 43/76] media: mtk: mdp3: Access v4l2_fh from file
Date: Sun, 10 Aug 2025 04:30:25 +0300
Message-ID: <20250810013100.29776-44-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250810013100.29776-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20250810013100.29776-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250809_183234_261502_84D16B32 
X-CRM114-Status: GOOD (  10.06  )
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
Co-developed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
Changes since v1:

- Update file-to-ctx macro due to removal of fh-to-ctx macro
---
 .../platform/mediatek/mdp3/mtk-mdp3-m2m.c     | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-m2m.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-m2m.c
index e68ae19d71a9..9ef956b565a7 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-m2m.c
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-m2m.c
@@ -10,14 +10,9 @@
 #include <media/videobuf2-dma-contig.h>
 #include "mtk-mdp3-m2m.h"
 
-static inline struct mdp_m2m_ctx *fh_to_ctx(struct v4l2_fh *fh)
-{
-	return container_of(fh, struct mdp_m2m_ctx, fh);
-}
-
 static inline struct mdp_m2m_ctx *file_to_ctx(struct file *filp)
 {
-	return fh_to_ctx(file_to_v4l2_fh(filp));
+	return container_of(file_to_v4l2_fh(filp), struct mdp_m2m_ctx, fh);
 }
 
 static inline struct mdp_m2m_ctx *ctrl_to_ctx(struct v4l2_ctrl *ctrl)
@@ -290,7 +285,7 @@ static int mdp_m2m_querycap(struct file *file, void *fh,
 static int mdp_m2m_enum_fmt_mplane(struct file *file, void *fh,
 				   struct v4l2_fmtdesc *f)
 {
-	struct mdp_m2m_ctx *ctx = fh_to_ctx(fh);
+	struct mdp_m2m_ctx *ctx = file_to_ctx(file);
 
 	return mdp_enum_fmt_mplane(ctx->mdp_dev, f);
 }
@@ -298,7 +293,7 @@ static int mdp_m2m_enum_fmt_mplane(struct file *file, void *fh,
 static int mdp_m2m_g_fmt_mplane(struct file *file, void *fh,
 				struct v4l2_format *f)
 {
-	struct mdp_m2m_ctx *ctx = fh_to_ctx(fh);
+	struct mdp_m2m_ctx *ctx = file_to_ctx(file);
 	struct mdp_frame *frame;
 	struct v4l2_pix_format_mplane *pix_mp;
 
@@ -316,7 +311,7 @@ static int mdp_m2m_g_fmt_mplane(struct file *file, void *fh,
 static int mdp_m2m_s_fmt_mplane(struct file *file, void *fh,
 				struct v4l2_format *f)
 {
-	struct mdp_m2m_ctx *ctx = fh_to_ctx(fh);
+	struct mdp_m2m_ctx *ctx = file_to_ctx(file);
 	struct mdp_frame *frame = ctx_get_frame(ctx, f->type);
 	struct mdp_frame *capture;
 	const struct mdp_format *fmt;
@@ -359,7 +354,7 @@ static int mdp_m2m_s_fmt_mplane(struct file *file, void *fh,
 static int mdp_m2m_try_fmt_mplane(struct file *file, void *fh,
 				  struct v4l2_format *f)
 {
-	struct mdp_m2m_ctx *ctx = fh_to_ctx(fh);
+	struct mdp_m2m_ctx *ctx = file_to_ctx(file);
 
 	if (!mdp_try_fmt_mplane(ctx->mdp_dev, f, &ctx->curr_param, ctx->id))
 		return -EINVAL;
@@ -370,7 +365,7 @@ static int mdp_m2m_try_fmt_mplane(struct file *file, void *fh,
 static int mdp_m2m_g_selection(struct file *file, void *fh,
 			       struct v4l2_selection *s)
 {
-	struct mdp_m2m_ctx *ctx = fh_to_ctx(fh);
+	struct mdp_m2m_ctx *ctx = file_to_ctx(file);
 	struct mdp_frame *frame;
 	bool valid = false;
 
@@ -422,7 +417,7 @@ static int mdp_m2m_g_selection(struct file *file, void *fh,
 static int mdp_m2m_s_selection(struct file *file, void *fh,
 			       struct v4l2_selection *s)
 {
-	struct mdp_m2m_ctx *ctx = fh_to_ctx(fh);
+	struct mdp_m2m_ctx *ctx = file_to_ctx(file);
 	struct mdp_frame *frame = ctx_get_frame(ctx, s->type);
 	struct mdp_frame *capture;
 	struct v4l2_rect r;
-- 
Regards,

Laurent Pinchart


