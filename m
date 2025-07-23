Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C7F8C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Jul 2025 11:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eIaSs7Fhujj41mthw9JZxgIBsdS8g/yHvNODnq+JPvU=; b=ZgH5IZsPTa5UbB/WD02zb71bfI
	Ug5LOWj79+oPjQpv+9v0Wf6qYzN3s5zzJYh7wmZ6nvh02SVVlF+S9fpEpw4tmd3NprzA8hxe03pcH
	W4fhXi3Adh22FmyXzietSZ/6eYIA0y+fAvo7+GA7nWHVeF8mAWjL8rE+re1wfsEDqxBk4JO+AURK9
	MVM6UWbV4H+CILG4J2WYMBkPSks83J9E0gGZZfR8XBno8slyHNdXD1LZgve/hV9MzbyLgz45c6rIw
	/LdXScccuuL/iIoA64aGHfDyj01to64PnetEUFT0LUbVw745ykeFaeCKEEm1nMlgEyG3hI4Y11ui+
	nRAczJyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueXIp-00000004mAm-06o4;
	Wed, 23 Jul 2025 11:06:27 +0000
Received: from mail-pg1-f175.google.com ([209.85.215.175])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueXFJ-00000004ls6-11He
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Jul 2025 11:02:50 +0000
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-b34dde96cbfso390531a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Jul 2025 04:02:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753268568; x=1753873368;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eIaSs7Fhujj41mthw9JZxgIBsdS8g/yHvNODnq+JPvU=;
        b=UPjzhXm+pJ8HdfLA7MpF+RSNbK1IJxvjo/8r/0fEl8Gj2zm0YZQ3Edr/YNH6VAhi7G
         pqqHhIpfsvqd76FHZbjxaWutpyogTwNcIAdg6pUY2C5K6zYT4fW6XL7ut1z7Go3+R1SI
         k67+93LU+YK6cQCrzK762X53gHcdTY0peSXFpeSQ/5BnaoUMIh3zUnY07ch0CcoPsKKS
         UlF3KEGfeP55g1db7eBWGADVcHwJ6YnSQimZmtFHV2Ld47A6Ydn2tg3JJPBgmqBg8fyO
         GlX3ZJHPXPA3uS/nbO5JkDYJ5/zJLIC+bYicvbPwiJCf+tKJwnrVzPe80EI+dP3Kv0DD
         nEPA==
X-Forwarded-Encrypted: i=1; AJvYcCWS4PGRUPBAw1SxQS+QVcTZqy4uDqLrq0qjcqOKCi4+4Tb6dZZn7jLq7+5Clw96f+XazGx+T9F7KdUWNQ/17Vya@lists.infradead.org
X-Gm-Message-State: AOJu0Yxw/Vw3fYowTyqKFkVDj1Eosp+NVdVNbewfqvyguQ481Pg1C6G2
	FFrweXYUVp2C2IQOWTLiiMF2jQjcnAcOToEG6YffCKD1VuQZq40IYT5hiC2Qug==
X-Gm-Gg: ASbGncteTLQuOQU6q4ico9zkTgwhNPY+nOcaYVZmP0zPakfyVcFCqD36xLVSvqe+F9Z
	7XiRiggrbur9V9Jd+N8C4E0d9Wz9MitwSGGMOpqoxdEGc6kjZnohcNOnxlixbHlQ2L5zn9VIoH6
	C2ziOzHikxmibuTU3H4t2jHIX1k8kXrUYWCEFCaVoEelzGGWeLppMSEKVWLAmGlb0WY6bwevpRo
	xyfzi3Fv6ZtqUNvkF8aweTe3nbWW5fxdelyEgbN0P1q8/RvJz3FZFvVX3VC71Xuta7FSSc/t1CU
	jI6lKSzD1MyW5lugCQWyILGghQSmMBluO0CEN1RHVp+V8PCl/H8f/glTbUYTely66JXuiUZAlMf
	7dfNKi0bfBKT7
