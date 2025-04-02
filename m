Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09806C36018
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 00:05:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z3woyidQeaVM0OgW9Tejczk+jE7A6Ip+4MgT+pOFZpA=; b=PmuATuB5rx62zTdlQz0Q4erycb
	VG/TJEV//uphWHSObzOUP6qeNEfnNN0uih0IRlViOyKRmybCbQOZdLLl8Kf3c+Lgmn0eKQuTfIV1f
	n6zRXK2IkegSQdMYMxwsc2eYQaMM/DBWrOjb9q00JP1hhPwu3JQQEAFbLjZpm+5chlnUM7HrA+dYl
	sK9zWo6jEzuJPpZ4VMgt/AbimwestAHYH74udMlHMcATELFufJpmNTeJO5jCCn/EEe82arCK64pKy
	5CsUz5SWWyKeFZ4QxarFFjzVa1I1Polgjlud+OQj6wBnUFN5UYPzUo/elTI0CxdiuPuilvid/62AG
	RV6Yj91g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u084i-00000007Sz1-21iH;
	Thu, 03 Apr 2025 00:04:52 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u07bi-00000007QDI-3tz6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Apr 2025 23:34:56 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-22410b910b0so2184675ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Apr 2025 16:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743636893; x=1744241693; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Z3woyidQeaVM0OgW9Tejczk+jE7A6Ip+4MgT+pOFZpA=;
        b=2zMbsRy3b8070dpGL6HeA7b5eoMe+hPAOXp8+JfBdnc13ZldXGzPeruUPOYS4cxZS4
         snac34yoYc2PBwBIpaqDPEFtjZ5usylPz28MTcx9D5wNzKXDWgzg/wWyL3qk0JNOKkUL
         6E7LRzDmJPGHXEU9eVMTB+42Q/Aa6vUyGJW/StjHFBfl9WjjWhu6AI17RSEAHq27h3RJ
         6jAQrXHRoYIiab1f0kUyzypMiRxVPV/yePbXg1Cybpc/crvbQiSaNoNwkliKDNyoogKQ
         bqQF/DPSnRVjhAOO4VuPqhk0NKrrQtzg8GC3lAyG++GecTK+1bblwgJgf2cHc7nv+Mhx
         owKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743636893; x=1744241693;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z3woyidQeaVM0OgW9Tejczk+jE7A6Ip+4MgT+pOFZpA=;
        b=TE+GblwVwqJQgVRNDGOT7JfjwYF5Fa8hGWqN2uHifazBfyR6NeDnP8KyBqZQbY9NeP
         fCHZhBMANC9rVkex7Q98E6GZiaMzv7U84W9g5lP1pewLSYoVy5EtI3yMtSmMzbgmz4lc
         OHM6frHj2kE1ZpvAisGF6q7W7jnwbG4QLNsBuTZeSPtfOtyF3k12z5PRJLq/CVfu0b7i
         n+NRUrdlFsrA6C9WN+om0VFOf3cbUwopABj9EoSvV1bt6XN4T52wXDD1ggPUDQFgTnMr
         VKw8xK94I0q8AmTd2ubiZBG6IjL1WSsQfLhIwS1A+bo/QeM7pCKHwl0Qa+8Pzuezxqbb
         cgVw==
X-Forwarded-Encrypted: i=1; AJvYcCXJegQUPWMvuOOe9i0v6y+lPW0m2hhCidy1Dv9Lfwi7f+WDzNjhpkhLEO8VzxkK+NkyC4UUmE0LH4w/vo/LzFcq@lists.infradead.org
X-Gm-Message-State: AOJu0YwfFIOCnHrujH2LhbbJcTCC5KWF1lSm5ydtlbLUlQPO9QUOtvjj
	Ul6579ennGqscLFjehqyO8I2iyqC/Co3C99vde+uu9SJYUjD4RgeSuX60q5y9WFhu9PgzXEJiNp
	5HdmdHon7144IqqeJYH5jsaabRQ==
