Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 199D8CA1013
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 16:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T0yYAj93Q88XPnAyE6fgpF3sboi1fpM098QNdZzLtLA=; b=eJ/FUeICyRDvVeHSEFA2rq9AXW
	vJ2D8bLBcuLtd11p4j2/svtsrssV+eztJbjR7QkYS95YrmJiK5zbxMudo7NTwIID7ZZu1jledSD6W
	i8F8kZreoA3Zcip5N44+RQPxQz5+YQiW3hQwMoXs+6UX+MNNRc9ccDXScd3a10bCIdiPO2JiSGyS/
	CGDWBhLdds5y1ODTMLCJzo5b184yp2s/vhtKH8jwp/837uBY9uidQCCFghwcHB0zUwInxmWKgtx37
	7nh8Ia7Vfrrkfl7VHeFuDHqF9ukdaiQcl0rF8qoM/DjWdo/dIiJyVyW5ixvLIWX+ToRjznE6Uo4JC
	hUYLlrdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuCnY-0000000CtzA-0X3Q;
	Thu, 04 Sep 2025 16:26:56 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu9oD-0000000Bohj-3HpS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 13:15:26 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-45b8b7ac427so8041515e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Sep 2025 06:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756991724; x=1757596524; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T0yYAj93Q88XPnAyE6fgpF3sboi1fpM098QNdZzLtLA=;
        b=It1grw0fER3TqTJqwFNekJYqZzBB8bWUJF5ey4XSo4lMCgOODBEDYvjcvyVEMAec6j
         g1TeC8Ooi0Ion3XDW0vX1UaGeLxjEnwbktdcZMA18G8UVuYk7j5qYAWmZgW9NWy4Df2L
         vNb0oyjsAEfCqRbOJjtc8ae9Q392NLaWwy5g2GP5PRvR3WtogPXnswjY8sxuUtwjpU+Y
         dQDUFvMKRmM+N887hPCalqemBCEgztkUCVjwHBp35G4N+/NTlLkGyeAYv5sHEX7gI9Ts
         11EVEJyUrZbwG7JqIy4kPTQb1RskAHagm0lmJk/sdmYNUO5o0ZZ7Xz2SDi8y1eWDjRSv
         czlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756991724; x=1757596524;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T0yYAj93Q88XPnAyE6fgpF3sboi1fpM098QNdZzLtLA=;
        b=tgLdbZzMpyAVuahnL3RGjF3FKNeLoJKa3+o8Pws7ealnXgThsAHtewk5LzMbFyr2G1
         IxUp833VGNBi+6e12QAATxoOV3+QiH15hW9sdYoNXqreOtcXAArGvQqFM2ZPShncNiUc
         J0Sas1+p4U062+hs5ibxhlmjMhHU3NTJ8PDThHcAanvV6sg5LBTJs5xn9LGKxjWLp8XK
         p8Yv1iV718JExDczooZRZRJmINbWxO1oAesrFZ673tVEktDsvLG7oqMiWiobEU4jie22
         0IYR1YlCyzCtTF0RmMxxAfisALlGLqbieHndgHzRIX5BhQJnK26Bnx/vatf9eQJlMWMW
         kfCw==
X-Forwarded-Encrypted: i=1; AJvYcCW8aPHrud9puip8bTv+cDKVLmYVlEBn1aqP35f3j3R6Irqps9+0mGdd1GZDxSyLVPTmIlPGmS6LznCY3o6cIQhF@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5/1tektq9QB1KScvsA3JxkNscZxgoj/UZ6YNk7cH1BF1Qxih+
	lScYvYEIlhe7sKUuXWdnLRISEzt1W3Dj+ieMrGeuXCkoqI2QPFYkl2r1csuSUAgMJzY=
