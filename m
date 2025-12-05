Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D1DDD2CDFE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Dec 2025 01:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fiOsEYutVbO+h1UqOe3paDd0R8z8pvGw0+OBJoG+80k=; b=LsgnGn6vrQ7R8phUStZItQwFvs
	9c8PbO/ahFjQV2P4AMvxAzpHCxvWvjf0L7dO7vLMi3goxOzKwOQwqkySOANSyqEHAVXbEstulCX26
	joU5vwbJ1QXxdcT/GPDfQ6mkERnxm00yckwD7GNxEI3m2vHR3SKAzG2d6yXuH7pklYTR/7TYjJ2QZ
	ivovrU/4wo2Aoiskfdy14qLbGB8QDWVRl0+HYhEyIQ41XO9vocwMugsAj07Tfjvsmxv2uwpnoHij2
	v4Dq9yQ9c/89II2BMW1Wz8DJl2E2Eh40srKchDhOnJJNDlfyiD8yi30XqBS1xIjk0brfZR0AZ9/H9
	2lsiUFgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRKLG-00000008qSm-3LHP;
	Fri, 05 Dec 2025 01:10:38 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRKLE-00000008qRJ-2ZzS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Dec 2025 01:10:37 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-297df52c960so34279975ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Dec 2025 17:10:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764897036; x=1765501836; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=fiOsEYutVbO+h1UqOe3paDd0R8z8pvGw0+OBJoG+80k=;
        b=cq564JzDP72TYNOGKfNjhiaNeXGECpC1ZKQdOG5ekiY7LOxLWOImmFavbTPapkekA/
         WBoNAVWVYtuIacfUmcMfFGSKbpvoxFFx/bqlsW5i+wYF0xExZH1+m7ufyI5pDF/itcTP
         MEq1/Su6m2RFS0HN9Du2G3fhXX7g6KsD/6CqKy0gXY+1ZBxo3UI+Y3SmP5086L993/8X
         AAKd847LJfWQYq43JUWw6ijkEVgoh8WT0aQfxXuaexbXTudzqAs4ODt0QL+9CEzIDbKb
         OTXww5crvsT3BjIo5nRiP4mSh9xEYPsP8pZlvSq+9geMm2NFX5l8tC0SKTR6OcD9bf7l
         4CCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764897036; x=1765501836;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fiOsEYutVbO+h1UqOe3paDd0R8z8pvGw0+OBJoG+80k=;
        b=LcXeLBo6ThZsNKdTUQAJDfMMkYy5y9KaHrkKnhA5tFVmuSo2YuqGxyqiBDyH1GNfcb
         MfjxeOvnjoeUAO6JpzfLr+PwvemtHvjKVbXYuCvbTeXfjjZcYVIVySfAc7t38mqxGfwA
         reX68iMUrCSF3eSQwr/SpfuPjI0PEBvowwyFDIvy1fIj9W/TW76g2QfoCCxxeSmjbcs9
         Fsa1E9yT/pwyohKy2IfliJmAQbHHNG48Dk8MfF4a2b17+337r6VI+xjluTUEVFx/pLKl
         azGvznpdlRoiEfC2pzmhvt0jT5b3g2GI43outXUKMuysOjGD4ruzNfy8l/xk88u7HtTJ
         pa6Q==
X-Forwarded-Encrypted: i=1; AJvYcCVSdFb6UyPoYSJxMptA0t7WdDaGAGuT2vqN3ljjrHzPYaxwSwWn5gVpdSpBNWNuN/wfwM5z7pOQAHw8W7B8aZKz@lists.infradead.org
X-Gm-Message-State: AOJu0Yyius6jxARE2xzEUBwYnlFE+j9quGQ37o2HSebbkHSXrMDMEb0Z
	vQYoCrgoTyOvlHvAYXCgWg8tNOoYJA6tefxFZ+V8k51z5zC0gjrpj49WzVVyBRzkp47w2CNNZsF
	sAhzmuAUb4PZkeGmhgM0T9rW0je5UvA==
X-Google-Smtp-Source: AGHT+IGwKjR6HoWiAaZHSjZKfvDhjRoj1KNeMWN2XQyeip1Cn/yVXxS2IBKHwOO4uvafLBMoWHmMfbwd8u1Aw+IWG2I=
X-Received: from plbjy14.prod.google.com ([2002:a17:903:42ce:b0:297:f856:fba9])
 (user=willmcvicker job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:2b05:b0:295:57f6:76b with SMTP id d9443c01a7336-29d6833c55emr97042065ad.7.1764897035793;
 Thu, 04 Dec 2025 17:10:35 -0800 (PST)
Date: Fri,  5 Dec 2025 01:10:15 +0000
In-Reply-To: <20251205011027.720512-1-willmcvicker@google.com>
Mime-Version: 1.0
References: <20251205011027.720512-1-willmcvicker@google.com>
X-Mailer: git-send-email 2.52.0.223.gf5cc29aaa4-goog
Message-ID: <20251205011027.720512-3-willmcvicker@google.com>
Subject: [PATCH v7 2/6] clocksource/drivers/exynos_mct: Set percpu local timer
 interrupts for ARM64
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
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Hosung Kim <hosung0.kim@samsung.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_171036_658414_D1982C44 
X-CRM114-Status: GOOD (  12.25  )
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

From: Hosung Kim <hosung0.kim@samsung.com>

To allow the CPU to handle it's own clock events, we need to set the
IRQF_PERCPU flag. This prevents the local timer interrupts from
migrating to other CPUs. This is only supported on ARM64.

Signed-off-by: Hosung Kim <hosung0.kim@samsung.com>
[Original commit from https://android.googlesource.com/kernel/gs/+/03267fad19f093bac979ca78309483e9eb3a8d16]
Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Reviewed-by: Youngmin Nam <youngmin.nam@samsung.com>
Tested-by: Youngmin Nam <youngmin.nam@samsung.com>
Suggested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Link: https://lore.kernel.org/all/20250827102645.1964659-1-m.szyprowski@samsung.com/
Signed-off-by: Will McVicker <willmcvicker@google.com>
---
 drivers/clocksource/exynos_mct.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/clocksource/exynos_mct.c b/drivers/clocksource/exynos_mct.c
index 96361d5dc57d..1429b9d03a58 100644
--- a/drivers/clocksource/exynos_mct.c
+++ b/drivers/clocksource/exynos_mct.c
@@ -596,7 +596,9 @@ static int __init exynos4_timer_interrupts(struct device_node *np,
 			irq_set_status_flags(mct_irq, IRQ_NOAUTOEN);
 			if (request_irq(mct_irq,
 					exynos4_mct_tick_isr,
-					IRQF_TIMER | IRQF_NOBALANCING,
+					IRQF_TIMER | IRQF_NOBALANCING |
+					(IS_ENABLED(CONFIG_ARM64) ?
+					 IRQF_PERCPU : 0),
 					pcpu_mevt->name, pcpu_mevt)) {
 				pr_err("exynos-mct: cannot register IRQ (cpu%d)\n",
 									cpu);
-- 
2.52.0.223.gf5cc29aaa4-goog


