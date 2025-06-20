Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7419C7115C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 18:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j/s7oEmyKauEAHgwht1yQk0tIZg1WwzoDzyegW5BYz4=; b=LebWLwOsZ0o5w5RT5xZBXIYUIM
	IQX234vMPDLWcqatBp8c4XBkN/ucLsjL8L0GyT6NbAQBKw/Fhr0bLDI1J84lfSAWbzs/jW/gi+rFK
	ZkhWGrP2zZ2j3z+xLV9ZKJtIsCVmOa1Jhy4hIFLfQiDRDhpKn+Rw+ft8ncCZQNK1gOzDWEmpBIZCt
	RZasNQ9UInJ0ogx+yaT56DG94Gcdd4tGv0Zupz0yxslVMtmzzo/O8LAKLrDHH6pk7o6wxvXVhBaBF
	DfRbiSA1LJzkU+XK1URewqj6GbGuCLMZMlbNmKrmWkkoOoHBkRZNfD1m0cqwP4JG5xINCkGcqzMr1
	rxTr1shw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSgRt-0000000GMLJ-1fp1;
	Fri, 20 Jun 2025 18:26:49 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSgJ9-0000000GLLg-1Sxw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Jun 2025 18:17:48 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-7489ac848f3so3182103b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Jun 2025 11:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750443466; x=1751048266; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=j/s7oEmyKauEAHgwht1yQk0tIZg1WwzoDzyegW5BYz4=;
        b=g2itzB+Tl9QMCkz6FjOpEC2WBWAzZc37/l5pUI2/avRgJUplzwxH+mT0wdn0B7MKSt
         62U+KjaDmaUIySNWGbmcMiCPQjnzNCXn3Inuxc9cos3QYBLqBZRZP/H3kV3yb9RL74cM
         hOAXW2slIAaUKChqthXC+RjGiLx1eGwDGGg5Mv4RmN0W1TjXBXAnJ4a2TnQPsBo+HHDa
         PwdHqgY9O+vo+QaK4cJPisTJQboj1peDq0idbitGJsUFeJ/5fxt6D5X1XyYb50JJQL2y
         FqVnBf4b+k6xQgCgoDqPP2lGInGwBbJM0ER0GWjpQrzDrt6j7zvnLZeiurjMJIQAmnf9
         CV2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750443466; x=1751048266;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j/s7oEmyKauEAHgwht1yQk0tIZg1WwzoDzyegW5BYz4=;
        b=b9ha1oA7Yv99wKCmiGddtW+QUgkikV/UQOfb37YC+R+8jpixfe8qNzC8kyJClwxEL3
         Ge4yL3+lB4Qr8tJZV3RLPGx+Xr35dpBq0YWQEjXcYUUw3mew4bWm42T5PP3uS98GFHEV
         +XMAKjPQOjGS9supTxfmdwDRncmwzwi5Tj0DE7JWuG7JztsKMoKaXYYxsMRBB/QCQ/qO
         G1NTskDydgmc6xd9FWH+etLaGywSPsTlM5ovtz3wyj67Qy/ftQ11KsMsrBQ5rMgWMFDV
         yBfWkfRchk5X3dHxg1HY2PyctzkVLUFsnZfecCVLmAp+IHJ8ynaMYy3JEQIPTIwuym6g
         RY3A==
X-Forwarded-Encrypted: i=1; AJvYcCXScL/0GmHIvxpPd4fJW12GeU2DFLcZMr3JRINTE/E3zrwBKVVlKG0LYwF6+cu/nqR/GoFrj7NyeN7sqDm+rHwC@lists.infradead.org
X-Gm-Message-State: AOJu0Yye/vZrYhUItOMCcHkbPyVSTZl84oHrUS5dPEq/jGq5O8EklH49
	FH1lxIMG8MHzJMHbILdMg5C7cDINFTmQgsV8aBL1Xd/qwgfiy2L96izGiV6xj1mxhs05nFRz0Ge
	xCdRUzk/56IfGHBktQS6LhqZ4O7Hy9Q==
X-Google-Smtp-Source: AGHT+IHoiuIPOX5cQFNIBafAR41PjPYk18rc3/O/j6tqRVu5p45znC4S855hKfUC4szgUQ9hnGaEGhg3C2WZ1qgdT6c=
X-Received: from pfrb30.prod.google.com ([2002:aa7:8ede:0:b0:748:d81f:a79e])
 (user=willmcvicker job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:7702:b0:220:658:855 with SMTP id adf61e73a8af0-22026d72b49mr5784487637.13.1750443466155;
 Fri, 20 Jun 2025 11:17:46 -0700 (PDT)
Date: Fri, 20 Jun 2025 11:17:06 -0700
In-Reply-To: <20250620181719.1399856-1-willmcvicker@google.com>
Mime-Version: 1.0
References: <20250620181719.1399856-1-willmcvicker@google.com>
X-Mailer: git-send-email 2.50.0.rc2.761.g2dc52ea45b-goog
Message-ID: <20250620181719.1399856-4-willmcvicker@google.com>
Subject: [PATCH v4 3/6] clocksource/drivers/exynos_mct: Set local timer
 interrupts as percpu
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
X-CRM114-CacheID: sfid-20250620_111747_380266_A6E6E364 
X-CRM114-Status: GOOD (  11.70  )
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
migrating to other CPUs.

Signed-off-by: Hosung Kim <hosung0.kim@samsung.com>
[Original commit from https://android.googlesource.com/kernel/gs/+/03267fad19f093bac979ca78309483e9eb3a8d16]
Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Reviewed-by: Youngmin Nam <youngmin.nam@samsung.com>
Tested-by: Youngmin Nam <youngmin.nam@samsung.com>
Signed-off-by: Will McVicker <willmcvicker@google.com>
---
 drivers/clocksource/exynos_mct.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clocksource/exynos_mct.c b/drivers/clocksource/exynos_mct.c
index 96361d5dc57d..a5ef7d64b1c2 100644
--- a/drivers/clocksource/exynos_mct.c
+++ b/drivers/clocksource/exynos_mct.c
@@ -596,7 +596,8 @@ static int __init exynos4_timer_interrupts(struct device_node *np,
 			irq_set_status_flags(mct_irq, IRQ_NOAUTOEN);
 			if (request_irq(mct_irq,
 					exynos4_mct_tick_isr,
-					IRQF_TIMER | IRQF_NOBALANCING,
+					IRQF_TIMER | IRQF_NOBALANCING |
+					IRQF_PERCPU,
 					pcpu_mevt->name, pcpu_mevt)) {
 				pr_err("exynos-mct: cannot register IRQ (cpu%d)\n",
 									cpu);
-- 
2.50.0.rc2.761.g2dc52ea45b-goog