X-Gm-Gg: ASbGncsNMJjHl2SC+HboH9IMPEA/TopuqdAistlJVK26T6tAQnSZcIKLRgNSvwq+MZ/
	n2GWaibkFbhZT+9q4IrUjDpNMsn9kmXgtzv9jUa8TelHaj4W2IL+q39++fxGv2iSPJLqQWpCsgb
	6TeVnT3sdM53TRBmaVszKJGusGmlS0hdKMBbn0H25DgccZdz2xpMv9wzPrciyN5Fh1mz/O7mYup
	ASaK8duwnDlsPx/uaRD2XSgyq952XdpsE49W/uJsBHibyS4+7rh2mEWsU+eFWmchlby1qzmrbEo
	0nro5imc71VbGt1YIYo+rN4YeTVE7sM+m3l7B1yBeyLUSn5ib0AGd86SNiD8XW8/icxNWHcll9C
	KsXNUsqGt6jT7nalZb/P4FHH2CF9a6ZRMwVSGwg==
X-Google-Smtp-Source: AGHT+IHsgokSIAzjmZsqV/IXzuIRDutyDAD3cRjEZC0qQeYag+P1LaU8c43p3l6HKwrr1pbxp0cNbg==
X-Received: by 2002:a05:600c:a43:b0:459:db69:56bd with SMTP id 5b1f17b1804b1-45b85570523mr146253065e9.20.1756991723984;
        Thu, 04 Sep 2025 06:15:23 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45d468dbf48sm48846925e9.11.2025.09.04.06.15.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Sep 2025 06:15:23 -0700 (PDT)
Message-ID: <ba94795e-367c-429a-a19f-2a220e33a117@linaro.org>
Date: Thu, 4 Sep 2025 14:15:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 25/28] coresight: trbe: Save and restore state across
 CPU low power state
To: Leo Yan <leo.yan@arm.com>, Yabin Cui <yabinc@google.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@linaro.org>, Levi Yun <yeoreum.yun@arm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Keita Morisaki <keyz@google.com>, Yuanfang Zhang <quic_yuanfang@quicinc.com>
References: <20250701-arm_cs_pm_fix_v3-v2-0-23ebb864fcc1@arm.com>
 <20250701-arm_cs_pm_fix_v3-v2-25-23ebb864fcc1@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250701-arm_cs_pm_fix_v3-v2-25-23ebb864fcc1@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_061525_842662_7483114B 
X-CRM114-Status: GOOD (  14.46  )
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



On 01/07/2025 3:53 pm, Leo Yan wrote:
> From: Yabin Cui <yabinc@google.com>
> 
> Similar to ETE, TRBE may lose its context when a CPU enters low power
> state. To make things worse, if ETE is restored without TRBE being
> restored, an enabled source device with no enabled sink devices can
> cause CPU hang on some devices (e.g., Pixel 9).
> 
> The save and restore flows are described in the section K5.5 "Context
> switching" of Arm ARM (ARM DDI 0487 L.a). This commit adds save and
> restore callbacks with following the software usages defined in the
> architecture manual.
> 
> Signed-off-by: Yabin Cui <yabinc@google.com>
> Co-developed-by: Leo Yan <leo.yan@arm.com>
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---

Hi Leo,

I tested this commit to try to avoid hitting any issues with the last 3 
hotplug changes but ran into two issues. They seemed to be hit when 
running the CPU online/offline/enable_source stress test and then after 
that running the Perf "Check Arm CoreSight trace data recording and 
synthesized samples" test.

It hit when doing them in either order, but not when doing only one 
after a reboot.

First one is just when running one of the tests:

  =====================================================
  WARNING: HARDIRQ-safe -> HARDIRQ-unsafe lock order detected
  6.16.0-rc3+ #475 Not tainted
  -----------------------------------------------------
  perf-exec/709 [HC0[0]:SC0[0]:HE0:SE1] is trying to acquire:
  ffff000804002cd0 (&drvdata->spinlock){+.+.}-{2:2}, at: 
