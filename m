Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB61BC83F26
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Jul 2025 09:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZsoNTEfmfMdvFP0lv+IxaAbjZbzLYpdHn40uDlPZMSg=; b=bM/dcMY2MVGXA4HGwSHqqqvG7H
	pCFDeR7RSE1ktU78k12f4mblM76vBapw+hsQVfnlwZfjmunGN1YDhrB/EZu5qc70Zv2ZE41huh4gk
	UWIO/1La8dwOr9awj+WLOIh6CFfhSXneV4zOrIjDm+4eXCLnU1lX7+smDlVkRb3SYvUlxwFv/mUrx
	P1mn+rTZdvi584AnNAVra9qh9kc7q6sfW2lr23oAFlqtj3w36w+7RtmrFCcHvIRIs1eHiDjLp5oR/
	c5Nlkg8AMB3nwNxdSKteoSFBtjyIYGytAy34HZcDooFAKrhl0WyaxnZOqQQUnZzZQnb+YbSx/UPD7
	a8a3v/IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufENu-00000009QLX-1Hi7;
	Fri, 25 Jul 2025 09:06:34 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufELQ-00000009Q3F-0j0d
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Jul 2025 09:04:01 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-3b7766698eeso34370f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Jul 2025 02:03:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753434238; x=1754039038; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZsoNTEfmfMdvFP0lv+IxaAbjZbzLYpdHn40uDlPZMSg=;
        b=y3dfSnazO6N1d5Us4+fc8sSNr61HOJzA/FivxmcMo6trpMFxUVcAfj1kSQzbrPG5ap
         rJygUk63wawi6CwMEgJasW03XMJBdS+czlNXrwzMRzEJXInWixTsCg+xtV/sS6F4IHoA
         +4sIrS26x13bCjq/pTUtyg6ZqqBjoYKy2gfszPj6wvVgbvtPfi7RkzxCNjuvDM/4Gfi6
         rW9ITJ+uIBTO6/+UpGGe7pX8qL5A9FCYkwvkocZhWhQtQ04An/BCSd/j8n3EtsPX0i7C
         RvmkwKHOeMp5Szc60UWGq7poFNPPvIVJ6MfBaRe081I8sM9bQfywPj8gUpk3L1ZRl7FS
         FADQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753434238; x=1754039038;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZsoNTEfmfMdvFP0lv+IxaAbjZbzLYpdHn40uDlPZMSg=;
        b=QgXZFAG4Qyfmc+rQ/EJJmwYw6JJz+2CYhJTo+O/KM1qvga+J9YGxhdj7+WEyX9wAmo
         RaKUrqwBVdlvpm3//omwsv6vX8ouq07IZvtYkSC/mV+N1Ih7I9E433RCS7Jiubl5rBkL
         vXX6MKyUEDGBRu2MeLNRiKqOnb8ceO3gpq1oAxchIIZuBlDuFz+funRkOMQ57vvUO/Kc
         W5sbIAhK2f0Mr/zfU/UDiXoeDQXPmmlNctS1PPiZmq7ingqpNyNP6OxQN/goAlTlJRHK
         JQ00fjPqqWTWdctlE6XUpZh7cBSTLCq4a7FjBFNz6t7tibN5CM+MJCPYsiSsCxHwBxs1
         HuLA==
X-Forwarded-Encrypted: i=1; AJvYcCWBEVn4nKzVxv/FmZkTEYNL8X3jc8xoOHlO//xC5D4NbrJMxsiZeoRMxymTT9bQVPNlR3xeZH0zPW8OFLVjZXG+@lists.infradead.org
X-Gm-Message-State: AOJu0YxPrChq9woMvtpHkxL+dKFf272L9ItMMzXKrnZC7I8e04Ia/Xda
	/6xQPK2fbA8YAd5xO0sY6/dU4Kc5Zvp+f/+ut7Izq18JET3QQdIz+eHJH2Wyv/pXx4Q=
X-Gm-Gg: ASbGncsoCFMA38wcRvTcnv3MIA/GbVoQjRQvjXF/C81CtD7YU+qWaABZpPkEoMxGDgy
	sdRjvlUFQ3kf4frlTefoz2wGn58YOJql3OGIHvGtuy0jbSm3LfISnxOwh8ZGBlck+We3Ep1fReQ
	VP4ticsgdy8sQq/RF7jkzsuaTPhdBHmnzeuSs+foml91iHRMpjjEnBnT46oaavTgyyvIWRGoEx5
	ttmIKd+kTiumdru8acdBQrU3UZh2Gm6BYHpQsiXN5aukPdAhZjTEUFAGtrbU1VGtMgC1o+w6S+/
	crQadSGr1MAB2OpZpSBdcmWtNTjn0EBdoIn5TUxiYrAGlnkSufyyL2qy/P0nnPv3+JcCDcnAtGX
	N8Qw44AxdL8hMUHHIhQDSlJIGEOfIPN6m
