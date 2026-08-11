Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F988C5AC67
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 23:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4U5bn9fxWsfK1Zj0iZYwkOob+4cM7Ff/aHIVm3hMKJM=; b=CGkTw8qGrptUBBD2aoSAo/5Oe5
	2f0LZDtGc6LXQ/PfElKsKdKd5wxiAERrsBVe62Uv7f2zb1b9JR3TcuUC+6xuH4LdgfJpZHFYdCx6x
	hRcpKf9b8E3EVZwl/g2033t7VYpBgDYNeW4cQHVfKWu0pyptPhhmd/n8tekjH1Xcw7c3pcTeB5IX7
	o0xjiGWPdaIKjHmfKL3tjXVfXcFi7QHreg4M2Fz9FG3FYqeV5GzQq+ZHPbTkjvaFfmocV7puFBlxu
	IlwkHO0OdpcD1ySwLQIgYvZvxuFYfjNU+VGuNvdEGD4YYGXPyrRmVjp3Et2Qi8GSbMYxpszbgykUq
	4iVXYVXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtwFe-0000000F6gs-0vfO;
	Tue, 11 Aug 2026 23:51:22 +0000
Received: from mail-pj1-x1047.google.com ([2607:f8b0:4864:20::1047])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtwFb-0000000F6fu-2PIH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 23:51:20 +0000
Received: by mail-pj1-x1047.google.com with SMTP id 98e67ed59e1d1-38dd87656d3so514701a91.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Aug 2026 16:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786492278; x=1787097078; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4U5bn9fxWsfK1Zj0iZYwkOob+4cM7Ff/aHIVm3hMKJM=;
        b=Nx9RdrIU/UJQvviooKhj95JS7nl08miUq6wU4QRqPDTaAbHy3AWjeljRhjX5rlcAOC
         VBYP9n8nejgjijy6ik2+x5ge87TvcWue6ZTKU5tIJgWuHchDjG3t7fxxgZE+Kd1RePnQ
         87sihtmlrpAaKNR02pWYmbCECBqhukHkbI9cySjo9+msn4cp8PQxiCtGH7tUc81kQiEe
         iXS+0AHk3T+XK2xq3KzETyyQKJ3O26DxJLJxS5NCQNE8IR+0c8Fyq+fBkgPHmUbak9Ti
         zoqgttCOpPuKctsEh1O16WV1sKoR0zsL3kAvUhscXDg8HV117+S5V0FwC8NUtjePD8P7
         V7vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786492278; x=1787097078;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4U5bn9fxWsfK1Zj0iZYwkOob+4cM7Ff/aHIVm3hMKJM=;
        b=Bi5VKKOG5yecS+Wry4cwAoyaywitmjvbVVDx1UfwwiSoaDwdL28Uh104RV43LqvRrv
         xLjWUitm0pfSMZGq0c/6f8ow0tw4ns+bIPkTXnWVV5rA7dwivPVfy1DTXAgnNaOxMSx5
         PMul3Acu9+K97AGRq+zPsaVzcg/YWCp9iMsYO81Lo4Nu2jddQxIxLGZvDX4J/bbxWV8n
         fFKP9IJUW8XleFhIwta3YrJF9mO95a2V5ILYxXI0h+wTx4kgSckKAUvdK8vL0/Zg+u3f
         kd5wq/OoTkXtTyBJuxhxUu+xPgFt6G4O4mOtpYSNFH8Ciwxxq8RQ9DjczyC6CxE6rwO5
         YytQ==
X-Gm-Message-State: AOJu0YztCTUtdlwrKP5CbTpxjK/5krNUJc4tUSCUp628rW76bskP19l6
	J22sMg/E/vnYbC3qn3UH1iqq+Y8+S+xQYGoUShavnRxi5bkO12wsoP51MpSojDdP8P3ofS7dNW5
	ovvpDMKJuoQ==
