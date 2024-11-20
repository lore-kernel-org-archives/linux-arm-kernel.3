Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 417D7D63933
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Nov 2024 12:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zZ8K0QE+H4bI744flxVJ8NknBbvTCVhJV1B65Gt/C3M=; b=dQW5ae7AKcDdYYE3cnOyhueXDW
	JJICvGOtnMRRGiQ3cgB7EjN4jQR2fZUK+hFm+lYgPh8UYwsuqboLMoQqIX512Bfq2nmz4QX8GAvxx
	wf03CLeVcfYE5oboYeZAmuGI3VNpa1y/Cz8Y1t7rR5nQsDy97yqMeNCpXqblJ7QSOo5wLGwFwXXdQ
	nMVDuShQK+wXZ+bqKFcVtiUVYPxv5j15RBR9/siXwBk6V34UoEhy6N1+52CDOJr1RME63p80miuCM
	avWf8vgZCra89OrT8ffZgSQbH7fhoLW1yTOZ86DoXr9lw2tlo7j022B/p+BzORmNX+PtPyL9i7AFL
	uD4QRRqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDk3T-0000000FJYd-0apt;
	Wed, 20 Nov 2024 12:43:35 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDk2W-0000000FJRr-273G;
	Wed, 20 Nov 2024 12:42:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1732106553;
	bh=X6Vm3LbhTsKjq12wJ9i8bHP6qgWeslNJ7NDL3Hegox8=;
	h=From:To:Cc:Subject:Date:From;
	b=OdDtjyWSfEWPYZfn20vNe03opNz9HuPAm+BUkkT5+zS4QD1Y7eogL8TG/iVVUG8Rq
	 1qX5U4qqIIpvdF1szZjtSPAuvIay/yJQFmlGL2Mw3VgcupaEV+lYRjh5xFZIbAIH6g
	 RJLkr2T/LVjvHrJQaV1F6Px9kwOZIhq7Rq70+GAucWxzIoLxE5Kq1L/IYubuyVW+ws
	 GM7E83aQGuszkLDj8eDLHMYD8H1nDWFssGyCHA/w5yrcYDs41WSG4Z8oWM/jNrBhR8
	 1PibaFFibJvErdY3GXFBynq3TZVOV7Tpn3YoIpDE9hmYVvSZWz/gKr7L6WZ0SkN9B1
	 dUaSeJXTSVytA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EF41417E365E;
	Wed, 20 Nov 2024 13:42:32 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de,
	chunfeng.yun@mediatek.com,
	vkoul@kernel.org,
	kishon@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel@collabora.com
Subject: [PATCH] phy: mediatek: phy-mtk-hdmi: Register PHY provided regulator
Date: Wed, 20 Nov 2024 13:41:43 +0100
Message-ID: <20241120124143.132637-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_044236_694261_6374738A 
X-CRM114-Status: GOOD (  15.84  )
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

At least version 2 of the HDMI PHY, found in MediaTek MT8195 and
MT8188 SoCs, does provide hardware support to switch on/off the
HDMI 5V pins (which are also used for DDC), and this translates
to this being a fixed regulator.

Register this PHY-provided regulator so that it can be fed to the
hdmi-connector driver to manage the HDMI +5V PWR rail.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c | 44 ++++++++++++++++++++++
 drivers/phy/mediatek/phy-mtk-hdmi-mt8195.h |  3 ++
 drivers/phy/mediatek/phy-mtk-hdmi.c        | 28 ++++++++++++++
 drivers/phy/mediatek/phy-mtk-hdmi.h        |  4 ++
 4 files changed, 79 insertions(+)

diff --git a/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c b/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
index bbfe11d6a69d..b38f3ae26b3f 100644
--- a/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
+++ b/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
@@ -9,6 +9,8 @@
 #include <linux/module.h>
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
+#include <linux/regulator/driver.h>
+#include <linux/regulator/of_regulator.h>
 #include <linux/types.h>
 #include <linux/units.h>
 #include <linux/nvmem-consumer.h>
@@ -478,8 +480,50 @@ static int mtk_hdmi_phy_configure(struct phy *phy, union phy_configure_opts *opt
 	return ret;
 }
 
