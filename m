Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CDCACA0EE6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Aug 2025 15:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Huwtfl/4DY7+Ye0RBesZOhBs/hvliM0EJhdOv++XHys=; b=BaHzN1LwAdBAGheeMT9oS/D/27
	EQwJNH50AFqOYGbwPV+ZJfUnpcEl2S8ncK3pLkM8iKSBTUVqHd6qaWPfi2CnD+s8foJs0UDHhgX1e
	BlSCNdy7RJns7Szr1B6Lm/vUnKfevIjHSvn84DxCFRz/dp3Q7DK9bjK7ix8UbEVre7qKsh9fOj4J8
	QR+2PIklFc26P/wnQJEm+fYBDzt6Y2zIFXw+Byve7tTJBcJ230HJ7foy3Ef2SqrZBK32HzKHeaD2G
	P8fKQvKC/hwCX57GYBSERZnz7dv38RLbvSH7q2mWrciizPOKAv7TrZcBR92cocfwCUf01+e3f2zmo
	2w4PBR3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uma0V-0000000HSwi-23SF;
	Thu, 14 Aug 2025 15:36:47 +0000
Received: from mail-m49194.qiye.163.com ([45.254.49.194])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umVVR-0000000GeTs-2Eb2;
	Thu, 14 Aug 2025 10:48:27 +0000
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 1f63a9a3e;
	Thu, 14 Aug 2025 18:48:21 +0800 (GMT+08:00)
From: Damon Ding <damon.ding@rock-chips.com>
To: andrzej.hajda@intel.com,
	neil.armstrong@linaro.org,
	rfoss@kernel.org
Cc: Laurent.pinchart@ideasonboard.com,
	jonas@kwiboo.se,
	jernej.skrabec@gmail.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	jingoohan1@gmail.com,
	inki.dae@samsung.com,
	sw0312.kim@samsung.com,
	kyungmin.park@samsung.com,
	krzk@kernel.org,
	alim.akhtar@samsung.com,
	hjc@rock-chips.com,
	heiko@sntech.de,
	andy.yan@rock-chips.com,
	dmitry.baryshkov@oss.qualcomm.com,
	l.stach@pengutronix.de,
	dianders@chromium.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Damon Ding <damon.ding@rock-chips.com>
Subject: [PATCH v4 11/13] drm/bridge: analogix_dp: Remove panel disabling and enabling in analogix_dp_set_bridge()
Date: Thu, 14 Aug 2025 18:47:51 +0800
Message-Id: <20250814104753.195255-12-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250814104753.195255-1-damon.ding@rock-chips.com>
References: <20250814104753.195255-1-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a98a831ee1603a3kunm254826283f231c
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGkhJTFZNGkkeTE4aQk5NHkNWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=A8PJRmizdGZSNeaM+eeA/IVHBRk6YpZ9DGXrJXfPDL8/2fKJxC+68H7df/id++2R/FI3d3RuPsd7UKlF3+dhNhEdK5scLUhltjMgXVnMHSuG492Ul+Cp5CwRIGFTB1PnbAvASh+kzGdMtA04pgQp3EYLXHUTPN+0eLCbvybKe2o=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=Huwtfl/4DY7+Ye0RBesZOhBs/hvliM0EJhdOv++XHys=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_034825_737730_3A4D92CA 
X-CRM114-Status: GOOD (  10.75  )
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

The &drm_panel_funcs.enable() and &drm_panel_funcs.disable() mainly
help turn on/off the backlight to make the image visible, and the
backlight operations are even needless if drm_panel_of_backlight() or
drm_panel_dp_aux_backlight() is applied, in which case the enabling
and disabling process just add necessary delays.

Therefore, it should make sense to remove panel disabling and move
panel enabling after analogix_dp_set_bridge() finished.

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
---
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index 3e76a7b7d227..3c518106b896 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -840,9 +840,6 @@ static int analogix_dp_commit(struct analogix_dp_device *dp)
 {
 	int ret;
 
-	/* Keep the panel disabled while we configure video */
-	drm_panel_disable(dp->plat_data->panel);
-
 	ret = analogix_dp_train_link(dp);
 	if (ret) {
 		dev_err(dp->dev, "unable to do link train, ret=%d\n", ret);
@@ -862,9 +859,6 @@ static int analogix_dp_commit(struct analogix_dp_device *dp)
 		return ret;
 	}
 
-	/* Safe to enable the panel now */
-	drm_panel_enable(dp->plat_data->panel);
-
 	/* Check whether panel supports fast training */
 	ret = analogix_dp_fast_link_train_detection(dp);
 	if (ret)
@@ -1242,6 +1236,7 @@ static void analogix_dp_bridge_atomic_enable(struct drm_bridge *bridge,
 	while (timeout_loop < MAX_PLL_LOCK_LOOP) {
 		if (analogix_dp_set_bridge(dp) == 0) {
 			dp->dpms_mode = DRM_MODE_DPMS_ON;
+			drm_panel_enable(dp->plat_data->panel);
 			return;
 		}
 		dev_err(dp->dev, "failed to set bridge, retry: %d\n",
-- 
2.34.1


