Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89954C7114B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 20:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ubl3XlNy3nUxWfqcc/JiWiqyxNWern1Z1O4OZ+D1x90=; b=JKffPQ5Q8qKSB5ODgLkeiYmSzy
	+LICT/FvOyrT0oq8PPI97u0wAIUX2fEFetPDiUUQfvCchQ5mN76Jzt7ROAINYiuPbLgiwTKjelWEx
	qSHnh8Dt67GUM3oDTir4gyxVLbh2OqLTs3gNf1wFlskQVLcLxhV6a4ibg9OX8fAR5VGz0OdaTgLCl
	2waWmN2KkYzTKsUrr3dcWIe1CWmdovsgV5GfgYZX6iOdUl6wRYh4bfU9RckEv25gIRBZy27WTEdyV
	q+RzRL3b6rDqMFGhwpUq9cmq1gShQEs+T3s/UKdiuOELNBhTSOBqTQmrvSBjaEDYoNjYaVBgXj3QK
	2v1hNsBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPowu-0000000EYMZ-0x33;
	Thu, 12 Jun 2025 20:55:00 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPjiC-0000000DlHE-1ToI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 15:19:29 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 3514725FB4;
	Thu, 12 Jun 2025 17:19:27 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dOmvS18l57UK; Thu, 12 Jun 2025 17:19:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1749741566; bh=HVd8A9JCGtWNb0MmQpLrVBSZmk71jxQ1NE5mehBct9w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=VmVEKUV0LU/uWx82aApxklfXg03Kuh4FRVxj9UF5kheU7bti132WSnb7rO5xIuK79
	 jz+8DiX0V/BaQt28IJ52UcHwZOpRqOnzKDnEqq8VKwQ1XuhgMrg89SxOzbxVKGMNp1
	 wTnZU9EGHubtBtso8FQ2xU2bIEuIWDTT60nY7Y0MeQtasrUf79YnBuxCHr5m45mZUV
	 blZleS5fyRAsO8yegPAuH/hd6UoYLlChygXvw3x9Akv0xQypboOoyAp7YUHQbD66JG
	 Jj/28ru2g6SPMLzJ/6hUK/8d1tgPSHouHr/RGDvNAElZjCQG20JU91Th4L8MDD08S+
	 84Di4+nKGLODQ==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Thu, 12 Jun 2025 20:48:10 +0530
Subject: [PATCH 06/12] drm/bridge: samsung-dsim: allow configuring the
 VIDEO_MODE bit
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-exynos7870-dsim-v1-6-1a330bca89df@disroot.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749741499; l=3602;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=HVd8A9JCGtWNb0MmQpLrVBSZmk71jxQ1NE5mehBct9w=;
 b=Q5D4YMHxT6iKfy5INfT+10J0sAzz4NZLMVDtjdRZhxsRswtHXU1uy3sb3bOAQAE2RzyJNofvn
 F5/vdEmkXIaBfk693/j+2UltSEcaWIq1iXfRTRSsdea3wNL4zbNFsiy
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_081928_658759_ED81988D 
X-CRM114-Status: GOOD (  14.65  )
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
index 104fc4ad7967f90868cd6923048816792beb0009..35fca1b0f3dc71d22feb121c4e2c2c108bfaa7c4 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -85,7 +85,6 @@
  */
 #define DSIM_HSE_DISABLE_MODE		BIT(23)
 #define DSIM_AUTO_MODE			BIT(24)
-#define DSIM_VIDEO_MODE			BIT(25)
 #define DSIM_BURST_MODE			BIT(26)
 #define DSIM_SYNC_INFORM		BIT(27)
 #define DSIM_EOT_DISABLE		BIT(28)
@@ -415,6 +414,7 @@ static const struct samsung_dsim_driver_data exynos3_dsi_driver_data = {
 	.wait_for_hdr_fifo = 1,
 	.wait_for_reset = 1,
 	.num_bits_resol = 11,
+	.video_mode_bit = 25,
 	.esc_clken_bit = 28,
 	.byte_clken_bit = 24,
 	.tx_req_hsclk_bit = 31,
@@ -441,6 +441,7 @@ static const struct samsung_dsim_driver_data exynos4_dsi_driver_data = {
 	.wait_for_hdr_fifo = 1,
 	.wait_for_reset = 1,
 	.num_bits_resol = 11,
+	.video_mode_bit = 25,
 	.esc_clken_bit = 28,
 	.byte_clken_bit = 24,
 	.tx_req_hsclk_bit = 31,
@@ -465,6 +466,7 @@ static const struct samsung_dsim_driver_data exynos5_dsi_driver_data = {
 	.wait_for_hdr_fifo = 1,
 	.wait_for_reset = 1,
 	.num_bits_resol = 11,
+	.video_mode_bit = 25,
 	.esc_clken_bit = 28,
 	.byte_clken_bit = 24,
 	.tx_req_hsclk_bit = 31,
@@ -489,6 +491,7 @@ static const struct samsung_dsim_driver_data exynos5433_dsi_driver_data = {
 	.wait_for_hdr_fifo = 1,
 	.wait_for_reset = 0,
 	.num_bits_resol = 12,
+	.video_mode_bit = 25,
 	.esc_clken_bit = 28,
 	.byte_clken_bit = 24,
 	.tx_req_hsclk_bit = 31,
@@ -513,6 +516,7 @@ static const struct samsung_dsim_driver_data exynos5422_dsi_driver_data = {
 	.wait_for_hdr_fifo = 1,
 	.wait_for_reset = 1,
 	.num_bits_resol = 12,
+	.video_mode_bit = 25,
 	.esc_clken_bit = 28,
 	.byte_clken_bit = 24,
 	.tx_req_hsclk_bit = 31,
@@ -537,6 +541,7 @@ static const struct samsung_dsim_driver_data imx8mm_dsi_driver_data = {
 	.wait_for_hdr_fifo = 1,
 	.wait_for_reset = 0,
 	.num_bits_resol = 12,
+	.video_mode_bit = 25,
 	.esc_clken_bit = 28,
 	.byte_clken_bit = 24,
 	.tx_req_hsclk_bit = 31,
@@ -945,7 +950,7 @@ static int samsung_dsim_init_link(struct samsung_dsim *dsi)
 	 * mode, otherwise it will support command mode.
 	 */
 	if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO) {
-		reg |= DSIM_VIDEO_MODE;
+		reg |= BIT(driver_data->video_mode_bit);
 
 		/*
 		 * The user manual describes that following bits are ignored in
diff --git a/include/drm/bridge/samsung-dsim.h b/include/drm/bridge/samsung-dsim.h
index a5f13f224b0817fe3135edd77276c4e715219cda..f364fd2703c3644e822df30408d82cc3d6206b05 100644
--- a/include/drm/bridge/samsung-dsim.h
+++ b/include/drm/bridge/samsung-dsim.h
@@ -63,6 +63,7 @@ struct samsung_dsim_driver_data {
 	unsigned int wait_for_hdr_fifo;
 	unsigned int wait_for_reset;
 	unsigned int num_bits_resol;
+	unsigned int video_mode_bit;
 	unsigned int esc_clken_bit;
 	unsigned int byte_clken_bit;
 	unsigned int tx_req_hsclk_bit;

-- 
2.49.0


