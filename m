Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00490CCA471
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Sep 2025 09:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KbUbVcaxHsDbinq3DDlKk9JTAxSfMpaMBboDLYCmXWc=; b=FSarkcJui7RiDAE/K3l9GYNdk0
	u1D+6CW3znpjrX90vdmhew9WW8+AmDOCNUi/yMLSM5+wNLXV8pSqUD6Dau52ECFW7lUFcYJm1Kp1h
	ZvE9pfWK70WkKkQ2Pmrzou2w+JCgM4XrDelEVhP+UhyU+ihHYlyL37feLtDj7UmYPWCUUxFmDvZb2
	BeF5z9L8C7slPje7VO7FtdSvueoUs4hUhespJhdG9A2bFiCEbYSx0yCQFsC2PilYSrWKOibkzAHpG
	mQhYp+KvK5VUCYeq2hxgIlQlb8HtzZoeehC9jNUkFp/OpSrRNhhJi2zKX2hNIgbGV12Dm/QKOHOXm
	2HPJ9Gvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3WtC-00000004thZ-2mRt;
	Tue, 30 Sep 2025 09:43:18 +0000
Received: from mail-m15593.qiye.163.com ([101.71.155.93])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3Wsu-00000004tVS-30ZI;
	Tue, 30 Sep 2025 09:43:02 +0000
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2494f4fcb;
	Tue, 30 Sep 2025 17:42:56 +0800 (GMT+08:00)
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
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	inki.dae@samsung.com,
	sw0312.kim@samsung.com,
	kyungmin.park@samsung.com,
	krzk@kernel.org,
	alim.akhtar@samsung.com,
	jingoohan1@gmail.com,
	p.zabel@pengutronix.de,
	hjc@rock-chips.com,
	heiko@sntech.de,
	andy.yan@rock-chips.com,
	dmitry.baryshkov@oss.qualcomm.com,
	dianders@chromium.org,
	m.szyprowski@samsung.com,
	luca.ceresoli@bootlin.com,
	jani.nikula@intel.com,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Damon Ding <damon.ding@rock-chips.com>
Subject: [PATCH v6 15/18] drm/exynos: exynos_dp: Apply analogix_dp_finish_probe()
Date: Tue, 30 Sep 2025 17:42:48 +0800
Message-Id: <20250930094251.131314-2-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250930094251.131314-1-damon.ding@rock-chips.com>
References: <20250930094251.131314-1-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a999a00ed0203a3kunm8f77df7e445b57
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQh5PS1ZCQ0sYQkpNHUIdHkJWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpKQk
	1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=NopgfgXCxW8PLjq2AOjbHItdSI3vjKsDrmMy1xzLL3nlCrhHQMea38UzzBNXIm11WqO4oP6qCY6QShrOn7FLkAaqRd8zWVQ3Pycz5bGkliTSb/SVaULRrG7PC7cLPYG6D2VMpSJ8zxBGpJDe47X/s57i4qnTKlof2zBV7zSpZNY=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=KbUbVcaxHsDbinq3DDlKk9JTAxSfMpaMBboDLYCmXWc=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_024300_936395_2B05B9EF 
X-CRM114-Status: GOOD (  10.46  )
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

Apply analogix_dp_finish_probe() in order to move the panel/bridge
parsing from Exynos side to the Analogix side.

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>

---

Changes in v4:
- Rename analogix_dp_find_panel_or_bridge() to
  analogix_dp_finish_probe().
---
 drivers/gpu/drm/exynos/exynos_dp.c | 17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_dp.c b/drivers/gpu/drm/exynos/exynos_dp.c
index e767ac506515..1c189b5d2b63 100644
--- a/drivers/gpu/drm/exynos/exynos_dp.c
+++ b/drivers/gpu/drm/exynos/exynos_dp.c
@@ -170,9 +170,6 @@ static int exynos_dp_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct device_node *np;
 	struct exynos_dp_device *dp;
-	struct drm_panel *panel;
-	struct drm_bridge *bridge;
-	int ret;
 
 	dp = devm_kzalloc(&pdev->dev, sizeof(struct exynos_dp_device),
 			  GFP_KERNEL);
@@ -199,26 +196,22 @@ static int exynos_dp_probe(struct platform_device *pdev)
 		goto out;
 	}
 
-	ret = drm_of_find_panel_or_bridge(dev->of_node, 0, 0, &panel, &bridge);
-	if (ret == -ENODEV)
-		ret = exynos_dp_legacy_bridge_init(dp, &bridge);
-	if (ret)
-		return ret;
-
 	/* The remote port can be either a panel or a bridge */
-	dp->plat_data.panel = panel;
-	dp->plat_data.next_bridge = bridge;
 	dp->plat_data.dev_type = EXYNOS_DP;
 	dp->plat_data.power_on = exynos_dp_poweron;
 	dp->plat_data.power_off = exynos_dp_poweroff;
 	dp->plat_data.attach = exynos_dp_bridge_attach;
+	dp->plat_data.ops = &exynos_dp_ops;
 
 out:
 	dp->adp = analogix_dp_probe(dev, &dp->plat_data);
 	if (IS_ERR(dp->adp))
 		return PTR_ERR(dp->adp);
 
-	return component_add(&pdev->dev, &exynos_dp_ops);
+	if (np || !exynos_dp_legacy_bridge_init(dp, &dp->plat_data.next_bridge))
+		return component_add(&pdev->dev, &exynos_dp_ops);
+	else
+		return analogix_dp_finish_probe(dp->adp);
 }
 
 static void exynos_dp_remove(struct platform_device *pdev)
-- 
2.34.1


