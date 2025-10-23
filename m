Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F57BCCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 20:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n3ErCVLsFFmYy6ztYolejF5Ple6tVW26MCiEzz3ldVw=; b=1meWCSod8jegjtrcyBc8sBO33t
	ULmiAbXwjNvC7uk4idDmgAUwu0Ff/OM5nt/SyyQR5lFZBqYNOUYGewB+Ezw2AXXyNWIDbWxT+hUtL
	pZCVmiYHUO6sDywwydYPNEr4nexRnh0EMFod3iwIm+VRnE4mVGqgNIc9uZiMzuohNupED2S4MDbW5
	mrDTVe5E89xLeOKabFm6UAFchYa1yRdEjNawUoUSl/oTN0yM1CbUxFjg6MIjcnhuizDJ+5GXDTYfE
	13huzG4b1vDWE1nKlCVI5PmQv3wdD98tcgbjqQo7WmDLQrSN2Ah+WpaAdLdNqtSEdKlM9DzeJi3q2
	FyP+RiSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC2JN-00000007aT5-2XO8;
	Thu, 23 Oct 2025 20:53:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC2JG-00000007aNl-34TJ
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 23 Oct 2025 20:53:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=n3ErCVLsFFmYy6ztYolejF5Ple6tVW26MCiEzz3ldVw=; b=YPRtP3SqRTVMc/T4h6rcDHFlPO
	GhdmCoZ50pK3BS7l9Q61H0VBd/x+pBg3B5bmBMdmyajuQJCLVPIRVmmBHyD6qW31AZHfB3Ft/xT+r
	i6daumFZ7xp+4sWcqUKCOfE4hoW+QMCgpdUPBG0O+MycVLcYiNjCnQi+x9riZZdKycmELdY6i9xI/
	qtqJdU1PqqVVjPpDOf4yxxsZTiNyRqdCHXzR4s7mn+0IecnMxabuKIqwl9Empt8kgZFW0lhJkzcWa
	1U2D1sH/tsXGazana5+zVCg6N3JoLECtXEDIW1uM090q662n5C8/bjEa0GWxcmMHw8JE/EIeZ0T1S
	xwh8MKRQ==;
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC1RT-00000001k7v-1ifs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Oct 2025 19:57:50 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-33c6140336eso2733177a91.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Oct 2025 13:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761252792; x=1761857592; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=n3ErCVLsFFmYy6ztYolejF5Ple6tVW26MCiEzz3ldVw=;
        b=T4LoS1bOZBYoCgVz5gGYzubCG38eab5Vl+z6/9/oodcSIqxHdnbeQxFPIe6rn7RQ0X
         prwCwlEL+oUQeNR2VWGH0ollWGYuvkdpJsbR8PQ8pDy+C1rtmvdNz8GdKUa/TyXRT8Ue
         /7Bxii3pyzjQ3LLeqQfaYr3edNAwfi5caL1VvNsgdBHOr9w/06ydpE+lPGy+Gzzb2vOu
         gkGNjfXJvOzO5SaQCTb9+VZza7c7wfhdAReb9WZAzDPGDnC5UawTX+qMUoOd6gZ6+gxp
         pfmNcMF4LnyihiXFiA6HKj7nEjIop4CNfaGNde1tnE/+CXuJrvRc8A69zInF+SInNvUg
         kxCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761252792; x=1761857592;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n3ErCVLsFFmYy6ztYolejF5Ple6tVW26MCiEzz3ldVw=;
        b=Uc1NIGTEiKzh80ukS/8j6tSV+IJ3bdVtI+KqQRTO4ooEItrelixUZCjbL7IJ7GdX5l
         s4l9eQQuyuMrmhTiafer3CJWYy+Q51L9mcSxBkP2gSgZKen1HYhK9qtEg185HKLFQVqm
         LI3ytzJ+RVAxbZ4iXgPDQmtPa2ZDhu6hYZL5tD8HjKj/OAJ8dVNnyHa+/7qkFHga5sqR
         TtmQoaHC5NNPplCm6I3/W2rnC/22t3HrVkVbSpUiUTuGAdPCoW+w3L+3SPsmA6vU0zWE
         QyAmSa/XnXp9rdVBjHm5y9F7fUVnLbHL5vmRrF+8o6owK+S73H7oDjgD0MWCZv7TinMi
         0AUw==
X-Forwarded-Encrypted: i=1; AJvYcCXlhwmsM9cMA3FgaouDZskn642+rSEPhSCqw371X+Ua732UjfiPrQS+Kwgu2hcPu1xnJqVIjimfiWXL9p7rUqVY@lists.infradead.org
X-Gm-Message-State: AOJu0YxKG6M2cxGQMoPaG+ZdkR430j4fMbipEDno5eBKbU9rB2smc8Rd
	EnXXqC0paHAuBXGqiNPg1QpnWeGM08Xj/AiyA3Kz/PQB35vW9fp87umU4BzxxS80fqGp0GNx4KP
	0X32A0mxLjY52ErjBdjxKK+wdJBodTQ==
X-Google-Smtp-Source: AGHT+IFW1kad+/CsnnzJKL1H1lX75kDUCzIPITXCJ5Bo7w07f+DaO2z/DzasuC8nJRHc1pc75xqQpvcM/Ch6dWDL4aY=
X-Received: from pjni12.prod.google.com ([2002:a17:90a:838c:b0:33e:3082:9b48])
 (user=willmcvicker job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:4ac4:b0:33e:30b2:d20 with SMTP id 98e67ed59e1d1-33e30b20e23mr9036228a91.33.1761252791696;
 Thu, 23 Oct 2025 13:53:11 -0700 (PDT)
Date: Thu, 23 Oct 2025 20:52:47 +0000
In-Reply-To: <20251023205257.2029526-1-willmcvicker@google.com>
Mime-Version: 1.0
References: <20251023205257.2029526-1-willmcvicker@google.com>
X-Mailer: git-send-email 2.51.1.821.gb6fe4d2222-goog
Message-ID: <20251023205257.2029526-6-willmcvicker@google.com>
Subject: [PATCH v5 5/7] clocksource/drivers/exynos_mct: Fix uninitialized irq
 name warning
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
X-CRM114-CacheID: sfid-20251023_205748_579042_84AC79CE 
X-CRM114-Status: GOOD (  17.59  )
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
Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Reviewed-by: Youngmin Nam <youngmin.nam@samsung.com>
Tested-by: Youngmin Nam <youngmin.nam@samsung.com>
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
2.51.1.821.gb6fe4d2222-goog


