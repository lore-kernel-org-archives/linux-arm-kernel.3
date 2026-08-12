Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7A9DC5CFDB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 23:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tlmwDWahDCpqVEzTLP2aJg+dpiOPXi64VDUj/j5mYu8=; b=paYVOyuOhP2yzF6p3NqOuiOT7R
	KUoT3jxts+bnvN9Z77b1a502ecY/FV99LANtLJwftzQQbmxvaUSUWYOpwhvPmw98BL7k2adh1GltA
	s/jk622r6UiAi+94gQxFNik0ccDeh3ZYB+p6NOJwgsP7IfS2zE4Yz6ek/vD8j5yJglphnC5ze4NGs
	mg2LfqBv9lE0aH/+fAvlCUtcU7z535K/qIqxMfUqg3nkGA+6pNbgWZNOiLc9jWmmguds6kYbZKwww
	1vQ36HKMHv/Jb7yK8QeEsUEA1Q9R0ASmXi9dOGRAKl7Izxvk8//U2Mt+2df7gcCg0rYd/UdV8SNGS
	ynzasuew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuI3N-0000000H7ZJ-2YMU;
	Wed, 12 Aug 2026 23:08:09 +0000
Received: from mail-pj1-x1048.google.com ([2607:f8b0:4864:20::1048])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuI3L-0000000H7YB-0pzA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 23:08:08 +0000
Received: by mail-pj1-x1048.google.com with SMTP id 98e67ed59e1d1-38ecc48b3c2so258638a91.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 16:08:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786576086; x=1787180886; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tlmwDWahDCpqVEzTLP2aJg+dpiOPXi64VDUj/j5mYu8=;
        b=LXzNYQ/jCtaEVWSHIeSZPVURdpy8pbet7FppW3TmuN5luyQRs1rLX0E5N+RYyIBCjR
         bt6le9AUaA9+ZIEC04tSGQYZRALx/OIPOslHfg7aR90Bndjf1P96abna4zxDjgo0ZG6v
         wRkeGjzky7Hwo74gX+XoUvTHeJHwE76ydrmzykCR8OGfC09iwhRUJHF0zNQ7hBYnn+Yz
         OH4Nf4nWhdGZ9DGT4Ax5XnSiD5xsCqUGuEJJX6kidWPzW/NHyCEhUJMSSs7hA//p0cg6
         MtQGrwQVVEnirvp80MvHxqCFUNfIRjvHRhXvfdeDstotXRCO0cHK3hatjyn7l9ZfPz1a
         etdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786576086; x=1787180886;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tlmwDWahDCpqVEzTLP2aJg+dpiOPXi64VDUj/j5mYu8=;
        b=BeinYKJ+hv+SqcV4ZYIn+XSwoKxxYmjgPsusPOZPStA15FWQAxIT9PpJHvreZ4PILB
         qT7ocagqGYuSh0ETsKH6+yix8fQPQ792PB7hGsewvQbPA3FhnyOL1yHR5G8GPHVTj+JZ
         SIpI3gWmNZY4i8EshQH2tBbQ2BMoV5D9aLsiIShwHp45/el5rU8Wt6OkVZTwW6C+nqVz
         OtpGdhoQjlD2g+/PK4C+Q3NkKGMWozXQdDdjtAYwrKUN/2qNqUy5nB8GKhcAGBnP0r1N
         oNsU3FNsD/LVxBc+lCu10pqgiv/XKnWGq3qT5jWapzXHFd7AV76+DGVU0QYbySMkPCQn
         4bWg==
X-Gm-Message-State: AOJu0YwFxd03bTeFAptm9VTOsu81Zky9W+obAVbWACQkqdJPrBnFaP/z
	D8kIxYXE+xL80KEwVDZQRkdUe73tOA6q3qAFGEmIeHOXDwvw6wE7WRJZZTa7h6QyafoY+m4+ZYg
	2rrVsHRxWYg==
X-Received: from dlbvg26.prod.google.com ([2002:a05:7022:7f1a:b0:13c:dac9:90ed])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2644:b0:38f:1dc:672f
 with SMTP id 98e67ed59e1d1-3931e29843cmr1958999a91.18.1786576085578; Wed, 12
 Aug 2026 16:08:05 -0700 (PDT)
