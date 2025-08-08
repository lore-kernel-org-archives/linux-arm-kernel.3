Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7D68C87FD2
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Aug 2025 10:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=btGvPQZiWOXn0B7/gk/rJTMjXaXvcBsb2KTNKeGgrXA=; b=k9PGiOJF0fHCgGrMsyH9WMH8MJ
	G1p0cyYQjQC/ji7reDz2dYZZXsSZ+5o4Xwv9K2c/4nXs6CTQ6psGYAiqENxGp0THCpBzr4+wJzZCJ
	CPmhlAeSFv1QADPm6pkW1/Vx9/+lRrfxs2hS+Z3CzYZKm2p5gT3kiyFThMOFTacQAjqpGDvzUpnOH
	fDAsIY792gLVjzngcFTnL3XTU74SNTnjszoc+GWopZFL+1T84JWEFrzxhlCrle0g1zQmHlASIvYyh
	DTTp+00WB1HGukAizTgjHif7ibcw3u2ZU3bxn0biDQ1jdWLegRipYPWR2PxO17tmhQV59dG6oQ2u4
	xe+Y2QeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukKfI-00000002cC5-0MnA;
	Fri, 08 Aug 2025 10:49:36 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukKSO-00000002Zqg-3GjA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Aug 2025 10:36:18 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-af949bdf36cso348058066b.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 Aug 2025 03:36:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1754649375; x=1755254175; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=btGvPQZiWOXn0B7/gk/rJTMjXaXvcBsb2KTNKeGgrXA=;
        b=mE1eWXBc2Y9qJigB17rLNUaUCz+o7EH2E4GIY+AU//SU5tdpOGK4CEWK/Qd0SosLVU
         qoo5QvqEavHd2JPrLssOeULDPQyaJG+4dQ1T4tSKwwAbsxBLxREPlveJaFpdDiambLOo
         T2miSRbZlI9C5jRFHx2isVckUWbNsf0YYlR13gTkbAs8g+VlxC8PieiosXTuSRIRla5R
         vNOE3wa1LbqH/GpLYjaiMPO9d7V2xRun47Y43mj/iPwoK0Oq/rmZk+awJhW4Fu86Ey2F
         ixnVevEQ70gNJeokNpxRgQVkqcq1doV60ZRpPi2EBwkZBX812T9dFbhkyZaX1Df9mly9
         2ZdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754649375; x=1755254175;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=btGvPQZiWOXn0B7/gk/rJTMjXaXvcBsb2KTNKeGgrXA=;
        b=XkL4MCYMgBkqI7u+pz58O4JuN9bP969K83OsT1HQZmewVymEhaYctNqduwi8UYa9io
         NmChZ+E7CXjbuvvquJ6T5y/Qan9vTaQygN3zWdE6fxJd3IEMwap3iJbxNm9Rxqd7bH+v
         ZX9tf+AvHIt5Nry8khjuJVLQLERbYb4PtMWe2VAzvx8QZLUtm+WOIRhKYRrp4e+80che
         roIMpMruvefK6SjsRQyVY3P3QzW9QxTQXO/TFtYShIEk41h19xYt2t10p+kKRifBVZ+X
         qUKe4WTCfmquRv8FNFuyUgXHeEnzAHCufLosYkZR2R0RiHm8t/ZC+obE8LQeQCeVexwx
         YTxw==
X-Forwarded-Encrypted: i=1; AJvYcCW9+OpTW6OJ86kb0BQzL4z0OWUaFAaLz6Ex11PjSYLiFHIV+APwgsOMHzjhF44bfCEjVNgrb6oK2aoDnva0Bet2@lists.infradead.org
X-Gm-Message-State: AOJu0YwGhGKEU7+Te/1VP4EI7AmsItpWS6L6VsrQQ7wr71kWT2PVZmxf
	5g6uVuptnvCA3vUI1hsSICTF+RqmxhPCGdnom4d7HF/iOlQhrpOZbP7Rm665GsrIt5g=
X-Gm-Gg: ASbGnctD7NCFxgZ3vCzjyPxgdIQQ06SNsAqjJllUxumkW4MJ/h6wk8CVKTjFcc9eRdB
	ueK4onCuywvopvAGJtTwilXhgt9YYx6xm+1IMBGwAcdZ3gvcPuxDrJnvfUMYELm7Ns0Fhr3lQjL
	P40cKZLjRSlGNU+lZKK7SbonWCh//n3IRxRaYULEQqM6rNWirweL7MBEpVTp05+0QPvOAgrSkon
	gLGcAh3g/P3WItEPF4P/6FVqNPFjuxebjnxIcat2XyeoLvhBJfqxLBFecdm47N5LThTBzq4j2/k
	ymwpivx4zPj1D1ZCe8O+jFhEfZc7poZGfBXwidQs32GAsX58MN0l6zZfnpmPh0AAWjtOsB7ZzEX
	R2QvTa9Y8eeVc83uGCQ==
