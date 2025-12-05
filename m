Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B83CD2CDFE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Dec 2025 01:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pXKo9jae8GPx/nkXX05Y0xFfBHYzG41JeWrmmml+Pic=; b=243fkBHKXIFqguSTemam0PLZuM
	cBkFSuFhNVqfP9SxWo99R1VKPx8fxCEekdh5fA20y8MOWUnqrtvhzy8NK137t5Cit4ZzHcOah60sL
	AkeDu+TxwFIdYZfKJDGwgbAiYo2gcYS7gejJrlxEEDMt6LbJ4RqGlUxC1zZjDWKDS9aBlCkpRvaMW
	UxuVT/XA0pcQpT6XmPOfQzVOidFJXjC32qLoM0P77RHluZs2BWj26PlgVKe/4r1zdm7Wfmd9Pm1cY
	pLxV0S69EFYcAZwEUY2s+DVus9fs5lpRWvYwAf1l4lLUIT0W5TgwxwNRzvK+c60+kyqV0UmllUAAt
	6n/GqgxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRKLS-00000008qaE-189h;
	Fri, 05 Dec 2025 01:10:50 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRKLM-00000008qVl-18TT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Dec 2025 01:10:45 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-34740cc80d5so2992365a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Dec 2025 17:10:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764897043; x=1765501843; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=pXKo9jae8GPx/nkXX05Y0xFfBHYzG41JeWrmmml+Pic=;
        b=ss+wcIzjhdWaDh3X8NH6+fePW5NBRjxWCZd65medD9uj20I8Jn8P734kYKgNRlh3RR
         uaCH+zNWlRh32mKECXSEDhF6WEOfwji6LDxFcIk1blp9Xxqt70o/iZ++8dt3IGwWZyTU
         por8+j2OXvtb0NVygTiN90zF+fN6ch+yQuxLhCdfa5JPLg8ZSo8uuEBX4hR8tfrC1/78
         vwxSF4oQp74DjYpaFt6VKIKs06DUqM92RjYxksSAYtYbnc0HDP3/mQyecnNYJW4/gEDc
         Ace30iPTMj4p9BPY+0i+lgynmcHrADjIAWik94mdh/CaRupQz8yHuleCRhpI2ymuI/xx
         +hjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764897043; x=1765501843;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pXKo9jae8GPx/nkXX05Y0xFfBHYzG41JeWrmmml+Pic=;
        b=Qzg+Mda057uViaulFk+S7psGFGTr+yYrlQAA0Tb5e2cEfZOk3UOE4eJ6+gITvWzYhd
         pv/GnYn3WukaZ1tzA09Lx3+6LHnRLYJrgOEsMrR3LTd7Ec0AKpb1VX5PfcQIbGzvzY1X
         ZmFEDqQj3X10WfctpdS9ZC9GgdyaXfByMF/pN0RNk2tQYxEbpA/kdPMdPfmhkXVBXIJt
         IeBHSga11Qz4H4sPcPqdeCANfJHbCB0I+g6Rch5c0R6ZC+SPfMFgbfapK7ydokZv528m
         C9Q7YvMDo2lGNCBma8LdvHTW+BeBL2scc8nU11fKfWMyw+3XAc7v5in8IFAzwyKw43hc
         Q+mA==
X-Forwarded-Encrypted: i=1; AJvYcCVdanLfvsO6lkf5Is79wIcGulQ99f94zULLWlvOc2WHxDb8xeGeee+3zCWN3z3rw11/NZDODfamvc3JzqT2nnHQ@lists.infradead.org
X-Gm-Message-State: AOJu0Yx98H47Dn5HkMfHxH0MsOFPKoN9Ux9nALk86K41I6GZYlIaS/iA
	3J/I26eurjf0I+xevl9Ayiz8T+MBjJF0fkCu1ScY52/NmmVNrV7oroCA27z8VgOdvgS4ZBoeK8/
	6W6bt5uONjdVQnesELRmXrk494zbXFQ==
