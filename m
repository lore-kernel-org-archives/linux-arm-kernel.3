Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B065C28B25
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Mar 2025 12:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rlQ/zKjOhk+7Eff1ZvVviDO08NIbxxuDB/l6YUMqYkw=; b=H4O4kLwNpoEd0+Z/Bymtfrj2no
	CZAZBMLimAb8AcA4Nu4Vh9TuEVDfqxCAaH7i6ysObn0Ky6+zbZpOhCJQdjkhNrad2hRZVJLP6lecE
	YnJ3t5M0uu8nXOt4vPLdB4rDqi8d2Wo8WYJD6AOpfPl8IOWYFzL77FLnSwUPb0vOc50czeQX0y/f8
	wj+ZJXfvqv4g1f3Fa5h3yxaNmvw2wGdtyAKE/YJwhAo4JiPFUAYKeEg3Gp09bbRzH5tHDirGQEYGE
	VOiIeB0hnJA6wcaW2Ilcg8jvVBlDu6JOUAW/mH5o/fFQXYwk5t7PmTHFJwKrAiUWM2gDAn8lDUI/O
	o2jvqR9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqtUn-0000000GcPL-2m34;
	Sat, 08 Mar 2025 12:41:37 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqtBZ-0000000GZgJ-2b4t;
	Sat, 08 Mar 2025 12:21:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1741436504;
	bh=lml/dpWS51d1l7pxeFA3I8arwVEqHo/afRbukZAkt8Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=VjDqM1TUvLUofFOdAwLKcwBLB4fwP3QQZK/Cs4OwXvIu2y5aYh1RO70YdLxw6VHP/
	 60TlK+bKztDXcMQaWjpvMKLXrHf4jsTVt3Lk2F4JLEMiiEdazyKdOfGPi3OXpjLcNX
	 IeqiKlVjEkfgr6B3TK584ovM9EBOXeJMEu7s9RxSXqSUwr5wwvyBvxUIT3HOTqXznQ
	 CBjrBqMjXDlS99CzVPGlUQxcoP7oozfQQNgltejyuaYe9K+Nt/hu1p1ZoWCRY+JJAg
	 xmRWacuxifkb4GU+woToupytLsuKFjPcypHT3dXd7vz8ZFoFxo59nDM2m6OP4rA4Pp
	 oGbiMOUb0weVg==
Received: from localhost (unknown [84.232.140.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id 2829917E0F75;
	Sat,  8 Mar 2025 13:21:44 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Sat, 08 Mar 2025 14:21:21 +0200
Subject: [PATCH v5 12/12] phy: rockchip: samsung-hdptx: Add high color
 depth management
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250308-phy-sam-hdptx-bpc-v5-12-35087287f9d1@collabora.com>
References: <20250308-phy-sam-hdptx-bpc-v5-0-35087287f9d1@collabora.com>
In-Reply-To: <20250308-phy-sam-hdptx-bpc-v5-0-35087287f9d1@collabora.com>
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
X-CRM114-CacheID: sfid-20250308_042145_819433_8ACF1409 
X-CRM114-Status: UNSURE (   9.41  )
X-CRM114-Notice: Please train this message.
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
 drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
index 98f831c3704f5cd65dcf29a4f0a12862a4aa0482..d115a026f013fdbcd025626bccaa30639856fad7 100644
--- a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
+++ b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
@@ -1028,6 +1028,9 @@ static int rk_hdptx_ropll_tmds_cmn_config(struct rk_hdptx_phy *hdptx)
 	regmap_update_bits(hdptx->regmap, CMN_REG(0086), PLL_PCG_POSTDIV_SEL_MASK,
 			   FIELD_PREP(PLL_PCG_POSTDIV_SEL_MASK, cfg->pms_sdiv));
 
+	regmap_update_bits(hdptx->regmap, CMN_REG(0086), PLL_PCG_CLK_SEL_MASK,
+			   FIELD_PREP(PLL_PCG_CLK_SEL_MASK, (hdptx->hdmi_cfg.bpc - 8) >> 1));
+
 	regmap_update_bits(hdptx->regmap, CMN_REG(0086), PLL_PCG_CLK_EN_MASK,
 			   FIELD_PREP(PLL_PCG_CLK_EN_MASK, 0x1));
 
@@ -1427,7 +1430,8 @@ static int rk_hdptx_phy_power_on(struct phy *phy)
 			hdptx->hdmi_cfg.tmds_char_rate *= 100;
 		}
 
-		dev_dbg(hdptx->dev, "%s rate=%llu\n", __func__, hdptx->hdmi_cfg.tmds_char_rate);
+		dev_dbg(hdptx->dev, "%s rate=%llu bpc=%u\n", __func__,
+			hdptx->hdmi_cfg.tmds_char_rate, hdptx->hdmi_cfg.bpc);
 	}
 
 	ret = rk_hdptx_phy_consumer_get(hdptx);
@@ -1492,6 +1496,19 @@ static int rk_hdptx_phy_verify_hdmi_config(struct rk_hdptx_phy *hdptx,
 	    !rk_hdptx_phy_clk_pll_calc(hdmi->tmds_char_rate, NULL))
 		return -EINVAL;
 
+	if (!hdmi->bpc)
+		hdmi->bpc = 8;
+
+	switch (hdmi->bpc) {
+	case 8:
+	case 10:
+	case 12:
+	case 16:
+		break;
+	default:
+		return -EINVAL;
+	};
+
 	return 0;
 }
 
@@ -1764,6 +1781,9 @@ static int rk_hdptx_phy_configure(struct phy *phy, union phy_configure_opts *opt
 			hdptx->hdmi_cfg = opts->hdmi;
 			hdptx->restrict_rate_change = true;
 		}
+
+		dev_dbg(hdptx->dev, "%s rate=%llu bpc=%u\n", __func__,
+			hdptx->hdmi_cfg.tmds_char_rate, hdptx->hdmi_cfg.bpc);
 		return ret;
 	}
 
@@ -1972,6 +1992,7 @@ static int rk_hdptx_phy_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	hdptx->dev = dev;
+	hdptx->hdmi_cfg.bpc = 8;
 
 	regs = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 	if (IS_ERR(regs))

-- 
2.48.1


