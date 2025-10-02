Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EB59CAC5B8
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Oct 2025 09:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WQDxw8Hfh8Y8mQlGaDxHtor3fvvIJuG60cJHSTBd1Q4=; b=WqGw607tqhvmthukF3+rdVI+iV
	5+0qtnwzcYATqwatGDP0b8tFFcPuIYzvH8+xIcNgAe0rpyWiu392ZsJzPX+F7eV+UnWY5bnao/fe+
	TH85nVD+6OvMCAj3vQixzOZWP7PrHBI7Z3Io9rFTT3rQpBRMy1SMKiXOHPbbbIQENamDp0x8288ZB
	VkumfOrUFMoeBkacOrgBHnhlJJKtLWlWMTvu3QuyigA2ePWHX2WpGcZEUje9A0tAktr3U/LGs6lpl
	Lzwsl2tdWCOYXS6U7MqGdOaSAL3CSgEExCoN5W+H3Hx9RasLtcHmx0SI+7j0hiaqyYYbOWACIabSn
	6H6kuanw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4FUV-0000000A8Ct-2iMs;
	Thu, 02 Oct 2025 09:20:47 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4FUS-0000000A8CG-3Onx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Oct 2025 09:20:45 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-271067d66fbso7241875ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Oct 2025 02:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1759396844; x=1760001644; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WQDxw8Hfh8Y8mQlGaDxHtor3fvvIJuG60cJHSTBd1Q4=;
        b=M45TYsGB9363WAWYSzhR7c6gGw3JLIeAfdcAyE6UmAwAGBYtdDqmKlATTQtK8OpZEr
         97QOMB9xnQ5IQzwEu0IIuXoalDrunEeJUWZf1XxYfGfVebTp87FT7DmFbUd0mKcoAcN9
         DzkDmfgSoqar6V1nZm56E4Oxyr4QC01SGFuEI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759396844; x=1760001644;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WQDxw8Hfh8Y8mQlGaDxHtor3fvvIJuG60cJHSTBd1Q4=;
        b=Zg5ZyE0C9iC3SaIAOEk+rsaWumuXg3HNoZ9iirpVyBjLp/Grk7ogehckvMGaT3PBZk
         Pz4+UzGsAHN8QpOs6iOsmyc1NfzzZeRcsfVtQ1VbPAyp8ORDHHM2/Wrz+q68d11f4mep
         e1pzpwa6XBIxa51kmZBHRLyplBj71Nl3J0QA90u4qZQ4Ca/O2AxpWb4TLhoO7t8K8IbU
         kkZRbrFTeXxKG+lQOzGeo2iRgdD3zUhbMyKExRg5M/vmElFuTVMvgGOQKRq6cepzG8aL
         pnVNvA6OO/74CBdZay2BWuInuMdZQq46hd+UgLx3K4Cb3EBP9/NeyWDmhgI4JOo8B3w0
         4Ifw==
X-Forwarded-Encrypted: i=1; AJvYcCXH0dhuPw2v1IFVAPiCDTkFuPndCISFn/ELhFFjARjOmqrKoCSoQHXWulBuhvp98uQmaw+v4SJhOKcxRco+GjI2@lists.infradead.org
X-Gm-Message-State: AOJu0YxX6ATlcs4U73bhNRELv7YZMClTYy/N55KI/KOnRsdNDuUraghJ
	Yr7DhAQX0KscjQfAb3V2aRxsQC1q6HVC7YwZXuBsldkZ3VKC92wpItaynhj1u0iReQ==
