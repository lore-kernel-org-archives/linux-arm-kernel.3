Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20441CCD185
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Oct 2025 08:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/vSLcjrovVRdefyPQB8K8T5zFHjp8pcBoDKJgvNVhJg=; b=jds/UTwo7NragspW3oh8jtlfx1
	bFZ9GHTVNvFiB2F3DcH7VU6adfvyPHMQJpz2af5CcOZK9HCbrOCdRvwydYw40utWu61zBhrvr3BHL
	EGM05LtHW3gN5rXsg5hUCpLvVDICLoUf/Yjith++tnDHhCVfCr1aIGIu8zoN3MfntLzeKwtNSkYTR
	1sJdVM5jolTrA8IsBr/cDEyV4j0s0yHDm4fgT6UV01D9vgvnG0VI2pSF3BIBo3VDAeYpvIAyh5TKQ
	i5cRs6whmRPZvY4Y+MZxRJax3vrFXEE0Z7fvJvdSX6OoJTvr4kqySIazEIkRS7svYRLjInkP7uhtC
	kstmebXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6PNI-00000003R22-1QGi;
	Wed, 08 Oct 2025 08:18:16 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6PNF-00000003Qxo-3Gfh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Oct 2025 08:18:15 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-3fc36b99e92so477443f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Oct 2025 01:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1759911492; x=1760516292; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/vSLcjrovVRdefyPQB8K8T5zFHjp8pcBoDKJgvNVhJg=;
        b=GX8hNW1+ICLghacqOKLiCXHsauAPyYcAsNVyFO6TW/bcFeWwvPXqfgOQPz79V2C4ue
         v5HPxJxzjVrnKbtMuMEOWfdl+1v2pwjLkbJ5UAyK4dLViqavvhMoVt9W0grZs47MWFqh
         uqEVIMHaohrbglhGvsPHzhB9R9wPUph+2rtW4fpvnDQSheWo91JHTnHCuC2QQeH6zcaU
         sSuLyy5MYPbOXYZ63yBfi+GBV2EdpXnJg4jfgsC/wgW/arDtpzs+RyaoGQV+PE0nTLM2
         L6ClPDIn9lItJF3C+ow1HA9+kz+pYFOMt8QjFRADQwVFQ9x0ONqkS11IQzqTYNcqjC7U
         kmqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759911492; x=1760516292;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/vSLcjrovVRdefyPQB8K8T5zFHjp8pcBoDKJgvNVhJg=;
        b=tL8aICM3tsReGorATIWxjfxx7bUf3AgFEdTlIzo7+CoYQBnnAwXw9h7O1wXOe5lHe7
         WXIcR5OQ/rpMbAnl2IY0eiEdGFjYfXGmaTZW6giYoWpeLoyznbAxVkSk1vdx5H0zfH5x
         Nzc5QjVG0SVdPg7I8nm6GUiLyfIFWXnzYE49EmDC+fDGZr4TXFoLbvLY/0APNOk/SRyC
         AH7zCkFw+saYNRzJdu2EkUhzH+ADLhWj1fGtHikNtZ8+5mZ0MS3CiPdfxtHVeMQumsWa
         7BsqZ8OamC9l9SyMT2CHjtr87WcI7iSQYyKM+jKUH4GQjAqRCh5P5Ny0eihga/AdcAxw
         E6iw==
X-Forwarded-Encrypted: i=1; AJvYcCXVgsv4W3/hwIElYhhbNUQZGYZXs8JkDcpzbiDtkL9OT6U+0pNWOtnMgzBCuyB6BiaDScXnY23x1DOTLrb+ag6H@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7ccBrxZcrvroebVoRdjSyVyBnKZURWKHDEoUkOGkQpQ2Kd0bh
	a3E9SkpQA6RiJrzVB5KaX4VxOL3z1dk1uYkJNcEdo5Kz8XMOP78LpUVlzOosuY0X5BA=
