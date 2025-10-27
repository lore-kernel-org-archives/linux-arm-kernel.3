Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 029F4CCF9EB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 15:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OicQ1OKV8T/1KX5QBfxYsQT9BwdWiJOdtGfcmUcFvvk=; b=0+V7D2id+FaHOQhfQPuuAi8pOi
	63pwCWUrw1D+vOKZpQK9bfU62Roh314j80xXsEljlNcrpKAJU8jmnmJaVE1BJKM46tBC4q5j1YKEo
	xFiAg6p2x4mvmrW3OvL4XpZhuvrs2B2J1W0uxaNLibSTr3YNs0b1gmrtVRUI7EF+kQ4WoiZ7mssje
	6mvxnz/i+4UA1XlqPnswzmfw0/McvPR7t46McSEDoQbcJ+yo3U1SjAFRCM7XWFZ378RaCbGllWrKB
	Fhu1oVShHoEbHnSmgkD3uart5JZOH+o7r+FJmYW5cNm1KGYH2X8a5rqfAtzt5bWFFPPVP1LjuIYoK
	zuoXVbHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDPPP-0000000EFD1-3hTO;
	Mon, 27 Oct 2025 15:45:23 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDPPC-0000000EF6p-3Rvz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 15:45:12 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-471b80b994bso68089245e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 08:45:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761579909; x=1762184709; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OicQ1OKV8T/1KX5QBfxYsQT9BwdWiJOdtGfcmUcFvvk=;
        b=nFT5ih5ElQORrFW4wLKKbVS6XoBDW2bEiyX/MhXXOtavEQa+qhrXDm6uQozSQebUxI
         pXHeD71ZTUIn/di6AqYztGen8R++Mi94ZISHwDDnRWRa82vZFkmo+DUptuQRxbGPZUwa
         HU9KPROaZhAaVBxtmH4seRFFaZPFHmybmKC6fcihpmAyddsM4oCqNbo4eLnnYjD7sM1B
         yKwHwlInaFjuan2DKIXthxrlSImXuhufodyZSpUcbLatv+dM92vIOa3+mZNckgislEY+
         M2LgvGvlEOev6CC6NLZH0Lh1/UQU3re2iVsP6clsZkgAquJQ1tmGZDNpQmzhd5gMitBB
         yiCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761579909; x=1762184709;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OicQ1OKV8T/1KX5QBfxYsQT9BwdWiJOdtGfcmUcFvvk=;
        b=pM0cZrfm2ofhNZCh3Clb6TYkogg5rLhbS679Pol9G4mBYrrHPldC0BNVTve5bKaQWv
         UQGVc2ruMc7vbxAVXP1jmY31sv7eZu7Cpewt1fKNRasFjgcB8kRfleDCh9OH1AbymQLJ
         sr+NlmAF8jdKVijRIgY/BpVdfbYWOUgZNhMNLVblA1J3DnftI2df+RpCThOtGnwD85AW
         naZGrr6WLi2ldqQ5FOpLH2n/8TF/YDDwzxiU/iO3zcj1I5MBbz941Ah8ckcJQqmj21R+
         TX5EUY98vxMiKNUyLoUwJCoNsKpjaiFU5Xbn092TzPyKpVDVYH7fLJMqRXk3sN7j9YDL
         6EPA==
X-Forwarded-Encrypted: i=1; AJvYcCUuyo1XIufBDrYPQI8WxU/5v7ptgb6H0gIRlVJj7c41wBBSD1xgTs37F2BEVfj8/GTLMjOidagTvoedJQe1K9Gi@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+wzTWYI6hO0PQkUOIQYgPV8tg+lI7Ch4V4atargKF05Drywla
	0twHKwoeF6KcIZpDJ/RPQsNt9DkXMwuJBxs2Mn0VHWLjOOvg/bqvP0M+dwGnb+r9eZQ=
X-Gm-Gg: ASbGncsyY7LhajyX4KbuDIKVG7htNNN7b+6FKJmVzlmAHIiH0WGC20//UbVKRUeoHeV
	nuwxQQSwcMzuNUptFJWKjW3KuR/p0dVuLhREE68YzKkQI8MQxK+Q7UHz2SU4dHGqJvxsYqZSNFf
	lsm+3HT56VIcr1Ss5NuOS0N+ieU7RdHZYotiR78ID1ON/Iv5QyBc0Sc+vOFJbjL5g8UeT3t3FK1
	4JDPp6flHen/Y/5KXjBHx9AZogScPSeAdFiYzQdfz7KxQmKrpRPiuwsXH+TGrRvW+tf/23op7Qo
	NnT0y8/vOTYJujE1wq1w+cU+DaPBWJhjz3Hgyv30/3VEIWqTM8On0ctcKVMffRVgTTmGhq3Goj0
	77cw8aiPH/Gdl6GDInnLRQ6caAaWXnJV97qy4ITwc28aVnjRu6tk5r/2cAb8Ida6mBsdMNcw=
