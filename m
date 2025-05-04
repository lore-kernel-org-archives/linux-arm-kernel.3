Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2454C3ABAC
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 May 2025 14:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o5tSHqpXtWFPabFBWZB93znRyMEz1UyBewsCCfTVVvw=; b=xaYmRLea0bqIuyO09rhV09CtuF
	rXa5hPNA+cpRWDTwlMCUVeFN2fVIz3hseNpI+GwsGcEZTYFZOv1CmVM3vx8XWclaoKkNiqvXiIibj
	8H8k88OGIG4hcmGmalE3rr6HL478w6RkUMzgX5l55LUOeIGpRJKIhgHsRaYzDmfAPEkkxX4Aa7CLc
	g4EZEtp4sBYRmmjLgQp1W1oOjGQwdClULTKgEeOfavxJEsOgK7cGrg8WibzDcUWxAim5eOnxlHjFv
	uw+Fg5YTM5L189e/W6kShitThVtHg0Dq8WvR7HVZvxm5PgyJtO9XuaI8EjhYeVW6pj0NUx0cgv/+g
	q8HRTlYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBakZ-00000005Qfj-0p6x;
	Sun, 04 May 2025 14:55:27 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBabB-00000005PQl-1yQG;
	Sun, 04 May 2025 14:45:46 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-5f4b7211badso5143616a12.2;
        Sun, 04 May 2025 07:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746369944; x=1746974744; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o5tSHqpXtWFPabFBWZB93znRyMEz1UyBewsCCfTVVvw=;
        b=fU6jN5syY4/+gy4rtyw+8AVH9YudL8kR7fAcLglceDfMH3yV+XwCzUeCxQxMslsoH4
         OXy3lAndkX5tep+YbsQpIowfWZXOl4gTA1knU70GKNT74ctrzVCPs87EY0EUMggMo4vb
         6a5HawlSdBCa7lxsuBmMTMm9VyNNFDyk4DZs+nvPMCBHuFYTkZtwkVmFZp0RJUeSWCIA
         5HIS6vFdCT6DOxnBTQ41ZV4evuK8rJ68JnrRgVpQt61fWWNlodaopng4O5D5D4p/5bAU
         UiFaK6FnlNHi8eCuHVzTDre8geuZHnlKbiSvLYEpSqD3vXelcdbN/8Xh9hBNkJvghE31
         QLlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746369944; x=1746974744;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o5tSHqpXtWFPabFBWZB93znRyMEz1UyBewsCCfTVVvw=;
        b=lGBgmHaNhCqT0dskN3r9ynLQDSX5pQK7XiPGVapgn9IxB2MHOaJcDdyFF8qDPphfMd
         KPHfcy2FQM9cUxTDp1LEB+wNyaI/gLKmOhdQeY46XzfRj8+u5rhlhGrnRwDDXU3WEaFI
         2O5Ay+wiHf1USzA/nR8+Gc64peoKD+wF5TTSwSMWIzabzZe01MhbquqV1bOnCnqDURnI
         MYY2VvTvGHJigBRRTWqsOkmrFpQuKwRFi2+jaxmZdaoW2Jv9/HYV4IT4enGz2jMIztmK
         Itc2WZbwBUqDKoS/vEvGTTPTHgE9JomxiVepCALUqwPxvqo7f5T9Ygf9FtisE5dQs8hz
         U9KA==
X-Forwarded-Encrypted: i=1; AJvYcCXgJ7k9TI2Qx7m306BKwJpJvN6eI9vYJqGsqfczY8ft09+rl5tZykUoz/1HSM9SPGvSuBVZUzCFJiwEI2RaBDKx@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/F9omjQaWlDSOLPppF1wgbJ96BtgQpFAdJ+m8JYQ9ZSuwZGLe
	zGGzYtw4MRf3mLTtEqeYbHKbsqq4FeYlfcLFl3hIk7YPusl5PyUs
X-Gm-Gg: ASbGncvfZ2tsr5PYTR8fcB3C4IiAy7CkwjzwLgmIoAFind4DwvDeYWpruX5/hkUSwhA
	ecg9JMIszqslgEIAC/JtVFeKlW6Av3F6wq7qkgkE/53cRhg0hSHea8nBxMIcufv7RrQZEq5DPt2
	+7aIhrTb+bIPfr7R26a3mPbMEyOGB3e372cqVkOedDC9LYdh2gQhEQuG3hElF0F7s3MZdlfdznn
	VQblGa6gDPBXvx3qR2PadZjp3k6awoMwSQFnPskPOaHLnL3wGwYKZwdRMVe9cPm3T5Ac7ewFcEh
	IaVtc7jbGGDJVtznlJNt+uaa15fffzyBvkBzOSrDfoq3FntZPMWlg3K1IFI038rXoCeT/IgJcAy
	KEbG7/oRr21qoqUzA
