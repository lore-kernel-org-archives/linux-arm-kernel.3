Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71FA5C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 20:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZA2xZpfTbHuLk3pa3e8TIvlB7B05mig+Dt+AtkPDlE4=; b=C6c4YVInTACKOaasArVffbusne
	kdqZj5KinoYbcyLpfrjf3Vzw5G72Q5lTjN7+kdUOz0JJWx12N7PaYfcESuLYZhyTAvCJ9k2iWJnP3
	f7bQESc3pUG9HjuRY4bml17SfchJwwVvuWtyOd1aJdrSJ2d4nU5aoDq2SgNP3PLnWGa6M28M1XvdI
	eyDJH+DyjunZkxxWo+29zuDjK4fzr/oQYsGmkztMmNq/bFQMxim/vPa1A+boURvXkrH2T4kvq3niN
	TaLi+SwvMyqv0cSKMMIYOXlWBsAkYFsSc3W8d4UWg5u5wwdC533T72aszw+HFvPzcu88D+vq7LX50
	jaZUfGTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUtZO-0000000CmSI-1NAx;
	Thu, 26 Jun 2025 20:51:42 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUsRp-0000000CbdZ-1giY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 19:39:50 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 135F025B9F;
	Thu, 26 Jun 2025 21:39:48 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8OArNbdu2Lx8; Thu, 26 Jun 2025 21:39:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1750966786; bh=wlVGQBMaNz6zTceF2YNMK+fgvVG3wMWLRik/PjF4UlI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=kPRuSPDOvanJK/wQwkPmgrtN8Lra72ICEqTBV6nRskUzlCuyq4RnlRrgbtfflyxZC
	 Oddp7EpYCL+Tq8/xPMmOpfg5BCrgKFZsy0knSn/5lcNDww+l6spCLa/djbDIXKjevU
	 i+RW95EPrzSKBhfabk4BkXoD+B0TB6I7FIVCadjzKtZr5qUuFI8mPbxIi6PnoBuNFq
	 ZeSriHDj5aKhTesK0m1gUuuAfcgTR5Y5y3oe3FoT+Tev8tIexj9Ss11Zl+XZzUf72t
	 erwS8HBDiRcX0gMURdJKBk98nlC+HUNa5z56ZKo59sGmUF2adh3VjRZ9hS/9nEqlRq
	 fo018fw9n2xtQ==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Fri, 27 Jun 2025 01:08:52 +0530
Subject: [PATCH v2 03/13] drm/bridge: samsung-dsim: add flag to control
 header FIFO wait
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250627-exynos7870-dsim-v2-3-1433b67378d3@disroot.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750966738; l=3612;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=wlVGQBMaNz6zTceF2YNMK+fgvVG3wMWLRik/PjF4UlI=;
 b=dZNr8jWpFp0IUbelfuaBn8YmfCyKFG03gqkl7Cz9s+fKOS7knK7ApH+t6cQqu/FXq2nS5PTB0
 ySzzMZynJugAcV6/yaH83i78keW2BvL3duI5hF5MWMQ5k0KDXK59utO
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_123949_708410_75F1FE90 
X-CRM114-Status: GOOD (  15.09  )
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

