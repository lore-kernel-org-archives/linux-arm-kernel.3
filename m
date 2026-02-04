Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C859BE9537B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Feb 2026 11:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ocGPMfy53H8ZoJl2+HSfpJHlssgDH3KAbSEcxXMr1k8=; b=fjRu4lr4uV94pRGNX3CrbCoW6q
	ePExoM6aMpoBntoCwytHw98MOsp15tV2o7U91ziAzupqk6wCfE2YXrUkdbknqEHCUUI5sfUJYkpSG
	BKIYXZY4BbTzin6WVEqACs81U5tT42Ehhnr/PxrFg1It0ADyPX4t6+pYTXKSwy1JrE+H5AhF+QHtN
	kx7LgObB3cgjsuA1p15qH5JbtefECSBn4SbyVtJziSDad7Izy2C+QcEnu8OywGST9LFlh9QhyYQW5
	63BTMKzMXBUN644lLmDk1R+Cebvi8xdUqS/hKd+MkRU9Yrrnr1B9/qDu/ifhtJYlLBn6lRYX11cA7
	ymlxt4cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnb0Z-00000008M0E-05Un;
	Wed, 04 Feb 2026 11:25:19 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnb0V-00000008Lyp-4Ane;
	Wed, 04 Feb 2026 11:25:17 +0000
Received: from t16.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5E1B210C4;
	Wed,  4 Feb 2026 12:24:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1770204271;
	bh=iclPN213YkwPa7GEz0O6Lo/r6Ez5c+6GrJlnrVg1GZ0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=I9Ba2pMZwtZSybtnMEdOBP0t/mo3fP4PY8d9Lo3MRnP9uOIzMtjSE+VRC8lzugVDT
	 LMH6Feh3sZoewAhb1udhgHhos9uggsP6Kc75OKE9y6yCADp8Vcuej5tOCt5bru85Q2
	 6kCFBVxhvfnSovc2XGyIZc5ggDjyX8MZgB1fNt6o=
From: Isaac Scott <isaac.scott@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: dafna@fastmail.com,
	laurent.pinchart@ideasonboard.com,
	mchehab@kernel.org,
	heiko@sntech.de,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Isaac Scott <isaac.scott@ideasonboard.com>
Subject: [PATCH v1 1/6] media: rkisp1-resizer: Add YUV source formats to resizer
Date: Wed,  4 Feb 2026 11:25:01 +0000
Message-ID: <20260204112506.3706049-2-isaac.scott@ideasonboard.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260204112506.3706049-1-isaac.scott@ideasonboard.com>
References: <20260204112506.3706049-1-isaac.scott@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_032516_229223_33868363 
X-CRM114-Status: GOOD (  10.78  )
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

To be able to use YUV bypass, YUV formats need to be available on the
source pad of the rkisp1 resizer. Add them.

Signed-off-by: Isaac Scott <isaac.scott@ideasonboard.com>
---
 .../platform/rockchip/rkisp1/rkisp1-resizer.c     | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c
index 8e6b753d3081..e72b76ab078c 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c
@@ -23,11 +23,26 @@ struct rkisp1_rsz_yuv_mbus_info {
 };
 
 static const struct rkisp1_rsz_yuv_mbus_info rkisp1_rsz_yuv_src_formats[] = {
+	{
+		.mbus_code	= MEDIA_BUS_FMT_UYVY8_2X8, /* YUV422 */
+		.hdiv		= 1,
+		.vdiv		= 1,
+	},
+	{
+		.mbus_code	= MEDIA_BUS_FMT_VYUY8_2X8, /* YUV422 */
+		.hdiv		= 1,
+		.vdiv		= 1,
+	},
 	{
 		.mbus_code	= MEDIA_BUS_FMT_YUYV8_2X8, /* YUV422 */
 		.hdiv		= 2,
 		.vdiv		= 1,
 	},
+	{
+		.mbus_code	= MEDIA_BUS_FMT_YVYU8_2X8, /* YUV422 */
+		.hdiv		= 1,
+		.vdiv		= 1,
+	},
 	{
 		.mbus_code	= MEDIA_BUS_FMT_YUYV8_1_5X8, /* YUV420 */
 		.hdiv		= 2,
-- 
2.43.0


