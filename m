Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 245F3C021B3
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Feb 2025 11:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9pCZ3fhe5IwCIBxfo81J/HAIwMMT7kuBeuKIpKSaKCw=; b=a9Obtuj43actEITZRLIbl3jpN0
	zSQNIkhXqmfZinUM/uXDTCA97jaFXrjrNFPJtZRbp2iHoAr2Mv1AWBSPAJusa+DY5Npe325whvJrv
	oSOpFtGMP9UYucTttHT0dCxwUktP/3DBe1JVJbwT348GQVTe+P10J1ZAK12m/9EU5ozIbNTu0pKG/
	ZO8Pv7iGfG3JLHGnbsTJQC1T/Qd30grAjUJhj9Ihls8S58JSLRy+r8veIbcqZgqCNqz+MaRMWVSm+
	sGiUF4SKSElApvTygozGVtTUayM/xYGjP7Cb2IQnhyLI8mXMf3a4a1tCQvYSzyk0lctlrzoBNJeoU
	EgnCvwiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tm9tP-0000000AwLT-20ln;
	Sun, 23 Feb 2025 11:11:27 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tm9kl-0000000Auqv-1r6z;
	Sun, 23 Feb 2025 11:02:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1740308550;
	bh=tpPMKEn4y6Q4gIkPhcILqIjsfH9Lu+r8Lssviy8ylJE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=oHi4R4xdGmLKlq+ydb5zw2ytPy4NnojgNAWLi3TI7x5rKuGtEXzmq9KpfDRtlyRKw
	 oIxv2VY943jzsX3ne08xc+w3EDXl2vcLExy3aMKOKm3y1dsiMVY/sKGb4zUPiNzlI0
	 AoaROsM81rHEVfKqN7wMPeE21gPJb/02sdKTfkIaIau4fQMDJyfoP27dyrtj+ERHHI
	 CRIuwK8ERloLbCygNVdExgD0YyED1YqoCT0CCJpTwac4BfAtwHJ2AfTiYHhLPO8j53
	 4DqSy32OQ+/SmW8nOvJjlkkhKGSd3OV5Zx0i+A2eizaMmpPHh5rm+RIeMNBQmpc0cQ
	 Ow4taIL3jsMEw==
Received: from localhost (unknown [188.27.58.83])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id D4EC517E0DD7;
	Sun, 23 Feb 2025 12:02:29 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Sun, 23 Feb 2025 13:02:12 +0200
Subject: [PATCH v3 5/8] phy: rockchip: samsung-hdptx: Setup TMDS char rate
 via phy_configure_opts_hdmi
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250223-phy-sam-hdptx-bpc-v3-5-66a5c8e68327@collabora.com>
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
X-CRM114-CacheID: sfid-20250223_030231_629675_4D9806DC 
X-CRM114-Status: GOOD (  14.97  )
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

The current workaround to setup the TMDS character rate relies on the
unconventional usage of phy_set_bus_width().

Make use of the recently introduced HDMI PHY configuration API for this
purpose.  The workaround will be dropped as soon as the switch has been
completed on both ends.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 37 +++++++++++++++++------
 1 file changed, 27 insertions(+), 10 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
index f9b5c96d6c789e435657e224032d35b5a6950945..dd91a7272e246b2133112effdb080a847fd15abe 100644
--- a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
+++ b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
@@ -402,6 +402,9 @@ struct rk_hdptx_phy {
 	int nr_clks;
 	struct reset_control_bulk_data rsts[RST_MAX];
 
+	/* PHY config opts */
+	unsigned long tmds_char_rate;
+
 	/* clk provider */
 	struct clk_hw hw;
 	unsigned long rate;
@@ -1413,19 +1416,21 @@ static int rk_hdptx_dp_aux_init(struct rk_hdptx_phy *hdptx)
 static int rk_hdptx_phy_power_on(struct phy *phy)
 {
 	struct rk_hdptx_phy *hdptx = phy_get_drvdata(phy);
-	int bus_width = phy_get_bus_width(hdptx->phy);
+	unsigned int rate = hdptx->tmds_char_rate / 100;
 	enum phy_mode mode = phy_get_mode(phy);
 	int ret, lane;
 
-	/*
-	 * FIXME: Temporary workaround to pass pixel_clk_rate
-	 * from the HDMI bridge driver until phy_configure_opts_hdmi
-	 * becomes available in the PHY API.
-	 */
-	unsigned int rate = bus_width & 0xfffffff;
+	if (rate == 0) {
+		/*
+		 * FIXME: Temporary workaround to setup TMDS char rate
+		 * from the RK HDMI bridge driver.
+		 * Will be removed as soon the switch to the HDMI PHY
+		 * configuration API has been completed on both ends.
+		 */
+		rate = phy_get_bus_width(hdptx->phy) & 0xfffffff;
+	}
 
-	dev_dbg(hdptx->dev, "%s bus_width=%x rate=%u\n",
-		__func__, bus_width, rate);
+	dev_dbg(hdptx->dev, "%s rate=%u\n", __func__, rate);
 
 	ret = rk_hdptx_phy_consumer_get(hdptx, rate);
 	if (ret)
@@ -1734,8 +1739,10 @@ static int rk_hdptx_phy_configure(struct phy *phy, union phy_configure_opts *opt
 	enum phy_mode mode = phy_get_mode(phy);
 	int ret;
 
-	if (mode != PHY_MODE_DP)
+	if (mode != PHY_MODE_DP) {
+		hdptx->tmds_char_rate = opts->hdmi.tmds_char_rate;
 		return 0;
+	}
 
 	ret = rk_hdptx_phy_verify_config(hdptx, &opts->dp);
 	if (ret) {
@@ -1830,6 +1837,16 @@ static int rk_hdptx_phy_clk_set_rate(struct clk_hw *hw, unsigned long rate,
 {
 	struct rk_hdptx_phy *hdptx = to_rk_hdptx_phy(hw);
 
+	/*
+	 * The TMDS char rate set via phy_configure(), if any, has
+	 * precedence over the rate provided via clk_set_rate().
+	 */
+	if (hdptx->tmds_char_rate && hdptx->tmds_char_rate != rate) {
+		dev_dbg(hdptx->dev, "Replaced clk_set_rate=%lu with tmds_char_rate=%lu\n",
+			rate, hdptx->tmds_char_rate);
+		rate = hdptx->tmds_char_rate;
+	}
+
 	return rk_hdptx_ropll_tmds_cmn_config(hdptx, rate / 100);
 }
 

-- 
2.48.1


