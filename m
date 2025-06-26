Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3807BC7EE33
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 21:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jXqn5YpWjsGEbvybgq51H0kxWTnC6vma7j86166GR8s=; b=dDLXXYwoi5G2aPEPL1AD6AMjvM
	DKWkTvbuxrE28eKZvGpiLz5RcPzV6IeAmA3lvqJBzm5AXZItxYjYnetmuprGdBDKZZ7J3VwrzMhv1
	pHP699PRgZonlabuvh9fFHhFW35+qisWszI+ojKSjRupe03x78k+smXsu44AoGAn/qE/QTGHAojvG
	/8XyNWd7hgptIanTLHkD8XO/+d3w9NMVq8eh2AAAK+Rt9mdXrMVNHeW2Z7uf+NsqN3glTmzIff9Oi
	NkxvSAUT1+CRXq4P6a2PUFlspPWRrXbQN40pSGWx+Bxo8bxs8GL+qBhbEcgIs4A+te+FNx5IcnF/T
	qGCNmpdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUtkX-0000000CnRu-0NAT;
	Thu, 26 Jun 2025 21:03:13 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUsSx-0000000Cc5J-12He
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 19:41:00 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 035D825AFA;
	Thu, 26 Jun 2025 21:40:58 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id udfKIfnW7R9o; Thu, 26 Jun 2025 21:40:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1750966852; bh=GRwQfaXR9PqlUd5qkwAM/K2L0RzAamSmwPUgcvhLXFc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=OYvTEa9ADlUIivh0fEl0ruh2UjkM25tSXD7TKdzRWVC6JYlj5shjZjAflmrO/hirV
	 fvdNUrTnZ31vKtco96bIoLUY+RXBPmUvQ3iVEXF1F/JvzC/TjoI71gsvDG6k50e4mT
	 Z6+rJhe6ZBhrQLTcTsJHqBT7nlvNWtwXungs+uYG2Ii+8sCWtXKg/Nzqqt6+xtwfcv
	 wHblWVSJNTtg6sPdzwr7Uv016+VBok0fDu/ZP5dud42sD+CGTXJCa1zgKEx5G6cV4L
	 zEDn4DeG0BenaQQNZQHKA8ElJfaTRTpM8dYBAf4sDdllzsgUeGU8vqsq7Yrk9xrqTJ
	 OpMpPs9C4AtEQ==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Fri, 27 Jun 2025 01:08:57 +0530
Subject: [PATCH v2 08/13] drm/bridge: samsung-dsim: allow configuring the
 PLL_STABLE bit
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250627-exynos7870-dsim-v2-8-1433b67378d3@disroot.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750966738; l=3549;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=GRwQfaXR9PqlUd5qkwAM/K2L0RzAamSmwPUgcvhLXFc=;
 b=zY+YgxeevIU30zCR9B5D+wDMKGvoc7kvreewF/G/zMFvqB/UkKcPqSmFQOPmzB+oXBKdgWYzv
 O4kKpXVN71PA1N+YYAPlltJoOT34v46g6HrPwlYIHYJnOjCCnuJn4sF
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_124059_552774_B9EF687B 
X-CRM114-Status: GOOD (  14.74  )
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
index 5993f8ef5d3641f69e557a79819ce0ba54762efb..739e1d1e6d239d06896daa131b692309cfeda843 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -34,7 +34,6 @@
 #define DSIM_STOP_STATE_DAT(x)		(((x) & 0xf) << 0)
 #define DSIM_STOP_STATE_CLK		BIT(8)
 #define DSIM_TX_READY_HS_CLK		BIT(10)
-#define DSIM_PLL_STABLE			BIT(31)
 
 /* DSIM_SWRST */
 #define DSIM_FUNCRST			BIT(16)
@@ -414,6 +413,7 @@ static const struct samsung_dsim_driver_data exynos3_dsi_driver_data = {
 	.wait_for_reset = 1,
 	.num_bits_resol = 11,
 	.video_mode_bit = 25,
+	.pll_stable_bit = 31,
 	.esc_clken_bit = 28,
 	.byte_clken_bit = 24,
 	.tx_req_hsclk_bit = 31,
@@ -443,6 +443,7 @@ static const struct samsung_dsim_driver_data exynos4_dsi_driver_data = {
 	.wait_for_reset = 1,
 	.num_bits_resol = 11,
 	.video_mode_bit = 25,
+	.pll_stable_bit = 31,
 	.esc_clken_bit = 28,
 	.byte_clken_bit = 24,
 	.tx_req_hsclk_bit = 31,
@@ -470,6 +471,7 @@ static const struct samsung_dsim_driver_data exynos5_dsi_driver_data = {
 	.wait_for_reset = 1,
 	.num_bits_resol = 11,
 	.video_mode_bit = 25,
+	.pll_stable_bit = 31,
 	.esc_clken_bit = 28,
 	.byte_clken_bit = 24,
 	.tx_req_hsclk_bit = 31,
@@ -497,6 +499,7 @@ static const struct samsung_dsim_driver_data exynos5433_dsi_driver_data = {
 	.wait_for_reset = 0,
 	.num_bits_resol = 12,
 	.video_mode_bit = 25,
+	.pll_stable_bit = 31,
 	.esc_clken_bit = 28,
 	.byte_clken_bit = 24,
 	.tx_req_hsclk_bit = 31,
@@ -524,6 +527,7 @@ static const struct samsung_dsim_driver_data exynos5422_dsi_driver_data = {
 	.wait_for_reset = 1,
 	.num_bits_resol = 12,
 	.video_mode_bit = 25,
+	.pll_stable_bit = 31,
 	.esc_clken_bit = 28,
 	.byte_clken_bit = 24,
 	.tx_req_hsclk_bit = 31,
@@ -551,6 +555,7 @@ static const struct samsung_dsim_driver_data imx8mm_dsi_driver_data = {
 	.wait_for_reset = 0,
 	.num_bits_resol = 12,
 	.video_mode_bit = 25,
+	.pll_stable_bit = 31,
 	.esc_clken_bit = 28,
 	.byte_clken_bit = 24,
 	.tx_req_hsclk_bit = 31,
@@ -754,7 +759,7 @@ static unsigned long samsung_dsim_set_pll(struct samsung_dsim *dsi,
 			return 0;
 		}
 		reg = samsung_dsim_read(dsi, DSIM_LINK_STATUS_REG);
-	} while ((reg & DSIM_PLL_STABLE) == 0);
+	} while ((reg & BIT(driver_data->pll_stable_bit)) == 0);
 
 	dsi->hs_clock = fout;
 
diff --git a/include/drm/bridge/samsung-dsim.h b/include/drm/bridge/samsung-dsim.h
index def9b4c6ef28eede8175aaa84c495c5444d0f103..2dd63032d83ab5df0e1780a692789c340c2126dc 100644
--- a/include/drm/bridge/samsung-dsim.h
+++ b/include/drm/bridge/samsung-dsim.h
@@ -64,6 +64,7 @@ struct samsung_dsim_driver_data {
 	unsigned int wait_for_reset;
 	unsigned int num_bits_resol;
 	unsigned int video_mode_bit;
+	unsigned int pll_stable_bit;
 	unsigned int esc_clken_bit;
 	unsigned int byte_clken_bit;
 	unsigned int tx_req_hsclk_bit;

-- 
2.49.0


