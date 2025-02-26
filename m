Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98257C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 19:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yu6LinJTyzuJW7G5SJXuAT7ANVclr3M1Oc0kVcIQ2BI=; b=fr1TIcUjKqPHtX5JAuJ6h8Uta7
	PBtAYvOaaVJCxJI5Xo4al7ZN41ynqTrpRwHKCs6NknEwGmCUB9zRmq0916tC1CKQQ0CioC+SdSWjq
	oZ7zOYyJ7t5bLruM7qkV5zEVPetEA14Pcmy3vlIYcKTledgPVhDyfb36QIDH+9Y21WF5FOD1QgjZz
	4CIkvwduvnVeBrI9zumHweLsqI8sWNEOeE0r+Ss18GmdaYt7X+MJ7XW1mL9/TkGoqYMiqL8wrMo/G
	N04+d1Y87MxFSjpETFvkVs25aL2phaoaO7TxncsVlpIdD7VunDMHYXIiynIXJyem9qY3uA9EDSvtJ
	dly7tO9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnN5p-000000059eb-0X1d;
	Wed, 26 Feb 2025 19:29:17 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnN4H-000000059JL-0TXF;
	Wed, 26 Feb 2025 19:27:42 +0000
Received: from ideasonboard.com (unknown [IPv6:2a00:6020:448c:6c00:2b29:76dc:a5a9:647c])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 92A9C49E;
	Wed, 26 Feb 2025 20:26:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1740597968;
	bh=TR7F1RtqVngJgjrbPnHgmwGaX8T2VMKYSMSpMKAAPlE=;
	h=From:To:Cc:Subject:Date:From;
	b=NW8lxxvDmzfPYMXpgDSCd6IHHfUuXIIuesoKkEjM/CbPFSewuNBLXD2Ac6G4j/+ew
	 Hg/pFr74tx67Rjt5r7WVNu3NLh/jjThLjdQ/lqtCRYThnm5hfSExf/UFMyKHXBAHNY
	 RlF/Q/CmwML/jQGYJLlZPFuU7l/PlcwhAfIYdI9Q=
From: Stefan Klug <stefan.klug@ideasonboard.com>
To: libcamera-devel@lists.libcamera.org,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Paul Elder <paul.elder@ideasonboard.com>,
	Dafna Hirschfeld <dafna@fastmail.com>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Stefan Klug <stefan.klug@ideasonboard.com>,
	Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH] media: rkisp1: Apply full quantization when color space JPEG is requested
Date: Wed, 26 Feb 2025 20:23:53 +0100
Message-ID: <20250226192413.2903243-1-stefan.klug@ideasonboard.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_112741_468895_AF0EE5A6 
X-CRM114-Status: GOOD (  12.03  )
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

When color space V4L2_COLORSPACE_JPEG is requested the ISP incorrectly
sets the output quantization to V4L2_QUANTIZATION_LIM_RANGE. Fix that by
applying the default quantization for the requested color space.

Fixes: c1ec5efba080 ("media: rkisp1: Allow setting all color space fields on ISP source pad")
Signed-off-by: Stefan Klug <stefan.klug@ideasonboard.com>
---
 drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
index d94917211828..98635d875ac4 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
@@ -646,7 +646,7 @@ static void rkisp1_isp_set_src_fmt(struct rkisp1_isp *isp,
 
 	/*
 	 * Copy the color space for the sink pad. When converting from Bayer to
-	 * YUV, default to a limited quantization range.
+	 * YUV, default to the default quantization range of the color space.
 	 */
 	src_fmt->colorspace = sink_fmt->colorspace;
 	src_fmt->xfer_func = sink_fmt->xfer_func;
@@ -654,7 +654,8 @@ static void rkisp1_isp_set_src_fmt(struct rkisp1_isp *isp,
 
 	if (sink_info->pixel_enc == V4L2_PIXEL_ENC_BAYER &&
 	    src_info->pixel_enc == V4L2_PIXEL_ENC_YUV)
-		src_fmt->quantization = V4L2_QUANTIZATION_LIM_RANGE;
+		src_fmt->quantization = V4L2_MAP_QUANTIZATION_DEFAULT(
+			false, sink_fmt->colorspace, sink_fmt->ycbcr_enc);
 	else
 		src_fmt->quantization = sink_fmt->quantization;
 
-- 
2.43.0


