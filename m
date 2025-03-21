Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B85C3C36001
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Mar 2025 14:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CgZMHv0Maj+ykqpVS5qC2n9kdvYUkd9lbOYXYbxjsJY=; b=MXyzXeJMm7UnuLcEeWxh3CJYQH
	hnCt7dRHvnbZwyusjTqccSpmrZaWyQ+NRUEGzi8xGY48QKAoRi9/nBTvDtjpaLe4wjleUO+EO+iD6
	Ns75W2H8fdymvFGzTFcr83DAc8u2WBgXFkeIP8t8i1j4aEam8WgIPn7U5UxdFnIhcj6xssU3irzCc
	y7so6AadmvjwbKVqegGo1fxHVTp8k3ohGsDq+fZKX0IKWX77utchZX0pphgkygdOpmYsK0SOvK94T
	UpRRIVuDN06muVVol1pVJ9qd9FHS/h/YQX4Qo/ZJQDI1YqZiWuqZMWF/OxiHmSpweCneV3TSDWFBm
	Y0+fCKvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvdAO-0000000F46i-0K75;
	Fri, 21 Mar 2025 14:16:08 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvcu0-0000000F0Yx-2hYR;
	Fri, 21 Mar 2025 13:59:13 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-43d0618746bso14030155e9.2;
        Fri, 21 Mar 2025 06:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742565551; x=1743170351; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CgZMHv0Maj+ykqpVS5qC2n9kdvYUkd9lbOYXYbxjsJY=;
        b=GiGmLxB3QqVI1ws9iKfTAGTD4WNEownPGK45zQx42EkSgpl3QhU66hOcFJ3WYrIEst
         4Ok8VyeP6/VVScSv28UW2d0E0g13I4uNhZX3elHUrjBvCmEKAgToY4EMn0a5R6q8eDFP
         A4ZCE5HsAnAGB6RmV9CsIAl3tiIHUH2Critc0+nUDQ5IBGddXvAMrOdnAAqcztj8t4De
         hdxOL3TR1GUu8kjt61Q0XwkMc/BMblNg5zTRQvMsckN9+dGv7tri5qnxsQdPfmjP6//u
         0DZuMHpWQoxTEfjmkDiY53GhorC6PQY7Nk1kreVSsKRUS3ay7orXosaXzi+9OkEsAVUe
         o3sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742565551; x=1743170351;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CgZMHv0Maj+ykqpVS5qC2n9kdvYUkd9lbOYXYbxjsJY=;
        b=Z7gCPh7ZHJyURsObgvY3r680+NArOPlp7gBof1A1LrRcyGDdvAvuv/cAXuILhNekX0
         ad0qS8T+dtjpgtl+xyg+Y89ETFO22wIQjIJCLJKW1p7bUhoe4LZKTuzpJinoRF/KNF74
         J36x5JXMn8kYcPWsWjwQLm/YMMFv+NGOLJMYnWUMGKeTAGIbZ7bW1qKBJj6nvDGda1LE
         0lFsm7uydiD9HmT0nPX+cAlZ0kDlfYS9h48t6yLbztr8hF6V4XpEHXT+9pmAh0sunZC1
         lh1iYDgJkQOvnoCmnfTS6RN0OThKNfnEq2z4Dvj8djh/Kz7hTY1NTMON6ZZtCIu8o0ap
         aakA==
X-Forwarded-Encrypted: i=1; AJvYcCX2kbLhsEnCkhVKiEQgX/629COL2StNOOh0I2G/7OvH9QnJeFtDYx7qVnXN6yZTZAI7c4jqPASAnQPd@lists.infradead.org, AJvYcCXuk7AYBghY6xRxaXlFBE6I1RFdKVn0wjkKtPKPYV8NsRzMuGWFzTk6cWdlruAniM4mIEthxoWLOtDs9fjOPec9@lists.infradead.org
X-Gm-Message-State: AOJu0YzLW8eEQ8APar5zDax0Ctm+/gQ7/Ppxnp5sPcKoW2Hmj9nQLTyn
	dggeqV+wZ0jTaYpoiExZGjo1EH9VlrH6wYzzyTFj/4lLOalqaydn
