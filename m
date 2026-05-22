Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9604ACD5BB0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 10:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uqM6o9JoLxoXkJT69W+b8pErXNWPIo6KPdj0GHIzDSM=; b=hJiNbGnzCWQhyy65skKdbA2uLS
	ooWS/3OcNkRgwjAwSjeI/OJx7cPOZXFQojsF3/xrGiuhSL38etdupmGY8QVvV8xHVMyvwD25KpDlA
	C6a6sKQTq/laJ7P22FK7DBTRqlDVwGltrMWVYtT+rqCMF1haQxQvTIaTnQMOI3oMHyP2pYp8DWt7b
	3zeFLb94kmJ5DtX7JwfU4fO095MYBvH7a04NmwHoIUDGjy4+hAUGmpnejQkgCKJSbySnwx1jJiB6W
	2zNWvKdziS1AReQlqdWEFij7yMPQ5xGvK2WKvSKRxaLkfdVXnDyJL7tJfmg2pyc5l4FcVH1c9OtEd
	FqgPeHPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQMxD-0000000ATcK-07mF;
	Fri, 22 May 2026 10:18:07 +0000
Received: from leonov.paulk.fr ([185.233.101.22])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQMx9-0000000ATXf-1BA5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 10:18:04 +0000
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 80FCC370029A
	for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 10:17:52 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 07B52B408C8; Fri, 22 May 2026 10:17:51 +0000 (UTC)
Received: from shepard (unknown [192.168.1.65])
	by laika.paulk.fr (Postfix) with ESMTP id 34E72B408D0;
	Fri, 22 May 2026 10:17:08 +0000 (UTC)
From: Paul Kocialkowski <paulk@sys-base.io>
To: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Michael Tretter <m.tretter@pengutronix.de>,
	Paul Kocialkowski <paulk@sys-base.io>
Subject: [PATCH 08/14] media: verisilicon: Report default pixel coding for non-JPEG and fix JPEG case
Date: Fri, 22 May 2026 12:16:47 +0200
Message-ID: <20260522101653.2565125-9-paulk@sys-base.io>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260522101653.2565125-1-paulk@sys-base.io>
References: <20260522101653.2565125-1-paulk@sys-base.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_031803_490935_D81E84B9 
X-CRM114-Status: GOOD (  12.36  )
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

The JPEG colorspace is very specific to the JPEG coded format and is
not relevant as a default for other types of coded (or non-coded) formats.
These would typically use ITU-R Rec. BT.709 but it could be a number of other
ones as well so reporting the default value is best.

Furthermore other pixel coding attributes are best set accordingly instead
of keeping default values in the JPEG case.

Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
---
 .../media/platform/verisilicon/hantro_v4l2.c   | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/verisilicon/hantro_v4l2.c b/drivers/media/platform/verisilicon/hantro_v4l2.c
index fcf3bd9bcda2..1001feee5c07 100644
--- a/drivers/media/platform/verisilicon/hantro_v4l2.c
+++ b/drivers/media/platform/verisilicon/hantro_v4l2.c
@@ -415,10 +415,20 @@ hantro_reset_fmt(struct v4l2_pix_format_mplane *fmt,
 
 	fmt->pixelformat = vpu_fmt->fourcc;
 	fmt->field = V4L2_FIELD_NONE;
-	fmt->colorspace = V4L2_COLORSPACE_JPEG;
-	fmt->ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
-	fmt->quantization = V4L2_QUANTIZATION_DEFAULT;
-	fmt->xfer_func = V4L2_XFER_FUNC_DEFAULT;
+
+	if (fmt->pixelformat == V4L2_PIX_FMT_JPEG) {
+		fmt->colorspace = V4L2_COLORSPACE_JPEG;
+		fmt->ycbcr_enc = V4L2_MAP_YCBCR_ENC_DEFAULT(fmt->colorspace);
+		fmt->quantization =
+			V4L2_MAP_QUANTIZATION_DEFAULT(false, fmt->colorspace,
+						      fmt->ycbcr_enc);
+		fmt->xfer_func = V4L2_MAP_XFER_FUNC_DEFAULT(fmt->colorspace);
+	} else {
+		fmt->colorspace = V4L2_COLORSPACE_DEFAULT;
+		fmt->ycbcr_enc = V4L2_XFER_FUNC_DEFAULT;
+		fmt->quantization = V4L2_QUANTIZATION_DEFAULT;
+		fmt->xfer_func = V4L2_XFER_FUNC_DEFAULT;
+	}
 }
 
 static void
-- 
2.53.0