+static int mtk_hdmi_phy_pwr5v_enable(struct regulator_dev *rdev)
+{
+	struct mtk_hdmi_phy *hdmi_phy = rdev_get_drvdata(rdev);
+
+	mtk_phy_set_bits(hdmi_phy->regs + HDMI_CTL_1, RG_HDMITX_PWR5V_O);
+
+	return 0;
+}
+
+static int mtk_hdmi_phy_pwr5v_disable(struct regulator_dev *rdev)
+{
+	struct mtk_hdmi_phy *hdmi_phy = rdev_get_drvdata(rdev);
+
+	mtk_phy_clear_bits(hdmi_phy->regs + HDMI_CTL_1, RG_HDMITX_PWR5V_O);
+
+	return 0;
+}
+
+static int mtk_hdmi_phy_pwr5v_is_enabled(struct regulator_dev *rdev)
+{
+	struct mtk_hdmi_phy *hdmi_phy = rdev_get_drvdata(rdev);
+
+	return !!(readl(hdmi_phy->regs + HDMI_CTL_1) & RG_HDMITX_PWR5V_O);
+}
+
+static const struct regulator_ops mtk_hdmi_pwr5v_regulator_ops = {
+	.enable = mtk_hdmi_phy_pwr5v_enable,
+	.disable = mtk_hdmi_phy_pwr5v_disable,
+	.is_enabled = mtk_hdmi_phy_pwr5v_is_enabled
+};
+
+static const struct regulator_desc mtk_hdmi_phy_pwr5v_desc = {
+	.name = "hdmi-pwr5v",
+	.id = -1,
+	.n_voltages = 1,
+	.fixed_uV = 5000000,
+	.ops = &mtk_hdmi_pwr5v_regulator_ops,
+	.type = REGULATOR_VOLTAGE,
+	.owner = THIS_MODULE,
+};
+
 struct mtk_hdmi_phy_conf mtk_hdmi_phy_8195_conf = {
 	.flags = CLK_SET_RATE_PARENT | CLK_SET_RATE_GATE,
+	.hdmi_phy_regulator_desc = &mtk_hdmi_phy_pwr5v_desc,
 	.hdmi_phy_clk_ops = &mtk_hdmi_pll_ops,
 	.hdmi_phy_enable_tmds = mtk_hdmi_phy_enable_tmds,
 	.hdmi_phy_disable_tmds = mtk_hdmi_phy_disable_tmds,
diff --git a/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.h b/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.h
index 22a68dc9550c..e26caaf4d104 100644
--- a/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.h
+++ b/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.h
@@ -103,6 +103,9 @@
 #define HDMI_ANA_CTL 0x7c
 #define REG_ANA_HDMI20_FIFO_EN BIT(16)
 
+#define HDMI_CTL_1 0xc4
+#define RG_HDMITX_PWR5V_O BIT(9)
+
 #define HDMI_CTL_3 0xcc
 #define REG_HDMITXPLL_DIV GENMASK(4, 0)
 #define REG_HDMITX_REF_XTAL_SEL BIT(7)
diff --git a/drivers/phy/mediatek/phy-mtk-hdmi.c b/drivers/phy/mediatek/phy-mtk-hdmi.c
index d2e824771f9d..52a7d525ff9b 100644
--- a/drivers/phy/mediatek/phy-mtk-hdmi.c
+++ b/drivers/phy/mediatek/phy-mtk-hdmi.c
@@ -75,6 +75,28 @@ static void mtk_hdmi_phy_clk_get_data(struct mtk_hdmi_phy *hdmi_phy,
 	clk_init->ops = hdmi_phy->conf->hdmi_phy_clk_ops;
 }
 
+static int mtk_hdmi_phy_register_regulators(struct mtk_hdmi_phy *hdmi_phy)
+{
+	const struct regulator_desc *vreg_desc = hdmi_phy->conf->hdmi_phy_regulator_desc;
+	const struct regulator_init_data vreg_init_data = {
+		.constraints = {
+			.valid_ops_mask = REGULATOR_CHANGE_STATUS,
+		}
+	};
+	struct regulator_config vreg_config = {
+		.dev = hdmi_phy->dev,
+		.driver_data = hdmi_phy,
+		.init_data = &vreg_init_data,
+		.of_node = hdmi_phy->dev->of_node
+	};
+
+	hdmi_phy->rdev = devm_regulator_register(hdmi_phy->dev, vreg_desc, &vreg_config);
+	if (IS_ERR(hdmi_phy->rdev))
+		return PTR_ERR(hdmi_phy->rdev);
+
+	return 0;
+}
+
 static int mtk_hdmi_phy_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -150,6 +172,12 @@ static int mtk_hdmi_phy_probe(struct platform_device *pdev)
 	if (hdmi_phy->conf->pll_default_off)
 		hdmi_phy->conf->hdmi_phy_disable_tmds(hdmi_phy);
 
+	if (hdmi_phy->conf->hdmi_phy_regulator_desc) {
+		ret = mtk_hdmi_phy_register_regulators(hdmi_phy);
+		if (ret)
+			return ret;
+	}
+
 	return of_clk_add_provider(dev->of_node, of_clk_src_simple_get,
 				   hdmi_phy->pll);
 }
diff --git a/drivers/phy/mediatek/phy-mtk-hdmi.h b/drivers/phy/mediatek/phy-mtk-hdmi.h
index 71c02d043485..99d917e0036a 100644
--- a/drivers/phy/mediatek/phy-mtk-hdmi.h
+++ b/drivers/phy/mediatek/phy-mtk-hdmi.h
@@ -13,6 +13,8 @@
 #include <linux/module.h>
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
+#include <linux/regulator/driver.h>
+#include <linux/regulator/machine.h>
 #include <linux/types.h>
 
 struct mtk_hdmi_phy;
@@ -20,6 +22,7 @@ struct mtk_hdmi_phy;
 struct mtk_hdmi_phy_conf {
 	unsigned long flags;
 	bool pll_default_off;
+	const struct regulator_desc *hdmi_phy_regulator_desc;
 	const struct clk_ops *hdmi_phy_clk_ops;
 	void (*hdmi_phy_enable_tmds)(struct mtk_hdmi_phy *hdmi_phy);
 	void (*hdmi_phy_disable_tmds)(struct mtk_hdmi_phy *hdmi_phy);
@@ -32,6 +35,7 @@ struct mtk_hdmi_phy {
 	struct mtk_hdmi_phy_conf *conf;
 	struct clk *pll;
 	struct clk_hw pll_hw;
+	struct regulator_dev *rdev;
 	unsigned long pll_rate;
 	unsigned char drv_imp_clk;
 	unsigned char drv_imp_d2;
-- 
2.47.0