X-Google-Smtp-Source: AGHT+IG2WnYfXBAsSOophfSvE8ZsJU3rbkH3GWiFlG4n7LRfHTdG8XzpOYxVzgOnCs7BXHCIpO4Q4A==
X-Received: by 2002:a05:6a20:158f:b0:220:839d:1d61 with SMTP id adf61e73a8af0-23d49198aafmr1604510637.9.1753268567669;
        Wed, 23 Jul 2025 04:02:47 -0700 (PDT)
Received: from localhost ([218.152.98.97])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-75eb876df3csm3572462b3a.7.2025.07.23.04.02.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 04:02:47 -0700 (PDT)
From: Yunseong Kim <ysk@kzalloc.com>
To: Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>
Cc: Hemendra Dassanayake <Hemendra.Dassanayake@arm.com>,
	Austin Kim <austindh.kim@gmail.com>,
	Michelle Jin <shjy180909@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yunseong Kim <ysk@kzalloc.com>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	syzkaller@googlegroups.com
Subject: [PATCH] perf: arm_pmuv3: Fix kernel panic on UBSAN from negative hw.idx in armv8pmu_enable/disable_event()
Date: Wed, 23 Jul 2025 10:44:03 +0000
Message-ID: <20250723104359.364547-5-ysk@kzalloc.com>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_040249_285858_FAE38574 
X-CRM114-Status: GOOD (  11.77  )
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

When 'event->hw.idx' was negative in armv8pmu_enable/disable_event().

  UBSAN: shift-out-of-bounds in drivers/perf/arm_pmuv3.c:716:25
  shift exponent -1 is negative

  UBSAN: shift-out-of-bounds in drivers/perf/arm_pmuv3.c:658:13
  shift exponent -1 is negative

This occurred because a perf_event could reach armv8pmu event with a
negative idx, typically when a valid counter could not be allocated.

This issue was observed when running KVM on Radxa's Orion6 platform.

The issue was previously guarded indirectly by armv8pmu_event_is_chained(),
which internally warned and returned false for idx < 0. But since the
commit 29227d6ea157 ("arm64: perf: Clean up enable/disable calls"), this
check was removed.

To prevent undefined behavior, add an explicit guard to early return from
armv8pmu event if hw.idx < 0, similar to handling in other PMU drivers.
(e.g. intel_pmu_disable_event() on arch/x86/events/intel/core.c)

$ ./syz-execprog -executor=./syz-executor -repeat=0  -sandbox=none \
  -disable=binfmt_misc,cgroups,close_fds,devlink_pci,ieee802154,net_dev,net_reset,nic_vf,swap,sysctl,tun,usb,vhci,wifi \
  -procs=8 perf.syz

r0 = perf_event_open(&(0x7f0000000240)={
        0x0, 0x80, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0,
        0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0,
        0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0,
        0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0,
        0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0,
        @perf_config_ext
    }, 0x0, 0x0, 0xffffffffffffffff, 0x0)

perf_event_open(&(0x7f0000000280)={
        0x0, 0x80, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0,
        0x1, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0,
        0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0,
        0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0,
        0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0,
        @perf_config_ext
    }, 0x0, 0x0, r0, 0x0)

perf_event_open(&(0x7f0000000540)={
        0x3, 0x80, 0x0, 0x0, 0x0, 0x0, 0x0, 0x4, 0x0, 0x0,
        0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0,
        0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0,
        0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0,
        0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x4,
        @perf_bp={0x0, 0x2}, 0x20, 0x0, 0x0, 0x0, 0x2,
        0x0, 0x0, 0x0, 0x0, 0x0, 0x81
    }, 0x0, 0x0, r0, 0x0)

