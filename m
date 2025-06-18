Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D143C71157
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 21:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CMP7Kl6yow8Faa+m4ttvJDoB9/AivqWlJaRr2H7xdgs=; b=n7b5R/telomAQoSbtOZ31FTc1N
	Pi/qeQ4mgI2qgHlEJlOAzEIz9K29bHvgJa2tc6kfcOc/a9bUh7K8Vgt7vOxpijDiK18o3P12XNYn3
	y2/5SUlVlzGV1yK6hCo/OXlSLDtyO/3Mphu9vg2A/G4CpT61Xrg5C0Q0Egkhsii59yfKVF8Se9uy8
	UaHQyi6bK1cszekIyMjgMnmoeIgRRZyNjMqcpzpiRS5h1xVOry35/vHkwQ+93GVng7oxJ4+d+FQiy
	u7O2o/+cAN4O9QDnxOuIpLJ4ENpuziI97+sgdRM8+1LG85Y/7L0gYIwacoXSmD+d+bzGE8KUSi4f9
	2r1lpr3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS0A3-0000000BQ5Z-0HHI;
	Wed, 18 Jun 2025 21:17:35 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS01o-0000000BP5h-1K2z
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 21:09:05 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-31327b2f8e4so14475a91.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Jun 2025 14:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750280943; x=1750885743; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=CMP7Kl6yow8Faa+m4ttvJDoB9/AivqWlJaRr2H7xdgs=;
        b=gb8925XBy1lBO1Y8JfOe2JbqJFt10xDwkJ5kR9rfHIeTt0ABFRz+ExykRgUw/l63MN
         AxZhuDvMmCt6pD/PzIKR8tjvIB2DL+lSdp/5SV23p/RbFLlWfZ3L/CafS71XEOYJW+WI
         s2L4fwIGo+/ei2RqT88b3rWr6NDvtEsfDdCEs7BjsBmnZda3Ek+EkuvYLSOh7aLTUQR7
         2RlOLUA0471EtkDF1OKnGn32mZPBpAao1sy0Bs/OVJOI6mlubY7iE+iU6o4T199IA7mF
         g7MXdV9WSVD30wFXeri8DCc67/9MnYhuNW6Mji+2hl/zPlXAGzOaB3TTpdpTrCPfDOv8
         3Piw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750280943; x=1750885743;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CMP7Kl6yow8Faa+m4ttvJDoB9/AivqWlJaRr2H7xdgs=;
        b=AsEbo4vBoyQbHnHXz9AwiL/2D+jyQk2ZeJJapzhrvPIypMaBAF4B8nT9QSHyTJyxdZ
         H+WymtordL5KIJ1z1eUF8z8v/l4KhPYU6fQv+bSeM7BmdjvFf2tQmXok1Os/Px5gYyjg
         eoug8ztBMQMleqZZIt/2Z3jU+wbQIto8PW5wvyRsIYBWPVsadWbZutcwh6lOPqBin83q
         U4Prexe4Lpw4KqIXSiBiijiGAUMS8mZrK1gp5xYQIHQp1GnXB5WYDESt7SVEGCkFo1IG
         ZFf3UGae6SVvgUEBY4eztuvmeia6wIiytpeNTOO5CixBy6vW/aFVcTumu6udMNgfR3T3
         zF3A==
X-Forwarded-Encrypted: i=1; AJvYcCWIbUCDBKNbC5DPzdctp8YNj5rYpgLkZ4qadhgDJvJ5ACFALmIiA6kpn98ee3Dpens4BENbnHC7q5I5GPKD2yGx@lists.infradead.org
X-Gm-Message-State: AOJu0YwotN3D68PjdoPpNGu0a3YnYk+7lint0P2MS6YAs6sIb3DIaLIK
	UVGODAqZ9AmDul+WTmAm4dUjwCNEr8jNGsMBeEh8tK9BVG+RnMCZ0hjuAlwebdIZbIsCre3yGSe
	0sT7EjD9zsTavoGqMTeccuJDC38jH1w==
