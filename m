Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23263C7EE33
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 20:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vc1aoUc/pThCCDscp+nuqRIMCX8aw4fL8w7+zBYqAdg=; b=Px1EoTMMTL3Ggnw/BWabt7WLRX
	q4qWOFI2HZO9vkK0i5qxwY6KmVMb0F0HSjkapHou2GXlsVPo6DTWsu/0h7XgXTKj2MxKUHIEIQ2mP
	aaU28hGKYXLCEAsshJ8advNDeYYWmgkiZW3sGsVpc/Ch+bRLCpm2edKdQUBi+Pqn6KOVu1auviym3
	f2f8LspSR8DghlWS3HeY0FrmnbX6YXxQsNwQH6FcgKIS+nFAnkw2CZIWZG4TiHg/yKmpdGB/tkKpU
	p/NoCjxYeVM7bAYGSujJmzGfCU7wJD9CTz0zk4kKfREEM9csq+9MH7a/S69ghhsoyeoZKFjKquV8q
	JwFp0+eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUtdq-0000000Cmuj-3fRR;
	Thu, 26 Jun 2025 20:56:18 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUsSE-0000000Cbpe-1Lro
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 19:40:15 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 1F3C925EE9;
	Thu, 26 Jun 2025 21:40:13 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b5jeVJosM-64; Thu, 26 Jun 2025 21:40:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1750966811; bh=vy1snYTGnHH6IixePbf9/yaHh6iBLoAuBkPV9RrFW/k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=YSKf609NiaX48IVcBYOBQNE8WwkNePe2kLgpVQUDu2I7tEGTNMP4AhqM58tu39lRt
	 LH68Fy/qGuZYqwWOpsXiOJiRiZ2adCUH78y9kyS5R7ZzN8C89d5zezKXktHaqq9TuH
	 uBWWIpwRdHg+c1OJnqHXU/BnFvTg650l5zMIg3yTo3Clp+P4vgjes4/rGaNHnHbze4
	 3thpZ+iWr5ZG8k/GpNMEYX+43EItekcncgz6jpTnPtkQGCEzIRdLfvPDFDjEIg9aEo
	 57ICVbC5YPp/DnIrkxw36v5QayYaBVPnt3/nn77yYUKoR73T8IgUO/L3VUEoawDKhb
	 YNZJtx0jNd+Mg==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Fri, 27 Jun 2025 01:08:54 +0530
Subject: [PATCH v2 05/13] drm/bridge: samsung-dsim: allow configuring the
 MAIN_VSA offset
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250627-exynos7870-dsim-v2-5-1433b67378d3@disroot.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750966738; l=4240;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=vy1snYTGnHH6IixePbf9/yaHh6iBLoAuBkPV9RrFW/k=;
 b=JeIuFbKJEf3KFGOldLFmoVE8vR5E87MXGabNg5fDbkiQEJ2WeiHkB/pUMLWPb+lz35whLGQyU
 0rFb9RT2j0KDsFuOZM3VF7mfqAAdrYn3+MfsjIQwlOmLMM9wibaEvRn
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_124014_634961_85C8408C 
X-CRM114-Status: GOOD (  14.49  )
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

The MAIN_VSA offset of DSIM_MSYNC is hardcoded to a 22-bit offset, but
Exynos7870's DSIM has it in a 16-bit offset as per the downstream kernel
sources.

In order to support both, move this offset value to the driver data
struct and define it for every driver compatible. Reference the value
from there instead, in functions wherever required.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 13 ++++++++++---
 include/drm/bridge/samsung-dsim.h     |  1 +
 2 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index c85c7c3af74ebce9732f9531ba5c31d992a19a23..c61524b6daf936b904743af4487cfb172dd687f0 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -124,9 +124,9 @@
 #define DSIM_MAIN_HBP_MASK		((0xffff) << 0)
 
 /* DSIM_MSYNC */
-#define DSIM_MAIN_VSA(x)		((x) << 22)
+#define DSIM_MAIN_VSA(x, offset)	((x) << offset)
 #define DSIM_MAIN_HSA(x)		((x) << 0)
-#define DSIM_MAIN_VSA_MASK		((0x3ff) << 22)
+#define DSIM_MAIN_VSA_MASK(offset)	((0x3ff) << offset)
 #define DSIM_MAIN_HSA_MASK		((0xffff) << 0)
 
 /* DSIM_SDRESOL */
