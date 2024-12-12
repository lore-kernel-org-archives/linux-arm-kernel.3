Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C60CEE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 20:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CFAavYcmczwPwo2u/7DTqzr433lGyHjbvCme2QUuMzo=; b=qLRG0K7HV4/dowUMc58Zy+HyO5
	F9sIMlSj+G/LcUHec0iA13pjdTch76dQd/HyySNA1O86dLlG1QZ3O8wvSUhregfLzLtNprYEhVCpO
	DwpvSlWc5yhVQOG2p4V1h4WBC7+DBkRW+gd0L0EAaM0Ix7hKxulB2hMYCUjSbKViQw/45iDgjyuyK
	tl70N3AFa/nmvDSvRr+JdeMJQTT4GfqV0qhrJfU3davyDwnn9+0mjXCgrNQoBHo+Y2WcWsewdlCI0
	i3BBa/2qfxhmICn1SjemVK3oa7tuonn9I8FFVfm9o28S5svzkTDi7R8lee/8jQSZ7/e/YSIGJkbSh
	5Jhi2RLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLpZA-00000001lj3-4AvR;
	Thu, 12 Dec 2024 20:13:44 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLpPm-00000001jlA-1KUd;
	Thu, 12 Dec 2024 20:04:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1734033841;
	bh=nNqHz4NpDHM1KDZ3pSN7cST0Y4OmTrfeNw306jzeaZI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=CLARn6RzmV8a2P44ixHOPfzHrPhaX5P/Dinq5uI7616sxEXZVNeUixyiLUalqBi/f
	 oDLDRSeWQSekWV+6aQcBweESh21OsYzTe8cgdOwOjVyM6gzjLdlOaftuLy/XF/aTAp
	 Ywn03BSbN0TcGQ+kPe98Qx6YLDkpsB73r0PXj7kVyDDy9KuSr8kzKAF2gMYt86kG8N
	 IP2+jACJZ+VnBSbctl3VESoTUJnbydROS2OaY8ANXKuPfHI93ZsMeHBdyuVJVsd64F
	 MKoOug+TfAHu20K7FB9apM7ltXxZKD/ybAAxoJPeX0a56rrOMZn6uLF0E693mFD+Sg
	 nY4b37QFs6W/A==
