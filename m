Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44E79C02183
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jan 2025 16:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+iaEPWMKySKJW9kDwczkfvhJPBLSobdLT8Wpyt/eu+s=; b=2N39hbDUq4W6CEGF9LHl7Ajae+
	zR2d2pCprQSG+fzRFsf/lfP2z/v6fI8Gbn/WmJSTZSjUk+nmuOnJv43SEOlgGYx+3DMTZnuoz0u26
	xinIdlNmwSGYL0GGHn5Dav7rdumCYuc75U8k/lPDQOr+LqVxQ8H1kG6X4lO40tftcNpct4IIPRmWr
	dDJCyQfneLqxrznOCtd9YlPo/IQEumTpNcL7USp14gS9s9RGBUydA14sjDS16UgQDcQWxmjAmTB9+
	ZtBfTxST82SyeQaTKXNRZG1cH6HgRD/5w2CHE5SYI+2j8hxGrpJG9CcWn3CfhfUWL1WV0owCXVdab
	6m3NWkYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYomq-00000000ha6-0Pvc;
	Fri, 17 Jan 2025 16:01:32 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYokK-00000000h0l-2BQc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jan 2025 15:58:58 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4361c705434so15625315e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jan 2025 07:58:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1737129535; x=1737734335; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+iaEPWMKySKJW9kDwczkfvhJPBLSobdLT8Wpyt/eu+s=;
        b=iV9h8vcq/r5Y9L8Y4FauEfnNomkb6TdtRj2rH91sET3LFVyXdRhwcwfrrAzCfPVKsH
         rm8P8z73CfF7NT5gAnH1++UCrb4SSSDmOyzqOSAKWZ3Hsk0fOopNiou29RKhGDdI5S+b
         9ri/A+uFXFLDi1eOiX8scPjbHbPngOH+btcTiDihL1U4Z4qq0ppb190+x2x3i/JoDr9R
         B2t3CQHutSGBOAyb6QTlckSLopJx9F/3jaiQDbSZvrN2wcTtcHgLEhBGpEBABfUSkvfr
         X8kXqs1BP9Cpzy102xH5/ctoOSwEtuK9mrqyilwXAvwtDtppsHDXyXmvOuXBauf2DuvH
         GdxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737129535; x=1737734335;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+iaEPWMKySKJW9kDwczkfvhJPBLSobdLT8Wpyt/eu+s=;
        b=G5xiEdndl13c5xsHzorc4R1w9vpHM52Lv/Sn5CFVpOEXZFwBwU9rHHDsbHzbZDU3+I
         yS1U5Cv8JJytWG/ILCqjZKPh5t1o6BFhmXvJIO8cAIHX6H4IyTUNtiLoHa/1sfZ1V5tN
         5H+CsvooNlERCXtduUiwVpGuRnbVwh9uEZ4fbUzOAe6Sc5/EzPmvGFoCME/3s0oVzqjt
         fH2sM3zWOL6O1X/lwJTN+xRj7pEgPPzYmdR7ny92csX9VPyzurQW0uLXC9N5O3arV2ZA
         277w40T/oM3dLECPuBfhmQeryOVVfngmS0pzYuqma0KW7TUSIVCvHgIqUggLHCvkP9ao
         TdGQ==
X-Forwarded-Encrypted: i=1; AJvYcCXDsw1IQ4oJJ23L5QyohFtmfrwmBX9QbqxZbRuN0Yn5CD6TrYwaERz5FSWftknrhcYDPDj75PO3dZe4UWQW48bl@lists.infradead.org
X-Gm-Message-State: AOJu0YwTAewk/joGXZjrUP8lZM46GigEnw3EKh17rPj4JxRy9GRH4A0D
	Bhep4cBrh22md3lwGKKImmAeq/akOCiZ9Fk1wdP6bS5ZMvX1zvESyi8S//llgN4=
