Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22C08CCD193
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 20:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t8LUdY9Gbr3c9MBtkrMrb9ELOUUlz3DwF1vW+da8Cus=; b=TQxdl6BvvAgpMSe6/hoSnf8jxx
	Yz+HIgf/bmEzHTNaboplFa2Qjj7y0w9AJvpl9H9J5acoYVCfNPVNmyD4BVCHGr3Q7PXjZmKFNmdb+
	y0CVho53w3ZGoDhNkwB6w93deowPaMuodamC4/WgL9pgqvKjlGFKVJoMO9hDMvJQm9nXJlsrS4XUm
	RWCJEoNHdcczPQ4GeS23BgCFFEfzMMxuzOfBOO/AtJThvd7awSOsUJ63+UcBWeiSU3v6xSJRWpRLX
	LHQBXRadhBl4Hf4gwZBx0MlN6ho1rz0yvKuJ5N52EOla4LzUdn+KKDvBNiq1mAZOOrZINpTZXka/z
	ZTBugVRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC2JN-00000007aTU-3pAP;
	Thu, 23 Oct 2025 20:53:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC2JG-00000007aNm-34wp
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 23 Oct 2025 20:53:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=t8LUdY9Gbr3c9MBtkrMrb9ELOUUlz3DwF1vW+da8Cus=; b=f5BsPBUp/CllqFms5h3bZh3GF2
	tSIUcF1/QUbXNgje/87tFHysAlzO9MdqDTrbSX9SDl9kDjRv4Ux8clyhquxCBjL62MfjpeVgDvcMD
	S0uznWzWWUuStFpm8hPRtfeP1zuo3Z4j2O4UndqXl5XDRwmIlGP4vQQEUH1pFxh7NBEDLWIZgnSSY
	dzHeMCCHOpYagmiw0ykOovrN3S8xCRb5P0us+RiaBqqmAu4e9M3Yh0q0VpigH3GjToJ/IeUaQCUtR
	rHv1iPrxPAsryu5Zlh8RoLSWuoGZWbXWnzQIcVjKSIO+FTJ2LyI27DD7n5tboZgiOQ0qJroCm1AOl
	AUbpqH/g==;
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC1RV-00000001k8D-0X2Z
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Oct 2025 19:57:51 +0000
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-b6a33319cb6so933262a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Oct 2025 13:53:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761252794; x=1761857594; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=t8LUdY9Gbr3c9MBtkrMrb9ELOUUlz3DwF1vW+da8Cus=;
        b=h5mKmMRyJmi9vwEwZzX4YcV1Gaq4OwovZZbcnUJfrdvEly2KgepsG8iPincPzN1E80
         XGxHaHpCMo1+BViPqwrXaLZS2h8azRTR20PpY9XJb1WzU/NjI3mUZ08zhCxOEVgSRmaA
         J1uboMwuJh854GqeSf+nNXN/DAC9g1gSACyH/9JAS4hFT4UnWU8bDacSKOpME2vMDGpq
         Hvgg3ht+t+zajyEb9Qk8BI/0961NMJq66zuCIRW9qP5CRaHakcfKeplu/f0agdonbwkU
         D1Y4o33nkJp9sv8Lg0AWtBDZGaKa1U4KMdrqZ3ck2frcyulf3hLvw3gTcqIeyBuWkPfE
         BVPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761252794; x=1761857594;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t8LUdY9Gbr3c9MBtkrMrb9ELOUUlz3DwF1vW+da8Cus=;
        b=jkmN0HRnQOgXhL8/pUhGo+vZNOeQSxpesFyaugKdiJEhEoC9jixKIyT1wTNFfh0jPG
         ohz1D8zuPxbplP4+E1uWmol+hVOFueH4pV96r3F+YAcfffsIoUg4z1XDReQnO0BvvQnT
         suRlWnaF/9rLC5kv+xpe8dZAfTUICFtJ/y0tI3iOXnE98apW4vidckmRXeZZHJ9BEpHL
         324SUZy1bHzEQVAwtVKihYwnGpMC20nIozlTGnWTPkeSieUbtr3qGEUPu5YZnjVFWpb3
         m3siIVlsMLmgD6uaH0vwW15QedmlnDkmVpLZKGDNhitfESeG1EYBZ9R9/MrKdyfxlSEd
         fC4w==
