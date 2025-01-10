Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2F7CE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 11:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SLRRk5zmDSV+fM1RFKO6OQEV4aHVddumQnCjWnaVyp8=; b=BbwtAlJLGS6Ybv1qJZJJIK2/7s
	MRwIer5DyS35P1uULRFzn7nuU6Jl+7fjawHq3vZVew8yHZMXsSnkVh+0JKLdJa0gpPoFQygAwhxgX
	UPIReTJu1dUrcgefA17LtQcfO/5nUVJUTzxL4Jpe3DlUB27j+0T2eljeUyh1b6crp/9xzxO3Vo6Ax
	zi3CmrULU45MapVtZycLqmi8MYSiaNrrsK2kZzxyZtziD8mvSl0euLYAWTtqdYC0TYOiFwxq7WNQs
	PwLOOvIm4/weeTmgOYkv6xwBxZa34LyYA7mh/4jz+31Mo4CNcGWCF8bnJqT5wuugBWRG9O0quHwkl
	vaWsu7vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWDWt-0000000FAVP-1tMy;
	Fri, 10 Jan 2025 11:50:19 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWDUU-0000000FA1i-1H91;
	Fri, 10 Jan 2025 11:47:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D5520A41DDC;
	Fri, 10 Jan 2025 11:46:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F2423C4CEDF;
	Fri, 10 Jan 2025 11:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736509669;
	bh=+bBN7X5DoKL/XSHDmvrzqb3BA5dGzZ/fj7/IKqsTMjY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=iqF/c125JideKK2SjA3m8LpVhBYNBpUbZcmLoqSzRhNp3OKPBTuHX44dbcraWNB33
	 3mT8/wj+Dwr7F14pWce9F2MkpnMbTeTTFa+pxjdYTdlrVOWsmSFDwx0FnNE/p+7t/H
	 HBh4nNyVh43v9/NOsus5TEtBJ96NRsvZia4Vgb1c9W1QTg02xq5Vevg2Pv2Y8FY5ex
	 G9gNHGmhbicV/bUXvQ/bnbQSNsF64rAL0fBW/Wa1RSx+c7fXsP9aCUWgVBVqOYpfLS
	 VmNy6l0Q2hr8FugV3R7z6o5I+W2/4EAzRuaKO1xCg/NYZH1sMkb2C6bqdFsEHEbCSV
	 vB75dyDy4WHKg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E442AE7719E;
	Fri, 10 Jan 2025 11:47:48 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Date: Fri, 10 Jan 2025 19:47:11 +0800
Subject: [PATCH 2/2] clk: amlogic: c3: Limit the rate boundaries of clk_hw
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250110-limit-rate-range-of-clk-v1-2-dd618adc4aa8@amlogic.com>
References: <20250110-limit-rate-range-of-clk-v1-0-dd618adc4aa8@amlogic.com>
In-Reply-To: <20250110-limit-rate-range-of-clk-v1-0-dd618adc4aa8@amlogic.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Chuan Liu <chuan.liu@amlogic.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736509666; l=5184;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=8XGEQBOCJSgFZ2f2fpSkVtYBK8fi63dUXKYPxwN2M48=;
 b=1XANFRx0lswzvvpEbiIPFHJx220g4DleCItzkvN2v4pK958nuDuGFr6S5LbRx/TDf3QBtEYA9
 dPCCRpv3EIxAvHymsuRLB4hc03O5pFj7q2xOLSPKf653xN1WxT4rHgr
X-Developer-Key: i=chuan.liu@amlogic.com; a=ed25519;
 pk=fnKDB+81SoWGKW2GJNFkKy/ULvsDmJZRGBE7pR5Xcpo=
X-Endpoint-Received: by B4 Relay for chuan.liu@amlogic.com/20240902 with
 auth_id=203
X-Original-From: Chuan Liu <chuan.liu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_034750_507934_0CE9ADAE 
X-CRM114-Status: UNSURE (   9.42  )
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
Reply-To: chuan.liu@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Chuan Liu <chuan.liu@amlogic.com>

The PLL can only stably lock within a limited frequency range.

Due to timing constraints, the maximum frequency of the peripheral clock
cannot exceed the design specifications.

Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
---
 drivers/clk/meson/c3-peripherals.c | 21 +++++++++++++++++++++
 drivers/clk/meson/c3-pll.c         |  4 ++++
 2 files changed, 25 insertions(+)

diff --git a/drivers/clk/meson/c3-peripherals.c b/drivers/clk/meson/c3-peripherals.c
index 7dcbf4ebee07..9f0a3990f0d6 100644
--- a/drivers/clk/meson/c3-peripherals.c
+++ b/drivers/clk/meson/c3-peripherals.c
@@ -568,6 +568,7 @@ static const struct clk_parent_data pwm_parent_data[] = {
 		.ops = &clk_regmap_gate_ops,			\
 		.parent_names = (const char *[]) { #_name "_div" },\
 		.num_parents = 1,				\
+		.max_rate = 200000000,				\
 		.flags = CLK_SET_RATE_PARENT,			\
 	},							\
 }
