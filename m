Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D3FEC87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 Aug 2025 21:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V1GL7kas6tayYkAeBLFW92hf56Ybk346xyMzylq7YhY=; b=aNYoEIud497lAx1+8+JJHP5L3e
	UhEFfaZfKMTpbHUNOIWvN4UZgBcOKMV9YeUPEQ0gKLLnwF8KPM33A/EN1Bk+HIXzYqArcsJ6N365n
	aYQr5W2kfXa8yE1YvGlQIpDeqoEJa7M/2aJRxKWZVauVAYv12vT4vFj7IkPIy36WKtep21Qt9E0dq
	jl3H9dQ6XaM3ppzWkCy+Gu+33n5SfK0c6s4KSXQwcR5e6rztteRxi5T2XJEv+WcjeJ+xeqP15xQvL
	ZtV8a7ewoMQP/kQ5BcEhgbOX3c5q2N1zCinhvyir1EpCa56MAQAB4rcNVThFxBA5Vsfcyru2/Md04
	WGqUPh6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukrLM-00000004xyf-1qbM;
	Sat, 09 Aug 2025 21:43:12 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukqxY-00000004vsS-04Fq;
	Sat, 09 Aug 2025 21:18:37 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 05D15165B;
	Sat,  9 Aug 2025 23:17:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754774264;
	bh=E2YsTuLzac0tzRZQUeUKAToChu69AO8ArXm4ynIHL2k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kOV5Me+dLUdriEWiPFdked+NZxD2X3aMI+zMdJDqFlRBtlRCWJchZd5gguvr8UQ5U
	 knuwhjfwex9EJKKfkCRLQtCWwPgIsscAyZvt6c5W0PRGDoqboBzrkJDmW2l+LoHv4l
	 UljzMUN2QZi3ak0o3VCmTfY2R+0KcRZd+Vbexi2U=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hans@jjverkuil.nl>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Jacob Chen <jacob-chen@iotwrt.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 50/76] media: rockhip: rga: Access v4l2_fh from file
Date: Sun, 10 Aug 2025 00:16:27 +0300
Message-ID: <20250809211654.28887-51-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250809211654.28887-1-laurent.pinchart@ideasonboard.com>
References: <20250809211654.28887-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250809_141836_194328_BB668D4E 
X-CRM114-Status: GOOD (  10.24  )
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
 drivers/media/platform/rockchip/rga/rga.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/platform/rockchip/rga/rga.c
index 45c42c7ad846..7c657df623f2 100644
--- a/drivers/media/platform/rockchip/rga/rga.c
+++ b/drivers/media/platform/rockchip/rga/rga.c
@@ -462,7 +462,7 @@ static int vidioc_enum_fmt(struct file *file, void *prv, struct v4l2_fmtdesc *f)
 static int vidioc_g_fmt(struct file *file, void *prv, struct v4l2_format *f)
 {
 	struct v4l2_pix_format_mplane *pix_fmt = &f->fmt.pix_mp;
-	struct rga_ctx *ctx = prv;
+	struct rga_ctx *ctx = file_to_rga_ctx(file);
 	struct vb2_queue *vq;
 	struct rga_frame *frm;
 
@@ -504,7 +504,7 @@ static int vidioc_try_fmt(struct file *file, void *prv, struct v4l2_format *f)
 static int vidioc_s_fmt(struct file *file, void *prv, struct v4l2_format *f)
 {
 	struct v4l2_pix_format_mplane *pix_fmt = &f->fmt.pix_mp;
-	struct rga_ctx *ctx = prv;
+	struct rga_ctx *ctx = file_to_rga_ctx(file);
 	struct rockchip_rga *rga = ctx->rga;
 	struct vb2_queue *vq;
 	struct rga_frame *frm;
@@ -561,7 +561,7 @@ static int vidioc_s_fmt(struct file *file, void *prv, struct v4l2_format *f)
 static int vidioc_g_selection(struct file *file, void *prv,
 			      struct v4l2_selection *s)
 {
-	struct rga_ctx *ctx = prv;
+	struct rga_ctx *ctx = file_to_rga_ctx(file);
 	struct rga_frame *f;
 	bool use_frame = false;
 
@@ -609,7 +609,7 @@ static int vidioc_g_selection(struct file *file, void *prv,
 static int vidioc_s_selection(struct file *file, void *prv,
 			      struct v4l2_selection *s)
 {
-	struct rga_ctx *ctx = prv;
+	struct rga_ctx *ctx = file_to_rga_ctx(file);
 	struct rockchip_rga *rga = ctx->rga;
 	struct rga_frame *f;
 	int ret = 0;
-- 
Regards,

Laurent Pinchart


