Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1ECBC83F03
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Jul 2025 18:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FopnrNt7EcAbl3DT3TX7ASazbXW7f1+4snH8RaMpiNI=; b=3ra46o/Cb8KgYJPQAhKb+A6Eho
	a8+UhqMRlnme6cwh3FQpnfTMs81h9A5NOhbEWasTsG+59IuQRoO5Rtamnbw4RUitKXGDgxQAiQiNd
	oUtCLYIY6Z/qKiPqqIF9MKTIESguQSLH75zv1w0QS7YS0JntKsbQE830Kf7x8Jjg27tvnMCFwV4+O
	ehZPbH1o5s43oae8MnfJqmIg1zptcApjUZ70Pou67AqXhhxlIzSCEEHVhb3jn6S3ESa/9E9lG55/+
	65TH6/m0UEoFLXWfl6KiuO/ZQQiGrOu1+furY1bDQ6vkQGkGFoGAFYfFKmucT0pyzWzZE3q7wCDfK
	VXJjprEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYUK8-00000000evH-3Etd;
	Sun, 06 Jul 2025 18:42:48 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYU4i-00000000d3X-3tdr
	for linux-arm-kernel@lists.infradead.org;
	Sun, 06 Jul 2025 18:26:54 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id B3DF520D0D;
	Sun,  6 Jul 2025 20:26:51 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ObE6sqDiy88z; Sun,  6 Jul 2025 20:26:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1751826410; bh=TFs9OPHOosFYWTnp2fAs3vWT3qirSqqYVvnyedlNNXA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=XyjsH6toNrhKHSJBpqkYjmfYDV3zRzavQExYF6ObhrO8Sfm5tdKXhIZTWDJ/my5nT
	 lg0GOLOtM87RdYAuhIz3+PhvqM31QkDQbEb3dpj1rWKUXaNys7NdL0rrasQTRF4Uko
	 HK0i/JVpKgqXK1b/Fj0chYwQ9rmrFO3ZMFb21g+LUP2FIelgv1qvbieVrL6CUUGVf3
	 /Hg9KgIB05Gp2pHbz5iiQRr3MQKpFmZdPp1rW+BNaYZcEn/pfhda2D87TpXlnislce
	 X/TejSFJIOyKRysEOqOuSpdjI/eo3a0cqRmjSyRSg38sTc7CTZeATYN4WJGmP+8XNF
	 r0srSAnPVXwvQ==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Sun, 06 Jul 2025 23:55:40 +0530
Subject: [PATCH v3 06/13] drm/bridge: samsung-dsim: allow configuring the
 VIDEO_MODE bit
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250706-exynos7870-dsim-v3-6-9879fb9a644d@disroot.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751826342; l=3602;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=TFs9OPHOosFYWTnp2fAs3vWT3qirSqqYVvnyedlNNXA=;
 b=YecbciqzmlT5nvlVtRZ1Gqrwf3JtgFBXIm8NbKbtE2yVNbsTewE64z7HQ5po+/oJwDFSqIyPC
 mY6gJJHwGyTAvJ/ytq9PGoz9ZSV8lDHrjkevGnbdwhWdG4gAavLMHhN
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250706_112653_237602_546A1EE9 
X-CRM114-Status: GOOD (  15.50  )
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

The VIDEO_MODE bit of DSIM_CONFIG is hardcoded to BIT(25), but
Exynos7870's DSIM has it in BIT(18) as per downstream kernel sources.

In order to support both, move this bit value to the driver data struct
and define it for every driver compatible. Reference the value from
there instead, in functions wherever required.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 9 +++++++--
 include/drm/bridge/samsung-dsim.h     | 1 +
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index 89ece3e6f200c710e4c9204efd84c84b9260456b..4ef052ea819cf9fdec9f72c920c04ecd4469e90c 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -87,7 +87,6 @@
  */
 #define DSIM_HSE_DISABLE_MODE		BIT(23)
 #define DSIM_AUTO_MODE			BIT(24)
