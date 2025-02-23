Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 676C4C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Feb 2025 12:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uX6OdJxwETGtTGGkJLPqG+9wSA4petjmxxTURrNfA8Q=; b=xgkdjfzxQH5ZBzojArphD90rmL
	Yt71VgDfJFeVPvDYZB3gf2YtVJvz3TnY3UNXLQ+fjxpSlLY3IWRcGW7mrTE3FVsZBAnffSmvsegxg
	3FO4+nZWNCl5r3K2R6II9LxETzFu2pL9xN+oA1NABxpXfT75CYaTNbNI461SXII/5/lHULaOp9vtr
	0Y7OaUXkSVQaoZZP0kshYNYTDgkthzU87WdjBBA8uHI26+halXqCEQNWgeYB9B1OsAfID7Vwsl7Ao
	WV+FnUtlYKduW9J0rx07wplOHZu2FAaDhC1JR3vhHJ6T6bPHkKWVHyxAqdpD7NXcRwDtJP6zfum4z
	DvZ2GSZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmBBp-0000000B6h9-0hij;
	Sun, 23 Feb 2025 12:34:33 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmB0L-0000000B4t7-3MQw;
	Sun, 23 Feb 2025 12:22:42 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-38f24fc466aso2679970f8f.2;
        Sun, 23 Feb 2025 04:22:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740313360; x=1740918160; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uX6OdJxwETGtTGGkJLPqG+9wSA4petjmxxTURrNfA8Q=;
        b=jXfvPZcpLdPcj6q/oMJNDrWlh2pE4a/Z5wjNPLn9Jxzhq37jo37wMe960lv3Rbwv1c
         8VBFeIJPJpFBEzGXd6YXnQ0LX1FPSceTimIYglDAIIsi64mng8iBzQRk9pzi/qoG0/pi
         AUH6VxUOO0GokngsrAFSmO0+qP9qfMktQ7j6JxbHFdm5sd2zqKXNQ3F6SSP0HZVhtLmj
         vBqgZ9Hv2bIzvtiz4JxklPxQbkqOaSnJYoMgga8CrBbbM/la+n7zzLGM/lGQjAJBTGEQ
         bs1llRiLMDvh8nft51ZfR6eTOUoS6AbXMoWQNXKZOagsF7eop6e+klsPXGz5HVZ0HUTK
         g9zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740313360; x=1740918160;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uX6OdJxwETGtTGGkJLPqG+9wSA4petjmxxTURrNfA8Q=;
        b=GSts1yYBtJUHewYWp2SWenrekDog775Cu/R/f0EMuiZBCQLkOq7YwM02YSOmb2oXjh
         P4P8ZFFa4m+VTOa5K2Ch3qjywFlVHwrE+6YxyiIzNjKogpprBq7ylSBvNvVV4h+1dSDk
         70oVDMnbmrEaJIhZvPWQbwamHAcsOZa+Qex53uPiusAuDMjWnx3W8e5Xk8HCSxkA8XwZ
         EDl61CKBhCwoD8632hm1IF+H1xzw70LmxP3xvmfXefYXE5FsS3bOB3iCa1qFYcSY0Abq
         XfSZqB+gXXRaJsiaWx8fki2oZ3a89C7IMzyBNRTdmb6+A41YKe/FWiCYcWtnhk2KZX8q
         Ni1w==
X-Forwarded-Encrypted: i=1; AJvYcCWhZOiS9FMq4yVar7tEdlaPjITA/RyNKLY2GnoktYQiWRVTLIvFhqfkP9XFOm+SZkydiFt3xla9JxIh@lists.infradead.org, AJvYcCXeruFn6SPPjfegZYXWKjqE8DFYr+Ijb1UHNDqo04idUuhmRBYl669tuW7xS0ZD6iaNuQDUkeTu5eh8NkbZWEaJ@lists.infradead.org
X-Gm-Message-State: AOJu0YwSIr0CWpTKEY0hZwwtRNDYjtFwM2/g3qVyGnu/dehbUE3OV2he
	rSM/FuFJm7S81JfHa1eMj8LdIGwboxLL6LkO8FZ6IfSm2HcR3rW2rhtYDw==
X-Gm-Gg: ASbGncuowCU/TNG20MjmwjI4/h3kJrwPVrUoeqXYRKa0JL2946fctgOZ9ma8YTgQMCV
	TlD4r6/L/l8F81YL2S4UvxV6KscuKQymL6gGWjNkusE9+b7WZLT0WTNMoQZUlVIdM1oQN5SkmbO
	z+67WlomBbZ6vHqfkV/Y5LozPYoQTAYOvc0v1vxhXZOjh05DmXdEgjS/WwVguRzeWYX8fPN+Gmg
	XYpz89I8o6rdLGtzBlwNtg1SrR0H/+M8f/WDWq2riU43GL2Hv9KcyaJxcBe8uxM5lb4l/x9jwyI
	PzanTIHZPd4xt+s8cl1aENxRZZqqMceJFb3nQz4igMbVSsacQZufdaeNf8X/JhZinoH7qS//Mij
	cPQ==