Date: Wed, 12 Aug 2026 16:07:58 -0700
In-Reply-To: <20260812230145.2644281-1-irogers@google.com>
Mime-Version: 1.0
References: <20260812230145.2644281-1-irogers@google.com>
X-Mailer: git-send-email 2.55.0.691.gc56d675ccc-goog
Message-ID: <20260812230800.2646749-1-irogers@google.com>
Subject: [PATCH v5 0/2] perf: Add Raspberry Pi AXI PMU driver
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, linux-perf-users@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	mark.rutland@arm.com, u.kleine-koenig@baylibre.com, will@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_160807_237525_B916A9F4 
X-CRM114-Status: GOOD (  16.95  )
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

This patch series adds an uncore Performance Monitoring Unit (PMU) driver
for Broadcom AXI system and VideoCore VPU performance monitors found on
Raspberry Pi SoCs (BCM2835 through BCM2712 / Raspberry Pi 1 through 5).

Motivation & Background
------------------------
Currently, Linux lacks a standard perf-API compatible driver for the
Broadcom AXI performance counter blocks on Raspberry Pi platforms. Prior
out-of-tree vendor solutions relied on custom debugfs nodes and ad-hoc
kthreads, preventing integration with standard Linux perf tooling (`perf stat`,
`perf list`, etc.).

This driver implements standard `struct pmu` hardware uncore callbacks
under `drivers/perf/`, exposing human-readable sysfs event aliases, unit
scaling (`Bytes`), and bus filtering directly to user space.

Key Architectural Improvements & Features
------------------------------------------
1. Standard Linux Perf Integration:
   - Exposes uncore AXI interconnect events via `/sys/bus/event_source/devices/rpi_axi_pmu/`.
   - Supports event sampling and hardware counter accumulation (`local64_add`),
     automatically managing 31-bit hardware counter wraparound across high-bandwidth
     interconnect transfers.

2. CPU Hotplug Support (`cpuhp`):
   - Registers dynamic CPU hotplug notifiers (`CPUHP_AP_ONLINE_DYN`).
   - Automatically migrates PMU context (`perf_pmu_migrate_context`) to an online
     CPU core when a designated CPU goes offline, avoiding stale uncore state.

3. Hybrid Memory-Mapped & Mailbox Work Queue Architecture:
   - System Monitor (MMIO): Performs fast atomic-safe memory reads (~15ns)
     directly mapped over ARM physical memory space (`MON__SYSTEM`).
   - VPU Monitor (Mailbox IPC): For Broadcom BCM2835-BCM2711 platforms (RPi 1-4),
     VideoCore VPU monitor IPC calls are offloaded to process context via a dedicated
     workqueue (`vpu_work`) and serialized under `vpu_mutex`. This avoids atomic
     sleeps or blocking in timer/interrupt context.

4. PREEMPT_RT & Safety Hardening:
   - Uses HRTIMER_MODE_REL_SOFT for timer callbacks to execute in softirq context,
     ensuring spinlock acquisitions are 100% PREEMPT_RT safe.
   - Sets suppress_bind_attrs = true to prevent unsafe manual sysfs unbinding while
     active perf events exist.

5. SoC Generation Support:
   - Patch 1 adds core driver support for Broadcom BCM2835-BCM2711 (RPi 1-4).
   - Patch 2 expands support for Broadcom BCM2712 (Raspberry Pi 5), adding PCIe RP1
     Southbridge links, HEVC decoder, HVS display engine, and Cortex-A76 DSU L3
     interconnect monitoring.

Hardware Validation
-------------------
The driver has been validated on real hardware across multiple SoC generations:
- Raspberry Pi 400 (BCM2711): Validated System L2, ARM CPU, and VideoCore VPU
  firmware mailbox IPC performance counters.
- Raspberry Pi 5 (BCM2712): Validated live byte throughput across HVS display
  refresh cycles, Cortex-A76 DSU L3 interconnect memory traffic, and PCIe RP1
  Southbridge transfers.

