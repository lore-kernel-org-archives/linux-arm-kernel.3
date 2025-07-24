Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8FD2C87FC5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 08:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DSLukblLESTTAuXw3hygP55JWV94nhT/wWVcn/G+HYU=; b=mXM/eLxSX9RvhjdRtR7zHt1fds
	4B4HXQwbo/r5u2qKjZLmnsmL5dBI+GYL5Tfmsaz0Z2bpHeaoj6eors2qyad9MqPqOJ69s7UvvlbmY
	xMDPd0pttbs4By/bBpaGn5VSSrNpH0u3H6OIODlr5A6OVnxP5Hj9qSGUGP4L6YsAPPzPJlIosqm6O
	LlJ0/oYl+e7mg3r5PYKxlzXUxBzGo3QjSv4lGrr6OXbY35OEnpgEqsgQ8eZWo41L5F7PWWX0NfJ9p
	RtVlxW5vDoSV+mvI8DOd+/m8HK59HpreUXtWw7bAqKoVbi+7hrIC6WXigk4qLK6lIP01EFR1Wmhyd
	eursR/7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uereK-00000006vw5-0qgS;
	Thu, 24 Jul 2025 08:50:00 +0000
Received: from mail-m32101.qiye.163.com ([220.197.32.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueqvc-00000006mvN-1GTw;
	Thu, 24 Jul 2025 08:03:49 +0000
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 1d1c34441;
	Thu, 24 Jul 2025 16:03:42 +0800 (GMT+08:00)
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
Subject: [PATCH v3 11/14] drm/exynos: exynos_dp: Apply analogix_dp_find_panel_or_bridge()
Date: Thu, 24 Jul 2025 16:03:01 +0800
Message-Id: <20250724080304.3572457-12-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250724080304.3572457-1-damon.ding@rock-chips.com>
References: <20250724080304.3572457-1-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a983b75a3c403a3kunmbbba7af2a064
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQhhCQlZISksYHxlNTh0YHR5WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=JRR3A9dhVuInFKflciWmtxeO35JgqAgF/ez+slG/xokgRyhrxYkJ5ol7dtNlFdnPiayM7hTlqaTu7buXs2e6iFoIFEQm9XQNwAjDmKxITAgFQtL6Sv9+hPswAA2wZwEMPo2Zz3NFvLW26eQz3ZP8m5DhXO6yrmdZbcJY/5nsMl0=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=DSLukblLESTTAuXw3hygP55JWV94nhT/wWVcn/G+HYU=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_010348_510834_E238559B 
X-CRM114-Status: GOOD (  10.93  )
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

Apply analogix_dp_find_panel_or_bridge() in order to move the
panel/bridge parsing from Exynos side to the Analogix side.

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
---
 drivers/gpu/drm/exynos/exynos_dp.c | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_dp.c b/drivers/gpu/drm/exynos/exynos_dp.c
index 39dfb7a44c85..c5aa9cc5e2bd 100644
--- a/drivers/gpu/drm/exynos/exynos_dp.c
+++ b/drivers/gpu/drm/exynos/exynos_dp.c
@@ -203,9 +203,6 @@ static int exynos_dp_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct device_node *np;
 	struct exynos_dp_device *dp;
-	struct drm_panel *panel;
-	struct drm_bridge *bridge;
-	int ret;
 
 	dp = devm_kzalloc(&pdev->dev, sizeof(struct exynos_dp_device),
 			  GFP_KERNEL);
@@ -225,32 +222,31 @@ static int exynos_dp_probe(struct platform_device *pdev)
 	if (np) {
 		dp->plat_data.panel = of_drm_find_panel(np);
 
-		of_node_put(np);
 		if (IS_ERR(dp->plat_data.panel))
 			return PTR_ERR(dp->plat_data.panel);
 
 		goto out;
 	}
 
-	ret = drm_of_find_panel_or_bridge(dev->of_node, 0, 0, &panel, &bridge);
-	if (ret)
-		return ret;
-
 	/* The remote port can be either a panel or a bridge */
-	dp->plat_data.panel = panel;
-	dp->plat_data.bridge = bridge;
 	dp->plat_data.dev_type = EXYNOS_DP;
 	dp->plat_data.power_on = exynos_dp_poweron;
 	dp->plat_data.power_off = exynos_dp_poweroff;
 	dp->plat_data.attach = exynos_dp_bridge_attach;
 	dp->plat_data.get_modes = exynos_dp_get_modes;
+	dp->plat_data.ops = &exynos_dp_ops;
 
 out:
 	dp->adp = analogix_dp_probe(dev, &dp->plat_data);
 	if (IS_ERR(dp->adp))
 		return PTR_ERR(dp->adp);
 
-	return component_add(&pdev->dev, &exynos_dp_ops);
+	if (np) {
+		of_node_put(np);
+		return component_add(&pdev->dev, &exynos_dp_ops);
+	} else {
+		return analogix_dp_find_panel_or_bridge(dp->adp);
+	}
 }
 
 static void exynos_dp_remove(struct platform_device *pdev)
-- 
2.34.1


