Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56BC8CCD185
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Oct 2025 08:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K5ZbnZbGKkG8LBPBH3Ir29b+fdJ02lrKRlpbmxW9/T8=; b=1xtB/UFGy1o6xqACaZYeFmVe1H
	zoVS5moEM8mXxhgLrhfjoLLOjmJXzDmqKuRmMgh2gPesvNPGf/sCkRGR3FovrQwfeWdtGtlfSkK1D
	1UfQs6HZR+dVMQncVIAgmBmM1GpA1E+W6J+UtFExf0pJn+VJpivB6B3CZ7/eFEzTKQRzMeAeNi9I4
	JDwFDqBpxsCkpt1F/6IcV6374fM29WxF0JPQ5Y+9pYgLGC+srwpiaZ7IH++YKifrSuZxAAikxDMjQ
	N1tPFDOfSN56iOuVayNqwk9wb5ntYc1CfUbmoKf9LqbLxJbwJRFq6hphpsOcG8hE/kKEkS400iXWR
	gKAXzxqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6PNG-00000003R0B-3rHK;
	Wed, 08 Oct 2025 08:18:14 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6PNE-00000003Qwt-3tqT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Oct 2025 08:18:14 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3f1aff41e7eso5494218f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Oct 2025 01:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1759911491; x=1760516291; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K5ZbnZbGKkG8LBPBH3Ir29b+fdJ02lrKRlpbmxW9/T8=;
        b=LXMAJO8mPQMzIuS5KL09eZlUq64QyDS5j8mZx0rKgneTigROcZGzYK51aNqOfmfFaI
         iVu6IOnOxrcfXxluVWUfiHvVugXQf6ZjPtDbwUBehB3Yqt6f9yVHpr+zFPjI1n+ZKI0d
         fsO8jN1f7Z95inw4wPfWLsQzHqByp5iGVlaVlufQeOjbsYdzxe87O7YbBXReK7DQuDE0
         KK172T3KSaiiMQn9uaX5ViBWuviDIyZz1x8xWkaFiwPac9fPipGER22pGaTDZc6c20r5
         DTp1vuBp3WQO6WrVs5E5FPbWH2/R+hqEEGhk3UU2DPJrR7N6XVC/nPjLAKRkDQZP2JF6
         OeCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759911491; x=1760516291;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K5ZbnZbGKkG8LBPBH3Ir29b+fdJ02lrKRlpbmxW9/T8=;
        b=hF3pHdd9DiOjuEg6tuaqikIHZ3lIt7Bc1VHqkGWwtccbnGnBu350qTxf4u3xcBGcRW
         zvK8xT6aIIx/2dtpkg48Bg0ZIXoQfWGDR/qlHGmWMiOpmIpPL1I6EJteyH1UFgJl/5sg
         Gtgu2QhxrX4ASiz59roqaASayGqnuVXERfSi/Cj73WsMz4yU8ZveDqtgAo92fHLjuGnL
         ows8oF45ksAuTX4eheT8tC5mQVfjN8FrGnBTn5JCuPoI6eyZZe7BsoztdFctXUODemfm
         ZilNVB3cVvrzGqKIHxjF2KXBimDlqNmZ/6+0Z8KBcTI99V0OIRn6t5OpYLLDCx36yxos
         Vd7Q==
X-Forwarded-Encrypted: i=1; AJvYcCUViZl3X9BKeAAjUBlmfrGefa08sWYl0Pk6hKdcmwWPSC0JnKLOXFqnrrc998vktrNabLqol+n8zThm07ru/4sE@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/BuKqVyvNMEHAzyWzVIX2lUhSsKJFMaprs06kCRShbFJNDIDT
	hK5KgzB5ehN9k4smLFoyJNur/Ir74kox4Q43q2fiLr0PAbFhABTpQ98vuwIzlTn2K+8=
X-Gm-Gg: ASbGncs2y42vkx492NlhL1jtKBcxiH+gHnJ9SSW1PgwvRSinJuVEtJ/a7/YGMOMmCXE
	xT7MUvNuwrZ7DykxS3IPXtA2lHoneCq7eHmURGVt8+SGTnwixbr6n+h9oTPobr6LGx9hfZ+YNLV
	AWH2lOfp7FhESEy4FSmLYKhyiiEDzm3RxSN2rxglNYN8mGX3ToIw+8S8u8ucewU62vVQ3LZDpl2
	vFE82mfaiCwwy5rzWyog2vsMdtK28IcpEyOCmBKi0Rz+Hl3hr2+5rdU6dI7cGSCL/LNXqJnzMw6
	8/mpzAhSALRg7d9woJ12h3VH53rEqAZ0/6nzJ3IYgAsHkHN2cyAeRiezwP/F7krzVhk/TW4dtbv
	SN1yVbqPgnFLQ0Y/viRhvOh9k2UesF02LJsjIMGa8LQ==
