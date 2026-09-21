Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E42C4C982EE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 19:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:Cc:To:From:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GFcZ8v2IrQlVXsS28/gxish2Yf7RjcBy4ak1q2e8MoU=; b=qHXR0LhbWN6o0tgpeXJZXxvNUc
	GiaEVa/ggXcTH+V96gOVywbeV4Ip12b9fy/V+nj82/S36NSdNFM/jeyu9YzgUz9StHNudP2mcJZIy
	RAED6uZn1/mWBaLmoY0yzp7k+phW/VzwHoo31NUgPptTndwYFpT3H+AXHVhKlqgILV6Ad+T9WHbDm
	TIov3loRRA1AtdmAXaU0mRnk4CTjnhIj0rdNhKl5nRI0RIpBy3ueRsutOOWUY2KQzLiSdkCI+q8Ra
	jLFo6mvVXF2MTBkVxzEIG/b0ygM7MBQhRRok8+E/Vl1peE+zSqS5NHEqbGuf/Ef4C0SUx7hjV7iZv
	assRFg6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8jHf-00000003CWq-1jOM;
	Mon, 21 Sep 2026 19:02:35 +0000
Received: from mail-vs2-x10.google.com ([2a00:1450:4864:3a::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8jHV-00000003CUN-3Oof
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 19:02:27 +0000
Received: by mail-vs2-x10.google.com with SMTP id ada2fe7eead31-785692e5907so2038888137.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 12:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brivo.com; s=google; t=1790017341; x=1790622141; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:subject:cc:to:from
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GFcZ8v2IrQlVXsS28/gxish2Yf7RjcBy4ak1q2e8MoU=;
        b=TeUb+zLDainnTPmwidcu5AyEbVIi2NBOMovX78I9YxRy02b7gq43725/HA4rk3zszP
         Spmp7RMxYMoyyHMTTAN96FtJexRSqq2LJmxhuNsucPShsEmvbeW0gKuJVj1gybbtuQ5R
         sWgJmudaE3b8UWUnsYTLEx2ujxBjW9Z/xxP1Op4OGzQaHMQQsjsl8MRrFSYW/sJhSMFz
         Cx4aBNAZ+kBbpl2A/Bwr3PB5/VZrbbxSQAtXYAOr6re7AhKP7rC4XKqaOw6q55nbcAa/
         TnV5H7EUpZjkivONkibzkxJdRK6SIbYUu7jYvKyIgIIOSrwQh08OzKa5FC1gJEigI6yS
         OIxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790017341; x=1790622141;
        h=content-transfer-encoding:content-type:subject:cc:to:from
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GFcZ8v2IrQlVXsS28/gxish2Yf7RjcBy4ak1q2e8MoU=;
        b=uuEPr8eP0jbSOom3k1XbRzgcd8BjPqpNLDNST7MbtcVXMHokOavnX92c6qc3AguvOm
         U0wtprBKd9I0R/98iLxHLkCmX6eXk0Ja4XIiZeUwD6BDWkc5pXsOTTH/cYDXc3QhwjWr
         zsWg+og+w1OnIBkEyHf1kGMWX41AcDWHOuJD/sRHa/Twa7SOMgpmmxHjU5R42+B3m/LE
         ZpGqeIxSsiVtmqecxSGHlaKWyVXDesQqhmIdenfseWkJxPeGniOMWZPJyL5xUTrkDMjf
         7jy5JIvCxeRq445liuAtDvt3h2ZnDqG2wWTI5eWEJM+7+gGgeWpZRuqwHkq1DANnPMP2
         DSCw==
X-Forwarded-Encrypted: i=1; AKwUvBy91v1Wwlx56UHMMbG86DR9cbpKv4v179C4H4j5bSp3qnWZ7CEDT6lMJGZy+jzEqM9GZqA6jlc50A+/qgmm6oCo@lists.infradead.org
X-Gm-Message-State: AFuF++n/8bFWkg7y5LZuLd2CSWvafvxQZYhzb6RBstpW5gJRXtdpyT5P
	UyJTZrulEQtCFJetx2/yblyoQCGRgkkeWUB0m+cCQDlbWSfLSB89nbcnGY92OrUkpUarDyktLFc
	B1wojz0E8klzux+qFxc9+TSEwLEQogKsbtgclNavqemKwQdZqFkMqU+dzJYc40o2mKQVflw==
X-Gm-Gg: AYBFou388RZfqJ9aWHUrbAGyTgBmWZgXvf2KrtHRfdkCbfF7H09qU+5eJFgvRImVlli
	uHhuvHYMPrB9E6nJg7VKuV7SLlBp3DTMRdxqmcAoPx6iI+t26mp3O5Qzu39gFHXQHBBKNeoNkae
	7TaFg2q3v4Bt6UQPMUwESPSOS6XF/bsJC5Rr5lipeIQX6cj2ob1KJtso2ztrbljiwQ8cUFvsuJb
	J4BCNahGoDJm7UN6aoPkYdmiITBT0ov1UyergBumtBkxNak1KTQqcQ8d+oi3z6acOFc2Vqqhp0e
	Iz6PT+6rgNKKy+XdcmiZgvLAUSU6u/S2SJztsu/Mfi84zmxftSp4iCRpeKWZXgJkamYQBiL5RIQ
	LyF+a9VCvAwZMhgB0Mu6SWyVnrD5jQB/esn32C4Hpnw9XXPrLpYOgc9HWDCr489Qt0DTbWeTiMH
	0GWuCXV/1gXEENG1Ok1e441RdwU3eSEbR4sINH+enZS7l5o8fLU/U7YQNjXqQGrbLYJcksUj1Ot
	UN4
X-Received: by 2002:a05:6102:2922:b0:7a3:4e75:d1f0 with SMTP id ada2fe7eead31-7a55d38b2b7mr6284952137.23.1790017341074;
        Mon, 21 Sep 2026 12:02:21 -0700 (PDT)
Received: from [10.200.233.210] ([71.163.254.246])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7aad2e36ea7sm8429137.4.2026.09.21.12.02.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 12:02:20 -0700 (PDT)
Message-ID: <d90c0eec-728b-4607-b480-86b2534559c4@brivo.com>
Date: Mon, 21 Sep 2026 15:02:19 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Sean Anderson <sanderson@brivo.com>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 linux-pwm@vger.kernel.org
Cc: Brian Masney <bmasney@redhat.com>, linux-kernel@vger.kernel.org,
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Subject: Potential deadlock in clk-pwm
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_120226_029705_0B244850 
X-CRM114-Status: GOOD (  16.85  )
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

Hi,

I found a potential deadlock in clk-pwm with lockdep. The problem occurs
when a multi-channel PWM calls a clock function (such as clk_get_rate) in
its apply callback. If one channel of the PWM is used for a clk-pwm, and
another channel is used for some other purpose, then the following deadlock
can occur:

CPU0                        CPU1
====================== =========================
pwm_get_state_hw(chip)
  guard(pwmchip)(chip)
		       clk_get_scaled_duty_cycle(clkb)
		        clk_prepare_lock()
		        clk_pwm_get_duty_cycle(clkb)
		         pwm_get_state_hw(chip)
		          guard(pwmchip)(chip)
  chip->get_state()
   clk_get_rate(clka)
    clk_prepare_lock()

The same scenario can play out with apply instead of get_state.  I don't
think this can really be fixed in clk-pwm. That driver doesn't have control
over whether it's called with prepare_lock held or not, and it has to call
into the PWM API in order to do anything.

One approach could be to convert the PWM drivers to avoid calling any
(sleeping) clock functions from apply. Fortunately, it seems like there are
not that many drivers used in-tree:

- pwm-imx27
- pwm-meson (by far the most prolific user)
- pwm-renesas-tpu
- pwm-tiecap (doesn't call any clock functions from apply/get_state)

and none of the in-tree users use any of the other channels AFAICT.

Unfortunately, converting these drivers to be atomic is non-trivial.
All of them enable/prepare their parent clock only when necessary to save
power. Converting them to prepare/disable in request/free could result
in increased power usage if the parent turns on in prepare instead of
enable. Additionally, pwm-meson also sets the clock rate for improved
accuracy, and this would have to be removed.

I suspect that removing these features to fix a bug that can't occur on
existing hardware would be well-received. On the other hand, pwms are
exposed to userspace, so I think a privileged user could deadlock the
system just by reading /sys/kernel/debug/pwm and
/sys/kernel/debug/clk/<name>/clk_duty_cycle repeatedly.

Does anyone have better ideas? I don't know if there's a way to catch this
bug at runtime without lockdep. Non-atomic drivers are still OK as long as
they don't take prepare_lock.

--Sean

======================================================
WARNING: possible circular locking dependency detected
6.18.52-yocto-standard-00169-gbc0cb063dbe7-dirty #1 Not tainted
------------------------------------------------------
kworker/u16:2/47 is trying to acquire lock:
ffff8000827d8968 (prepare_lock){+.+.}-{4:4}, at: clk_prepare_lock (drivers/clk/clk.c:228)

but task is already holding lock:
c5ff000002bc77c8 (&chip->nonatomic_lock){+.+.}-{4:4}, at: pwm_apply_might_sleep (drivers/pwm/core.c:43 drivers/pwm/core.c:54 drivers/pwm/core.c:747)

which lock already depends on the new lock.


the existing dependency chain (in reverse order) is:

-> #1 (&chip->nonatomic_lock){+.+.}-{4:4}:
        __mutex_lock (kernel/locking/mutex.c:598 kernel/locking/mutex.c:760)
        mutex_lock_nested (kernel/locking/mutex.c:812 (discriminator 1))
        pwm_get_state_hw (drivers/pwm/core.c:43 drivers/pwm/core.c:54 drivers/pwm/core.c:812)
        clk_pwm_get_duty_cycle (drivers/clk/clk-pwm.c:71)
        clk_core_update_duty_cycle_nolock (drivers/clk/clk.c:3095)
        __clk_register (drivers/clk/clk.c:4032 drivers/clk/clk.c:4380)
        devm_clk_hw_register (drivers/clk/clk.c:4460 (discriminator 1) drivers/clk/clk.c:4684 (discriminator 1))
        clk_pwm_probe (drivers/clk/clk-pwm.c:152)
        platform_probe (drivers/base/platform.c:1377)
        really_probe (drivers/base/dd.c:640 drivers/base/dd.c:718)
        __driver_probe_device (drivers/base/dd.c:880)
        driver_probe_device (drivers/base/dd.c:910)
        __device_attach_driver (drivers/base/dd.c:1038)
        bus_for_each_drv (drivers/base/bus.c:462)
        __device_attach (drivers/base/dd.c:1110)
        device_initial_probe (drivers/base/dd.c:1159)
        bus_probe_device (drivers/base/bus.c:583)
        deferred_probe_work_func (drivers/base/dd.c:124)
        process_one_work (kernel/workqueue.c:3294)
        worker_thread (kernel/workqueue.c:3377 kernel/workqueue.c:3458)
        kthread (kernel/kthread.c:432)
        ret_from_fork (/usr/src/debug/linux-yocto/6.18.52+git/arch/arm64/kernel/entry.S:860)

-> #0 (prepare_lock){+.+.}-{4:4}:
        __lock_acquire (kernel/locking/lockdep.c:3167 kernel/locking/lockdep.c:3286 kernel/locking/lockdep.c:3910 kernel/locking/lockdep.c:5239)
        lock_acquire (kernel/locking/lockdep.c:5872 kernel/locking/lockdep.c:5829)
        __mutex_lock (kernel/locking/mutex.c:598 kernel/locking/mutex.c:760)
        mutex_lock_nested (kernel/locking/mutex.c:812 (discriminator 1))
        clk_prepare_lock (drivers/clk/clk.c:228)
        clk_set_rate (drivers/clk/clk.c:2592 drivers/clk/clk.c:2584)
        meson_pwm_enable.isra.0 (drivers/pwm/pwm-meson.c:235)
        meson_pwm_apply (drivers/pwm/pwm-meson.c:328)
        __pwm_apply (drivers/pwm/core.c:707)
        pwm_apply_might_sleep (drivers/pwm/core.c:761)
        pwm_adjust_config (drivers/pwm/core.c:897)
        pwm_regulator_probe (drivers/regulator/pwm-regulator.c:403)
        platform_probe (drivers/base/platform.c:1377)
        really_probe (drivers/base/dd.c:640 drivers/base/dd.c:718)
        __driver_probe_device (drivers/base/dd.c:880)
        driver_probe_device (drivers/base/dd.c:910)
        __device_attach_driver (drivers/base/dd.c:1038)
        bus_for_each_drv (drivers/base/bus.c:462)
        __device_attach_async_helper (drivers/base/dd.c:1067)
        async_run_entry_fn (kernel/async.c:129)
        process_one_work (kernel/workqueue.c:3294)
        worker_thread (kernel/workqueue.c:3377 kernel/workqueue.c:3458)
        kthread (kernel/kthread.c:432)
        ret_from_fork (/usr/src/debug/linux-yocto/6.18.52+git/arch/arm64/kernel/entry.S:860)

other info that might help us debug this:

  Possible unsafe locking scenario:

        CPU0                    CPU1
        ----                    ----
   lock(&chip->nonatomic_lock);
                                lock(prepare_lock);
                                lock(&chip->nonatomic_lock);
   lock(prepare_lock);

  *** DEADLOCK ***

4 locks held by kworker/u16:2/47:
  #0: 81ff0000003dc948 ((wq_completion)async){+.+.}-{0:0}, at: process_one_work (kernel/workqueue.c:3268)
  #1: 02ff800083a37d10 ((work_completion)(&entry->work)){+.+.}-{0:0}, at: process_one_work (kernel/workqueue.c:3269 (discriminator 1))
  #2: afff000000a57140 (&dev->mutex){....}-{4:4}, at: __device_attach_async_helper (include/linux/device.h:1013 drivers/base/dd.c:1053)
  #3: c5ff000002bc77c8 (&chip->nonatomic_lock){+.+.}-{4:4}, at: pwm_apply_might_sleep (drivers/pwm/core.c:43 drivers/pwm/core.c:54 drivers/pwm/core.c:747)

stack backtrace:
CPU: 3 UID: 0 PID: 47 Comm: kworker/u16:2 Not tainted 6.18.52-yocto-standard-00169-gbc0cb063dbe7-dirty #1 PREEMPT
Hardware name: Blaze Edge 3.0 (DT)
Workqueue: async async_run_entry_fn
Call trace:
  show_stack (arch/arm64/kernel/stacktrace.c:499) (C)
  dump_stack_lvl (lib/dump_stack.c:94 lib/dump_stack.c:120)
  dump_stack (lib/dump_stack.c:129)
  print_circular_bug (kernel/locking/lockdep.c:2045)
  check_noncircular (kernel/locking/lockdep.c:2177)
  __lock_acquire (kernel/locking/lockdep.c:3167 kernel/locking/lockdep.c:3286 kernel/locking/lockdep.c:3910 kernel/locking/lockdep.c:5239)
  lock_acquire (kernel/locking/lockdep.c:5872 kernel/locking/lockdep.c:5829)
  __mutex_lock (kernel/locking/mutex.c:598 kernel/locking/mutex.c:760)
  mutex_lock_nested (kernel/locking/mutex.c:812 (discriminator 1))
  clk_prepare_lock (drivers/clk/clk.c:228)
  clk_set_rate (drivers/clk/clk.c:2592 drivers/clk/clk.c:2584)
  meson_pwm_enable.isra.0 (drivers/pwm/pwm-meson.c:235)
  meson_pwm_apply (drivers/pwm/pwm-meson.c:328)
  __pwm_apply (drivers/pwm/core.c:707)
  pwm_apply_might_sleep (drivers/pwm/core.c:761)
  pwm_adjust_config (drivers/pwm/core.c:897)
  pwm_regulator_probe (drivers/regulator/pwm-regulator.c:403)
  platform_probe (drivers/base/platform.c:1377)
  really_probe (drivers/base/dd.c:640 drivers/base/dd.c:718)
  __driver_probe_device (drivers/base/dd.c:880)
  driver_probe_device (drivers/base/dd.c:910)
  __device_attach_driver (drivers/base/dd.c:1038)
  bus_for_each_drv (drivers/base/bus.c:462)
  __device_attach_async_helper (drivers/base/dd.c:1067)
  async_run_entry_fn (kernel/async.c:129)
  process_one_work (kernel/workqueue.c:3294)
  worker_thread (kernel/workqueue.c:3377 kernel/workqueue.c:3458)
  kthread (kernel/kthread.c:432)
  ret_from_fork (/usr/src/debug/linux-yocto/6.18.52+git/arch/arm64/kernel/entry.S:860)