X-Google-Smtp-Source: AGHT+IGiCVuhnR8Hm4ls6yhYVA+bAhMO7b7R8+FdaaPf0Sw6oW8BjVfyrFlY1Hg1Xa0Er5xFqEgThNby8zWx1wNh1Eo=
X-Received: from pfjd22.prod.google.com ([2002:a05:6a00:2456:b0:736:9c55:9272])
 (user=willmcvicker job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:cf0f:b0:220:fe51:1aab with SMTP id d9443c01a7336-22977e0fa71mr9553365ad.38.1743636893194;
 Wed, 02 Apr 2025 16:34:53 -0700 (PDT)
Date: Wed,  2 Apr 2025 16:33:56 -0700
In-Reply-To: <20250402233407.2452429-1-willmcvicker@google.com>
Mime-Version: 1.0
References: <20250402233407.2452429-1-willmcvicker@google.com>
X-Mailer: git-send-email 2.49.0.472.ge94155a9ec-goog
Message-ID: <20250402233407.2452429-6-willmcvicker@google.com>
Subject: [PATCH v2 5/7] clocksource/drivers/exynos_mct: Fix uninitialized irq
 name warning
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
X-CRM114-CacheID: sfid-20250402_163454_970267_8DB4F2E0 
X-CRM114-Status: GOOD (  18.15  )
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

The Exynos MCT driver doesn't set the clocksource name until the CPU
hotplug state is setup which happens after the IRQs are requested. This
results in an empty IRQ name which leads to the below warning at
proc_create() time. When this happens, the userdata partition fails to
mount and the device gets stuck in an endless loop printing the error:

  root '/dev/disk/by-partlabel/userdata' doesn't exist or does not contain a /dev.

To fix this, we just need to initialize the name before requesting the
IRQs.

Warning from Pixel 6 kernel log:

[  T430] name len 0
[  T430] WARNING: CPU: 6 PID: 430 at fs/proc/generic.c:407 __proc_create+0x258/0x2b4
[  T430] Modules linked in: dwc3_exynos(E+)
[  T430]  ufs_exynos(E+) phy_exynos_ufs(E)
[  T430]  phy_exynos5_usbdrd(E) exynos_usi(E+) exynos_mct(E+) s3c2410_wdt(E)
[  T430]  arm_dsu_pmu(E) simplefb(E)
[  T430] CPU: 6 UID: 0 PID: 430 Comm: (udev-worker) Tainted:
         ... 6.14.0-next-20250331-4k-00008-g59adf909e40e #1 ...
[  T430] Tainted: [W]=WARN, [E]=UNSIGNED_MODULE
[  T430] Hardware name: Raven (DT)
[...]
[  T430] Call trace:
[  T430]  __proc_create+0x258/0x2b4 (P)
[  T430]  proc_mkdir+0x40/0xa0
[  T430]  register_handler_proc+0x118/0x140
[  T430]  __setup_irq+0x460/0x6d0
[  T430]  request_threaded_irq+0xcc/0x1b0
[  T430]  mct_init_dt+0x244/0x604 [exynos_mct ...]
[  T430]  mct_init_spi+0x18/0x34 [exynos_mct ...]
[  T430]  exynos4_mct_probe+0x30/0x4c [exynos_mct ...]
[  T430]  platform_probe+0x6c/0xe4
[  T430]  really_probe+0xf4/0x38c
[...]
[  T430]  driver_register+0x6c/0x140
[  T430]  __platform_driver_register+0x28/0x38
[  T430]  exynos4_mct_driver_init+0x24/0xfe8 [exynos_mct ...]
[  T430]  do_one_initcall+0x84/0x3c0
[  T430]  do_init_module+0x58/0x208
[  T430]  load_module+0x1de0/0x2500
[  T430]  init_module_from_file+0x8c/0xdc

Signed-off-by: Will McVicker <willmcvicker@google.com>
---
 drivers/clocksource/exynos_mct.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/clocksource/exynos_mct.c b/drivers/clocksource/exynos_mct.c
index a5ef7d64b1c2..62febeb4e1de 100644
--- a/drivers/clocksource/exynos_mct.c
+++ b/drivers/clocksource/exynos_mct.c
@@ -465,8 +465,6 @@ static int exynos4_mct_starting_cpu(unsigned int cpu)
 		per_cpu_ptr(&percpu_mct_tick, cpu);
 	struct clock_event_device *evt = &mevt->evt;
 
-	snprintf(mevt->name, sizeof(mevt->name), "mct_tick%d", cpu);
-
 	evt->name = mevt->name;
 	evt->cpumask = cpumask_of(cpu);
 	evt->set_next_event = exynos4_tick_set_next_event;
@@ -567,6 +565,14 @@ static int __init exynos4_timer_interrupts(struct device_node *np,
 	for (i = MCT_L0_IRQ; i < nr_irqs; i++)
 		mct_irqs[i] = irq_of_parse_and_map(np, i);
 
+	for_each_possible_cpu(cpu) {
+		struct mct_clock_event_device *mevt =
+		    per_cpu_ptr(&percpu_mct_tick, cpu);
+
+		snprintf(mevt->name, sizeof(mevt->name), "mct_tick%d",
+			 cpu);
+	}
+
 	if (mct_int_type == MCT_INT_PPI) {
 
 		err = request_percpu_irq(mct_irqs[MCT_L0_IRQ],
-- 
2.49.0.472.ge94155a9ec-goog


