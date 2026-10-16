Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 277C4CCA48B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 08:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=63nKAXQsey09Ukh5gVrG7zGReaMNS36rUUEykvuvHSQ=; b=t7AhnaZtUcmA3IXyjNIpQMnDoh
	I/6lEW67UjSSZZqkhzkgu/xWXjzEYuIduHVEgjE0NgAV5sIe8YTUdcGwquu36emNn7lSoqSy+K2/0
	7LLNsRzsVRosw5AOuYEpXTVhdhXnZ1QjWb84LVC5X1iWznLHzxmJpTPczFdD+hGPYARTdGptDlZD+
	uJt12LIF//pTiQPVASjYjjDxv5zieERq22oF1n2+AC9jbWcD2RYQz2R7LLeqsTzzstsoPhWMiHBL5
	zuHXM8vM+GaWGcD/WGfXRlpYa6p0xsYRXrzQ+l7iqiDWrrXPhMMvncJ0bhmH25SoKLheGEaCoeFlY
	/NeCIutg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHdkX-00000002ORN-2Jk6;
	Fri, 16 Oct 2026 08:57:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHdkU-00000002ONO-29fi
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 16 Oct 2026 08:57:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=63nKAXQsey09Ukh5gVrG7zGReaMNS36rUUEykvuvHSQ=; b=ZErrkLREIt7guXxdC2H/wzjH1q
	cL/+qR9sOcQcvT3m6929Z5mQD0nOIcIVjqsPqCwlMMXVGm/R05QvOKqO0x29ydJxRqm+ziOBE4XZ/
	QkB6kMLF2fHNqPvLBEkoI26CTpwNxCzM1NJGaEJnkrH9xrqWyye/0J7q/53Uf4V7oyCXWibd801PY
	N9DLPJTMT8nLTJI7bzHwrlCQlVcWZeXM4x4EfxY/dbumLDLZrIVVXSRM41tk3hgZGqYeylrWgS+NO
	3IwLYlt5a5pPISI+1vtGfXmD0bw6ZvoPjegXZ9GU6TK0YvmeLsG6WDufLCrO4MVpzhpPa2CKKR8WF
	CqAFDc7w==;
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHdkQ-00000001HsZ-1Ngd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 08:57:09 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-cc785ed8aacso343452a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Oct 2026 01:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792141024; x=1792745824; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=63nKAXQsey09Ukh5gVrG7zGReaMNS36rUUEykvuvHSQ=;
        b=sCCHbAdIm/v0M18kZNmSTTxKmZhMebeW8QwkcPaMhcK8Jsmv8sg5+TVnEz1TBaeJSJ
         U0EjQH0rGeV+3O6cupbFOgvHQQit6oCXEWiRlgxzF4ySjpCEXYaV7qNrihd2un3189Ov
         4bEo0f0MBFs9jsa+sefPKAo+hcEswYAxAvDJIBQ+cUQxSYBW5k8DYJl7Vy7s53SBWaiH
         p4Vz6d85enYuE0QyoWCiuACKG18dEZDE3erSinO9fuak3eBGHCPsWA0ZlGZC5jKsmIHf
         32THWidTWsxzubkeyVnU6GiKQjs+BgVjmG16qFw/gWYITadnc6U6tdGxLPGa+0Blb5/7
         Bf/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792141024; x=1792745824;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=63nKAXQsey09Ukh5gVrG7zGReaMNS36rUUEykvuvHSQ=;
        b=2vXTwCn8TR6R8WUOKvCfFjVVMzFP6DQCEtrQpKCnu8bXZ+A/SidcrHimzdiOWEvETh
         hPd89YHS24NaoGoyixXuVaJjcJDoPQLfngHsXVSOZC9B6nZEXufoSCq8t9CfcZFCJbsu
         ueOSROsCdipcDOeI8iWe/dMndxwX9T+gwTD4dL+QUmgfonZiNRLZqMHiChkq8ycMjFcW
         wPKQYDGdomk28TiGjRMm0xO2Xl8SIBEXEOq84236iUFzjj4g7GRLDdwPv9lWKSa8Oajz
         8R3jyXs53DqyUnaVHUxd4+bc0Dor1fnuITCBtGeWVTvoQ4MTnO+WV0ikQefey7smA7Dk
         gX7Q==
