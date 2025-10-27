Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4591CCF9EE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 15:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gbnM+7JUoQu99psJVRjfGTzLa9V8XPsbrju+vMCFuVM=; b=nlPIG0G62SBCtJ3Uu8WiQNvoKa
	IavMKhpp+vaTIihn4SGU2icC0uSDYHBxQkTmqavmft6Pb6e6nCOT0Jq91gejTyHqtg2BLZ3B5Zh0y
	WSoZkWm8IAP3rOG17638p33Kbm1YcAj/25Sv3sG1vsi4Shc/7l+H/R29uKGKKuKxkg/0PneXAt/dL
	RiajxRjFhLxln1ThDfwQSBEQ4IRbwWPmcrgJCVH3bBql5QNvSzUifOGN7kxjt40pZlTVxmiuCQpT7
	OENOgKjYN+xC/4MQzNMA6LYebsxEqH3zF76I5rDLgwEqHhh8pIfUGSaYS5NUFUMHrPVJlLC3RG4jo
	miJ1f3bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDPPQ-0000000EFDa-0tk6;
	Mon, 27 Oct 2025 15:45:24 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDPPE-0000000EF7S-25uH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 15:45:13 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4711810948aso35215765e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 08:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761579911; x=1762184711; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gbnM+7JUoQu99psJVRjfGTzLa9V8XPsbrju+vMCFuVM=;
        b=RoBS3Si4F4c/HQk5d9gt0ALKNzijfFC+a/SVmCzbaP0pSoNXigwfLjFjQRWsGzx31v
         wrX9p4hKFcYOFbEHIjS3MObYGR/ZxFCJNxF/pz8EXm72WTyV1HBR/ncOyhzImfym4JKv
         /IYnOO0LNxuOrfx/OAR3pxHmnmiuPSiURzWKH9qqZsvMK/RuuNmk53JGO2IQUa99sBS9
         asaLxzF5pkjndOOq9O45S0u6ybbXnFO2zscsoY5RcEdiXJWx2dWihyoGIRjZ50LHuYs9
         sLjwJoN4xinQlOYwXdiHbf/oaRUjH5E48BRTH91UQuAE+IFeDoGCQi149DWI9VBx0eqD
         lHIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761579911; x=1762184711;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gbnM+7JUoQu99psJVRjfGTzLa9V8XPsbrju+vMCFuVM=;
        b=mToKFY+ix78iOXxhZqzUJS74ldk8tIyOvw51rXEmA38FczPbgL4gApc5O5DdJBiXZW
         NXcQb80OrHi2yJA7PFUS1/brTmXnFYjdnN2C1R2IUN9mXqquDO7ZclnSVcWhP7fAMPrs
         IHhsZRfz/82Aqj7fOKdDB05DeDQXoSikojT1UV4ciajQ0dMSQ1/RudOlh8IIjOlolKM5
         uJk7JMgN/rVwqll2f5a/oO5wnCcG8+G98Ueq81XVBmNhEeVLkfVjVQPBOJ8tPQJ5E8CG
         F3MjPzM6JTLJVgR7wNxqsWD9SIz88UkxpQYhAcy6lYG0zxXeZ+E3QtgbY5rxTujU+4bI
         UvhA==
X-Forwarded-Encrypted: i=1; AJvYcCV9vpfPH4Rg+IAIZMAbw34eE8k23O9HhUbACd5l0YAuEdtqTKT+/k6Ss9yPqzicYpjqLIUXjG77g0t94oPZOUAD@lists.infradead.org
X-Gm-Message-State: AOJu0YyQJSeSXdvjQpTWN9T7tf7QDycAq0Jq/4pK1Rk1EveUVYAm/2DX
	9GSwJxrJ+uXQe2fUZXJf/lq00mA2SkHM4Eldv70olGgtRZ/3yrSiMKY3q5XVYypZsS8=
