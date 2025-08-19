Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A82CCA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 08:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tnZk+Dq5pVLCqYugFkq/rFRBfkBcZKXShdlCaPfswJo=; b=Noul8z1pzPS5DSFJMUUtiysmHN
	ZkBno5pJy3b8UkJNkagYDU/qEatEpSmbkga2lr6RnRrljSOJ5pRNZS4CfMGQ9p3v9HTIexaCTK0rQ
	nMzVdgRgqEljWBgK0KJV9C8fzJj3rvC9nt9nJhV8fV2SX6vQ4kV2WqOzDIU6ug8XS6TaZ/Ku4CJeR
	xADWd6xIMyZgg6B2vnagXA8AMei1dDf21LcO/p7OGc2wA+s1BBPC0iTHg3Jbye+s8Klx1VevnGgJs
	dczPGbsKUDNY2iJqepHCAtKvnpa4UBYlF//kbyZLt8we40lLJTpjKNppv1omOzbZUn/GTH1MzY7DM
	NdmP3sMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoHiy-00000009oKc-3gKP;
	Tue, 19 Aug 2025 08:29:44 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoH9N-00000009jSN-0vMj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 07:52:59 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-afcb78c66dcso701025266b.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 00:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1755589975; x=1756194775; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tnZk+Dq5pVLCqYugFkq/rFRBfkBcZKXShdlCaPfswJo=;
        b=yXnJICN1im2jOG40SqyTrzWdxFXZZRKWVw1wQ0HkeOB669riKQE4qtxgL9F0IKxYOs
         Fgl9FanBbu+9uwKGOg5c6LAYufVtjdzi5To/ruMlHeGLu8tM/DQXtjSmsBcCM2kmtaak
         zyjUntvZPWfhkyHSKF20F6lZMibQKRt77+qYw4SuUKgFxMmf9Jo+enogpBiLm+QLdQn8
         xTMOfU8rdSiZVWJYwg6dj7QX4e12YvSaRecpLtCQnsOlMkIN9cb7iGYm/E2G98fNhw62
         JCEBk6NXSNVrQkN501vf4NRlUCizDXMoD7kIt40VUSFYNBP+EeMva0fQYDCHugh2dq5U
         5ikQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755589975; x=1756194775;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tnZk+Dq5pVLCqYugFkq/rFRBfkBcZKXShdlCaPfswJo=;
        b=sFtdXOwEgPl+Mkkz5HVeVSMRHn+Ebe7J1dy5KQwwozyk8wqAk/le440TRdQ0ihiXw6
         j/X+jdufw4SoJ+ix/v9mPCRB4YWMSDZ67T+FQhWGqBC8d8Y9zFHP92HgSTUG0/LlWiZa
         mdtx2ZpUcew305XedXgILmwlB9xctmvUwQd0PJSZOmUJ6v//oYrlKBk5HnkW7eOvluqz
         pQ2YHte1CGjnCExPuzaxeTVk9jI/SnR+uksQilZWkAbEWfzTSyLIv+8aXwoRxXW12pG1
         V846JX07xqaGAAGMJdzv95IvAGRKyIhhjyL+Nbhtd6o8a9snUfwZDn9jxY5Utoh6QbXs
         amGA==
X-Forwarded-Encrypted: i=1; AJvYcCUDLYnU/qk/qx/TmZhsrXtCuBNAyHwgCnOBJtDTCCZbSuGt1QNkca3A5l4mRURnHGRAmAlnGoPCPUA7HS/nOub6@lists.infradead.org
X-Gm-Message-State: AOJu0YwzDkz7MqC6nbknUS89WuVKYM2TUGpYKGddVDGKLrFN6/6R5Sbv
	fOdnIaDDIL+D30BX6p8slI+VKC5qCXDXwY7IbEl62B5V8A6ZR8B7SyNo2paEtWxOJrc=