X-Google-Smtp-Source: AGHT+IGM38Zp+pP6TM93b+qjLZgJemULvP7cowReOHzSCfeBj9XGBP7OMOSTNANHlWJlZmr6UB7gYw==
X-Received: by 2002:a05:6000:2a8:b0:38d:d69e:1326 with SMTP id ffacd0b85a97d-38f70783ad2mr7683466f8f.9.1740313360081;
        Sun, 23 Feb 2025 04:22:40 -0800 (PST)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259f8602sm29611608f8f.94.2025.02.23.04.22.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2025 04:22:39 -0800 (PST)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Abel Vesa <abel.vesa@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 7/8] phy: phy-snps-eusb2: add support for exynos2200
Date: Sun, 23 Feb 2025 14:22:26 +0200
Message-ID: <20250223122227.725233-8-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250223122227.725233-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250223122227.725233-1-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250223_042241_838125_54BA0CC2 
X-CRM114-Status: GOOD (  15.76  )
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

The Exynos2200 SoC reuses the Synopsis eUSB2 PHY IP, alongside an
external repeater, for USB 2.0. Add support for it to the existing
driver.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 drivers/phy/Kconfig          |   2 +-
 drivers/phy/phy-snps-eusb2.c | 172 +++++++++++++++++++++++++++++++++++
 2 files changed, 173 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
index 11c166204..58c911e1b 100644
--- a/drivers/phy/Kconfig
+++ b/drivers/phy/Kconfig
@@ -45,7 +45,7 @@ config PHY_PISTACHIO_USB
 
 config PHY_SNPS_EUSB2
 	tristate "SNPS eUSB2 PHY Driver"
-	depends on OF && (ARCH_QCOM || COMPILE_TEST)
+	depends on OF && (ARCH_EXYNOS || ARCH_QCOM || COMPILE_TEST)
 	select GENERIC_PHY
 	help
 	  Enable support for the USB high-speed SNPS eUSB2 phy on select
diff --git a/drivers/phy/phy-snps-eusb2.c b/drivers/phy/phy-snps-eusb2.c
index 7a242fe32..67a19d671 100644
--- a/drivers/phy/phy-snps-eusb2.c
+++ b/drivers/phy/phy-snps-eusb2.c
@@ -13,6 +13,39 @@
 #include <linux/regulator/consumer.h>
 #include <linux/reset.h>
 
+#define EXYNOS_USB_PHY_HS_PHY_CTRL_RST	(0x0)
+#define USB_PHY_RST_MASK		GENMASK(1, 0)
+#define UTMI_PORT_RST_MASK		GENMASK(5, 4)
+
+#define EXYNOS_USB_PHY_HS_PHY_CTRL_COMMON	(0x4)
+#define RPTR_MODE			BIT(10)
+#define FSEL_20_MHZ_VAL			(0x1)
+#define FSEL_24_MHZ_VAL			(0x2)
+#define FSEL_26_MHZ_VAL			(0x3)
+#define FSEL_48_MHZ_VAL			(0x2)
+
+#define EXYNOS_USB_PHY_CFG_PLLCFG0	(0x8)
+#define PHY_CFG_PLL_FB_DIV_19_8_MASK	GENMASK(19, 8)
+#define DIV_19_8_19_2_MHZ_VAL		(0x170)
+#define DIV_19_8_20_MHZ_VAL		(0x160)
+#define DIV_19_8_24_MHZ_VAL		(0x120)
+#define DIV_19_8_26_MHZ_VAL		(0x107)
+#define DIV_19_8_48_MHZ_VAL		(0x120)
+
+#define EXYNOS_USB_PHY_CFG_PLLCFG1	(0xc)
+#define EXYNOS_PHY_CFG_PLL_FB_DIV_11_8_MASK	GENMASK(11, 8)
+#define EXYNOS_DIV_11_8_19_2_MHZ_VAL	(0x0)
+#define EXYNOS_DIV_11_8_20_MHZ_VAL	(0x0)
+#define EXYNOS_DIV_11_8_24_MHZ_VAL	(0x0)
+#define EXYNOS_DIV_11_8_26_MHZ_VAL	(0x0)
+#define EXYNOS_DIV_11_8_48_MHZ_VAL	(0x1)
+
+#define EXYNOS_PHY_CFG_TX		(0x14)
+#define EXYNOS_PHY_CFG_TX_FSLS_VREF_TUNE_MASK	GENMASK(2, 1)
+
+#define EXYNOS_USB_PHY_UTMI_TESTSE	(0x20)
+#define TEST_IDDQ			BIT(6)
+
 #define QCOM_USB_PHY_UTMI_CTRL0		(0x3c)
 #define SLEEPM				BIT(0)
 #define OPMODE_MASK			GENMASK(4, 3)