X-Google-Smtp-Source: AGHT+IHkwtqy2vb9uxT6M7LtlQU6zwCjb9IR5rIG74fXz3TalugvLB02SuzmrQY3nea1fwBLGELWhQ==
X-Received: by 2002:a05:6000:1845:b0:425:8bc2:9c43 with SMTP id ffacd0b85a97d-42666ac4502mr1491294f8f.1.1759911490600;
        Wed, 08 Oct 2025 01:18:10 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:286d:ff1d:8b7c:4328])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4255d8e97f0sm28498943f8f.27.2025.10.08.01.18.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 01:18:09 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 08 Oct 2025 10:17:52 +0200
Subject: [PATCH v2 5/8] net: stmmac: qcom-ethqos: split power management
 fields into a separate structure
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251008-qcom-sa8255p-emac-v2-5-92bc29309fce@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3478;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=QXDtZJBSeiuTqR9NRW8KT3qs59BPygxIGrInXJc2Y/o=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBo5h42Xak+xMy0XGVbg60nsHByk/5QWfRt+MQk2
 tRZVAmURSeJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaOYeNgAKCRARpy6gFHHX
 ci7yD/9T88d234rhjtNAnU5hIUiy2KPa1vwStmh6rzlpiBEAYQWJ7n0qtpVAahYHWOUDFfpCxbX
 qwsLaWX2pQdosbU2lkFdffA5lYMtlXOH6J6GUvcdj0SWTSPeHuhvGaoQjr7rMYT7wVScdfK/f0T
 Q1CKPK/+i7nlZ2XpFhFSHcPcHMwzGmSe7yNtxWyMhmTZEv8xPu9N45yE6Rkw1f4qtdQujoBZ/wk
 ViGxpFT6K2MmqD7NkTEgzs6EwNBhKII+UCC0hlGskAB5N8PiTaE4r7rPLvA/B79t2fjd2o6Gdqm
 kD1Qhk73OktYQEiw64TAkceahph3P7g2PKW5p8whO3jVBKsjKRnG8RPhrtkPoV/muXooK+UnYXv
 mmYJvnC8pUx3BXZGy0PMtyN8HuSK05GDhscy0T/HJaRGcw9bpg777ge6XlAfW1BxNTP8nVndOD2
 C63+OilZ0jPj8BKIQyY88Mudny2/zvh9bu44+UKEa54IJUn5ZuGUZDWUHhFH3Qcgs7Ha3ampG1u
 g/o2E0tK5wZcBSN0d0YwtACEOcKuLIBBakebxgraxUV5tByTHxwOPcMoVU2nHMyVfZM5riUXQgJ
 klzu9ahNp03ITcGbo5/lCY3N3M4bAkCKevXvcNQXc+oXsr/KMNhSmNINpCoZrlbCTLyp/r4mwsi
 fNcmzHN7Zq/n+Zg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_011813_006154_8091639A 
X-CRM114-Status: GOOD (  15.86  )
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
index dcee5c161c01124ea6bf36ceaeca4cc8ca29c5d5..d4ddf1c5c1bca2ae1fc5ec38a4ac244e1677482e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -95,15 +95,19 @@ struct ethqos_emac_driver_data {
 	unsigned int num_por;
 	bool rgmii_config_loopback_en;
 	bool has_emac_ge_3;
-	const char *link_clk_name;
 	bool has_integrated_pcs;
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
@@ -297,7 +301,6 @@ static const struct ethqos_emac_driver_data emac_v4_0_0_data = {
 	.num_por = ARRAY_SIZE(emac_v4_0_0_por),
 	.rgmii_config_loopback_en = false,
 	.has_emac_ge_3 = true,
-	.link_clk_name = "phyaux",
 	.has_integrated_pcs = true,
 	.needs_sgmii_loopback = true,
 	.dma_addr_width = 36,
@@ -319,8 +322,13 @@ static const struct ethqos_emac_driver_data emac_v4_0_0_data = {
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
@@ -787,11 +795,13 @@ static void ethqos_ptp_clk_freq_config(struct stmmac_priv *priv)
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
@@ -839,6 +849,9 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 
 	data = device_get_match_data(dev);
 	drv_data = data->drv_data;
+	pm_data = data->pm_data;
+	clk_name = pm_data && pm_data->link_clk_name ?
+				pm_data->link_clk_name : "rgmii";
 
 	ethqos->por = drv_data->por;
 	ethqos->num_por = drv_data->num_por;
@@ -846,7 +859,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	ethqos->has_emac_ge_3 = drv_data->has_emac_ge_3;
 	ethqos->needs_sgmii_loopback = drv_data->needs_sgmii_loopback;
 
-	ethqos->link_clk = devm_clk_get(dev, drv_data->link_clk_name ?: "rgmii");
+	ethqos->link_clk = devm_clk_get(dev, clk_name);
 	if (IS_ERR(ethqos->link_clk))
 		return dev_err_probe(dev, PTR_ERR(ethqos->link_clk),
 				     "Failed to get link_clk\n");

-- 
2.48.1


