Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26791CCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 20:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n3ErCVLsFFmYy6ztYolejF5Ple6tVW26MCiEzz3ldVw=; b=KzvjrDC+6Lh+Qz12U2r4sMBuB+
	/zGP5OO6urHOrOpO3N+vuQgFnCytDbd2WkGJVuzEWz76eJ2TMcEhUe7p3ACeFjVnoMij4gF0u7Q3V
	1iUK7I+NeW+HEwoNzhFKBNow+NDMqCwjMm12zhikS891G3j5ytgNI9GwrFPm2GZvhufldOW5UF3AU
	AXFni2UmUKdTzw2UyS1PPC8mfIikAlGp7lFgpL6tzD+ojDgPOURQCBr6/Z/ltz4TmTY1oCotzrnHT
	RzZH/gQD8qSufizQ/KhK2ii/dKzu3PNpcKofHrHzqsWFg3wKacDhqyH0JoZIdKC4pgSwVdO/O/gXa
	v8Rdxm7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC2HE-00000007ZUL-0lW0;
	Thu, 23 Oct 2025 20:51:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC2H6-00000007ZOO-2Or1
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 23 Oct 2025 20:51:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=n3ErCVLsFFmYy6ztYolejF5Ple6tVW26MCiEzz3ldVw=; b=mpUEBz/7Mbc3HkPxUX2e44G/Cs
	DB9W5rkuhdckRTuztGpBwaHZgV1I7KneLkE+8w5O1so2sNt//3Y8By8exj5c9yAo1P0fujsf0EGCb
	jYtLgLS+FpH8GbGR6nhmD2P9obnfX0de0dVe3FezfMaHcmP2iTaCu7jMHidgusm1FacfU8tVMDNZY
	VccPziQOSfjhz6yLqtg60lv9yw7BI5FMKivRdXJSXHCW6D6UpKJ4OzEqziBA7RFfzSkZ46Fu+F0bY
	cSacmEuvLm8owFLDU2VGx/a2MQcRsTcyhQ8Gt3mET7B6IhN3u82NDR0u2by2L2AwasJfT1ak0XCjl
	6T5ufrkQ==;
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC1PK-00000001jsv-2vz1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Oct 2025 19:55:40 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-32eddb7e714so1131419a91.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Oct 2025 13:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761252658; x=1761857458; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=n3ErCVLsFFmYy6ztYolejF5Ple6tVW26MCiEzz3ldVw=;
        b=4HbBm98U5gan17n3QWRHhBm5Tq3vNyiHTs+0FYj4pLE42k1VmpIfE+zdpDc3Q8EUTf
         xnbFXaSZIHRED0uqJGAMQnupUvsFEfdSMVBjm3r7ANyBOiFtrvDcNBC/RaUICb478HaS
         hNrz32wwZgDDaoU93qt0N54+xuK7AjRS4ur2xBa9d4w0iEloaFThCteUhdjVeTi01Y/R
         b4LYmFyvZ6all0jcmfEcJZlphMnxj1EG6moiLZQtAF8z7N+vc6lyFr2U+fOdi5Tq7f0l
         J+lrUc8BnDoNHVDJGOvzKqwqELaDAqBoEIHMuGjNc0jeRkGt2FANOGTOvASD38/9dQAW
         q9Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761252658; x=1761857458;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n3ErCVLsFFmYy6ztYolejF5Ple6tVW26MCiEzz3ldVw=;
        b=LlZFT5Ovp0sbQYmFTEozXYgOybxXnY2K6Jml/ywtR8L1daH2hlOnghjtCQDD2VJIqB
         Yx8KdOdljQ38EDNiVs6Oq+gT4BpqaBoudLXSUUZFSUTGX6zWh/R4kXBdWqWIZSmNY433
         EQGC156ILmBwQ8nol456740p2j+nUcetY2sP+2O59HPIBfG/2TBfmryysOL/eTvt8iaj
         zfbt/sXz/DhTnaopWOtHYhP6l6pmodq0MEj/2pmbhQLjAWVIAZ0++xfefQtuBVWvjcTp
         TNv6TuaVjlepcMXmLp+MW6hyaVoA3J6YDyCuuFpcM7vTb0TFquIN+C6i+JoJeSc0V7e6
         IMDQ==
X-Forwarded-Encrypted: i=1; AJvYcCWJuXDbBLCMzoZOVJJ8kBWln9jvqKNpip1xFFJ8LxGbZK3ynOSUGuHCp7abRrXxwoQTs44C1pwTj0sY+UWPWqQk@lists.infradead.org
X-Gm-Message-State: AOJu0YyAFjX2752mZb8pblbXpTPPYgIRcAoByYlaCCcL6rt/bpcEVQ3W
	iQlysxe3rWqk8IO25FtI+S4t2HCQrNUhBBvpT1+ZQ+2yHwkarBD67lgecipfwwbWPsjGnVGPUYa
	IftaNRQmX733ge0V2pO3tY0BIENLfLg==
X-Google-Smtp-Source: AGHT+IHJvKbU9UgJaSGXWAUX+DnipcUlKhq0hmwyYZnhUYzOqrdpDg7R1VNHjGHXBcYDkXnRvHh8GcGOhqCddYEK0g4=
X-Received: from pjbsb7.prod.google.com ([2002:a17:90b:50c7:b0:33b:51fe:1a94])
 (user=willmcvicker job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:33c3:b0:32e:8c14:5d09 with SMTP id 98e67ed59e1d1-33fafb97551mr5184629a91.7.1761252658519;
 Thu, 23 Oct 2025 13:50:58 -0700 (PDT)
Date: Thu, 23 Oct 2025 20:50:31 +0000
In-Reply-To: <20251023205041.2027336-1-willmcvicker@google.com>
Mime-Version: 1.0
References: <20251023205041.2027336-1-willmcvicker@google.com>
X-Mailer: git-send-email 2.51.1.821.gb6fe4d2222-goog
Message-ID: <20251023205041.2027336-6-willmcvicker@google.com>
Subject: [PATCH 5/7] clocksource/drivers/exynos_mct: Fix uninitialized irq
 name warning
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
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_205538_366838_CC5AAB88 
X-CRM114-Status: GOOD (  17.78  )
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


