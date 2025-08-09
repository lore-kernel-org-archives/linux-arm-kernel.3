Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEC06C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 Aug 2025 21:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uT1S+5/TwYOJ7J9LvwznLlErR0L1BLYSOXMXY967BzU=; b=CoV3mzd0KlT1s78ntiweSiE0K8
	50Kp5XxK1o/Fd5zy909RS6G4ZnxufvOAY2xwndRXCABbZqUj+rvXoWQGgpTu+gG6JFUS3FnTXudnv
	gqBQ366aWT90q/sJZUqxrOAWHXbS5aoEGBrXFFZx8ZMW+x9570m+kqckKkcVp1yY+vOZntrnLR1y+
	5PYJmyQ8STB2W+66urCcxjHfi1R2Jiam93Sea8LH5oB+YRekZ+lUzYwvyNF9YVtvudLsSzJ02Fb9n
	V/QuOQ0Mv/w7TsEH6TLcJ6EdWN4HIIbVo9sp7MIDzgt7/QHsPrLaTwGpNKtP6PnSSQqfd9YLlOe7a
	U3OsOG/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukrSo-00000004ySV-1o6u;
	Sat, 09 Aug 2025 21:50:54 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukqxc-00000004vtx-414R
	for linux-arm-kernel@lists.infradead.org;
	Sat, 09 Aug 2025 21:18:42 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 04E18EFE;
	Sat,  9 Aug 2025 23:17:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754774269;
	bh=9KV6Si1pe8am7DLCLDzlI0SEPb8bsZoYOfEmMeSymXk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CYDd6m/Rl46TVzLrEevTs5p3gWP04+ehDseFDcUisW8pTJS+1+I1T47ZW0Gd9uL6u
	 0Fl/xEd3M2GOhDjML+Mh/vQP65x/jIPxWXwu+DPTsCjK0mf/c3Ot9X/5dWBSSwHJRk
	 ppwlTG83a0pc0kNcTSrozDQ3yJ9Qp4iRdHs55e0k=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hans@jjverkuil.nl>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH v2 53/76] media: exynos4-is: Access v4l2_fh from file
Date: Sun, 10 Aug 2025 00:16:30 +0300
Message-ID: <20250809211654.28887-54-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250809211654.28887-1-laurent.pinchart@ideasonboard.com>
References: <20250809211654.28887-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250809_141841_136989_F26AF642 
X-CRM114-Status: GOOD (  12.13  )
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

From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

The v4l2_fh associated with an open file handle is now guaranteed
to be available in file->private_data, initialised by v4l2_fh_add().

Access the v4l2_fh, and from there the driver-specific structure,
from the file * in all ioctl handlers.

Co-developed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
Changes since v1:

- Update file-to-ctx macro due to removal of fh-to-ctx macro
---
 drivers/media/platform/samsung/exynos4-is/fimc-core.h |  4 +---
 drivers/media/platform/samsung/exynos4-is/fimc-m2m.c  | 10 +++++-----
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/samsung/exynos4-is/fimc-core.h b/drivers/media/platform/samsung/exynos4-is/fimc-core.h
index 2b6c72d9442c..c23cbdee7afc 100644
--- a/drivers/media/platform/samsung/exynos4-is/fimc-core.h
+++ b/drivers/media/platform/samsung/exynos4-is/fimc-core.h
@@ -496,11 +496,9 @@ struct fimc_ctx {
 	struct fimc_ctrls	ctrls;
 };
 
-#define fh_to_ctx(__fh) container_of(__fh, struct fimc_ctx, fh)
-
 static inline struct fimc_ctx *file_to_ctx(struct file *filp)
 {
-	return fh_to_ctx(file_to_v4l2_fh(filp));
+	return container_of(file_to_v4l2_fh(filp), struct fimc_ctx, fh);
 }
 
 static inline void set_frame_bounds(struct fimc_frame *f, u32 width, u32 height)
diff --git a/drivers/media/platform/samsung/exynos4-is/fimc-m2m.c b/drivers/media/platform/samsung/exynos4-is/fimc-m2m.c
index 609fd84f89d4..562c57f186c6 100644
--- a/drivers/media/platform/samsung/exynos4-is/fimc-m2m.c
+++ b/drivers/media/platform/samsung/exynos4-is/fimc-m2m.c
@@ -249,7 +249,7 @@ static int fimc_m2m_enum_fmt(struct file *file, void *priv,
 static int fimc_m2m_g_fmt_mplane(struct file *file, void *fh,
 				 struct v4l2_format *f)
 {
-	struct fimc_ctx *ctx = fh_to_ctx(fh);
+	struct fimc_ctx *ctx = file_to_ctx(file);
 	const struct fimc_frame *frame = ctx_get_frame(ctx, f->type);
 
 	if (IS_ERR(frame))
@@ -308,7 +308,7 @@ static int fimc_try_fmt_mplane(struct fimc_ctx *ctx, struct v4l2_format *f)
 static int fimc_m2m_try_fmt_mplane(struct file *file, void *fh,
 				   struct v4l2_format *f)
 {
-	struct fimc_ctx *ctx = fh_to_ctx(fh);
+	struct fimc_ctx *ctx = file_to_ctx(file);
 	return fimc_try_fmt_mplane(ctx, f);
 }
 
@@ -337,7 +337,7 @@ static void __set_frame_format(struct fimc_frame *frame,
 static int fimc_m2m_s_fmt_mplane(struct file *file, void *fh,
 				 struct v4l2_format *f)
 {
-	struct fimc_ctx *ctx = fh_to_ctx(fh);
+	struct fimc_ctx *ctx = file_to_ctx(file);
 	struct fimc_dev *fimc = ctx->fimc_dev;
 	const struct fimc_fmt *fmt;
 	struct vb2_queue *vq;
@@ -376,7 +376,7 @@ static int fimc_m2m_s_fmt_mplane(struct file *file, void *fh,
 static int fimc_m2m_g_selection(struct file *file, void *fh,
 				struct v4l2_selection *s)
 {
-	struct fimc_ctx *ctx = fh_to_ctx(fh);
+	struct fimc_ctx *ctx = file_to_ctx(file);
 	const struct fimc_frame *frame;
 
 	frame = ctx_get_frame(ctx, s->type);
@@ -484,7 +484,7 @@ static int fimc_m2m_try_selection(struct fimc_ctx *ctx,
 static int fimc_m2m_s_selection(struct file *file, void *fh,
 				struct v4l2_selection *s)
 {
-	struct fimc_ctx *ctx = fh_to_ctx(fh);
+	struct fimc_ctx *ctx = file_to_ctx(file);
 	struct fimc_dev *fimc = ctx->fimc_dev;
 	struct fimc_frame *f;
 	int ret;
-- 
Regards,

Laurent Pinchart