X-Forwarded-Encrypted: i=1; AKwUvByY2Qnyg47w3DI08JI9Uma5TdXpdFq8MhzMencr0VvVDqFOP0hr3QNlCx21fD/BViB3W2WXVQogC9TtYgoq+EM2@lists.infradead.org
X-Gm-Message-State: AFq9FYKv7+A4axfrABe0A6Xw2265zxCvlczjpDF3sDgRpvF/iLX208Qt
	q37/kJFWThpO4gQ/W8ElpEv67DB2FTwOH1K3P65l/eSDIgSxsN0DxWfi
X-Gm-Gg: AYBFou3bU+jUIVzpGvYNu2mEGRvkg2HoDGKp2ajicrHlRmeiDqw9XjNs472CuEShfQm
	nuAuC6Y83tJOlYa2bIRF04HJiIgjdRJkLdUmwi5CN0/dEJYv8gobutm4wSO1SExRyX+6SDs26pC
	0btwPV9RB9xKAWgMGufaptlsp0tksyWfhY1qKFwvPmMM4dkeeM3s1tRzfHDMuVdtrwFvl6dU6K3
	743g26SUIS1P1uzl3n8U8J92IEE5l5k8xH+shqBX6yduSjmDNBO165dd4H9pflj4iUm1EU4EXTR
	cgcncjj5H6gzZXfDBd3bXN92+oOmEiIdmkZV/tsmu8VPQaJ396eOFohjyXVhuy1OUt6R4J/dRfM
	pVr1gt6nRtKXLv/OOiMy+tZr785tnRlO80bjOA3xRLmFs7oD2IcAFshI+neKrebgykO51wi3Jwj
	WFYrS7dr3jBM4HcOoUes4AFKs2calTVgga5tHNmELLlUBF0st2tSrhV5Q+j5mDfqhmxazTMh+Ez
	TUBUupwnuMTc3gOc8ZC4W4QiLjE0A==
X-Received: by 2002:a17:903:ac8:b0:2e9:5714:607a with SMTP id d9443c01a7336-2e957148b4fmr82121225ad.2.1792141023648;
        Fri, 16 Oct 2026 01:57:03 -0700 (PDT)
Received: from [127.0.1.1] (211-23-39-77.hinet-ip.hinet.net. [211.23.39.77])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e882a20sm6971025ad.62.2026.10.16.01.56.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 01:57:02 -0700 (PDT)
From: Jason Yang <jason98166@gmail.com>
Date: Fri, 16 Oct 2026 16:56:38 +0800
Subject: [PATCH v5 4/8] phy: rockchip-samsung-dcphy: Name the transmitter
 helpers and ops
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-dcphy-rx-v1-v5-4-e63b49eabe2d@gmail.com>
References: <20261016-dcphy-rx-v1-v5-0-e63b49eabe2d@gmail.com>
In-Reply-To: <20261016-dcphy-rx-v1-v5-0-e63b49eabe2d@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Guochun Huang <hero.huang@rock-chips.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Michael Riesch <michael.riesch@collabora.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Jason Yang <jason98166@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792141002; l=8913;
 i=jason98166@gmail.com; s=20260721; h=from:subject:message-id;
 bh=hcQTksvADjtauLj3h0Brp979GtEN7Q5IAa9jWjy/9U0=;
 b=xX3Avn92xvzDCAsyiULnTYz+WV+dT5EfHK6Q6y54hU6bVR8wren2hfazaS/xuDfmRpaoe9ClJ
 OrPIqxeQPFTB4ZwPH2GsKuIkjY/de5rvipzeBTaxXh9HxrW34VXBG/e
