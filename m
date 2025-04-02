Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D40CDC3601A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 00:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hT8+V7ZuQjQdgRqgqrLtrWk6gURFJ9+tH19teOBSnwg=; b=HB1an3VVfMt4lkxknMNcsnnMJS
	FIAYm7M8FbBtv8m5ZiHj7tVJwTXOLrStL2PRaaYZoHmQQfKWiVKOkpMxyjx9KNU+NwO+J75YydOeH
	y7uoZv5n6aZmw0jbueECQcZygEP+R4DDUqqUbLGLRbxvslandHq8fG9NPTj05+K62aoLTlYBuNVed
	9reODkar/PxNGsVDMiGtWtOHYiP2kW0ykLowRinHUqgi2sFW39JnGoTKeN5nLB8golD0coeO5G9sH
	pqJiqbW4KE/E5YfCBxdv6YoBJofeCpLS/KWamRdVyHzCjWM2JbsHJj6uPrLM2jvok4zlEvcbu8QgJ
	e6YOudjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u086S-00000007T5z-0eob;
	Thu, 03 Apr 2025 00:06:40 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u07bk-00000007QE3-3Gth
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Apr 2025 23:34:58 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-3011bee1751so244082a91.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Apr 2025 16:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743636895; x=1744241695; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=hT8+V7ZuQjQdgRqgqrLtrWk6gURFJ9+tH19teOBSnwg=;
        b=H8Hj9K69chT9tGokLKrbvxPBt1QjQb0y4Zp6U5U4rT17jwFhqm9rhFTgLVVqr0gYEm
         bWFL0fQvF6Q6OeiG9hghNmUK+j6OTrRcIhUL41qZUH2uiE6jf97LvXU4kiZa6KYzLsIe
         gHlbv26GX9NxBhenW/OtExHATrZWUMbhEdK//Uv+NGrTUR+ntr/nZDJZSV3PVZCH1vWp
         gSxLb8B17MpeX11kpjtqFj5hA3lDV1fQnGeXDiv/uYsywTVB2qjt97N3Uq3uqjcxl6+Q
         iUJeV6TNr4mLGCzapodIWfIGq+LFdK3JZbL/nWEuzTKXZP2QURek9XEb6S2u9uwBqGrc
         nG1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743636895; x=1744241695;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hT8+V7ZuQjQdgRqgqrLtrWk6gURFJ9+tH19teOBSnwg=;
        b=QHfoWxbwN67i3EDrl2K/o0Ota1Y4rfV0raf4mBOsg/hSOaNg7ZpgpbWg7b/RTxioGb
         gWOHJq8KXJsGc9INEQBq+F8g8WH9CHKtKFq7e2My89DTzLxacB6vjAjs9rRXHh6y2fd5
         a4b6HnesO9ta8JII4eoaCJSv80Mqi/tOC7xM++8RbaS50iPf4oP9rxsU0FX45ZaXq3lR
         2oVmD3wAMcA4LB5UlrMvmVOdiRLoZ7+ajAi3OS1ayyhYDtHhu+rll9RGi/Dl5etFsTBT
         rBEMVojhEMQKxGt8tqsYkQENMn+VjzVCAX948ryU4t77FQ7GITyiKo9T9pXJk7qrSqdm
         qHdw==
X-Forwarded-Encrypted: i=1; AJvYcCWsi5fp12N1fD3PyW+FXbYYJvg4GabHID1h78HGN/6XXz+5XllAfpdBR1JEsC21k2trVq+bYouxrwlTHH3fDffF@lists.infradead.org
X-Gm-Message-State: AOJu0YwXIWtkFqA4dnQp6d45W1d5KtKffNfneaXAO+wToW9wSTd2pr+V
	xSwuIKPa6SWVLVbQyIP2Yw+OTGFoNrYueWRfvl/ZJwZejJwcR4WitIratICiiRiOHTIlxB1Wk6P
	4kTLpK6sn0AHB4g/LQkkv4J73tw==