X-Gm-Gg: ASbGnctAIvJb0JlaRh7YH86LRXqQZKW3rDaKE/5ZUssJfbiwt7B2m5PILBy6+pALTgr
	W35GkV+VFp4w5jk1JDJBuXNeKYnHcyJnBJV40wEKXtPaSMFxqstrjG0TMM2uI1/ZMN1OpS8gQr5
	Wb16UfStnsf9BJV0Kr35VrJ2W8b5jSZi1HN+1Jl3XFPI9wxn+9FQrSas0EmNE8SpQCvH6SI1Q5Q
	SGJ6ZZgWpAaIEo/PdY+OGk8pqUgCqNabD7JSj+xboKuLKyK8/2fCyFbBg9/kEm4Nap0i49o0bj8
	e+7JSFFDVZ6dxOV5SWveRua/Ra/2jXQwl0Nwk899rqDQQO9eoF32Rbis8G10zpLpwm5BG+vmBgZ
	ywbyupyXN1AtshDEKyEmF0ete2sJU/a9Ga7fyK8lUsQZOrcXQSSpcfKikQw4k5fs6EdYwVS4VXr
	IEtGIqkQ==
X-Google-Smtp-Source: AGHT+IGvMG3wu3r+IbbZg/5/7mILxDWAzW1LalNld5Mwz0HOjM2EkN8wK4I3r8TzG4x6hIzWvNeibA==
X-Received: by 2002:a05:600c:3154:b0:46e:39e1:fc3c with SMTP id 5b1f17b1804b1-47717def755mr1118575e9.5.1761579910577;
        Mon, 27 Oct 2025 08:45:10 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:c1c6:7dde:fe94:6881])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475dd477d0esm138708045e9.0.2025.10.27.08.45.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 08:45:09 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 27 Oct 2025 16:44:53 +0100
Subject: [PATCH v3 5/8] net: stmmac: qcom-ethqos: split power management
 fields into a separate structure
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251027-qcom-sa8255p-emac-v3-5-75767b9230ab@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3440;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=EQbFLUJhBusR5R/WLS2zY6u2a3Qrdavc6CuZtxM8a7Y=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBo/5N732qdepXwjTMMy3gsuitEVbWcrcVZjQoR7
 Zsfgri/RgSJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaP+TewAKCRARpy6gFHHX
 ckPzD/4iZm89XdVS11zAr9khaNEvnEltpu59g4ozId5XbAMVxDZglviYveiLmqycpJ4ruDOay49
 QW1IHD1qaIiGbhzj398upRiUvk9h/6XjjVtjFG8h/iRWzkg/sduilnVGPPUsHDqZq5Fehm2XRNJ
 +HgergEpmyi871x5T4LIKxW13HzuAECg2FMLBAoNR8hRvM34p/DC5+pdOQeQJj+kJxWrzbeF5Sl
 Qt38NSuIlBYV0vWL9ALsuipnZIMVDXp3eGMjhoAeoFjJJckDGV45yqFswWYUQ9B7C2D4wpCfhGY
 ZIpFGiDQiXFw5LPO+6HxTzXEdPf83Yz9SUwNkld9kCx4+rBCbiTdkTapduBAlehxo0VtIC/DYKl
 WLlXvRpr8IFaKzRidwPY8RLhWPhdZUZtLWno2DWzcbtRDbN8KWVAInmJPv6Hx9EsBjKwUXD0Ts3
 3moUpB+I6nWUjWebMCedX0U/T7KpoehAJyeHSjDOAOSs9vs94pLqQvObv1iUJUpLgks+Vg9y4lB
 GrTebcmkkjB0L7yJEpEsHAJrPI0EKTTWnzowh8DbHTP5+THcTfcEeAEpzM/7OTM8UV+AOeCUfcs
 shy3tH23ZNwVhY/ycIRVx2l7pLj0uuZLC3EbnnRGUcC+eDoXhViB0YFdmI0b/x1IJ/j7JJivvAm
 wxZsoJrM/fwHA3g==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_084512_602880_78A47534 
