Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB543CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 09:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aXj5dL9nJmKznyincf9j+qRb85KoDlxzfVaN9v+PGxA=; b=tYxG+VT0nZbPxRmd7Bkai7jJkG
	oiDttIbV3CKIYWJMu4bEr8qyV6p4IDBLTcKSNzu7/anvUvP08vogXz9dQqnTV8nmX5WATOj1pjlNd
	5ExBeRzDKOdIDAt/YCk37jrESNllqKDij5LY+Q64p4thtvTaXHnaHYBbNBOAtxzNn+7eDQsCmpoGx
	+okd6Z8GXRuGlg0gKmJWOGVbzh+bni9dC7y71aOSwaOOwuItoI+v2F27WBd8qfHNanrh+fYGQSzY4
	N3TeQOLJzz+UvHWfrNO50PtUqZ2IFZj1UewyeJJekTZfPZS6U3MXhY5K0c+n3FszR7AGMytUSMP61
	TUY3tLHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMjre-0000000GLCb-3TR0;
	Tue, 12 May 2026 09:57:22 +0000
Received: from mail-m158173.netease.com ([47.251.158.173])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMjrS-0000000GKmr-2xiF;
	Tue, 12 May 2026 09:57:14 +0000
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3e183033b;
	Tue, 12 May 2026 17:57:05 +0800 (GMT+08:00)
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
Subject: [PATCH v4 09/10] drm/bridge: analogix_dp: Add support for RK3576
Date: Tue, 12 May 2026 17:56:43 +0800
Message-Id: <20260512095644.1946084-10-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260512095644.1946084-1-damon.ding@rock-chips.com>
References: <20260512095644.1946084-1-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9e1b9e620203a3kunm05d2ddd612909c
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDHRkYVh9OHR9ITUkZHR1ISlYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pKQk1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=HxrtqNh/99xEuMD7CDGEK2oPI7zdJ9FSKM9SKu0J3aEQyxtZl9/RDHT9g50Ir9Cfp04gWn0Pqm43MV/8WWsM3KRFRq9ETWYnUqnbUECWRB9CJzGK4Vl0iGa9PZfXcW+4MnVBtbGhulA/ti0VwH0s5CJX9wExrgwNtEUDUWdl08M=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=aXj5dL9nJmKznyincf9j+qRb85KoDlxzfVaN9v+PGxA=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_025713_250406_1840E51A 
X-CRM114-Status: UNSURE (   8.24  )
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

Add RK3576_EDP device type entry and extend Rockchip check
to match existing hardware capabilities shared with RK3588.

Set identical maximum link rate and lane count parameters
for RK3576 eDP controller to reuse existing RK3588 config.

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Damon Ding <damon.ding@rock-chips.com>

---

Changes in v3:
- Add Reviewed-by tag.

Changes in v4:
- Modify the commit msg.
---
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 1 +
 include/drm/bridge/analogix_dp.h                   | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index d45c81c1d77a..0ff1b4a70e70 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -1249,6 +1249,7 @@ static int analogix_dp_dt_parse_pdata(struct analogix_dp_device *dp)
 		video_info->max_link_rate = 0x0A;
 		video_info->max_lane_count = 0x04;
 		break;
+	case RK3576_EDP:
 	case RK3588_EDP:
 		video_info->max_link_rate = 0x14;
 		video_info->max_lane_count = 0x04;
diff --git a/include/drm/bridge/analogix_dp.h b/include/drm/bridge/analogix_dp.h
index 7b670dd769e9..0e0b87abee59 100644
--- a/include/drm/bridge/analogix_dp.h
+++ b/include/drm/bridge/analogix_dp.h
@@ -16,6 +16,7 @@ enum analogix_dp_devtype {
 	EXYNOS_DP,
 	RK3288_DP,
 	RK3399_EDP,
+	RK3576_EDP,
 	RK3588_EDP,
 };
 
@@ -24,6 +25,7 @@ static inline bool analogix_dp_is_rockchip(enum analogix_dp_devtype type)
 	switch (type) {
 	case RK3288_DP:
 	case RK3399_EDP:
+	case RK3576_EDP:
 	case RK3588_EDP:
 		return true;
 	default:
-- 
2.34.1