X-Gm-Gg: ASbGnctvd0liAy2zC2Uy0nUUV6h+x7WjrLZNVJh9cWfMLDe4fMLRwJdTjNrUmWbBJxb
	Zi9x2HrbqrlStzcEOJoV9f4hSMKNzS/rHN6gG7p6MVfkmtRQhIWb3iWIP/z7mIgm8AmL4utx+FP
	akzjwfYoT/5vFAuQaqQ2HncMUv4GpN9SEYWxggmt3zPnIN5CnDwnJYBXNH31Q4xfmgX4s1hpd/p
	Ez0ZkrFOQXhflcuG0usCY6AEE635P7Y1cXltl7tKGtmz3qQdohlDoBgY3laI7U4NC2sW4FCyToc
	CRk1p6WLCmYw+4DgYwDyiTmZUY+2hEew+2LLMlACC70bLgtQPOzC3Z5pAqpPLDAnZIDs18AaeZX
	oR+8Iav3IA9e63onCRXBAeazjbS9zo/LqTm0oTdRvhJPPpDQXJpj6H+qLntHN13SwVQYysqWKjY
	KQrxz8y4ToX4LU6aubcJ/zIETOfdSdr8Os/bnUaQ==
X-Google-Smtp-Source: AGHT+IHMtN6ZJkMHIj5HdMYlnYyAczHcoKg+g+PecKKLereDk3zQkSokXvTzEx9YpyqnCmsVnxbEug==
X-Received: by 2002:a17:903:f84:b0:28e:9427:68f7 with SMTP id d9443c01a7336-28e94276a97mr5653845ad.6.1759396843616;
        Thu, 02 Oct 2025 02:20:43 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3299:ab9e:3686:a840])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d1f2dbesm17531825ad.135.2025.10.02.02.20.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 02:20:43 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] clk: tests: Add tests for clk lookup by name
Date: Thu,  2 Oct 2025 17:20:35 +0800
Message-ID: <20251002092036.2504858-1-wenst@chromium.org>
X-Mailer: git-send-email 2.51.0.618.g983fd99d29-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251002_022044_880673_DB9A3B02 
X-CRM114-Status: GOOD (  18.25  )
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

Clk lookup (by name) recently gained some performance improvements at
the expense of more complexity within the lookup code.

To make sure that this works as intended and doesn't break, add some
basic tests for this part of the CCF.

A new "clk_hw_lookup()" function is added purely for running kunit
tests.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/clk/clk.c      | 11 +++++++
 drivers/clk/clk.h      |  4 +++
 drivers/clk/clk_test.c | 66 +++++++++++++++++++++++++++++++++++++++++-
 3 files changed, 80 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 85d2f2481acf..a17d0070d11f 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -778,6 +778,17 @@ struct clk *__clk_lookup(const char *name)
 	return !core ? NULL : core->hw->clk;
 }
 
+#if IS_ENABLED(CONFIG_CLK_KUNIT_TEST)
+/* This is only provided for kunit tests to test the core lookup functions. */
+struct clk_hw *clk_hw_lookup(const char *name)
+{
+	struct clk_core *core = clk_core_lookup(name);
+
+	return !core ? NULL : core->hw;
+}
+EXPORT_SYMBOL_GPL(clk_hw_lookup);
+#endif
+
 static void clk_core_get_boundaries(struct clk_core *core,
 				    unsigned long *min_rate,
 				    unsigned long *max_rate)
diff --git a/drivers/clk/clk.h b/drivers/clk/clk.h
index 2d801900cad5..a8ed54f5b572 100644
--- a/drivers/clk/clk.h
+++ b/drivers/clk/clk.h
@@ -8,6 +8,10 @@ struct clk_hw;
 struct device;
 struct of_phandle_args;
 
+#if IS_ENABLED(CONFIG_CLK_KUNIT_TEST)
+struct clk_hw *clk_hw_lookup(const char *name);
+#endif
+
 #if defined(CONFIG_OF) && defined(CONFIG_COMMON_CLK)
 struct clk_hw *of_clk_get_hw(struct device_node *np,
 				    int index, const char *con_id);
diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
index a268d7b5d4cb..b3b5ce0ad897 100644
--- a/drivers/clk/clk_test.c
+++ b/drivers/clk/clk_test.c
@@ -175,6 +175,8 @@ static const struct clk_ops clk_multiple_parents_no_reparent_mux_ops = {
 	.set_parent = clk_multiple_parents_mux_set_parent,
 };
 
+#define DUMMY_CLK_NAME	"test_dummy_rate"
+
 static int clk_test_init_with_ops(struct kunit *test, const struct clk_ops *ops)
 {
 	struct clk_dummy_context *ctx;
@@ -187,7 +189,7 @@ static int clk_test_init_with_ops(struct kunit *test, const struct clk_ops *ops)
 	ctx->rate = DUMMY_CLOCK_INIT_RATE;
 	test->priv = ctx;
 
-	init.name = "test_dummy_rate";
+	init.name = DUMMY_CLK_NAME;
 	init.ops = ops;
 	ctx->hw.init = &init;
 
@@ -3541,6 +3543,67 @@ static struct kunit_suite clk_hw_get_dev_of_node_test_suite = {
 	.test_cases = clk_hw_get_dev_of_node_test_cases,
 };
 
+/*
+ * Test that clk lookup with a name that is not registered returns NULL.
+ */
+static void clk_lookup_not_registered_clk_returns_NULL(struct kunit *test)
+{
+	KUNIT_EXPECT_PTR_EQ(test, NULL, clk_hw_lookup(DUMMY_CLK_NAME));
+}
+
+/*
+ * Test that clk lookup with a name that is registered returns the clk.
+ */
+static void clk_lookup_registered_clk_returns_clk(struct kunit *test)
+{
+	struct clk_hw *hw;
+	struct clk_init_data init = {
+		.name = DUMMY_CLK_NAME,
+		.ops = &empty_clk_ops,
+	};
+
+	hw = kunit_kzalloc(test, sizeof(*hw), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, hw);
+
+	hw->init = &init;
+	KUNIT_ASSERT_EQ(test, 0, clk_hw_register_kunit(test, NULL, hw));
+
+	KUNIT_EXPECT_PTR_EQ(test, hw, clk_hw_lookup(DUMMY_CLK_NAME));
+}
+
+/*
+ * Test that clk lookup with a name that was unregistered returns NULL.
+ */
+static void clk_lookup_unregistered_clk_returns_NULL(struct kunit *test)
+{
+	struct clk_hw *hw;
+	struct clk_init_data init = {
+		.name = DUMMY_CLK_NAME,
+		.ops = &empty_clk_ops,
+	};
+
+	hw = kunit_kzalloc(test, sizeof(*hw), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, hw);
+
+	hw->init = &init;
+	KUNIT_ASSERT_FALSE(test, clk_hw_register(NULL, hw));
+
+	clk_hw_unregister(hw);
+
+	KUNIT_EXPECT_PTR_EQ(test, NULL, clk_hw_lookup(DUMMY_CLK_NAME));
+}
+
+static struct kunit_case clk_lookup_test_cases[] = {
+	KUNIT_CASE(clk_lookup_not_registered_clk_returns_NULL),
+	KUNIT_CASE(clk_lookup_registered_clk_returns_clk),
+	KUNIT_CASE(clk_lookup_unregistered_clk_returns_NULL),
+	{}
+};
+
+static struct kunit_suite clk_lookup_test_suite = {
+	.name = "clk-lookup",
+	.test_cases = clk_lookup_test_cases,
+};
 
 kunit_test_suites(
 	&clk_assigned_rates_suite,
@@ -3560,6 +3623,7 @@ kunit_test_suites(
 	&clk_register_clk_parent_data_device_suite,
 	&clk_single_parent_mux_test_suite,
 	&clk_uncached_test_suite,
+	&clk_lookup_test_suite,
 );
 MODULE_DESCRIPTION("Kunit tests for clk framework");
 MODULE_LICENSE("GPL v2");
-- 
2.51.0.618.g983fd99d29-goog


