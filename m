Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17AA8D26D6F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 17:27:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CzsMqHkuItNSEK91yT7JYcig8ensUusvETOGKZjIn/o=; b=EBhVHhSgeUMEtk/VqSlxXsMYcT
	vhBXHSsvSykm6x/PBRgwRGR/vCzjl7fOJMMlUvtURSYjyFPYL4Xr9uAA9Z5Mpeb0FUqU5ORDxTolY
	5hGyEegX2l4Tp4ldokArFnmWyCJky7QQ0hnKTWSuRtkV1vlAbnGWMmi8N08Hc282SuYx+09XPpya5
	FQYv5CZHa9jLu/CtfGxgy35k2rBCTDnlmzlcOtxZTQOLDcAwczjmyAibZf0Sr7LZ532HM5PN/kyf5
	Y9LbCxJWYYCgA7jYRNPPnf0IONlP1viSN/kOA1A6KCvzq9XvRKuV8eNAWcc7TlbL6XDC1585+s5WP
	KiNjubmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veGGr-00000002ous-2mzg;
	Fri, 09 Jan 2026 17:27:33 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veGGo-00000002osF-1Z3o
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 17:27:31 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-6505cbe47d8so7198989a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Jan 2026 09:27:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767979648; x=1768584448; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CzsMqHkuItNSEK91yT7JYcig8ensUusvETOGKZjIn/o=;
        b=PqJ/CsiefBM/HeVjOz6VlAvmw7zamKDpCHVAUhkqrxyRx88Qls8Jw+4HJYpx06kKSt
         jUyWB7A7E1a9x1+/61eG5r/EuJuHgU0HRSJyVcIgY3LeZ1hQx/aenLtqCqNIeDZ6hA1x
         e+duuQ206r1xqr7lR5C65Q4o791i9ubVf6DdyjXgtqyQHIdHKMiBSEOb5VPos3RLmg6d
         O7o1G7qW9sSJG2eYB2rhZ8Zufgxwhc7LlTY80hFtvfKEQyxTzRKpyvZtKo/LH1nshj9y
         RVuwxdXJ44T4S5E4FfxAF7oUqvzU+7y0HCxS2ARMXcNAzjo+AaN+FuAIIelC7y7Qh5mV
         Qj+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767979648; x=1768584448;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CzsMqHkuItNSEK91yT7JYcig8ensUusvETOGKZjIn/o=;
        b=uPC6cbx4chdRYyRVWYarRqqezSJ/g15lQu7OuYMoBWsbza3wFQhFsjnasm3q/u9t+c
         VTcbSsjsMbrUGWIlQu7Ml2HSyrspQAv3VoAE3Pv22L3qtaW56NZwV66XQO8HTxE7svjG
         +Hbp8j4dHyWCAGMWloIVGMn2cbzZOdyVVqwF128ZlTSyBs9AzbjaD97INvz15x1ljxLe
         Gwd8S5QFYaXxsW4Z5ZpoK4cFyI0quZH4RvEPoqlHrv3ZBRmw/z9806wV0BJvkhl3NTFd
         2spysmeFoJiFBpx00h3tlqS6R7p4Ypfr+uqHQls0b5H+ThN30WfI+cVd1WA1Jzo5UbS5
         L6Og==
X-Forwarded-Encrypted: i=1; AJvYcCWmaE5nIUAa5viRVzlkzfhb9xaghlLPedMVIgirQ3iBTdQrIPG8ZC9m/0DczRiLEOqpCh/io+HtTcdHzUV4QhUK@lists.infradead.org
X-Gm-Message-State: AOJu0YzOoUOneCZwpwsD86BoIiHAGvYnKCKoue7+KFphjIC89OMgrqSl
	AYgrso/6piatu5tfl97+apGQ8+tVQu4QOY/LGxD3wuLQewv9XVGWqDlq34RDWRnTZyIWWggMOGL
	hmix+jKg=
X-Gm-Gg: AY/fxX5kobR68pseYRQoWL41bh1sNyW5M1WLLqSL0lG1IYnftj80nKYxq5uHi98zT+r
	FvOq+Yzf/XyyZXTbJUBEl3V5BAKUyAPNtKweB7cFRpSY2k/iAoOAA8AMLToAYJp3rFpuEVEQCWA
	dW4/5hftQoZfb4cO5AhpTMd5vqj98cljLILU7NXyLWfz9sJ+MrObdQX+KBIbJN2uYPBQpoSqVts
	8jRXgn3E3tGz2k1HU7ffuf9SoKi/7g/89kSnoUehQi15Y5m9BX94yUDOt3gKQO/zEMzPQXOD0mW
	khfA+srggHUBiL1XLtjzKMBxgzAIbXwEGe70uEbC/bdwngFo+R1dLwiTAgBsXmgVB8IZLoQPJro
	roLghNH9U5wbiO03mjcpJ7cZDEjzDPKEnVx06BbNvwRasuQEjU/dbWh7FhcrYlLEbpvM4e+3eSa
	xnNH7yhx4luq7DK7QoyqUANY07FXd6W8VJqJYD1FjfjoEzbp3vetkAug0qzHqxTTbYbIvRoUEmQ
	+Iksw==
