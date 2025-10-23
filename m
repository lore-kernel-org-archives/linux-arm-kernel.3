Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD8A0CCD193
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 20:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=salcdC7S6u/qcABB4HnnPaySmiqlvAFAzi3hyX+XJeI=; b=38F3ez8+VOBtSfxRG8lXCDHhSM
	0isNQydpC9Eone1ZjL8sl8qPD0fhapAj9li2rJ1NhT2UImjqe2kT9b2KZARPTtGEYE5NB+nan4Gli
	baqmClq7G3hAf6yXGJDrnbQYdpygYV6Tnus51aVj7xwvxd3teTBvI9de5zsGvR/esLsevkkxJpcA/
	OsEXjz7y6aKl4WD6ZkeP6Uh8d2R1ecg7RQ9Zc7YPfeRiJZW+dC+gOvyx+qiVIKKyS0jEcFTIjeNne
	BxsPPdW9ZEFHCAesqpjwU+RJo1tkzxZAiV+/+3SYJgVc8rM/rlkZ+yoNQVILepIieYml2+rqrbW2X
	rQ3sVOnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC2H5-00000007ZOQ-3lAR;
	Thu, 23 Oct 2025 20:51:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC2H4-00000007ZNh-3WfM
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 23 Oct 2025 20:51:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=salcdC7S6u/qcABB4HnnPaySmiqlvAFAzi3hyX+XJeI=; b=T7DJvwOsncgebkvl0L3KPsonbN
	U0R+UaNlmGRkjmpRjqudn3+BoJfwRTEoQv9ZH5NiKxGNOJ3SzMukQ3piop8d5GeCh3/I5VXmueBzQ
	IKooxy95u0wRFWJOMo/5P84SAb3GlR0J6tp4kpvZKfJExtJ6u4o/IDcjrKTxrxn5u/lB3Ln4AEV8s
	lAbU3jUZn52AxqzNgnqE/KWim/omVl8PkNUAtE0ZEI2UrWSLI7IaJ2gpIXcON8BgRMsr18dzF/7wR
	ys/Lb7ZmOAjiTwCXb4oOCXox+YEbjmhs6T3vgl1IHng8lLScIrKX8mjIi0QK0TTFmaxe4qTphwpIQ
	RU0ZNAlg==;
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC1PI-00000001jst-47R7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Oct 2025 19:55:37 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-76e2ea9366aso1183472b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Oct 2025 13:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761252656; x=1761857456; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=salcdC7S6u/qcABB4HnnPaySmiqlvAFAzi3hyX+XJeI=;
        b=n8DVvggKpbT6BY6G63rmZGew5N4MnYw/WZLFJ9eiz25l0tk5yLFSqIELnaVWkAgY/n
         N39SPvuBDhW3HBCiPLyoDvFcKXrZKG+7eRvBef/L8Snfe7bkRrVW+nRXHqBkX9sAnIfu
         qQmWUce+M5ClyhWzvUwqs8uRuVidjbYcfP+NlwITXdRoMzqcyHmGJ7G5mTaofW+Ux3qd
         p4YhAs96x8fsPfD9j71oI72KEZNA0F8aW9GbQSvqusS7W6EZp4cnROlexlfyCRyoSFa2
         dk68qpBVXJiOxPlKK9U8TxHX2vduHix5Vqqog/5e/RN0Ckvx6i9tqD3nAO4W601qoMSK
         XhFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761252656; x=1761857456;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=salcdC7S6u/qcABB4HnnPaySmiqlvAFAzi3hyX+XJeI=;
        b=NNWjcBHMou1rqi++6CB4huDXJfpVqBVSQh0/WXtlr4/neM7dNZDWUtxmMkYQhNHegs
         wBvIvi5DDv7RcanjgrI4lWxfPEidcu4Y6UqdEaAiIw2zLP45wzKnQqGmk4BGaQ8c3PtO
         4fAeEqDDt64XHeOb6jsLsWo4iPX2y64VwDjqj+d83DsySzmbaTLRLUnYCjY6/A5LeJbQ
         n91/zUZRjahwa0RZkEyNtLbCjK9AIbqcg5VSskvJo7halYJfeULYGuWjeZOMHQpAsvDJ
         ly8sumCMYyDJTxrI01vYs8/9ZQ8Tf2aJv1MJ/3gLRjJKmbfV54p/DpQ0LxP74EpYfZVO
         1OnQ==