X-Gm-Gg: ASbGncuQn9EZbmeHL0ZImxhmMvO4fgeDAIGIbjz/bZDX+5epTDzU39mZ+V0DVi8k9fB
	ceALXYiu/esCBafrUXmVs1bFUYImizaWWoDxIjSIdaG8l9aozb8ggtECljs8OOaIXR9l9v0GnDV
	obnN06Ge2V/rPNwyZ18wtUdBrCZrBHVhY3Ay3/B1SBRZAnLTXf5cvk+5wWaydjUH7SBTT1pX/j1
	s2VatV2Q+t2vR4/zSSxhoXA4S1mqVShEsXSYE8tIz2w8k51f5oHqB/hOIuhnDFx078tTEY=
X-Google-Smtp-Source: AGHT+IGWfn2Yq8vv6CxpDXWXFAYXomXmGRAk312FTbV8uMFgrviMgEzZA2n2RwjkLe9DmwMhMJ2jwQ==
X-Received: by 2002:a05:600c:4c24:b0:434:f3a1:b214 with SMTP id 5b1f17b1804b1-4389da1e6c7mr14988805e9.28.1737129534746;
        Fri, 17 Jan 2025 07:58:54 -0800 (PST)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:b019:599d:2d51:f3c7])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-437c7528076sm99382195e9.25.2025.01.17.07.58.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 07:58:54 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Fri, 17 Jan 2025 16:58:30 +0100
Subject: [PATCH v2 1/4] clk: add a clk_hw helpers to get the clock device
 or device_node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250117-amlogic-clk-drop-clk-regmap-tables-v2-1-d1f77cb0773e@baylibre.com>
References: <20250117-amlogic-clk-drop-clk-regmap-tables-v2-0-d1f77cb0773e@baylibre.com>
In-Reply-To: <20250117-amlogic-clk-drop-clk-regmap-tables-v2-0-d1f77cb0773e@baylibre.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=10126; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=b1O2zWle8XhB/rVK9m1uUY0QJofv1CyYqAZcv/Y8Qok=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBnin45A176rtxslHDs+QCelzmmxY1RX+XGUvhoo
 9jwh5/Os9uJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZ4p+OQAKCRDm/A8cN/La
 hQx+EACgNgB6FWaBL5hKrml5JR/LSe05fbeTkb4OE4KB1tdx1/ahdpKJF1V7FVdAC7D9w/hhyj/
 oRYK0QBpokYiSDYCqg1VTHu3DCSx6FO3s458MC5pbI6WJi6WW5xqXvU9uK43B1rpXlS8atGOoEX
 7Wcs2zX1CZfi4Lr3X1d8IcHPI85ChrU/IGY5fMxr23/wMUuTPw2cQr9vbw4m9NHScbjWnMklpvV
 cEyBJwrQgmaEhSVyjRsEW5nkqO1xULrfNULs7wwKiRbjX/xryRl1MHvL+hjR3V1T6rtVUGEW7ct
 WTLbSNS/0OvVLy4G01Lh94Yr8BrUQq1y6FGjQ8DAe5t9kUH0UO8B5DXDP5ubh3G/m0mGs6w13R6
 qn2MnD9I1AZqK9WLnOthcCTc1LP1rzRfLwQvk39O1mrrPH4N1OiA7khNC0VuR8ZVw6SdnFem3U/
 TDUuDK6DRjVF/oGTYNwejhhAkQXn9sTr0aoWFldVkFwqJkT2HuprFAgKZb4gurMxRjeguzzzEEG
 XjOXhYwFwsXxSzmm+/p8rcDVHS/jbtU3B1VrRpTnM7OvtbAAy43CmQHZSDN0e/TKrV4QgKTbsN1
 7bC/wQGYHlvAQM9r2zeuaSGsyMqwukbdIOWPQAzGxNJ4Xu+jLI1PN+2YvRVGOV7zDgCShpVW0+/
 BH7ZHwdqbqjst8A==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250117_075856_566979_E54B2D12 
X-CRM114-Status: GOOD (  27.48  )
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

