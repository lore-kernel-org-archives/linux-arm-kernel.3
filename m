Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5C82C87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 Aug 2025 22:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/scL6QStKKlPseTxGFxK+OCpR6LyvE2ZaworN8c6TVg=; b=QZEPgtf9vemBHGHTpMYuBNaokQ
	C8VN2qn7uX0hbIhokmsPR4MudOXbUB2rOQpVtjtDbE/sl5GVqsid8KsIihmUrkxjDOM7K40UQhJTv
	zSMLTmvOo8muCqbTQ4t6WtJUIzY7cx+XzFIPUCQAUWyfxkJy3jGaiKYnHVA670VdLgbDkTaaH5pJ1
	g9U2uHtPyVogAQ0NWioIsJhzYwfvBkCQNDMs4Ra6V2HorZ1kuFfilQGBWKaS2VQztNlShdddNmlCb
	GwDDj97CeR2bjL9sYukce+UKiDFJ4htYKo3jOvGUfj0dsXjIyyGoszfDIL0YEohL7AVj0VcM3kScR
	LxuubZiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukrfE-00000004zAx-1ppZ;
	Sat, 09 Aug 2025 22:03:44 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukqxq-00000004vwh-1YPU
	for linux-arm-kernel@lists.infradead.org;
	Sat, 09 Aug 2025 21:18:55 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 68ECE111D;
	Sat,  9 Aug 2025 23:18:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754774282;
	bh=HYs8+7Grwk4gchGGIHTU1tAZKtiyXyexiIuD+bI6WZE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UWr6K88eiflNI3J9JW0bF9nIuHf+xU42BIfpoZVhHEjq566NCzyNStdqDzsiIMohB
	 PPt+pUTJuwth9u00B++/PBx+VaIzkTDVFOG+fQmFh7rwj0UyLcJk0kFtPeAah+zbuS
	 Cv+cebsIg/y0SqxJM1IF593NzhcJ1K0hZ1t/4loI=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hans@jjverkuil.nl>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jiasheng Jiang <jiashengjiangcool@gmail.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 61/76] media: stm32: dma2d: Access v4l2_fh from file
Date: Sun, 10 Aug 2025 00:16:38 +0300
Message-ID: <20250809211654.28887-62-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250809211654.28887-1-laurent.pinchart@ideasonboard.com>
References: <20250809211654.28887-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250809_141854_548747_431C3069 
X-CRM114-Status: UNSURE (   9.42  )
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