Received: from localhost (unknown [188.27.48.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id DDB9F17E3804;
	Thu, 12 Dec 2024 21:04:00 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Thu, 12 Dec 2024 22:03:39 +0200
Subject: [PATCH v2 8/8] phy: rockchip: samsung-hdptx: Avoid Hz-hHz unit
 conversion overhead
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241212-phy-sam-hdptx-bpc-v2-8-57e672c7c7c4@collabora.com>
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
X-CRM114-CacheID: sfid-20241212_120402_505850_40936B0C 
X-CRM114-Status: GOOD (  13.90  )
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

The ropll_tmds_cfg table used to identify the configuration params for
the supported rates expects the search keys - bit_rate field - to be
provided in hHz rather than Hz (1 hHz = 100 Hz).  This requires multiple
conversions between these units being performed at runtime.

Improve implementation clarity and efficiency by consistently using the
Hz units throughout driver's internal data structures and functions.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 61 +++++++++++------------
 1 file changed, 30 insertions(+), 31 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
index bc513ddd5c052763856a113a7f1e58660f7372b8..b6120d9ab24eca093180b3af942d7ce2b204d516 100644
--- a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
+++ b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
@@ -196,7 +196,7 @@
 #define HDMI20_MAX_RATE			600000000
 
 struct ropll_config {
-	u32 bit_rate;
+	u32 rate;
 	u8 pms_mdiv;
 	u8 pms_mdiv_afc;
 	u8 pms_pdiv;
@@ -256,45 +256,45 @@ struct rk_hdptx_phy {
 };
 
 static const struct ropll_config ropll_tmds_cfg[] = {
-	{ 5940000, 124, 124, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 62, 1, 16, 5, 0,
+	{ 594000000, 124, 124, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 62, 1, 16, 5, 0,
 	  1, 1, 0, 0x20, 0x0c, 1, 0x0e, 0, 0, },
-	{ 3712500, 155, 155, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 62, 1, 16, 5, 0,
+	{ 371250000, 155, 155, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 62, 1, 16, 5, 0,
 	  1, 1, 0, 0x20, 0x0c, 1, 0x0e, 0, 0, },
-	{ 2970000, 124, 124, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 62, 1, 16, 5, 0,
+	{ 297000000, 124, 124, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 62, 1, 16, 5, 0,
 	  1, 1, 0, 0x20, 0x0c, 1, 0x0e, 0, 0, },
-	{ 1620000, 135, 135, 1, 1, 3, 1, 1, 0, 1, 1, 1, 1, 4, 0, 3, 5, 5, 0x10,
+	{ 162000000, 135, 135, 1, 1, 3, 1, 1, 0, 1, 1, 1, 1, 4, 0, 3, 5, 5, 0x10,
 	  1, 0, 0x20, 0x0c, 1, 0x0e, 0, 0, },
-	{ 1856250, 155, 155, 1, 1, 3, 1, 1, 1, 1, 1, 1, 1, 62, 1, 16, 5, 0,
+	{ 185625000, 155, 155, 1, 1, 3, 1, 1, 1, 1, 1, 1, 1, 62, 1, 16, 5, 0,
 	  1, 1, 0, 0x20, 0x0c, 1, 0x0e, 0, 0, },
-	{ 1540000, 193, 193, 1, 1, 5, 1, 1, 1, 1, 1, 1, 1, 193, 1, 32, 2, 1,
+	{ 154000000, 193, 193, 1, 1, 5, 1, 1, 1, 1, 1, 1, 1, 193, 1, 32, 2, 1,
 	  1, 1, 0, 0x20, 0x0c, 1, 0x0e, 0, 0, },
-	{ 1485000, 0x7b, 0x7b, 1, 1, 3, 1, 1, 1, 1, 1, 1, 1, 4, 0, 3, 5, 5,
+	{ 148500000, 0x7b, 0x7b, 1, 1, 3, 1, 1, 1, 1, 1, 1, 1, 4, 0, 3, 5, 5,
 	  0x10, 1, 0, 0x20, 0x0c, 1, 0x0e, 0, 0, },
-	{ 1462500, 122, 122, 1, 1, 3, 1, 1, 1, 1, 1, 1, 1, 244, 1, 16, 2, 1, 1,
+	{ 146250000, 122, 122, 1, 1, 3, 1, 1, 1, 1, 1, 1, 1, 244, 1, 16, 2, 1, 1,
 	  1, 0, 0x20, 0x0c, 1, 0x0e, 0, 0, },
-	{ 1190000, 149, 149, 1, 1, 5, 1, 1, 1, 1, 1, 1, 1, 149, 1, 16, 2, 1, 1,
+	{ 119000000, 149, 149, 1, 1, 5, 1, 1, 1, 1, 1, 1, 1, 149, 1, 16, 2, 1, 1,
 	  1, 0, 0x20, 0x0c, 1, 0x0e, 0, 0, },
-	{ 1065000, 89, 89, 1, 1, 3, 1, 1, 1, 1, 1, 1, 1, 89, 1, 16, 1, 0, 1,
+	{ 106500000, 89, 89, 1, 1, 3, 1, 1, 1, 1, 1, 1, 1, 89, 1, 16, 1, 0, 1,
 	  1, 0, 0x20, 0x0c, 1, 0x0e, 0, 0, },
-	{ 1080000, 135, 135, 1, 1, 5, 1, 1, 0, 1, 0, 1, 1, 0x9, 0, 0x05, 0,
+	{ 108000000, 135, 135, 1, 1, 5, 1, 1, 0, 1, 0, 1, 1, 0x9, 0, 0x05, 0,
 	  0x14, 0x18, 1, 0, 0x20, 0x0c, 1, 0x0e, 0, 0, },
-	{ 855000, 214, 214, 1, 1, 11, 1, 1, 1, 1, 1, 1, 1, 214, 1, 16, 2, 1,
+	{ 85500000, 214, 214, 1, 1, 11, 1, 1, 1, 1, 1, 1, 1, 214, 1, 16, 2, 1,
 	  1, 1, 0, 0x20, 0x0c, 1, 0x0e, 0, 0, },
-	{ 835000, 105, 105, 1, 1, 5, 1, 1, 1, 1, 1, 1, 1, 42, 1, 16, 1, 0,
+	{ 83500000, 105, 105, 1, 1, 5, 1, 1, 1, 1, 1, 1, 1, 42, 1, 16, 1, 0,
 	  1, 1, 0, 0x20, 0x0c, 1, 0x0e, 0, 0, },
-	{ 928125, 155, 155, 1, 1, 7, 1, 1, 1, 1, 1, 1, 1, 62, 1, 16, 5, 0,
+	{ 92812500, 155, 155, 1, 1, 7, 1, 1, 1, 1, 1, 1, 1, 62, 1, 16, 5, 0,
 	  1, 1, 0, 0x20, 0x0c, 1, 0x0e, 0, 0, },
-	{ 742500, 124, 124, 1, 1, 7, 1, 1, 1, 1, 1, 1, 1, 62, 1, 16, 5, 0,
+	{ 74250000, 124, 124, 1, 1, 7, 1, 1, 1, 1, 1, 1, 1, 62, 1, 16, 5, 0,
 	  1, 1, 0, 0x20, 0x0c, 1, 0x0e, 0, 0, },
-	{ 650000, 162, 162, 1, 1, 11, 1, 1, 1, 1, 1, 1, 1, 54, 0, 16, 4, 1,
+	{ 65000000, 162, 162, 1, 1, 11, 1, 1, 1, 1, 1, 1, 1, 54, 0, 16, 4, 1,
 	  1, 1, 0, 0x20, 0x0c, 1, 0x0e, 0, 0, },
-	{ 337500, 0x70, 0x70, 1, 1, 0xf, 1, 1, 1, 1, 1, 1, 1, 0x2, 0, 0x01, 5,
+	{ 33750000, 0x70, 0x70, 1, 1, 0xf, 1, 1, 1, 1, 1, 1, 1, 0x2, 0, 0x01, 5,
 	  1, 1, 1, 0, 0x20, 0x0c, 1, 0x0e, 0, 0, },
-	{ 400000, 100, 100, 1, 1, 11, 1, 1, 0, 1, 0, 1, 1, 0x9, 0, 0x05, 0,
+	{ 40000000, 100, 100, 1, 1, 11, 1, 1, 0, 1, 0, 1, 1, 0x9, 0, 0x05, 0,
 	  0x14, 0x18, 1, 0, 0x20, 0x0c, 1, 0x0e, 0, 0, },
-	{ 270000, 0x5a, 0x5a, 1, 1, 0xf, 1, 1, 0, 1, 0, 1, 1, 0x9, 0, 0x05, 0,
+	{ 27000000, 0x5a, 0x5a, 1, 1, 0xf, 1, 1, 0, 1, 0, 1, 1, 0x9, 0, 0x05, 0,
 	  0x14, 0x18, 1, 0, 0x20, 0x0c, 1, 0x0e, 0, 0, },
-	{ 251750, 84, 84, 1, 1, 0xf, 1, 1, 1, 1, 1, 1, 1, 168, 1, 16, 4, 1, 1,
+	{ 25175000, 84, 84, 1, 1, 0xf, 1, 1, 1, 1, 1, 1, 1, 168, 1, 16, 4, 1, 1,
 	  1, 0, 0x20, 0x0c, 1, 0x0e, 0, 0, },
 };
 
@@ -656,10 +656,10 @@ static void rk_hdptx_phy_disable(struct rk_hdptx_phy *hdptx)
 	regmap_write(hdptx->grf, GRF_HDPTX_CON0, val);
 }
 
-static bool rk_hdptx_phy_clk_pll_calc(unsigned int data_rate,
+static bool rk_hdptx_phy_clk_pll_calc(unsigned long rate,
 				      struct ropll_config *cfg)
 {
-	const unsigned int fout = data_rate / 2, fref = 24000;
+	const unsigned int fout = rate / 200, fref = 24000;
 	unsigned long k = 0, lc, k_sub, lc_sub;
 	unsigned int fvco, sdc;
 	u32 mdiv, sdiv, n = 8;
@@ -729,16 +729,16 @@ static bool rk_hdptx_phy_clk_pll_calc(unsigned int data_rate,
 }
 
 static int rk_hdptx_ropll_tmds_cmn_config(struct rk_hdptx_phy *hdptx,
-					  unsigned int rate)
+					  unsigned long rate)
 {
 	const struct ropll_config *cfg = NULL;
 	struct ropll_config rc = {0};
 	int i;
 
-	hdptx->rate = rate * 100;
+	hdptx->rate = rate;
 
 	for (i = 0; i < ARRAY_SIZE(ropll_tmds_cfg); i++)
-		if (rate == ropll_tmds_cfg[i].bit_rate) {
+		if (rate == ropll_tmds_cfg[i].rate) {
 			cfg = &ropll_tmds_cfg[i];
 			break;
 		}
@@ -837,7 +837,7 @@ static int rk_hdptx_phy_consumer_get(struct rk_hdptx_phy *hdptx)
 
 	rate = hdptx->tmds_char_rate ?: hdptx->rate;
 	if (rate) {
-		ret = rk_hdptx_ropll_tmds_cmn_config(hdptx, rate / 100);
+		ret = rk_hdptx_ropll_tmds_cmn_config(hdptx, rate);
 		if (ret)
 			goto dec_usage;
 	}
@@ -972,18 +972,17 @@ static unsigned long rk_hdptx_phy_clk_recalc_rate(struct clk_hw *hw,
 static long rk_hdptx_phy_clk_round_rate(struct clk_hw *hw, unsigned long rate,
 					unsigned long *parent_rate)
 {
-	u32 bit_rate = rate / 100;
 	int i;
 
 	if (rate > HDMI20_MAX_RATE)
 		return rate;
 
 	for (i = 0; i < ARRAY_SIZE(ropll_tmds_cfg); i++)
-		if (bit_rate == ropll_tmds_cfg[i].bit_rate)
+		if (rate == ropll_tmds_cfg[i].rate)
 			break;
 
 	if (i == ARRAY_SIZE(ropll_tmds_cfg) &&
-	    !rk_hdptx_phy_clk_pll_calc(bit_rate, NULL))
+	    !rk_hdptx_phy_clk_pll_calc(rate, NULL))
 		return -EINVAL;
 
 	return rate;
@@ -1004,7 +1003,7 @@ static int rk_hdptx_phy_clk_set_rate(struct clk_hw *hw, unsigned long rate,
 		rate = hdptx->tmds_char_rate;
 	}
 
-	return rk_hdptx_ropll_tmds_cmn_config(hdptx, rate / 100);
+	return rk_hdptx_ropll_tmds_cmn_config(hdptx, rate);
 }
 
 static const struct clk_ops hdptx_phy_clk_ops = {

-- 
2.47.0