cti_enable+0x40/0x130 [coresight_cti]

                and this task is already holding:
  ffff00080ab67e18 (&ctx->lock){....}-{2:2}, at: perf_event_exec+0xc4/0x6b8
  which would create a new lock dependency:
   (&ctx->lock){....}-{2:2} -> (&drvdata->spinlock){+.+.}-{2:2}

                but this new dependency connects a HARDIRQ-irq-safe lock:
   (&cpuctx_lock){-...}-{2:2}

                ... which became HARDIRQ-irq-safe at:
    lock_acquire+0x130/0x2c0
    _raw_spin_lock+0x60/0xa8
    __perf_install_in_context+0x5c/0x2f0
    remote_function+0x58/0x78
    __flush_smp_call_function_queue+0x1d8/0x9c0
    generic_smp_call_function_single_interrupt+0x20/0x38
    ipi_handler+0x118/0x338
    handle_percpu_devid_irq+0xb0/0x180
    generic_handle_domain_irq+0x4c/0x78
    gic_handle_irq+0x68/0xf0
    call_on_irq_stack+0x24/0x30
    do_interrupt_handler+0x88/0xd0
    el1_interrupt+0x34/0x68
    el1h_64_irq_handler+0x18/0x28
    el1h_64_irq+0x6c/0x70
    arch_local_irq_enable+0x8/0x10
    cpuidle_enter+0x44/0x68
    do_idle+0x1b0/0x2b8
    cpu_startup_entry+0x40/0x50
    rest_init+0x1c4/0x1d0
    start_kernel+0x394/0x458
    __primary_switched+0x88/0x98

                to a HARDIRQ-irq-unsafe lock:
   (&drvdata->spinlock){+.+.}-{2:2}

                ... which became HARDIRQ-irq-unsafe at:
  ...
    lock_acquire+0x130/0x2c0
    _raw_spin_lock+0x60/0xa8
    cti_disable+0x38/0xe8 [coresight_cti]
    coresight_disable_source+0x88/0xa8 [coresight]
    coresight_disable_sysfs+0xd0/0x1f0 [coresight]
    enable_source_store+0x78/0xb0 [coresight]
    dev_attr_store+0x24/0x40
    sysfs_kf_write+0xa8/0xd0
    kernfs_fop_write_iter+0x114/0x1c0
    vfs_write+0x2d8/0x310
    ksys_write+0x80/0xf8
    __arm64_sys_write+0x28/0x40
    invoke_syscall+0x4c/0x110
    el0_svc_common+0xb8/0xf0
    do_el0_svc+0x28/0x40
    el0_svc+0x4c/0xe8
    el0t_64_sync_handler+0x84/0x108
    el0t_64_sync+0x198/0x1a0

                other info that might help us debug this:

  Chain exists of:
                  &cpuctx_lock --> &ctx->lock --> &drvdata->spinlock

   Possible interrupt unsafe locking scenario:

         CPU0                    CPU1
         ----                    ----
    lock(&drvdata->spinlock);
                                 local_irq_disable();
                                 lock(&cpuctx_lock);
                                 lock(&ctx->lock);
    <Interrupt>
      lock(&cpuctx_lock);

                 *** DEADLOCK ***

  4 locks held by perf-exec/709:
   #0: ffff0008066b66f8 (&sig->cred_guard_mutex){+.+.}-{4:4}, at: 
bprm_execve+0x54/0x690
   #1: ffff0008066b67a0 (&sig->exec_update_lock){++++}-{4:4}, at: 
exec_mmap+0x48/0x2b0
   #2: ffff000976a467f0 (&cpuctx_lock){-...}-{2:2}, at: 
perf_event_exec+0xb4/0x6b8
   #3: ffff00080ab67e18 (&ctx->lock){....}-{2:2}, at: 
perf_event_exec+0xc4/0x6b8

                the dependencies between HARDIRQ-irq-safe lock and the 
