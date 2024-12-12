Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DA4DE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 20:12:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fs916/dm0VVTKYqrwj62SNShe2cWtNCMlJixbFAqNB0=; b=Rg71EkpC1JLiMzIvtoPdRVBByG
	bKng6uL4PsVXdgVIH+dSdPzzwO8n9AjQgQJ935ltxzqwd32Kwv9Qdw2pTBnwW7UeF8s1FNp1SwK6f
	OrlB1/Fwr/sO57FrYPZSW5jNCmFBhFY3g8A4ofaH9N0pp5RnIktZHIExlKhzezX9ZMXIgapoFNvDx
	3y8gU33KYTL8ufEftbPIWas634Pm/zwh3tQJonNF2YBKbCEAWZruNhySDEr26OxCSTRgI8ptLq7Ev
	j30/t+mnyH9bxm6R1x5dOw+TZhjhOuAi8KBVJRc48LT3IZ4Em0q0KEEqengHf5IrWYv94d3Cig7Xh
	2qf0J1aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLpY8-00000001lYw-37HD;
	Thu, 12 Dec 2024 20:12:40 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLpPl-00000001jkM-34dg;
	Thu, 12 Dec 2024 20:04:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1734033840;
	bh=H/Zc3kk2/NoQ97dNv5UBIPpAh2oYcExYnQ8LjYtdYTA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=hXjf0I6KjvxuGBT/Bwd++0eRLDEcHMGwR2IBESAORKXR4kx0mfF0YB8fiez1f06K1
	 6XJk6C8un4ByQzV2Zm4UMOpZX80Rb67cbuqYHsowlr0jOvDlnj2Fp5Cojx40AznI4P
	 lmGSvkFWfrsDe0eKUxNHAh0H8mNdpAFMm3S8K9b0HhR+nTOsP5u0eoLkHSzp1GZ+td
	 vGxTQliI/yCeoP41kIztD5TbawBohGTLHXBgjPT4KMf5o4Qks8ySVABWa0Jgqq2OAg
	 c4Qq+uEaFjR0Lx+Y49g3Gq/LUzDg7GAQebbwwywoGVe11CrWPUZz8Vabq19rpA8aZe
	 oh5iGg0hpnLvA==
Received: from localhost (unknown [188.27.48.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 175DA17E3803;
	Thu, 12 Dec 2024 21:04:00 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Thu, 12 Dec 2024 22:03:38 +0200
Subject: [PATCH v2 7/8] phy: rockchip: samsung-hdptx: Cleanup internal rate
 handling
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241212-phy-sam-hdptx-bpc-v2-7-57e672c7c7c4@collabora.com>
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
X-CRM114-CacheID: sfid-20241212_120401_950914_91D802FB 
X-CRM114-Status: GOOD (  12.01  )
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

Drop the rate parameter from a bunch of internal helpers and, instead,
make better use of the newly introduced ->tmds_char_rate driver data.

No functional changes intended.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 27 ++++++++++++-----------
 1 file changed, 14 insertions(+), 13 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
index d90d89cfdff561e13ac3db3f143a4eef9cc85a03..bc513ddd5c052763856a113a7f1e58660f7372b8 100644
--- a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
+++ b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
@@ -796,14 +796,13 @@ static int rk_hdptx_ropll_tmds_cmn_config(struct rk_hdptx_phy *hdptx,
 	return rk_hdptx_post_enable_pll(hdptx);
 }
 
-static int rk_hdptx_ropll_tmds_mode_config(struct rk_hdptx_phy *hdptx,
-					   unsigned int rate)
+static int rk_hdptx_ropll_tmds_mode_config(struct rk_hdptx_phy *hdptx)
 {
 	rk_hdptx_multi_reg_write(hdptx, rk_hdtpx_common_sb_init_seq);
 
 	regmap_write(hdptx->regmap, LNTOP_REG(0200), 0x06);
 
-	if (rate > HDMI14_MAX_RATE / 100) {
+	if (hdptx->tmds_char_rate > HDMI14_MAX_RATE) {
 		/* For 1/40 bitrate clk */
 		rk_hdptx_multi_reg_write(hdptx, rk_hdtpx_tmds_lntop_highbr_seq);
 	} else {
@@ -820,9 +819,9 @@ static int rk_hdptx_ropll_tmds_mode_config(struct rk_hdptx_phy *hdptx,
 	return rk_hdptx_post_enable_lane(hdptx);
 }
 
-static int rk_hdptx_phy_consumer_get(struct rk_hdptx_phy *hdptx,
-				     unsigned int rate)
+static int rk_hdptx_phy_consumer_get(struct rk_hdptx_phy *hdptx)
 {
+	unsigned long rate;
 	u32 status;
 	int ret;
 
@@ -836,8 +835,9 @@ static int rk_hdptx_phy_consumer_get(struct rk_hdptx_phy *hdptx,
 	if (status & HDPTX_O_PLL_LOCK_DONE)
 		dev_warn(hdptx->dev, "PLL locked by unknown consumer!\n");
 
+	rate = hdptx->tmds_char_rate ?: hdptx->rate;
 	if (rate) {
-		ret = rk_hdptx_ropll_tmds_cmn_config(hdptx, rate);
+		ret = rk_hdptx_ropll_tmds_cmn_config(hdptx, rate / 100);
 		if (ret)
 			goto dec_usage;
 	}
@@ -879,26 +879,27 @@ static int rk_hdptx_phy_consumer_put(struct rk_hdptx_phy *hdptx, bool force)
 static int rk_hdptx_phy_power_on(struct phy *phy)
 {
 	struct rk_hdptx_phy *hdptx = phy_get_drvdata(phy);
-	unsigned int rate = hdptx->tmds_char_rate / 100;
 	int ret;
 
-	if (rate == 0) {
+	if (!hdptx->tmds_char_rate) {
 		/*
 		 * FIXME: Temporary workaround to setup TMDS char rate
 		 * from the RK HDMI bridge driver.
 		 * Will be removed as soon the switch to the HDMI PHY
 		 * configuration API has been completed on both ends.
 		 */
-		rate = phy_get_bus_width(hdptx->phy) & 0xfffffff;
+		hdptx->tmds_char_rate = phy_get_bus_width(hdptx->phy) & 0xfffffff;
+		hdptx->tmds_char_rate *= 100;
 	}
 
-	dev_dbg(hdptx->dev, "%s rate=%u bpc=%u\n", __func__, rate, hdptx->bpc);
+	dev_dbg(hdptx->dev, "%s tmds_rate=%lu bpc=%u\n", __func__,
+		hdptx->tmds_char_rate, hdptx->bpc);
 
-	ret = rk_hdptx_phy_consumer_get(hdptx, rate);
+	ret = rk_hdptx_phy_consumer_get(hdptx);
 	if (ret)
 		return ret;
 
-	ret = rk_hdptx_ropll_tmds_mode_config(hdptx, rate);
+	ret = rk_hdptx_ropll_tmds_mode_config(hdptx);
 	if (ret)
 		rk_hdptx_phy_consumer_put(hdptx, true);
 
@@ -950,7 +951,7 @@ static int rk_hdptx_phy_clk_prepare(struct clk_hw *hw)
 {
 	struct rk_hdptx_phy *hdptx = to_rk_hdptx_phy(hw);
 
-	return rk_hdptx_phy_consumer_get(hdptx, hdptx->rate / 100);
+	return rk_hdptx_phy_consumer_get(hdptx);
 }
 
 static void rk_hdptx_phy_clk_unprepare(struct clk_hw *hw)

-- 
2.47.0