X-Google-Smtp-Source: AGHT+IGNh7egRS4Kex6r927tL9H0Aj3/PBwDBRA+aKAvEzjTyuXGGLNytvVXgOYRLookHqQtsKhc7Q==
X-Received: by 2002:a5d:5d84:0:b0:3a4:e0ad:9aa5 with SMTP id ffacd0b85a97d-3b77675b226mr421712f8f.11.1753434238420;
        Fri, 25 Jul 2025 02:03:58 -0700 (PDT)
Received: from kuoka.. ([178.197.203.90])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b76fc6d1b0sm4457094f8f.18.2025.07.25.02.03.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 02:03:57 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Will McVicker <willmcvicker@google.com>,
	Youngmin Nam <youngmin.nam@samsung.com>,
	Donghoon Yu <hoony.yu@samsung.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] clocksource/drivers/exynos_mct: Revert commits causing section mismatches
Date: Fri, 25 Jul 2025 11:03:50 +0200
Message-ID: <20250725090349.87730-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6066; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=6vM1EJPOw6Q4Qtlb27Cb82oUvYEiD6W/XiM1RMs35fE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBog0h1G5Uk9Pte6K2erF5TqunuTTBgTDpGsrvV8
 TEOHz0s63OJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaINIdQAKCRDBN2bmhouD
 1wWRD/98MncWXJ487P4kJKVuFRECgj7W6JrPbTWD1EFBGsiBhmOGCRM2RSyKQZXGViRmQsThRHa
 g+al4JPMNu8ZgRgoH3scYChiRxjmHMa6WjuNpLtX5V2RoH3KwZciSSpvxXJgeakJ77f5NpzwsVx
 rzQwovhhoLN4sbRTX5R4a+Qc7aO/U0ClyYZjPFFPc44D6XBocWK/4q3Y21WGmSXSOGbIWCwNc5/
 EBZ1xXzPPQ2PyEkLQiLgkWpkoHCe+09gm0M/ACxlRm4mdiX9uNJ+4qTjSeIl04LnNX3qNQ+Lriv
 DLeJuuFv1Nqm7zo96pkaLRwt5itojLI/iMHiHwBjERAXVn3atyB7tsj/DZOp1hB9LXtzruJ5Kup
 3/Hk+iDz2QXx8qjyvdK1r75tEg3nBBCCjLmEGbcGHHaSeU26N4auuX1FQTCqJXvV+hoTDNNhAtH
 ufJdEUHbyKyWQr6RyiJM3qRDjne0af36YX5iQcRJL+SAuw55jf6ITi3yIRqI/ygPC4uHNUOVOVw
 aU+/QY00QV0d0rrJvObAsiuj4pgMjRUgVGHLcq+J2WzDCnnr0mtqNVRGw2gmlLAN/0ZvsC7Z1PG
 Km9rBuMIgYmOBCqKlj/X7w5dfahbhLGiavdVXuI03ZtzHJeS5OLteenkWBtg5k3EgDcwSnrx92w Lji1FxNr7fmWU5w==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_020400_222531_3122611E 
X-CRM114-Status: GOOD (  19.04  )
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