@@ -422,6 +422,7 @@ static const struct samsung_dsim_driver_data exynos3_dsi_driver_data = {
 	.lane_esc_clk_bit = 19,
 	.lane_esc_data_offset = 20,
 	.pll_p_offset = 13,
+	.main_vsa_offset = 22,
 	.reg_values = reg_values,
 	.pll_fin_min = 6,
 	.pll_fin_max = 12,
@@ -447,6 +448,7 @@ static const struct samsung_dsim_driver_data exynos4_dsi_driver_data = {
 	.lane_esc_clk_bit = 19,
 	.lane_esc_data_offset = 20,
 	.pll_p_offset = 13,
+	.main_vsa_offset = 22,
 	.reg_values = reg_values,
 	.pll_fin_min = 6,
 	.pll_fin_max = 12,
@@ -470,6 +472,7 @@ static const struct samsung_dsim_driver_data exynos5_dsi_driver_data = {
 	.lane_esc_clk_bit = 19,
 	.lane_esc_data_offset = 20,
 	.pll_p_offset = 13,
+	.main_vsa_offset = 22,
 	.reg_values = reg_values,
 	.pll_fin_min = 6,
 	.pll_fin_max = 12,
@@ -493,6 +496,7 @@ static const struct samsung_dsim_driver_data exynos5433_dsi_driver_data = {
 	.lane_esc_clk_bit = 19,
 	.lane_esc_data_offset = 20,
 	.pll_p_offset = 13,
+	.main_vsa_offset = 22,
 	.reg_values = exynos5433_reg_values,
 	.pll_fin_min = 6,
 	.pll_fin_max = 12,
@@ -516,6 +520,7 @@ static const struct samsung_dsim_driver_data exynos5422_dsi_driver_data = {
 	.lane_esc_clk_bit = 19,
 	.lane_esc_data_offset = 20,
 	.pll_p_offset = 13,
+	.main_vsa_offset = 22,
 	.reg_values = exynos5422_reg_values,
 	.pll_fin_min = 6,
 	.pll_fin_max = 12,
@@ -543,6 +548,7 @@ static const struct samsung_dsim_driver_data imx8mm_dsi_driver_data = {
 	 * downstream driver - drivers/gpu/drm/bridge/sec-dsim.c
 	 */
 	.pll_p_offset = 14,
+	.main_vsa_offset = 22,
 	.reg_values = imx8mm_dsim_reg_values,
 	.pll_fin_min = 2,
 	.pll_fin_max = 30,
@@ -1034,6 +1040,7 @@ static void samsung_dsim_set_display_mode(struct samsung_dsim *dsi)
 {
 	struct drm_display_mode *m = &dsi->mode;
 	unsigned int num_bits_resol = dsi->driver_data->num_bits_resol;
+	unsigned int main_vsa_offset = dsi->driver_data->main_vsa_offset;
 	u32 reg;
 
 	if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO) {
@@ -1060,7 +1067,7 @@ static void samsung_dsim_set_display_mode(struct samsung_dsim *dsi)
 		reg = DSIM_MAIN_HFP(hfp) | DSIM_MAIN_HBP(hbp);
 		samsung_dsim_write(dsi, DSIM_MHPORCH_REG, reg);
 
-		reg = DSIM_MAIN_VSA(m->vsync_end - m->vsync_start)
+		reg = DSIM_MAIN_VSA(m->vsync_end - m->vsync_start, main_vsa_offset)
 			| DSIM_MAIN_HSA(hsa);
 		samsung_dsim_write(dsi, DSIM_MSYNC_REG, reg);
 	}
diff --git a/include/drm/bridge/samsung-dsim.h b/include/drm/bridge/samsung-dsim.h
index 8938eccf78730019e0404101c855dc2d7d225668..a5f13f224b0817fe3135edd77276c4e715219cda 100644
--- a/include/drm/bridge/samsung-dsim.h
+++ b/include/drm/bridge/samsung-dsim.h
@@ -69,6 +69,7 @@ struct samsung_dsim_driver_data {
 	unsigned int lane_esc_clk_bit;
 	unsigned int lane_esc_data_offset;
 	unsigned int pll_p_offset;
+	unsigned int main_vsa_offset;
 	const unsigned int *reg_values;
 	unsigned int pll_fin_min;
 	unsigned int pll_fin_max;

-- 
2.49.0


