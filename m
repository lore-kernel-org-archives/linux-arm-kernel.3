Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F4ADCCD184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 15:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nDj3ECZvGhO87X2x0sK6CPlVQ1x93vEAeNy8nF85d1o=; b=mqFQbywQoDio5yMA4LnEiBNzmr
	hrpBnwsQlozFNFGsk4srlwyjQc0bF8hfhyq7HbAtcpVZ+XpRUHUwNcQAhbxGJE51XS3ZJo3mQaTs6
	WzCqOQWrvPUGTBwuiUNJQ1YePbH72OnRaK1TrLX8Z8g6P5iH64spgO7NO7ccNr4BAytLBwlRtyerU
	tSLhK9J+L6B6nRM3LQ5n5pk7WKuGVM0MsxduvJ0X6cu15hdKcF+UvD1jFEe5kdPsf7V5DfbaEWzAj
	gPCZ59h+oerHVYTsYqVY2IFDlltj07+6h042TsOCVTodN5vClHa3MP+E890DomRSsH1AMCDqI4EUw
	Ds/Bn0Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBECg-0000000HU4U-3Qod;
	Tue, 21 Oct 2025 15:23:14 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBECe-0000000HTzt-08xH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Oct 2025 15:23:13 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-b48d8deaef9so1122326566b.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Oct 2025 08:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761060190; x=1761664990; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nDj3ECZvGhO87X2x0sK6CPlVQ1x93vEAeNy8nF85d1o=;
        b=MRhxRkj4m0l6tndPSoODX/Arj391bCOv4KU6yWvvOixT1SDJflnEF6q/sija2qS07x
         zwifzL4GT5Wm+6RSuasNfLDdyv+PcONDQKCmrW9003eQQwmvfShP6o2e1gzQkyCR2A23
         XL/8RVkr8PkApO/XCLaBm4S80jlbbjX2OzXYC2QsaiWgj0diaZFmZrlFjpYjk1nj3LVO
         jdtwqZ4+7DJjLVILwAIBPBQDn6ONavm5Ca5OspjEmw8NulX++o4gQcnqdvcb4ZVhqzgJ
         M6NoPyclP/qchWVZ7y1TMC/jI6yi3EQn7wANcMuOYb5yFIP/fVu/WCaK9F1Ci98D3JmC
         d3KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761060190; x=1761664990;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nDj3ECZvGhO87X2x0sK6CPlVQ1x93vEAeNy8nF85d1o=;
        b=kAWIOzg+mq/8m7BhP+rdKgkWrLk01jeUmKSOFxDg+IGrfU/HbJW4v6o83YnSLhQK7u
         h/TlrkpqZRS26oV15Ht8KjpNx7flvAaju3QX1AN6w3Kg8szjJmhROu0yxcGxLBzOdkXX
         MfJrBZGWbu/HXcXYuooik1ROIrcsDw4MuFrYnAvw5oJW1VPSIxbjIn336yb++/TWwdDT
         H/OhW+Aq8YUiHwoe9air+xDB9WUD9ANTaZzEMBAo0XR/TMpacs+NPnetmftWKV4sz47L
         +JrMZtasD0YL5JyJfu31YHVYo5H/yHI+WrngqT9C5ibz9CJT20sT+biZCtefXbkSTVxE
         xlwQ==
X-Forwarded-Encrypted: i=1; AJvYcCXW71iYFfd9ctvolyh874WKJdPVfKx7I3Kn55WyRPUMviCH4zQpWybKOFoeXOM21eV9NdBg5GcwDjnit9nx6Qc/@lists.infradead.org
X-Gm-Message-State: AOJu0YwyvvIm/UVXr36fa3ScNaS+I3wBDu7Pf2x1+ZHzpPQt+pm753qw
	KZ6Tj3YevOcSmppANHH2nmIivgQSM4Ji4YBIx2lurw0ouLuYNyk2IBd3
