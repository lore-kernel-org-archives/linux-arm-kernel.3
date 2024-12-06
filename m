Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82170E77173
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 22:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4ylJIPNxbO7xn76YVao6H0547gcUYA8lw/D6rtOf88I=; b=yNuZ2NsF0ounYi/9CaTmDg9dV0
	q2g1xQVYynGgSYuuR6tkPKMGmYfh4WtOm2psWlasSIsMYCQDSO31pqt+qkgdmvfEW8rfzkkbzIC90
	6ktS9D8oGqk8tvH6PW0nf9DQPQcg8Gc37MRsgTA84eplD8zAl1JP40BYPfo7xmGvSHItaG3oo0qAF
	4WwHZaoHp4yUKyBTRwaMnNiJicGZc1plb/NfkgjBS/i0w2qcS9dY8nAO6kG2S6QDfY9PRfUwfLBLz
	F3RU6lIJwnASlwNBXFhBeLD5eRATNYDggbtxLvXhyUvUOjCK4kiLinFqmpQy2e/2SQVp7kB85g4Ao
	r46Qvnmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJgVa-00000002rXf-3Mfd;
	Fri, 06 Dec 2024 22:09:10 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJgQc-00000002qhK-0UvQ;
	Fri, 06 Dec 2024 22:04:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1733522639;
	bh=w5/YY2wqmqV6QgwYuiXdkpRkQEFMfdXMRewTbnvqfOI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=OKPBZ4WMhNwG9mP28+hs255Bl43GBXU0J7Y6V/Zv7fVi7YetP3gcicm+iFbD3Vzmo
	 0yIjljXtMdXwMjBgcDygWRpSlH235euZZWFWS9w/BfZ8TCWSaz+7AjiApqUtN2XbHE
	 dFGBCJpuEeKqfAEExSIofSXUUK+9WIW6BanRhlGt3inywEicNxx6NqmVmZ1N923AS0
	 k8jO/9g/G/WWiWyqphfVjJqoqP2XZ9Pv4EvAtCOjbL5aX9Ym1ryhEXzGoRshhNR/yl
	 iS+L82AgkDLAwdBt36RXzAYRLpeuFaxV680IK+CadB5+oWoxk8geM5zAD7LqSCHab6
	 aNCXY9XcnDlvw==
Received: from localhost (unknown [188.27.48.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B1DF817E380C;
	Fri,  6 Dec 2024 23:03:59 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Sat, 07 Dec 2024 00:03:44 +0200
Subject: [PATCH 4/4] phy: rockchip: samsung-hdptx: Add high color depth
 management
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241207-phy-sam-hdptx-bpc-v1-4-03c2e4d6d797@collabora.com>
References: <20241207-phy-sam-hdptx-bpc-v1-0-03c2e4d6d797@collabora.com>
In-Reply-To: <20241207-phy-sam-hdptx-bpc-v1-0-03c2e4d6d797@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: Sandor Yu <Sandor.yu@nxp.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Maxime Ripard <mripard@kernel.org>, kernel@collabora.com, 
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_140402_329946_9E088B1A 
X-CRM114-Status: GOOD (  10.18  )
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
index eeadebdc476caa87aebbbd82f7102b62b22a0ea6..76c30c4ad6768679c3e36e3d0789e716afc0bc30 100644
--- a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
+++ b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
@@ -274,6 +274,7 @@ struct rk_hdptx_phy {
 	int nr_clks;
 	struct reset_control_bulk_data rsts[RST_MAX];
 	unsigned long tmds_char_rate;
+	unsigned int bpc;
 
 	/* clk provider */
 	struct clk_hw hw;
@@ -814,6 +815,9 @@ static int rk_hdptx_ropll_tmds_cmn_config(struct rk_hdptx_phy *hdptx,
 	regmap_update_bits(hdptx->regmap, CMN_REG(0086), PLL_PCG_POSTDIV_SEL_MASK,
 			   FIELD_PREP(PLL_PCG_POSTDIV_SEL_MASK, cfg->pms_sdiv));
 
+	regmap_update_bits(hdptx->regmap, CMN_REG(0086), PLL_PCG_CLK_SEL_MASK,
+			   FIELD_PREP(PLL_PCG_CLK_SEL_MASK, (hdptx->bpc - 8) >> 1));
+
 	regmap_update_bits(hdptx->regmap, CMN_REG(0086), PLL_PCG_CLK_EN,
 			   PLL_PCG_CLK_EN);
 
@@ -916,7 +920,7 @@ static int rk_hdptx_phy_power_on(struct phy *phy)
 		rate = phy_get_bus_width(hdptx->phy) & 0xfffffff;
 	}
 
-	dev_dbg(hdptx->dev, "%s rate=%u\n", __func__, rate);
+	dev_dbg(hdptx->dev, "%s rate=%u bpc=%u\n", __func__, rate, hdptx->bpc);
 
 	ret = rk_hdptx_phy_consumer_get(hdptx, rate);
 	if (ret)
@@ -943,6 +947,18 @@ static int rk_hdptx_phy_configure(struct phy *phy,
 
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
 
@@ -1090,6 +1106,7 @@ static int rk_hdptx_phy_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	hdptx->dev = dev;
+	hdptx->bpc = 8;
 
 	regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(regs))

-- 
2.47.0