X-Google-Smtp-Source: AGHT+IGnURDzCL6EXlYFgChfMetXN9DLHbDSZlPkZ7qshRFfNPQz3EB5h9snkYgIRzQ1RyekW2OGPA==
X-Received: by 2002:a05:600c:3b24:b0:477:58:7cf4 with SMTP id 5b1f17b1804b1-47717df7c8emr1161855e9.4.1761579908909;
        Mon, 27 Oct 2025 08:45:08 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:c1c6:7dde:fe94:6881])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475dd477d0esm138708045e9.0.2025.10.27.08.45.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 08:45:07 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 27 Oct 2025 16:44:52 +0100
Subject: [PATCH v3 4/8] net: stmmac: qcom-ethqos: wrap emac driver data in
 additional structure
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251027-qcom-sa8255p-emac-v3-4-75767b9230ab@linaro.org>
References: <20251027-qcom-sa8255p-emac-v3-0-75767b9230ab@linaro.org>
In-Reply-To: <20251027-qcom-sa8255p-emac-v3-0-75767b9230ab@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Vinod Koul <vkoul@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Jose Abreu <joabreu@synopsys.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5648;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=cOSA+NoNF7WC2Y1gjjgtDMtaHJ+KGJ3IylBfWUELjyM=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBo/5N7y18ZJr6B/GhKmUSNUtBu9u+ofCQBq/O26
 ld3TvaFaLuJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaP+TewAKCRARpy6gFHHX
 cnwoD/0cxZBAb4XAX91qdtSNuOWe6oX6jeNpN8yk7QsX2VHoodzwPCt6oj6wMspuj4vJ9DxjBPf
 AP2jLjtIoV5hqOIHm0IhgTYcYRaFDR15GH/TOam2GYeAWLV92aBYmv6IdSBjAutwJgaBc318d6T
 g2hkFviaHTZEenJLMQEnvI72Q45xskOQC+TvH/yydMDmrQbMzEHN/cFqQ4GUSWsWZm6OseMnhAa
 iUB6ippCvLUyp7heH/nCGsSHLbhV9UDlKd1JOaow2u1Ulgpx45S5axLLX9/6pqZigvs2rfHzATJ
 Le+qEqvR7+Uh2+Q9Aws6QSXWlTa4Z3iSiIy5ZbP7bAsTaq9nuZsrL2kpAN1UIKoF/G6Oa7rsBgx
 +X8w0yx0w1H6U5UejolDHTeX9ZLHVoA850ctVr3h7XGjx/emlBJAo6uPxQ7VQPa0RiZeQ2E7BBE
 9xTyHHvZtzzpDpmEczdJpo8406xsjrY3v1SPmY1NOAJnThscNxNoNiUqCsyv7nUHtuxHRU7N0wN
 /aC5CsoAVcXZwPU1bJaddyFRpmB3ZzvurfMTgH9TO6Of3h56qMhET+WPorex+Xg/jPwotPdFs2b
 zsSehrtTd1JcZuqiNWbl1mYIvXuR/1nD6z8Y8l3LjqK+mOvqnUU201WCfTRZ0heDj3vpJxm6sQu
 burt8o4HoSXycxw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_084510_911488_63D20849 
X-CRM114-Status: GOOD (  17.28  )
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

As the first step in enabling power domain support in the driver, we'll
split the device match data and runtime data structures into their
general and power-management-specific parts. To allow that: first wrap
the emac driver data in another layer which will later be expanded.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 51 ++++++++++++++++------
 1 file changed, 37 insertions(+), 14 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index ed799da4e4079b4da4b555dd119cce8c6591aa39..2739bc00e7525a5913bd3a5d28d9c9a8871fb7cf 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -101,6 +101,10 @@ struct ethqos_emac_driver_data {
 	bool needs_sgmii_loopback;
 };
 