X-Google-Smtp-Source: AGHT+IGQBQrBO1qlxwwu+jJ6EzfLuutmdXd+dnHvvpsx5Z89dAJ0PMX5GR7in/J0mFrvVBGWiDk2LQ==
X-Received: by 2002:a05:6402:40c2:b0:5ee:486:9d4b with SMTP id 4fb4d7f45d1cf-5faa8025c59mr4232708a12.34.1746369943770;
        Sun, 04 May 2025 07:45:43 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5faecf59d31sm1147258a12.77.2025.05.04.07.45.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 07:45:43 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: linux-phy@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 04/10] phy: phy-snps-eusb2: refactor constructs names
Date: Sun,  4 May 2025 17:45:21 +0300
Message-ID: <20250504144527.1723980-5-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250504144527.1723980-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250504144527.1723980-1-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250504_074545_669159_C3239FD3 
X-CRM114-Status: GOOD (  13.55  )
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

As the driver now resides outside the phy subdirectory under a different
name, refactor all definitions, structures and functions to explicitly
specify what code is Qualcomm-specific and what is not.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/phy/phy-snps-eusb2.c | 256 +++++++++++++++++------------------
 1 file changed, 128 insertions(+), 128 deletions(-)

diff --git a/drivers/phy/phy-snps-eusb2.c b/drivers/phy/phy-snps-eusb2.c
index 1484691a4..e1b175f48 100644
--- a/drivers/phy/phy-snps-eusb2.c
+++ b/drivers/phy/phy-snps-eusb2.c
@@ -13,15 +13,15 @@
 #include <linux/regulator/consumer.h>
 #include <linux/reset.h>
 
-#define USB_PHY_UTMI_CTRL0		(0x3c)
+#define QCOM_USB_PHY_UTMI_CTRL0		(0x3c)
 #define SLEEPM				BIT(0)
 #define OPMODE_MASK			GENMASK(4, 3)
 #define OPMODE_NONDRIVING		BIT(3)
 
-#define USB_PHY_UTMI_CTRL5		(0x50)
+#define QCOM_USB_PHY_UTMI_CTRL5		(0x50)
 #define POR				BIT(1)
 
-#define USB_PHY_HS_PHY_CTRL_COMMON0	(0x54)
+#define QCOM_USB_PHY_HS_PHY_CTRL_COMMON0	(0x54)
 #define PHY_ENABLE			BIT(0)
 #define SIDDQ_SEL			BIT(1)
 #define SIDDQ				BIT(2)
@@ -30,15 +30,15 @@
 #define FSEL_19_2_MHZ_VAL		(0x0)
 #define FSEL_38_4_MHZ_VAL		(0x4)
 
-#define USB_PHY_CFG_CTRL_1		(0x58)
+#define QCOM_USB_PHY_CFG_CTRL_1		(0x58)
 #define PHY_CFG_PLL_CPBIAS_CNTRL_MASK	GENMASK(7, 1)
 
-#define USB_PHY_CFG_CTRL_2		(0x5c)
+#define QCOM_USB_PHY_CFG_CTRL_2		(0x5c)
 #define PHY_CFG_PLL_FB_DIV_7_0_MASK	GENMASK(7, 0)
 #define DIV_7_0_19_2_MHZ_VAL		(0x90)
 #define DIV_7_0_38_4_MHZ_VAL		(0xc8)
 
-#define USB_PHY_CFG_CTRL_3		(0x60)
+#define QCOM_USB_PHY_CFG_CTRL_3		(0x60)
 #define PHY_CFG_PLL_FB_DIV_11_8_MASK	GENMASK(3, 0)
 #define DIV_11_8_19_2_MHZ_VAL		(0x1)
 #define DIV_11_8_38_4_MHZ_VAL		(0x0)
@@ -46,73 +46,73 @@
 #define PHY_CFG_PLL_REF_DIV		GENMASK(7, 4)
 #define PLL_REF_DIV_VAL			(0x0)
 