X-CRM114-Status: GOOD (  15.73  )
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

Now that we have a separate wrapper for device match data, let's extend
this structure with a pointer to the structure containing fields related
to power-management only. This is done because a device may have the
same device settings but different power management mode (e.g.: firmware
vs manual).

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c   | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 2739bc00e7525a5913bd3a5d28d9c9a8871fb7cf..7ed07142f67c931cb2c2c0e8806f5a7fbd68945d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -95,14 +95,18 @@ struct ethqos_emac_driver_data {
 	unsigned int num_por;
 	bool rgmii_config_loopback_en;
 	bool has_emac_ge_3;
-	const char *link_clk_name;
 	u32 dma_addr_width;
 	struct dwmac4_addrs dwmac4_addrs;
 	bool needs_sgmii_loopback;
 };
 
+struct ethqos_emac_pm_data {
+	const char *link_clk_name;
+};
+
 struct ethqos_emac_match_data {
 	const struct ethqos_emac_driver_data *drv_data;
+	const struct ethqos_emac_pm_data *pm_data;
 };
 
 struct qcom_ethqos {
@@ -296,7 +300,6 @@ static const struct ethqos_emac_driver_data emac_v4_0_0_data = {
 	.num_por = ARRAY_SIZE(emac_v4_0_0_por),
 	.rgmii_config_loopback_en = false,
 	.has_emac_ge_3 = true,
-	.link_clk_name = "phyaux",
 	.needs_sgmii_loopback = true,
 	.dma_addr_width = 36,
 	.dwmac4_addrs = {
@@ -317,8 +320,13 @@ static const struct ethqos_emac_driver_data emac_v4_0_0_data = {
 	},
 };
 
+static const struct ethqos_emac_pm_data emac_sa8775p_pm_data = {
+	.link_clk_name = "phyaux",
+};
+
 static const struct ethqos_emac_match_data emac_sa8775p_data = {
 	.drv_data = &emac_v4_0_0_data,
+	.pm_data = &emac_sa8775p_pm_data,
 };
 
 static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
@@ -785,11 +793,13 @@ static void ethqos_ptp_clk_freq_config(struct stmmac_priv *priv)
 static int qcom_ethqos_probe(struct platform_device *pdev)
 {
 	const struct ethqos_emac_driver_data *drv_data;
+	const struct ethqos_emac_pm_data *pm_data;
 	const struct ethqos_emac_match_data *data;
 	struct plat_stmmacenet_data *plat_dat;
 	struct stmmac_resources stmmac_res;
 	struct device *dev = &pdev->dev;
 	struct qcom_ethqos *ethqos;
+	const char *clk_name;
 	int ret, i;
 
 	ret = stmmac_get_platform_resources(pdev, &stmmac_res);
@@ -837,6 +847,9 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 
 	data = device_get_match_data(dev);
 	drv_data = data->drv_data;
+	pm_data = data->pm_data;
+	clk_name = pm_data && pm_data->link_clk_name ?
+				pm_data->link_clk_name : "rgmii";
 
 	ethqos->por = drv_data->por;
 	ethqos->num_por = drv_data->num_por;
@@ -844,7 +857,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	ethqos->has_emac_ge_3 = drv_data->has_emac_ge_3;
 	ethqos->needs_sgmii_loopback = drv_data->needs_sgmii_loopback;
 
-	ethqos->link_clk = devm_clk_get(dev, drv_data->link_clk_name ?: "rgmii");
+	ethqos->link_clk = devm_clk_get(dev, clk_name);
 	if (IS_ERR(ethqos->link_clk))
 		return dev_err_probe(dev, PTR_ERR(ethqos->link_clk),
 				     "Failed to get link_clk\n");

-- 
2.48.1


