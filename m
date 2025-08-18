Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35FC7CA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 20:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=umGvmkY8Kgupt3663FzyBJVVJp66XyfBlQ79H4LLzUg=; b=4flxR7aQktoZh7SnJs7lu+/dPX
	K8Jg5njlWFXKvxTJyiasOWxjM7HxKKpjaKCoCop1kbmg3IMenkUbSLxFEVuq0CrbI10AyZa/gM3Vv
	HmjbiBlzGptv08VRWA50cAqbS5BOYcqRv+OldvMQGOkGYfP1olTyxFHtoZNrlO8PMIYHb3968oz7C
	LVVgIQEhfI2uKsh8+xw8Z/DjHdK64BssUqgCb5yBW6+1rXvLDm0EcgxFTwRr1NFeQAlpCMMZl74W6
	XNpfrX3V38uCbtYNed/RjPE0RKUDNv3K40wa1GSO3OOPBMppHjvoUm5vJHYAKHRYkPy14vnL9++Nt
	NXG/1MmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo6FY-00000008bAS-42wc;
	Mon, 18 Aug 2025 20:14:37 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo54r-00000008R4i-3R5V;
	Mon, 18 Aug 2025 18:59:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1755543568;
	bh=8PriDLdyw36f96US4S20mKBUaPRnAWhfKgLzqyYORbU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=h+czZw8AQLo3CgiCNmVkdb/dWP9Gc7oJyME28wWXfhzEu/l/CLU8oVwsQzD2yg4PB
	 lOM2j/saJpN8scuyosvuwhm19apY0MAPY5BFHggqNmIlTDL5ncaL/0rUFXTR2npfTp
	 wyq2hum4hOO8pNgbMy7d35Fe0d2NDmM4dj3gK4cu+j2kdsLrfFI44K5c8L2v0LL2LO
	 Ozy025MA8Kw9bVMe+L6LrrRnbOxgIM72tM24PKpeyTmAyuHF7lGo6n8Bn653COpWlf
	 TxIDErY/sdAUV7KgSwkw+oYqmz2RpSXbsOZn7hY03VXUd1lx8xPenHjGHI+F20oa9k
	 ItaC76h8vr//Q==
Received: from localhost (unknown [82.79.138.60])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id 1F05817E1322;
	Mon, 18 Aug 2025 20:59:28 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Mon, 18 Aug 2025 21:59:10 +0300
Subject: [PATCH v3 10/14] phy: rockchip: samsung-hdptx: Compute clk rate
 from PLL config
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250818-phy-hdptx-frl-v3-10-c79997d8bb2b@collabora.com>
References: <20250818-phy-hdptx-frl-v3-0-c79997d8bb2b@collabora.com>
In-Reply-To: <20250818-phy-hdptx-frl-v3-0-c79997d8bb2b@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Algea Cao <algea.cao@rock-chips.com>, 
 Dmitry Baryshkov <lumag@kernel.org>
Cc: kernel@collabora.com, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_115930_041687_87CF7B61 
X-CRM114-Status: GOOD (  12.27  )
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

Improve ->recalc_rate() callback of hdptx_phy_clk_ops to calculate the
initial clock rate based on the actual PHY PLL configuration as
retrieved from the related hardware registers.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 91 ++++++++++++++++++++++-
 1 file changed, 90 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
index 699b86732b8d7d77b3f9ec3a7a8c801392b796f6..6e2443f78968948b84e4261e33761fe0d189553b 100644
--- a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
+++ b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
@@ -1851,12 +1851,101 @@ static void rk_hdptx_phy_clk_unprepare(struct clk_hw *hw)
 	rk_hdptx_phy_consumer_put(hdptx, true);
 }
 
