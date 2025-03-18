Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DA91C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 13:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yyKqSA81R6aCyfO/LL2/OWylQ2rovN4BkkdOD1d9kwk=; b=B8LM9sDLZXRKt3f/6kJ4O6Qx/A
	D9NxcTBmAeE5zMbBKKQKTJGANQTzo8HIbQ+lybO0ywt8VAc6JTBoObVBld+/aWahKMXTDTQucODIU
	kOaCPy8NNS+xwM9ObaU8t4tn4lJ78StSkaqgcIJwgLlsIDlRuLrx/7eUEdRv0m7pnO/cGYggLkBN+
	pgWli0xNI+fl9LjMRwbTVEXsexDQTgNLUyCl9JvziXwazv5OF1DUT5vcZ2AKnX9W1RNWz3Hxkn0ZP
	BpKahAQK+c8Uq1JPkkSxKyvdvUO1Omp897+grxV99VOLkoc7LS/WeRSSxzmNuT/fD04shxHzW0OOv
	TO0A/d/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuWa5-00000005xbh-1sd9;
	Tue, 18 Mar 2025 13:02:05 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuWC2-00000005tkC-11tE;
	Tue, 18 Mar 2025 12:37:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1742301433;
	bh=McNeaXrm4EsMnZWOXEDFXBNpHgJWMUFQS+VAPDQUEm0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Quh4J8MpdzTsZAEdZd9cxG3/78tUDy5C5nGvMqa2FIplkJfeE1wGhHLZttZhtqNpY
	 TeOZZjme5F6GFSkAnnNEmbMZa6erIC0lsH2sxH+GpAQdYDxIwVKa2cC0icJOtPT06f
	 7qsO2w0n0o1/jJMCtR70rlly42OolBGiNiqsSXjC+mmq57DLIp/AOQz4QsoyTJac+o
	 5uNyvEuZv/TE9ly9089ZWjlfRJ2P/wPjSJ6v3RUyF/tLINoL36c13Up4HYuIDUUKJa
	 rjycxvqa9nqEReA1Tcjc5rug22p6NWCghwre6nU0N9CVnfRpJtNdZkQf0hS2A2Yt2g
	 OiD+cdasZ9oMw==
Received: from localhost (unknown [84.232.140.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id CB80617E1581;
	Tue, 18 Mar 2025 13:37:12 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Tue, 18 Mar 2025 14:35:48 +0200
Subject: [PATCH v6 14/14] phy: rockchip: samsung-hdptx: Add high color
 depth management
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250318-phy-sam-hdptx-bpc-v6-14-8cb1678e7663@collabora.com>
References: <20250318-phy-sam-hdptx-bpc-v6-0-8cb1678e7663@collabora.com>
In-Reply-To: <20250318-phy-sam-hdptx-bpc-v6-0-8cb1678e7663@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: Algea Cao <algea.cao@rock-chips.com>, Sandor Yu <Sandor.yu@nxp.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Maxime Ripard <mripard@kernel.org>, kernel@collabora.com, 
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_053714_433452_E9B9D676 
X-CRM114-Status: UNSURE (   9.53  )
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

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
index d09e1f7b25ec131d3c40fb52564cad27dce3b2d4..fc289ed8d915d84916870329101655cd956898e3 100644
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