Add helpers to get the device or device_node associated with clk_hw.

This can be used by clock drivers to access various device related
functionality such as devres, dev_ prints, etc ...

Add test for these new helpers in clk-test.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/Makefile                    |   1 +
 drivers/clk/clk.c                       |  33 +++++++++
 drivers/clk/clk_test.c                  | 116 +++++++++++++++++++++++++++-----
 drivers/clk/kunit_clk_dummy_device.dtso |  10 +++
 include/linux/clk-provider.h            |   2 +
 5 files changed, 145 insertions(+), 17 deletions(-)

diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index bf4bd45adc3a0ed8c9dc699c76f303dc91b524c4..b38ec888a449249340cd1ef147a774361558af3c 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -18,6 +18,7 @@ clk-test-y			:= clk_test.o \
 				   kunit_clk_assigned_rates_without_consumer.dtbo.o \
 				   kunit_clk_assigned_rates_zero.dtbo.o \
 				   kunit_clk_assigned_rates_zero_consumer.dtbo.o \
+				   kunit_clk_dummy_device.dtbo.o \
 				   kunit_clk_parent_data_test.dtbo.o
 obj-$(CONFIG_COMMON_CLK)	+= clk-divider.o
 obj-$(CONFIG_COMMON_CLK)	+= clk-fixed-factor.o
diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 9b45fa005030f56e1478b9742715ebcde898133f..726f63ecc3758538a75dc4e7b3783ccf66029db1 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -365,6 +365,39 @@ const char *clk_hw_get_name(const struct clk_hw *hw)
 }
 EXPORT_SYMBOL_GPL(clk_hw_get_name);
 
+/**
+ * clk_hw_get_dev - get device from an hardware clock.
+ * @hw: the clk_hw pointer to get the struct device from
+ *
+ * This is an helper to get the struct device associated with an hardware
+ * clock. Some clock, such as with early clock constroller, may not be
+ * associated with any struct device.
+ *
+ * Return: the struct device associated with the clock, or NULL if there
+ * is none.
+ */
+struct device *clk_hw_get_dev(const struct clk_hw *hw)
+{
+	return hw->core->dev;
+}
+EXPORT_SYMBOL_GPL(clk_hw_get_dev);
+
+/**
+ * clk_hw_get_of_node - get device_node from an hardware clock.
+ * @hw: the clk_hw pointer to get the struct device_node from
+ *
+ * This is an helper to get the struct device_node associated with an
+ * hardware clock.
+ *
+ * Return: the struct device associated with the clock, or NULL if there
+ * is none.
+ */
+struct device_node *clk_hw_get_of_node(const struct clk_hw *hw)
+{
+	return hw->core->of_node;
+}
+EXPORT_SYMBOL_GPL(clk_hw_get_of_node);
+
 struct clk_hw *__clk_get_hw(struct clk *clk)
 {
 	return !clk ? NULL : clk->core->hw;
diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
index f08feeaa3750bc86859294650de298762dea690a..4dcdde283598b7f940c653ebc0d5a5f4c27637a2 100644
--- a/drivers/clk/clk_test.c
+++ b/drivers/clk/clk_test.c
@@ -2794,43 +2794,40 @@ static struct kunit_suite clk_register_clk_parent_data_of_suite = {
 };
 
 /**
- * struct clk_register_clk_parent_data_device_ctx - Context for clk_parent_data device tests
+ * struct clk_register_device_ctx - Context for clock device tests
  * @dev: device of clk under test
  * @hw: clk_hw for clk under test
  * @pdrv: driver to attach to find @dev
  */
-struct clk_register_clk_parent_data_device_ctx {
+struct clk_register_device_ctx {
 	struct device *dev;
 	struct clk_hw hw;
 	struct platform_driver pdrv;
 };
 
-static inline struct clk_register_clk_parent_data_device_ctx *
-clk_register_clk_parent_data_driver_to_test_context(struct platform_device *pdev)
+static inline struct clk_register_device_ctx *
+clk_register_device_to_test_context(struct platform_device *pdev)
 {
 	return container_of(to_platform_driver(pdev->dev.driver),
-			    struct clk_register_clk_parent_data_device_ctx, pdrv);
+			    struct clk_register_device_ctx, pdrv);
 }
 
-static int clk_register_clk_parent_data_device_probe(struct platform_device *pdev)
+static int clk_register_device_probe(struct platform_device *pdev)
 {
-	struct clk_register_clk_parent_data_device_ctx *ctx;
+	struct clk_register_device_ctx *ctx;
 
-	ctx = clk_register_clk_parent_data_driver_to_test_context(pdev);
+	ctx = clk_register_device_to_test_context(pdev);
 	ctx->dev = &pdev->dev;
 
 	return 0;
 }
 
-static void clk_register_clk_parent_data_device_driver(struct kunit *test)
+static void clk_register_of_device_driver(struct kunit *test,
+					  const struct of_device_id *match_table)
 {
-	struct clk_register_clk_parent_data_device_ctx *ctx = test->priv;
-	static const struct of_device_id match_table[] = {
-		{ .compatible = "test,clk-parent-data" },
-		{ }
-	};
+	struct clk_register_device_ctx *ctx = test->priv;
 
-	ctx->pdrv.probe = clk_register_clk_parent_data_device_probe;
+	ctx->pdrv.probe = clk_register_device_probe;
 	ctx->pdrv.driver.of_match_table = match_table;
 	ctx->pdrv.driver.name = __func__;
 	ctx->pdrv.driver.owner = THIS_MODULE;
@@ -2839,6 +2836,16 @@ static void clk_register_clk_parent_data_device_driver(struct kunit *test)
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx->dev);
 }
 
