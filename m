Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0677C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 20:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bn00o+5VRFXltbVUWW5NXJNIyDJx36KEZ9LZtnbvOiA=; b=Q84GlyYJFLR/oq6rtOo3T60x/+
	4lXs/tU5Li3fnFwBXxVDYY72I3sEPvxPy3jwvv3ZJrw7F/SUF3VsPZGUCMBqniuPlaYTwNJs3uQJx
	H83ssfkpWZmX8KVtE0Qj88cd5vfj+BddFy9yT73va7AWH17XP/fzH2NFjZzan+t6t2Ir/3YRMVOpD
	HyURiAU7zmI1drjPEsCvR5085UGQJSZQDgqYO0hMhbjAlKjVFsWrEd43lu/QE5sTlfMsVvAtqvmjl
	2HS+hIGWelWi8YrXPnr8vCo4RzeWesPxjCwMc4j5OYFs8P6Y1+t2iFYV0VTKeJzOIFpLhXlhwRWoe
	XN7sTYVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUtg5-0000000CnBU-2rO1;
	Thu, 26 Jun 2025 20:58:37 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUsSR-0000000CbtX-3Z8L
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 19:40:29 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 9A11525C0F;
	Thu, 26 Jun 2025 21:40:26 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p1a6vYULtFzR; Thu, 26 Jun 2025 21:40:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1750966825; bh=t7fxqve/o3YKyaqfpTmXJILhPTxiSVZnhtUpJPbKvRo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=mmVrGFlsc0Ra9JaJzZVyuh0i11SiByW3G0PWYtKTPqCC688y4ZHNSZr/6ksPwyK99
	 QCekE1Pc/JvfhyO8JwBHK037wYWOISAlbyfT0q7SIpq8T+dJFKA67o1/wHdGHHmTtv
	 nzWy8WLArZ8fYFAm1lNDsdOdAyRqjU552qoWgypRwsS8jGidYi2CKA8Xbi3eUTX62Y
	 29BwnKeklQoonrRGbPy/F6X7leG0365RwU+yDmzSKX6pL03f8JdqQWtELW9+gtbqf5
	 Tv8+VLl2tNRp1GiQ23DJ/l8roMPWpX5n6IaplSjzJtVMVMKibk/q6bdv4YckJ1gf2h
	 Cn8Uuzh+YtUog==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Fri, 27 Jun 2025 01:08:55 +0530
Subject: [PATCH v2 06/13] drm/bridge: samsung-dsim: allow configuring the
 VIDEO_MODE bit
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250627-exynos7870-dsim-v2-6-1433b67378d3@disroot.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750966738; l=3602;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=t7fxqve/o3YKyaqfpTmXJILhPTxiSVZnhtUpJPbKvRo=;
 b=XltL8QkdEjIx9KFxO5hmh0IhlylpnUheEjCnkcz5UAFmU93o3ppkzXbUi9/PlBT7D+tu8W/1X
 pVZ5H+zYerHCqjx8hcn55VnYQod5MuoZ+J33KraTco6evZkp368CQ/n
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_124028_153778_68290A80 
X-CRM114-Status: GOOD (  14.57  )
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
index c61524b6daf936b904743af4487cfb172dd687f0..0ebf0037d181ff6a4c54df1048593c97cc89f2eb 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -86,7 +86,6 @@
  */
 #define DSIM_HSE_DISABLE_MODE		BIT(23)
 #define DSIM_AUTO_MODE			BIT(24)
-#define DSIM_VIDEO_MODE			BIT(25)
 #define DSIM_BURST_MODE			BIT(26)
 #define DSIM_SYNC_INFORM		BIT(27)
 #define DSIM_EOT_DISABLE		BIT(28)
@@ -416,6 +415,7 @@ static const struct samsung_dsim_driver_data exynos3_dsi_driver_data = {
 	.wait_for_hdr_fifo = 1,
 	.wait_for_reset = 1,
 	.num_bits_resol = 11,
+	.video_mode_bit = 25,
 	.esc_clken_bit = 28,
 	.byte_clken_bit = 24,
 	.tx_req_hsclk_bit = 31,
@@ -442,6 +442,7 @@ static const struct samsung_dsim_driver_data exynos4_dsi_driver_data = {
 	.wait_for_hdr_fifo = 1,
 	.wait_for_reset = 1,
 	.num_bits_resol = 11,
+	.video_mode_bit = 25,
 	.esc_clken_bit = 28,
 	.byte_clken_bit = 24,
 	.tx_req_hsclk_bit = 31,
@@ -466,6 +467,7 @@ static const struct samsung_dsim_driver_data exynos5_dsi_driver_data = {
 	.wait_for_hdr_fifo = 1,
 	.wait_for_reset = 1,
 	.num_bits_resol = 11,
+	.video_mode_bit = 25,
 	.esc_clken_bit = 28,
 	.byte_clken_bit = 24,
 	.tx_req_hsclk_bit = 31,
@@ -490,6 +492,7 @@ static const struct samsung_dsim_driver_data exynos5433_dsi_driver_data = {
 	.wait_for_hdr_fifo = 1,
 	.wait_for_reset = 0,
 	.num_bits_resol = 12,
+	.video_mode_bit = 25,
 	.esc_clken_bit = 28,
 	.byte_clken_bit = 24,
 	.tx_req_hsclk_bit = 31,
@@ -514,6 +517,7 @@ static const struct samsung_dsim_driver_data exynos5422_dsi_driver_data = {
 	.wait_for_hdr_fifo = 1,
 	.wait_for_reset = 1,
 	.num_bits_resol = 12,
+	.video_mode_bit = 25,
 	.esc_clken_bit = 28,
 	.byte_clken_bit = 24,
 	.tx_req_hsclk_bit = 31,
@@ -538,6 +542,7 @@ static const struct samsung_dsim_driver_data imx8mm_dsi_driver_data = {
 	.wait_for_hdr_fifo = 1,
 	.wait_for_reset = 0,
 	.num_bits_resol = 12,
+	.video_mode_bit = 25,
 	.esc_clken_bit = 28,
 	.byte_clken_bit = 24,
 	.tx_req_hsclk_bit = 31,
@@ -946,7 +951,7 @@ static int samsung_dsim_init_link(struct samsung_dsim *dsi)
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