Commit 5d86e479193b ("clocksource/drivers/exynos_mct: Add module
support") introduced section mismatch failures.
Commit 7e477e9c4eb4 ("clocksource/drivers/exynos_mct: Fix section
mismatch from the module conversion") replaced these to other section
mismatch failures:

  WARNING: modpost: vmlinux: section mismatch in reference: mct_init_dt+0x164 (section: .text) -> register_current_timer_delay (section: .init.text)
  WARNING: modpost: vmlinux: section mismatch in reference: mct_init_dt+0x20c (section: .text) -> register_current_timer_delay (section: .init.text)
  ERROR: modpost: Section mismatches detected.

No progress on real fixing of these happened (intermediary fix was still
not tested), so revert both commits till the work is prepared correctly.

Fixes: 7e477e9c4eb4 ("clocksource/drivers/exynos_mct: Fix section mismatch from the module conversion")
Fixes: 5d86e479193b ("clocksource/drivers/exynos_mct: Add module support")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

First build failure:
https://krzk.eu/#/builders/12/builds/3350
---
 drivers/clocksource/Kconfig      |  3 +-
 drivers/clocksource/exynos_mct.c | 51 ++++++--------------------------
 2 files changed, 10 insertions(+), 44 deletions(-)

diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
index d657c8ddc96b..645f517a1ac2 100644
--- a/drivers/clocksource/Kconfig
+++ b/drivers/clocksource/Kconfig
@@ -451,8 +451,7 @@ config ATMEL_TCB_CLKSRC
 	  Support for Timer Counter Blocks on Atmel SoCs.
 
 config CLKSRC_EXYNOS_MCT
-	tristate "Exynos multi core timer driver" if ARM64
-	default y if ARCH_EXYNOS || COMPILE_TEST
+	bool "Exynos multi core timer driver" if COMPILE_TEST
 	depends on ARM || ARM64
 	depends on ARCH_ARTPEC || ARCH_EXYNOS || COMPILE_TEST
 	help
diff --git a/drivers/clocksource/exynos_mct.c b/drivers/clocksource/exynos_mct.c
index 80d263ee046d..62febeb4e1de 100644
--- a/drivers/clocksource/exynos_mct.c
+++ b/drivers/clocksource/exynos_mct.c
@@ -15,11 +15,9 @@
 #include <linux/cpu.h>
 #include <linux/delay.h>
 #include <linux/percpu.h>
-#include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_irq.h>
 #include <linux/of_address.h>
-#include <linux/platform_device.h>
 #include <linux/clocksource.h>
 #include <linux/sched_clock.h>
 
@@ -219,7 +217,6 @@ static struct clocksource mct_frc = {
 	.mask		= CLOCKSOURCE_MASK(32),
 	.flags		= CLOCK_SOURCE_IS_CONTINUOUS,
 	.resume		= exynos4_frc_resume,
-	.owner		= THIS_MODULE,
 };
 
 /*
@@ -244,7 +241,7 @@ static cycles_t exynos4_read_current_timer(void)
 }
 #endif
 
-static int exynos4_clocksource_init(bool frc_shared)
+static int __init exynos4_clocksource_init(bool frc_shared)
 {
 	/*
 	 * When the frc is shared, the main processor should have already
@@ -339,7 +336,6 @@ static struct clock_event_device mct_comp_device = {
 	.set_state_oneshot	= mct_set_state_shutdown,
 	.set_state_oneshot_stopped = mct_set_state_shutdown,
 	.tick_resume		= mct_set_state_shutdown,
-	.owner			= THIS_MODULE,
 };
 
 static irqreturn_t exynos4_mct_comp_isr(int irq, void *dev_id)
@@ -480,7 +476,6 @@ static int exynos4_mct_starting_cpu(unsigned int cpu)
 	evt->features = CLOCK_EVT_FEAT_PERIODIC | CLOCK_EVT_FEAT_ONESHOT |
 			CLOCK_EVT_FEAT_PERCPU;
 	evt->rating = MCT_CLKEVENTS_RATING;
-	evt->owner = THIS_MODULE;
 
 	exynos4_mct_write(TICK_BASE_CNT, mevt->base + MCT_L_TCNTB_OFFSET);
 
@@ -516,7 +511,7 @@ static int exynos4_mct_dying_cpu(unsigned int cpu)
 	return 0;
 }
 
-static int exynos4_timer_resources(struct device_node *np)
+static int __init exynos4_timer_resources(struct device_node *np)
 {
 	struct clk *mct_clk, *tick_clk;
 
@@ -544,7 +539,7 @@ static int exynos4_timer_resources(struct device_node *np)
  * @local_idx: array mapping CPU numbers to local timer indices
  * @nr_local: size of @local_idx array
  */
-static int exynos4_timer_interrupts(struct device_node *np,
+static int __init exynos4_timer_interrupts(struct device_node *np,
 					   unsigned int int_type,
 					   const u32 *local_idx,
 					   size_t nr_local)
@@ -657,7 +652,7 @@ static int exynos4_timer_interrupts(struct device_node *np,
 	return err;
 }
 
-static __init_or_module int mct_init_dt(struct device_node *np, unsigned int int_type)
+static int __init mct_init_dt(struct device_node *np, unsigned int int_type)
 {
 	bool frc_shared = of_property_read_bool(np, "samsung,frc-shared");
 	u32 local_idx[MCT_NR_LOCAL] = {0};
@@ -705,43 +700,15 @@ static __init_or_module int mct_init_dt(struct device_node *np, unsigned int int
 	return exynos4_clockevent_init();
 }
 
-static __init_or_module int mct_init_spi(struct device_node *np)
+
+static int __init mct_init_spi(struct device_node *np)
 {
 	return mct_init_dt(np, MCT_INT_SPI);
 }
 
-static __init_or_module int mct_init_ppi(struct device_node *np)
+static int __init mct_init_ppi(struct device_node *np)
 {
 	return mct_init_dt(np, MCT_INT_PPI);
 }
-
-static int exynos4_mct_probe(struct platform_device *pdev)
-{
-	struct device *dev = &pdev->dev;
-	int (*mct_init)(struct device_node *np);
-
-	mct_init = of_device_get_match_data(dev);
-	if (!mct_init)
-		return -EINVAL;
-
-	return mct_init(dev->of_node);
-}
-
-static const struct of_device_id exynos4_mct_match_table[] = {
-	{ .compatible = "samsung,exynos4210-mct", .data = &mct_init_spi, },
-	{ .compatible = "samsung,exynos4412-mct", .data = &mct_init_ppi, },
-	{}
-};
-MODULE_DEVICE_TABLE(of, exynos4_mct_match_table);
-
-static struct platform_driver exynos4_mct_driver = {
-	.probe		= exynos4_mct_probe,
-	.driver		= {
-		.name	= "exynos-mct",
-		.of_match_table = exynos4_mct_match_table,
-	},
-};
-module_platform_driver(exynos4_mct_driver);
-
-MODULE_DESCRIPTION("Exynos Multi Core Timer Driver");
-MODULE_LICENSE("GPL");
+TIMER_OF_DECLARE(exynos4210, "samsung,exynos4210-mct", mct_init_spi);
+TIMER_OF_DECLARE(exynos4412, "samsung,exynos4412-mct", mct_init_ppi);
-- 
2.48.1