-#define USB_PHY_HS_PHY_CTRL2		(0x64)
+#define QCOM_USB_PHY_HS_PHY_CTRL2	(0x64)
 #define VBUSVLDEXT0			BIT(0)
 #define USB2_SUSPEND_N			BIT(2)
 #define USB2_SUSPEND_N_SEL		BIT(3)
 #define VBUS_DET_EXT_SEL		BIT(4)
 
-#define USB_PHY_CFG_CTRL_4		(0x68)
+#define QCOM_USB_PHY_CFG_CTRL_4		(0x68)
 #define PHY_CFG_PLL_GMP_CNTRL_MASK	GENMASK(1, 0)
 #define PHY_CFG_PLL_INT_CNTRL_MASK	GENMASK(7, 2)
 
-#define USB_PHY_CFG_CTRL_5		(0x6c)
+#define QCOM_USB_PHY_CFG_CTRL_5		(0x6c)
 #define PHY_CFG_PLL_PROP_CNTRL_MASK	GENMASK(4, 0)
 #define PHY_CFG_PLL_VREF_TUNE_MASK	GENMASK(7, 6)
 
-#define USB_PHY_CFG_CTRL_6		(0x70)
+#define QCOM_USB_PHY_CFG_CTRL_6		(0x70)
 #define PHY_CFG_PLL_VCO_CNTRL_MASK	GENMASK(2, 0)
 
-#define USB_PHY_CFG_CTRL_7		(0x74)
+#define QCOM_USB_PHY_CFG_CTRL_7		(0x74)
 
-#define USB_PHY_CFG_CTRL_8		(0x78)
+#define QCOM_USB_PHY_CFG_CTRL_8		(0x78)
 #define PHY_CFG_TX_FSLS_VREF_TUNE_MASK	GENMASK(1, 0)
 #define PHY_CFG_TX_FSLS_VREG_BYPASS	BIT(2)
 #define PHY_CFG_TX_HS_VREF_TUNE_MASK	GENMASK(5, 3)
 #define PHY_CFG_TX_HS_XV_TUNE_MASK	GENMASK(7, 6)
 
-#define USB_PHY_CFG_CTRL_9		(0x7c)
+#define QCOM_USB_PHY_CFG_CTRL_9		(0x7c)
 #define PHY_CFG_TX_PREEMP_TUNE_MASK	GENMASK(2, 0)
 #define PHY_CFG_TX_RES_TUNE_MASK	GENMASK(4, 3)
 #define PHY_CFG_TX_RISE_TUNE_MASK	GENMASK(6, 5)
 #define PHY_CFG_RCAL_BYPASS		BIT(7)
 
-#define USB_PHY_CFG_CTRL_10		(0x80)
+#define QCOM_USB_PHY_CFG_CTRL_10	(0x80)
 
-#define USB_PHY_CFG0			(0x94)
+#define QCOM_USB_PHY_CFG0		(0x94)
 #define DATAPATH_CTRL_OVERRIDE_EN	BIT(0)
 #define CMN_CTRL_OVERRIDE_EN		BIT(1)
 
-#define UTMI_PHY_CMN_CTRL0		(0x98)
+#define QCOM_UTMI_PHY_CMN_CTRL0		(0x98)
 #define TESTBURNIN			BIT(6)
 
-#define USB_PHY_FSEL_SEL		(0xb8)
+#define QCOM_USB_PHY_FSEL_SEL		(0xb8)
 #define FSEL_SEL			BIT(0)
 
-#define USB_PHY_APB_ACCESS_CMD		(0x130)
+#define QCOM_USB_PHY_APB_ACCESS_CMD	(0x130)
 #define RW_ACCESS			BIT(0)
 #define APB_START_CMD			BIT(1)
 #define APB_LOGIC_RESET			BIT(2)
 
-#define USB_PHY_APB_ACCESS_STATUS	(0x134)
+#define QCOM_USB_PHY_APB_ACCESS_STATUS	(0x134)
 #define ACCESS_DONE			BIT(0)
 #define TIMED_OUT			BIT(1)
 #define ACCESS_ERROR			BIT(2)
 #define ACCESS_IN_PROGRESS		BIT(3)
 
-#define USB_PHY_APB_ADDRESS		(0x138)
+#define QCOM_USB_PHY_APB_ADDRESS	(0x138)
 #define APB_REG_ADDR_MASK		GENMASK(7, 0)
 
