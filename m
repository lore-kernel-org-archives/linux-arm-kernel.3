Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41E13CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 08:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z1sCvmiZl6CYI7nEwas+vkP3919eSylK4ly9/aS+CfQ=; b=HPa4dOhRbPP8Q8MR3AWQQULpCS
	ZhZ41zgMctMg0vHSD8BzsmXz+u8v7gmYsrDJUwwiHDg4YdE5bowiWmf3McIm6zvuOPhXoavGoAonj
	PUyp2lpbYbLGqMwJsIPCX+TvP9wv9cP3guvqhA/UXE1OVssBu0VBPxVOcT/4OlIN2XXvgoimNWxIQ
	Qyn5KYZoyt2J3dnhgxHJGOS9tWHTM5mMVDwFHO9ah4FinWlJoi92hqfFMuj29NJ1F4RmSkF1NEe9Q
	8GbHZKdVOf3XCoHGwSB+gRnd5wxAQ8wE2PXXBrAKgLbLneQiDSkgfrrS/4bcXuBkOztJs5ufR9DwA
	H3/R9c/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwFrz-0000000Cn9b-0pn9;
	Wed, 10 Sep 2025 08:07:59 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwFrs-0000000Cn3T-3x1b
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 08:07:54 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-45dcfecdc0fso56214725e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Sep 2025 01:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757491671; x=1758096471; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z1sCvmiZl6CYI7nEwas+vkP3919eSylK4ly9/aS+CfQ=;
        b=KEAjc7A1zOzQSane2eIFNw0jGsp+7Lyo4p5j6k/xugMTWHYiOdzUliPbnHAWy6xZRM
         ZBTgXkNUhWFLE+TT5dqpm1qVVq+gc23IjW6PJG/rz7hyTM7C4D3IfwVlERjx2W34pWHK
         MLaM8Z28NpbqTzh5uy5Oyvz5AA2fn1J1NvByH6xJBNotNmXyF0+cjarBd/T5O+hGFRVq
         SBbVueVjbAcBGUQmK0STnor5p+Cy/RgTZJDm39+xgtoHDPGGRPPVyKJCpgb7E7kBwB79
         8ds3a6HzE3LixjldkcUyyae3UQYPtoH8wDeOZVYupK3zcqc1oXpTjqDgMH5gPESxZLve
         6cjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757491671; x=1758096471;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z1sCvmiZl6CYI7nEwas+vkP3919eSylK4ly9/aS+CfQ=;
        b=OVtH9JOQPIPlfI4Ny+OqvXO/3MUw/mY4wMP6n9Ohim4U8H7swsNADXuLGG/ziEOdEd
         6hi0207NTtXcKrSw6PtrNysv1UtU7ZZoB89v4kc4sfKKt1EcpubiIpgrNx6MmcqRDBlC
         B/8r3TVtL7iH2UyOeBEVpTq09bOTh8VkceZlnRIiWOHwiTBiWMqMO/8bPiU2fYpRl7vg
         YoghqIBmsGFNQKOCJiE1wNV4GnaSZhzKMjF4LCONEPKpGl23KdG5JTmnzc9A50hqPn/1
         cD1WW6L3TqPAjoWUP/MxHkJCpXHMjQr3XLoDBjcpMvbQVca+9x1f4BK1yDcRJ+IyjYF8
         vPtw==
X-Forwarded-Encrypted: i=1; AJvYcCWlCsoc8ACHOmcvQ09FUTYJzvZIC+K7ZXwhnER8vBzMIKnK6ffrpRjfgQJsItWnUn0rvn2CnV2LLmiKPurmWgQw@lists.infradead.org
X-Gm-Message-State: AOJu0YxuRqAcyuLgw4M7gln1R+kbQy//JrhUP4WibSNcwujSEqCbYXKk
	bWbTqwdWBDuw5iqAOIr7e05x2ZBZm3fWLo7DVq4ncARQc3kKCuAWtFmtsI90nyXLozw=
X-Gm-Gg: ASbGncsVZtFBs8CFbagZoEBJ/puo1njx5K2A2zrefogexWICNl9rKJZqkyX7iWUsFuB
	y3g6SOysArqH05DBFx5Wp0gZ7bGWN+XuiAqnZZaBJDswkdsZnXEKcOENBNf+jfQ/3bZag4TSja5
	omH4JDlwLGDXhtXUaa6o5H8qOSDqUHGxx0KSLvEjT+oV9jSMpFDN9CHjiTmlskZStrFhByzmhOH
	NIz1Hwf/7Dfk9n0GEcEULmrhITavqFU1LYP+vOpgrP0nY6m80U++8cPsCnjecIDjft/WrDhfEpp
	VWn8skffjeJf+g/2uzp60PUaqxSaCQ2JKm8BMDXpEDi+mjp3P3P5ckCJid38wBfbvB4AqdnpQdD
	2t9KjS3wPq1ygTa6YBA==
X-Google-Smtp-Source: AGHT+IGcJm1mXQDl/cArlppVSaTq7H4cXV1oKCtm0I7gPOnxwJ8/RibyfCM5aVWWqsaeO31u/dWC2Q==
X-Received: by 2002:a05:600c:1ca0:b0:45b:8352:4475 with SMTP id 5b1f17b1804b1-45dddf02148mr141677935e9.36.1757491671063;
        Wed, 10 Sep 2025 01:07:51 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:3936:709a:82c4:3e38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45df8247cc6sm17813605e9.12.2025.09.10.01.07.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 01:07:49 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 10 Sep 2025 10:07:40 +0200
