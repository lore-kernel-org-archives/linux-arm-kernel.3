Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50D10CCA470
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Oct 2025 08:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jaxsI5wjc2fZX1+u0/1MOkxyHBJYNhx76B7+LombEVg=; b=2/Z2+HaVGP8hwF2C2iez7D4v4+
	jx0qtn52Lnw8BmDMMNmzBQWUqF67qRI/LjFohDVfi3umAb4uZbU5JcPJ6YZKmXWQGu/tDBjZwf+1d
	vSYF7PxCohi74z+pMQwa5O6Ws3MRkXB2aLGsedXLOTkfUOFj9b/GuO5IHBh8kJW2A7PHoUI46zyuM
	MRGCUCDBTQSRYX+I7OHFqAdDEn164kFR2Sdk8j5BFkUT5NWGPox4zyrWqhEJI1MR068ae0jKUBvI4
	S4k9kUgzb5381KayV5g4U0tCqvrZkgVyqoUGyu+zAIPrF+a/fnubF80mYxl23uBZKbwjU14ZeUuvD
	Qp2w8ihQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6PNF-00000003Qyh-26k5;
	Wed, 08 Oct 2025 08:18:13 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6PNC-00000003Qua-2gmG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Oct 2025 08:18:11 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-46e504975dbso43046305e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Oct 2025 01:18:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1759911489; x=1760516289; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jaxsI5wjc2fZX1+u0/1MOkxyHBJYNhx76B7+LombEVg=;
        b=XSpcjN35SJhGnZtKQtOIy9okpzN5JaJ22KwnEoT3MpbPUiePS7bWlyV1re2vyl5UxU
         f0zT3PfnHQnAOrliG0EawDJm+7HgPoeY9JRh2vnClNPB8I1KDW+oxG2cH5+MSFAIkgQ0
         TYS0FNTvDSOibkkSESWGF4NqlGRbP0kXupx2VPsByBEbVJjRPyy51l1/dWmLVfXZ5JcG
         QSCrSl9LXzIZPnBI6ueM4Q7VhlwaobxPgta+r+vPnntJ8jYd97GPBHg5G0BzgMbFVhh1
         PYj1Ss/0j/GtEllfiUb2KoBvOappaxsumF+XwH1Kaaqp8TBfA0Zry1Ljhjn+T6BPyWhq
         qrgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759911489; x=1760516289;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jaxsI5wjc2fZX1+u0/1MOkxyHBJYNhx76B7+LombEVg=;
        b=SQxvmPL0AC7fPb2vHqYOwofluSjKJXHLorwW7ElagtuPHflVccqeu/1BYy2JFckU7K
         rRifyoMeBjrRybr1XujWTg7EsXvhE6iOD4DqGVMRPP4dqJsAPkrf9kK7iBXA0cw5t2kL
         5VBi7xSta1t1U3z9Att6hJAwo+A4F9phO+qbgdBulA3YeFWcwFH9F40XF25uutZQfwXF
         H2n6u/5GbpAZzSgbIHw4MeO28erHc5jsIu3kqwdByKFICZ82u2WF8hnB0bMfwW5Ru0mZ
         X496n9325fHxM4QaX2632EPqyJJlAVmQ8GyiKL9ZFpfYpf+yongr7leyLE+r5q9Kgxnh
         WXcQ==
X-Forwarded-Encrypted: i=1; AJvYcCVlxJt+rYGtV3s/LZqIgQuG4KhsPomLARqyjDhYqnuJWfo+Sb4EgJJtjAYmZ3u7WDv1Sy/2/Cg87ISlSBeEE0Ke@lists.infradead.org
X-Gm-Message-State: AOJu0YzuznX2Qf4KZ8i3+dkWYeRH/YJSBkUJApNvkHTYz+SsRUnYhkFm
	4wMc4k34oF/9BpOzGSbhlWMmRN55new/3/DTymwuuGxtDf4P2+mDdfke7GZIdbu13E0=
