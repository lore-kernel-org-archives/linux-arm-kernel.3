Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D976E66886
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Dec 2025 10:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ykZ9XjWkOHldRT4cN90uTNccs82JkkPuPVtgP2Lv5Io=; b=XQymnIXj7ZGTrHwbDIeuEQuZTp
	BuronhGLa00J7qSYGIbRz9AKs90jixnvdQB705gGzKpGBahJ6GyUvFLjF8f/AlOfvZg9MMvQ/kTLP
	UYM1o6Ub7eGUEo4mDJDV1XFNquc8IAb+QqFEGngMTMsSSkKSp7Vr3aftGJoSvwoQVKH1u00Re4/Xp
	9Fvi1U+VUVFF4yyOUkMdhQYj7cYqxvo7mIdpBoPmj7P09f87Eb+7B/87c7BxjW61255Xh37w2T3kH
	uTBumbgGhStIcDJKgducPch+PQv+oP/aKJhczc82pu4K3BIXiYO49Em0lv/yEDnF+kzFm54WkIcBI
	eQI0fS4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXGy8-0000000CL8L-2kYy;
	Sun, 21 Dec 2025 10:47:20 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXGxx-0000000CKvF-1nkW;
	Sun, 21 Dec 2025 10:47:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1766314026;
	bh=5rfOgISBLmyjOyZ8Fnzh3ZfSqcWEflITTY4405YuFVU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=d5H4MfiGdzom97xzQ4YgHlIohQCyes8i2J0KQ8gBcZrhq45thA8Ky8mWHdlouAMG4
	 FFLFBxR0Msqa+6sOnAjjsr83ktrTbWZL94tKbrDFrD/1Xo0FdC7NzFv7kZNiS2W7cJ
	 K5axVl67BkFeLOl6Kx/gmAH04PfUqEevQ4l9MJWScIEDTjHAHow/xrwDAp8dN9T3+P
	 GlbnVJ7UgCAp5wAv7RzeUu9DBd8OiiVTuvsiSOrgtWPCjp+mbMUijk9dGEVraXG0C4
	 5K1YmFdVk4xvfIOlfXyz1WmeGlA8w2arXw4t9YRMCt4NOXTF0Zb+8LQt6OKHvyAssC
	 1qukXoA278LNA==
Received: from localhost (unknown [82.79.138.145])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EC53717E13D0;
	Sun, 21 Dec 2025 11:47:05 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Sun, 21 Dec 2025 12:46:52 +0200
Subject: [PATCH v5 05/11] phy: rockchip: samsung-hdptx: Enable lane output
 in common helper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251221-phy-hdptx-frl-v5-5-dac390a780be@collabora.com>
References: <20251221-phy-hdptx-frl-v5-0-dac390a780be@collabora.com>
In-Reply-To: <20251221-phy-hdptx-frl-v5-0-dac390a780be@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Algea Cao <algea.cao@rock-chips.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: kernel@collabora.com, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251221_024711_687801_53BC0D9A 
X-CRM114-Status: UNSURE (   8.94  )
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

In preparation to support FRL mode, move the PHY lane output enablement
from the TMDS specific configuration to the common *_post_enable_lane()
helper and make sure it gets turned off in *_phy_disable().

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
index ac315061b6ee..7e5e0332f3bf 100644
--- a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
+++ b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
@@ -797,6 +797,8 @@ static int rk_hdptx_post_enable_lane(struct rk_hdptx_phy *hdptx)
 	       HDPTX_I_BIAS_EN | HDPTX_I_BGR_EN;
 	regmap_write(hdptx->grf, GRF_HDPTX_CON0, val);
 
+	regmap_write(hdptx->regmap, LNTOP_REG(0207), 0x0f);
+
 	ret = regmap_read_poll_timeout(hdptx->grf, GRF_HDPTX_STATUS, val,
 				       (val & HDPTX_O_PHY_RDY) &&
 				       (val & HDPTX_O_PLL_LOCK_DONE),
@@ -850,6 +852,7 @@ static void rk_hdptx_phy_disable(struct rk_hdptx_phy *hdptx)
 	usleep_range(20, 30);
 	reset_control_deassert(hdptx->rsts[RST_APB].rstc);
 
+	regmap_write(hdptx->regmap, LNTOP_REG(0207), 0x0);
 	regmap_write(hdptx->regmap, LANE_REG(0300), 0x82);
 	regmap_write(hdptx->regmap, SB_REG(010f), 0xc1);
 	regmap_write(hdptx->regmap, SB_REG(0110), 0x1);
@@ -1027,7 +1030,6 @@ static int rk_hdptx_tmds_ropll_mode_config(struct rk_hdptx_phy *hdptx)
 	}
 
 	regmap_write(hdptx->regmap, LNTOP_REG(0206), 0x07);
-	regmap_write(hdptx->regmap, LNTOP_REG(0207), 0x0f);
 
 	rk_hdptx_multi_reg_write(hdptx, rk_hdptx_common_lane_init_seq);
 	rk_hdptx_multi_reg_write(hdptx, rk_hdptx_tmds_lane_init_seq);

-- 
2.51.2


