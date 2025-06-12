Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49318C61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 20:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lEpb9YqhdfBJoVfAJ02+lFNP3YUuQT1vGEUPenhl3T0=; b=HS3RvbzYygNPj9TiPNWVzh3t5D
	n7CgW9+oyb9h4WeFLKy8DaPVMp/kQHtsgO7mLCz0VeiI6YoS0pdnT+LFWeJgYGKH80pEFr8z2qWsh
	3O//TlvNGEw8ff/rfpODlTyEC3DF9e7xJzRG/A4r769DuLDCaX1mfeUJbGs4v7KVE58MBPt0wyG7j
	XnTzG2lgeQjL6hmO8ls4NbaJV8q2bBcQ0toauQH/ZJsFlAqRmht3L5KjLbHCBx4xt9i7oTPPAAzTn
	twqW5vFF/aF3jEfxS8XUP0WIX0bsHxFUdMiumsfKgbNH5OSY4zkMTtzmkaFUF7vYny0MfeNbdUuwJ
	J5GpWpHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPoww-0000000EYSc-1jfw;
	Thu, 12 Jun 2025 20:55:05 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPjiS-0000000DlOF-3d3O
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 15:19:46 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id AAAA725F66;
	Thu, 12 Jun 2025 17:19:43 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cmohOJwEMi3Y; Thu, 12 Jun 2025 17:19:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1749741575; bh=t0tNeQ09cfcoOR3jWQMVuzBgVsT/PRRxIHjdoYCTVns=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=EG/qIH+SUkutiNcrjzLX+2A0BXYi7CnSNTU9FjVPwqQSlZazSq3Q4jVbn8W6QK8MP
	 lIFyZ5654ZWv3UfX+yilBgBeybxwXjT9zC0IvIKMd5cSXyNUGPuKr89Eq4DXr/CSLt
	 C3UKoV4X0F0tnHDY43uyDzNxImyFrGcWxH+NtFQFzafP7prf9nq3xX0+BV34CXPiSN
	 Ia9qLMr1Vrstn4bVVXwFsxadWbAs1REjzltmvrkUhaRk/ZO7WSw3HijPtu0Zhv1wCc
	 Ox1U1wkxEFn3jSg5YibhIZGP2dCR7JCvNJ/gEDzBGj7MU78kFPUeHZF2CfeFaCFJek
	 nuK2rJbRyL/gw==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Thu, 12 Jun 2025 20:48:11 +0530
Subject: [PATCH 07/12] drm/bridge: samsung-dsim: allow configuring PLL_M
 and PLL_S offsets
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-exynos7870-dsim-v1-7-1a330bca89df@disroot.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749741499; l=4314;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=t0tNeQ09cfcoOR3jWQMVuzBgVsT/PRRxIHjdoYCTVns=;
 b=jKYhANUYtmfxsLbWwE73uvDwKR+ThqY2A3fFHZCXBEljZX8K613XtAgRNZqEmlKJ7mfCjvhnj
 eUif1B9EtjhADTHjqPwWGTEeWIr9rsgvB3WRg/DsVAHbSQJzanYGQaJ
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_081945_181273_11C9ECEF 
X-CRM114-Status: GOOD (  14.56  )
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

Currently, PLL_P offset of DSIM_PLLCTRL is configurable in the driver
data, while PLL_M and PLL_S offsets are hardcoded as 4-bit and 1-bit
offsets respectively, but Exynos7870's DSIM have them at 3-bit and 0-bit
offsets as per downstream kernel sources.

In order to support both, move both offset values to the driver data
struct and define it for every driver compatible. Reference the values
from there instead, in functions wherever required.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 21 ++++++++++++++++-----
 include/drm/bridge/samsung-dsim.h     |  2 ++
 2 files changed, 18 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index 35fca1b0f3dc71d22feb121c4e2c2c108bfaa7c4..fa7d21b08097dac09f90941200580af509924bdb 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -189,9 +189,7 @@
 #define DSIM_PLL_DPDNSWAP_DAT		(1 << 24)
 #define DSIM_FREQ_BAND(x)		((x) << 24)
 #define DSIM_PLL_EN			BIT(23)
-#define DSIM_PLL_P(x, offset)		((x) << (offset))
-#define DSIM_PLL_M(x)			((x) << 4)
-#define DSIM_PLL_S(x)			((x) << 1)
+#define DSIM_PLL(x, offset)		((x) << (offset))
 
 /* DSIM_PHYCTRL */
 #define DSIM_PHYCTRL_ULPS_EXIT(x)	(((x) & 0x1ff) << 0)