X-Gm-Gg: ASbGncuqDOlVTTGsX63zZqMx3y3hrOCf/04LTpLESFlfSCmWvVfuj8QFs3sEWiunftS
	gQtmJpuzmAKNzbVNPFAaznNRl3WgwnE71FD3QPlVuA3lkeo7/vGp70XGao2cTtn87G/LRfP3U9N
	3+imFI7bRcRQ/ud4Xb1kjjzP62B6qgh8U6aqMRSxCLoLUL/18g5pDVw9jowXiO33bfVxWoCxKEz
	Hrf6OSYWtl5KDCyovfO2sgXaLk7WMP8B3Gy0wppULJQHBZ8Vm4cVGEMX8V+46c3K8IbKSI5KMDi
	iPD5BUHGKYgh7Tc8vT6dh261MBTBGRnHzzHCqC8c9irN0e5gpizpfZmQeCbDRyh+MA4bcD7A/yr
	djzpJtJRHq9YBLFwaV9+A
X-Google-Smtp-Source: AGHT+IG483kXiPjaAemdueHV42vkF2NnkMPu50jCxoNzdFurIxOd7T8xvIFGk0X9jQOIsr28IXGPnw==
X-Received: by 2002:a05:600c:1f92:b0:43d:45a:8fca with SMTP id 5b1f17b1804b1-43d50a3c79fmr27723135e9.30.1742565550669;
        Fri, 21 Mar 2025 06:59:10 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9e6651sm2437162f8f.75.2025.03.21.06.59.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 06:59:10 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Abel Vesa <abel.vesa@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH v3 09/10] phy: phy-snps-eusb2: add support for exynos2200
