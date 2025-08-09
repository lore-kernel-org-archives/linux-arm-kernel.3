Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEB50C87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 Aug 2025 22:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XB64juPUxopKWWIffRmWcNnz/p+uvvyUJ+0x+C6d5aY=; b=vro1NS1FJt3QHLLw4pD/Z14DZ4
	Y0Wp2hCNRvhE4OSsBV5iadKrNAe9hXX4BruADwhmpd0h6uWbvnPuoYf9vAhpb8Okz+d+pUf+GN69l
	5hY5goLclJXAJgHK9FAFXmIXdz8LJphkxZ3HTIEXGgOv4LKCQirpforV8BxP755quic0KDz8S6Lkp
	d6T//6YdGLYgeKDA/zUFNUGf/SUs1zLqzLrX5fAIKcP3QcktU9TUj8xMBbHtGtUcb8a957CQzatc8
	+BRjMro9EP5zyuRGWwwYJeCwgP42ukvXZrQdjf7uk3uTwcjTaUNO87qttUV79lVcIcI8sSEBWWpit
	eZ8glyjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukrhi-00000004zMX-2EBa;
	Sat, 09 Aug 2025 22:06:18 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukqy2-00000004vyP-0rvv
	for linux-arm-kernel@lists.infradead.org;
	Sat, 09 Aug 2025 21:19:07 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 2FADE502;
	Sat,  9 Aug 2025 23:18:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754774294;
	bh=TqSNPHQ51geLYoaPbn/7SwDHBQStX7gKsiICnE34Qgc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VFgVTqSfT/zkcrE+f/1Wgwds1dAaxLfVyLw4YQeVQ8Ytfe7KJ1kz/tQq8EHclGhze
	 suJX8Qb+I5kow336kb/7ZVO4JLDyEHcEboiFZO7TWqvJSKqZPsKeSol4qYEzllIkL8
	 EnVT3mmGvblfeC71fl77CEAx5Tvz0PhwXBN6iRvE=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hans@jjverkuil.nl>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Steve Longerbeam <slongerbeam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-staging@lists.linux.dev,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 68/76] media: staging: imx: Access v4l2_fh from file
Date: Sun, 10 Aug 2025 00:16:45 +0300
Message-ID: <20250809211654.28887-69-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250809211654.28887-1-laurent.pinchart@ideasonboard.com>
References: <20250809211654.28887-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250809_141906_383936_77BB2ED7 
X-CRM114-Status: GOOD (  10.96  )
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
 drivers/staging/media/imx/imx-media-csc-scaler.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/media/imx/imx-media-csc-scaler.c b/drivers/staging/media/imx/imx-media-csc-scaler.c
index dc7f9a77cbe6..1869c5792ecb 100644
--- a/drivers/staging/media/imx/imx-media-csc-scaler.c
+++ b/drivers/staging/media/imx/imx-media-csc-scaler.c
@@ -23,8 +23,6 @@
 
 #include "imx-media.h"
 
-#define fh_to_ctx(__fh)	container_of(__fh, struct ipu_csc_scaler_ctx, fh)
-
 #define IMX_CSC_SCALER_NAME "imx-csc-scaler"
 
 enum {
@@ -68,7 +66,7 @@ struct ipu_csc_scaler_ctx {
 
 static inline struct ipu_csc_scaler_ctx *file_to_ctx(struct file *filp)
 {
-	return fh_to_ctx(file_to_v4l2_fh(filp));
+	return container_of(file_to_v4l2_fh(filp), struct ipu_csc_scaler_ctx, fh);
 }
 
 static struct ipu_csc_scaler_q_data *get_q_data(struct ipu_csc_scaler_ctx *ctx,
@@ -184,7 +182,7 @@ static int ipu_csc_scaler_enum_fmt(struct file *file, void *fh,
 static int ipu_csc_scaler_g_fmt(struct file *file, void *priv,
 				struct v4l2_format *f)
 {
-	struct ipu_csc_scaler_ctx *ctx = fh_to_ctx(priv);
+	struct ipu_csc_scaler_ctx *ctx = file_to_ctx(file);
 	struct ipu_csc_scaler_q_data *q_data;
 
 	q_data = get_q_data(ctx, f->type);
@@ -197,7 +195,7 @@ static int ipu_csc_scaler_g_fmt(struct file *file, void *priv,
 static int ipu_csc_scaler_try_fmt(struct file *file, void *priv,
 				  struct v4l2_format *f)
 {
-	struct ipu_csc_scaler_ctx *ctx = fh_to_ctx(priv);
+	struct ipu_csc_scaler_ctx *ctx = file_to_ctx(file);
 	struct ipu_csc_scaler_q_data *q_data = get_q_data(ctx, f->type);
 	struct ipu_image test_in, test_out;
 	enum v4l2_field field;
@@ -245,8 +243,8 @@ static int ipu_csc_scaler_try_fmt(struct file *file, void *priv,
 static int ipu_csc_scaler_s_fmt(struct file *file, void *priv,
 				struct v4l2_format *f)
 {
+	struct ipu_csc_scaler_ctx *ctx = file_to_ctx(file);
 	struct ipu_csc_scaler_q_data *q_data;
-	struct ipu_csc_scaler_ctx *ctx = fh_to_ctx(priv);
 	struct vb2_queue *vq;
 	int ret;
 
@@ -301,7 +299,7 @@ static int ipu_csc_scaler_s_fmt(struct file *file, void *priv,
 static int ipu_csc_scaler_g_selection(struct file *file, void *priv,
 				      struct v4l2_selection *s)
 {
-	struct ipu_csc_scaler_ctx *ctx = fh_to_ctx(priv);
+	struct ipu_csc_scaler_ctx *ctx = file_to_ctx(file);
 	struct ipu_csc_scaler_q_data *q_data;
 
 	switch (s->target) {
@@ -339,7 +337,7 @@ static int ipu_csc_scaler_g_selection(struct file *file, void *priv,
 static int ipu_csc_scaler_s_selection(struct file *file, void *priv,
 				      struct v4l2_selection *s)
 {
-	struct ipu_csc_scaler_ctx *ctx = fh_to_ctx(priv);
+	struct ipu_csc_scaler_ctx *ctx = file_to_ctx(file);
 	struct ipu_csc_scaler_q_data *q_data;
 
 	switch (s->target) {
-- 
Regards,

Laurent Pinchart