X-Google-Smtp-Source: AGHT+IHnN4KQrdCKJ7jBLwoS1jPThBVW4hDHqpvXB6q54bqABdZTJVdZXZ6NaNfXR5nGBhyVR/ay/ByQfgGq2xiOFrA=
X-Received: from pjbpb15.prod.google.com ([2002:a17:90b:3c0f:b0:2ef:d283:5089])
 (user=willmcvicker job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90a:dfc6:b0:311:b413:f5e1 with SMTP id 98e67ed59e1d1-313f1e22ec0mr22222585a91.32.1750280943259;
 Wed, 18 Jun 2025 14:09:03 -0700 (PDT)
Date: Wed, 18 Jun 2025 14:08:39 -0700
In-Reply-To: <20250618210851.661527-1-willmcvicker@google.com>
Mime-Version: 1.0
References: <20250618210851.661527-1-willmcvicker@google.com>
X-Mailer: git-send-email 2.50.0.rc2.761.g2dc52ea45b-goog
Message-ID: <20250618210851.661527-3-willmcvicker@google.com>
Subject: [PATCH 2/6] clocksource/drivers/exynos_mct: Don't register as a
 sched_clock on arm64
From: Will McVicker <willmcvicker@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
	Saravana Kannan <saravanak@google.com>
Cc: Will McVicker <willmcvicker@google.com>, Donghoon Yu <hoony.yu@samsung.com>, 
	Hosung Kim <hosung0.kim@samsung.com>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	John Stultz <jstultz@google.com>, Youngmin Nam <youngmin.nam@samsung.com>, 
	Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	"=?UTF-8?q?Andr=C3=A9=20Draszik?=" <andre.draszik@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_140904_394509_C169042F 
X-CRM114-Status: GOOD (  15.39  )
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

The MCT register is unfortunately very slow to access, but importantly
does not halt in the c2 idle state. So for ARM64, we can improve
performance by not registering the MCT for sched_clock, allowing the
system to use the faster ARM architected timer for sched_clock instead.

The MCT is still registered as a clocksource, and a clockevent in order
to be a wakeup source for the arch_timer to exit the "c2" idle state.

Since ARM32 SoCs don't have an architected timer, the MCT must continue
to be used for sched_clock. Detailed discussion on this topic can be
found at [1].

[1] https://lore.kernel.org/linux-samsung-soc/1400188079-21832-1-git-send-email-chirantan@chromium.org/

[Original commit from https://android.googlesource.com/kernel/gs/+/630817f7080e92c5e0216095ff52f6eb8dd00727

Signed-off-by: Donghoon Yu <hoony.yu@samsung.com>
Signed-off-by: Youngmin Nam <youngmin.nam@samsung.com>
Reviewed-by: Youngmin Nam <youngmin.nam@samsung.com>
Acked-by: John Stultz <jstultz@google.com>
Tested-by: Youngmin Nam <youngmin.nam@samsung.com>
Signed-off-by: Will McVicker <willmcvicker@google.com>
---
 drivers/clocksource/exynos_mct.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/clocksource/exynos_mct.c b/drivers/clocksource/exynos_mct.c
index da09f467a6bb..96361d5dc57d 100644
--- a/drivers/clocksource/exynos_mct.c
+++ b/drivers/clocksource/exynos_mct.c
@@ -219,12 +219,18 @@ static struct clocksource mct_frc = {
 	.resume		= exynos4_frc_resume,
 };
 
+/*
+ * Since ARM devices do not have an architected timer, they need to continue
+ * using the MCT as the main clocksource for timekeeping, sched_clock, and the
+ * delay timer. For AARCH64 SoCs, the architected timer is the preferred
+ * clocksource due to it's superior performance.
+ */
+#if defined(CONFIG_ARM)
 static u64 notrace exynos4_read_sched_clock(void)
 {
 	return exynos4_read_count_32();
 }
 
-#if defined(CONFIG_ARM)
 static struct delay_timer exynos4_delay_timer;
 
 static cycles_t exynos4_read_current_timer(void)
@@ -250,12 +256,13 @@ static int __init exynos4_clocksource_init(bool frc_shared)
 	exynos4_delay_timer.read_current_timer = &exynos4_read_current_timer;
 	exynos4_delay_timer.freq = clk_rate;
 	register_current_timer_delay(&exynos4_delay_timer);
+
+	sched_clock_register(exynos4_read_sched_clock, 32, clk_rate);
 #endif
 
 	if (clocksource_register_hz(&mct_frc, clk_rate))
 		panic("%s: can't register clocksource\n", mct_frc.name);
 
-	sched_clock_register(exynos4_read_sched_clock, 32, clk_rate);
 
 	return 0;
 }
-- 
2.50.0.rc2.761.g2dc52ea45b-goog


