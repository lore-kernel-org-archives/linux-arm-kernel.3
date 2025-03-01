Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8D91C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Mar 2025 17:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=khpROQz+QoHslWzkgE9bCS7jGbs+TMKrHMOcimF7a4I=; b=iEmaO1JSgp6PXwYloHk+XB2MD9
	RLSERAMxXXQPePvrZb1wON6SPo7DSOVL6uWz/lhnNiIqcdDuEPxSgDcXtrzvojVp1aQcHBbxVq/Ns
	LiZrg2CK7MrjtGvREOqrKmFbseoEiZpgQMz9ZjWVLvNeHD1P3WXwT7Ol0ea6UAgvvmqUUpx/aPZPU
	BkjXHt9Qi5/LVoQvw0rrBPkbUyb6DNQUHutCfz7qtcR//mbY26boVF7y7+OqzpmTYagB44yjRQCXN
	LWNqLnp5fgUzRjKM8PaFoED+TB35ZissX0GDzQJfVip1aD9Pzi2fhJkLrNYAI87t6PJM/9Qz/TjI6
	s4IghJaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1toQoE-0000000EheK-29vO;
	Sat, 01 Mar 2025 17:39:30 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1toQlB-0000000Eh5h-06Md;
	Sat, 01 Mar 2025 17:36:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=khpROQz+QoHslWzkgE9bCS7jGbs+TMKrHMOcimF7a4I=; b=0fBkTHGP4ldi2nAVA5K4i25Xtb
	YZRlvA0+aq8oHnqqyaVNwNweokElJnVn1SG7vorhi89gKFsUmamxLngSd/2On6B/AGMX1ey0zpWdk
	+lw+LtXd7yEaHE47Pv4h7JvwX3dLw9WHayFqWATSuGcp6FYn7kOEF8PAeRpkuTdB3AkKfGJSwFtge
	0Ayf1wnHf4p8rjIHq2qkjnzk+c8vWNA2EhZ1zG/GyZs/IL2IBF9E2xzlhFdtpd0VaYaU3ufXroD37
	iW6pS+bT5TkovpbD/Wu9IeAHBOw+BVs+CzS+hxzxZpcYlq1fiy4NsUVRocyBYuMzpKeWt17S9uTZ/
	Nvf91OKw==;
Received: from i53875b47.versanet.de ([83.135.91.71] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1toQkn-0001Tm-OM; Sat, 01 Mar 2025 18:35:57 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: andy.yan@rock-chips.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	quentin.schulz@cherry.de,
	Heiko Stuebner <heiko.stuebner@cherry.de>
Subject: [PATCH v2 1/2] drm/rockchip: lvds: move pclk preparation in with clk_get
Date: Sat,  1 Mar 2025 18:35:46 +0100
Message-ID: <20250301173547.710245-2-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250301173547.710245-1-heiko@sntech.de>
References: <20250301173547.710245-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250301_093621_066668_113406C2 
X-CRM114-Status: GOOD (  17.27  )
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

From: Heiko Stuebner <heiko.stuebner@cherry.de>

The LVDS block needs a separate pclk only on some socs, so currently
requests and prepares it in the soc-specific probe function, but common
code is required to unprepare it in the error path or on driver remove.

While this works because clk_unprepare just does nothing if clk is NULL,
this mismatch of who is responsible still is not very nice.
The clock-framework already has a helper for clk-get-and-prepare even
with devres support in devm_clk_get_prepared().

This will get and prepare the clock and also unprepare it on driver
removal, saving the driver from having to handle it "manually".

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
---
 drivers/gpu/drm/rockchip/rockchip_lvds.c | 19 +++----------------
 1 file changed, 3 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_lvds.c b/drivers/gpu/drm/rockchip/rockchip_lvds.c
index 385cf6881504..ecfae8d5da89 100644
--- a/drivers/gpu/drm/rockchip/rockchip_lvds.c
+++ b/drivers/gpu/drm/rockchip/rockchip_lvds.c
@@ -448,15 +448,13 @@ struct drm_encoder_helper_funcs px30_lvds_encoder_helper_funcs = {
 static int rk3288_lvds_probe(struct platform_device *pdev,
 			     struct rockchip_lvds *lvds)
 {
-	int ret;
-
 	lvds->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(lvds->regs))
 		return PTR_ERR(lvds->regs);
 
-	lvds->pclk = devm_clk_get(lvds->dev, "pclk_lvds");
+	lvds->pclk = devm_clk_get_prepared(lvds->dev, "pclk_lvds");
 	if (IS_ERR(lvds->pclk)) {
-		DRM_DEV_ERROR(lvds->dev, "could not get pclk_lvds\n");
+		DRM_DEV_ERROR(lvds->dev, "could not get or prepare pclk_lvds\n");
 		return PTR_ERR(lvds->pclk);
 	}
 
@@ -480,12 +478,6 @@ static int rk3288_lvds_probe(struct platform_device *pdev,
 		}
 	}
 
-	ret = clk_prepare(lvds->pclk);
-	if (ret < 0) {
-		DRM_DEV_ERROR(lvds->dev, "failed to prepare pclk_lvds\n");
-		return ret;
-	}
-
 	return 0;
 }
 
@@ -728,20 +720,15 @@ static int rockchip_lvds_probe(struct platform_device *pdev)
 	dev_set_drvdata(dev, lvds);
 
 	ret = component_add(&pdev->dev, &rockchip_lvds_component_ops);
-	if (ret < 0) {
+	if (ret < 0)
 		DRM_DEV_ERROR(dev, "failed to add component\n");
-		clk_unprepare(lvds->pclk);
-	}
 
 	return ret;
 }
 
 static void rockchip_lvds_remove(struct platform_device *pdev)
 {
-	struct rockchip_lvds *lvds = platform_get_drvdata(pdev);
-
 	component_del(&pdev->dev, &rockchip_lvds_component_ops);
-	clk_unprepare(lvds->pclk);
 }
 
 struct platform_driver rockchip_lvds_driver = {
-- 
2.47.2


