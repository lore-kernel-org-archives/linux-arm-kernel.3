Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6565FC021B3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 08:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vgd7kb8mZG5iqBZAAJsgDY5DJrBDvPkKiHw4gHmVklI=; b=216FWBF89Fl4+LI3rdc1F8hlga
	AgM83tfBORmH9eyzfKl12sLcG07WuN03aXXZP98bvykNBkq0DWSwxaU0gdxsE2uxvg6pv8cTYLKGC
	L6b8bhrwjhumTkWG/wj8cUgtZ3HTzIDAPAWu0O37MC3lK7qP1p7A2EUFKVq+yyEOAZKxYn8Qj4Sg4
	cycvLG7jWDNSzTO0VD9OPnniA+klMybJgoJz9h1PdZBqi5wL/UQk+f3RmxKdQmfLJ76QeM4tcYtRp
	XfT3sjPD16g36SuZTCv/8XEMtC1k042/ozN6O5Ak8GAwKXOTigaUAoz+5GsDjcFhWw0ldh7z1jSiz
	9BzRg4gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmTgk-0000000Cf9y-2GY9;
	Mon, 24 Feb 2025 08:19:42 +0000
Received: from mail-m1973191.qiye.163.com ([220.197.31.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmTbN-0000000Ce7X-2vah;
	Mon, 24 Feb 2025 08:14:11 +0000
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id bfd287cf;
	Mon, 24 Feb 2025 16:14:05 +0800 (GMT+08:00)
From: Damon Ding <damon.ding@rock-chips.com>
To: heiko@sntech.de
Cc: andy.yan@rock-chips.com,
	hjc@rock-chips.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andrzej.hajda@intel.com,
	neil.armstrong@linaro.org,
	rfoss@kernel.org,
	Laurent.pinchart@ideasonboard.com,
	jonas@kwiboo.se,
	jernej.skrabec@gmail.com,
	dmitry.baryshkov@linaro.org,
	dianders@chromium.org,
	sebastian.reichel@collabora.com,
	cristian.ciocaltea@collabora.com,
	boris.brezillon@collabora.com,
	l.stach@pengutronix.de,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Damon Ding <damon.ding@rock-chips.com>
Subject: [PATCH v7 05/15] drm/bridge: analogix_dp: Remove CONFIG_PM related check in analogix_dp_bind()/analogix_dp_unbind()
Date: Mon, 24 Feb 2025 16:13:15 +0800
Message-Id: <20250224081325.96724-6-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250224081325.96724-1-damon.ding@rock-chips.com>
References: <20250224081325.96724-1-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQ0xIGVZPTU5KTUlKH09NHxpWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
X-HM-Tid: 0a9537053eb103a3kunmbfd287cf
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PEk6Gjo*KjIPGRMpTT5MESxN
	Oj0wCThVSlVKTE9LSENPQ09MTktJVTMWGhIXVR8aFhQVVR8SFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFJT0hCNwY+
DKIM-Signature: a=rsa-sha256;
	b=FfzbuSfUNP7JJ8R/A4rLu+KWBIVDERHVFuO1z5DJ7UKuIA2rA5QnXRTk8pjFakMy182Ybwsz1BS0LO0utakFpidywZqWcVw8uvIrIjRA2y/bvdpqW37+mSr6RfqSXhZMFe5583y9V52ySrvxXALmu/75yS4quK/ptkmX32g+ilo=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=Vgd7kb8mZG5iqBZAAJsgDY5DJrBDvPkKiHw4gHmVklI=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_001409_900903_8F835E92 
X-CRM114-Status: UNSURE (   9.29  )
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

Remove the check related to CONFIG_PM in order to make the code more
concise, as the CONFIG_PM should be a required option for many drivers.

In addition, it is preferable to use devm_pm_runtime_enable() instead of
manually invoking pm_runtime_enable() followed by pm_runtime_disable().

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
---
 .../drm/bridge/analogix/analogix_dp_core.c    | 30 ++++---------------
 1 file changed, 6 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index d9dafb038e7a..174e7011bba9 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -1698,15 +1698,11 @@ int analogix_dp_bind(struct analogix_dp_device *dp, struct drm_device *drm_dev)
 	dp->drm_dev = drm_dev;
 	dp->encoder = dp->plat_data->encoder;
 
-	if (IS_ENABLED(CONFIG_PM)) {
-		pm_runtime_use_autosuspend(dp->dev);
-		pm_runtime_set_autosuspend_delay(dp->dev, 100);
-		pm_runtime_enable(dp->dev);
-	} else {
-		ret = analogix_dp_resume(dp);
-		if (ret)
-			return ret;
-	}
+	pm_runtime_use_autosuspend(dp->dev);
+	pm_runtime_set_autosuspend_delay(dp->dev, 100);
+	ret = devm_pm_runtime_enable(dp->dev);
+	if (ret)
+		return ret;
 
 	dp->aux.name = "DP-AUX";
 	dp->aux.transfer = analogix_dpaux_transfer;
@@ -1716,7 +1712,7 @@ int analogix_dp_bind(struct analogix_dp_device *dp, struct drm_device *drm_dev)
 	ret = drm_dp_aux_register(&dp->aux);
 	if (ret) {
 		DRM_ERROR("failed to register AUX (%d)\n", ret);
-		goto err_disable_pm_runtime;
+		return ret;
 	}
 
 	ret = analogix_dp_create_bridge(drm_dev, dp);
@@ -1729,13 +1725,6 @@ int analogix_dp_bind(struct analogix_dp_device *dp, struct drm_device *drm_dev)
 
 err_unregister_aux:
 	drm_dp_aux_unregister(&dp->aux);
-err_disable_pm_runtime:
-	if (IS_ENABLED(CONFIG_PM)) {
-		pm_runtime_dont_use_autosuspend(dp->dev);
-		pm_runtime_disable(dp->dev);
-	} else {
-		analogix_dp_suspend(dp);
-	}
 
 	return ret;
 }
@@ -1752,13 +1741,6 @@ void analogix_dp_unbind(struct analogix_dp_device *dp)
 	}
 
 	drm_dp_aux_unregister(&dp->aux);
-
-	if (IS_ENABLED(CONFIG_PM)) {
-		pm_runtime_dont_use_autosuspend(dp->dev);
-		pm_runtime_disable(dp->dev);
-	} else {
-		analogix_dp_suspend(dp);
-	}
 }
 EXPORT_SYMBOL_GPL(analogix_dp_unbind);
 
-- 
2.34.1