X-Developer-Key: i=jason98166@gmail.com; a=ed25519;
 pk=xQmD001Q/ooHl39PxyQtusbUQmgbOsSfpFryRVWZ/k4=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_095707_902585_57A8BA9A 
X-CRM114-Status: GOOD (  19.74  )
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

The block is a combo PHY: it exposes a transmitter and a receiver, and a
later change registers one struct phy for each. Prepare for that. Give
every helper that programs the master lanes a tx_ prefix, and move the
phy pointer and the lane count, which only the transmitter uses, into a
struct samsung_mipi_phy that the receiver can have one of too.

Name the phy_ops and its callbacks after the transmitter as well, so
that the receiver can bring its own rather than share these.

The BIAS block and the PLL keep their names: the TRM puts both in the
part common to the whole block [1], so neither belongs to one PHY even
though only the transmitter drives the PLL.

No functional change intended.

[1] RK3588 TRM: sections 22.3.1 (bias generator), 22.3.2 (PLL) and
    22.4.1 (address map)

Assisted-by: LLM
Signed-off-by: Jason Yang <jason98166@gmail.com>
---
 drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c | 67 ++++++++++++-----------
 1 file changed, 36 insertions(+), 31 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c b/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
index 1471a1563d2a..e4293c8d2b29 100644
--- a/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
+++ b/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
@@ -280,6 +280,11 @@ struct samsung_mipi_dcphy_plat_data {
 	u32 dphy_tx_max_lane_kbps;
 };
 
