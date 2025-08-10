Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AA77C87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 10 Aug 2025 02:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/scL6QStKKlPseTxGFxK+OCpR6LyvE2ZaworN8c6TVg=; b=dV1bvgcDgYvyTX2ddnKj9+FnQC
	axUvtzTXJ6BpEg94vLcZrmfLQJT/LQGhI+eHat4UyW6QA/QJ6jo1TlAGyo13eRevBWC9Ha2YJH0pS
	RQbpgc5MV7XxmRPQCRMYhy3aivr80rLJ966ugGnp+Ehne4tWK5tPz0zuZKUOo7r2p42erS1KZlDzt
	WFjvdZJgmdGw+sHu2T3vViXRhYuNcEtohb5jOJ0f5fnhKOi+HNhnAOOuwU0SH4TAvomCchpwaQS5m
	tXZwETwrzkNQnVbSYBtjAVrB2viQfDDjI5O14hRZMI+GJGHywCKaZYG2UAi0NmTvDQonZYO2pLZmN
	r3WoCuEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukvdG-00000005B96-3VsJ;
	Sun, 10 Aug 2025 02:17:58 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukuvn-000000057n4-0F7z
	for linux-arm-kernel@lists.infradead.org;
	Sun, 10 Aug 2025 01:33:04 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id F32907E6;
	Sun, 10 Aug 2025 03:32:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754789531;
	bh=HYs8+7Grwk4gchGGIHTU1tAZKtiyXyexiIuD+bI6WZE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=t+wO5tN/lYNK2t2WUENECger9qKtpjRq5Jtl/jtI3SuE/GLnB1sYliOZZehre5JBF
	 9D21RzYU9QEs+0yQJGDOpbhrleawqCttzwlQiK8rnwfb4u0qFwsgCQt6uJBY0/9eb0
	 PoLjs+uL05f7ayU8SnFc/LeXF1+krmfGxe/youzE=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Hans Verkuil <hans@jjverkuil.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
	Jiasheng Jiang <jiashengjiangcool@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 61/76] media: stm32: dma2d: Access v4l2_fh from file
Date: Sun, 10 Aug 2025 04:30:43 +0300
Message-ID: <20250810013100.29776-62-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250810013100.29776-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20250810013100.29776-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250809_183303_232574_80B48DD4 
X-CRM114-Status: UNSURE (   9.91  )
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
 drivers/media/platform/st/stm32/dma2d/dma2d.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/st/stm32/dma2d/dma2d.c b/drivers/media/platform/st/stm32/dma2d/dma2d.c
index bc0f81e78018..a22f587a5f83 100644
--- a/drivers/media/platform/st/stm32/dma2d/dma2d.c
+++ b/drivers/media/platform/st/stm32/dma2d/dma2d.c
@@ -354,7 +354,7 @@ static int vidioc_enum_fmt(struct file *file, void *prv, struct v4l2_fmtdesc *f)
 
 static int vidioc_g_fmt(struct file *file, void *prv, struct v4l2_format *f)
 {
-	struct dma2d_ctx *ctx = prv;
+	struct dma2d_ctx *ctx = file2ctx(file);
 	struct vb2_queue *vq;
 	struct dma2d_frame *frm;
 
@@ -379,7 +379,7 @@ static int vidioc_g_fmt(struct file *file, void *prv, struct v4l2_format *f)
 
 static int vidioc_try_fmt(struct file *file, void *prv, struct v4l2_format *f)
 {
-	struct dma2d_ctx *ctx = prv;
+	struct dma2d_ctx *ctx = file2ctx(file);
 	struct dma2d_fmt *fmt;
 	enum v4l2_field *field;
 	u32 fourcc = f->fmt.pix.pixelformat;
@@ -422,7 +422,7 @@ static int vidioc_try_fmt(struct file *file, void *prv, struct v4l2_format *f)
 
 static int vidioc_s_fmt(struct file *file, void *prv, struct v4l2_format *f)
 {
-	struct dma2d_ctx *ctx = prv;
+	struct dma2d_ctx *ctx = file2ctx(file);
 	struct vb2_queue *vq;
 	struct dma2d_frame *frm;
 	struct dma2d_fmt *fmt;
-- 
Regards,

Laurent Pinchart