X-Google-Smtp-Source: AGHT+IHfU+cxEUkm2kF/kOQsRd2ooDJ4uR4ri7MEIyFQqUrf3Okb1axWOyo618duvh8QSiexZtQrng==
X-Received: by 2002:a05:6402:13cd:b0:64d:1ce9:54b7 with SMTP id 4fb4d7f45d1cf-65097e4cf0amr8994867a12.18.1767979648255;
        Fri, 09 Jan 2026 09:27:28 -0800 (PST)
Received: from puffmais2.c.googlers.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507be651a4sm10642182a12.16.2026.01.09.09.27.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 09:27:27 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 09 Jan 2026 17:27:25 +0000
Subject: [PATCH 3/3] clk: samsung: allow runtime PM with auto clock gating
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260109-clk-samsung-autoclk-updates-v1-3-2394dcf242a9@linaro.org>
References: <20260109-clk-samsung-autoclk-updates-v1-0-2394dcf242a9@linaro.org>
In-Reply-To: <20260109-clk-samsung-autoclk-updates-v1-0-2394dcf242a9@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, Juan Yescas <jyescas@google.com>, 
 linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_092730_447879_3C7FBB83 
X-CRM114-Status: GOOD (  24.78  )
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

When automatic clock gating is enabled, runtime PM (RPM) isn't entered
even if enabled for a CMU if a sysreg clock exists and is provided by
this CMU (as is generally the case).

The reason is that this driver acquires a CMU's sysreg registers using
syscon_regmap_lookup_by_phandle() which ends up preparing the sysreg
clock. Given the sysreg clock is provided by this CMU, this CMU's usage
count is therefore bumped and RPM can not be entered as this CMU never
becomes idle.

Switch to using device_node_to_regmap() which doesn't handle resources
(the clock), leaving the CMU's usage count unaffected.

Note1: sysreg clock handling is completely removed with this commit
because sysreg register access is only required during suspend/resume.
In the runtime suspend case, we would have to enable the clock to read
the registers, but we can not do that as that would cause a resume of
this driver which is not allowed. This is not a problem because we
would only need to handle the clock manually if automatic clock gating
wasn't enabled in the first. This code is only relevant if automatic
clock gating is enabled, though.

Fixes: 298fac4f4b96 ("clk: samsung: Implement automatic clock gating mode for CMUs")
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/clk/samsung/clk.c | 92 +++++++++++++++++++++++++++++++++++------------
 drivers/clk/samsung/clk.h |  2 ++
 2 files changed, 71 insertions(+), 23 deletions(-)

diff --git a/drivers/clk/samsung/clk.c b/drivers/clk/samsung/clk.c
index 9f68f079fd552f8dfb6898dbfb47dec0e84c626c..6515df81fcbc79b90f5262843e67575f6a4e0dda 100644
--- a/drivers/clk/samsung/clk.c
+++ b/drivers/clk/samsung/clk.c
@@ -9,11 +9,13 @@
  */
 
 #include <linux/slab.h>
+#include <linux/clk.h>
 #include <linux/clkdev.h>
 #include <linux/clk-provider.h>
 #include <linux/io.h>
 #include <linux/mfd/syscon.h>
 #include <linux/mod_devicetable.h>
+#include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/regmap.h>
 #include <linux/syscore_ops.h>
@@ -489,6 +491,50 @@ void __init samsung_cmu_register_clocks(struct samsung_clk_provider *ctx,
 		samsung_clk_register_cpu(ctx, cmu->cpu_clks, cmu->nr_cpu_clks);
 }
 
