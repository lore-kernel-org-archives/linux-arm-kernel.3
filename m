Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BA78C83F03
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Jul 2025 18:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UmQK8XKnAKLwuCyVIKp6kezWM3/MBv31fAdBf/mvaXs=; b=16FK15iapSkTIxIZxg/S7rihJM
	VNks2mYQB6pzBK4aJHtt/a8jpvZrCl87+dNpu9zGare77hJyrL9BX5j2NWvhzehQZC/nLsrDWBzXA
	zaai2qksMZafTftcJNPZTpHH1xbi15dIv6GmHkvbP8ip89vfAUOwOY9OM/W0GpTYBQDMYkWxH5eK6
	tW8pmpHzXKft8ygt4xjIlzS8Wedg/A1Dd1pw8r+vhmOc0IJEKxMn4UVDv+tQiRVtihJXwr89+eSy9
	SHTLWvJrOqkIKDYfrb6zsJXBBdJ7n36EHcEEJdW/zwOgf520RHl9P2YnhSYvlDH9XOIRlKmrBVfsG
	GCnkC4TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYUaM-00000000gZk-40bO;
	Sun, 06 Jul 2025 18:59:34 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYU68-00000000dUW-1c5W
	for linux-arm-kernel@lists.infradead.org;
	Sun, 06 Jul 2025 18:28:21 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 394C2252CB;
	Sun,  6 Jul 2025 20:28:19 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NKyM3LjktSyw; Sun,  6 Jul 2025 20:28:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1751826498; bh=l4Nuu5usU3hvRSdSwV3bQf/gyHyhMjDbMhpD0WU6O88=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=mZeL7Azx9pvTBO/XZA+C2RRKe4dOY1p97G9izs0EGm5LBZqrFwaPc0Wkev6ftGWUI
	 v8zK0D/VaIeWf9RegwftPWS2HmVyGSdl/LE7Jsc6OwcECpdfwMBu6xHu58n5UKDpRU
	 Ri0DIqkztOP+IGAhj52jFH4ozUNHDBIdmkp7LxiD+aEhkTPylvE3UUvhzIwS4B27fB
	 72/1YRGh1VgQl9UycaGx3Wz9GJnIwoxDlc523j/gcYMf8r59OY57EFVc1mZYaZxJ0s
	 rtDq3HuI2Ru1fjIjkwp9+ADp+C1SbDalCxWlxlU4zwBp3Yy060mpP7J6hdFjCFT6ja
	 0k99907zDMfTw==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Sun, 06 Jul 2025 23:55:47 +0530
Subject: [PATCH v3 13/13] drm/exynos: dsi: add support for exynos7870
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250706-exynos7870-dsim-v3-13-9879fb9a644d@disroot.org>
References: <20250706-exynos7870-dsim-v3-0-9879fb9a644d@disroot.org>
In-Reply-To: <20250706-exynos7870-dsim-v3-0-9879fb9a644d@disroot.org>
To: Inki Dae <inki.dae@samsung.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751826342; l=1284;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=l4Nuu5usU3hvRSdSwV3bQf/gyHyhMjDbMhpD0WU6O88=;
 b=uKy2IIutBFRwXBDbPmTpTTgEzxdiT2/Opbe2OKCOjqx5XHG89DV2J+xbzI2b9Mm/K/8YTadQw
 EknlV+5ZTEyBc+yw2IZyXBw3+87K4K7ojNREnlrUf3mdUjxIKSAKaMd
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250706_112820_555369_C0D6D105 
X-CRM114-Status: GOOD (  10.18  )
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

Add glue layer support for Exynos7870's DSIM IP bridge driver.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index 896a03639e2d9b80971d43aff540fc7fb9f005bd..c4d098ab7863890b2111742c07953c148304e4ec 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -154,6 +154,11 @@ static const struct samsung_dsim_plat_data exynos5433_dsi_pdata = {
 	.host_ops = &exynos_dsi_exynos_host_ops,
 };
 
+static const struct samsung_dsim_plat_data exynos7870_dsi_pdata = {
+	.hw_type = DSIM_TYPE_EXYNOS7870,
+	.host_ops = &exynos_dsi_exynos_host_ops,
+};
+
 static const struct of_device_id exynos_dsi_of_match[] = {
 	{
 		.compatible = "samsung,exynos3250-mipi-dsi",
@@ -175,6 +180,10 @@ static const struct of_device_id exynos_dsi_of_match[] = {
 		.compatible = "samsung,exynos5433-mipi-dsi",
 		.data = &exynos5433_dsi_pdata,
 	},
+	{
+		.compatible = "samsung,exynos7870-mipi-dsi",
+		.data = &exynos7870_dsi_pdata,
+	},
 	{ /* sentinel. */ }
 };
 MODULE_DEVICE_TABLE(of, exynos_dsi_of_match);

-- 
2.49.0