X-Google-Smtp-Source: AGHT+IHPJarRWHkntpryCQMay/z/dGeZNCx9bTRjfxRmN868x4k6N/J3VqA3kieOj4uH956h/8KgfQ==
X-Received: by 2002:a17:907:7f25:b0:af9:8d62:b1ab with SMTP id a640c23a62f3a-af9c6377171mr240207166b.10.1754649374718;
        Fri, 08 Aug 2025 03:36:14 -0700 (PDT)
Received: from localhost ([2001:4090:a244:8691:4b7a:7bbd:bac:c56e])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-af91a0a1bf9sm1478135166b.31.2025.08.08.03.36.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Aug 2025 03:36:14 -0700 (PDT)
From: Markus Schneider-Pargmann <msp@baylibre.com>
Date: Fri, 08 Aug 2025 12:35:21 +0200
Subject: [PATCH] clocksource/drivers/arm_global_timer: Add auto-detection
 for initial prescaler values
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250808-topic-am43-arm-global-timer-v6-16-v1-1-82067d327580@baylibre.com>
X-B4-Tracking: v=1; b=H4sIAOjSlWgC/x3NwQqDMAyA4VeRnBdonQvdXmV4iF10AWslFRmI7
 27Z8bv8/wFFTKXAqznAZNeieanwtwbil5dJUD/V0Lr24YILuOVVI3Lq7siWcJrzwDNumsRwJ/S
 ERGN0kZ7B8wC1s5qM+vs/3v15XiqB6NFzAAAA
X-Change-ID: 20250808-topic-am43-arm-global-timer-v6-16-66fc0c6981ab
To: Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Patrice Chotard <patrice.chotard@foss.st.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 "Mendez, Judith" <jm@ti.com>, Kevin Hilman <khilman@baylibre.com>, 
 Markus Schneider-Pargmann <msp@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5483; i=msp@baylibre.com;
 h=from:subject:message-id; bh=JcZGTciaD4zebk7GYD3eQi8/W1xLrBL3TKgjtTdUqbo=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhoypl8Ve2F1+911mjeheTTud/v0S97/eFJ93sMzoiUnvt
 K9VHxPZOkpZGMS4GGTFFFk6E0PT/svvPJa8aNlmmDmsTCBDGLg4BWAiGa2MDPNlVnicO/WObc+b
 ygrN90f3V7o+3NM72dQqbVW6p/rvE7mMDAcOVfSlnNW/ZqbLuXtq0+Qbu/fM8NHQ323vkLHZ4dI
 qW34A
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250808_033617_063294_F2D23457 
X-CRM114-Status: GOOD (  23.54  )
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

am43xx has a clock tree where the global timer clock is an indirect child
of the CPU clock used for frequency scaling:

  dpll_mpu_ck -- CPU/cpufreq
        |
        v
  dpll_mpu_m2_ck -- divider
        |
        v
  mpu_periphclk -- fixed divider by 2 used for global timer

When CPU frequency changes, the global timer's clock notifier rejects
the change because the hardcoded prescaler (1 or 2) cannot accommodate
the frequency range across all CPU OPPs (300, 600, 720, 800, 1000 MHz).

Add platform-specific prescaler auto-detection to solve this issue:

- am43xx: prescaler = 50 (calculated as initial_freq/GCD of all OPP
  freqs) This allows the timer to work across all CPU frequencies after
  the fixed divider by 2. Tested on am4372-idk-evm.

- zynq-7000: prescaler = 2 (preserves previous Kconfig default)

- Other platforms: prescaler = 1 (previous default)

The Kconfig option now defaults to 0 (auto-detection) but can still
override the auto-detected value when set to a non-zero value,
preserving existing customization workflows.

Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
---
 drivers/clocksource/Kconfig            |  4 ++--
 drivers/clocksource/arm_global_timer.c | 44 ++++++++++++++++++++++++++++++----
 2 files changed, 41 insertions(+), 7 deletions(-)

diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
index 645f517a1ac26d0c12d4b2b46591321ddf6e20b3..92df191b25b1af339dffc791f81ff541b09a87a8 100644
--- a/drivers/clocksource/Kconfig
+++ b/drivers/clocksource/Kconfig
@@ -395,8 +395,7 @@ config ARM_GLOBAL_TIMER
 
 config ARM_GT_INITIAL_PRESCALER_VAL
 	int "ARM global timer initial prescaler value"
-	default 2 if ARCH_ZYNQ
-	default 1
+	default 0
 	depends on ARM_GLOBAL_TIMER
 	help
 	  When the ARM global timer initializes, its current rate is declared