Exynos7870's DSIM device doesn't require waiting for the header FIFO
during a MIPI DSI transfer. Add a flag in the driver data in order to
control said behavior.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 15 ++++++++++++---
 include/drm/bridge/samsung-dsim.h     |  1 +
 2 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index 3c716334f1a21bf446ebe17f810d5258dd9a4c24..112d558579d8f987c695e1704a5772ebbadfd625 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -417,6 +417,7 @@ static const struct samsung_dsim_driver_data exynos3_dsi_driver_data = {
 	.has_clklane_stop = 1,
 	.num_clks = 2,
 	.max_freq = 1000,
+	.wait_for_hdr_fifo = 1,
 	.wait_for_reset = 1,
 	.num_bits_resol = 11,
 	.pll_p_offset = 13,
@@ -436,6 +437,7 @@ static const struct samsung_dsim_driver_data exynos4_dsi_driver_data = {
 	.has_clklane_stop = 1,
 	.num_clks = 2,
 	.max_freq = 1000,
+	.wait_for_hdr_fifo = 1,
 	.wait_for_reset = 1,
 	.num_bits_resol = 11,
 	.pll_p_offset = 13,
@@ -453,6 +455,7 @@ static const struct samsung_dsim_driver_data exynos5_dsi_driver_data = {
 	.plltmr_reg = 0x58,
 	.num_clks = 2,
 	.max_freq = 1000,
+	.wait_for_hdr_fifo = 1,
 	.wait_for_reset = 1,
 	.num_bits_resol = 11,
 	.pll_p_offset = 13,
@@ -470,6 +473,7 @@ static const struct samsung_dsim_driver_data exynos5433_dsi_driver_data = {
 	.has_clklane_stop = 1,
 	.num_clks = 5,
 	.max_freq = 1500,
+	.wait_for_hdr_fifo = 1,
 	.wait_for_reset = 0,
 	.num_bits_resol = 12,
 	.pll_p_offset = 13,
@@ -487,6 +491,7 @@ static const struct samsung_dsim_driver_data exynos5422_dsi_driver_data = {
 	.has_clklane_stop = 1,
 	.num_clks = 2,
 	.max_freq = 1500,
+	.wait_for_hdr_fifo = 1,
 	.wait_for_reset = 1,
 	.num_bits_resol = 12,
 	.pll_p_offset = 13,
@@ -504,6 +509,7 @@ static const struct samsung_dsim_driver_data imx8mm_dsi_driver_data = {
 	.has_clklane_stop = 1,
 	.num_clks = 2,
 	.max_freq = 2100,
+	.wait_for_hdr_fifo = 1,
 	.wait_for_reset = 0,
 	.num_bits_resol = 12,
 	/*
@@ -1110,6 +1116,7 @@ static void samsung_dsim_send_to_fifo(struct samsung_dsim *dsi,
 {
 	struct device *dev = dsi->dev;
 	struct mipi_dsi_packet *pkt = &xfer->packet;
+	const struct samsung_dsim_driver_data *driver_data = dsi->driver_data;
 	const u8 *payload = pkt->payload + xfer->tx_done;
 	u16 length = pkt->payload_length - xfer->tx_done;
 	bool first = !xfer->tx_done;
@@ -1150,9 +1157,11 @@ static void samsung_dsim_send_to_fifo(struct samsung_dsim *dsi,
 		return;
 
 	reg = get_unaligned_le32(pkt->header);
-	if (samsung_dsim_wait_for_hdr_fifo(dsi)) {
-		dev_err(dev, "waiting for header FIFO timed out\n");
-		return;
+	if (driver_data->wait_for_hdr_fifo) {
+		if (samsung_dsim_wait_for_hdr_fifo(dsi)) {
+			dev_err(dev, "waiting for header FIFO timed out\n");
+			return;
+		}
 	}
 
 	if (NEQV(xfer->flags & MIPI_DSI_MSG_USE_LPM,
diff --git a/include/drm/bridge/samsung-dsim.h b/include/drm/bridge/samsung-dsim.h
index a50e4f521b9d9561f6a3b9fe3e174c0e140849a2..3641c57557f42fd90cd2e8c0282f69dbe36ba2de 100644
--- a/include/drm/bridge/samsung-dsim.h
+++ b/include/drm/bridge/samsung-dsim.h
@@ -60,6 +60,7 @@ struct samsung_dsim_driver_data {
 	unsigned int num_clks;
 	unsigned int min_freq;
 	unsigned int max_freq;
+	unsigned int wait_for_hdr_fifo;
 	unsigned int wait_for_reset;
 	unsigned int num_bits_resol;
 	unsigned int pll_p_offset;

-- 
2.49.0