------------[ cut here ]------------
UBSAN: shift-out-of-bounds in drivers/perf/arm_pmuv3.c:716:25
shift exponent -1 is negative
CPU: 0 UID: 0 PID: 8405 Comm: syz.3.19 Tainted: G        W           6.16.0-rc2-g5982a539cdce #3 PREEMPT
Tainted: [W]=WARN
Hardware name: QEMU KVM Virtual Machine, BIOS 2025.02-8 05/13/2025
Call trace:
 show_stack+0x2c/0x3c (C)
 __dump_stack+0x30/0x40
 dump_stack_lvl+0xd8/0x12c
 dump_stack+0x1c/0x28
 ubsan_epilogue+0x14/0x48
 __ubsan_handle_shift_out_of_bounds+0x2b0/0x34c
 armv8pmu_enable_event+0x3c4/0x4b0
 armpmu_start+0xc4/0x118
 perf_event_unthrottle_group+0x3a8/0x50c
 perf_adjust_freq_unthr_events+0x2f4/0x578
 perf_adjust_freq_unthr_context+0x278/0x46c
 perf_event_task_tick+0x394/0x5b0
 sched_tick+0x314/0x6cc
 update_process_times+0x374/0x4b0
 tick_nohz_handler+0x334/0x480
 __hrtimer_run_queues+0x3ec/0xb78
 hrtimer_interrupt+0x2b8/0xb50
 arch_timer_handler_virt+0x74/0x88
 handle_percpu_devid_irq+0x174/0x308
 generic_handle_domain_irq+0xe0/0x140
 gic_handle_irq+0x6c/0x190
 call_on_irq_stack+0x24/0x30
 do_interrupt_handler+0xd4/0x138
 el1_interrupt+0x34/0x54
 el1h_64_irq_handler+0x18/0x24
 el1h_64_irq+0x6c/0x70
 generic_exec_single+0x2dc/0x304 (P)
 smp_call_function_single+0x308/0x530
 perf_install_in_context+0x4a0/0x798
 __arm64_sys_perf_event_open+0x184c/0x1d50
 invoke_syscall+0x98/0x2b8
 el0_svc_common+0x130/0x23c
 do_el0_svc+0x48/0x58
 el0_svc+0x58/0x17c
 el0t_64_sync_handler+0x78/0x108
 el0t_64_sync+0x198/0x19c
---[ end trace ]---
------------[ cut here ]------------
UBSAN: shift-out-of-bounds in drivers/perf/arm_pmuv3.c:658:13
shift exponent -1 is negative
CPU: 0 UID: 0 PID: 8006 Comm: syz.0.19 Not tainted 6.16.0-rc2-g5982a539cdce #3 PREEMPT
Hardware name: QEMU KVM Virtual Machine, BIOS 2025.02-8 05/13/2025
Call trace:
 show_stack+0x2c/0x3c (C)
 __dump_stack+0x30/0x40
 dump_stack_lvl+0xd8/0x12c
 dump_stack+0x1c/0x28
 ubsan_epilogue+0x14/0x48
 __ubsan_handle_shift_out_of_bounds+0x2b0/0x34c
 armv8pmu_disable_event+0x228/0x2f8
 armpmu_stop+0xa0/0x104
 perf_event_throttle_group+0x354/0x4cc
 __perf_event_account_interrupt+0x26c/0x290
 __perf_event_overflow+0xe8/0xd28
 perf_event_overflow+0x38/0x4c
 armv8pmu_handle_irq+0x244/0x320
 armpmu_dispatch_irq+0x6c/0x9c
 handle_percpu_devid_irq+0x174/0x308
 generic_handle_domain_irq+0xe0/0x140
 gic_handle_irq+0x6c/0x190
 call_on_irq_stack+0x24/0x30
 do_interrupt_handler+0xd4/0x138
 el1_interrupt+0x34/0x54
 el1h_64_irq_handler+0x18/0x24
 el1h_64_irq+0x6c/0x70
 generic_exec_single+0x2dc/0x304 (P)
 smp_call_function_single+0x308/0x530
 perf_install_in_context+0x4a0/0x798
 __arm64_sys_perf_event_open+0x184c/0x1d50
 invoke_syscall+0x98/0x2b8
 el0_svc_common+0x130/0x23c
 do_el0_svc+0x48/0x58
 el0_svc+0x58/0x17c
 el0t_64_sync_handler+0x78/0x108
 el0t_64_sync+0x198/0x19c