@@ -196,6 +229,93 @@ static void qcom_eusb2_default_parameters(struct snps_eusb2_hsphy *phy)
 				    FIELD_PREP(PHY_CFG_TX_HS_XV_TUNE_MASK, 0x0));
 }
 
+static int exynos_eusb2_ref_clk_init(struct snps_eusb2_hsphy *phy)
+{
+	unsigned long ref_clk_freq = clk_get_rate(phy->ref_clk);
+
+	switch (ref_clk_freq) {
+	case 19200000:
+		snps_eusb2_hsphy_write_mask(phy->base, EXYNOS_USB_PHY_HS_PHY_CTRL_COMMON,
+					    FSEL_MASK,
+					    FIELD_PREP(FSEL_MASK, FSEL_19_2_MHZ_VAL));
+
+		snps_eusb2_hsphy_write_mask(phy->base, EXYNOS_USB_PHY_CFG_PLLCFG0,
+					    PHY_CFG_PLL_FB_DIV_19_8_MASK,
+					    FIELD_PREP(PHY_CFG_PLL_FB_DIV_19_8_MASK,
+						       DIV_19_8_19_2_MHZ_VAL));
+
+		snps_eusb2_hsphy_write_mask(phy->base, EXYNOS_USB_PHY_CFG_PLLCFG1,
+					    EXYNOS_PHY_CFG_PLL_FB_DIV_11_8_MASK,
+					    EXYNOS_DIV_11_8_19_2_MHZ_VAL);
+		break;
+
+	case 20000000:
+		snps_eusb2_hsphy_write_mask(phy->base, EXYNOS_USB_PHY_HS_PHY_CTRL_COMMON,
+					    FSEL_MASK,
+					    FIELD_PREP(FSEL_MASK, FSEL_20_MHZ_VAL));
+
+		snps_eusb2_hsphy_write_mask(phy->base, EXYNOS_USB_PHY_CFG_PLLCFG0,
+					    PHY_CFG_PLL_FB_DIV_19_8_MASK,
+					    FIELD_PREP(PHY_CFG_PLL_FB_DIV_19_8_MASK,
+						       DIV_19_8_20_MHZ_VAL));
+
+		snps_eusb2_hsphy_write_mask(phy->base, EXYNOS_USB_PHY_CFG_PLLCFG1,
+					    EXYNOS_PHY_CFG_PLL_FB_DIV_11_8_MASK,
+					    EXYNOS_DIV_11_8_20_MHZ_VAL);
+		break;
+
+	case 24000000:
+		snps_eusb2_hsphy_write_mask(phy->base, EXYNOS_USB_PHY_HS_PHY_CTRL_COMMON,
+					    FSEL_MASK,
+					    FIELD_PREP(FSEL_MASK, FSEL_24_MHZ_VAL));
+
+		snps_eusb2_hsphy_write_mask(phy->base, EXYNOS_USB_PHY_CFG_PLLCFG0,
+					    PHY_CFG_PLL_FB_DIV_19_8_MASK,
+					    FIELD_PREP(PHY_CFG_PLL_FB_DIV_19_8_MASK,
+						       DIV_19_8_24_MHZ_VAL));
+
+		snps_eusb2_hsphy_write_mask(phy->base, EXYNOS_USB_PHY_CFG_PLLCFG1,
+					    EXYNOS_PHY_CFG_PLL_FB_DIV_11_8_MASK,
+					    EXYNOS_DIV_11_8_24_MHZ_VAL);
+		break;
+
+	case 26000000:
+		snps_eusb2_hsphy_write_mask(phy->base, EXYNOS_USB_PHY_HS_PHY_CTRL_COMMON,
+					    FSEL_MASK,
+					    FIELD_PREP(FSEL_MASK, FSEL_26_MHZ_VAL));
+
+		snps_eusb2_hsphy_write_mask(phy->base, EXYNOS_USB_PHY_CFG_PLLCFG0,
+					    PHY_CFG_PLL_FB_DIV_19_8_MASK,
+					    FIELD_PREP(PHY_CFG_PLL_FB_DIV_19_8_MASK,
+						       DIV_19_8_26_MHZ_VAL));
+
+		snps_eusb2_hsphy_write_mask(phy->base, EXYNOS_USB_PHY_CFG_PLLCFG1,
+					    EXYNOS_PHY_CFG_PLL_FB_DIV_11_8_MASK,
+					    EXYNOS_DIV_11_8_26_MHZ_VAL);
+		break;
+
+	case 48000000:
+		snps_eusb2_hsphy_write_mask(phy->base, EXYNOS_USB_PHY_HS_PHY_CTRL_COMMON,
+					    FSEL_MASK,
+					    FIELD_PREP(FSEL_MASK, FSEL_48_MHZ_VAL));
+
+		snps_eusb2_hsphy_write_mask(phy->base, EXYNOS_USB_PHY_CFG_PLLCFG0,
+					    PHY_CFG_PLL_FB_DIV_19_8_MASK,
+					    FIELD_PREP(PHY_CFG_PLL_FB_DIV_19_8_MASK,
+						       DIV_19_8_48_MHZ_VAL));
+
+		snps_eusb2_hsphy_write_mask(phy->base, EXYNOS_USB_PHY_CFG_PLLCFG1,
+					    EXYNOS_PHY_CFG_PLL_FB_DIV_11_8_MASK,
+					    EXYNOS_DIV_11_8_48_MHZ_VAL);
+		break;
+	default:
+		dev_err(&phy->phy->dev, "unsupported ref_clk_freq:%lu\n", ref_clk_freq);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 static int qcom_eusb2_ref_clk_init(struct snps_eusb2_hsphy *phy)
 {
 	unsigned long ref_clk_freq = clk_get_rate(phy->ref_clk);
@@ -240,6 +360,55 @@ static int qcom_eusb2_ref_clk_init(struct snps_eusb2_hsphy *phy)
 	return 0;
 }
 
+static int exynos_snps_eusb2_hsphy_init(struct phy *p)
+{
+	struct snps_eusb2_hsphy *phy = phy_get_drvdata(p);
+	int ret;
+
+	snps_eusb2_hsphy_write_mask(phy->base, EXYNOS_USB_PHY_HS_PHY_CTRL_RST,
+				    USB_PHY_RST_MASK | UTMI_PORT_RST_MASK,
+				    USB_PHY_RST_MASK | UTMI_PORT_RST_MASK);
+	fsleep(50); /* required after holding phy in reset */
+
+	snps_eusb2_hsphy_write_mask(phy->base, EXYNOS_USB_PHY_HS_PHY_CTRL_COMMON,
+				    RPTR_MODE, RPTR_MODE);
+
+	/* update ref_clk related registers */
+	ret = exynos_eusb2_ref_clk_init(phy);
+	if (ret)
+		return ret;
+
+	/* default parameter: tx fsls-vref */
+	snps_eusb2_hsphy_write_mask(phy->base, EXYNOS_PHY_CFG_TX,
+				    EXYNOS_PHY_CFG_TX_FSLS_VREF_TUNE_MASK,
+				    FIELD_PREP(EXYNOS_PHY_CFG_TX_FSLS_VREF_TUNE_MASK, 0x0));
+
+	snps_eusb2_hsphy_write_mask(phy->base, EXYNOS_USB_PHY_UTMI_TESTSE,
+				    TEST_IDDQ, 0);
+	fsleep(10); /* required after releasing test_iddq */
+
+	snps_eusb2_hsphy_write_mask(phy->base, EXYNOS_USB_PHY_HS_PHY_CTRL_RST,
+				    USB_PHY_RST_MASK, 0);
+
+	snps_eusb2_hsphy_write_mask(phy->base, EXYNOS_USB_PHY_HS_PHY_CTRL_COMMON,
+				    PHY_ENABLE, PHY_ENABLE);
+
+	snps_eusb2_hsphy_write_mask(phy->base, EXYNOS_USB_PHY_HS_PHY_CTRL_RST,
+				    UTMI_PORT_RST_MASK, 0);
+
+	return 0;
+}
+
+static const char * const exynos_eusb2_hsphy_clock_names[] = {
+	"ref", "bus", "ctrl",
+};
+
+static const struct snps_eusb2_phy_drvdata exynos2200_snps_eusb2_phy = {
+	.phy_init	= exynos_snps_eusb2_hsphy_init,
+	.clk_names	= exynos_eusb2_hsphy_clock_names,
+	.num_clks	= ARRAY_SIZE(exynos_eusb2_hsphy_clock_names),
+};
+
 static int qcom_snps_eusb2_hsphy_init(struct phy *p)
 {
 	struct snps_eusb2_hsphy *phy = phy_get_drvdata(p);
@@ -488,6 +657,9 @@ static const struct of_device_id snps_eusb2_hsphy_of_match_table[] = {
 	{
 		.compatible = "qcom,sm8550-snps-eusb2-phy",
 		.data = &sm8550_snps_eusb2_phy,
+	}, {
+		.compatible = "samsung,exynos2200-snps-eusb2-phy",
+		.data = &exynos2200_snps_eusb2_phy,
 	}, { },
 };
 MODULE_DEVICE_TABLE(of, snps_eusb2_hsphy_of_match_table);
-- 
2.43.0