Changes in v5
-------------
- Teardown UAF/Orphaning Fix: Reversed module exit logic, calling cpuhp_state_remove_instance()
  *before* perf_pmu_unregister() to prevent accessing an unregistered PMU in the offline
  CPU handler during device removal, and to prevent event orphaning races during hotplug.
- VPU Hardware Watcher Leak Fix: In rpi_axi_pmu_del(), hardware disablement operations for VPU 
  bus watchers are now properly deferred to the vpu_work workqueue to avoid silently leaking 
  running hardware counters when the VPU monitor is no longer in use.
- Grouped Event Start Bug Fix: Deprecated reliance on num_monitored == 1 to initialize
  the global bus watcher. Instead, use a dedicated monitor_running flag correctly to
  start the global monitor when the first bus watcher gets enabled, mitigating bugs when
  adding grouped PMU events.
- IPC Phantom Spikes Zero Fallback Fix: Modified rpi_axi_pmu_read_counter() to return U32_MAX
  on IPC or MMIO hardware read failures, gracefully ignoring the delta calculation returning.
  This fixes unsigned 31-bit huge spikes where delta (0 - old_count) & 0x7FFFFFFF occurred.
- Code Comments: Added doc block comments inside rpi_axi_pmu_read(), rpi_axi_pmu_vpu_work_handler(),
  and everywhere U32_MAX returns occur to document the explicit justification for why U32_MAX indicates
  failure (valid counters are 31-bit) and why the driver drops the sample to avoid artificial spikes.
- VPU Data Race Lockdep Fix: Rewrote locking hierarchy inside vpu_work_handler(). PMU spinlock
  is now correctly held across rpi_axi_pmu_enable_bus_watcher() unconditionally since the function
  touches active monitor registers directly via MMIO, dropping it purely for mailbox IPC reads.
- Hrtimer Add/Del Forward Concurrency Warning Fix: rpi_axi_pmu_timer_handler() now executes
  hrtimer_forward_now() *before* releasing the PMU spinlock, fully mitigating timer enqueue races
  resulting from a simultaneous parallel pmu->add()/pmu->del().
- VPU Start Asynchronous Latency: Added explicit schedule_work(&pmu->vpu_work) call inside
  rpi_axi_pmu_start() when starting VPU-tracked events so they begin immediately instead of
  waiting for a 2-second timer interrupt period for short workloads.
- Event Stop Read-Modify-Write Spinlock Protection: Moved event->hw.state modifications inside
  rpi_axi_pmu_stop() under the local CPU PMU irqsave spinlock to safeguard atomic bitwise flags
  against the timer handler or workqueue updates.
- BCM2712 Pre-probe Initializer UAF race: Shifted perf_pmu_register() to the very end of
  rpi_axi_pmu__init() to ensure all hardware structures and CPU HP bindings securely exist prior to
  exposing the PMU to userspace tools preventing devres unregistration memory faults.
- BCM2712 ARM CPU L2 Event Correction: Corrected the bus index for the Cortex-A76 Cores PMU event
  aliases to bus=14 (BCM2712_SB__CPU_L2) to match architectural routing specifications on the RPi 5.
- BCM2712 JPEG Bus Monitor Visibility: Stopped improperly hiding the legacy JPEG bus aliases in the
  is_visible() callback on BCM2712 chips.
- BCM2712 Custom Event Replacements: Created specific BCM2712 equivalents for peripheral_rtrans/wtrans
  and cpu_uc_rtrans/wtrans since raw bus mappings shifted structurally on VideoCore VII.

Ian Rogers (2):
  perf: Add Raspberry Pi BCM2835 AXI PMU driver
  perf: Add Raspberry Pi 5 (BCM2712) AXI PMU support

 drivers/perf/Kconfig       |   10 +
 drivers/perf/Makefile      |    1 +
 drivers/perf/rpi_axi_pmu.c | 2124 ++++++++++++++++++++++++++++++++++++
 3 files changed, 2135 insertions(+)
 create mode 100644 drivers/perf/rpi_axi_pmu.c

-- 
2.55.0.691.gc56d675ccc-goog