X-Received: from dlbsi7.prod.google.com ([2002:a05:7022:b887:b0:13f:a0ee:666f])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3b81:b0:38d:dfd1:7a8
 with SMTP id 98e67ed59e1d1-39301285deamr718924a91.2.1786492277667; Tue, 11
 Aug 2026 16:51:17 -0700 (PDT)
Date: Tue, 11 Aug 2026 16:51:10 -0700
In-Reply-To: <20260811083828.2057695-1-irogers@google.com>
Mime-Version: 1.0
References: <20260811083828.2057695-1-irogers@google.com>
X-Mailer: git-send-email 2.55.0.679.g6767b8d81c-goog
Message-ID: <20260811235112.2267241-1-irogers@google.com>
Subject: [PATCH v2 0/2] perf: Add Raspberry Pi AXI PMU driver
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, linux-perf-users@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	mark.rutland@arm.com, will@kernel.org, 
	"=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?=" <u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_165119_636302_F12F1A80 
X-CRM114-Status: GOOD (  14.68  )
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

4. SoC Generation Support:
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

Changes in v2
-------------
- Match Data Initialization: In rpi_axi_pmu__init(), set pmu->chip via
  of_device_get_match_data(dev) to ensure BCM2712 match data is correctly parsed.
- Sysfs Event Visibility Filtering: Updated rpi_axi_pmu_events_is_visible() to
  properly filter all 7 BCM2712 master filtered event aliases (arm_, pcie0_,
  hvs_filtered, emmc0_) on BCM2835-BCM2711 systems, and hide legacy RPi 1-4
  aliases on BCM2712 systems.
- Unmapped Monitor Check: Added monitor base_address and initialization check to
  config_is_valid(). Events targeting uninitialized or unmapped monitors (e.g. missing
  memory resource or monitor=1 on BCM2712) are properly rejected with -EINVAL.
- CPU Affinity Enforcement: Restrict uncore events in event_init() to event->cpu == pmu->cpu
  to prevent orphaned uncore events when a non-PMU CPU goes offline.
- 31-bit Counter Wrap Delta: Mask counter accumulation with delta = (new_count - prev_count) & 0x7FFFFFFF
  in read(), timer_handler(), and vpu_work_handler() to prevent 2B+ event spikes on counter overflow.
- Stopped Event Guard: Return early in rpi_axi_pmu_read() if event->hw.state & PERF_HES_STOPPED.
- Lockless Race Fix: Pass bus and filter explicitly to rpi_axi_pmu_enable_bus_watcher()
  under spinlock to prevent lockless read races in vpu_work_handler().
- Slot Reuse Clean: Set enabled[idx] = false in rpi_axi_pmu_del() when refcount[idx] == 0 so
  re-allocated watcher slots properly enable hardware watchers.
- Events Array Bounds: Return -ENOSPC in rpi_axi_pmu_add() if pmu->events array is full.
- Timer Cancel Race Fix: Re-acquire pmu->lock after hrtimer_cancel() in rpi_axi_pmu_del()
  and re-verify active_events > 0 before returning.
- Hotplug Timer Migration: Cancel and re-pin pmu->hrtimer to target CPU in rpi_axi_pmu_offline_cpu().
- Registration Order: Call perf_pmu_register() before cpuhp_state_add_instance() in probe,
  and cancel hrtimer before cancel_work_sync() and unregister in exit teardown.
- Header & Style Cleanups: Removed <linux/mod_devicetable.h> and <linux/version.h>,
  updated rpi_axi_pmu_match[] terminator to { }, and fixed C variable declaration style.

Ian Rogers (2):
  perf: Add Raspberry Pi BCM2835 AXI PMU driver
  perf: Add Raspberry Pi 5 (BCM2712) AXI PMU support

 drivers/perf/Kconfig       |   10 +
 drivers/perf/Makefile      |    1 +
 drivers/perf/rpi_axi_pmu.c | 2001 ++++++++++++++++++++++++++++++++++++
 3 files changed, 2012 insertions(+)
 create mode 100644 drivers/perf/rpi_axi_pmu.c

-- 
2.55.0.679.g6767b8d81c-goog


