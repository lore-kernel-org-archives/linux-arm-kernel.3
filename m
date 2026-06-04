Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23E12CD6E72
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 08:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vaAgRgvYs/017HC0NYlZCsyPo5zWTchBewVBuZZwOnY=; b=F45/cn9ONUof2SNJNE79AnZy0c
	lZj4ymv+kI6572VWTKBmyyPvHIOyj7F8/PP4/+mQJBshoEvmN/80os8OkTHkrkpMKEhIjMHizOuLt
	MXsrZzKJbg16TmwNvrGa8/Ngs2NWwGBbjHGk7vWLgvCvTT5cUjTRwLbpK8lpqS8JEfV4DpkbnbAPO
	33LdIMhwG5EKnVPOabPmsWU4omHOIHLSUjxKawdcpmOnJYQ2jYwwqPWnF3S3d/1DR66Ji/iQ/DKtK
	T49g4OevLZiSxVKDpTlb3DFXB8EwUburQtousayM46Zh9VINaSaaIMl+x2MnXU5/8MhlUuGCHgdNL
	2HZY1/HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV3pQ-0000000GQls-0d4S;
	Thu, 04 Jun 2026 08:53:28 +0000
Received: from mail-m128114.netease.com ([103.209.128.114])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV3pM-0000000GQjg-2GT1;
	Thu, 04 Jun 2026 08:53:26 +0000
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 410f6c9e1;
	Thu, 4 Jun 2026 16:53:18 +0800 (GMT+08:00)
From: Damon Ding <damon.ding@rock-chips.com>
To: hjc@rock-chips.com,
	heiko@sntech.de,
	andy.yan@rock-chips.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andrzej.hajda@intel.com,
	neil.armstrong@linaro.org,
	rfoss@kernel.org
Cc: Laurent.pinchart@ideasonboard.com,
	jonas@kwiboo.se,
	jernej.skrabec@gmail.com,
	nicolas.frattaroli@collabora.com,
	cristian.ciocaltea@collabora.com,
	sebastian.reichel@collabora.com,
	dmitry.baryshkov@oss.qualcomm.com,
	luca.ceresoli@bootlin.com,
	dianders@chromium.org,
	m.szyprowski@samsung.com,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Damon Ding <damon.ding@rock-chips.com>
Subject: [PATCH v5 3/4] drm/bridge: analogix_dp: Add validation for samsung,lane-count property
Date: Thu,  4 Jun 2026 16:52:19 +0800
Message-Id: <20260604085220.2862986-4-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260604085220.2862986-1-damon.ding@rock-chips.com>
References: <20260604085220.2862986-1-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9e91d6412703a8kunm52a01cd040991a
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZGBkZVhoZHRoZGhoZT0kdTFYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pKQk1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=XtPIphHOd4WY525UFfi7R/qd8U3GUq0V/Ubr7gaGIlz2bVDf7f/pMZllG+LxW4NF2ANz9s05SHwrfTo6kD492++QiWV5Ra8BKRB3tX4f3Puj8wJjhPvWRng2xd5xunDN7qmzajTkKlrX4cuSw4UNnZxbJE1+HDS+0zt+Zczn5uQ=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=vaAgRgvYs/017HC0NYlZCsyPo5zWTchBewVBuZZwOnY=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_015325_147060_C555D5E1 
X-CRM114-Status: UNSURE (   8.41  )
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

Add validity check for samsung,lane-count to ensure DT-provided
lane count values are specification-compliant.

Suggested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Damon Ding <damon.ding@rock-chips.com>

---

Changes in v5:
- Apply DRM DP helper API to check the validity of DP lane count.
---
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index 5dc07ff84cd3..9300b0db8785 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -1238,6 +1238,7 @@ static int analogix_dp_dt_parse_pdata(struct analogix_dp_device *dp)
 {
 	struct device_node *dp_node = dp->dev->of_node;
 	struct video_info *video_info = &dp->video_info;
+	int ret;
 
 	switch (dp->plat_data->dev_type) {
 	case RK3288_DP:
@@ -1261,8 +1262,11 @@ static int analogix_dp_dt_parse_pdata(struct analogix_dp_device *dp)
 		 */
 		of_property_read_u32(dp_node, "samsung,link-rate",
 				     &video_info->max_link_rate);
-		of_property_read_u32(dp_node, "samsung,lane-count",
-				     &video_info->max_lane_count);
+		ret = of_property_read_u32(dp_node, "samsung,lane-count",
+					   &video_info->max_lane_count);
+		if (ret || !drm_dp_lane_count_is_valid(video_info->max_lane_count))
+			return dev_err_probe(dp->dev, ret ? ret : -EINVAL,
+					     "failed to parse samsung,lane-count\n");
 		break;
 	}
 
-- 
2.34.1


