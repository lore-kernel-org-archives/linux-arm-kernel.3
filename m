Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C7D9C3ABDD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 17:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7q5xk27Y3IE+LFqEWssqFmr1BabAl9bTFpaF7MvR+GU=; b=DuO3+1sNhE9LlSTe2XEfV1C8XH
	vBIxBSH44XJPdEibbaa2i53Fs0JtOUYKiCkc1mX/u53P82pvBwcjANf3A2SvCxHr91H0XT7gIoF+F
	jtAP554s1hReW9qP9MYQ//lfJx/sVcuTYF26G8cB90jAAA+rHvb2j7Ak92UUft+DqMEMWcvQSsfg8
	R/dqNiYQGuvFNA1vJnYkncu4pQfRe0JLmQ68EIurd3YTchVSdDosr/WUZJHPlS2gqbjqv+0nsVmKm
	vLFj9RX5cqjoVlMNZf5kQqcoLbvuzbDv9Em6O9CXZwxaJ2eOeUU2lM6p84m0xUlaqyTgWRbusl2gg
	Tf6gVnRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH440-00000009vhO-05OU;
	Mon, 19 May 2025 17:14:08 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH3Bk-00000009mBU-1ChW;
	Mon, 19 May 2025 16:18:05 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 1C5EA26102;
	Mon, 19 May 2025 18:18:03 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8BAyV_byNQUd; Mon, 19 May 2025 18:18:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1747671482; bh=3eoOV/NGXtwCafnQhCM2GGOVYlGtm2oY5dmzW5ifD5s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Qb0zj9wX95PVy+eV/r4IguN+5lDvACvZLiowiz1MBzORG2zq5eSqMaKkOwEvOz/5x
	 or10Pj2U6ux9eU34pkMJwLE0A2nnKolSE7qzOMiTVm4wq8i5UgrciQHWMHQmsXoDc/
	 qNuBbwrR2SdZrZqPXmGt1VmWwSmor7hSh/wctUwPIry7bMn5qOpBe99lRp2MwnJH/p
	 Cpo3Uy9OQ80se01KFcv+oY1VmJ9wv918qW9Ya5DoH9zIDeZrPTosMAJUhlneOyH7ur
	 EZzhArQVYK97GuHUhKfgeI5Gb+1P2UkotwnlRqawfsjiaEPxC8F728IRj40xqBGro/
	 /epAqa7ytj5gw==
From: Yao Zi <ziyao@disroot.org>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Yao Zi <ziyao@disroot.org>,
	Frank Wang <frank.wang@rock-chips.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Shresth Prasad <shresthprasad7@gmail.com>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	Jonas Karlman <jonas@kwiboo.se>
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/5] phy: rockchip: naneng-combphy: Add RK3528 support
Date: Mon, 19 May 2025 16:16:10 +0000
Message-ID: <20250519161612.14261-5-ziyao@disroot.org>
In-Reply-To: <20250519161612.14261-1-ziyao@disroot.org>
References: <20250519161612.14261-1-ziyao@disroot.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_091804_591081_FD255576 
X-CRM114-Status: GOOD (  16.92  )
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

Rockchip RK3528 integrates one naneng-combphy that is able to operate in
PCIe and USB3 mode. The control logic is similar to previous variants of
naneng-combphy but the register layout is apperantly different from the
RK3568 one.

Signed-off-by: Yao Zi <ziyao@disroot.org>
Reviewed-by: Heiko Stuebner <heiko@sntech.de>
---
 .../rockchip/phy-rockchip-naneng-combphy.c    | 186 +++++++++++++++++-
 1 file changed, 185 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c b/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
index 1d1c7723584b..bf00a85a113b 100644
--- a/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
+++ b/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
@@ -20,7 +20,46 @@
 #define REF_CLOCK_25MHz			(25 * HZ_PER_MHZ)
 #define REF_CLOCK_100MHz		(100 * HZ_PER_MHZ)
 