X-Gm-Gg: ASbGncsuK1LuU9d3KOm+ks6UyJT7jB1fnXpyf0rJ9y9plxd/mPpHgrnoGg6r0JfdKU7
	3tUKht/kA3vwug1vkZ+9thFCcNFz353aeoMS1DcJFO/M1WdTVfoUT0vdntOZO7pOhhYVtybYMZW
	cJKG26gbqN+5Z+h7XTMkJmnqrt4vhlaWfdmpJWBhxtN9i7jbrCHXeS7GNzYrvV4SQrxK1/HB6hm
	q8nh+55OzhP+BPzLCpMO2CsPRaUkJiIM/eidq///t8aN+TvBbf/zZ9M7el/Zk0TYoWw7OPKQ2VA
	HzjyGmaQMbDPxFvnQP1no05XN1GycNgvVrcDiww0yLdfVdHU+BkuMOgWirj+0+EfHmrjN/9s2ev
	3lRnC5eLBr3iDfG9ttiX+aJY0vZiMco14yYZ2z/HGiA==
X-Google-Smtp-Source: AGHT+IFFI0M9udeJcMqE+CoColhQNMFY1CADDWaFh0akyB3kucjJWvoO6XySvRVTgngRa4SKqM+zxg==
X-Received: by 2002:a05:600c:4f08:b0:45b:7b54:881 with SMTP id 5b1f17b1804b1-46fa9a86307mr16468655e9.1.1759911488611;
        Wed, 08 Oct 2025 01:18:08 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:286d:ff1d:8b7c:4328])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4255d8e97f0sm28498943f8f.27.2025.10.08.01.18.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 01:18:07 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 08 Oct 2025 10:17:51 +0200
Subject: [PATCH v2 4/8] net: stmmac: qcom-ethqos: wrap emac driver data in
 additional structure
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251008-qcom-sa8255p-emac-v2-4-92bc29309fce@linaro.org>
References: <20251008-qcom-sa8255p-emac-v2-0-92bc29309fce@linaro.org>
In-Reply-To: <20251008-qcom-sa8255p-emac-v2-0-92bc29309fce@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5758;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=sMGV2HQxeUJ7fEJpZJPTl2YIIxSzYzigYX8J2eZkPAg=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBo5h41VPsOJ0Yjb5Y8MpfBiKZVcL5BNGgjgfuES
 hpZHzR6ZIOJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaOYeNQAKCRARpy6gFHHX
 cqqFD/0RsqzsZFM1K+8+vt+P8qA7yx4vp9xwXuK0+w5Vn/5uOkxlvkbMz5iBxNS1ys4T36S/8aH
 v7XeGizwnfEN09rHSJvLH/1T0Y5km6tZmqEH9cSiw2gUKmvaGAnV/BcMhdI470tvb9f0YZ4COgD
 P7oedPWAECgxSguxna3DraU3PpSg0mx3dhTX+b5493c7ICk6dqqBID2nI/O/R1NoG3ywciR6FPH
 ufh/Z/O9EGgIkfzqxS7d9XVNhfoTfbRf3nMsA0CGvCBjTr3B30K1e0ZNYy1T+K5eJgBzG3TE6nC
 p+uIQ28z5VwjEgdDaMK3xVTf7pzgZucy5hpZEFdncgGChhPc6VXMCuoMoSjYqyxrb3FBCCBSusq
 G9fTgN6aBdxtoK+IBJo+6KWE3i57DQ3mG6UmZfE6NW33/tUJiIZfGch4UAfjBIS99hlDIQ2BWp6
 TYWqmgg8CpNvvywKx+v06qVdi7f9hanEpJ49uRmaLCLZWECBUedhEoe+GqGs1KtFB9nQLlnUDQ0
 nIXVTR4LpsVCyou+L/Ld2EUdxKNt0Jzr76LIBZOWh1C7Y8OdeGhu22FCSSUX5zt2LyIWZh8nME2
 CfRjdmF3DxPT0psjb7ckYedHPNmMfkaHksRMeYqb8yzacOZD28BZMQlrhUFX0/ciIdS2sZOawAr
 Gn5B48RqsYXVgvQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_011810_743107_481B2AC8 
X-CRM114-Status: GOOD (  17.74  )
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
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 53 ++++++++++++++++------
 1 file changed, 38 insertions(+), 15 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 0381026af0fd8baaefa767f7e0ef33efe41b0aa4..dcee5c161c01124ea6bf36ceaeca4cc8ca29c5d5 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -102,6 +102,10 @@ struct ethqos_emac_driver_data {
 	bool needs_sgmii_loopback;
 };
 
