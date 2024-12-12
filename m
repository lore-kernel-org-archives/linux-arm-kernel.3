Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7926EE77180
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 20:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0tEb2QxGUGpo0ORVLJfvOHuKP75jfFMOQhPvuXqyJRw=; b=zcLAZ0fX5yx5KH2TA9QS6CZ4yQ
	JdNC8rdRYDsUMt8WnmyOveeo/H1EpEVELSyBuF2s9JEq+ljE8poZpVJfz9CyG88qggZIxK5lozHJU
	ybKMv450lHL7RPXGDQ0mOTrCvcMcFqIh/Q603mCwusCctzlSKrcsiKjdy91wnpQUBjtvQZrGUrJqI
	WmpO3S0XWrNyl0mm3fPVwwS//n+UZWfW4GTTRhYYHnSXQGJyRhSiInAfkQiQR9Ssj9fe+lGPxbG3l
	ehDvBgPYyDhBIORg3HhRcgvwGt5WRgvwfi+DLMqYlu73DyQQtuWRJSdTiZNjRlAyGfyOwsr7Xqoev
	weiFW+7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLpX5-00000001lH4-27pf;
	Thu, 12 Dec 2024 20:11:35 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLpPk-00000001jjg-456M;
	Thu, 12 Dec 2024 20:04:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1734033839;
	bh=0KBDAKlS6OTWKJsepDHtAwj7Of1rpZ03O65zQOei1Q0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=pvpmLsnlAopc9qomZW/3qhi0MIBoJx3de9mjXNgBIaQIniAV2umZv8dQhqfCwCgVN
	 kamh5ZFgzGX16C/u2LVaW8WwDrQdJJXpcglGSMUEyPbhi0ffUNlebEQRaHjQmlt96U
	 jvIf+ot4z7BjoIMbwzEczrmpCxrqFgj1kj++7Y4G2Z/SLNE7dN1rPqpnfrcyr/Rlk8
	 FY051B5A9zTZqvz69s9umooGut/CvZWQbCp503GbrFUhCiu7tVG6Ta7MrY5pZ0fk8q
	 QRL3MixMXgpeifLacKqM8GhzFpcDGg9SUbO4vpUVJHTXTWlDxMhTEMh5Jf5m7IJyq9
	 jrkq8V0K8LC7Q==
Received: from localhost (unknown [188.27.48.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 42ADF17E3802;
	Thu, 12 Dec 2024 21:03:59 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Thu, 12 Dec 2024 22:03:37 +0200
Subject: [PATCH v2 6/8] phy: rockchip: samsung-hdptx: Add high color depth
 management
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241212-phy-sam-hdptx-bpc-v2-6-57e672c7c7c4@collabora.com>
References: <20241212-phy-sam-hdptx-bpc-v2-0-57e672c7c7c4@collabora.com>
In-Reply-To: <20241212-phy-sam-hdptx-bpc-v2-0-57e672c7c7c4@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: Algea Cao <algea.cao@rock-chips.com>, Sandor Yu <Sandor.yu@nxp.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Maxime Ripard <mripard@kernel.org>, kernel@collabora.com, 
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_120401_185769_AE20D87C 
X-CRM114-Status: GOOD (  11.09  )
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

Add support for 8-bit, 10-bit, 12-bit and 16-bit color depth setup.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
index bf0c7d74e70b9204c97c571e08cb0c140131acb9..d90d89cfdff561e13ac3db3f143a4eef9cc85a03 100644
--- a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
+++ b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
@@ -246,6 +246,7 @@ struct rk_hdptx_phy {
 
 	/* PHY config opts */
 	unsigned long tmds_char_rate;
+	unsigned int bpc;
 
 	/* clk provider */
 	struct clk_hw hw;
@@ -786,6 +787,9 @@ static int rk_hdptx_ropll_tmds_cmn_config(struct rk_hdptx_phy *hdptx,
 	regmap_update_bits(hdptx->regmap, CMN_REG(0086), PLL_PCG_POSTDIV_SEL_MASK,
 			   FIELD_PREP(PLL_PCG_POSTDIV_SEL_MASK, cfg->pms_sdiv));
 
+	regmap_update_bits(hdptx->regmap, CMN_REG(0086), PLL_PCG_CLK_SEL_MASK,
+			   FIELD_PREP(PLL_PCG_CLK_SEL_MASK, (hdptx->bpc - 8) >> 1));
+
 	regmap_update_bits(hdptx->regmap, CMN_REG(0086), PLL_PCG_CLK_EN,
 			   PLL_PCG_CLK_EN);
 
@@ -888,7 +892,7 @@ static int rk_hdptx_phy_power_on(struct phy *phy)
 		rate = phy_get_bus_width(hdptx->phy) & 0xfffffff;
 	}
 
-	dev_dbg(hdptx->dev, "%s rate=%u\n", __func__, rate);
+	dev_dbg(hdptx->dev, "%s rate=%u bpc=%u\n", __func__, rate, hdptx->bpc);
 
 	ret = rk_hdptx_phy_consumer_get(hdptx, rate);
 	if (ret)
@@ -915,6 +919,18 @@ static int rk_hdptx_phy_configure(struct phy *phy,
 
 	hdptx->tmds_char_rate = opts->hdmi.tmds_char_rate;
 
+	switch (opts->hdmi.bpc) {
+	case 8:
+	case 10:
+	case 12:
+	case 16:
+		hdptx->bpc = opts->hdmi.bpc;
+		break;
+	default:
+		dev_warn(hdptx->dev, "Discarded unsupported bpc: %u\n",
+			 opts->hdmi.bpc);
+	};
+
 	return 0;
 }
 
@@ -1062,6 +1078,7 @@ static int rk_hdptx_phy_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	hdptx->dev = dev;
+	hdptx->bpc = 8;
 
 	regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(regs))

-- 
2.47.0