Date: Fri, 21 Mar 2025 15:58:53 +0200
Message-ID: <20250321135854.1431375-10-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250321135854.1431375-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250321135854.1431375-1-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_065912_694211_0970B074 
X-CRM114-Status: GOOD (  21.65  )
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
driver, while keeping in mind that it requires enabled more than the
reference clock.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 drivers/phy/Kconfig          |   2 +-
 drivers/phy/phy-snps-eusb2.c | 162 ++++++++++++++++++++++++++++++++++-
 2 files changed, 159 insertions(+), 5 deletions(-)

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
index 4ca11860a..951f58119 100644
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
@@ -123,6 +156,8 @@ static const char * const eusb2_hsphy_vreg_names[] = {
 
 struct snps_eusb2_phy_drvdata {
 	int (*phy_init)(struct phy *p);
+	const char * const *clk_names;
+	int num_clks;
 };
 
 struct snps_eusb2_hsphy {
@@ -130,6 +165,7 @@ struct snps_eusb2_hsphy {
 	void __iomem *base;
 
 	struct clk *ref_clk;
+	struct clk_bulk_data *clks;
 	struct reset_control *phy_reset;
 
 	struct regulator_bulk_data vregs[EUSB2_NUM_VREGS];
@@ -199,6 +235,46 @@ struct snps_eusb2_ref_clk {
 	u32 div_11_8_val;
 };
 
+static const struct snps_eusb2_ref_clk exynos_eusb2_ref_clk[] = {
+	{ 19200000, FSEL_19_2_MHZ_VAL, DIV_19_8_19_2_MHZ_VAL, EXYNOS_DIV_11_8_19_2_MHZ_VAL },
+	{ 20000000, FSEL_20_MHZ_VAL, DIV_19_8_20_MHZ_VAL, EXYNOS_DIV_11_8_20_MHZ_VAL },
+	{ 24000000, FSEL_24_MHZ_VAL, DIV_19_8_24_MHZ_VAL, EXYNOS_DIV_11_8_24_MHZ_VAL },
+	{ 26000000, FSEL_26_MHZ_VAL, DIV_19_8_26_MHZ_VAL, EXYNOS_DIV_11_8_26_MHZ_VAL },
+	{ 48000000, FSEL_48_MHZ_VAL, DIV_19_8_48_MHZ_VAL, EXYNOS_DIV_11_8_48_MHZ_VAL },
+};
+
+static int exynos_eusb2_ref_clk_init(struct snps_eusb2_hsphy *phy)
+{
+	const struct snps_eusb2_ref_clk *config = NULL;
+	unsigned long ref_clk_freq = clk_get_rate(phy->ref_clk);
+
+	for (int i = 0; i < ARRAY_SIZE(exynos_eusb2_ref_clk); i++) {
+		if (exynos_eusb2_ref_clk[i].freq == ref_clk_freq) {
+			config = &exynos_eusb2_ref_clk[i];
+			break;
+		}
+	}
+
+	if (!config) {
+		dev_err(&phy->phy->dev, "unsupported ref_clk_freq:%lu\n", ref_clk_freq);
+		return -EINVAL;
+	}
+
+	snps_eusb2_hsphy_write_mask(phy->base, EXYNOS_USB_PHY_HS_PHY_CTRL_COMMON,
+				    FSEL_MASK,
+				    FIELD_PREP(FSEL_MASK, config->fsel_val));
+
+	snps_eusb2_hsphy_write_mask(phy->base, EXYNOS_USB_PHY_CFG_PLLCFG0,
+				    PHY_CFG_PLL_FB_DIV_19_8_MASK,
+				    FIELD_PREP(PHY_CFG_PLL_FB_DIV_19_8_MASK,
+					       config->div_7_0_val));
+
+	snps_eusb2_hsphy_write_mask(phy->base, EXYNOS_USB_PHY_CFG_PLLCFG1,
+				    EXYNOS_PHY_CFG_PLL_FB_DIV_11_8_MASK,
+				    config->div_11_8_val);
+	return 0;
+}
+
 static const struct snps_eusb2_ref_clk qcom_eusb2_ref_clk[] = {
 	{ 19200000, FSEL_19_2_MHZ_VAL, DIV_7_0_19_2_MHZ_VAL, DIV_11_8_19_2_MHZ_VAL },
 	{ 38400000, FSEL_38_4_MHZ_VAL, DIV_7_0_38_4_MHZ_VAL, DIV_11_8_38_4_MHZ_VAL },
@@ -239,6 +315,55 @@ static int qcom_eusb2_ref_clk_init(struct snps_eusb2_hsphy *phy)
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
@@ -315,8 +440,14 @@ static int qcom_snps_eusb2_hsphy_init(struct phy *p)
 	return 0;
 }
 
+static const char * const qcom_eusb2_hsphy_clock_names[] = {
+	"ref",
+};
+
 static const struct snps_eusb2_phy_drvdata sm8550_snps_eusb2_phy = {
 	.phy_init	= qcom_snps_eusb2_hsphy_init,
+	.clk_names      = qcom_eusb2_hsphy_clock_names,
+	.num_clks       = ARRAY_SIZE(qcom_eusb2_hsphy_clock_names),
 };
 
 static int snps_eusb2_hsphy_init(struct phy *p)
@@ -334,7 +465,7 @@ static int snps_eusb2_hsphy_init(struct phy *p)
 		goto disable_vreg;
 	}
 
-	ret = clk_prepare_enable(phy->ref_clk);
+	ret = clk_bulk_prepare_enable(phy->data->num_clks, phy->clks);
 	if (ret) {
 		dev_err(&p->dev, "failed to enable ref clock, %d\n", ret);
 		goto disable_vreg;
@@ -361,7 +492,7 @@ static int snps_eusb2_hsphy_init(struct phy *p)
 	return 0;
 
 disable_ref_clk:
-	clk_disable_unprepare(phy->ref_clk);
+	clk_bulk_disable_unprepare(phy->data->num_clks, phy->clks);
 
 disable_vreg:
 	regulator_bulk_disable(ARRAY_SIZE(phy->vregs), phy->vregs);
@@ -417,8 +548,28 @@ static int snps_eusb2_hsphy_probe(struct platform_device *pdev)
 	if (IS_ERR(phy->phy_reset))
 		return PTR_ERR(phy->phy_reset);
 
-	phy->ref_clk = devm_clk_get(dev, "ref");
-	if (IS_ERR(phy->ref_clk))
+	phy->clks = devm_kcalloc(dev, phy->data->num_clks, sizeof(*phy->clks),
+				 GFP_KERNEL);
+	if (!phy->clks)
+		return -ENOMEM;
+
+	for (int i = 0; i < phy->data->num_clks; ++i)
+		phy->clks[i].id = phy->data->clk_names[i];
+
+	ret = devm_clk_bulk_get(dev, phy->data->num_clks, phy->clks);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "failed to get phy clock(s)\n");
+
+	phy->ref_clk = NULL;
+	for (int i = 0; i < phy->data->num_clks; ++i) {
+		if (!strcmp(phy->clks[i].id, "ref")) {
+			phy->ref_clk = phy->clks[i].clk;
+			break;
+		}
+	}
+
+	if (IS_ERR_OR_NULL(phy->ref_clk))
 		return dev_err_probe(dev, PTR_ERR(phy->ref_clk),
 				     "failed to get ref clk\n");
 
@@ -458,6 +609,9 @@ static const struct of_device_id snps_eusb2_hsphy_of_match_table[] = {
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