+struct samsung_mipi_phy {
+	struct phy *phy;
+	unsigned int lanes;
+};
+
 struct samsung_mipi_dcphy {
 	struct device *dev;
 	struct clk *ref_clk;
@@ -290,8 +295,7 @@ struct samsung_mipi_dcphy {
 	struct reset_control *s_phy_rst;
 	struct reset_control *apb_rst;
 	struct reset_control *grf_apb_rst;
-	unsigned int lanes;
-	struct phy *phy;
+	struct samsung_mipi_phy tx;
 	u8 type;
 
 	const struct samsung_mipi_dcphy_plat_data *pdata;
@@ -982,13 +986,13 @@ static void samsung_mipi_dcphy_bias_block_enable(struct samsung_mipi_dcphy *sams
 						 REG_400M_400MV | REG_645M_645MV);
 }
 
-static void samsung_mipi_dphy_lane_enable(struct samsung_mipi_dcphy *samsung)
+static void samsung_mipi_dphy_tx_lane_enable(struct samsung_mipi_dcphy *samsung)
 {
 	regmap_write(samsung->regmap, DPHY_MC_GNR_CON1, T_PHY_READY(0x2000));
 	regmap_update_bits(samsung->regmap, DPHY_MC_GNR_CON0,
 			   PHY_ENABLE, PHY_ENABLE);
 
-	switch (samsung->lanes) {
+	switch (samsung->tx.lanes) {
 	case 4:
 		regmap_write(samsung->regmap, DPHY_MD3_GNR_CON1,
 			     T_PHY_READY(0x2000));
@@ -1017,9 +1021,9 @@ static void samsung_mipi_dphy_lane_enable(struct samsung_mipi_dcphy *samsung)
 	}
 }
 
-static void samsung_mipi_dphy_lane_disable(struct samsung_mipi_dcphy *samsung)
+static void samsung_mipi_dphy_tx_lane_disable(struct samsung_mipi_dcphy *samsung)
 {
-	switch (samsung->lanes) {
+	switch (samsung->tx.lanes) {
 	case 4:
 		regmap_update_bits(samsung->regmap, DPHY_MD3_GNR_CON0,
 				   PHY_ENABLE, 0);
@@ -1094,7 +1098,7 @@ static void samsung_mipi_dcphy_pll_disable(struct samsung_mipi_dcphy *samsung)
 }
 
 static const struct samsung_mipi_dphy_timing *
-samsung_mipi_dphy_get_timing(struct samsung_mipi_dcphy *samsung)
+samsung_mipi_dphy_tx_get_timing(struct samsung_mipi_dcphy *samsung)
 {
 	const struct samsung_mipi_dphy_timing *timings;
 	unsigned int num_timings;
@@ -1201,13 +1205,13 @@ samsung_mipi_dcphy_pll_round_rate(struct samsung_mipi_dcphy *samsung,
 }
 
 static void
-samsung_mipi_dphy_clk_lane_timing_init(struct samsung_mipi_dcphy *samsung)
+samsung_mipi_dphy_tx_clk_lane_timing_init(struct samsung_mipi_dcphy *samsung)
 {
 	const struct samsung_mipi_dphy_timing *timing;
 	unsigned int lane_hs_rate = div64_ul(samsung->pll.rate, USEC_PER_SEC);
 	u32 val, res_up, res_down;
 
-	timing = samsung_mipi_dphy_get_timing(samsung);
+	timing = samsung_mipi_dphy_tx_get_timing(samsung);
 	regmap_write(samsung->regmap, DPHY_MC_GNR_CON0, 0xf000);
 
 	/*
@@ -1256,13 +1260,13 @@ samsung_mipi_dphy_clk_lane_timing_init(struct samsung_mipi_dcphy *samsung)
 }
 
 static void
-samsung_mipi_dphy_data_lane_timing_init(struct samsung_mipi_dcphy *samsung)
+samsung_mipi_dphy_tx_data_lane_timing_init(struct samsung_mipi_dcphy *samsung)
 {
 	const struct samsung_mipi_dphy_timing *timing;
 	unsigned int lane_hs_rate = div64_ul(samsung->pll.rate, USEC_PER_SEC);
 	u32 val, res_up, res_down;
 
-	timing = samsung_mipi_dphy_get_timing(samsung);
+	timing = samsung_mipi_dphy_tx_get_timing(samsung);
 
 	/*
 	 * The Drive-Strength / Voltage-Amplitude is adjusted by adjusting the
@@ -1325,7 +1329,7 @@ samsung_mipi_dphy_data_lane_timing_init(struct samsung_mipi_dcphy *samsung)
 	regmap_write(samsung->regmap, DPHY_MD3_TIME_CON4, 0x1f4);
 }
 
-static int samsung_mipi_dphy_power_on(struct samsung_mipi_dcphy *samsung)
+static int samsung_mipi_dphy_tx_power_on(struct samsung_mipi_dcphy *samsung)
 {
 	int ret;
 
@@ -1339,13 +1343,13 @@ static int samsung_mipi_dphy_power_on(struct samsung_mipi_dcphy *samsung)
 			   I_MUX_SEL_MASK, I_MUX_400MV);
 
 	samsung_mipi_dcphy_pll_configure(samsung);
-	samsung_mipi_dphy_clk_lane_timing_init(samsung);
-	samsung_mipi_dphy_data_lane_timing_init(samsung);
+	samsung_mipi_dphy_tx_clk_lane_timing_init(samsung);
+	samsung_mipi_dphy_tx_data_lane_timing_init(samsung);
 	ret = samsung_mipi_dcphy_pll_enable(samsung);
 	if (ret < 0)
 		return ret;
 
-	samsung_mipi_dphy_lane_enable(samsung);
+	samsung_mipi_dphy_tx_lane_enable(samsung);
 
 	reset_control_deassert(samsung->m_phy_rst);
 
@@ -1357,13 +1361,13 @@ static int samsung_mipi_dphy_power_on(struct samsung_mipi_dcphy *samsung)
 	return 0;
 }
 
-static int samsung_mipi_dcphy_power_on(struct phy *phy)
+static int samsung_mipi_dcphy_tx_power_on(struct phy *phy)
 {
 	struct samsung_mipi_dcphy *samsung = phy_get_drvdata(phy);
 
 	switch (samsung->type) {
 	case PHY_TYPE_DPHY:
-		return samsung_mipi_dphy_power_on(samsung);
+		return samsung_mipi_dphy_tx_power_on(samsung);
 	default:
 		/* CPHY part to be implemented later */
 		return -EOPNOTSUPP;
@@ -1372,13 +1376,13 @@ static int samsung_mipi_dcphy_power_on(struct phy *phy)
 	return 0;
 }
 
-static int samsung_mipi_dcphy_power_off(struct phy *phy)
+static int samsung_mipi_dcphy_tx_power_off(struct phy *phy)
 {
 	struct samsung_mipi_dcphy *samsung = phy_get_drvdata(phy);
 
 	switch (samsung->type) {
 	case PHY_TYPE_DPHY:
-		samsung_mipi_dphy_lane_disable(samsung);
+		samsung_mipi_dphy_tx_lane_disable(samsung);
 		break;
 	default:
 		/* CPHY part to be implemented later */
@@ -1477,13 +1481,13 @@ samsung_mipi_dcphy_pll_calc_rate(struct samsung_mipi_dcphy *samsung,
 	}
 }
 
-static int samsung_mipi_dcphy_configure(struct phy *phy,
-					union phy_configure_opts *opts)
+static int samsung_mipi_dcphy_tx_configure(struct phy *phy,
+					   union phy_configure_opts *opts)
 {
 	struct samsung_mipi_dcphy *samsung = phy_get_drvdata(phy);
 	unsigned long long target_rate = opts->mipi_dphy.hs_clk_rate;
 
-	samsung->lanes = opts->mipi_dphy.lanes > 4 ? 4 : opts->mipi_dphy.lanes;
+	samsung->tx.lanes = opts->mipi_dphy.lanes > 4 ? 4 : opts->mipi_dphy.lanes;
 
 	samsung_mipi_dcphy_pll_calc_rate(samsung, target_rate);
 	opts->mipi_dphy.hs_clk_rate = samsung->pll.rate;
@@ -1507,10 +1511,10 @@ static int samsung_mipi_dcphy_exit(struct phy *phy)
 	return 0;
 }
 
-static const struct phy_ops samsung_mipi_dcphy_ops = {
-	.configure = samsung_mipi_dcphy_configure,
-	.power_on  = samsung_mipi_dcphy_power_on,
-	.power_off = samsung_mipi_dcphy_power_off,
+static const struct phy_ops samsung_mipi_dcphy_tx_ops = {
+	.configure = samsung_mipi_dcphy_tx_configure,
+	.power_on  = samsung_mipi_dcphy_tx_power_on,
+	.power_off = samsung_mipi_dcphy_tx_power_off,
 	.init = samsung_mipi_dcphy_init,
 	.exit = samsung_mipi_dcphy_exit,
 	.owner	   = THIS_MODULE,
@@ -1540,7 +1544,7 @@ static struct phy *samsung_mipi_dcphy_xlate(struct device *dev,
 
 	samsung->type = args->args[0];
 
-	return samsung->phy;
+	return samsung->tx.phy;
 }
 
 static int samsung_mipi_dcphy_probe(struct platform_device *pdev)
@@ -1609,11 +1613,12 @@ static int samsung_mipi_dcphy_probe(struct platform_device *pdev)
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to enable runtime PM\n");
 
-	samsung->phy = devm_phy_create(dev, NULL, &samsung_mipi_dcphy_ops);
-	if (IS_ERR(samsung->phy))
-		return dev_err_probe(dev, PTR_ERR(samsung->phy), "Failed to create MIPI DC-PHY\n");
+	samsung->tx.phy = devm_phy_create(dev, NULL, &samsung_mipi_dcphy_tx_ops);
+	if (IS_ERR(samsung->tx.phy))
+		return dev_err_probe(dev, PTR_ERR(samsung->tx.phy),
+				     "Failed to create MIPI DC-PHY transmitter\n");
 
-	phy_set_drvdata(samsung->phy, samsung);
+	phy_set_drvdata(samsung->tx.phy, samsung);
 
 	phy_provider = devm_of_phy_provider_register(dev, samsung_mipi_dcphy_xlate);
 	if (IS_ERR(phy_provider))

-- 
2.43.0


