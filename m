Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C8EEC02181
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jan 2025 17:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=02+p/CyBlcypyZw0YbW7IuyhjHq9UGkk6C9KfU3oaJk=; b=bddVYSK1YB2WjEPlcgdkEp0TL+
	0vahN2UgQTrnpRMnY8qn/vj8GOIyZSfV8CVCV3YmGdWbW19mwIlhobUMfXWG8QGXYwUa8MU+k8si4
	iY9Uar/m1QI8Uii5YCfMjzLqMQ1Xh8ieucSQkUOhPx//2SYmw47/1iEYefWTbsgdpc2jW64QP3Kt2
	1n27KkcPhVd5qoLAhTM+FrOmzSGnKvjfsHXTk9ES/oJyPYWvqL+Krp7bicdzHBNSIN2kbODBGchN/
	HLemuKwqqTRVHbu8WV+CO9TqTmQ8K+FfiCdX6cK9uXV1U6GDZIk0KV+aMjz89dcMFF3YBMiuc5jSZ
	aWGmoJ0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZvQs-000000066cU-25gv;
	Mon, 20 Jan 2025 17:19:26 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZvOJ-000000066Aj-1PIc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jan 2025 17:16:50 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3862d6d5765so2678615f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jan 2025 09:16:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1737393405; x=1737998205; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=02+p/CyBlcypyZw0YbW7IuyhjHq9UGkk6C9KfU3oaJk=;
        b=LywkJaKWzFH4gLtuJM4FeQAsU65+nN67Uqgi5IgkqYC/6dhYklhApQRoOzj+RRLZtu
         RqULmQcVT2uEUKMmVS4OwAJb8q3KG2IO0BmLPdw97G9okCO33yl7E9dn8zIrjj6O7H+G
         Ld2xoyQNDXSaRhx8hth8hbE2h5KornerrFSOrDhiz4/E8B4VSLEvLVbvASgruVSeL4se
         F8MsoC092BWpDLc0Kch/0B3cMB4x4hAgS4IMCtyrlvv+pS/z+8aeu+58W1K1ZcgUSsO3
         NeDXDOghSydlk0YVmLMKenFzMGe3CkZ/ZLh5plfd6WaInZAPBs6dmSN8vuOzDEhkOREA
         aKsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737393405; x=1737998205;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=02+p/CyBlcypyZw0YbW7IuyhjHq9UGkk6C9KfU3oaJk=;
        b=pEo60cecsC5MgdNQcj584FrLS4IpM2A/VW9owrjkpA9aDEQcn0Nng+pvrJnV6h1pOH
         wbkJ8wzlAugBsrG6xHXPvXAAp6p3mWDtSccyTTpeK/sDMoDD716yJRGypfI3xVz49a8N
         zkFieoYOxOeAVr0iihE1IgSmTVeBt2ntiwGDkpXupHl88Ks/Rl7TmvoSCACbX26Dble0
         zY5MUX07pX3TeZ8gTp9Muo/jYqZ5LIq+Gtcy1opoJXMObr5q8EaTD1lU1YImFv99+YL7
         69yTYy7w/Hx5AEPYgmzBf6DoGxftFtllDAJHoawJ0vvoJBl62ZQvWeILz64ISIk1PJfB
         3Aog==
X-Forwarded-Encrypted: i=1; AJvYcCXsLpBSbA5pD2/x4b2xNi31bT06ZTB/78qH7IWkXJrXjnIsjziLV2s36vID/aulrI6Kk98NvMZ1xhFaYROUxcD/@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2ZSPTLZz5+YUtVNAcWSjqTOUHghsOHFW32OFmUP6GNrW3NLNO
	TMj/rYtAzPerN1hQPg216qBRikYty2FZBZ55K56BgqPFowCCrNG43REtfl76DD8=
X-Gm-Gg: ASbGncsZ4uGbUQthLUhPuqJPGvBq8Uhs1hnn2sZBta/6GRO0zgpqg/1ZDGCYEtXT+5X
	9fF5AZRTyCAOs2cXW5Bl2JdihchTsCVH2lMWhIUG8QY+BQBHdGiiozaSjrLb9sBtNsg4aNTZnux
	T1S6Nr+qRiGNanIzBRM1rzdk+UIwMm5qZRIVpBkttrIpULcFet1xB+WYnn5RJmXTQYphaMxHZ0a
	MoIkJ8AYjjUoaAsyNPPPcqDvyL/7MaZP9BaJVOdEHHulOLhskc74du8lNehvCntiCff00QPsBEg
	cx6GfbPJ