X-Gm-Gg: ASbGncsiCgZLsPAlnRBzPRG0sGFVencmMlJdJTVCfjDD3QRYmsUiUxSzcPedDbYHhZ4
	F/CjfeWe1uY5L/gIS7Wi1jwt2xgGWOslv8uCnxk3z6ndzLoVdooylEDHBVuJsuzXPPWUS5wXyNh
	D/EY7L120yzc4g9J9VyNxUHPy2FYj3fLxJw6vZo4o4kuTDTRVwFYZuGn3nDZPQT3rj7akULTsaA
	He/P9UHq9BVRfKleFx0LS9IKvm1UmwgN/WOgiegSLPin/nO67FE1g21GFOZcmJdFdzuJhS+QDXq
	+nbDTkQtBNzAI+uWxwUbpppovDlKtDXuIObDtBa7+/5DxaVy0EM1m0rkCsH5jhW7MN88npF7Ao4
	x4FZ07oWPtN0Q16t6SnCnbLOPJKrTMyP8ei/QuhpAjNh1baRcyCkoOhgR8eEKTRRUDMDevqnOOA
	wEtCceNu57fHiYq0xQCcPxa05rF1nMVmbShklz0A==
X-Google-Smtp-Source: AGHT+IEpytNOEQt+J8yOVwE7tliyy/C42TnWv+wFLdWTQQ5Wh/eoDy2mY56x2p4z2YBP4D34UCBrnA==
X-Received: by 2002:a17:907:5c9:b0:b04:25ae:6c76 with SMTP id a640c23a62f3a-b6473f3feeamr1872558166b.47.1761060190303;
        Tue, 21 Oct 2025 08:23:10 -0700 (PDT)
Received: from tearch (pc142.ds2-s.us.edu.pl. [155.158.56.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65e8581780sm1082737866b.31.2025.10.21.08.23.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 08:23:10 -0700 (PDT)
From: muhammed.efecetin.67@gmail.com
X-Google-Original-From: muhammed.efecetin67@gmail.com
To: linux-rockchip@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	heiko@sntech.de,
	neil.armstrong@linaro.org,
	lee@kernel.org,
	rafael@kernel.org,
	efectn@protonmail.com,
	daniel.lezcano@linaro.org
Subject: [PATCH v3 3/5] mfd: add Khadas Edge 2 registers to khadas-mcu.
Date: Tue, 21 Oct 2025 17:22:43 +0200
Message-ID: <adbd6dd5e9ed938bab7927597b7f21eca3274b78.1761059314.git.efectn@protonmail.com>
X-Mailer: git-send-email 2.51.1.dirty
In-Reply-To: <cover.1761059314.git.efectn@protonmail.com>
References: <cover.1761059314.git.efectn@protonmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_082312_140741_C2DBAC92 
X-CRM114-Status: GOOD (  17.25  )
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

From: Muhammed Efe Cetin <efectn@protonmail.com>

Add Khadas Edge 2 MCU registers to khadas-mcu.h with KHADAS_MCU_EDGE2 register.
New "khadas,mcu-edge2" compatible added as it is quite different compared to older MCU variants
and there are no way to distinguish them using any register.

Signed-off-by: Muhammed Efe Cetin <efectn@protonmail.com>
---
 drivers/mfd/khadas-mcu.c       | 47 +++++++++++++++++++++++++++++++---
 include/linux/mfd/khadas-mcu.h | 32 +++++++++++++++++++++++
 2 files changed, 76 insertions(+), 3 deletions(-)

diff --git a/drivers/mfd/khadas-mcu.c b/drivers/mfd/khadas-mcu.c
index ca4bd6cf56994..8898f5ab6915a 100644
--- a/drivers/mfd/khadas-mcu.c
+++ b/drivers/mfd/khadas-mcu.c
@@ -32,6 +32,20 @@ static bool khadas_mcu_reg_volatile(struct device *dev, unsigned int reg)
 	}
 }
 
