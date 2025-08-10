Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A508C87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 10 Aug 2025 02:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f4pW2aeZWVpwgaTd8kbKf5ZI6lrajqp4BKju0fzfiyE=; b=hckK03Fmk6jPl9AVYezObXfmJe
	eXNw61MDKtP6vq/VhKzn32QG/UgKX7pD0+vnu7vyo9b9I1k737oGBW+hr1qM0CauPlBoY22344Zec
	C03dlKkfLoWEUZZU81zDJTX1k5U5upbc+3I3jRvBqNUoJf9/CZD6YxbuYS16wNXB06osnzdTFKoSv
	fEq5nx2zDsQHwCkLYm8StAmFDfPGmYTHXx0HeidNWHnqjQ8/kzpYV8wc7nn9SXiXwDpsiPR6HnADA
	arQ6SYLhrBXg9Dhd6Y2fxeTxN1IS4dcmJtfd+pOBTALhAynbT+p8uyHW0TE8u8SeSy23TS8muJl4E
	WKhyBSVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukvfk-00000005BHT-0Z36;
	Sun, 10 Aug 2025 02:20:32 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukuvy-000000057qj-1S0Q
	for linux-arm-kernel@lists.infradead.org;
	Sun, 10 Aug 2025 01:33:15 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 3FE7A18B9;
	Sun, 10 Aug 2025 03:32:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754789542;
	bh=1dP0gqieA4IYv3wyTB37hTBt2kmaz/Nywv73C1Govuc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HKBHL1HWD/YEhYZu8p7OopczcbX43TGDosZXqCOgMF+0frPGcGh2nK/I2RJfec2UN
	 Myk6WLlT1N7Dctir+psbryMdQrxh63VqyVSCLgUixkt0MCQ6v4Vk3zeY8KNgeqEzyg
	 AF31CS9kcYRCygvmaOu/8dm7Bh8snEBkQLp15m5Y=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Hans Verkuil <hans@jjverkuil.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
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
Subject: [PATCH v3 68/76] media: staging: imx: Access v4l2_fh from file
Date: Sun, 10 Aug 2025 04:30:50 +0300
Message-ID: <20250810013100.29776-69-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250810013100.29776-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20250810013100.29776-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250809_183314_530153_6E352265 
X-CRM114-Status: GOOD (  11.65  )
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