-#define USB_PHY_APB_WRDATA_LSB		(0x13c)
+#define QCOM_USB_PHY_APB_WRDATA_LSB	(0x13c)
 #define APB_REG_WRDATA_7_0_MASK		GENMASK(3, 0)
 
-#define USB_PHY_APB_WRDATA_MSB		(0x140)
+#define QCOM_USB_PHY_APB_WRDATA_MSB	(0x140)
 #define APB_REG_WRDATA_15_8_MASK	GENMASK(7, 4)
 
-#define USB_PHY_APB_RDDATA_LSB		(0x144)
+#define QCOM_USB_PHY_APB_RDDATA_LSB	(0x144)
 #define APB_REG_RDDATA_7_0_MASK		GENMASK(3, 0)
 
-#define USB_PHY_APB_RDDATA_MSB		(0x148)
+#define QCOM_USB_PHY_APB_RDDATA_MSB	(0x148)
 #define APB_REG_RDDATA_15_8_MASK	GENMASK(7, 4)
 
 static const char * const eusb2_hsphy_vreg_names[] = {
@@ -121,7 +121,7 @@ static const char * const eusb2_hsphy_vreg_names[] = {
 
 #define EUSB2_NUM_VREGS		ARRAY_SIZE(eusb2_hsphy_vreg_names)
 
-struct qcom_snps_eusb2_hsphy {
+struct snps_eusb2_hsphy {
 	struct phy *phy;
 	void __iomem *base;
 
@@ -135,17 +135,17 @@ struct qcom_snps_eusb2_hsphy {
 	struct phy *repeater;
 };
 
-static int qcom_snps_eusb2_hsphy_set_mode(struct phy *p, enum phy_mode mode, int submode)
+static int snps_eusb2_hsphy_set_mode(struct phy *p, enum phy_mode mode, int submode)
 {
-	struct qcom_snps_eusb2_hsphy *phy = phy_get_drvdata(p);
+	struct snps_eusb2_hsphy *phy = phy_get_drvdata(p);
 
 	phy->mode = mode;
 
 	return phy_set_mode_ext(phy->repeater, mode, submode);
 }
 
-static void qcom_snps_eusb2_hsphy_write_mask(void __iomem *base, u32 offset,
-					     u32 mask, u32 val)
+static void snps_eusb2_hsphy_write_mask(void __iomem *base, u32 offset,
+					u32 mask, u32 val)
 {
 	u32 reg;
 
@@ -158,65 +158,65 @@ static void qcom_snps_eusb2_hsphy_write_mask(void __iomem *base, u32 offset,
 	readl_relaxed(base + offset);
 }
 
-static void qcom_eusb2_default_parameters(struct qcom_snps_eusb2_hsphy *phy)
+static void qcom_eusb2_default_parameters(struct snps_eusb2_hsphy *phy)
 {
 	/* default parameters: tx pre-emphasis */
-	qcom_snps_eusb2_hsphy_write_mask(phy->base, USB_PHY_CFG_CTRL_9,
-					 PHY_CFG_TX_PREEMP_TUNE_MASK,
-					 FIELD_PREP(PHY_CFG_TX_PREEMP_TUNE_MASK, 0));
+	snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_CFG_CTRL_9,
+				    PHY_CFG_TX_PREEMP_TUNE_MASK,
+				    FIELD_PREP(PHY_CFG_TX_PREEMP_TUNE_MASK, 0));
 
 	/* tx rise/fall time */
-	qcom_snps_eusb2_hsphy_write_mask(phy->base, USB_PHY_CFG_CTRL_9,
-					 PHY_CFG_TX_RISE_TUNE_MASK,
-					 FIELD_PREP(PHY_CFG_TX_RISE_TUNE_MASK, 0x2));
+	snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_CFG_CTRL_9,
+				    PHY_CFG_TX_RISE_TUNE_MASK,
+				    FIELD_PREP(PHY_CFG_TX_RISE_TUNE_MASK, 0x2));
 
 	/* source impedance adjustment */
-	qcom_snps_eusb2_hsphy_write_mask(phy->base, USB_PHY_CFG_CTRL_9,
-					 PHY_CFG_TX_RES_TUNE_MASK,
-					 FIELD_PREP(PHY_CFG_TX_RES_TUNE_MASK, 0x1));
+	snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_CFG_CTRL_9,
+				    PHY_CFG_TX_RES_TUNE_MASK,
+				    FIELD_PREP(PHY_CFG_TX_RES_TUNE_MASK, 0x1));
 
 	/* dc voltage level adjustement */
-	qcom_snps_eusb2_hsphy_write_mask(phy->base, USB_PHY_CFG_CTRL_8,
-					 PHY_CFG_TX_HS_VREF_TUNE_MASK,
-					 FIELD_PREP(PHY_CFG_TX_HS_VREF_TUNE_MASK, 0x3));
+	snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_CFG_CTRL_8,
+				    PHY_CFG_TX_HS_VREF_TUNE_MASK,
+				    FIELD_PREP(PHY_CFG_TX_HS_VREF_TUNE_MASK, 0x3));
 
 	/* transmitter HS crossover adjustement */
-	qcom_snps_eusb2_hsphy_write_mask(phy->base, USB_PHY_CFG_CTRL_8,
-					 PHY_CFG_TX_HS_XV_TUNE_MASK,
-					 FIELD_PREP(PHY_CFG_TX_HS_XV_TUNE_MASK, 0x0));
+	snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_CFG_CTRL_8,
+				    PHY_CFG_TX_HS_XV_TUNE_MASK,
+				    FIELD_PREP(PHY_CFG_TX_HS_XV_TUNE_MASK, 0x0));
 }
 