---[ end trace ]---
------------[ cut here ]------------
UBSAN: shift-out-of-bounds in drivers/perf/arm_pmuv3.c:730:26
shift exponent -1 is negative
CPU: 0 UID: 0 PID: 8006 Comm: syz.0.19 Not tainted 6.16.0-rc2-g5982a539cdce #3 PREEMPT
Hardware name: QEMU KVM Virtual Machine, BIOS 2025.02-8 05/13/2025
Call trace:
 show_stack+0x2c/0x3c (C)
 __dump_stack+0x30/0x40
 dump_stack_lvl+0xd8/0x12c
 dump_stack+0x1c/0x28
 ubsan_epilogue+0x14/0x48
 __ubsan_handle_shift_out_of_bounds+0x2b0/0x34c
 armv8pmu_disable_event+0x298/0x2f8
 armpmu_stop+0xa0/0x104
 perf_event_throttle_group+0x354/0x4cc
 __perf_event_account_interrupt+0x26c/0x290
 __perf_event_overflow+0xe8/0xd28
 perf_event_overflow+0x38/0x4c
 armv8pmu_handle_irq+0x244/0x320
 armpmu_dispatch_irq+0x6c/0x9c
 handle_percpu_devid_irq+0x174/0x308
 generic_handle_domain_irq+0xe0/0x140
 gic_handle_irq+0x6c/0x190
 call_on_irq_stack+0x24/0x30
 do_interrupt_handler+0xd4/0x138
 el1_interrupt+0x34/0x54
 el1h_64_irq_handler+0x18/0x24
 el1h_64_irq+0x6c/0x70
 generic_exec_single+0x2dc/0x304 (P)
 smp_call_function_single+0x308/0x530
 perf_install_in_context+0x4a0/0x798
 __arm64_sys_perf_event_open+0x184c/0x1d50
 invoke_syscall+0x98/0x2b8
 el0_svc_common+0x130/0x23c
 do_el0_svc+0x48/0x58
 el0_svc+0x58/0x17c
 el0t_64_sync_handler+0x78/0x108
 el0t_64_sync+0x198/0x19c
---[ end trace ]---

Fixes: 29227d6ea157 ("arm64: perf: Clean up enable/disable calls")
Signed-off-by: Yunseong Kim <ysk@kzalloc.com>
Tested-by: Yunseong Kim <ysk@kzalloc.com>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: syzkaller@googlegroups.com
---
 drivers/perf/arm_pmuv3.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/perf/arm_pmuv3.c b/drivers/perf/arm_pmuv3.c
index 3db9f4ed17e8..846d69643fd8 100644
--- a/drivers/perf/arm_pmuv3.c
+++ b/drivers/perf/arm_pmuv3.c
@@ -795,6 +795,9 @@ static void armv8pmu_enable_user_access(struct arm_pmu *cpu_pmu)
 
 static void armv8pmu_enable_event(struct perf_event *event)
 {
+	if (unlikely(event->hw.idx < 0))
+		return;
+
 	armv8pmu_write_event_type(event);
 	armv8pmu_enable_event_irq(event);
 	armv8pmu_enable_event_counter(event);
@@ -802,6 +805,9 @@ static void armv8pmu_enable_event(struct perf_event *event)
 
 static void armv8pmu_disable_event(struct perf_event *event)
 {
+	if (unlikely(event->hw.idx < 0))
+		return;
+
 	armv8pmu_disable_event_counter(event);
 	armv8pmu_disable_event_irq(event);
 }
-- 
2.50.0