+#define PLL_REF_CLK 24000000ULL
+
+static u64 rk_hdptx_phy_clk_calc_rate_from_pll_cfg(struct rk_hdptx_phy *hdptx)
+{
+	struct ropll_config ropll_hw;
+	u64 fout, sdm;
+	u32 mode, val;
+	int ret;
+
+	ret = regmap_read(hdptx->regmap, CMN_REG(0008), &mode);
+	if (ret)
+		return 0;
+
+	if (mode & LCPLL_LCVCO_MODE_EN_MASK)
+		return 0;
+
+	ret = regmap_read(hdptx->regmap, CMN_REG(0051), &val);
+	if (ret)
+		return 0;
+	ropll_hw.pms_mdiv = val;
+
+	ret = regmap_read(hdptx->regmap, CMN_REG(005E), &val);
+	if (ret)
+		return 0;
+	ropll_hw.sdm_en = val & ROPLL_SDM_EN_MASK;
+
+	ret = regmap_read(hdptx->regmap, CMN_REG(0064), &val);
+	if (ret)
+		return 0;
+	ropll_hw.sdm_num_sign = val & ROPLL_SDM_NUM_SIGN_RBR_MASK;
+
+	ret = regmap_read(hdptx->regmap, CMN_REG(0065), &val);
+	if (ret)
+		return 0;
+	ropll_hw.sdm_num = val;
+
+	ret = regmap_read(hdptx->regmap, CMN_REG(0060), &val);
+	if (ret)
+		return 0;
+	ropll_hw.sdm_deno = val;
+
+	ret = regmap_read(hdptx->regmap, CMN_REG(0069), &val);
+	if (ret)
+		return 0;
+	ropll_hw.sdc_n = (val & ROPLL_SDC_N_RBR_MASK) + 3;
+
+	ret = regmap_read(hdptx->regmap, CMN_REG(006c), &val);
+	if (ret)
+		return 0;
+	ropll_hw.sdc_num = val;
+
+	ret = regmap_read(hdptx->regmap, CMN_REG(0070), &val);
+	if (ret)
+		return 0;
+	ropll_hw.sdc_deno = val;
+
+	ret = regmap_read(hdptx->regmap, CMN_REG(0086), &val);
+	if (ret)
+		return 0;
+	ropll_hw.pms_sdiv = ((val & PLL_PCG_POSTDIV_SEL_MASK) >> 4) + 1;
+
+	fout = PLL_REF_CLK * ropll_hw.pms_mdiv;
+	if (ropll_hw.sdm_en) {
+		sdm = div_u64(PLL_REF_CLK * ropll_hw.sdc_deno *
+			      ropll_hw.pms_mdiv * ropll_hw.sdm_num,
+			      16 * ropll_hw.sdm_deno *
+			      (ropll_hw.sdc_deno * ropll_hw.sdc_n - ropll_hw.sdc_num));
+
+		if (ropll_hw.sdm_num_sign)
+			fout = fout - sdm;
+		else
+			fout = fout + sdm;
+	}
+
+	return div_u64(fout * 2, ropll_hw.pms_sdiv * 10);
+}
+
 static unsigned long rk_hdptx_phy_clk_recalc_rate(struct clk_hw *hw,
 						  unsigned long parent_rate)
 {
 	struct rk_hdptx_phy *hdptx = to_rk_hdptx_phy(hw);
+	u32 status;
+	u64 rate;
+	int ret;
+
+	if (hdptx->hw_rate)
+		return hdptx->hw_rate;
+
+	ret = regmap_read(hdptx->grf, GRF_HDPTX_CON0, &status);
+	if (ret || !(status & HDPTX_I_PLL_EN))
+		return 0;
+
+	rate = rk_hdptx_phy_clk_calc_rate_from_pll_cfg(hdptx);
 
-	return hdptx->hw_rate;
+	return DIV_ROUND_CLOSEST_ULL(rate * 8, hdptx->hdmi_cfg.bpc);
 }
 
 static long rk_hdptx_phy_clk_round_rate(struct clk_hw *hw, unsigned long rate,

-- 
2.50.1