-static int qcom_eusb2_ref_clk_init(struct qcom_snps_eusb2_hsphy *phy)
+static int qcom_eusb2_ref_clk_init(struct snps_eusb2_hsphy *phy)
 {
 	unsigned long ref_clk_freq = clk_get_rate(phy->ref_clk);
 
 	switch (ref_clk_freq) {
 	case 19200000:
-		qcom_snps_eusb2_hsphy_write_mask(phy->base, USB_PHY_HS_PHY_CTRL_COMMON0,
-						 FSEL_MASK,
-						 FIELD_PREP(FSEL_MASK, FSEL_19_2_MHZ_VAL));
+		snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_HS_PHY_CTRL_COMMON0,
+					    FSEL_MASK,
+					    FIELD_PREP(FSEL_MASK, FSEL_19_2_MHZ_VAL));
 
-		qcom_snps_eusb2_hsphy_write_mask(phy->base, USB_PHY_CFG_CTRL_2,
-						 PHY_CFG_PLL_FB_DIV_7_0_MASK,
-						 DIV_7_0_19_2_MHZ_VAL);
+		snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_CFG_CTRL_2,
+					    PHY_CFG_PLL_FB_DIV_7_0_MASK,
+					    DIV_7_0_19_2_MHZ_VAL);
 
-		qcom_snps_eusb2_hsphy_write_mask(phy->base, USB_PHY_CFG_CTRL_3,
-						 PHY_CFG_PLL_FB_DIV_11_8_MASK,
-						 DIV_11_8_19_2_MHZ_VAL);
+		snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_CFG_CTRL_3,
+					    PHY_CFG_PLL_FB_DIV_11_8_MASK,
+					    DIV_11_8_19_2_MHZ_VAL);
 		break;
 
 	case 38400000:
-		qcom_snps_eusb2_hsphy_write_mask(phy->base, USB_PHY_HS_PHY_CTRL_COMMON0,
-						 FSEL_MASK,
-						 FIELD_PREP(FSEL_MASK, FSEL_38_4_MHZ_VAL));
+		snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_HS_PHY_CTRL_COMMON0,
+					    FSEL_MASK,
+					    FIELD_PREP(FSEL_MASK, FSEL_38_4_MHZ_VAL));
 
-		qcom_snps_eusb2_hsphy_write_mask(phy->base, USB_PHY_CFG_CTRL_2,
-						 PHY_CFG_PLL_FB_DIV_7_0_MASK,
-						 DIV_7_0_38_4_MHZ_VAL);
+		snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_CFG_CTRL_2,
+					    PHY_CFG_PLL_FB_DIV_7_0_MASK,
+					    DIV_7_0_38_4_MHZ_VAL);
 
-		qcom_snps_eusb2_hsphy_write_mask(phy->base, USB_PHY_CFG_CTRL_3,
-						 PHY_CFG_PLL_FB_DIV_11_8_MASK,
-						 DIV_11_8_38_4_MHZ_VAL);
+		snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_CFG_CTRL_3,
+					    PHY_CFG_PLL_FB_DIV_11_8_MASK,
+					    DIV_11_8_38_4_MHZ_VAL);
 		break;
 
 	default:
