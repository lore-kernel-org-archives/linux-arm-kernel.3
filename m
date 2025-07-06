Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5B0CC83F09
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Jul 2025 18:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X12F07WXf+2jQkumEeYO0pJOs2eo8NZkuTKM8IZIZYU=; b=O81HbXjU9V2K5nXPJReRzU88Q4
	evVqIhaIXQTsFIIhBNLADpk1+Ol4QfUobMr899lI/IrnP3OvD5jRD9snJZ8Uu1bZ91wBrtcUXlcGa
	6hAVYwQDv/HnaivPA3mvBekxGk6EGXfvP7s/uc39KEy8Ae82S0gtIHptAaYCsZdNtmK0r5cO91wrR
	kgdO3J9M1xNrAzUfYgFgT75OHnVUUO5z5YCoVP11EnRBPf5zneOf5y8o/g9uGCe48roTK5JlfD5+0
	DmRD67zJoJS9Gy/aLBVnnEu1EYO2ykSiSYeTtK8HeG9X/x3mPfIbk5+3eub8A4qI8ynBDebKoRnVo
	MEUWkTnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYUOm-00000000fMT-0kPc;
	Sun, 06 Jul 2025 18:47:36 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYU5B-00000000dER-2Gpq
	for linux-arm-kernel@lists.infradead.org;
	Sun, 06 Jul 2025 18:27:22 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 47B6025C79;
	Sun,  6 Jul 2025 20:27:20 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id spAyo9RSzySy; Sun,  6 Jul 2025 20:27:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1751826439; bh=T0VIq57CdMsuApiqUpsp/pDwUjngV96YO/wTX94idkA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=fqumIqkt0m9woqMuU9mAmmDpUD5m4A5SsPNJ/YROupXpiwyPeuTeONDqmcckpwaay
	 RXhNmW4Szxc9gtD8CavQjH4eF/lc/jK+i+nQZgS8QNPOv3QNJEmHhG+l4D7kTYxnwE
	 FgH55CcXUV7V2eK1TitccxL7dLdyOkpIERFhiYaN/Oes6p1+YSry0pTsm3PJcko9WV
	 vbIsIy196otchv2oShUBvhO31KImkEY/bvluzt3bFsV3TmedTpmwE2lqZfs/puuHp4
	 o75oxT7PvZckABc/tVSCVth95M6/4ndrEJ9Er0m+ftugl8SEeRYb5m5kv3Nc5SZaFD
	 Eqkrsko/B6vww==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Sun, 06 Jul 2025 23:55:42 +0530
Subject: [PATCH v3 08/13] drm/bridge: samsung-dsim: allow configuring the
 PLL_STABLE bit
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250706-exynos7870-dsim-v3-8-9879fb9a644d@disroot.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751826342; l=3590;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=T0VIq57CdMsuApiqUpsp/pDwUjngV96YO/wTX94idkA=;
 b=wkbrLglZn9guumLsfLqeKxrkKIcwcP7q1UxaLr6P1BkMEskvyaJCLgQZIQYarnlb8Dm1Tf/pE
 /15aBS0mk0pD9ctV2tCTnhgls1ah0iEU3I9GOPxULw3kN2gItjfRIFh
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250706_112721_845217_93391959 
X-CRM114-Status: GOOD (  15.00  )
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

The PLL_STABLE bit of DSIM_DPHY_STATUS is hardcoded to BIT(31), but
Exynos7870's DSIM has it in BIT(24) as per downstream kernel sources.

In order to support both, move this bit value to the driver data struct
and define it for every driver compatible. Reference the value from
there instead, in functions wherever required.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 9 +++++++--
 include/drm/bridge/samsung-dsim.h     | 1 +
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index d67fb857d0359b813c268a77c2a0f2c3574d6dc2..fb2cb09cfd5a4f2fb50f802dc434c0956107b4e9 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -35,7 +35,6 @@
 #define DSIM_STOP_STATE_DAT(x)		(((x) & 0xf) << 0)
 #define DSIM_STOP_STATE_CLK		BIT(8)
 #define DSIM_TX_READY_HS_CLK		BIT(10)