X-Google-Smtp-Source: AGHT+IGYFV6MU4YB63AJyKdvva+eVU8KUbYz33XJWjAtkBwDnomi6wq1povsUBPPhQoD986KcORpY779p4tk4+RsEF0=
X-Received: from pjbie17.prod.google.com ([2002:a17:90b:4011:b0:33b:dccb:b328])
 (user=willmcvicker job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:2f83:b0:349:2125:be60 with SMTP id 98e67ed59e1d1-3492125c2b9mr7143191a91.8.1764897042691;
 Thu, 04 Dec 2025 17:10:42 -0800 (PST)
Date: Fri,  5 Dec 2025 01:10:18 +0000
In-Reply-To: <20251205011027.720512-1-willmcvicker@google.com>
Mime-Version: 1.0
References: <20251205011027.720512-1-willmcvicker@google.com>
X-Mailer: git-send-email 2.52.0.223.gf5cc29aaa4-goog
Message-ID: <20251205011027.720512-6-willmcvicker@google.com>
Subject: [PATCH v7 5/6] clocksource/drivers/exynos_mct: Add module support for ARM64
From: Will McVicker <willmcvicker@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, Donghoon Yu <hoony.yu@samsung.com>, 
	Rob Herring <robh@kernel.org>, John Stultz <jstultz@google.com>, 
	Youngmin Nam <youngmin.nam@samsung.com>, Peter Griffin <peter.griffin@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, 
	"=?UTF-8?q?Andr=C3=A9=20Draszik?=" <andre.draszik@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, "Russell King (Oracle)" <linux@armlinux.org.uk>, 
	linux-samsung-soc@vger.kernel.org, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_171044_323183_39BDC6F1 
X-CRM114-Status: GOOD (  24.29  )
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

On Arm64 platforms the Exynos MCT driver can be built as a module. On
boot (and even after boot) the arch_timer is used as the clocksource and
tick timer. Once the MCT driver is loaded, it can be used as the wakeup
source for the arch_timer.

Note, this commit was derived from
https://android.googlesource.com/kernel/gs/+/8a52a8288ec7d88ff78f0b37480dbb0e9c65bbfd.

Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
Reviewed-by: Youngmin Nam <youngmin.nam@samsung.com> # AOSP -> Linux port
Tested-by: Youngmin Nam <youngmin.nam@samsung.com> # AOSP -> Linux port
Signed-off-by: Will McVicker <willmcvicker@google.com>
---
 drivers/clocksource/Kconfig      |  3 +-
 drivers/clocksource/exynos_mct.c | 51 ++++++++++++++++++++++++++++----
 2 files changed, 47 insertions(+), 7 deletions(-)

diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
index ffcd23668763..9450cfaf982f 100644
--- a/drivers/clocksource/Kconfig
+++ b/drivers/clocksource/Kconfig
@@ -451,7 +451,8 @@ config ATMEL_TCB_CLKSRC
 	  Support for Timer Counter Blocks on Atmel SoCs.
 
 config CLKSRC_EXYNOS_MCT
-	bool "Exynos multi core timer driver" if COMPILE_TEST
+	tristate "Exynos multi core timer driver" if ARM64
+	default y if ARCH_EXYNOS || COMPILE_TEST
 	depends on ARM || ARM64
 	depends on ARCH_ARTPEC || ARCH_EXYNOS || COMPILE_TEST
 	help
diff --git a/drivers/clocksource/exynos_mct.c b/drivers/clocksource/exynos_mct.c
index 922c2b519a39..d9a888607726 100644
--- a/drivers/clocksource/exynos_mct.c
+++ b/drivers/clocksource/exynos_mct.c
@@ -15,9 +15,11 @@
 #include <linux/cpu.h>
 #include <linux/delay.h>
 #include <linux/percpu.h>
+#include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_irq.h>
 #include <linux/of_address.h>
+#include <linux/platform_device.h>
 #include <linux/clocksource.h>
 #include <linux/sched_clock.h>
 
@@ -232,6 +234,7 @@ static struct clocksource mct_frc = {
 	.mask		= CLOCKSOURCE_MASK(32),
 	.flags		= CLOCK_SOURCE_IS_CONTINUOUS,
 	.resume		= exynos4_frc_resume,
+	.owner		= THIS_MODULE,
 };
 
 /*
@@ -256,7 +259,7 @@ static cycles_t exynos4_read_current_timer(void)
 }
 #endif
 
-static int __init exynos4_clocksource_init(struct mct_context *ctx, bool frc_shared)
+static int __init_or_module exynos4_clocksource_init(struct mct_context *ctx, bool frc_shared)
 {
 	/*
 	 * When the frc is shared, the main processor should have already
@@ -343,6 +346,7 @@ static struct mct_clock_event_device mct_comp_device = {
 		.set_state_oneshot	= mct_set_state_shutdown,
 		.set_state_oneshot_stopped = mct_set_state_shutdown,
 		.tick_resume		= mct_set_state_shutdown,
+		.owner			= THIS_MODULE,
 	},
 };
 
@@ -484,6 +488,7 @@ static int exynos4_mct_starting_cpu(unsigned int cpu)
 	evt->features = CLOCK_EVT_FEAT_PERIODIC | CLOCK_EVT_FEAT_ONESHOT |
 			CLOCK_EVT_FEAT_PERCPU;
 	evt->rating = MCT_CLKEVENTS_RATING;
+	evt->owner = THIS_MODULE;
 
 	exynos4_mct_write(TICK_BASE_CNT, mevt->base + MCT_L_TCNTB_OFFSET);
 
@@ -520,7 +525,7 @@ static int exynos4_mct_dying_cpu(unsigned int cpu)
 	return 0;
 }
 
-static int __init exynos4_timer_resources(struct mct_context *ctx,
+static int __init_or_module exynos4_timer_resources(struct mct_context *ctx,
 					  struct device_node *np)
 {
 	struct clk *mct_clk, *tick_clk;
@@ -549,7 +554,7 @@ static int __init exynos4_timer_resources(struct mct_context *ctx,
  * @local_idx: array mapping CPU numbers to local timer indices
  * @nr_local: size of @local_idx array
  */
-static int __init exynos4_timer_interrupts(struct mct_context *ctx,
+static int __init_or_module exynos4_timer_interrupts(struct mct_context *ctx,
 					   struct device_node *np,
 					   const u32 *local_idx,
 					   size_t nr_local)
@@ -662,7 +667,7 @@ static int __init exynos4_timer_interrupts(struct mct_context *ctx,
 	return err;
 }
 
-static int __init mct_init_dt(struct mct_context *ctx, struct device_node *np)
+static int __init_or_module mct_init_dt(struct mct_context *ctx, struct device_node *np)
 {
 	bool frc_shared = of_property_read_bool(np, "samsung,frc-shared");
 	u32 local_idx[MCT_NR_LOCAL] = {0};
@@ -722,7 +727,9 @@ static const struct of_device_id exynos4_mct_match_table[] = {
 	{ .compatible = "samsung,exynos4412-mct", .data = &exynos4412_mct_data, },
 	{}
 };
+MODULE_DEVICE_TABLE(of, exynos4_mct_match_table);
 
+#if defined(CONFIG_ARM)
 /* Note, legacy ARM 32-bit systems depend on the MCT as the only clocksource
  * which requires this driver to be initialized very early. We need to keep this
  * special condition until we can transparently support modular and early init
@@ -748,13 +755,11 @@ static int __init mct_of_declare_init(struct device_node *np)
 	if (ret)
 		goto out_ctx;
 
-#if defined(CONFIG_ARM)
 	sched_clock_register(exynos4_read_sched_clock, 32, ctx->clk_rate);
 
 	exynos4_delay_timer.read_current_timer = &exynos4_read_current_timer;
 	exynos4_delay_timer.freq = ctx->clk_rate;
 	register_current_timer_delay(&exynos4_delay_timer);
-#endif
 
 	return 0;
 
@@ -764,3 +769,37 @@ static int __init mct_of_declare_init(struct device_node *np)
 }
 TIMER_OF_DECLARE(exynos4210, "samsung,exynos4210-mct", mct_of_declare_init);
 TIMER_OF_DECLARE(exynos4412, "samsung,exynos4412-mct", mct_of_declare_init);
+#else
+static int exynos4_mct_probe(struct platform_device *pdev)
+{
+	struct mct_context *ctx;
+	struct device *dev = &pdev->dev;
+
+	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
+	if (!ctx)
+		return -ENOMEM;
+
+	ctx->drvdata = of_device_get_match_data(dev);
+	if (!ctx->drvdata)
+		return -EINVAL;
+
+	return mct_init_dt(ctx, dev->of_node);
+}
+
+static struct platform_driver exynos4_mct_driver = {
+	.probe		= exynos4_mct_probe,
+	.driver		= {
+		.name	= "exynos-mct",
+		.of_match_table = exynos4_mct_match_table,
+	},
+};
+
+static int __init exynos_mct_init(void)
+{
+	return platform_driver_register(&exynos4_mct_driver);
+}
+module_init(exynos_mct_init);
+
+MODULE_DESCRIPTION("Exynos Multi Core Timer Driver");
+MODULE_LICENSE("GPL");
+#endif /* CONFIG_ARM */
-- 
2.52.0.223.gf5cc29aaa4-goog