X-Google-Smtp-Source: AGHT+IHFsyWkhTZjY/X3yM1NCzR6YFj3tfba3cqV3Fzaa0HY9aOCS7UhQUkmVnrZeo30hR6EANqHIIllbdzJIevDeHw=
X-Received: from pji12.prod.google.com ([2002:a17:90b:3fcc:b0:301:4260:4d23])
 (user=willmcvicker job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:5247:b0:2fa:1f1b:3db2 with SMTP id 98e67ed59e1d1-3057cc00681mr852399a91.25.1743636895371;
 Wed, 02 Apr 2025 16:34:55 -0700 (PDT)
Date: Wed,  2 Apr 2025 16:33:57 -0700
In-Reply-To: <20250402233407.2452429-1-willmcvicker@google.com>
Mime-Version: 1.0
References: <20250402233407.2452429-1-willmcvicker@google.com>
X-Mailer: git-send-email 2.49.0.472.ge94155a9ec-goog
Message-ID: <20250402233407.2452429-7-willmcvicker@google.com>
Subject: [PATCH v2 6/7] clocksource/drivers/exynos_mct: Add module support
From: Will McVicker <willmcvicker@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, 
	"=?UTF-8?q?Andr=C3=A9=20Draszik?=" <andre.draszik@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Saravana Kannan <saravanak@google.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>
Cc: Will McVicker <willmcvicker@google.com>, Donghoon Yu <hoony.yu@samsung.com>, 
	Hosung Kim <hosung0.kim@samsung.com>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Youngmin Nam <youngmin.nam@samsung.com>, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_163456_821209_AEAD94DA 
X-CRM114-Status: GOOD (  22.35  )
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
[original commit from https://android.googlesource.com/kernel/gs/+/8a52a8288ec7d88ff78f0b37480dbb0e9c65bbfd]
Signed-off-by: Will McVicker <willmcvicker@google.com>
---
 drivers/clocksource/Kconfig      |  3 +-
 drivers/clocksource/exynos_mct.c | 49 +++++++++++++++++++++++++++-----
 2 files changed, 44 insertions(+), 8 deletions(-)

diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
index 487c85259967..e89373827c3a 100644
--- a/drivers/clocksource/Kconfig
+++ b/drivers/clocksource/Kconfig
@@ -443,7 +443,8 @@ config ATMEL_TCB_CLKSRC
 	  Support for Timer Counter Blocks on Atmel SoCs.
 
 config CLKSRC_EXYNOS_MCT
-	bool "Exynos multi core timer driver" if COMPILE_TEST
+	tristate "Exynos multi core timer driver" if ARM64
+	default y if ARCH_EXYNOS || COMPILE_TEST
 	depends on ARM || ARM64
 	depends on ARCH_ARTPEC || ARCH_EXYNOS || COMPILE_TEST
 	help
diff --git a/drivers/clocksource/exynos_mct.c b/drivers/clocksource/exynos_mct.c
index 62febeb4e1de..8943274378be 100644
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
 
@@ -241,7 +243,7 @@ static cycles_t exynos4_read_current_timer(void)
 }
 #endif
 
-static int __init exynos4_clocksource_init(bool frc_shared)
+static int exynos4_clocksource_init(bool frc_shared)
 {
 	/*
 	 * When the frc is shared, the main processor should have already
@@ -511,7 +513,7 @@ static int exynos4_mct_dying_cpu(unsigned int cpu)
 	return 0;
 }
 
-static int __init exynos4_timer_resources(struct device_node *np)
+static int exynos4_timer_resources(struct device_node *np)
 {
 	struct clk *mct_clk, *tick_clk;
 
@@ -539,7 +541,7 @@ static int __init exynos4_timer_resources(struct device_node *np)
  * @local_idx: array mapping CPU numbers to local timer indices
  * @nr_local: size of @local_idx array
  */
-static int __init exynos4_timer_interrupts(struct device_node *np,
+static int exynos4_timer_interrupts(struct device_node *np,
 					   unsigned int int_type,
 					   const u32 *local_idx,
 					   size_t nr_local)
@@ -652,7 +654,7 @@ static int __init exynos4_timer_interrupts(struct device_node *np,
 	return err;
 }
 
-static int __init mct_init_dt(struct device_node *np, unsigned int int_type)
+static int mct_init_dt(struct device_node *np, unsigned int int_type)
 {
 	bool frc_shared = of_property_read_bool(np, "samsung,frc-shared");
 	u32 local_idx[MCT_NR_LOCAL] = {0};
@@ -700,15 +702,48 @@ static int __init mct_init_dt(struct device_node *np, unsigned int int_type)
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
+
+#ifdef MODULE
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
+module_platform_driver(exynos4_mct_driver);
+#else
 TIMER_OF_DECLARE(exynos4210, "samsung,exynos4210-mct", mct_init_spi);
 TIMER_OF_DECLARE(exynos4412, "samsung,exynos4412-mct", mct_init_ppi);
+#endif
+
+MODULE_DESCRIPTION("Exynos Multi Core Timer Driver");
+MODULE_LICENSE("GPL");
-- 
2.49.0.472.ge94155a9ec-goog