X-Gm-Gg: ASbGnctFOgGFcpejtHSLII1VyxYc29BWnu82QCpMO+Wrx5Pofj0pevkj+0XO5mucaKg
	oYrfn90IYDDeRuzpDRhw2SV3iElW1zu4PpQkSqO4JG7pVG5O7SnD4mB/vaeREyQMhhkCids6Yna
	GOmTSxvD6K77v18tfi9fgqd10qTR07ay37eGNIci6T707rqbLY4lFNDibXQiYZ/aa+v5l/OLZQ0
	WmLm7kPpSBkoF6UAKA2MRRFtdcqr1gxjcZyzobdmLkxshQoO/oPnKZ1TJ+3gAyj5k/PkJ3U/e6f
	x4i5HU3hcKE8pYI5SoScwQG2+YVoliCAWOFo8YwoHmFUuwJIhmC/V+iXfFL9nAYyb7RiPeylCDX
	qpguMshcgs7oeIza7CQ==
X-Google-Smtp-Source: AGHT+IFyJ+Vk10rgdQW1uK7bd8eUmV3xvgLBqXlkJPVA1/vrzHUujvO97X9ocMR8gxA5zTahLQaLVQ==
X-Received: by 2002:a17:907:96a9:b0:af9:1411:9fcc with SMTP id a640c23a62f3a-afddc957097mr167714066b.3.1755589975111;
        Tue, 19 Aug 2025 00:52:55 -0700 (PDT)
Received: from localhost ([2001:4090:a245:849b:bc8d:b969:7631:815])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-61a757bc1b4sm1252537a12.49.2025.08.19.00.52.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 00:52:54 -0700 (PDT)
From: Markus Schneider-Pargmann <msp@baylibre.com>
Date: Tue, 19 Aug 2025 09:52:41 +0200
Subject: [PATCH v2] clocksource/drivers/arm_global_timer: Add
 auto-detection for initial prescaler values
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250819-topic-am43-arm-global-timer-v6-16-v2-1-6d082e2a5161@baylibre.com>
X-B4-Tracking: v=1; b=H4sIAEgtpGgC/5WNQQ6DIBAAv2I4dxvAirSn/qPxABR1ExGzGFJj/
 HupP+hx5jCzs+QJfWKPamfkMyaMcwF5qZgbzTx4wHdhJrlsuOYa1rigAxNuNRgKMEzRmglWDJ4
 gKxAKlOodd+quhbGsdBbyPX7Ox6srPGJaI23nMouf/aeeBQjQkqv2Xcu20fxpzTahJX91MbDuO
 I4v4Qbkq9UAAAA=
X-Change-ID: 20250808-topic-am43-arm-global-timer-v6-16-66fc0c6981ab
To: Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Patrice Chotard <patrice.chotard@foss.st.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 "Mendez, Judith" <jm@ti.com>, Kevin Hilman <khilman@baylibre.com>, 
 Markus Schneider-Pargmann <msp@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5741; i=msp@baylibre.com;
 h=from:subject:message-id; bh=v2yMuPIutn0ukBdsJ3Tt74LERYJHFoOO/j19VwhQEzw=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhowlugHPvfayPI49/fB0sdAF2ab4p3qNR38+y9tXpq34p
 W3SXPM3HaUsDGJcDLJiiiydiaFp/+V3HktetGwzzBxWJpAhDFycAjCR7VaMDEum/57Memv+/e36
 N3YFL5nzIP8q77ZbF5M/bjm28KhIlG8JI8OUDUssrTQDL4UG77lt+dzrnLv5E5+1Dz8wrHsxO8b
 z42ZuAA==
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_005257_268105_001671A5 
X-CRM114-Status: GOOD (  24.48  )
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

Reviewed-by: Kevin Hilman <khilman@baylibre.com>
Tested-by: Kevin Hilman <khilman@baylibre.com>
Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
---
Changes in v2:
- Rebased to v6.17-rc1
- Link to v1: https://lore.kernel.org/r/20250808-topic-am43-arm-global-timer-v6-16-v1-1-82067d327580@baylibre.com
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
base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
change-id: 20250808-topic-am43-arm-global-timer-v6-16-66fc0c6981ab

Best regards,
-- 
Markus Schneider-Pargmann <msp@baylibre.com>