X-Gm-Gg: ASbGnctVzfUM34UbkvTWlePkll4SX5Trx2nvtu3GH+iAj8Mz+/a/ePweoIrpn5hiuRr
	DGiWPZuW9r7ED4pzD3z9suwwjWquiS1MjiR4hXW6zISWa3IJQEjzeuzHnuoCVP24hyPjpKduTp6
	irPrvzZczQY0W9TtFVZOKUwI2gpOCtVPIIbNVC37RhdPPSyM1biWF11udLP4bQ5gOcKVyPKn3Mw
	RgeTa5GzSKm8Zuc5bU3hw/h6w5n7mrNa9LlcMaBEh9HHha01Kt2oDx1WeyYOMLGBeZhbfXpepXI
	eVxfoqL0/N+HsI/HU48qryxmvmE4h7fDHrxfFvJopkE7fpl+TpdpTQz0uxbEIfDIFpNLPmDi34N
	D0K1apic2YURBvE53BYPd1RciWl23OkKOq7LbkHVMVg==
X-Google-Smtp-Source: AGHT+IEkLvf+ip6rnng1Q3wqUaE7YnRlE5+SKbX9ob3uGgdaQmwMgPZM1fXpO1H39fcBtRjNqboEKA==
X-Received: by 2002:a05:6000:4210:b0:3d8:3eca:a97d with SMTP id ffacd0b85a97d-42666aa6616mr1684492f8f.11.1759911491904;
        Wed, 08 Oct 2025 01:18:11 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:286d:ff1d:8b7c:4328])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4255d8e97f0sm28498943f8f.27.2025.10.08.01.18.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 01:18:11 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 08 Oct 2025 10:17:53 +0200
Subject: [PATCH v2 6/8] net: stmmac: qcom-ethqos: split power management
 context into a separate struct
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251008-qcom-sa8255p-emac-v2-6-92bc29309fce@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4943;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=72Rcv9lcaIE/fmtmW9sA3UZwGSkP3ncYbbWtrZ8FIEk=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBo5h4202HoR6T5dxOtuURsXoZwH667ULKwPUQFt
 Pg5ZX90pKCJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaOYeNgAKCRARpy6gFHHX
 cvlXD/4oMQTfpDo2uPwukuQI/KQzXU/y8GklCY3xl2oO9CQHg18InhSbcIB9dCmUvObM94bmnBD
 n0J4E2ACalqEmPZUdDJ60jHvqactv0F+ntRz2qkDFYzaFexRkfXATjzFchCpRqAXvGcU5VpB1ZQ
 i2UDsHvtzVzNg4pipc7aPGvimknq7CfFFRbZMD5lRGEHGioI+XCGYUNsTNrIJykpwfaFiPmzN30
 XUb6glegwPsqra4CQ99uSKclBK47FOh7o4+VhVUZsNRaa8xa9/naZ/1JOLYU3TQh2uNXwvzJ8e5
 TNsWN0mzl3MVeoPLkD+pVZFH9CbDPGdzNeksgEEYiqgzXJSaqeCuIpB28EFp1UQrRw4uzwgBmsN
 jbhqw9LWU8l2rwBCobJtSMZSoZ50dTicEoQMhvR5ZBeBrjYSRRHB7JJKhsoy+T93Yu7C3b5qcfK
 V0ua3QeFOxf4uEUygKIu/SlgVq/j8ZVKSByJ/WkjPccIT7smJOCydOxlHoLIU85FoQ3U0jizMIv
 ZLAhuNgLcx+r7C5d0FM3sekaGOIA8J41lTbOCnz+hv+O2/W5YCciZd5IXC5LV1PcqIP6WYYE4Ib
 NMqYXy6BGOQIc7iv2vIzf+uNDjW7JbanfVIHHJT0ZM9PsfhDA24lyp1YNS35D7UXP7zU965LxpM
 eF/64jenVdSWCKg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_011813_896209_91B54665 
X-CRM114-Status: GOOD (  16.92  )
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


