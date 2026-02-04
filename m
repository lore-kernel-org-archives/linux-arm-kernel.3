Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC25DE9538A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Feb 2026 11:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FVZQyuOKeeoQs6KJA6KjABCakKvgimCjh54B7npz2qw=; b=xpkA3sdlm9ZjFj4NkKYFHO0vZj
	U64TH0i1DdUVB/hVGtA2B2DmzvH1mAJWCwaFtRcebgFjJMs+TtWVyNK7MFn5iybbtyM+Kf8KbKF/B
	mrI9ykVP9hhJ5/Y6wk8bmLiOOQe22Z7IOMxAkGdZb1FxX1otmlrZzytuhKriru9qUb2YHscuTlOfJ
	HXmFLS+BLqoxRR8RpzZ9YoH/GheWuh7itnYbMOwljXKcQ+OiLCOnwsFUs6nXg0HwUamKaZxUAFQ6c
	qsYPyGs97EQzmia06WY9Y1sXs9QvUwR9RrCM9XvbHGOzZBYjkiCAB+eimF51nNpq1s6bcw2aqRnjl
	sVEv5uhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnb6y-00000008Muz-08Jr;
	Wed, 04 Feb 2026 11:31:56 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnb6v-00000008Mua-2igb;
	Wed, 04 Feb 2026 11:31:54 +0000
Received: from t16.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 22DBD1356;
	Wed,  4 Feb 2026 12:24:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1770204273;
	bh=Dvl3Tree0wsEccwQaxwDEFxXPpQC0laXl6e03FgkyEg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bWhK2CM2Ml1myVRfbA2vz9SqyzEkleAq5+dv54lr6FCE59eA2ba+WNfxCeFh0tIQd
	 20C4ugZ3FQcpVnw7Pgv1fg2Sfb8LkQrywxNOotcXAUVuSPBhD6RkebFvIeRJtpzmf7
	 a+0qC8E20QAFhbfnklnTD7N00OOqMEw836bX+K+I=
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
Subject: [PATCH v1 3/6] media: rkisp1-isp: Add target_format
Date: Wed,  4 Feb 2026 11:25:03 +0000
Message-ID: <20260204112506.3706049-4-isaac.scott@ideasonboard.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260204112506.3706049-1-isaac.scott@ideasonboard.com>
References: <20260204112506.3706049-1-isaac.scott@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_033153_825348_79B12313 
X-CRM114-Status: GOOD (  11.10  )
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

In passthough mode, we want to make sure the output format of the ISP is
identical to the input format. Add logic to ensure the format we
configure the output of the ISP with is the sink format when we are in
bypass, and the source format if we are not.

Signed-off-by: Isaac Scott <isaac.scott@ideasonboard.com>
---
 drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
index f636d738b7e8..716bd7f3c66d 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
@@ -175,9 +175,10 @@ static void rkisp1_gasket_disable(struct rkisp1_device *rkisp1)
 static void rkisp1_config_ism(struct rkisp1_isp *isp,
 			      const struct v4l2_subdev_state *sd_state)
 {
-	const struct v4l2_rect *src_crop =
+	const struct v4l2_rect *target_crop =
 		v4l2_subdev_state_get_crop(sd_state,
-					   RKISP1_ISP_PAD_SOURCE_VIDEO);
+			(isp->rkisp1->in_bypass ?
+				RKISP1_ISP_PAD_SINK_VIDEO : RKISP1_ISP_PAD_SOURCE_VIDEO));
 	struct rkisp1_device *rkisp1 = isp->rkisp1;
 	u32 val;
 
@@ -185,10 +186,10 @@ static void rkisp1_config_ism(struct rkisp1_isp *isp,
 	rkisp1_write(rkisp1, RKISP1_CIF_ISP_IS_MAX_DX, 0);
 	rkisp1_write(rkisp1, RKISP1_CIF_ISP_IS_MAX_DY, 0);
 	rkisp1_write(rkisp1, RKISP1_CIF_ISP_IS_DISPLACE, 0);
-	rkisp1_write(rkisp1, RKISP1_CIF_ISP_IS_H_OFFS, src_crop->left);
-	rkisp1_write(rkisp1, RKISP1_CIF_ISP_IS_V_OFFS, src_crop->top);
-	rkisp1_write(rkisp1, RKISP1_CIF_ISP_IS_H_SIZE, src_crop->width);
-	rkisp1_write(rkisp1, RKISP1_CIF_ISP_IS_V_SIZE, src_crop->height);
+	rkisp1_write(rkisp1, RKISP1_CIF_ISP_IS_H_OFFS, target_crop->left);
+	rkisp1_write(rkisp1, RKISP1_CIF_ISP_IS_V_OFFS, target_crop->top);
+	rkisp1_write(rkisp1, RKISP1_CIF_ISP_IS_H_SIZE, target_crop->width);
+	rkisp1_write(rkisp1, RKISP1_CIF_ISP_IS_V_SIZE, target_crop->height);
 
 	/* IS(Image Stabilization) is always on, working as output crop */
 	rkisp1_write(rkisp1, RKISP1_CIF_ISP_IS_CTRL, 1);
-- 
2.43.0


