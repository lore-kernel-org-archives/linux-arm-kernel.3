Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE254C7115A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 21:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KucomvysAjkq7Mc20S0WzT2rldg2A7wys58v4bjZBcg=; b=Lh/k9qyAyCSeeZjTb1pal9/V/K
	Hu8IAXUNB/P1NgKnHHFZMpaZXmmy9baB/PbfuY7nts65HPQrBUTEsCXSu6ZoJSuJob5pb4qjl5V4k
	nVjmUHZM/xnEqHaryc0Q3Ru/Rszs9EQfPpXf2Tg+C+kmZ9O5FIhl2wjqcnSou1J9WxFdWlnS7YSnr
	9GsVP4e4/aXmMGMBcsLzxDix6mBKeWF5O29LpxYYuQ88D/9rIywds+wBv5jgx/e/O/GEp3xClUbT9
	7wnRzdrGc2XGPQzKJ8GOOnxVGilX1px946jk/8Lz+JSYpACO+enhXKuee79v/D8MWdnjkesB//cYt
	TyibZvlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS0EQ-0000000BQmA-2BNX;
	Wed, 18 Jun 2025 21:22:06 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS01w-0000000BP8K-49aA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 21:09:14 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-7377139d8b1so66360b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Jun 2025 14:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750280952; x=1750885752; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=KucomvysAjkq7Mc20S0WzT2rldg2A7wys58v4bjZBcg=;
        b=n7TUWCK40aOrgqUOqIsgQ/+Lwwu+lzN7L0eZLv+nKcWe7Er8ZJkQV/uzySAUPMLjw2
         /ICCb8vxBSEKcq5gahUQNfMYGOthFlOW4Rb6VswHMJmsqaJfJSzMTjozgo7BfqqHVq15
         2pWy0MQE6FoubpsJ8fbH3kuX5tpKMFDr9aWobyrLnEt4GdZL8nyWPd5MsTBSk/OO7TLs
         6zdK13zh3kach9LspKl3fxBlEz15RQHAf88lRaP5INPpRY6XBJ6gySlYdYWjsz6XePyP
         6C5V1nH52HM9ZK/iHQdKh8blDOdeTZrQok46kABYA2O2kv775E9OFuKH7/xCzSU3seIX
         fMCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750280952; x=1750885752;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KucomvysAjkq7Mc20S0WzT2rldg2A7wys58v4bjZBcg=;
        b=a2GLQEA+9GGhuGlCE+KUqv80SvEQ+dmmP7AHcatPgajlnU1g42vzK8zXzo7vfOW4Wr
         wmh+/QGVKWF2ZwMZpano5se5yitcC3ZzIkqmoT1qs0U3TvuLlkGQ3lUDeXxfQAqVn9QJ
         /g7w9jKIj295H5DOATUSIVBeZhEwuiF0+NPm2TQw3st5RkzQsK8wIm8ZabQeHfk9tT6G
         dYZGncJzi7HsT0bnDnvOve0DjTdXav0rLGgV5sP3DUljJUrulzCVS9l1afAMNi4oUqXF
         fCtk72z+fek80tkaOOcMH/nCQEhcVyGfeR73Z8bkKyevEHJJHZQ0swvwFHe9GZmIZQLy
         OXIw==
X-Forwarded-Encrypted: i=1; AJvYcCW8TA2HPCNwJFMoRhoQBTNsVl5B4SSZlFtFXeYJMrsuNd5B5oH+ViuOPmsZrbHD8GPPU9j7HGzHf69IjluXyoDC@lists.infradead.org
X-Gm-Message-State: AOJu0Yyw7Q8YO6XPiyvvUIK06R+H+QgZZMd7x7Plx48sdklA8aXS4Z1I
	F/ot7yf+Usp36nXkt7L2a8D5yOPeFA05Qtw5319RIAwBL3Yn+ffj5cxoIdsMGrplInDBqMh/0cz
	7RoJ6sE9O1O5MlHliBQlAl7/tzTMgRA==
X-Google-Smtp-Source: AGHT+IEUH0HhZVuisj90FwEGDiok/NrAHfvkSm0jzyn2dsHw93KZbhBFM72hsFqGAT45LPQd/K59WQMzu1/wKRC8RnU=
X-Received: from pfcj16.prod.google.com ([2002:a05:6a00:1750:b0:748:f627:51c4])
 (user=willmcvicker job=prod-delivery.src-stubby-dispatcher) by
 2002:aa7:8884:0:b0:742:a0cf:7753 with SMTP id d2e1a72fcca58-7489ce0d394mr26377988b3a.3.1750280951666;
 Wed, 18 Jun 2025 14:09:11 -0700 (PDT)
Date: Wed, 18 Jun 2025 14:08:41 -0700
In-Reply-To: <20250618210851.661527-1-willmcvicker@google.com>
Mime-Version: 1.0
References: <20250618210851.661527-1-willmcvicker@google.com>
X-Mailer: git-send-email 2.50.0.rc2.761.g2dc52ea45b-goog
Message-ID: <20250618210851.661527-5-willmcvicker@google.com>
Subject: [PATCH 4/6] clocksource/drivers/exynos_mct: Fix uninitialized irq
 name warning
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
X-CRM114-CacheID: sfid-20250618_140913_027726_6068A252 
X-CRM114-Status: GOOD (  17.89  )
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
2.50.0.rc2.761.g2dc52ea45b-goog