@@ -224,15 +224,15 @@ static int qcom_eusb2_ref_clk_init(struct qcom_snps_eusb2_hsphy *phy)
 		return -EINVAL;
 	}
 
-	qcom_snps_eusb2_hsphy_write_mask(phy->base, USB_PHY_CFG_CTRL_3,
-					 PHY_CFG_PLL_REF_DIV, PLL_REF_DIV_VAL);
+	snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_CFG_CTRL_3,
+				    PHY_CFG_PLL_REF_DIV, PLL_REF_DIV_VAL);
 
 	return 0;
 }
 
-static int qcom_snps_eusb2_hsphy_init(struct phy *p)
+static int snps_eusb2_hsphy_init(struct phy *p)
 {
-	struct qcom_snps_eusb2_hsphy *phy = phy_get_drvdata(p);
+	struct snps_eusb2_hsphy *phy = phy_get_drvdata(p);
 	int ret;
 
 	ret = regulator_bulk_enable(ARRAY_SIZE(phy->vregs), phy->vregs);
@@ -265,73 +265,73 @@ static int qcom_snps_eusb2_hsphy_init(struct phy *p)
 		goto disable_ref_clk;
 	}
 
-	qcom_snps_eusb2_hsphy_write_mask(phy->base, USB_PHY_CFG0,
-					 CMN_CTRL_OVERRIDE_EN, CMN_CTRL_OVERRIDE_EN);
+	snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_CFG0,
+				    CMN_CTRL_OVERRIDE_EN, CMN_CTRL_OVERRIDE_EN);
 
-	qcom_snps_eusb2_hsphy_write_mask(phy->base, USB_PHY_UTMI_CTRL5, POR, POR);
+	snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_UTMI_CTRL5, POR, POR);
 
-	qcom_snps_eusb2_hsphy_write_mask(phy->base, USB_PHY_HS_PHY_CTRL_COMMON0,
-					 PHY_ENABLE | RETENABLEN, PHY_ENABLE | RETENABLEN);
+	snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_HS_PHY_CTRL_COMMON0,
+				    PHY_ENABLE | RETENABLEN, PHY_ENABLE | RETENABLEN);
 
-	qcom_snps_eusb2_hsphy_write_mask(phy->base, USB_PHY_APB_ACCESS_CMD,
-					 APB_LOGIC_RESET, APB_LOGIC_RESET);
+	snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_APB_ACCESS_CMD,
+				    APB_LOGIC_RESET, APB_LOGIC_RESET);
 
-	qcom_snps_eusb2_hsphy_write_mask(phy->base, UTMI_PHY_CMN_CTRL0, TESTBURNIN, 0);
+	snps_eusb2_hsphy_write_mask(phy->base, QCOM_UTMI_PHY_CMN_CTRL0, TESTBURNIN, 0);
 
-	qcom_snps_eusb2_hsphy_write_mask(phy->base, USB_PHY_FSEL_SEL,
-					 FSEL_SEL, FSEL_SEL);
+	snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_FSEL_SEL,
+				    FSEL_SEL, FSEL_SEL);
 
 	/* update ref_clk related registers */
 	ret = qcom_eusb2_ref_clk_init(phy);
 	if (ret)
-		goto disable_ref_clk;
+		return ret;
 
-	qcom_snps_eusb2_hsphy_write_mask(phy->base, USB_PHY_CFG_CTRL_1,
-					 PHY_CFG_PLL_CPBIAS_CNTRL_MASK,
-					 FIELD_PREP(PHY_CFG_PLL_CPBIAS_CNTRL_MASK, 0x1));
+	snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_CFG_CTRL_1,
+				    PHY_CFG_PLL_CPBIAS_CNTRL_MASK,
+				    FIELD_PREP(PHY_CFG_PLL_CPBIAS_CNTRL_MASK, 0x1));
 
-	qcom_snps_eusb2_hsphy_write_mask(phy->base, USB_PHY_CFG_CTRL_4,
-					 PHY_CFG_PLL_INT_CNTRL_MASK,
-					 FIELD_PREP(PHY_CFG_PLL_INT_CNTRL_MASK, 0x8));
+	snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_CFG_CTRL_4,
+				    PHY_CFG_PLL_INT_CNTRL_MASK,
+				    FIELD_PREP(PHY_CFG_PLL_INT_CNTRL_MASK, 0x8));
 
