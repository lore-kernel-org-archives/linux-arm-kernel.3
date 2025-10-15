Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3699CCD195
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 09:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=v54lCkZaDqlFCcH302UrfaefVMpcSxNOJrGx418qcEA=; b=oo3Pt/hC/0eeHThuCMJPfMjnCc
	lfcDLYwcYrHhG8X0a4RJAs2amEUo82i8UulqXnGmU/aDYCycteqDuCjWyHzFTOAmZY6Jzd8lDoXN8
	m3K/06VOOmDpvh4Q8cHJKDxC4ioT2qIfhhquA+SiDermC976OEgu10pCyd1ON6MlquXcuZbEJeQF7
	6671fArhT96+FHa0PzN+aQGh7CtiFMkIbLfc9oCCyR2mmiZCqW6EFmYFfx+JH6JfQ2on5cu20PX1H
	O8X+WRDDW75xAi30FqzkR5/wcXKL+oBr9iD+wyZyf8GNWYoC1Yng7ywaK3oFCpWCmK0pKHcPAq7XZ
	j04I8uog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8xTU-0000000139N-2IjV;
	Wed, 15 Oct 2025 09:07:12 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8xTR-0000000138z-3kY1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 09:07:11 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-b633b54d05dso4111953a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Oct 2025 02:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760519229; x=1761124029; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=v54lCkZaDqlFCcH302UrfaefVMpcSxNOJrGx418qcEA=;
        b=iB3480uf5VOw+394jgtjx1rEolG1WzVEk1VvE0phER2KKwZEFYZjO/5kisdo0F4nkB
         6vVkevGaGdLTbEs0/K7gJymUJ0iFe2OfzusBdTInWgjfv03ZZ3bynbryk4QNYDkTGMiw
         fD+US0ablGs/7MbYx/2OrjMT0CJ1z7EgnwBM8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760519229; x=1761124029;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v54lCkZaDqlFCcH302UrfaefVMpcSxNOJrGx418qcEA=;
        b=Euy+kWHQ6b/K86Nmieeuw//5Jx7B5uJHsA9tDMmKAgPE2sf3c/nly5N5T/Ag6PQOGI
         P4dERBqs9WyKJUy3tSjOTiG9THgdrl3r88w4OjHP+gECUscPYrJKT5RmestUE4mMpQ0f
         qNQLQwEQ7qJvL7pdbJW9aOx94P1qz/N758zxt2Q0A7kJK6m33AA0xrVJVQWrsFTRPBOR
         xuPD5S2PPnpWDjdUzKqnmxQIaXw8CB03Jm5t8SGteorGQoSif8D/aIHUb0y7gHMRnt4f
         GUVYPML/Y292tPvDjhRNRn8cUQDhAUqIp+6Vejxq1FubH7HV/LMNt5C55fr/LTp/X44I
         ocxw==
X-Forwarded-Encrypted: i=1; AJvYcCXTyL1yvg0vZVeejYka5nsvuOExmmjevEvXesNoHjlTcY78JBOVwGT+PFxJgEHL/cpA1Y6RZkufIIhk9KXbhOto@lists.infradead.org
X-Gm-Message-State: AOJu0YykMpuRd2qmY9gpjspMz7wKHV7wpXIcenXeAL/3ytQrfgXli0xt
	NQiJTWYb7hG5vDxlEp9tIM18C4wGBI8mpkLjmmcZ+tme1kxtDeZ7yDL5lt3b1Q03Fw==
X-Gm-Gg: ASbGnctihgS0vr16K6wXQy2a82SWnNZ6ZVBdlAmJIATvskBQ7gCEgrdM0QfBMVT+9dP
	mbPCCOJ2GNIscGoaGQdbporLFA23Z61qLF1xoYCSq+1hRt084eb56qo5aJvvUS7v3ijwjUUYhuo
	DHfu1SX+WsTW0+lc/ry4yFXas8tWYleKvkbRCDyR7aVJbraEGtu3VtQH624w2JxhVEXUVFDnSDn
	PdetSQqBsP+2Jiuzu+ZURfDPrmJk4xRb/P28UHjm8GIt41EMyb8D8AFkiF8ze3oYwDz9683/5aQ
	n0fRlGeXCiugLyE1MbEaS4+RdOCdZXBiCa+niUsA1gynrr5tH2vx94u/DOVy2hv8XQ2lwD8uEML
	M9jWp2iTsQ5pTdvSu4slp3sgB/vVdz4URSgBHWDBll61EuS/dG3phvDCcNkBwofeK3uHwE35BY0
	qQTWfC/aqoMKj+Jdb04xHUbqIiO6IXlD6k
