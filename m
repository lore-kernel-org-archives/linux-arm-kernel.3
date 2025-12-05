Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08DFAD2CDFE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Dec 2025 01:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9vbyBqfLlkb7wVGA5FM2mgEiFp1TljGmkVIPsEEhzkw=; b=1CtDN3+POnpQGNQWprEdByA1E9
	kTbp583eBM9oJgx1dqOQVnvWDPDR76bHNFm8toB8EemHnz+SJByZPqOWeeLkznfoLYiAH64a9ja2U
	63Gvyij9fq2lDb82QakzeoJlUxfv5xIe7qxlSrdmO6oepgAHyiSSQUWbMB65fzeBt+0Fs617m7ktO
	qnN/Nx2zoBk04gawMAm/QKN50ohFDFvkoSBVoOguzHHYyGEpW1ycu5xBX7AHvsKaSYXBzsK93T0u5
	biSsvz6EndBSa0GaZYSajRvUelGTSurJ+xYjmHYuY2lqp21/Ebpv3X6UMSXCesLcHmVc2v2Saoeng
	YtjxTC9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRKLK-00000008qVA-0O4H;
	Fri, 05 Dec 2025 01:10:42 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRKLH-00000008qSP-0P3k
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Dec 2025 01:10:40 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-343daf0f488so1776090a91.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Dec 2025 17:10:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764897038; x=1765501838; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=9vbyBqfLlkb7wVGA5FM2mgEiFp1TljGmkVIPsEEhzkw=;
        b=EyRVlHy7umgyvJqF3LqcjPMgVkvzObUSZLMZF1j1C2SJfy98Xqj5W6kCj44LRbbPsw
         3r0iZ65O7rZ0ZOC9znVynIf4b7J2bJfDZSez9hMYHi+oVNai/cH4hafjwwAp+IbVBtMB
         INMcqmr+Mbn21CTOQgOoE9hZVBh3uYpXlBgPxjpr/n+dS4YY4kQLU2opNvFTElyTfzA/
         mUYpWmzKaKteFIA4jXxY6lyrcY3QnAh/0DKy+HflHVr+EkGqW7dniT6mk/Ahqg3ki54v
         RIHpWjhPmYH4PkHGcHdvJwW2UYmE0cI16mAL4WmcOifxh1rkCM0CzZ3++xRbhe6FUeJm
         +jSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764897038; x=1765501838;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9vbyBqfLlkb7wVGA5FM2mgEiFp1TljGmkVIPsEEhzkw=;
        b=Ndv8TXsGKp7vp+OFb2TntTpY/n+mYia4+EyvhiNhWDUc6pcmQBGS8zM3XWY+T36YvC
         S3z5ydKd+7u9pcxyxTJNYdTfi3u6ZPsofrJ+xOHEpJNSiKww9xCVWu6dPMGDIQOmeGm1
         qSIC68VcoM9kcSKEa3/qii9Dicu6eaWb1IAdF26xXzcwIYKMpCHA82MlwkLWh2USSrJL
         /51bp1YLxvP5JmJyoqHKN4iGihwvrvVoUgDIZ9moRGugsya09yYy3/pdp9CZ3yMsSKuO
         v9Lwqbb7fn8XcDfmmCkMx5noVyGeicJhJ7QlbAS9vW/G9JYPx+HIVxsNIzT/rg1Gk1hg
         dGtg==
X-Forwarded-Encrypted: i=1; AJvYcCXqNdzUedPdP2wfwup2UxRClfdBGLVIqm5zTA6Rh/ZsFpFXiALzl8GOEmcd9/M7dmVG4XB0q2biKqWhfFDOqKj+@lists.infradead.org
X-Gm-Message-State: AOJu0YzL/7Tvzg37PVQUS5JxRxfjLE5LTOlRPsBIObbGxmqaPwL+Yi5N
	NdrpnSNsiwbQbrdJxTNW65zVk4h0lG5FMrCgbDdOe+LJQBGB20PKidRBwnbReZa5mpnjlnPBUyI
	mjt6h4QhZVGPElzmTxvIyqMS8EOJw6g==
X-Google-Smtp-Source: AGHT+IH9KMxSRQ5wVKmte0Bi3CRERC2XxJgetiRnkGTJBGEVXsPWpng07cULyLreEjs12GMrzr3xnVDBBaYvIjN3EJY=
X-Received: from pjbsd5.prod.google.com ([2002:a17:90b:5145:b0:33b:52d6:e13e])
 (user=willmcvicker job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:5444:b0:343:7714:4cab with SMTP id 98e67ed59e1d1-34947f07f1fmr4183700a91.22.1764897037891;
 Thu, 04 Dec 2025 17:10:37 -0800 (PST)
Date: Fri,  5 Dec 2025 01:10:16 +0000
In-Reply-To: <20251205011027.720512-1-willmcvicker@google.com>
Mime-Version: 1.0
References: <20251205011027.720512-1-willmcvicker@google.com>
X-Mailer: git-send-email 2.52.0.223.gf5cc29aaa4-goog
Message-ID: <20251205011027.720512-4-willmcvicker@google.com>
Subject: [PATCH v7 3/6] clocksource/drivers/exynos_mct: Fix uninitialized irq
 name warning
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
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_171039_149470_2FEEFC3C 
X-CRM114-Status: GOOD (  17.45  )
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
2.52.0.223.gf5cc29aaa4-goog