@@ -406,6 +405,7 @@ config ARM_GT_INITIAL_PRESCALER_VAL
 	  bounds about how much the parent clock is allowed to decrease or
 	  increase wrt the initial clock value.
 	  This affects CPU_FREQ max delta from the initial frequency.
+	  Use 0 to use auto-detection in the driver.
 
 config ARM_TIMER_SP804
 	bool "Support for Dual Timer SP804 module"
diff --git a/drivers/clocksource/arm_global_timer.c b/drivers/clocksource/arm_global_timer.c
index 2d86bbc2764a04944e453038013142b2495d26b9..5e3d6bb7e437badeba45d8bf2c1df14eb3427448 100644
--- a/drivers/clocksource/arm_global_timer.c
+++ b/drivers/clocksource/arm_global_timer.c
@@ -263,14 +263,13 @@ static void __init gt_delay_timer_init(void)
 	register_current_timer_delay(&gt_delay_timer);
 }
 
-static int __init gt_clocksource_init(void)
+static int __init gt_clocksource_init(unsigned int psv)
 {
 	writel(0, gt_base + GT_CONTROL);
 	writel(0, gt_base + GT_COUNTER0);
 	writel(0, gt_base + GT_COUNTER1);
 	/* set prescaler and enable timer on all the cores */
-	writel(FIELD_PREP(GT_CONTROL_PRESCALER_MASK,
-			  CONFIG_ARM_GT_INITIAL_PRESCALER_VAL - 1) |
+	writel(FIELD_PREP(GT_CONTROL_PRESCALER_MASK, psv - 1) |
 	       GT_CONTROL_TIMER_ENABLE, gt_base + GT_CONTROL);
 
 #ifdef CONFIG_CLKSRC_ARM_GLOBAL_TIMER_SCHED_CLOCK
@@ -338,11 +337,45 @@ static int gt_clk_rate_change_cb(struct notifier_block *nb,
 	return NOTIFY_DONE;
 }
 
+struct gt_prescaler_config {
+	const char *compatible;
+	unsigned long prescaler;
+};
+
+static const struct gt_prescaler_config gt_prescaler_configs[] = {
+	/*
+	 * On am43 the global timer clock is a child of the clock used for CPU
+	 * OPPs, so the initial prescaler has to be compatible with all OPPs
+	 * which are 300, 600, 720, 800 and 1000 with a fixed divider of 2, this
+	 * gives us a GCD of 10. Initial frequency is 1000, so the prescaler is
+	 * 50.
+	 */
+	{ .compatible = "ti,am43", .prescaler = 50 },
+	{ .compatible = "xlnx,zynq-7000", .prescaler = 2 },
+	{ .compatible = NULL }
+};
+
+static unsigned long gt_get_initial_prescaler_value(struct device_node *np)
+{
+	const struct gt_prescaler_config *config;
+
+	if (CONFIG_ARM_GT_INITIAL_PRESCALER_VAL != 0)
+		return CONFIG_ARM_GT_INITIAL_PRESCALER_VAL;
+
+	for (config = gt_prescaler_configs; config->compatible; config++) {
+		if (of_machine_is_compatible(config->compatible))
+			return config->prescaler;
+	}
+
+	return 1;
+}
+
 static int __init global_timer_of_register(struct device_node *np)
 {
 	struct clk *gt_clk;
 	static unsigned long gt_clk_rate;
 	int err;
+	unsigned long psv;
 
 	/*
 	 * In A9 r2p0 the comparators for each processor with the global timer
@@ -378,8 +411,9 @@ static int __init global_timer_of_register(struct device_node *np)
 		goto out_unmap;
 	}
 
+	psv = gt_get_initial_prescaler_value(np);
 	gt_clk_rate = clk_get_rate(gt_clk);
-	gt_target_rate = gt_clk_rate / CONFIG_ARM_GT_INITIAL_PRESCALER_VAL;
+	gt_target_rate = gt_clk_rate / psv;
 	gt_clk_rate_change_nb.notifier_call =
 		gt_clk_rate_change_cb;
 	err = clk_notifier_register(gt_clk, &gt_clk_rate_change_nb);
@@ -404,7 +438,7 @@ static int __init global_timer_of_register(struct device_node *np)
 	}
 
 	/* Register and immediately configure the timer on the boot CPU */
-	err = gt_clocksource_init();
+	err = gt_clocksource_init(psv);
 	if (err)
 		goto out_irq;
 

---
base-commit: 038d61fd642278bab63ee8ef722c50d10ab01e8f
change-id: 20250808-topic-am43-arm-global-timer-v6-16-66fc0c6981ab

Best regards,
-- 
Markus Schneider-Pargmann <msp@baylibre.com>