holding lock:
   -> (&cpuctx_lock){-...}-{2:2} {
      IN-HARDIRQ-W at:
                        lock_acquire+0x130/0x2c0
                        _raw_spin_lock+0x60/0xa8
                        __perf_install_in_context+0x5c/0x2f0
                        remote_function+0x58/0x78
                        __flush_smp_call_function_queue+0x1d8/0x9c0
                        generic_smp_call_function_single_interrupt+0x20/0x38
                        ipi_handler+0x118/0x338
                        handle_percpu_devid_irq+0xb0/0x180
                        generic_handle_domain_irq+0x4c/0x78
                        gic_handle_irq+0x68/0xf0
                        call_on_irq_stack+0x24/0x30
                        do_interrupt_handler+0x88/0xd0
                        el1_interrupt+0x34/0x68
                        el1h_64_irq_handler+0x18/0x28
                        el1h_64_irq+0x6c/0x70
                        arch_local_irq_enable+0x8/0x10
                        cpuidle_enter+0x44/0x68
                        do_idle+0x1b0/0x2b8
                        cpu_startup_entry+0x40/0x50
                        rest_init+0x1c4/0x1d0
                        start_kernel+0x394/0x458
                        __primary_switched+0x88/0x98
      INITIAL USE at:
                       lock_acquire+0x130/0x2c0
                       _raw_spin_lock+0x60/0xa8
                       __perf_event_exit_context+0x3c/0xb0
                       generic_exec_single+0xb0/0x3a8
                       smp_call_function_single+0x180/0xa98
                       perf_event_exit_cpu+0x344/0x3d8
                       cpuhp_invoke_callback+0x120/0x2a0
                       cpuhp_thread_fun+0x170/0x1d8
                       smpboot_thread_fn+0x1c0/0x328
                       kthread+0x148/0x250
                       ret_from_fork+0x10/0x20
    }
    ... key      at: [<ffff800082bbe238>] cpuctx_lock+0x0/0x10
  -> (&ctx->lock){....}-{2:2} {
     INITIAL USE at:
                     lock_acquire+0x130/0x2c0
                     _raw_spin_lock_irq+0x70/0xb8
                     find_get_pmu_context+0x88/0x238
                     __arm64_sys_perf_event_open+0x794/0x1150
                     invoke_syscall+0x4c/0x110
                     el0_svc_common+0xb8/0xf0
                     do_el0_svc+0x28/0x40
                     el0_svc+0x4c/0xe8
                     el0t_64_sync_handler+0x84/0x108
                     el0t_64_sync+0x198/0x1a0
   }
   ... key      at: [<ffff800082bbe1d0>] 
__perf_event_init_context.__key+0x0/0x10
   ... acquired at:
     _raw_spin_lock+0x60/0xa8
     __perf_install_in_context+0x6c/0x2f0
     remote_function+0x58/0x78
     generic_exec_single+0xb0/0x3a8
     smp_call_function_single+0x180/0xa98
     perf_install_in_context+0x1a0/0x290
     __arm64_sys_perf_event_open+0x103c/0x1150
     invoke_syscall+0x4c/0x110
     el0_svc_common+0xb8/0xf0
     do_el0_svc+0x28/0x40
     el0_svc+0x4c/0xe8
     el0t_64_sync_handler+0x84/0x108
     el0t_64_sync+0x198/0x1a0


                the dependencies between the lock to be acquired
   and HARDIRQ-irq-unsafe lock:
  -> (&drvdata->spinlock){+.+.}-{2:2} {
     HARDIRQ-ON-W at:
                      lock_acquire+0x130/0x2c0
                      _raw_spin_lock+0x60/0xa8
                      cti_disable+0x38/0xe8 [coresight_cti]
                      coresight_disable_source+0x88/0xa8 [coresight]
                      coresight_disable_sysfs+0xd0/0x1f0 [coresight]
                      enable_source_store+0x78/0xb0 [coresight]
                      dev_attr_store+0x24/0x40
                      sysfs_kf_write+0xa8/0xd0
                      kernfs_fop_write_iter+0x114/0x1c0
                      vfs_write+0x2d8/0x310
                      ksys_write+0x80/0xf8
                      __arm64_sys_write+0x28/0x40
                      invoke_syscall+0x4c/0x110
                      el0_svc_common+0xb8/0xf0
                      do_el0_svc+0x28/0x40
                      el0_svc+0x4c/0xe8
                      el0t_64_sync_handler+0x84/0x108
                      el0t_64_sync+0x198/0x1a0
     SOFTIRQ-ON-W at:
                      lock_acquire+0x130/0x2c0
                      _raw_spin_lock+0x60/0xa8
                      cti_disable+0x38/0xe8 [coresight_cti]
                      coresight_disable_source+0x88/0xa8 [coresight]
                      coresight_disable_sysfs+0xd0/0x1f0 [coresight]
                      enable_source_store+0x78/0xb0 [coresight]
                      dev_attr_store+0x24/0x40
                      sysfs_kf_write+0xa8/0xd0
                      kernfs_fop_write_iter+0x114/0x1c0
                      vfs_write+0x2d8/0x310
                      ksys_write+0x80/0xf8
                      __arm64_sys_write+0x28/0x40
                      invoke_syscall+0x4c/0x110
                      el0_svc_common+0xb8/0xf0
                      do_el0_svc+0x28/0x40
                      el0_svc+0x4c/0xe8
                      el0t_64_sync_handler+0x84/0x108
                      el0t_64_sync+0x198/0x1a0
     INITIAL USE at:
                     lock_acquire+0x130/0x2c0
                     _raw_spin_lock+0x60/0xa8
                     cti_cpu_pm_notify+0x54/0x160 [coresight_cti]
                     notifier_call_chain+0xb8/0x1b8
                     raw_notifier_call_chain_robust+0x50/0xb0
                     cpu_pm_enter+0x50/0x90
                     psci_enter_idle_state+0x3c/0x80
                     cpuidle_enter_state+0x158/0x340
                     cpuidle_enter+0x44/0x68
                     do_idle+0x1b0/0x2b8
                     cpu_startup_entry+0x40/0x50
                     secondary_start_kernel+0x120/0x150
                     __secondary_switched+0xc0/0xc8
   }
   ... key      at: [<ffff80007b10d2a8>] 