-	qcom_snps_eusb2_hsphy_write_mask(phy->base, USB_PHY_CFG_CTRL_4,
-					 PHY_CFG_PLL_GMP_CNTRL_MASK,
-					 FIELD_PREP(PHY_CFG_PLL_GMP_CNTRL_MASK, 0x1));
+	snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_CFG_CTRL_4,
+				    PHY_CFG_PLL_GMP_CNTRL_MASK,
+				    FIELD_PREP(PHY_CFG_PLL_GMP_CNTRL_MASK, 0x1));
 
-	qcom_snps_eusb2_hsphy_write_mask(phy->base, USB_PHY_CFG_CTRL_5,
-					 PHY_CFG_PLL_PROP_CNTRL_MASK,
-					 FIELD_PREP(PHY_CFG_PLL_PROP_CNTRL_MASK, 0x10));
+	snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_CFG_CTRL_5,
+				    PHY_CFG_PLL_PROP_CNTRL_MASK,
+				    FIELD_PREP(PHY_CFG_PLL_PROP_CNTRL_MASK, 0x10));
 
-	qcom_snps_eusb2_hsphy_write_mask(phy->base, USB_PHY_CFG_CTRL_6,
-					 PHY_CFG_PLL_VCO_CNTRL_MASK,
-					 FIELD_PREP(PHY_CFG_PLL_VCO_CNTRL_MASK, 0x0));
+	snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_CFG_CTRL_6,
+				    PHY_CFG_PLL_VCO_CNTRL_MASK,
+				    FIELD_PREP(PHY_CFG_PLL_VCO_CNTRL_MASK, 0x0));
 
-	qcom_snps_eusb2_hsphy_write_mask(phy->base, USB_PHY_CFG_CTRL_5,
-					 PHY_CFG_PLL_VREF_TUNE_MASK,
-					 FIELD_PREP(PHY_CFG_PLL_VREF_TUNE_MASK, 0x1));
+	snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_CFG_CTRL_5,
+				    PHY_CFG_PLL_VREF_TUNE_MASK,
+				    FIELD_PREP(PHY_CFG_PLL_VREF_TUNE_MASK, 0x1));
 
-	qcom_snps_eusb2_hsphy_write_mask(phy->base, USB_PHY_HS_PHY_CTRL2,
-					 VBUS_DET_EXT_SEL, VBUS_DET_EXT_SEL);
+	snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_HS_PHY_CTRL2,
+				    VBUS_DET_EXT_SEL, VBUS_DET_EXT_SEL);
 
 	/* set default parameters */
 	qcom_eusb2_default_parameters(phy);
 
-	qcom_snps_eusb2_hsphy_write_mask(phy->base, USB_PHY_HS_PHY_CTRL2,
-					 USB2_SUSPEND_N_SEL | USB2_SUSPEND_N,
-					 USB2_SUSPEND_N_SEL | USB2_SUSPEND_N);
+	snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_HS_PHY_CTRL2,
+				    USB2_SUSPEND_N_SEL | USB2_SUSPEND_N,
+				    USB2_SUSPEND_N_SEL | USB2_SUSPEND_N);
 
-	qcom_snps_eusb2_hsphy_write_mask(phy->base, USB_PHY_UTMI_CTRL0, SLEEPM, SLEEPM);
+	snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_UTMI_CTRL0, SLEEPM, SLEEPM);
 
-	qcom_snps_eusb2_hsphy_write_mask(phy->base, USB_PHY_HS_PHY_CTRL_COMMON0,
-					 SIDDQ_SEL, SIDDQ_SEL);
+	snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_HS_PHY_CTRL_COMMON0,
+				    SIDDQ_SEL, SIDDQ_SEL);
 
-	qcom_snps_eusb2_hsphy_write_mask(phy->base, USB_PHY_HS_PHY_CTRL_COMMON0,
-					 SIDDQ, 0);
+	snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_HS_PHY_CTRL_COMMON0,
+				    SIDDQ, 0);
 
-	qcom_snps_eusb2_hsphy_write_mask(phy->base, USB_PHY_UTMI_CTRL5, POR, 0);
+	snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_UTMI_CTRL5, POR, 0);
 