-#define DSIM_VIDEO_MODE			BIT(25)
 #define DSIM_BURST_MODE			BIT(26)
 #define DSIM_SYNC_INFORM		BIT(27)
 #define DSIM_EOT_DISABLE		BIT(28)
@@ -417,6 +416,7 @@ static const struct samsung_dsim_driver_data exynos3_dsi_driver_data = {
 	.wait_for_hdr_fifo = 1,
 	.wait_for_reset = 1,
 	.num_bits_resol = 11,
+	.video_mode_bit = 25,
 	.esc_clken_bit = 28,
 	.byte_clken_bit = 24,
 	.tx_req_hsclk_bit = 31,
@@ -444,6 +444,7 @@ static const struct samsung_dsim_driver_data exynos4_dsi_driver_data = {
 	.wait_for_hdr_fifo = 1,
 	.wait_for_reset = 1,
 	.num_bits_resol = 11,
+	.video_mode_bit = 25,
 	.esc_clken_bit = 28,
 	.byte_clken_bit = 24,
 	.tx_req_hsclk_bit = 31,
@@ -469,6 +470,7 @@ static const struct samsung_dsim_driver_data exynos5_dsi_driver_data = {
 	.wait_for_hdr_fifo = 1,
 	.wait_for_reset = 1,
 	.num_bits_resol = 11,
+	.video_mode_bit = 25,
 	.esc_clken_bit = 28,
 	.byte_clken_bit = 24,
 	.tx_req_hsclk_bit = 31,
@@ -494,6 +496,7 @@ static const struct samsung_dsim_driver_data exynos5433_dsi_driver_data = {
 	.wait_for_hdr_fifo = 1,
 	.wait_for_reset = 0,
 	.num_bits_resol = 12,
+	.video_mode_bit = 25,
 	.esc_clken_bit = 28,
 	.byte_clken_bit = 24,
 	.tx_req_hsclk_bit = 31,
@@ -519,6 +522,7 @@ static const struct samsung_dsim_driver_data exynos5422_dsi_driver_data = {
 	.wait_for_hdr_fifo = 1,
 	.wait_for_reset = 1,
 	.num_bits_resol = 12,
+	.video_mode_bit = 25,
 	.esc_clken_bit = 28,
 	.byte_clken_bit = 24,
 	.tx_req_hsclk_bit = 31,
@@ -544,6 +548,7 @@ static const struct samsung_dsim_driver_data imx8mm_dsi_driver_data = {
 	.wait_for_hdr_fifo = 1,
 	.wait_for_reset = 0,
 	.num_bits_resol = 12,
+	.video_mode_bit = 25,
 	.esc_clken_bit = 28,
 	.byte_clken_bit = 24,
 	.tx_req_hsclk_bit = 31,
@@ -952,7 +957,7 @@ static int samsung_dsim_init_link(struct samsung_dsim *dsi)
 	 * mode, otherwise it will support command mode.
 	 */
 	if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO) {
-		reg |= DSIM_VIDEO_MODE;
+		reg |= BIT(driver_data->video_mode_bit);
 
 		/*
 		 * The user manual describes that following bits are ignored in
diff --git a/include/drm/bridge/samsung-dsim.h b/include/drm/bridge/samsung-dsim.h
index 7f6d353f34af14f156e864c624f6eb980296c32d..9d11c3e39fe532b83d4bc3d7f950645bbb8970b3 100644
--- a/include/drm/bridge/samsung-dsim.h
+++ b/include/drm/bridge/samsung-dsim.h
@@ -64,6 +64,7 @@ struct samsung_dsim_driver_data {
 	unsigned int wait_for_hdr_fifo;
 	unsigned int wait_for_reset;
 	unsigned int num_bits_resol;
+	unsigned int video_mode_bit;
 	unsigned int esc_clken_bit;
 	unsigned int byte_clken_bit;
 	unsigned int tx_req_hsclk_bit;

-- 
2.49.0