Subject: [PATCH 3/9] net: stmmac: qcom-ethqos: use generic device
 properties
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250910-qcom-sa8255p-emac-v1-3-32a79cf1e668@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2902;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=wKpcSDQ9j5gn7fqOrffdxHVw4IYX35svrsS9hhVY/uU=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBowTHNyzW1urCJGaZW5gke5O8FSvQ7UnCqZZ8Cj
 PtMPh+GTVyJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaMExzQAKCRARpy6gFHHX
 cijUEADYjksEkSI3XXPioMcFqFig+ma4t/+cw3XI6Nn8GUS2nhn1HpaO+L3aLWDlpp5xJROdTMv
 qhOiiiZmMvYyeWo9afPRxaDGdjv3fWICRI45x8VoZ/AzPLw4dI5he37GOpfjJ0A2Zin7NKz4RGm
 ywo/NHT79dS+3SvYysaFfL2z/UmW53HGqDG+/UKgL8MivzfgATeROpRpgrHuX30yTqzka9IqDz6
 oP6WqPREVulYKjwg9Y9vD4IraHpFP998xKBmvNbTmIzDGwsV5nSrr0pKdUTJGGt43S9WfI0M14A
 4XvEpZHXEfTv/4QAhz4I/Dr4fuIm5E7yr23MUHOvoChMnkg2QQQIIe/X57J97l4TGYcqcxWODGP
 lEu+ENy9jJONFai4j31aIgckTvTvZ1JbtYKvnkJ/f9cZBYTitZhswBMrFR6xHWqo7bWsWkViCco
 WF+2GsWPRIa2etHizQNLIOw8014zf8qu+czN7Ukj6F3lpuDL3J7yO160HpBpbpNbYFAkXNTm1ur
 bmxcK9UenqvbBpw/k86NlsSSKBSkYYT0MT3X6O3DbHGyu1ZZeBXMLKOThxl2zLamrAbQUH0Ur60
 kbRzFya8F/XeR7LLjBf2Md2r6FJlrQ3W3oBUDyKhgza92D0gllCwL84XdPcfFKVGyuRoK9hTnzA
 M/OfCOjqiEY8BkQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_010753_014346_B2CE3183 
X-CRM114-Status: GOOD (  15.62  )
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

In order to drop the dependency on CONFIG_OF, convert all device property
getters from OF-specific to generic device properties and stop pulling
in any linux/of.h symbols.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/net/ethernet/stmicro/stmmac/Kconfig             | 2 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 9 ++++-----
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/Kconfig b/drivers/net/ethernet/stmicro/stmmac/Kconfig
index 67fa879b1e521ef6d7bd2a8db30d812301eb4cf7..beeca52d4d0f0795d27a2cc35be44d1d4e7d45d2 100644
--- a/drivers/net/ethernet/stmicro/stmmac/Kconfig
+++ b/drivers/net/ethernet/stmicro/stmmac/Kconfig
@@ -125,7 +125,7 @@ config DWMAC_MESON
 config DWMAC_QCOM_ETHQOS
 	tristate "Qualcomm ETHQOS support"
 	default ARCH_QCOM
-	depends on OF && (ARCH_QCOM || COMPILE_TEST)
+	depends on ARCH_QCOM || COMPILE_TEST
 	help
 	  Support for the Qualcomm ETHQOS core.
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index d8fd4d8f6ced76cbe198f3d3443084daee151b04..aa4715bc0b3e7ebb8534f6456c29991d2ab3f917 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -1,8 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0
 // Copyright (c) 2018-19, Linaro Limited
 
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/of.h>
 #include <linux/of_net.h>
 #include <linux/platform_device.h>
 #include <linux/phy.h>
@@ -764,7 +764,6 @@ static void ethqos_ptp_clk_freq_config(struct stmmac_priv *priv)
 
 static int qcom_ethqos_probe(struct platform_device *pdev)
 {
-	struct device_node *np = pdev->dev.of_node;
 	const struct ethqos_emac_driver_data *data;
 	struct plat_stmmacenet_data *plat_dat;
 	struct stmmac_resources stmmac_res;
@@ -815,7 +814,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 
 	ethqos->mac_base = stmmac_res.addr;
 
-	data = of_device_get_match_data(dev);
+	data = device_get_match_data(dev);
 	ethqos->por = data->por;
 	ethqos->num_por = data->num_por;
 	ethqos->rgmii_config_loopback_en = data->rgmii_config_loopback_en;
@@ -852,9 +851,9 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	if (ethqos->has_emac_ge_3)
 		plat_dat->dwmac4_addrs = &data->dwmac4_addrs;
 	plat_dat->pmt = 1;
-	if (of_property_read_bool(np, "snps,tso"))
+	if (device_property_present(dev, "snps,tso"))
 		plat_dat->flags |= STMMAC_FLAG_TSO_EN;
-	if (of_device_is_compatible(np, "qcom,qcs404-ethqos"))
+	if (device_is_compatible(dev, "qcom,qcs404-ethqos"))
 		plat_dat->flags |= STMMAC_FLAG_RX_CLK_RUNS_IN_LPI;
 	if (data->has_integrated_pcs)
 		plat_dat->flags |= STMMAC_FLAG_HAS_INTEGRATED_PCS;

-- 
2.48.1


