Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D7C6C83F03
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Jul 2025 18:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dXBG1LpYQtSs/iyxwpHQh4nr/ocJwuJFLWyJzSzK0N8=; b=z6YYCEP0G+ahaZ4C8ofvZHlI3S
	xRufxBCgruXcgqIsAPuJYMCXP9+5SbQxE/E93WldzKEMUTHBr/tDbXvdSR3ROvoZg8tVwxx/Kpcrs
	asrurUzLA/svW9OAlqLiUkWOU8to6I1Qd5hi3oPEDsYEH+ASCuwUfDYqxA/I4FhGhIbisBTzQZ/v1
	Hbs3Zn/Ybckoyqqst/07Jm5dgIP9R38EZLwmfZzVn22smKwL/R6SKIyLnKB1R3O/BX1FJCADDOBBp
	Egr631PLFRrBt0Fhfbljm5mUGTllbbv0CSKij4iWsfdd7lOTakVU3Pb2P/pENt8qH8apXYtqhkrp+
	tnUv0NgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYUDC-00000000eAu-0L3T;
	Sun, 06 Jul 2025 18:35:38 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYU4H-00000000cwM-2nrj
	for linux-arm-kernel@lists.infradead.org;
	Sun, 06 Jul 2025 18:26:27 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 77EB420D0D;
	Sun,  6 Jul 2025 20:26:24 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O6wthDKFcM8y; Sun,  6 Jul 2025 20:26:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1751826383; bh=9ukz1J1hpyoS4t+3L56en0gtBgQTrz9vCaRlVq/nDU0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=I53m653JSLlMVpKhfXIL/INukUGcP3l2QVTY08CkChgdRyHakBTFGEllc0UYgWNvw
	 utHvMc5FSOQ4Au9v+B795EUIZ7aEUpvlmwLqILHkSiVJ/RKfJGhMPQCyuPv7Wo6rtD
	 8Cs7v6RdxYTT4rSrnuT8c7Y1+N9NMu5astMSqYEU1O56m0GcyB7IqQ60Jg1if2CFNJ
	 zry3aFWerisutCkc4nBMS0feUSrCZi/SZvJYetOcrWAYhtkCj4uVlVlK3sosvS+LJI
	 OgiBxh+DmNVvsjJ8qO3XioTZzmHlYQGfYEtB0tl43my/RtL+xfStXGeYqxnEuP9KmH
	 lFBlVBY+X7b8A==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Sun, 06 Jul 2025 23:55:37 +0530
Subject: [PATCH v3 03/13] drm/bridge: samsung-dsim: add flag to control
 header FIFO wait
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250706-exynos7870-dsim-v3-3-9879fb9a644d@disroot.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751826342; l=3620;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=9ukz1J1hpyoS4t+3L56en0gtBgQTrz9vCaRlVq/nDU0=;
 b=8Q8sNrH93Z5Tn1bADFeyu70w3ruBWFrgwoNwT+m6XOLoQiLsiE4t/o8kUymdL8qVp9Rih5rpS
 ps6UI9M6CMWCuLb+v4IjPPdhp1gPTNtxnPkJ6XA6FcsYy2re1A/84yg
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250706_112625_976043_431A3574 
X-CRM114-Status: GOOD (  15.53  )
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
index dca3939dd99fa07aee309067b93e652bc9a9b78f..84af24171b6856cbcf95b9077b997ee587fc0409 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -418,6 +418,7 @@ static const struct samsung_dsim_driver_data exynos3_dsi_driver_data = {
 	.has_clklane_stop = 1,
 	.num_clks = 2,
 	.max_freq = 1000,
+	.wait_for_hdr_fifo = 1,
 	.wait_for_reset = 1,
 	.num_bits_resol = 11,
 	.pll_p_offset = 13,
@@ -438,6 +439,7 @@ static const struct samsung_dsim_driver_data exynos4_dsi_driver_data = {
 	.has_clklane_stop = 1,
 	.num_clks = 2,
 	.max_freq = 1000,
+	.wait_for_hdr_fifo = 1,
 	.wait_for_reset = 1,
 	.num_bits_resol = 11,
 	.pll_p_offset = 13,
@@ -456,6 +458,7 @@ static const struct samsung_dsim_driver_data exynos5_dsi_driver_data = {
 	.has_legacy_status_reg = 1,
 	.num_clks = 2,
 	.max_freq = 1000,
+	.wait_for_hdr_fifo = 1,
 	.wait_for_reset = 1,
 	.num_bits_resol = 11,
 	.pll_p_offset = 13,
@@ -474,6 +477,7 @@ static const struct samsung_dsim_driver_data exynos5433_dsi_driver_data = {
 	.has_clklane_stop = 1,
 	.num_clks = 5,
 	.max_freq = 1500,
+	.wait_for_hdr_fifo = 1,
 	.wait_for_reset = 0,
 	.num_bits_resol = 12,
 	.pll_p_offset = 13,
@@ -492,6 +496,7 @@ static const struct samsung_dsim_driver_data exynos5422_dsi_driver_data = {
 	.has_clklane_stop = 1,
 	.num_clks = 2,
 	.max_freq = 1500,
+	.wait_for_hdr_fifo = 1,
 	.wait_for_reset = 1,
 	.num_bits_resol = 12,
 	.pll_p_offset = 13,
@@ -510,6 +515,7 @@ static const struct samsung_dsim_driver_data imx8mm_dsi_driver_data = {
 	.has_clklane_stop = 1,
 	.num_clks = 2,
 	.max_freq = 2100,
+	.wait_for_hdr_fifo = 1,
 	.wait_for_reset = 0,
 	.num_bits_resol = 12,
 	/*
@@ -1117,6 +1123,7 @@ static void samsung_dsim_send_to_fifo(struct samsung_dsim *dsi,
 {
 	struct device *dev = dsi->dev;
 	struct mipi_dsi_packet *pkt = &xfer->packet;
+	const struct samsung_dsim_driver_data *driver_data = dsi->driver_data;
 	const u8 *payload = pkt->payload + xfer->tx_done;
 	u16 length = pkt->payload_length - xfer->tx_done;
 	bool first = !xfer->tx_done;
@@ -1157,9 +1164,11 @@ static void samsung_dsim_send_to_fifo(struct samsung_dsim *dsi,
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
index f0c1e5c5ed490afe0bcfd06830f52471710b29ea..62c07952bd00f9c2c287a6a998f0e243dd4032a9 100644
--- a/include/drm/bridge/samsung-dsim.h
+++ b/include/drm/bridge/samsung-dsim.h
@@ -61,6 +61,7 @@ struct samsung_dsim_driver_data {
 	unsigned int num_clks;
 	unsigned int min_freq;
 	unsigned int max_freq;
+	unsigned int wait_for_hdr_fifo;
 	unsigned int wait_for_reset;
 	unsigned int num_bits_resol;
 	unsigned int pll_p_offset;

-- 
2.49.0


