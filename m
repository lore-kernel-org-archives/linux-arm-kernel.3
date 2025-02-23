Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64A7DC021B2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Feb 2025 11:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=04jaN2O8oFvrHPCyZG2RNvrqYdHwiCCCvKHqiFzZR94=; b=3KQsGZvO55VJM+UQ71JROZpk7D
	kkZMhLURX+i3Pb6+LaEY7Gqwv19auM/7/nkVxwxWH9VK/EbRGCWegyrnLfUUMfENIMHBsLpojD6Wl
	h4IkX2Ol2TaSE8cimSe6B/gLQK7eaK7MZXkpEDzsdi9NSDEhcTc89FCdy7eMvXUvmqzbO7v6cIq4O
	BPcE8NSqRjT9606S8j5c5o0Q6VG2IJngBBrzEfLqpMp7VJUqN0phISAoS0dP6vmRt+CQ0OTaF/SB8
	I8JAbu0BQVr7Y4D7S16sn+osT7QjGIdj7NDhVL3EcVX05QMR4kgUHJVbsG7ypGUorztw79YqENqSI
	FlTVa59g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tm9uq-0000000AwXp-3YU6;
	Sun, 23 Feb 2025 11:12:56 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tm9km-0000000Aurj-18Gb;
	Sun, 23 Feb 2025 11:02:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1740308550;
	bh=wi5gL1MuujVnvpKHlNtHCdmjCVgPVDm9mY+mNnIouZw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=cbNDR1Z2WcSH6Bp+0ozgwgcnL8D4NvzT6LrFA8JAx5sLFHuVYGq6sFHB+ZxASsIoy
	 xrVvaYMKdqFJmH8sYsfMuOsn2MHpz+hePXlZgC4qC4g3HMhl3e0N72jHGKEGn+Zf2l
	 a5gMRniXYoJGPtQOddrGaxpK2MYMkaqbp4zUNHo0qhMG2qcd2bpf+8zhJYB0Egb4F5
	 uPWlhu4fKoeOzHr4xDWv13kltlBFJbBuAXKkWHyQEt9rcY8lBzhuw6sWi1hhOMeQOr
	 0nmZrO+Y57IKnWeXwYCh6iud3ynwe3+IWI41O1j3nGy6+Vi3mK5H+/g2sInw39n1ll
	 eNyMzbIDZ9V7w==
Received: from localhost (unknown [188.27.58.83])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id BF71F17E0199;
	Sun, 23 Feb 2025 12:02:30 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Sun, 23 Feb 2025 13:02:13 +0200
Subject: [PATCH v3 6/8] phy: rockchip: samsung-hdptx: Add high color depth
 management
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250223-phy-sam-hdptx-bpc-v3-6-66a5c8e68327@collabora.com>
References: <20250223-phy-sam-hdptx-bpc-v3-0-66a5c8e68327@collabora.com>
In-Reply-To: <20250223-phy-sam-hdptx-bpc-v3-0-66a5c8e68327@collabora.com>
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
X-CRM114-CacheID: sfid-20250223_030232_454784_332E3F8C 
X-CRM114-Status: GOOD (  11.36  )
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
 drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
index dd91a7272e246b2133112effdb080a847fd15abe..792ed3d1459f84e735041f55cac15941f6f785ef 100644
--- a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
+++ b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
@@ -404,6 +404,7 @@ struct rk_hdptx_phy {
 
 	/* PHY config opts */
 	unsigned long tmds_char_rate;
+	unsigned int bpc;
 
 	/* clk provider */
 	struct clk_hw hw;
@@ -1032,6 +1033,9 @@ static int rk_hdptx_ropll_tmds_cmn_config(struct rk_hdptx_phy *hdptx,
 	regmap_update_bits(hdptx->regmap, CMN_REG(0086), PLL_PCG_POSTDIV_SEL_MASK,
 			   FIELD_PREP(PLL_PCG_POSTDIV_SEL_MASK, cfg->pms_sdiv));
 
+	regmap_update_bits(hdptx->regmap, CMN_REG(0086), PLL_PCG_CLK_SEL_MASK,
+			   FIELD_PREP(PLL_PCG_CLK_SEL_MASK, (hdptx->bpc - 8) >> 1));
+
 	regmap_update_bits(hdptx->regmap, CMN_REG(0086), PLL_PCG_CLK_EN_MASK,
 			   FIELD_PREP(PLL_PCG_CLK_EN_MASK, 0x1));
 
@@ -1430,7 +1434,7 @@ static int rk_hdptx_phy_power_on(struct phy *phy)
 		rate = phy_get_bus_width(hdptx->phy) & 0xfffffff;
 	}
 
-	dev_dbg(hdptx->dev, "%s rate=%u\n", __func__, rate);
+	dev_dbg(hdptx->dev, "%s rate=%u bpc=%u\n", __func__, rate, hdptx->bpc);
 
 	ret = rk_hdptx_phy_consumer_get(hdptx, rate);
 	if (ret)
@@ -1741,6 +1745,19 @@ static int rk_hdptx_phy_configure(struct phy *phy, union phy_configure_opts *opt
 
 	if (mode != PHY_MODE_DP) {
 		hdptx->tmds_char_rate = opts->hdmi.tmds_char_rate;
+
+		switch (opts->hdmi.bpc) {
+		case 8:
+		case 10:
+		case 12:
+		case 16:
+			hdptx->bpc = opts->hdmi.bpc;
+			break;
+		default:
+			dev_warn(hdptx->dev, "Discarded unsupported bpc: %u\n",
+				 opts->hdmi.bpc);
+		};
+
 		return 0;
 	}
 
@@ -1922,6 +1939,7 @@ static int rk_hdptx_phy_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	hdptx->dev = dev;
+	hdptx->bpc = 8;
 
 	regs = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 	if (IS_ERR(regs))

-- 
2.48.1