+static int samsung_get_sysreg_regmap(struct device_node *np,
+				     struct samsung_clk_provider *ctx)
+{
+	struct device_node *sysreg_np;
+	struct clk *sysreg_clk;
+	struct regmap *regmap;
+	int ret;
+
+	sysreg_np = of_parse_phandle(np, "samsung,sysreg", 0);
+	if (!sysreg_np)
+		return -ENODEV;
+
+	sysreg_clk = of_clk_get(sysreg_np, 0);
+	if (IS_ERR(sysreg_clk)) {
+		ret = PTR_ERR(sysreg_clk);
+		/* clock is optional */
+		if (ret != -ENOENT) {
+			pr_warn("%pOF: Unable to get sysreg clock: %d\n", np,
+				ret);
+			goto put_sysreg_np;
+		}
+		sysreg_clk = NULL;
+	}
+
+	regmap = device_node_to_regmap(sysreg_np);
+	if (IS_ERR(regmap)) {
+		ret = PTR_ERR(regmap);
+		pr_warn("%pOF: Unable to get CMU sysreg: %d\n", np, ret);
+		goto put_clk;
+	}
+
+	ctx->sysreg_clk = sysreg_clk;
+	ctx->sysreg = regmap;
+
+	of_node_put(sysreg_np);
+	return 0;
+
+put_clk:
+	clk_put(sysreg_clk);
+put_sysreg_np:
+	of_node_put(sysreg_np);
+	return ret;
+}
+
 /* Each bit enable/disables DRCG of a bus component */
 #define DRCG_EN_MSK	GENMASK(31, 0)
 #define MEMCLK_EN	BIT(0)
@@ -499,32 +545,32 @@ void samsung_en_dyn_root_clk_gating(struct device_node *np,
 				    const struct samsung_cmu_info *cmu,
 				    bool cmu_has_pm)
 {
+	int ret;
+
 	if (!ctx->auto_clock_gate)
 		return;
 
-	ctx->sysreg = syscon_regmap_lookup_by_phandle(np, "samsung,sysreg");
-	if (IS_ERR(ctx->sysreg)) {
-		pr_warn("%pOF: Unable to get CMU sysreg\n", np);
-		ctx->sysreg = NULL;
-	} else {
-		/* Enable DRCG for all bus components */
-		regmap_write(ctx->sysreg, ctx->drcg_offset, DRCG_EN_MSK);
-		/* Enable memclk gate (not present on all sysreg) */
-		if (ctx->memclk_offset)
-			regmap_write_bits(ctx->sysreg, ctx->memclk_offset,
-					  MEMCLK_EN, 0x0);
-
-		if (!cmu_has_pm)
-			/*
-			 * When a CMU has PM support, clocks are saved/restored
-			 * via its PM handlers, so only register them with the
-			 * syscore suspend / resume paths if PM is not in use.
-			 */
-			samsung_clk_extended_sleep_init(NULL, ctx->sysreg,
-							cmu->sysreg_clk_regs,
-							cmu->nr_sysreg_clk_regs,
-							NULL, 0);
-	}
+	ret = samsung_get_sysreg_regmap(np, ctx);
+	if (ret)
+		return;
+
+	/* Enable DRCG for all bus components */
+	regmap_write(ctx->sysreg, ctx->drcg_offset, DRCG_EN_MSK);
+	/* Enable memclk gate (not present on all sysreg) */
+	if (ctx->memclk_offset)
+		regmap_write_bits(ctx->sysreg, ctx->memclk_offset,
+				  MEMCLK_EN, 0x0);
+
+	if (!cmu_has_pm)
+		/*
+		 * When a CMU has PM support, clocks are saved/restored via its
+		 * PM handlers, so only register them with the syscore
+		 * suspend / resume paths if PM is not in use.
+		 */
+		samsung_clk_extended_sleep_init(NULL, ctx->sysreg,
+						cmu->sysreg_clk_regs,
+						cmu->nr_sysreg_clk_regs,
+						NULL, 0);
 }
 
 /*
diff --git a/drivers/clk/samsung/clk.h b/drivers/clk/samsung/clk.h
index b1192ca03db5035cc485771ff5597cf132234a2a..deb426fbb0942f21b63c583f0ad55738239b04e4 100644
--- a/drivers/clk/samsung/clk.h
+++ b/drivers/clk/samsung/clk.h
@@ -21,6 +21,7 @@
  * @reg_base: virtual address for the register base
  * @dev: clock provider device needed for runtime PM
  * @sysreg: syscon regmap for clock-provider sysreg controller
+ * @sysreg_clk: clock for sysreg access, if required
  * @lock: maintains exclusion between callbacks for a given clock-provider
  * @auto_clock_gate: enable auto clk mode for all clocks in clock-provider
  * @gate_dbg_offset: gate debug reg offset. Used for all gates in auto clk mode
@@ -33,6 +34,7 @@ struct samsung_clk_provider {
 	void __iomem *reg_base;
 	struct device *dev;
 	struct regmap *sysreg;
+	struct clk *sysreg_clk;
 	spinlock_t lock;
 	bool auto_clock_gate;
 	u32 gate_dbg_offset;

-- 
2.52.0.457.g6b5491de43-goog