+static bool khadas_mcu_reg_volatile_edge2(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case KHADAS_MCU_EDGE2_SLEEP_EN_REG:
+	case KHADAS_MCU_EDGE2_LED_ON_RAM_REG:
+	case KHADAS_MCU_EDGE2_FAN_CTRL_REG:
+	case KHADAS_MCU_EDGE2_WDT_EN_REG:
+	case KHADAS_MCU_EDGE2_SYS_RST_REG:
+		return true;
+	default:
+		return false;
+	}
+}
+
 static bool khadas_mcu_reg_writeable(struct device *dev, unsigned int reg)
 {
 	switch (reg) {
@@ -65,6 +79,17 @@ static bool khadas_mcu_reg_writeable(struct device *dev, unsigned int reg)
 	}
 }
 
+static bool khadas_mcu_reg_writeable_edge2(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case KHADAS_MCU_EDGE2_VERSION1_REG:
+	case KHADAS_MCU_EDGE2_VERSION2_REG:
+		return false;
+	default:
+		return true;
+	}
+}
+
 static const struct regmap_config khadas_mcu_regmap_config = {
 	.reg_bits	= 8,
 	.reg_stride	= 1,
@@ -75,8 +100,18 @@ static const struct regmap_config khadas_mcu_regmap_config = {
 	.cache_type	= REGCACHE_MAPLE,
 };
 
+static const struct regmap_config khadas_mcu_regmap_config_edge2 = {
+	.reg_bits	= 8,
+	.reg_stride	= 1,
+	.val_bits	= 8,
+	.max_register	= KHADAS_MCU_EDGE2_SYS_RST_REG,
+	.volatile_reg	= khadas_mcu_reg_volatile_edge2,
+	.writeable_reg	= khadas_mcu_reg_writeable_edge2,
+	.cache_type	= REGCACHE_MAPLE,
+};
+
 static struct mfd_cell khadas_mcu_fan_cells[] = {
-	/* VIM1/2 Rev13+ and VIM3 only */
+	/* VIM1/2 Rev13+, VIM3 and Edge2 only */
 	{ .name = "khadas-mcu-fan-ctrl", },
 };
 
@@ -84,6 +119,7 @@ static int khadas_mcu_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
 	struct khadas_mcu *ddata;
+	const struct regmap_config *regmap_config;
 	int ret;
 
 	ddata = devm_kzalloc(dev, sizeof(*ddata), GFP_KERNEL);
@@ -94,7 +130,11 @@ static int khadas_mcu_probe(struct i2c_client *client)
 
 	ddata->dev = dev;
 
-	ddata->regmap = devm_regmap_init_i2c(client, &khadas_mcu_regmap_config);
+	regmap_config = of_device_get_match_data(dev);
+	if (!regmap_config)
+		return -EINVAL;
+
+	ddata->regmap = devm_regmap_init_i2c(client, regmap_config);
 	if (IS_ERR(ddata->regmap)) {
 		ret = PTR_ERR(ddata->regmap);
 		dev_err(dev, "Failed to allocate register map: %d\n", ret);
@@ -112,7 +152,8 @@ static int khadas_mcu_probe(struct i2c_client *client)
 
 #ifdef CONFIG_OF
 static const struct of_device_id khadas_mcu_of_match[] = {
-	{ .compatible = "khadas,mcu", },
+	{ .compatible = "khadas,mcu", .data = &khadas_mcu_regmap_config },
+	{ .compatible = "khadas,mcu-edge2", .data = &khadas_mcu_regmap_config_edge2 },
 	{},
 };
 MODULE_DEVICE_TABLE(of, khadas_mcu_of_match);
diff --git a/include/linux/mfd/khadas-mcu.h b/include/linux/mfd/khadas-mcu.h
index a99ba2ed0e4e0..e278326451df6 100644
--- a/include/linux/mfd/khadas-mcu.h
+++ b/include/linux/mfd/khadas-mcu.h
@@ -10,6 +10,7 @@
 #ifndef MFD_KHADAS_MCU_H
 #define MFD_KHADAS_MCU_H
 
+/* Registers used by Khadas VIM2 rev14 and VIM3 */
 #define KHADAS_MCU_PASSWD_VEN_0_REG		0x00 /* RO */
 #define KHADAS_MCU_PASSWD_VEN_1_REG		0x01 /* RO */
 #define KHADAS_MCU_PASSWD_VEN_2_REG		0x02 /* RO */
@@ -70,12 +71,43 @@
 #define KHADAS_MCU_WOL_INIT_START_REG		0x87 /* WO */
 #define KHADAS_MCU_CMD_FAN_STATUS_CTRL_REG	0x88 /* WO */
 
+/* Registers used by Khadas Edge 2 */
+#define KHADAS_MCU_EDGE2_VERSION1_REG             0x12  /* RO */
+#define KHADAS_MCU_EDGE2_VERSION2_REG             0x13  /* RO */
+#define KHADAS_MCU_EDGE2_BOOT_MODE_REG            0x20  /* RW */
+#define KHADAS_MCU_EDGE2_BOOT_EN_DCIN_REG         0x21  /* RW */
+#define KHADAS_MCU_EDGE2_BOOT_EN_RTC_REG          0x22  /* RW */
+#define KHADAS_MCU_EDGE2_LED_MODE_ON_REG          0x23  /* RW */
+#define KHADAS_MCU_EDGE2_LED_MODE_OFF_REG         0x24  /* RW */
+#define KHADAS_MCU_EDGE2_RGB_ON_R_REG             0x25  /* RW */
+#define KHADAS_MCU_EDGE2_RGB_ON_G_REG             0x26  /* RW */
+#define KHADAS_MCU_EDGE2_RGB_ON_B_REG             0x27  /* RW */
+#define KHADAS_MCU_EDGE2_RGB_OFF_R_REG            0x28  /* RW */
+#define KHADAS_MCU_EDGE2_RGB_OFF_G_REG            0x29  /* RW */
+#define KHADAS_MCU_EDGE2_RGB_OFF_B_REG            0x2A  /* RW */
+#define KHADAS_MCU_EDGE2_REST_CONF_REG            0x2C  /* WO */
+#define KHADAS_MCU_EDGE2_SLEEP_EN_REG             0x2E  /* RW */
+#define KHADAS_MCU_EDGE2_BOOT_EN_IR_REG           0x2F  /* RW */
+#define KHADAS_MCU_EDGE2_IR1_CUST1_REG            0x30  /* RW */
+#define KHADAS_MCU_EDGE2_IR1_CUST2_REG            0x31  /* RW */
+#define KHADAS_MCU_EDGE2_IR1_ORDER1_REG           0x32  /* RW */
+#define KHADAS_MCU_EDGE2_IR1_ORDER2_REG           0x33  /* RW */
+#define KHADAS_MCU_EDGE2_IR2_CUST1_REG            0x34  /* RW */
+#define KHADAS_MCU_EDGE2_IR2_CUST2_REG            0x35  /* RW */
+#define KHADAS_MCU_EDGE2_IR2_ORDER1_REG           0x36  /* RW */
+#define KHADAS_MCU_EDGE2_IR2_ORDER2_REG           0x37  /* RW */
+#define KHADAS_MCU_EDGE2_LED_ON_RAM_REG           0x89  /* WO */
+#define KHADAS_MCU_EDGE2_FAN_CTRL_REG             0x8A  /* WO */
+#define KHADAS_MCU_EDGE2_WDT_EN_REG               0x8B  /* WO */
+#define KHADAS_MCU_EDGE2_SYS_RST_REG              0x91  /* WO */
+
 enum {
 	KHADAS_BOARD_VIM1 = 0x1,
 	KHADAS_BOARD_VIM2,
 	KHADAS_BOARD_VIM3,
 	KHADAS_BOARD_EDGE = 0x11,
 	KHADAS_BOARD_EDGE_V,
+	KHADAS_BOARD_EDGE2,
 };
 
 /**
-- 
2.51.1.dirty


