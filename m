Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45951C54ED0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 May 2025 15:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WzRo9xZE6NHVOo/q12H1EtSu1yCkH3pmayFkkq1Nvok=; b=rCL3LPg+HKv5LRZsh1hSb84K8U
	gzVKdrUizBPDbiQYyp55Z8Gv3YtwxC9Pj9CEKHb/0m9qysU9jQyLMygHoLc60e4aBGFjPvxzYiOCl
	gb4G3wWozvIg4pVQUE8JpJUlxG3G5o/4aKQ2G84LMlkI8S8difkNkE/QazTXDcnaA5nEHcx0QmgoC
	eFoqu8T9vaslABlUF73AWYqNO+l5KlWEONXrjzoXmZyojayKU79+Z3ZZHYz7mxeyIWa/jqWuFbKAY
	MYax++aidl+BcPLr4TsyTqK/5dYC5I/sI0iNb6HIBjI6aqjcaL3RNEdoIpfyW6RF9A5kszdwrrbMV
	IheJUvyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIUoG-00000004KQd-10bR;
	Fri, 23 May 2025 15:59:48 +0000
Received: from leonov.paulk.fr ([185.233.101.22])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIUZi-00000004Hc1-3nPv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 May 2025 15:44:48 +0000
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 620AA1F0003D
	for <linux-arm-kernel@lists.infradead.org>; Fri, 23 May 2025 15:44:42 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id DB5E2AC2EAE; Fri, 23 May 2025 15:44:41 +0000 (UTC)
Received: from localhost.localdomain (unknown [192.168.1.64])
	by laika.paulk.fr (Postfix) with ESMTP id CD313AC2EA9;
	Fri, 23 May 2025 15:44:18 +0000 (UTC)
From: Paul Kocialkowski <paulk@sys-base.io>
To: linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Paul Kocialkowski <paulk@sys-base.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Hans Verkuil <hans@jjverkuil.nl>,
	Jernej Skrabec <jernej.skrabec@siol.net>
Subject: [PATCH] media: cedrus: Add support for additional output formats
Date: Fri, 23 May 2025 17:43:59 +0200
Message-ID: <20250523154359.2454180-1-paulk@sys-base.io>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_084447_108863_7898C5B2 
X-CRM114-Status: GOOD (  14.32  )
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

From: Jernej Skrabec <jernej.skrabec@siol.net>

If VPU supports untiled output, it actually supports several different
YUV 4:2:0 layouts, namely NV12, NV21, YUV420 and YVU420.

Add support for all of them.

Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
Reviewed-by: Paul Kocialkowski <paulk@sys-base.io>
---

Looks like this patch never made it, sorry about that.
I've rebased it atop media/next and added my Reviewed-by tag.
---
 drivers/staging/media/sunxi/cedrus/cedrus_hw.c | 18 +++++++++++++++++-
 .../staging/media/sunxi/cedrus/cedrus_video.c  | 18 ++++++++++++++++++
 2 files changed, 35 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_hw.c b/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
index 32af0e96e762..168d89c5a16d 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
@@ -86,9 +86,25 @@ void cedrus_dst_format_set(struct cedrus_dev *dev,
 
 	switch (fmt->pixelformat) {
 	case V4L2_PIX_FMT_NV12:
+	case V4L2_PIX_FMT_NV21:
+	case V4L2_PIX_FMT_YUV420:
+	case V4L2_PIX_FMT_YVU420:
 		chroma_size = ALIGN(width, 16) * ALIGN(height, 16) / 2;
 
-		reg = VE_PRIMARY_OUT_FMT_NV12;
+		switch (fmt->pixelformat) {
+		case V4L2_PIX_FMT_NV12:
+			reg = VE_PRIMARY_OUT_FMT_NV12;
+			break;
+		case V4L2_PIX_FMT_NV21:
+			reg = VE_PRIMARY_OUT_FMT_NV21;
+			break;
+		case V4L2_PIX_FMT_YUV420:
+			reg = VE_PRIMARY_OUT_FMT_YU12;
+			break;
+		case V4L2_PIX_FMT_YVU420:
+			reg = VE_PRIMARY_OUT_FMT_YV12;
+			break;
+		}
 		cedrus_write(dev, VE_PRIMARY_OUT_FMT, reg);
 
 		reg = chroma_size / 2;
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_video.c b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
index 77f78266f406..9fae2c7493d0 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_video.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
@@ -64,6 +64,21 @@ static struct cedrus_format cedrus_formats[] = {
 		.pixelformat	= V4L2_PIX_FMT_NV12_32L32,
 		.directions	= CEDRUS_DECODE_DST,
 	},
+	{
+		.pixelformat	= V4L2_PIX_FMT_NV21,
+		.directions	= CEDRUS_DECODE_DST,
+		.capabilities	= CEDRUS_CAPABILITY_UNTILED,
+	},
+	{
+		.pixelformat	= V4L2_PIX_FMT_YUV420,
+		.directions	= CEDRUS_DECODE_DST,
+		.capabilities	= CEDRUS_CAPABILITY_UNTILED,
+	},
+	{
+		.pixelformat	= V4L2_PIX_FMT_YVU420,
+		.directions	= CEDRUS_DECODE_DST,
+		.capabilities	= CEDRUS_CAPABILITY_UNTILED,
+	},
 };
 
 #define CEDRUS_FORMATS_COUNT	ARRAY_SIZE(cedrus_formats)
@@ -140,6 +155,9 @@ void cedrus_prepare_format(struct v4l2_pix_format *pix_fmt)
 		break;
 
 	case V4L2_PIX_FMT_NV12:
+	case V4L2_PIX_FMT_NV21:
+	case V4L2_PIX_FMT_YUV420:
+	case V4L2_PIX_FMT_YVU420:
 		/* 16-aligned stride. */
 		bytesperline = ALIGN(width, 16);
 
-- 
2.49.0


