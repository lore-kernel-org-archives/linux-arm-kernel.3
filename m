Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B08CCA101F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 08:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/vSLcjrovVRdefyPQB8K8T5zFHjp8pcBoDKJgvNVhJg=; b=HfDRRLFi+PDQTU8Jsb6v6Qw6af
	tyWwvEVEeWDxQJWA+/Kb+EEdL3fHuR1UqyDJZjxkRNhEA8FPYl2yNCP4PEaen4YYlsCSOz5ugeAtd
	icgBct1eSvRQrWZpAc5YjgFZEJ1i+gn3H0FsEUeRNAh+50wUXHidOQbvrDn3YaItYlLMnyRtIsaLl
	USvgBwqWyflhZvvIS+FxHgQ7yhNmC9D0tFPEXePz+phLrnH4a0+H1wqHBQayNEdXzFp3zIa6EKws7
	/dtTyh5mmWe1cw7z/0qjBV5OLC/pXKuMR5dLUMuHOkW3mE2C3AGF+aelsOZKX3EuDvRYoHaH54xAx
	8iSDfBSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwFs8-0000000CnIB-45wy;
	Wed, 10 Sep 2025 08:08:08 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwFs3-0000000CnCD-1kF5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 08:08:04 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-45b4d89217aso42423125e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Sep 2025 01:08:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757491682; x=1758096482; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/vSLcjrovVRdefyPQB8K8T5zFHjp8pcBoDKJgvNVhJg=;
        b=Y73cOUf0+Xv1/IpnH+ZAk+Le5ZMa+9gRM3sSAsImdDlbkUEcT047lDYMqc+TRY1irx
         f6q3Xp6jqRXJ4ZgSd2je1XQSyca2ONEvSOxmQGr6PqLOQbE6UuXc+8Pwb11gqz6MhmhR
         /sYNfmWvppm21bkXnMDzS2WDbnOlFder3qBIFF2SXca4eNGgizzu1YCJf70m5ijCZo4o
         1Qap8GPnE0dE7w5sa9hxUyB4x9pMT7nD5NGqeTDw4mVLSpW3aCxv8GdtJ3jhRHOTBIXm
         nq6ZmnDJPA0bLCMbBE6dLXaSZj6eh7gzvHQ4WYYijAfg1R9nNomQDN50WMp5tN+afZ3V
         PW1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757491682; x=1758096482;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/vSLcjrovVRdefyPQB8K8T5zFHjp8pcBoDKJgvNVhJg=;
        b=j+vCI+SHclwwNk6GRiCoD2OSBjBtQyDKeGUdT33eX/jYhh5oDMhzAfUDPSPeZwK7/1
         tRq88r3xH6KIfnE0y/w0HEI/a2lOY4XE6XMkeXEFbLzNzg44CBaBlpyFeF5UgrUstKeB
         KDFNVrPrtQWYuhBOH/Ej71oVV1FNcZigFzc1MDijI9rbTjkni3PCqXPRIOUyK704FM2n
         bTGY5mBpvwk+QetEyIJjpl+VVDSz0vQPDR5GSdggdkOs8r1xgw22BMzYp3AzuGYWuymI
         9S2crKUuzm9eyLUfDyMeC7120dhOIp6uWb93QfDIfyOGgcfQiSqFWwPJYVRkZFYJPLIy
         okoA==
X-Forwarded-Encrypted: i=1; AJvYcCXACp8HaRF1at14E1gjymrZwLyTm7efHsM85wQjX2THrdwZFFh8PmqM4TGgwIhkzLvW7VtcIPCnIe0w3/D0xxLJ@lists.infradead.org
X-Gm-Message-State: AOJu0YwDIctJOsFwd64gXna4LIHVg0C1oMqgtaX32qc5raXxjzGScKAr
	RjTHd3ANihPpLD5dXX9Ypm77tklyGz6eSdqINLGaD7lJRKurZnzbIBrKgV9LuIUxZGI=
X-Gm-Gg: ASbGncvKosn63WIq8lgvjqR9TmzrcyJSNdJDydgJ2BSZmavVWaHImHm0NkmJfbAT+NL
	hNGv2wVjqnkOjKIWqT1oWIsUF+lisJ6ttcFAGKS3QV8XA9uQzh1wXe9M8I3mFCvGsq11eGe21Zl
	MA5vzNaeo1j9Tm6EQLUGCRWctxeV2nTaPuELHpzUoMxOyQ80GJkstbnRedjp3szPbKJlpX6xfD9
	yS+OEOpfR8hLss3DVviYOB0GQlFj7gxG/+UA0TRPzt2jJZAT5PsD33ut97+u4bCTYxN/EDg2w0x
	1j/hlKSvxGR/KZZihufyRgGKpBhAk66G4hLhiWfVELJufd0xIxO5xFa/Bo/s51ZNeUB7lnQW/XD
	rCG9VfU9jnOvuWrwDf5MYI66NXfj9