X-Google-Smtp-Source: AGHT+IHlL0oIuISBopxFJ5LX7OHcqdJOEAXBYDDnEYLkTxGptox99BOIpt/UkQRjt+HPN1uykPtDLA==
X-Received: by 2002:a17:903:3807:b0:269:8d16:42d1 with SMTP id d9443c01a7336-290272e1e24mr316691295ad.50.1760519228878;
        Wed, 15 Oct 2025 02:07:08 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:1a1f:d7c1:704a:3e83])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b678df233cfsm14389395a12.28.2025.10.15.02.07.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 02:07:08 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Brian Masney <bmasney@redhat.com>
Subject: [PATCH v2] clk: tests: Add tests for clk lookup by name
Date: Wed, 15 Oct 2025 17:06:59 +0800
Message-ID: <20251015090701.2049164-1-wenst@chromium.org>
X-Mailer: git-send-email 2.51.0.788.g6d19910ace-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_020709_982752_1E0286BD 
X-CRM114-Status: GOOD (  20.49  )
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
Changes since v1:
- Added missing prepare lock/unlock
- Switched to EXPORT_SYMBOL_IF_KUNIT and VISIBLE_IF_KUNIT kunit
  visibility macros for consistency (Brian)
  This probably doesn't make much difference except that the symbol is
  now in the EXPORT_SYMBOL_IF_KUNIT namespace
---
 drivers/clk/clk.c      | 18 ++++++++++++
 drivers/clk/clk.h      |  4 +++
 drivers/clk/clk_test.c | 67 +++++++++++++++++++++++++++++++++++++++++-
 3 files changed, 88 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 85d2f2481acf..b39ad8944a06 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -10,6 +10,7 @@
 #include <linux/clkdev.h>
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
+#include <linux/compiler_attributes.h>
 #include <linux/device.h>
 #include <linux/err.h>
 #include <linux/hashtable.h>
@@ -25,6 +26,8 @@
 #include <linux/string.h>
 #include <linux/stringhash.h>
 
+#include <kunit/visibility.h>
+
 #include "clk.h"
 
 static DEFINE_SPINLOCK(enable_lock);
@@ -778,6 +781,21 @@ struct clk *__clk_lookup(const char *name)
 	return !core ? NULL : core->hw->clk;
 }
 
+/* This is only provided for kunit tests to test the core lookup functions. */
+#if IS_ENABLED(CONFIG_CLK_KUNIT_TEST)
+VISIBLE_IF_KUNIT struct clk_hw * __maybe_unused __must_check clk_hw_lookup(const char *name)
+{
+	struct clk_core *core;
+
+	clk_prepare_lock();
+	core = clk_core_lookup(name);
+	clk_prepare_unlock();
+
+	return !core ? NULL : core->hw;
+}
+EXPORT_SYMBOL_IF_KUNIT(clk_hw_lookup);
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
index a268d7b5d4cb..a8989566946b 100644
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
@@ -3560,6 +3623,8 @@ kunit_test_suites(
 	&clk_register_clk_parent_data_device_suite,
 	&clk_single_parent_mux_test_suite,
 	&clk_uncached_test_suite,
+	&clk_lookup_test_suite,
 );
 MODULE_DESCRIPTION("Kunit tests for clk framework");
+MODULE_IMPORT_NS("EXPORTED_FOR_KUNIT_TESTING");
 MODULE_LICENSE("GPL v2");
-- 
2.51.0.788.g6d19910ace-goog