cti_probe.__key+0x0/0xffffffffffffdd58 [coresight_cti]
   ... acquired at:
     _raw_spin_lock_irqsave+0x70/0xc0
     cti_enable+0x40/0x130 [coresight_cti]
     _coresight_enable_path+0x134/0x3c0 [coresight]
     coresight_enable_path+0x28/0x88 [coresight]
     etm_event_start+0xe0/0x228 [coresight]
     etm_event_add+0x40/0x68 [coresight]
     event_sched_in+0x270/0x418
     visit_groups_merge+0x428/0xcd0
     __pmu_ctx_sched_in+0xa0/0xe0
     ctx_sched_in+0x110/0x188
     ctx_resched+0x1c0/0x2b8
     perf_event_exec+0x29c/0x6b8
     begin_new_exec+0x378/0x558
     load_elf_binary+0x2b0/0xb00
     bprm_execve+0x394/0x690
     do_execveat_common+0x2a0/0x300
     __arm64_sys_execve+0x50/0x70
     invoke_syscall+0x4c/0x110
     el0_svc_common+0xb8/0xf0
     do_el0_svc+0x28/0x40
     el0_svc+0x4c/0xe8
     el0t_64_sync_handler+0x84/0x108
     el0t_64_sync+0x198/0x1a0

===============================================

And the second one is when reloading the modules:

  $ sudo rmmod coresight_stm coresight_funnel stm_core 
coresight_replicator coresight_tpiu coresight_etm4x coresight_tmc 
coresight_cti coresight_cpu_debug coresight_trbe coresight
  $ sudo modprobe coresight;  sudo modprobe coresight_stm ; sudo 
modprobe coresight_funnel; sudo modprobe stm_core; sudo modprobe 
coresight_replicator; sudo modprobe coresight_cpu_debug; sudo modprobe 
coresight_tpiu; sudo modprobe coresight_etm4x; sudo modprobe 
coresight_tmc; sudo modprobe coresight_trbe ; sudo modprobe coresight_cti ;

  Unable to handle kernel NULL pointer dereference at virtual address 
00000000000004f0
  pc : cti_cpu_pm_notify+0x74/0x160 [coresight_cti]
  lr : cti_cpu_pm_notify+0x54/0x160 [coresight_cti]
  Call trace:
   cti_cpu_pm_notify+0x74/0x160 [coresight_cti] (P)
   notifier_call_chain+0xb8/0x1b8
   raw_notifier_call_chain_robust+0x50/0xb0
   cpu_pm_enter+0x50/0x90
   psci_enter_idle_state+0x3c/0x80
   cpuidle_enter_state+0x158/0x340
   cpuidle_enter+0x44/0x68
   do_idle+0x1b0/0x2b8
   cpu_startup_entry+0x40/0x50
   secondary_start_kernel+0x120/0x150
   __secondary_switched+0xc0/0xc8



