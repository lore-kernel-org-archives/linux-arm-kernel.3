Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 048F0C5DF7D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 10:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rv/scIPz8G4Cn2mcgUby929gL9p3oFxwNFjqH9wW/Lw=; b=bfsRFSxOgrnFMB+Zw5cEMrylAV
	P5ZTvzem3fWW3+ToJyXU7B5G54ejd44GsR8f6ayIQm1lDIl8AeiUe0s0VcSt19VSFAXTwFDWk2w8k
	rvDaZAx/nQH7kgoaVyBHR0hWheP2umkwxSHiGvc8vGqaDXqEfHyV5JKNOiSJntEsr9ypKr0QxM0Z4
	BEwRS++iBJG4fouzZ5V3RV+eVdYLI0uhcksmAHGlODiv3tgJMXRRzTDv2nQ2/nUw41bSBDgttMMxd
	cyiM6zsjNiksRWp1XpalJXKayK51vj39VmEAYrXYlCInt4SwVImhK/Gcie1kSujoqC2fNpFdH6Ptx
	1D85rrXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxM5n-0000000D0J4-3ac2;
	Fri, 21 Aug 2026 10:03:19 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxM5k-0000000D0Hq-0ekJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 10:03:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 97ACD60DBF;
	Fri, 21 Aug 2026 10:03:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00A881F00A3A;
	Fri, 21 Aug 2026 10:03:11 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Chen-Yu Tsai <wens@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/2] drm/sun4i: Make sure clk_init_data is fully initialized
Date: Fri, 21 Aug 2026 12:03:02 +0200
Message-ID: <0f37278d04c02461e17f42032a379dccfb773171.1787239944.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1787239944.git.geert+renesas@glider.be>
References: <cover.1787239944.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The clk_init_data structure contains several mutually-exclusive members
for different methods to specify the possible parents of a clock,
prompting drivers to initialize only the members they need.  However,
not initializing all members may cause subtle issues, which are only
exposed when CONFIG_INIT_STACK_ALL_PATTERN or CONFIG_INIT_STACK_NONE is
enabled.

Make sure all members are fully initialized, to avoid such bugs, and to
prevent future breakage when converting drivers to a different method
for specifying the parents.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Compile-tested only.
---
 drivers/gpu/drm/sun4i/sun4i_hdmi_ddc_clk.c  | 2 +-
 drivers/gpu/drm/sun4i/sun4i_hdmi_tmds_clk.c | 2 +-
 drivers/gpu/drm/sun4i/sun4i_tcon_dclk.c     | 2 +-
 drivers/gpu/drm/sun4i/sun8i_hdmi_phy_clk.c  | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi_ddc_clk.c b/drivers/gpu/drm/sun4i/sun4i_hdmi_ddc_clk.c
index b1beadb9bb59f8ff..958099d137f8df9b 100644
--- a/drivers/gpu/drm/sun4i/sun4i_hdmi_ddc_clk.c
+++ b/drivers/gpu/drm/sun4i/sun4i_hdmi_ddc_clk.c
@@ -109,7 +109,7 @@ static const struct clk_ops sun4i_ddc_ops = {
 
 int sun4i_ddc_create(struct sun4i_hdmi *hdmi, struct clk *parent)
 {
-	struct clk_init_data init;
+	struct clk_init_data init = {};
 	struct sun4i_ddc *ddc;
 	const char *parent_name;
 
diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi_tmds_clk.c b/drivers/gpu/drm/sun4i/sun4i_hdmi_tmds_clk.c
index fbf7da9d9592141b..15b09d5479d97aa3 100644
--- a/drivers/gpu/drm/sun4i/sun4i_hdmi_tmds_clk.c
+++ b/drivers/gpu/drm/sun4i/sun4i_hdmi_tmds_clk.c
@@ -202,7 +202,7 @@ static const struct clk_ops sun4i_tmds_ops = {
 
 int sun4i_tmds_create(struct sun4i_hdmi *hdmi)
 {
-	struct clk_init_data init;
+	struct clk_init_data init = {};
 	struct sun4i_tmds *tmds;
 	const char *parents[2];
 
diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon_dclk.c b/drivers/gpu/drm/sun4i/sun4i_tcon_dclk.c
index 4afb12bd5281f0d1..bdac1d622cc41351 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tcon_dclk.c
+++ b/drivers/gpu/drm/sun4i/sun4i_tcon_dclk.c
@@ -167,7 +167,7 @@ static const struct clk_ops sun4i_dclk_ops = {
 int sun4i_dclk_create(struct device *dev, struct sun4i_tcon *tcon)
 {
 	const char *clk_name, *parent_name;
-	struct clk_init_data init;
+	struct clk_init_data init = {};
 	struct sun4i_dclk *dclk;
 	int ret;
 
diff --git a/drivers/gpu/drm/sun4i/sun8i_hdmi_phy_clk.c b/drivers/gpu/drm/sun4i/sun8i_hdmi_phy_clk.c
index a4d31fe3abff1ab1..bd0dba95421b3d8e 100644
--- a/drivers/gpu/drm/sun4i/sun8i_hdmi_phy_clk.c
+++ b/drivers/gpu/drm/sun4i/sun8i_hdmi_phy_clk.c
@@ -143,7 +143,7 @@ static const struct clk_ops sun8i_phy_clk_ops = {
 int sun8i_phy_clk_create(struct sun8i_hdmi_phy *phy, struct device *dev,
 			 bool second_parent)
 {
-	struct clk_init_data init;
+	struct clk_init_data init = {};
 	struct sun8i_phy_clk *priv;
 	const char *parents[2];
 
-- 
2.43.0