@@ -421,6 +419,8 @@ static const struct samsung_dsim_driver_data exynos3_dsi_driver_data = {
 	.lane_esc_clk_bit = 19,
 	.lane_esc_data_offset = 20,
 	.pll_p_offset = 13,
+	.pll_m_offset = 4,
+	.pll_s_offset = 1,
 	.main_vsa_offset = 22,
 	.reg_values = reg_values,
 	.pll_fin_min = 6,
@@ -448,6 +448,8 @@ static const struct samsung_dsim_driver_data exynos4_dsi_driver_data = {
 	.lane_esc_clk_bit = 19,
 	.lane_esc_data_offset = 20,
 	.pll_p_offset = 13,
+	.pll_m_offset = 4,
+	.pll_s_offset = 1,
 	.main_vsa_offset = 22,
 	.reg_values = reg_values,
 	.pll_fin_min = 6,
@@ -473,6 +475,8 @@ static const struct samsung_dsim_driver_data exynos5_dsi_driver_data = {
 	.lane_esc_clk_bit = 19,
 	.lane_esc_data_offset = 20,
 	.pll_p_offset = 13,
+	.pll_m_offset = 4,
+	.pll_s_offset = 1,
 	.main_vsa_offset = 22,
 	.reg_values = reg_values,
 	.pll_fin_min = 6,
@@ -498,6 +502,8 @@ static const struct samsung_dsim_driver_data exynos5433_dsi_driver_data = {
 	.lane_esc_clk_bit = 19,
 	.lane_esc_data_offset = 20,
 	.pll_p_offset = 13,
+	.pll_m_offset = 4,
+	.pll_s_offset = 1,
 	.main_vsa_offset = 22,
 	.reg_values = exynos5433_reg_values,
 	.pll_fin_min = 6,
@@ -523,6 +529,8 @@ static const struct samsung_dsim_driver_data exynos5422_dsi_driver_data = {
 	.lane_esc_clk_bit = 19,
 	.lane_esc_data_offset = 20,
 	.pll_p_offset = 13,
+	.pll_m_offset = 4,
+	.pll_s_offset = 1,
 	.main_vsa_offset = 22,
 	.reg_values = exynos5422_reg_values,
 	.pll_fin_min = 6,
@@ -552,6 +560,8 @@ static const struct samsung_dsim_driver_data imx8mm_dsi_driver_data = {
 	 * downstream driver - drivers/gpu/drm/bridge/sec-dsim.c
 	 */
 	.pll_p_offset = 14,
+	.pll_m_offset = 4,
+	.pll_s_offset = 1,
 	.main_vsa_offset = 22,
 	.reg_values = imx8mm_dsim_reg_values,
 	.pll_fin_min = 2,
@@ -707,8 +717,9 @@ static unsigned long samsung_dsim_set_pll(struct samsung_dsim *dsi,
 	writel(driver_data->reg_values[PLL_TIMER],
 	       dsi->reg_base + driver_data->plltmr_reg);
 
-	reg = DSIM_PLL_EN | DSIM_PLL_P(p, driver_data->pll_p_offset) |
-	      DSIM_PLL_M(m) | DSIM_PLL_S(s);
+	reg = DSIM_PLL_EN | DSIM_PLL(p, driver_data->pll_p_offset)
+			  | DSIM_PLL(m, driver_data->pll_m_offset)
+			  | DSIM_PLL(s, driver_data->pll_s_offset);
 
 	if (driver_data->has_freqband) {
 		static const unsigned long freq_bands[] = {
diff --git a/include/drm/bridge/samsung-dsim.h b/include/drm/bridge/samsung-dsim.h
index f364fd2703c3644e822df30408d82cc3d6206b05..def9b4c6ef28eede8175aaa84c495c5444d0f103 100644
--- a/include/drm/bridge/samsung-dsim.h
+++ b/include/drm/bridge/samsung-dsim.h
@@ -70,6 +70,8 @@ struct samsung_dsim_driver_data {
 	unsigned int lane_esc_clk_bit;
 	unsigned int lane_esc_data_offset;
 	unsigned int pll_p_offset;
+	unsigned int pll_m_offset;
+	unsigned int pll_s_offset;
 	unsigned int main_vsa_offset;
 	const unsigned int *reg_values;
 	unsigned int pll_fin_min;

-- 
2.49.0