X-Forwarded-Encrypted: i=1; AJvYcCUcyI8ErGGO8C5eYhg8mUaP9W8Bp00aP5Dmfc8W+7uXBNLn93X/iJ2icRQmq7usAbT3Ozr8zsp81Rslll4QLC/w@lists.infradead.org
X-Gm-Message-State: AOJu0YyR1aEmk6Xss3UmVdyfcr8qbS/rzHWt42QxNB/MmNSiHIkOQbur
	YTQxkz8txSIxgk3zxD4VvHVhAHNtqNkZe4eod/ZenRUTKPafAYH2Iz6GqRMpnCiLzJ6fkRLI8JD
	6kZWvdBqWpl36P6r7+2cEvGq8k/pgZg==
X-Google-Smtp-Source: AGHT+IGBf1IJzGzHW/dQ74bgawMiYQGBddoxKJ6LePC8746ZA/Ftq/tF6PBMtE1kkx8goimn/4nF1bVNeCHWhrBhu3o=
X-Received: from pjbei7.prod.google.com ([2002:a17:90a:e547:b0:33b:cba3:7277])
 (user=willmcvicker job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90a:c88c:b0:330:6d5e:f17e with SMTP id 98e67ed59e1d1-33fafc1cdfcmr4966565a91.24.1761252793850;
 Thu, 23 Oct 2025 13:53:13 -0700 (PDT)
Date: Thu, 23 Oct 2025 20:52:48 +0000
In-Reply-To: <20251023205257.2029526-1-willmcvicker@google.com>
Mime-Version: 1.0
References: <20251023205257.2029526-1-willmcvicker@google.com>
X-Mailer: git-send-email 2.51.1.821.gb6fe4d2222-goog
Message-ID: <20251023205257.2029526-7-willmcvicker@google.com>
Subject: [PATCH v5 6/7] clocksource/drivers/exynos_mct: Add module support
From: Will McVicker <willmcvicker@google.com>
To: Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Hosung Kim <hosung0.kim@samsung.com>, 
	Will McVicker <willmcvicker@google.com>, Ingo Molnar <mingo@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Youngmin Nam <youngmin.nam@samsung.com>
Cc: Donghoon Yu <hoony.yu@samsung.com>, Rob Herring <robh@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, John Stultz <jstultz@google.com>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, 
	"=?UTF-8?q?Andr=C3=A9=20Draszik?=" <andre.draszik@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org, 
	kernel-team@android.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_205749_411278_A698CAD2 
X-CRM114-Status: GOOD (  22.97  )
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

From: Donghoon Yu <hoony.yu@samsung.com>

On Arm64 platforms the Exynos MCT driver can be built as a module. On
boot (and even after boot) the arch_timer is used as the clocksource and
tick timer. Once the MCT driver is loaded, it can be used as the wakeup
source for the arch_timer.

Signed-off-by: Donghoon Yu <hoony.yu@samsung.com>
Signed-off-by: Youngmin Nam <youngmin.nam@samsung.com>
Signed-off-by: Will McVicker <willmcvicker@google.com>
Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
[original commit from https://android.googlesource.com/kernel/gs/+/8a52a8288ec7d88ff78f0b37480dbb0e9c65bbfd]
Reviewed-by: Youngmin Nam <youngmin.nam@samsung.com> # AOSP -> Linux port
Tested-by: Youngmin Nam <youngmin.nam@samsung.com> # AOSP -> Linux port
---
 drivers/clocksource/Kconfig      |  3 +-
 drivers/clocksource/exynos_mct.c | 56 +++++++++++++++++++++++++++-----
 2 files changed, 49 insertions(+), 10 deletions(-)

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
index fece6bbc190e..a87caf3928ef 100644
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
 
@@ -217,6 +219,7 @@ static struct clocksource mct_frc = {
 	.mask		= CLOCKSOURCE_MASK(32),
 	.flags		= CLOCK_SOURCE_IS_CONTINUOUS,
 	.resume		= exynos4_frc_resume,
+	.owner		= THIS_MODULE,
 };
 
 /*
@@ -241,7 +244,7 @@ static cycles_t exynos4_read_current_timer(void)
 }
 #endif
 
-static int __init exynos4_clocksource_init(bool frc_shared)
+static int exynos4_clocksource_init(bool frc_shared)
 {
 	/*
 	 * When the frc is shared, the main processor should have already
@@ -336,6 +339,7 @@ static struct clock_event_device mct_comp_device = {
 	.set_state_oneshot	= mct_set_state_shutdown,
 	.set_state_oneshot_stopped = mct_set_state_shutdown,
 	.tick_resume		= mct_set_state_shutdown,
+	.owner			= THIS_MODULE,
 };
 
 static irqreturn_t exynos4_mct_comp_isr(int irq, void *dev_id)
@@ -476,6 +480,7 @@ static int exynos4_mct_starting_cpu(unsigned int cpu)
 	evt->features = CLOCK_EVT_FEAT_PERIODIC | CLOCK_EVT_FEAT_ONESHOT |
 			CLOCK_EVT_FEAT_PERCPU;
 	evt->rating = MCT_CLKEVENTS_RATING;
+	evt->owner = THIS_MODULE;
 
 	exynos4_mct_write(TICK_BASE_CNT, mevt->base + MCT_L_TCNTB_OFFSET);
 
@@ -511,7 +516,7 @@ static int exynos4_mct_dying_cpu(unsigned int cpu)
 	return 0;
 }
 
-static int __init exynos4_timer_resources(struct device_node *np)
+static int exynos4_timer_resources(struct device_node *np)
 {
 	struct clk *mct_clk, *tick_clk;
 
@@ -539,7 +544,7 @@ static int __init exynos4_timer_resources(struct device_node *np)
  * @local_idx: array mapping CPU numbers to local timer indices
  * @nr_local: size of @local_idx array
  */
-static int __init exynos4_timer_interrupts(struct device_node *np,
+static int exynos4_timer_interrupts(struct device_node *np,
 					   unsigned int int_type,
 					   const u32 *local_idx,
 					   size_t nr_local)
@@ -653,7 +658,7 @@ static int __init exynos4_timer_interrupts(struct device_node *np,
 	return err;
 }
 
-static int __init mct_init_dt(struct device_node *np, unsigned int int_type)
+static int mct_init_dt(struct device_node *np, unsigned int int_type)
 {
 	bool frc_shared = of_property_read_bool(np, "samsung,frc-shared");
 	u32 local_idx[MCT_NR_LOCAL] = {0};
@@ -701,15 +706,48 @@ static int __init mct_init_dt(struct device_node *np, unsigned int int_type)
 	return exynos4_clockevent_init();
 }
 
-
-static int __init mct_init_spi(struct device_node *np)
+static int mct_init_spi(struct device_node *np)
 {
 	return mct_init_dt(np, MCT_INT_SPI);
 }
 
-static int __init mct_init_ppi(struct device_node *np)
+static int mct_init_ppi(struct device_node *np)
 {
 	return mct_init_dt(np, MCT_INT_PPI);
 }
-TIMER_OF_DECLARE(exynos4210, "samsung,exynos4210-mct", mct_init_spi);
-TIMER_OF_DECLARE(exynos4412, "samsung,exynos4412-mct", mct_init_ppi);
+
+static int exynos4_mct_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	int (*mct_init)(struct device_node *np);
+
+	mct_init = of_device_get_match_data(dev);
+	if (!mct_init)
+		return -EINVAL;
+
+	return mct_init(dev->of_node);
+}
+
+static const struct of_device_id exynos4_mct_match_table[] = {
+	{ .compatible = "samsung,exynos4210-mct", .data = &mct_init_spi, },
+	{ .compatible = "samsung,exynos4412-mct", .data = &mct_init_ppi, },
+	{}
+};
+MODULE_DEVICE_TABLE(of, exynos4_mct_match_table);
+
+static struct platform_driver exynos4_mct_driver = {
+	.probe		= exynos4_mct_probe,
+	.driver		= {
+		.name	= "exynos-mct",
+		.of_match_table = exynos4_mct_match_table,
+	},
+};
+
+static __init int exynos_mct_init(void)
+{
+  return platform_driver_register(&exynos4_mct_driver);
+}
+module_init(exynos_mct_init);
+
+MODULE_DESCRIPTION("Exynos Multi Core Timer Driver");
+MODULE_LICENSE("GPL");
-- 
2.51.1.821.gb6fe4d2222-goog