+struct ethqos_emac_match_data {
+	const struct ethqos_emac_driver_data *drv_data;
+};
+
 struct qcom_ethqos {
 	struct platform_device *pdev;
 	void __iomem *rgmii_base;
@@ -219,6 +223,10 @@ static const struct ethqos_emac_driver_data emac_v2_3_0_data = {
 	.has_emac_ge_3 = false,
 };
 
+static const struct ethqos_emac_match_data emac_qcs404_data = {
+	.drv_data = &emac_v2_3_0_data,
+};
+
 static const struct ethqos_emac_por emac_v2_1_0_por[] = {
 	{ .offset = RGMII_IO_MACRO_CONFIG,	.value = 0x40C01343 },
 	{ .offset = SDCC_HC_REG_DLL_CONFIG,	.value = 0x2004642C },
@@ -235,6 +243,10 @@ static const struct ethqos_emac_driver_data emac_v2_1_0_data = {
 	.has_emac_ge_3 = false,
 };
 
+static const struct ethqos_emac_match_data emac_sm8150_data = {
+	.drv_data = &emac_v2_1_0_data,
+};
+
 static const struct ethqos_emac_por emac_v3_0_0_por[] = {
 	{ .offset = RGMII_IO_MACRO_CONFIG,	.value = 0x40c01343 },
 	{ .offset = SDCC_HC_REG_DLL_CONFIG,	.value = 0x2004642c },
@@ -267,6 +279,10 @@ static const struct ethqos_emac_driver_data emac_v3_0_0_data = {
 	},
 };
 
+static const struct ethqos_emac_match_data emac_sc8280xp_data = {
+	.drv_data = &emac_v3_0_0_data,
+};
+
 static const struct ethqos_emac_por emac_v4_0_0_por[] = {
 	{ .offset = RGMII_IO_MACRO_CONFIG,	.value = 0x40c01343 },
 	{ .offset = SDCC_HC_REG_DLL_CONFIG,	.value = 0x2004642c },
@@ -303,6 +319,10 @@ static const struct ethqos_emac_driver_data emac_v4_0_0_data = {
 	},
 };
 
+static const struct ethqos_emac_match_data emac_sa8775p_data = {
+	.drv_data = &emac_v4_0_0_data,
+};
+
 static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
 {
 	struct device *dev = &ethqos->pdev->dev;
@@ -766,7 +786,8 @@ static void ethqos_ptp_clk_freq_config(struct stmmac_priv *priv)
 
 static int qcom_ethqos_probe(struct platform_device *pdev)
 {
-	const struct ethqos_emac_driver_data *data;
+	const struct ethqos_emac_driver_data *drv_data;
+	const struct ethqos_emac_match_data *data;
 	struct plat_stmmacenet_data *plat_dat;
 	struct stmmac_resources stmmac_res;
 	struct device *dev = &pdev->dev;
@@ -817,13 +838,15 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
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
@@ -851,16 +874,16 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	plat_dat->ptp_clk_freq_config = ethqos_ptp_clk_freq_config;
 	plat_dat->has_gmac4 = 1;
 	if (ethqos->has_emac_ge_3)
-		plat_dat->dwmac4_addrs = &data->dwmac4_addrs;
+		plat_dat->dwmac4_addrs = &drv_data->dwmac4_addrs;
 	plat_dat->pmt = 1;
 	if (device_property_present(dev, "snps,tso"))
 		plat_dat->flags |= STMMAC_FLAG_TSO_EN;
 	if (device_is_compatible(dev, "qcom,qcs404-ethqos"))
 		plat_dat->flags |= STMMAC_FLAG_RX_CLK_RUNS_IN_LPI;
-	if (data->has_integrated_pcs)
+	if (drv_data->has_integrated_pcs)
 		plat_dat->flags |= STMMAC_FLAG_HAS_INTEGRATED_PCS;
-	if (data->dma_addr_width)
-		plat_dat->host_dma_width = data->dma_addr_width;
+	if (drv_data->dma_addr_width)
+		plat_dat->host_dma_width = drv_data->dma_addr_width;
 
 	if (ethqos->serdes_phy) {
 		plat_dat->serdes_powerup = qcom_ethqos_serdes_powerup;
@@ -875,10 +898,10 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
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