X-Google-Smtp-Source: AGHT+IGtTZTBxDp6rKWXdB/VBpkJj6AncbJgtDSJtbOLi94Ze8GYVYUd/pOcMlolezAIYylFkwVcfA==
X-Received: by 2002:a05:600c:468e:b0:45d:da4a:8dd0 with SMTP id 5b1f17b1804b1-45de6b386abmr80521435e9.27.1757491681543;
        Wed, 10 Sep 2025 01:08:01 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:3936:709a:82c4:3e38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45df8247cc6sm17813605e9.12.2025.09.10.01.07.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 01:07:59 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 10 Sep 2025 10:07:44 +0200
Subject: [PATCH 7/9] net: stmmac: qcom-ethqos: split power management
 context into a separate struct
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250910-qcom-sa8255p-emac-v1-7-32a79cf1e668@linaro.org>
References: <20250910-qcom-sa8255p-emac-v1-0-32a79cf1e668@linaro.org>
In-Reply-To: <20250910-qcom-sa8255p-emac-v1-0-32a79cf1e668@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4943;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=72Rcv9lcaIE/fmtmW9sA3UZwGSkP3ncYbbWtrZ8FIEk=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBowTHOuZe0uiqQW2Zgiw87pkQviYLugbHl4HVm6
 6cuWdNFuamJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaMExzgAKCRARpy6gFHHX
 cqWbD/9JjExtcSAoeJytoBguDSVFDiLWEedYT2wU6Ln/fpgS+pWlLnROCIZr5W2/sroazOl/Gly
 2zfKHYub9rpzVyhcc/FhCHxfsL45TQTo9lzyDYf7wMn7c9FFuqFczU5BhUrGETPCPmw4J9cjDE9
 wk9Xvw2ZBMINtzeCxXB00eUKFHsooYoWFE4G00dncC7b94/ReUz/Xh0P48j+JScRp1FvbAh+t3O
 M62lArrEcvAFTnLEHjYPPLHGMkwfWFf6Y9XirwTNCPnfzeOKZ33dtXcJE3MSDFcHDU86zIfhrHw
 i5bN9PRG2zW19Ac3lt+PQ/2PJdT1aut82NNcRkmY4seswW4ku65ND7HcwlDIX3V6eMupGvfirkc
 8JT9Owbqf0L7w5smgcEbwVTTyTVtnEcLAPt1nxehJTciHnwbLjrQJSYodZZaCSOjUr6YOKSb5zn
 AXPaWrBfjEqTRVxLDnvig+YAGYr634Zo64oAQbEXWPVc5XVg0TFA4zCHE0wTkNUdHL7sP6ggnWg
 ofhmSHgl7z+l4kBeCROm98rH0FOxivvc8+yDt7uQ+MOBmG2PG2HXtYYCtU2Zdp4GLFMwhmxLjgm
 6vHdDKKL7MD9TBzPng07OuRZFv1d5Sf9ujrLI6myzQhfonZTTKydGAO9KgO4f0uxjO7XenKJ409
 lYurxGnOOatO3dw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_010803_501480_6290CD89 
X-CRM114-Status: GOOD (  17.03  )
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

With match data split into general and power-management sections, let's
now do the same with runtime device data.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 46 ++++++++++++----------
 1 file changed, 25 insertions(+), 21 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index d4ddf1c5c1bca2ae1fc5ec38a4ac244e1677482e..1fec3aa62f0f01b29cdbc4a5887dbaa0c3c60fcd 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -110,17 +110,21 @@ struct ethqos_emac_match_data {
 	const struct ethqos_emac_pm_data *pm_data;
 };
 
+struct ethqos_emac_pm_ctx {
+	struct clk *link_clk;
+	unsigned int link_clk_rate;
+	struct phy *serdes_phy;
+};
+
 struct qcom_ethqos {
 	struct platform_device *pdev;
 	void __iomem *rgmii_base;
 	void __iomem *mac_base;
 	int (*configure_func)(struct qcom_ethqos *ethqos, int speed);
 
-	unsigned int link_clk_rate;
-	struct clk *link_clk;
-	struct phy *serdes_phy;
-	int serdes_speed;
+	struct ethqos_emac_pm_ctx pm;
 	phy_interface_t phy_mode;
+	int serdes_speed;
 
 	const struct ethqos_emac_por *por;
 	unsigned int num_por;
@@ -186,9 +190,9 @@ ethqos_update_link_clk(struct qcom_ethqos *ethqos, int speed)
 
 	rate = rgmii_clock(speed);
 	if (rate > 0)
-		ethqos->link_clk_rate = rate * 2;
+		ethqos->pm.link_clk_rate = rate * 2;
 
-	clk_set_rate(ethqos->link_clk, ethqos->link_clk_rate);
+	clk_set_rate(ethqos->pm.link_clk, ethqos->pm.link_clk_rate);
 }
 
 static void