@@ -724,6 +725,7 @@ static struct clk_regmap spicc_a = {
 			&spicc_a_div.hw
 		},
 		.num_parents = 1,
+		.max_rate = 500000000,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
@@ -771,6 +773,7 @@ static struct clk_regmap spicc_b = {
 			&spicc_b_div.hw
 		},
 		.num_parents = 1,
+		.max_rate = 500000000,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
@@ -829,6 +832,7 @@ static struct clk_regmap spifc = {
 			&spifc_div.hw
 		},
 		.num_parents = 1,
+		.max_rate = 167000000,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
@@ -887,6 +891,7 @@ static struct clk_regmap sd_emmc_a = {
 			&sd_emmc_a_div.hw
 		},
 		.num_parents = 1,
+		.max_rate = 250000000,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
@@ -934,6 +939,7 @@ static struct clk_regmap sd_emmc_b = {
 			&sd_emmc_b_div.hw
 		},
 		.num_parents = 1,
+		.max_rate = 250000000,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
@@ -981,6 +987,7 @@ static struct clk_regmap sd_emmc_c = {
 			&sd_emmc_c_div.hw
 		},
 		.num_parents = 1,
+		.max_rate = 1200000000,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
@@ -1074,6 +1081,7 @@ static struct clk_regmap eth_rmii = {
 			&eth_rmii_div.hw
 		},
 		.num_parents = 1,
+		.max_rate = 50000000,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
@@ -1132,6 +1140,7 @@ static struct clk_regmap mipi_dsi_meas = {
 			&mipi_dsi_meas_div.hw
 		},
 		.num_parents = 1,
+		.max_rate = 200000000,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
@@ -1190,6 +1199,7 @@ static struct clk_regmap dsi_phy = {
 			&dsi_phy_div.hw
 		},
 		.num_parents = 1,
+		.max_rate = 1500000000,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
@@ -1248,6 +1258,7 @@ static struct clk_regmap vout_mclk = {
 			&vout_mclk_div.hw
 		},
 		.num_parents = 1,
+		.max_rate = 334000000,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
@@ -1306,6 +1317,7 @@ static struct clk_regmap vout_enc = {
 			&vout_enc_div.hw
 		},
 		.num_parents = 1,
+		.max_rate = 200000000,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
@@ -1431,6 +1443,7 @@ static struct clk_regmap hcodec = {
 		.ops = &clk_regmap_mux_ops,
 		.parent_data = hcodec_parent_data,
 		.num_parents = ARRAY_SIZE(hcodec_parent_data),
+		.max_rate = 667000000,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
@@ -1489,6 +1502,7 @@ static struct clk_regmap vc9000e_aclk = {
 			&vc9000e_aclk_div.hw
 		},
 		.num_parents = 1,
+		.max_rate = 667000000,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
@@ -1536,6 +1550,7 @@ static struct clk_regmap vc9000e_core = {
 			&vc9000e_core_div.hw
 		},
 		.num_parents = 1,
+		.max_rate = 400000000,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
@@ -1594,6 +1609,7 @@ static struct clk_regmap csi_phy0 = {
 			&csi_phy0_div.hw
 		},
 		.num_parents = 1,
+		.max_rate = 200000000,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
@@ -1652,6 +1668,7 @@ static struct clk_regmap dewarpa = {
 			&dewarpa_div.hw
 		},
 		.num_parents = 1,
+		.max_rate = 800000000,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
@@ -1710,6 +1727,7 @@ static struct clk_regmap isp0 = {
 			&isp0_div.hw
 		},
 		.num_parents = 1,
+		.max_rate = 400000000,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
@@ -1768,6 +1786,7 @@ static struct clk_regmap nna_core = {
 			&nna_core_div.hw
 		},
 		.num_parents = 1,
+		.max_rate = 800000000,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
@@ -1826,6 +1845,7 @@ static struct clk_regmap ge2d = {
 			&ge2d_div.hw
 		},
 		.num_parents = 1,
+		.max_rate = 667000000,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
@@ -1884,6 +1904,7 @@ static struct clk_regmap vapb = {
 			&vapb_div.hw
 		},
 		.num_parents = 1,
+		.max_rate = 400000000,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
diff --git a/drivers/clk/meson/c3-pll.c b/drivers/clk/meson/c3-pll.c
index 35fda31a19e2..d80d6ee2409d 100644
--- a/drivers/clk/meson/c3-pll.c
+++ b/drivers/clk/meson/c3-pll.c
@@ -286,6 +286,8 @@ static struct clk_regmap gp0_pll_dco = {
 			.fw_name = "top",
 		},
 		.num_parents = 1,
+		.min_rate = 3000000000,
+		.max_rate = 6000000000,
 	},
 };
 
@@ -370,6 +372,8 @@ static struct clk_regmap hifi_pll_dco = {
 			.fw_name = "top",
 		},
 		.num_parents = 1,
+		.min_rate = 3000000000,
+		.max_rate = 6000000000,
 	},
 };
 

-- 
2.42.0



