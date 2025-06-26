Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96C67C7EE33
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 21:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UmQK8XKnAKLwuCyVIKp6kezWM3/MBv31fAdBf/mvaXs=; b=tO0P4Z14SzxLLLOh2Jrpbq7k/j
	4WZsIRB3+0MzucdOuq4KtjHd8ziFrU+DdL9KrlgN5YZFXdZqmUlP/Ky4nVhA/CgDsou9QEv09QdVp
	QZjPuren+c4QM/YOu3hBfoMfI/RgPPAl7KyDxCkksQfkDtEseE7srxoCdyzjRWA/dzRPxvZtnN8ma
	76D8UHhB7vcC9BgkHKjmmt//ZJviNyGKav46CMnJLKMthfogKIm2eLoF62Cd5OFegTTu+2LsTrUx0
	AIOOGrlnIW04UMhpLBLCsbKXhW7hXf415lTSarHwG+S7dbZZ5BNxXN/b9EIMeLHvjt2HXrbkyoAZJ
	ux/6meQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUtvf-0000000CoHf-1tsL;
	Thu, 26 Jun 2025 21:14:43 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUsTv-0000000CcNM-0uBg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 19:42:00 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 0D27125B63;
	Thu, 26 Jun 2025 21:41:58 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OEHH2EbSFcj2; Thu, 26 Jun 2025 21:41:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1750966917; bh=l4Nuu5usU3hvRSdSwV3bQf/gyHyhMjDbMhpD0WU6O88=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Ebgh8tF90SxYheUm/XdL3l3+tUf8vUBXPF3ErugG+gm18/zE2KxQL4wzegTl+SblX
	 16F6td1BGUt0W1cV/unT2a54AdxrzXnnJnmGU8WrrS38bhLVw00F+md5LgHejUNfKF
	 JVmz0jAM3LPscys4ZK9puADwfrM46LaS22h5KC/VZwo/wHmfQl0hW4sDqVjWLblWUF
	 eHlKjCp9Gf5/rJetrUGHEI16VhATSxbbtj5VkGV+M5dOpI58CFOGpp882a0Us1f8NJ
	 I0RmrQi26vVsJldm0CiGOY2kcpSumu2giASUHyZ/3ciWjsFv7Vqt3BMzI93YxZ1C1G
	 f/e17oc0oY8LA==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Fri, 27 Jun 2025 01:09:02 +0530
Subject: [PATCH v2 13/13] drm/exynos: dsi: add support for exynos7870
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250627-exynos7870-dsim-v2-13-1433b67378d3@disroot.org>
References: <20250627-exynos7870-dsim-v2-0-1433b67378d3@disroot.org>
In-Reply-To: <20250627-exynos7870-dsim-v2-0-1433b67378d3@disroot.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750966738; l=1284;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=l4Nuu5usU3hvRSdSwV3bQf/gyHyhMjDbMhpD0WU6O88=;
 b=cmuo+JuT3QMzZHDqDYnGiREXiuNl6V2a1LJCsYS2y5UQKcrN5wI1ZKfhiayYuBYF2UrypP+5V
 p9GshsYm9IyD7GMQtRWhReztr3kMfLpJ+dEqvdjF0sqybYP9335jEqI
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_124159_387126_F4689F10 
X-CRM114-Status: UNSURE (   9.55  )
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