-#define DSIM_PLL_STABLE			BIT(31)
 
 /* DSIM_SWRST */
 #define DSIM_FUNCRST			BIT(16)
@@ -415,6 +414,7 @@ static const struct samsung_dsim_driver_data exynos3_dsi_driver_data = {
 	.wait_for_reset = 1,
 	.num_bits_resol = 11,
 	.video_mode_bit = 25,
+	.pll_stable_bit = 31,
 	.esc_clken_bit = 28,
 	.byte_clken_bit = 24,
 	.tx_req_hsclk_bit = 31,
@@ -445,6 +445,7 @@ static const struct samsung_dsim_driver_data exynos4_dsi_driver_data = {
 	.wait_for_reset = 1,
 	.num_bits_resol = 11,
 	.video_mode_bit = 25,
+	.pll_stable_bit = 31,
 	.esc_clken_bit = 28,
 	.byte_clken_bit = 24,
 	.tx_req_hsclk_bit = 31,
@@ -473,6 +474,7 @@ static const struct samsung_dsim_driver_data exynos5_dsi_driver_data = {
 	.wait_for_reset = 1,
 	.num_bits_resol = 11,
 	.video_mode_bit = 25,
+	.pll_stable_bit = 31,
 	.esc_clken_bit = 28,
 	.byte_clken_bit = 24,
 	.tx_req_hsclk_bit = 31,
@@ -501,6 +503,7 @@ static const struct samsung_dsim_driver_data exynos5433_dsi_driver_data = {
 	.wait_for_reset = 0,
 	.num_bits_resol = 12,
 	.video_mode_bit = 25,
+	.pll_stable_bit = 31,
 	.esc_clken_bit = 28,
 	.byte_clken_bit = 24,
 	.tx_req_hsclk_bit = 31,
@@ -529,6 +532,7 @@ static const struct samsung_dsim_driver_data exynos5422_dsi_driver_data = {
 	.wait_for_reset = 1,
 	.num_bits_resol = 12,
 	.video_mode_bit = 25,
+	.pll_stable_bit = 31,
 	.esc_clken_bit = 28,
 	.byte_clken_bit = 24,
 	.tx_req_hsclk_bit = 31,
@@ -557,6 +561,7 @@ static const struct samsung_dsim_driver_data imx8mm_dsi_driver_data = {
 	.wait_for_reset = 0,
 	.num_bits_resol = 12,
 	.video_mode_bit = 25,
+	.pll_stable_bit = 31,
 	.esc_clken_bit = 28,
 	.byte_clken_bit = 24,
 	.tx_req_hsclk_bit = 31,
@@ -760,7 +765,7 @@ static unsigned long samsung_dsim_set_pll(struct samsung_dsim *dsi,
 			reg = samsung_dsim_read(dsi, DSIM_STATUS_REG);
 		else
 			reg = samsung_dsim_read(dsi, DSIM_LINK_STATUS_REG);
-	} while ((reg & DSIM_PLL_STABLE) == 0);
+	} while ((reg & BIT(driver_data->pll_stable_bit)) == 0);
 
 	dsi->hs_clock = fout;
 
diff --git a/include/drm/bridge/samsung-dsim.h b/include/drm/bridge/samsung-dsim.h
index 000ada3ece4d61c61412be550a8ccc13bd3f777e..04ed11787bbd22503f7221cad1a491a4e5e66781 100644
--- a/include/drm/bridge/samsung-dsim.h
+++ b/include/drm/bridge/samsung-dsim.h
@@ -65,6 +65,7 @@ struct samsung_dsim_driver_data {
 	unsigned int wait_for_reset;
 	unsigned int num_bits_resol;
 	unsigned int video_mode_bit;
+	unsigned int pll_stable_bit;
 	unsigned int esc_clken_bit;
 	unsigned int byte_clken_bit;
 	unsigned int tx_req_hsclk_bit;

-- 
2.49.0