+struct ethqos_emac_match_data {
+	const struct ethqos_emac_driver_data *drv_data;
+};
+
 struct qcom_ethqos {
 	struct platform_device *pdev;
 	void __iomem *rgmii_base;
@@ -218,6 +222,10 @@ static const struct ethqos_emac_driver_data emac_v2_3_0_data = {
 	.has_emac_ge_3 = false,
 };
 
+static const struct ethqos_emac_match_data emac_qcs404_data = {
+	.drv_data = &emac_v2_3_0_data,
+};
+
 static const struct ethqos_emac_por emac_v2_1_0_por[] = {
 	{ .offset = RGMII_IO_MACRO_CONFIG,	.value = 0x40C01343 },
 	{ .offset = SDCC_HC_REG_DLL_CONFIG,	.value = 0x2004642C },
@@ -234,6 +242,10 @@ static const struct ethqos_emac_driver_data emac_v2_1_0_data = {
 	.has_emac_ge_3 = false,
 };
 
+static const struct ethqos_emac_match_data emac_sm8150_data = {
+	.drv_data = &emac_v2_1_0_data,
+};
+
 static const struct ethqos_emac_por emac_v3_0_0_por[] = {
 	{ .offset = RGMII_IO_MACRO_CONFIG,	.value = 0x40c01343 },
 	{ .offset = SDCC_HC_REG_DLL_CONFIG,	.value = 0x2004642c },
@@ -266,6 +278,10 @@ static const struct ethqos_emac_driver_data emac_v3_0_0_data = {
 	},
 };
 
+static const struct ethqos_emac_match_data emac_sc8280xp_data = {
+	.drv_data = &emac_v3_0_0_data,
+};
+
 static const struct ethqos_emac_por emac_v4_0_0_por[] = {
 	{ .offset = RGMII_IO_MACRO_CONFIG,	.value = 0x40c01343 },
 	{ .offset = SDCC_HC_REG_DLL_CONFIG,	.value = 0x2004642c },
@@ -301,6 +317,10 @@ static const struct ethqos_emac_driver_data emac_v4_0_0_data = {
 	},
 };
 
+static const struct ethqos_emac_match_data emac_sa8775p_data = {
+	.drv_data = &emac_v4_0_0_data,
+};
+
 static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
 {
 	struct device *dev = &ethqos->pdev->dev;
@@ -764,7 +784,8 @@ static void ethqos_ptp_clk_freq_config(struct stmmac_priv *priv)
 
 static int qcom_ethqos_probe(struct platform_device *pdev)
 {
-	const struct ethqos_emac_driver_data *data;
+	const struct ethqos_emac_driver_data *drv_data;
+	const struct ethqos_emac_match_data *data;
 	struct plat_stmmacenet_data *plat_dat;
 	struct stmmac_resources stmmac_res;
 	struct device *dev = &pdev->dev;
@@ -815,13 +836,15 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	ethqos->mac_base = stmmac_res.addr;
 
 	data = device_get_match_data(dev);
-	ethqos->por = data->por;
-	ethqos->num_por = data->num_por;
-	ethqos->rgmii_config_loopback_en = data->rgmii_config_loopback_en;
-	ethqos->has_emac_ge_3 = data->has_emac_ge_3;
-	ethqos->needs_sgmii_loopback = data->needs_sgmii_loopback;
+	drv_data = data->drv_data;
 
-	ethqos->link_clk = devm_clk_get(dev, data->link_clk_name ?: "rgmii");
+	ethqos->por = drv_data->por;
+	ethqos->num_por = drv_data->num_por;
+	ethqos->rgmii_config_loopback_en = drv_data->rgmii_config_loopback_en;
+	ethqos->has_emac_ge_3 = drv_data->has_emac_ge_3;
+	ethqos->needs_sgmii_loopback = drv_data->needs_sgmii_loopback;
+
+	ethqos->link_clk = devm_clk_get(dev, drv_data->link_clk_name ?: "rgmii");
 	if (IS_ERR(ethqos->link_clk))
 		return dev_err_probe(dev, PTR_ERR(ethqos->link_clk),
 				     "Failed to get link_clk\n");
@@ -849,14 +872,14 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	plat_dat->ptp_clk_freq_config = ethqos_ptp_clk_freq_config;
 	plat_dat->core_type = DWMAC_CORE_GMAC4;
 	if (ethqos->has_emac_ge_3)
-		plat_dat->dwmac4_addrs = &data->dwmac4_addrs;
+		plat_dat->dwmac4_addrs = &drv_data->dwmac4_addrs;
 	plat_dat->pmt = 1;
 	if (device_property_present(dev, "snps,tso"))
 		plat_dat->flags |= STMMAC_FLAG_TSO_EN;
 	if (device_is_compatible(dev, "qcom,qcs404-ethqos"))
 		plat_dat->flags |= STMMAC_FLAG_RX_CLK_RUNS_IN_LPI;
-	if (data->dma_addr_width)
-		plat_dat->host_dma_width = data->dma_addr_width;
+	if (drv_data->dma_addr_width)
+		plat_dat->host_dma_width = drv_data->dma_addr_width;
 
 	if (ethqos->serdes_phy) {
 		plat_dat->serdes_powerup = qcom_ethqos_serdes_powerup;
@@ -871,10 +894,10 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id qcom_ethqos_match[] = {
-	{ .compatible = "qcom,qcs404-ethqos", .data = &emac_v2_3_0_data},
-	{ .compatible = "qcom,sa8775p-ethqos", .data = &emac_v4_0_0_data},
-	{ .compatible = "qcom,sc8280xp-ethqos", .data = &emac_v3_0_0_data},
-	{ .compatible = "qcom,sm8150-ethqos", .data = &emac_v2_1_0_data},
+	{ .compatible = "qcom,qcs404-ethqos", .data = &emac_qcs404_data},
+	{ .compatible = "qcom,sa8775p-ethqos", .data = &emac_sa8775p_data},
+	{ .compatible = "qcom,sc8280xp-ethqos", .data = &emac_sc8280xp_data},
+	{ .compatible = "qcom,sm8150-ethqos", .data = &emac_sm8150_data},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, qcom_ethqos_match);

-- 
2.48.1


