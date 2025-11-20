Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE88FCF9C7F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 18:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sQI/aMjga6zLBbmFacInf1FiaB4N/DGsz2v/Apbe6jw=; b=DcbbjmtNMfWVM6Ds1TiVBrzbyI
	MPNzfWy9zwjzSiXiLVcjpo/v3MTe8fLpDToC8V3ZmjgUWsLCKfZDp7s7FQCiFRwEl3Z0vpCSx6vGX
	PTP3wXO40+eksv7zl6+fMalZqa/KETX8mNDp+jvzai88/1Qft3qF5TumVz35R9kLYso7+w61fmCQg
	moaE4saHiASqd7GJB7b/DUDF40/GZc3p0yVcca2wc3dvj0OveuyHH9hO85rErmvjUqs9pQP0XONhQ
	qSuNtcnU/0KgqPg6A58Cl+luhsZ/OvgOy/2sED7ICFJF9UiY7fk/W9CiltFQJV6bnUoz7IF/d2lx8
	8PIaEKIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM9cY-00000007EkT-26dx;
	Thu, 20 Nov 2025 18:43:06 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM9cQ-00000007EgE-3BeF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 18:42:59 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-297e5a18652so14509165ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Nov 2025 10:42:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763664178; x=1764268978; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=sQI/aMjga6zLBbmFacInf1FiaB4N/DGsz2v/Apbe6jw=;
        b=sL7AFhP8Um1MPmUfxmo6+6x2gTDfw2TswBbUPeoxow9JqGj9gN5193P0h6EW44ypn/
         n5W4XwmCgvq2OZ72kArFQ5DeP7L0IWXw50hNr6dpgjxmzNvVJziYoS/WAf3ftf6ghfz0
         wWPIrrg5FB9fRcmtbWBLEgz3Fm0DRn5vPDIM5qcG5GWl1Q5mW/Dq9eohY7osm6YuujD+
         wYysTMQGvr7f7SNPCFh9y9ZCQhQtPEula1MNb8eP4rLquCyCdxW/XpbpPfakNsMKtx4s
         40G15bz+gNdsGlpSoBUCBAHHZdIEMp6ya/ZhMQ1ciSfcjJL3Zm8MbKnxq8Sz0g/6rrJs
         M2nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763664178; x=1764268978;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sQI/aMjga6zLBbmFacInf1FiaB4N/DGsz2v/Apbe6jw=;
        b=BFMcIEmd71cUZtUcGy0+oq3/v37s1+DcFExVv+B+kZmu7uLyvnjDx7oIESu8UcAnOX
         X4hRTBOQkCQ6Sel9XRebqck22angNP32L8zbYgAv7cizM4VuvL2gr+J7BGa7MX1w5+uK
         yhW9bQdbBWUUn+grMtJeMR8ghlaFugW2+y85mz/a0OJFIIPLManBi5pVVUtBmoUuRE6N
         i7nTVSbB14YOr7GcTr5M7NgKAXA9ufX7iaEAloiBZaWzX1aJGrUNzSvEtPg2+RqDXOa6
         l/Cyp1/RplH4gW8vHDviKjXOOH/J/2WGFSFrrzDS64Db7cXr1ZyxJNPljdeK/CCOjwkv
         +cSA==
X-Forwarded-Encrypted: i=1; AJvYcCXuZLOBwLxY4W3jzNOBRob++KOhdB9j5ESAfBOwj/PMZDzUZpNZF96ad8IZZ12Nq2MTLvglhzKykHKDAOeCdaCb@lists.infradead.org
X-Gm-Message-State: AOJu0YxUB7lMUgWq3dLx77rLgCT42Be6khKpEkBFm0WZuFtkrcGoTDBj
	W2e0GwM7hMgT9//WdYGQGJwql/hizah/JMuUwfblulpUaEMA5wjL2el+6z/NZRl6KgU6F4vJMw8
	mHqkRRUGAbHoh4hpeJut38TS3QA8eoA==
X-Google-Smtp-Source: AGHT+IHwJthRNw4pqfJjYDk4vSF8m6qYCdx11lKLy4Vbpkd9LUAmbdAJbP3S8s2Ivqdqp6aG9ef+u6sWKJHez1RSwqw=
X-Received: from plkb6.prod.google.com ([2002:a17:903:fa6:b0:268:cfa:6a80])
 (user=willmcvicker job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:2408:b0:295:fbc7:d282 with SMTP id d9443c01a7336-29b5b08a22dmr50358725ad.27.1763664177775;
 Thu, 20 Nov 2025 10:42:57 -0800 (PST)
Date: Thu, 20 Nov 2025 18:42:32 +0000
In-Reply-To: <20251120184242.1625820-1-willmcvicker@google.com>
Mime-Version: 1.0
References: <20251120184242.1625820-1-willmcvicker@google.com>
X-Mailer: git-send-email 2.52.0.rc2.455.g230fcf2819-goog
Message-ID: <20251120184242.1625820-5-willmcvicker@google.com>
Subject: [PATCH v6 4/6] clocksource/drivers/exynos_mct: Fix uninitialized irq
 name warning
From: Will McVicker <willmcvicker@google.com>
To: Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, Donghoon Yu <hoony.yu@samsung.com>, 
	Hosung Kim <hosung0.kim@samsung.com>, Rob Herring <robh@kernel.org>, 
	John Stultz <jstultz@google.com>, Youngmin Nam <youngmin.nam@samsung.com>, 
	Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	"=?UTF-8?q?Andr=C3=A9=20Draszik?=" <andre.draszik@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org, 
	kernel-team@android.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_104258_803773_FFD91CB4 
X-CRM114-Status: GOOD (  18.02  )
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

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Reviewed-by: Youngmin Nam <youngmin.nam@samsung.com>
Tested-by: Youngmin Nam <youngmin.nam@samsung.com>
Signed-off-by: Will McVicker <willmcvicker@google.com>
---
 drivers/clocksource/exynos_mct.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/clocksource/exynos_mct.c b/drivers/clocksource/exynos_mct.c
index 1429b9d03a58..fece6bbc190e 100644
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
2.52.0.rc2.455.g230fcf2819-goog


