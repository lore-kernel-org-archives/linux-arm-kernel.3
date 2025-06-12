Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 403EDC71151
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 22:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UmQK8XKnAKLwuCyVIKp6kezWM3/MBv31fAdBf/mvaXs=; b=Njwk9RuOMc2NUR70l+UV1PKmz+
	g7opyWD9ObmNkhYcdVzrXmhgCIk5mBTVttEvOuq4YHo+LlaLwJ6mpqReKfPN2JqbpVeAhyXtcHO3S
	GCkXtbBj1lUK3s189+pqMn4cdEHuOzrS2dTNz32Vm7jJB7O/Y0mP0qwevQD/vcdFdV8nRDlo7cZYi
	BSAWykenNCoWJ6cpkKV6ysHuA0mNU6J2+BvcYFHFBvA247RB36itHvqua6UwOYqd3DILn26CHjQMc
	7XvRfzXCVd3yneZNCBDHY1oqCtMMKNe9VxYbFpzvbJoj/JlzBJCq+Alr7f+EWHgek+QnMeMNljk3l
	bkeGCoWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPq73-0000000EjHs-1mgb;
	Thu, 12 Jun 2025 22:09:33 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPjj7-0000000Dlb5-1PyK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 15:20:26 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 324B22609A;
	Thu, 12 Jun 2025 17:20:24 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hPNr3ZLvaQWh; Thu, 12 Jun 2025 17:20:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1749741622; bh=l4Nuu5usU3hvRSdSwV3bQf/gyHyhMjDbMhpD0WU6O88=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=kFFFIFT0+KQGlDZejDKTYu8pW3aBpvHIFYD3tycWyjxc2ZRDJADepxWPL/soNwGtF
	 YTIBgsTn3YHbaEU+Ld+MPx0R4YMy3PH6Oz1fbyHDI+Qi5hp62cL7FQTxkPa1cZZHjl
	 TjrLpM+bnVO8ib6iKBvYZjNRaXmFdwB7ocMvIw7Yi3bEePdtYhN4HGFmu9YVCWKUdm
	 srZsPbe1hQRI3TncwrLTLbyaXiDnprEUsJoLVA+rWz73zR/tLAoj1ftlVCt7XHqttM
	 21ACTYm34CF5ilIasRLvJlMAn0mGaNZRaonpwcQdysr29jG7YMY3ZFdci/RFIG0/AB
	 L3AL9XThmSkOQ==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Thu, 12 Jun 2025 20:48:16 +0530
Subject: [PATCH 12/12] drm/exynos: dsi: add support for exynos7870
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-exynos7870-dsim-v1-12-1a330bca89df@disroot.org>
References: <20250612-exynos7870-dsim-v1-0-1a330bca89df@disroot.org>
In-Reply-To: <20250612-exynos7870-dsim-v1-0-1a330bca89df@disroot.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749741499; l=1284;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=l4Nuu5usU3hvRSdSwV3bQf/gyHyhMjDbMhpD0WU6O88=;
 b=lQbb3yX2weNNjAz5shqRd54kvetuaJZEBMG9UE72Vk906suF41Yeq3NuuzkpDG0MGcm2nHTu5
 IA3fIU8kjM8C4lj/pkCLcMAqHYPccUrTi1UHBh/kqOgTtmjZu0+Y0If
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_082025_508137_D04E2FC6 
X-CRM114-Status: UNSURE (   9.63  )
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


