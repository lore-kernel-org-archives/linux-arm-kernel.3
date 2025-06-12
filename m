Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72F2DC71136
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 22:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kVMYaIEy17EpVoP48dwsGRxxFDGqUDMR/s7UPxEIpEY=; b=rYU367LupA6flzS+Gjel6ER+Ua
	La44LqJJ1dNtroPqbLT/OsX2wQCkDIwfIfWOqcjQxO/Zd8ZgD6RIufKc+0PObLCgOhQO6whJhfhMa
	ZbZVfd6e6O4rQyHv1cQ32491uI18rkIpqiYyKaZZU3J7ihZM50OUAFefLOuqlNHgUYA9wAKPkQj1Y
	LJVPBPVFTIq1Y4kCbTpx7ppU8MBvB7lssgWz29r7uWF7AtDNHyUj5gcAGjGIAcMi/4c9/9I6FN5bZ
	hStQzzf838GfPF1wmWI2Wv276Jwm9MB7Zies+6hPR9P+bujW6eDsfd8390pZgRIDpTB7xk3oE1yWI
	toCZ2Lpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPq70-0000000EjEk-34U6;
	Thu, 12 Jun 2025 22:09:30 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPjha-0000000Dl0Y-3YeO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 15:18:52 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 910B425F0B;
	Thu, 12 Jun 2025 17:18:49 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2Vk_K1Nx03DA; Thu, 12 Jun 2025 17:18:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1749741528; bh=ZiS4ua4T6SpoiJKR8NBn3iuuQzEl+7w9fvlp8z/W/Vs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=d7Q/eyN7ujwuudiipQHww523RDGq/M2seNny4ykdVRHTdtM14x5WqdqET9SmEeH/r
	 s4W36v3HYv5E9dY/SMPrjd2TDv8yrul7pTU3vtggqopHayynjKmWFvu+sJxWGcB6jp
	 Tt3GKB54VyhpMeXJnpHZtIt58tFasCLlH5Q1aj0lQlkjfck+zS6prfCMXDQNV5Opek
	 ofar2bs5fX55LZh0xVB8E57JQWewJ9KnC9CTQhAOXOseWQ0xovdD43DT62e2MVu3GS
	 cw7o2ebHZ5AuFoamxtKOYj44WXcIwGoJeqcIuIQ0FxC4PkhwNk2R5jGXkduuKxd/A2
	 1Ca8nKJoX7kfg==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Thu, 12 Jun 2025 20:48:06 +0530
Subject: [PATCH 02/12] drm/bridge: samsung-dsim: add SFRCTRL register
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-exynos7870-dsim-v1-2-1a330bca89df@disroot.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749741499; l=2917;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=ZiS4ua4T6SpoiJKR8NBn3iuuQzEl+7w9fvlp8z/W/Vs=;
 b=v6cwmp1CzCmr1eEIEGTYK4kRVkG3M623+dY8XkOLuj+qmVxSq1/NwcrM6rgy4uxwk/tb5aRCa
 WZBsXfdFqK/Ds/y6do/YAu2Op73mV6/cUK9Z5wtFFE7EusFL2WeeaxG
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_081851_154897_28F91CBE 
X-CRM114-Status: GOOD (  13.70  )
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

On Exynos7870 devices, enabling the display requires disabling
standby by writing to the SFRCTRL register. Add the register and related
bit values. Since this behavior isn't available on other SoCs, implement
a flag in the driver data struct indicating the availability of this
feature.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 16 ++++++++++++++++
 include/drm/bridge/samsung-dsim.h     |  1 +
 2 files changed, 17 insertions(+)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index c418d9e30222ec47eec05bbdefef3df8b7fec3c4..e7287c289e0f8d01e295407578817801bad9d8c8 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -155,6 +155,11 @@
 #define DSIM_INT_RX_ECC_ERR		BIT(15)
 #define DSIM_INT_RX_CRC_ERR		BIT(14)
 
+/* DSIM_SFRCTRL */
+#define DSIM_SFR_CTRL_STAND_BY		BIT(4)
+#define DSIM_SFR_CTRL_SHADOW_UPDATE	BIT(1)
+#define DSIM_SFR_CTRL_SHADOW_EN		BIT(0)
+
 /* DSIM_FIFOCTRL */
 #define DSIM_RX_DATA_FULL		BIT(25)
 #define DSIM_RX_DATA_EMPTY		BIT(24)
@@ -254,6 +259,7 @@ enum reg_idx {
 	DSIM_PKTHDR_REG,	/* Packet Header FIFO register */
 	DSIM_PAYLOAD_REG,	/* Payload FIFO register */
 	DSIM_RXFIFO_REG,	/* Read FIFO register */
+	DSIM_SFRCTRL_REG,	/* SFR standby and shadow control register */
 	DSIM_FIFOCTRL_REG,	/* FIFO status and control register */
 	DSIM_PLLCTRL_REG,	/* PLL control register */
 	DSIM_PHYCTRL_REG,
@@ -1029,6 +1035,7 @@ static void samsung_dsim_set_display_mode(struct samsung_dsim *dsi)
 
 static void samsung_dsim_set_display_enable(struct samsung_dsim *dsi, bool enable)
 {
+	const struct samsung_dsim_driver_data *driver_data = dsi->driver_data;
 	u32 reg;
 
 	reg = samsung_dsim_read(dsi, DSIM_MDRESOL_REG);
@@ -1037,6 +1044,15 @@ static void samsung_dsim_set_display_enable(struct samsung_dsim *dsi, bool enabl
 	else
 		reg &= ~DSIM_MAIN_STAND_BY;
 	samsung_dsim_write(dsi, DSIM_MDRESOL_REG, reg);
+
+	if (driver_data->has_sfrctrl) {
+		reg = samsung_dsim_read(dsi, DSIM_SFRCTRL_REG);
+		if (enable)
+			reg |= DSIM_SFR_CTRL_STAND_BY;
+		else
+			reg &= ~DSIM_SFR_CTRL_STAND_BY;
+		samsung_dsim_write(dsi, DSIM_SFRCTRL_REG, reg);
+	}
 }
 
 static int samsung_dsim_wait_for_hdr_fifo(struct samsung_dsim *dsi)
diff --git a/include/drm/bridge/samsung-dsim.h b/include/drm/bridge/samsung-dsim.h
index 9764d6eb5beb98b5b9427c5c4775c37b24dd6e17..a50e4f521b9d9561f6a3b9fe3e174c0e140849a2 100644
--- a/include/drm/bridge/samsung-dsim.h
+++ b/include/drm/bridge/samsung-dsim.h
@@ -56,6 +56,7 @@ struct samsung_dsim_driver_data {
 	unsigned int has_freqband:1;
 	unsigned int has_clklane_stop:1;
 	unsigned int has_broken_fifoctrl_emptyhdr:1;
+	unsigned int has_sfrctrl:1;
 	unsigned int num_clks;
 	unsigned int min_freq;
 	unsigned int max_freq;

-- 
2.49.0