X-Forwarded-Encrypted: i=1; AJvYcCXAD+hkm/ivHzHlolmNmR1m0lkSsa3/+x+yLiW7q1rbbWUmoatfArf12c1D30wK8NFhcWSahnwLkb7y2/Vm2n5F@lists.infradead.org
X-Gm-Message-State: AOJu0YxZ4tKeV0gM7qfHo+00UMpYHG1lV0ihvaHn+6wnaK53bNtkJLeL
	WJf3keVzv8Lw9WzehPHKsslUhPhaLdv0gWq/kwINiuuBolo1/9o/8/1UkrD/3vKJv5mkUGh7Im0
	4quuJaFZjJcZg6jRjfdDgJrWnl6FnOA==
X-Google-Smtp-Source: AGHT+IETotZz5W0RAewxokNGtYUCB28DdEc6PiIk8ALIvsRgLEcx3podfH3b9UqPF76nl00xJnrSRtGNgN/gaeVnwNQ=
X-Received: from pjyq10.prod.google.com ([2002:a17:90a:e08a:b0:330:793a:2e77])
 (user=willmcvicker job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:a109:b0:334:a440:f244 with SMTP id adf61e73a8af0-334a8606ea3mr34560423637.36.1761252656337;
 Thu, 23 Oct 2025 13:50:56 -0700 (PDT)
Date: Thu, 23 Oct 2025 20:50:30 +0000
In-Reply-To: <20251023205041.2027336-1-willmcvicker@google.com>
Mime-Version: 1.0
References: <20251023205041.2027336-1-willmcvicker@google.com>
X-Mailer: git-send-email 2.51.1.821.gb6fe4d2222-goog
Message-ID: <20251023205041.2027336-5-willmcvicker@google.com>
Subject: [PATCH 4/7] clocksource/drivers/exynos_mct: Use percpu interrupts
 only on ARM64
From: Will McVicker <willmcvicker@google.com>
To: Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Peter Griffin <peter.griffin@linaro.org>, 
	Ingo Molnar <mingo@kernel.org>, Youngmin Nam <youngmin.nam@samsung.com>, 
	Will McVicker <willmcvicker@google.com>, Hosung Kim <hosung0.kim@samsung.com>
Cc: Donghoon Yu <hoony.yu@samsung.com>, Rob Herring <robh@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, John Stultz <jstultz@google.com>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, 
	"=?UTF-8?q?Andr=C3=A9=20Draszik?=" <andre.draszik@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org, 
	kernel-team@android.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_205533_636291_2C5B7AA6 
X-CRM114-Status: GOOD (  11.18  )
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

From: Marek Szyprowski <m.szyprowski@samsung.com>

For some unknown reasons forcing percpu interrupts for local timers
breaks CPU hotplug for 'little' cores on legacy ARM 32bit Exynos based
machines (for example Exynos5422-based Odroid-XU3/XU4 boards). Use percpu
flag only when driver is compiled for newer ARM64 architecture.

Fixes: f3cec54ee3bf ("clocksource/drivers/exynos_mct: Set local timer interrupts as percpu")
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/clocksource/exynos_mct.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clocksource/exynos_mct.c b/drivers/clocksource/exynos_mct.c
index a5ef7d64b1c2..1429b9d03a58 100644
--- a/drivers/clocksource/exynos_mct.c
+++ b/drivers/clocksource/exynos_mct.c
@@ -597,7 +597,8 @@ static int __init exynos4_timer_interrupts(struct device_node *np,
 			if (request_irq(mct_irq,
 					exynos4_mct_tick_isr,
 					IRQF_TIMER | IRQF_NOBALANCING |
-					IRQF_PERCPU,
+					(IS_ENABLED(CONFIG_ARM64) ?
+					 IRQF_PERCPU : 0),
 					pcpu_mevt->name, pcpu_mevt)) {
 				pr_err("exynos-mct: cannot register IRQ (cpu%d)\n",
 									cpu);
-- 
2.51.1.821.gb6fe4d2222-goog