-	qcom_snps_eusb2_hsphy_write_mask(phy->base, USB_PHY_HS_PHY_CTRL2,
-					 USB2_SUSPEND_N_SEL, 0);
+	snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_HS_PHY_CTRL2,
+				    USB2_SUSPEND_N_SEL, 0);
 
 	return 0;
 
@@ -344,9 +344,9 @@ static int qcom_snps_eusb2_hsphy_init(struct phy *p)
 	return ret;
 }
 
-static int qcom_snps_eusb2_hsphy_exit(struct phy *p)
+static int snps_eusb2_hsphy_exit(struct phy *p)
 {
-	struct qcom_snps_eusb2_hsphy *phy = phy_get_drvdata(p);
+	struct snps_eusb2_hsphy *phy = phy_get_drvdata(p);
 
 	clk_disable_unprepare(phy->ref_clk);
 
@@ -357,18 +357,18 @@ static int qcom_snps_eusb2_hsphy_exit(struct phy *p)
 	return 0;
 }
 
-static const struct phy_ops qcom_snps_eusb2_hsphy_ops = {
-	.init		= qcom_snps_eusb2_hsphy_init,
-	.exit		= qcom_snps_eusb2_hsphy_exit,
-	.set_mode	= qcom_snps_eusb2_hsphy_set_mode,
+static const struct phy_ops snps_eusb2_hsphy_ops = {
+	.init		= snps_eusb2_hsphy_init,
+	.exit		= snps_eusb2_hsphy_exit,
+	.set_mode	= snps_eusb2_hsphy_set_mode,
 	.owner		= THIS_MODULE,
 };
 
-static int qcom_snps_eusb2_hsphy_probe(struct platform_device *pdev)
+static int snps_eusb2_hsphy_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node;
-	struct qcom_snps_eusb2_hsphy *phy;
+	struct snps_eusb2_hsphy *phy;
 	struct phy_provider *phy_provider;
 	struct phy *generic_phy;
 	int ret, i;
@@ -405,7 +405,7 @@ static int qcom_snps_eusb2_hsphy_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(phy->repeater),
 				     "failed to get repeater\n");
 
-	generic_phy = devm_phy_create(dev, NULL, &qcom_snps_eusb2_hsphy_ops);
+	generic_phy = devm_phy_create(dev, NULL, &snps_eusb2_hsphy_ops);
 	if (IS_ERR(generic_phy)) {
 		dev_err(dev, "failed to create phy %d\n", ret);
 		return PTR_ERR(generic_phy);
@@ -418,25 +418,25 @@ static int qcom_snps_eusb2_hsphy_probe(struct platform_device *pdev)
 	if (IS_ERR(phy_provider))
 		return PTR_ERR(phy_provider);
 
-	dev_info(dev, "Registered Qcom-eUSB2 phy\n");
+	dev_info(dev, "Registered Snps-eUSB2 phy\n");
 
 	return 0;
 }
 
-static const struct of_device_id qcom_snps_eusb2_hsphy_of_match_table[] = {
+static const struct of_device_id snps_eusb2_hsphy_of_match_table[] = {
 	{ .compatible = "qcom,sm8550-snps-eusb2-phy", },
 	{ },
 };
-MODULE_DEVICE_TABLE(of, qcom_snps_eusb2_hsphy_of_match_table);
+MODULE_DEVICE_TABLE(of, snps_eusb2_hsphy_of_match_table);
 
-static struct platform_driver qcom_snps_eusb2_hsphy_driver = {
-	.probe		= qcom_snps_eusb2_hsphy_probe,
+static struct platform_driver snps_eusb2_hsphy_driver = {
+	.probe		= snps_eusb2_hsphy_probe,
 	.driver = {
-		.name	= "qcom-snps-eusb2-hsphy",
-		.of_match_table = qcom_snps_eusb2_hsphy_of_match_table,
+		.name	= "snps-eusb2-hsphy",
+		.of_match_table = snps_eusb2_hsphy_of_match_table,
 	},
 };
 
-module_platform_driver(qcom_snps_eusb2_hsphy_driver);
-MODULE_DESCRIPTION("Qualcomm SNPS eUSB2 HS PHY driver");
+module_platform_driver(snps_eusb2_hsphy_driver);
+MODULE_DESCRIPTION("Synopsys eUSB2 HS PHY driver");
 MODULE_LICENSE("GPL");
-- 
2.43.0