-/* COMBO PHY REG */
+/* RK3528 COMBO PHY REG */
+#define RK3528_PHYREG6				0x18
+#define RK3528_PHYREG6_PLL_KVCO			GENMASK(12, 10)
+#define RK3528_PHYREG6_PLL_KVCO_VALUE		0x2
+#define RK3528_PHYREG6_SSC_DIR			GENMASK(5, 4)
+#define RK3528_PHYREG6_SSC_UPWARD		0
+#define RK3528_PHYREG6_SSC_DOWNWARD		1
+
+#define RK3528_PHYREG40				0x100
+#define RK3528_PHYREG40_SSC_EN			BIT(20)
+#define RK3528_PHYREG40_SSC_CNT			GENMASK(10, 0)
+#define RK3528_PHYREG40_SSC_CNT_VALUE		0x17d
+
+#define RK3528_PHYREG42				0x108
+#define RK3528_PHYREG42_CKDRV_CLK_SEL		BIT(29)
+#define RK3528_PHYREG42_CKDRV_CLK_PLL		0
+#define RK3528_PHYREG42_CKDRV_CLK_CKRCV		1
+#define RK3528_PHYREG42_PLL_LPF_R1_ADJ		GENMASK(10, 7)
+#define RK3528_PHYREG42_PLL_LPF_R1_ADJ_VALUE	0x9
+#define RK3528_PHYREG42_PLL_CHGPUMP_CUR_ADJ	GENMASK(6, 4)
+#define RK3528_PHYREG42_PLL_CHGPUMP_CUR_ADJ_VALUE 0x7
+#define RK3528_PHYREG42_PLL_KVCO_ADJ		GENMASK(2, 0)
+#define RK3528_PHYREG42_PLL_KVCO_ADJ_VALUE	0x0
+
+#define RK3528_PHYREG80				0x200
+#define RK3528_PHYREG80_CTLE_EN			BIT(17)
+
+#define RK3528_PHYREG81				0x204
+#define RK3528_PHYREG81_CDR_PHASE_PATH_GAIN_2X	BIT(5)
+#define RK3528_PHYREG81_SLEW_RATE_CTRL		GENMASK(2, 0)
+#define RK3528_PHYREG81_SLEW_RATE_CTRL_SLOW	0x7
+
+#define RK3528_PHYREG83				0x20c
+#define RK3528_PHYREG83_RX_SQUELCH		GENMASK(2, 0)
+#define RK3528_PHYREG83_RX_SQUELCH_VALUE	0x6
+
+#define RK3528_PHYREG86				0x218
+#define RK3528_PHYREG86_RTERM_DET_CLK_EN	BIT(14)
+
+/* RK3568 COMBO PHY REG */
 #define RK3568_PHYREG6				0x14
 #define RK3568_PHYREG6_PLL_DIV_MASK		GENMASK(7, 6)
 #define RK3568_PHYREG6_PLL_DIV_SHIFT		6
@@ -398,6 +437,147 @@ static int rockchip_combphy_probe(struct platform_device *pdev)
 	return PTR_ERR_OR_ZERO(phy_provider);
 }
 