X-Google-Smtp-Source: AGHT+IGLIhL9HOhGjF2E1IzEtn3QDq2zPcEm/yLuAAEnr0hsid60U3LXmZqaxvhV0wqinBn+QP/krg==
X-Received: by 2002:a05:6000:1a8c:b0:386:5b2:a9d9 with SMTP id ffacd0b85a97d-38bf59f263bmr12432153f8f.53.1737393405196;
        Mon, 20 Jan 2025 09:16:45 -0800 (PST)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:66cc:1b13:f78a:5738])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-437c75298adsm208629865e9.30.2025.01.20.09.16.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2025 09:16:44 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Mon, 20 Jan 2025 18:15:30 +0100
Subject: [PATCH v3 1/4] clk: add a clk_hw helpers to get the clock device
 or device_node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250120-amlogic-clk-drop-clk-regmap-tables-v3-1-126244146947@baylibre.com>
References: <20250120-amlogic-clk-drop-clk-regmap-tables-v3-0-126244146947@baylibre.com>
In-Reply-To: <20250120-amlogic-clk-drop-clk-regmap-tables-v3-0-126244146947@baylibre.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=10151; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=cgJF8kM1H4dZ/gRr8SV6GfCmMAchxWiXSMJlnm1E2/k=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBnjoT3WfqyhqyVsPSTlymwg814yC6x+DYLcAWpS
 Y5/0ULXpe6JAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZ46E9wAKCRDm/A8cN/La
 hf0pD/wPBXLZhLC6pJcVx0FyMugrnmefYb5Np2MvnpXZDOAVQOEUZWWOsezg2w1sREsBUGoufrw
 lfQAINvFMGalkPeeqI4Du02cC/Vf7ODwFdznk2s1u2NNe0JDZsnhtfLGY6i4kUctvwq7lde5fGN
 ksxqPucTy9wHB6LgMBfwSnPxS59zf4zZKxcHzyd+tN+pAc0gcwjx26Qy/JvKYAXfgsnGQCMMpXe
 tMg5Fr06+vXxoYwCi5qOv6I9wW8+Vjz5sEe3oKpQH4+AznUS3McUMwZGE1vsqn9oUy6R+gIAfsV
 1PJ0l/4uYUx5YYkkpAKdAxZ/SSHccgZtWdIKn/ty0GXBy+fC5cM/1u+b+9NT/GqinzTqMyN8CvC
 BUG+oCihDRLlQBsTyk8NSghT1Tenf/V+mPsfSXcVmFZqDwkBd4T6uBu3yl3ueruHHE73MvvgHDa
 Ab0LMRu7z7CqskUAxjnjIqJOjbH4db88R/eLMdghlJ+8LyQwaqkepn7ntumQxh6ixKe6o3Dsh0y
 aJ463h4UhkoO/HTz/6gxZ4SjmdZvrwMVO7jS3SjJrxyWzflpleSZQh+5kie3OAOPZB3FemWYmK0
 owsC42tmxi1Mm3w8gGVM6Ivs1NhefUNqYygJfhl3HIae4BXwc45YCnTNhTXTL0idb2cwkKBWL1b
 YPaCROmJxYXEpAQ==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250120_091647_492509_84279673 
X-CRM114-Status: GOOD (  28.95  )
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
index 9b45fa005030f56e1478b9742715ebcde898133f..9818f87c1c56ab9a3782c2fd55d3f602041769c3 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -365,6 +365,39 @@ const char *clk_hw_get_name(const struct clk_hw *hw)
 }
 EXPORT_SYMBOL_GPL(clk_hw_get_name);
 
+/**
+ * clk_hw_get_dev - get device from an hardware clock.
+ * @hw: the clk_hw pointer to get the struct device from
+ *
+ * This is a helper to get the struct device associated with a hardware
+ * clock. Some clocks, such as the ones registered from an early clock
+ * controller, may not be associated with any struct device.
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
+ * This is a helper to get the struct device_node associated with an
+ * hardware clock.
+ *
+ * Return: the struct device_node associated with the clock, or NULL
+ * if there is none.
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