@@ -645,7 +649,7 @@ static int ethqos_configure_rgmii(struct qcom_ethqos *ethqos, int speed)
 static void ethqos_set_serdes_speed(struct qcom_ethqos *ethqos, int speed)
 {
 	if (ethqos->serdes_speed != speed) {
-		phy_set_speed(ethqos->serdes_phy, speed);
+		phy_set_speed(ethqos->pm.serdes_phy, speed);
 		ethqos->serdes_speed = speed;
 	}
 }
@@ -724,23 +728,23 @@ static int qcom_ethqos_serdes_powerup(struct net_device *ndev, void *priv)
 	struct qcom_ethqos *ethqos = priv;
 	int ret;
 
-	ret = phy_init(ethqos->serdes_phy);
+	ret = phy_init(ethqos->pm.serdes_phy);
 	if (ret)
 		return ret;
 
-	ret = phy_power_on(ethqos->serdes_phy);
+	ret = phy_power_on(ethqos->pm.serdes_phy);
 	if (ret)
 		return ret;
 
-	return phy_set_speed(ethqos->serdes_phy, ethqos->serdes_speed);
+	return phy_set_speed(ethqos->pm.serdes_phy, ethqos->serdes_speed);
 }
 
 static void qcom_ethqos_serdes_powerdown(struct net_device *ndev, void *priv)
 {
 	struct qcom_ethqos *ethqos = priv;
 
-	phy_power_off(ethqos->serdes_phy);
-	phy_exit(ethqos->serdes_phy);
+	phy_power_off(ethqos->pm.serdes_phy);
+	phy_exit(ethqos->pm.serdes_phy);
 }
 
 static int ethqos_clks_config(void *priv, bool enabled)
@@ -749,7 +753,7 @@ static int ethqos_clks_config(void *priv, bool enabled)
 	int ret = 0;
 
 	if (enabled) {
-		ret = clk_prepare_enable(ethqos->link_clk);
+		ret = clk_prepare_enable(ethqos->pm.link_clk);
 		if (ret) {
 			dev_err(&ethqos->pdev->dev, "link_clk enable failed\n");
 			return ret;
@@ -762,7 +766,7 @@ static int ethqos_clks_config(void *priv, bool enabled)
 		 */
 		ethqos_set_func_clk_en(ethqos);
 	} else {
-		clk_disable_unprepare(ethqos->link_clk);
+		clk_disable_unprepare(ethqos->pm.link_clk);
 	}
 
 	return ret;
@@ -859,9 +863,9 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	ethqos->has_emac_ge_3 = drv_data->has_emac_ge_3;
 	ethqos->needs_sgmii_loopback = drv_data->needs_sgmii_loopback;
 
-	ethqos->link_clk = devm_clk_get(dev, clk_name);
-	if (IS_ERR(ethqos->link_clk))
-		return dev_err_probe(dev, PTR_ERR(ethqos->link_clk),
+	ethqos->pm.link_clk = devm_clk_get(dev, clk_name);
+	if (IS_ERR(ethqos->pm.link_clk))
+		return dev_err_probe(dev, PTR_ERR(ethqos->pm.link_clk),
 				     "Failed to get link_clk\n");
 
 	ret = ethqos_clks_config(ethqos, true);
@@ -872,9 +876,9 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ethqos->serdes_phy = devm_phy_optional_get(dev, "serdes");
-	if (IS_ERR(ethqos->serdes_phy))
-		return dev_err_probe(dev, PTR_ERR(ethqos->serdes_phy),
+	ethqos->pm.serdes_phy = devm_phy_optional_get(dev, "serdes");
+	if (IS_ERR(ethqos->pm.serdes_phy))
+		return dev_err_probe(dev, PTR_ERR(ethqos->pm.serdes_phy),
 				     "Failed to get serdes phy\n");
 
 	ethqos->serdes_speed = SPEED_1000;
@@ -898,7 +902,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	if (drv_data->dma_addr_width)
 		plat_dat->host_dma_width = drv_data->dma_addr_width;
 
-	if (ethqos->serdes_phy) {
+	if (ethqos->pm.serdes_phy) {
 		plat_dat->serdes_powerup = qcom_ethqos_serdes_powerup;
 		plat_dat->serdes_powerdown  = qcom_ethqos_serdes_powerdown;
 	}

-- 
2.48.1


