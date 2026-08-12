Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9127C5B567
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 05:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PXjQ3oOfjU5GoGzikE26HldLFyYdtMlQ+8nHvN8Ud2o=; b=2byhZ4RrMyd2lGtMZPiPAE1q86
	rxbmUnp6pnWcM0Lc6b9RDFK1OcHrjqaV5zUVUq6FtkzDusW9YSuoR7KkFCeswhUP9bhcOVl0pMwBu
	Adir8jRg3oLkqH5NnNpt1PZnr/A4wNwr+I3sQSxfGcpE3nEw/4YXVsoW2QWQU+FIQdIw5CRGgfn3r
	UstRmhJDOqdn8yP2igR9VDPR7cOSAQ0iQgjjpLZJHYWFdGBR1IHXBAQKQZst8NvPj0jysYcSws/sR
	ECRoGwJLrgpSjBdJMdGF0gGcRzeCnM7Es0h3prds01FN+aNWOBQoGHHwaGxpHpUs8AmouUiwFz062
	RkzJevsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu1Rx-0000000FQsh-1rh0;
	Wed, 12 Aug 2026 05:24:25 +0000
Received: from mail-pj1-x1046.google.com ([2607:f8b0:4864:20::1046])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu1Rv-0000000FQrT-2Dnt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 05:24:24 +0000
Received: by mail-pj1-x1046.google.com with SMTP id 98e67ed59e1d1-381250979d5so742942a91.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Aug 2026 22:24:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786512261; x=1787117061; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PXjQ3oOfjU5GoGzikE26HldLFyYdtMlQ+8nHvN8Ud2o=;
        b=oeQYcQz6mgOzQpw4fF9F4qtvPITnSSwU3VqsTFRyMaSg7ja7PI4Y4KF9Bz2FSrmJf3
         iH6Jfn7SlndK1MQ1r6/ug7KFH5ZLK6Z3PU/jiGHSdgo2piilZHTuKWduhTx6IRpOS6ok
         xzUIIIJqqzkhwz5k3OAIWBj3le2A2vbdTobMvHF3qk0yIa24IEfPI1fEEjzzNc0Hezub
         1NJ+eHK0EbK4WXb02rEZsQY8lNAMHmiwHje7CBJC72n/qUb3VRFL3FKQhl/dwztly1RI
         K9B9imw0tSyFpPRUAt3q1yJaS7mgOmKgp0m3ufBf3x+5hXXa/232OmF0DwW3rlbBMBoT
         FpTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786512261; x=1787117061;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PXjQ3oOfjU5GoGzikE26HldLFyYdtMlQ+8nHvN8Ud2o=;
        b=IeAkRznQIEqxv0XdrFWr4YAP3F2RzoP2Ad61IKmlnfV+WLKmNnHu68Tb5OYqRDxhm8
         Z2mohVbTE5Agac80EeUx0vHNwopqcCtR9eyK6zJvu6o5ClutSXOc7OAxWLfqKSFYOxx7
         bMNIDvDkEnssm8yDRIHWd8rhIxmhCBt+PxI7LG/lpfLwFcLLQdk68TYnff/6sUh1QHRR
         dHnMUBWy99Th7jHAq27ZNtNGr9Jfl4NGRa6LSHRTsRjDk0NV/ZgNZUp0sTyTbDdQdPN6
         PFqmpJgG34rX3d3qyehO2LDfswzaUjOWDclHII7BWSPuAA99PnU56zlfgoDKqP6ucbkU
         tJOg==
X-Gm-Message-State: AOJu0YyMF2iMpK4tPiUXo2rj6tiFtdlUv5sy5FBqhbmDKtL/XKw1q0+1
	JjR6kwWDF2BnWAQTdFSU1mgGHfOloJLqVrw3CenjCUUjYvjo3Dth8vjOASY+fXJ+8bIKu0lTb4q
	2IQMEnNV9EA==
X-Received: from dlbro11.prod.google.com ([2002:a05:7022:158b:b0:140:ef7c:eac])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1b0d:b0:381:1f51:1ff0
 with SMTP id 98e67ed59e1d1-3930123c6ecmr2410896a91.2.1786512260580; Tue, 11
 Aug 2026 22:24:20 -0700 (PDT)
Date: Tue, 11 Aug 2026 22:24:15 -0700
In-Reply-To: <20260812002728.2283079-1-irogers@google.com>
Mime-Version: 1.0
References: <20260812002728.2283079-1-irogers@google.com>
X-Mailer: git-send-email 2.55.0.679.g6767b8d81c-goog
Message-ID: <20260812052417.2361040-1-irogers@google.com>
Subject: [PATCH v4 0/2] perf: Add Raspberry Pi AXI PMU driver
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, linux-perf-users@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	mark.rutland@arm.com, u.kleine-koenig@baylibre.com, will@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_222423_584970_5A31C2DF 
X-CRM114-Status: GOOD (  12.67  )
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

Changes in v4
-------------
- Global Monitor Reset Protection: In rpi_axi_pmu_enable_bus_watcher(), only issue
  global monitor resets (GEN_CTL_RESET_BIT) when num_monitored == 1. For subsequent
  watchers, reset only the individual bus watcher, keeping running watchers intact.
- IPC Failure Handling: In rpi_axi_pmu_read_counter(), return 0 on rpi_firmware_property()
  failure instead of uninitialized -1, preventing 0xFFFFFFFF phantom counter spikes.
- Lockdep & MMIO Safety: In rpi_axi_pmu_vpu_work_handler(), only unlock spinlock during
  counter reads if use_mailbox_interface is true, keeping MMIO reads lock-protected.
- Hardirq IPI Deadlock Fix: In rpi_axi_pmu_del(), use hrtimer_try_to_cancel() when in_hardirq()
  to avoid infinite spinning if an SMP cross-CPU IPI interrupts a running softirq timer callback.
- Timer Handler Early Return: In rpi_axi_pmu_timer_handler(), return HRTIMER_NORESTART early
  if active_events == 0.
- CPU Hotplug Preemption Race Fix: Initialize pmu->cpu = cpumask_first(cpu_online_mask) in
  rpi_axi_pmu__init() to guarantee assignment to a valid online CPU core.
- Type-Safe Driver Data Extraction: In rpi_axi_pmu_events_is_visible() and cpumask_show(),
  retrieve struct pmu * from dev_get_drvdata(dev) and convert via pmu_to_rpi_axi_pmu().
- Backward Compatibility: Added LINUX_VERSION_CODE check for hrtimer_setup fallback wrapper,
  allowing out-of-tree builds to compile cleanly on Linux 6.12 LTS kernels.

Ian Rogers (2):
  perf: Add Raspberry Pi BCM2835 AXI PMU driver
  perf: Add Raspberry Pi 5 (BCM2712) AXI PMU support

 drivers/perf/Kconfig       |   10 +
 drivers/perf/Makefile      |    1 +
 drivers/perf/rpi_axi_pmu.c | 2049 ++++++++++++++++++++++++++++++++++++
 3 files changed, 2060 insertions(+)
 create mode 100644 drivers/perf/rpi_axi_pmu.c

-- 
2.55.0.679.g6767b8d81c-goog