+static int rk3528_combphy_cfg(struct rockchip_combphy_priv *priv)
+{
+	const struct rockchip_combphy_grfcfg *cfg = priv->cfg->grfcfg;
+	unsigned long rate;
+	u32 val;
+
+	/* Set SSC downward spread spectrum */
+	val = FIELD_PREP(RK3528_PHYREG6_SSC_DIR, RK3528_PHYREG6_SSC_DOWNWARD);
+	rockchip_combphy_updatel(priv, RK3528_PHYREG6_SSC_DIR, val, RK3528_PHYREG6);
+
+	switch (priv->type) {
+	case PHY_TYPE_PCIE:
+		rockchip_combphy_param_write(priv->phy_grf, &cfg->con0_for_pcie, true);
+		rockchip_combphy_param_write(priv->phy_grf, &cfg->con1_for_pcie, true);
+		rockchip_combphy_param_write(priv->phy_grf, &cfg->con2_for_pcie, true);
+		rockchip_combphy_param_write(priv->phy_grf, &cfg->con3_for_pcie, true);
+		break;
+	case PHY_TYPE_USB3:
+		/* Enable adaptive CTLE for USB3.0 Rx */
+		rockchip_combphy_updatel(priv, RK3528_PHYREG80_CTLE_EN, RK3528_PHYREG80_CTLE_EN,
+					 RK3528_PHYREG80);
+
+		/* Set slow slew rate control for PI */
+		val = FIELD_PREP(RK3528_PHYREG81_SLEW_RATE_CTRL,
+				 RK3528_PHYREG81_SLEW_RATE_CTRL_SLOW);
+		rockchip_combphy_updatel(priv, RK3528_PHYREG81_SLEW_RATE_CTRL, val,
+					 RK3528_PHYREG81);
+
+		/* Set CDR phase path with 2x gain */
+		rockchip_combphy_updatel(priv, RK3528_PHYREG81_CDR_PHASE_PATH_GAIN_2X,
+					 RK3528_PHYREG81_CDR_PHASE_PATH_GAIN_2X, RK3528_PHYREG81);
+
+		/* Set Rx squelch input filler bandwidth */
+		val = FIELD_PREP(RK3528_PHYREG83_RX_SQUELCH, RK3528_PHYREG83_RX_SQUELCH_VALUE);
+		rockchip_combphy_updatel(priv, RK3528_PHYREG83_RX_SQUELCH, val, RK3528_PHYREG83);
+
+		rockchip_combphy_param_write(priv->phy_grf, &cfg->pipe_txcomp_sel, false);
+		rockchip_combphy_param_write(priv->phy_grf, &cfg->pipe_txelec_sel, false);
+		rockchip_combphy_param_write(priv->phy_grf, &cfg->usb_mode_set, true);
+		break;
+	default:
+		dev_err(priv->dev, "incompatible PHY type\n");
+		return -EINVAL;
+	}
+
+	rate = clk_get_rate(priv->refclk);
+
+	switch (rate) {
+	case REF_CLOCK_24MHz:
+		rockchip_combphy_param_write(priv->phy_grf, &cfg->pipe_clk_24m, true);
+		if (priv->type == PHY_TYPE_USB3) {
+			/* Set ssc_cnt[10:0]=00101111101 & 31.5KHz */
+			val = FIELD_PREP(RK3528_PHYREG40_SSC_CNT, RK3528_PHYREG40_SSC_CNT_VALUE);
+			rockchip_combphy_updatel(priv, RK3528_PHYREG40_SSC_CNT, val,
+						 RK3528_PHYREG40);
+		} else if (priv->type == PHY_TYPE_PCIE) {
+			/* tx_trim[14]=1, Enable the counting clock of the rterm detect */
+			rockchip_combphy_updatel(priv, RK3528_PHYREG86_RTERM_DET_CLK_EN,
+						 RK3528_PHYREG86_RTERM_DET_CLK_EN, RK3528_PHYREG86);
+		}
+		break;
+	case REF_CLOCK_100MHz:
+		rockchip_combphy_param_write(priv->phy_grf, &cfg->pipe_clk_100m, true);
+		if (priv->type == PHY_TYPE_PCIE) {
+			/* PLL KVCO tuning fine */
+			val = FIELD_PREP(RK3528_PHYREG6_PLL_KVCO, RK3528_PHYREG6_PLL_KVCO_VALUE);
+			rockchip_combphy_updatel(priv, RK3528_PHYREG6_PLL_KVCO, val,
+						 RK3528_PHYREG6);
+
+			/* su_trim[6:4]=111, [10:7]=1001, [2:0]=000, swing 650mv */
+			writel(0x570804f0, priv->mmio + RK3528_PHYREG42);
+		}
+		break;
+	default:
+		dev_err(priv->dev, "Unsupported rate: %lu\n", rate);
+		return -EINVAL;
+	}
+
+	if (device_property_read_bool(priv->dev, "rockchip,ext-refclk")) {
+		rockchip_combphy_param_write(priv->phy_grf, &cfg->pipe_clk_ext, true);
+
+		if (priv->type == PHY_TYPE_PCIE && rate == REF_CLOCK_100MHz) {
+			val = FIELD_PREP(RK3528_PHYREG42_CKDRV_CLK_SEL,
+					 RK3528_PHYREG42_CKDRV_CLK_CKRCV);
+			val |= FIELD_PREP(RK3528_PHYREG42_PLL_LPF_R1_ADJ,
+					  RK3528_PHYREG42_PLL_LPF_R1_ADJ_VALUE);
+			val |= FIELD_PREP(RK3528_PHYREG42_PLL_CHGPUMP_CUR_ADJ,
+					  RK3528_PHYREG42_PLL_CHGPUMP_CUR_ADJ_VALUE);
+			val |= FIELD_PREP(RK3528_PHYREG42_PLL_KVCO_ADJ,
+					  RK3528_PHYREG42_PLL_KVCO_ADJ_VALUE);
+			rockchip_combphy_updatel(priv,
+						 RK3528_PHYREG42_CKDRV_CLK_SEL		|
+						 RK3528_PHYREG42_PLL_LPF_R1_ADJ		|
+						 RK3528_PHYREG42_PLL_CHGPUMP_CUR_ADJ	|
+						 RK3528_PHYREG42_PLL_KVCO_ADJ,
+						 val, RK3528_PHYREG42);
+
+			val = FIELD_PREP(RK3528_PHYREG6_PLL_KVCO, RK3528_PHYREG6_PLL_KVCO_VALUE);
+			rockchip_combphy_updatel(priv, RK3528_PHYREG6_PLL_KVCO, val,
+						 RK3528_PHYREG6);
+		}
+	}
+
+	if (priv->type == PHY_TYPE_PCIE) {
+		if (device_property_read_bool(priv->dev, "rockchip,enable-ssc"))
+			rockchip_combphy_updatel(priv, RK3528_PHYREG40_SSC_EN,
+						 RK3528_PHYREG40_SSC_EN, RK3528_PHYREG40);
+	}
+
+	return 0;
+}
+
+static const struct rockchip_combphy_grfcfg rk3528_combphy_grfcfgs = {
+	/* pipe-phy-grf */
+	.pcie_mode_set		= { 0x0000, 5, 0, 0x00, 0x11 },
+	.usb_mode_set		= { 0x0000, 5, 0, 0x00, 0x04 },
+	.pipe_rxterm_set	= { 0x0000, 12, 12, 0x00, 0x01 },
+	.pipe_txelec_set	= { 0x0004, 1, 1, 0x00, 0x01 },
+	.pipe_txcomp_set	= { 0x0004, 4, 4, 0x00, 0x01 },
+	.pipe_clk_24m		= { 0x0004, 14, 13, 0x00, 0x00 },
+	.pipe_clk_100m		= { 0x0004, 14, 13, 0x00, 0x02 },
+	.pipe_rxterm_sel	= { 0x0008, 8, 8, 0x00, 0x01 },
+	.pipe_txelec_sel	= { 0x0008, 12, 12, 0x00, 0x01 },
+	.pipe_txcomp_sel	= { 0x0008, 15, 15, 0x00, 0x01 },
+	.pipe_clk_ext		= { 0x000c, 9, 8, 0x02, 0x01 },
+	.pipe_phy_status	= { 0x0034, 6, 6, 0x01, 0x00 },
+	.con0_for_pcie		= { 0x0000, 15, 0, 0x00, 0x110 },
+	.con1_for_pcie		= { 0x0004, 15, 0, 0x00, 0x00 },
+	.con2_for_pcie		= { 0x0008, 15, 0, 0x00, 0x101 },
+	.con3_for_pcie		= { 0x000c, 15, 0, 0x00, 0x0200 },
+};
+
+static const struct rockchip_combphy_cfg rk3528_combphy_cfgs = {
+	.num_phys	= 1,
+	.phy_ids	= {
+		0xffdc0000,
+	},
+	.grfcfg		= &rk3528_combphy_grfcfgs,
+	.combphy_cfg	= rk3528_combphy_cfg,
+};
+
 static int rk3562_combphy_cfg(struct rockchip_combphy_priv *priv)
 {
 	const struct rockchip_combphy_grfcfg *cfg = priv->cfg->grfcfg;
@@ -1213,6 +1393,10 @@ static const struct rockchip_combphy_cfg rk3588_combphy_cfgs = {
 };
 
 static const struct of_device_id rockchip_combphy_of_match[] = {
+	{
+		.compatible = "rockchip,rk3528-naneng-combphy",
+		.data = &rk3528_combphy_cfgs,
+	},
 	{
 		.compatible = "rockchip,rk3562-naneng-combphy",
 		.data = &rk3562_combphy_cfgs,
-- 
2.49.0