+static void clk_register_clk_parent_data_device_driver(struct kunit *test)
+{
+	static const struct of_device_id match_table[] = {
+		{ .compatible = "test,clk-parent-data" },
+		{ }
+	};
+
+	clk_register_of_device_driver(test, match_table);
+}
+
 static const struct clk_register_clk_parent_data_test_case
 clk_register_clk_parent_data_device_cases[] = {
 	{
@@ -2909,7 +2916,7 @@ KUNIT_ARRAY_PARAM(clk_register_clk_parent_data_device_test,
  */
 static void clk_register_clk_parent_data_device_test(struct kunit *test)
 {
-	struct clk_register_clk_parent_data_device_ctx *ctx;
+	struct clk_register_device_ctx *ctx;
 	const struct clk_register_clk_parent_data_test_case *test_param;
 	struct clk_hw *parent_hw;
 	struct clk_init_data init = { };
@@ -3016,7 +3023,7 @@ KUNIT_ARRAY_PARAM(clk_register_clk_parent_data_device_hw_test,
  */
 static void clk_register_clk_parent_data_device_hw_test(struct kunit *test)
 {
-	struct clk_register_clk_parent_data_device_ctx *ctx;
+	struct clk_register_device_ctx *ctx;
 	const struct clk_register_clk_parent_data_test_case *test_param;
 	struct clk_dummy_context *parent;
 	struct clk_hw *parent_hw;
@@ -3077,6 +3084,80 @@ static struct kunit_suite clk_register_clk_parent_data_device_suite = {
 	.test_cases = clk_register_clk_parent_data_device_test_cases,
 };
 
+static void clk_register_dummy_device_driver(struct kunit *test)
+{
+	static const struct of_device_id match_table[] = {
+		{ .compatible = "test,clk-dummy-device" },
+		{ }
+	};
+
+	clk_register_of_device_driver(test, match_table);
+}
+
+/*
+ * Test that a clk registered with a struct device can provide back the
+ * struct device it was registered with.
+ */
+static void clk_hw_get_dev_test(struct kunit *test)
+{
+	struct clk_register_device_ctx *ctx;
+
+	ctx = kunit_kzalloc(test, sizeof(*ctx), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
+	test->priv = ctx;
+
+	clk_register_dummy_device_driver(test);
+	ctx->hw.init = CLK_HW_INIT_NO_PARENT("test_get_dev",
+					     &clk_dummy_rate_ops, 0);
+
+	KUNIT_ASSERT_EQ(test, 0, clk_hw_register_kunit(test, ctx->dev, &ctx->hw));
+	KUNIT_EXPECT_PTR_EQ(test, ctx->dev, clk_hw_get_dev(&ctx->hw));
+}
+
+/*
+ * Test that a clk registered with a struct device_node can provide back the
+ * struct device_node it was registered with.
+ */
+static void clk_hw_get_of_node_test(struct kunit *test)
+{
+	struct device_node *np;
+	struct clk_hw *hw;
+
+	hw = kunit_kzalloc(test, sizeof(*hw), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, hw);
+
+	np = of_find_compatible_node(NULL, NULL, "test,clk-dummy-device");
+	hw->init = CLK_HW_INIT_NO_PARENT("test_get_of_node",
+					 &clk_dummy_rate_ops, 0);
+	of_node_put_kunit(test, np);
+
+	KUNIT_ASSERT_EQ(test, 0, of_clk_hw_register_kunit(test, np, hw));
+	KUNIT_EXPECT_PTR_EQ(test, np, clk_hw_get_of_node(hw));
+}
+
+static struct kunit_case clk_hw_test_cases[] = {
+	KUNIT_CASE(clk_hw_get_dev_test),
+	KUNIT_CASE(clk_hw_get_of_node_test),
+	{}
+};
+
+static int clk_hw_test_init(struct kunit *test)
+{
+	KUNIT_ASSERT_EQ(test, 0,
+			of_overlay_apply_kunit(test, kunit_clk_dummy_device));
+
+	return 0;
+}
+
+/*
+ * Test suite to verify the sanity clk_hw helper functions.
+ */
+static struct kunit_suite clk_hw_test_suite = {
+	.name = "clk_hw_test_suite",
+	.init = clk_hw_test_init,
+	.test_cases = clk_hw_test_cases,
+};
+
 struct clk_assigned_rates_context {
 	struct clk_dummy_context clk0;
 	struct clk_dummy_context clk1;
@@ -3399,6 +3480,7 @@ kunit_test_suites(
 	&clk_assigned_rates_suite,
 	&clk_leaf_mux_set_rate_parent_test_suite,
 	&clk_test_suite,
+	&clk_hw_test_suite,
 	&clk_multiple_parents_mux_test_suite,
 	&clk_mux_no_reparent_test_suite,
 	&clk_mux_notifier_test_suite,
diff --git a/drivers/clk/kunit_clk_dummy_device.dtso b/drivers/clk/kunit_clk_dummy_device.dtso
new file mode 100644
index 0000000000000000000000000000000000000000..5cc89aa11264428b09e47fd29c5f9ecfb8c32fdd
--- /dev/null
+++ b/drivers/clk/kunit_clk_dummy_device.dtso
@@ -0,0 +1,10 @@
+// SPDX-License-Identifier: GPL-2.0
+/dts-v1/;
+/plugin/;
+
+&{/} {
+	kunit-clock-controller {
+		compatible = "test,clk-dummy-device";
+		#clock-cells = <0>;
+	};
+};
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index 2e6e603b749342931c0d0693c3e72b62c000791b..83852346a32beae919d223f30cb88baa4b2fd62b 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -1360,6 +1360,8 @@ void clk_hw_unregister(struct clk_hw *hw);
 /* helper functions */
 const char *__clk_get_name(const struct clk *clk);
 const char *clk_hw_get_name(const struct clk_hw *hw);
+struct device *clk_hw_get_dev(const struct clk_hw *hw);
+struct device_node *clk_hw_get_of_node(const struct clk_hw *hw);
 #ifdef CONFIG_COMMON_CLK
 struct clk_hw *__clk_get_hw(struct clk *clk);
 #else

-- 
2.45.2


