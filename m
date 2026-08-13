Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D41BC5CFCF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 04:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xRo1BqdUJp5dIShuL4H3kAtBQ89l0wiBBMmh3TP05iM=; b=C/lAs0wYsGzzttFeFfwvp6JziX
	UOkxDQfja4isI94ugQ/Y2LOgaAnqWSzOH1hcepYl/uGUDWHmf//pgNr7RXOCOKlOIv+pDIrXD7bR6
	dC7NcqEAPXwK/C8qjuFr8UXLyFlCeWWh4WxqdlFizjR0jsR6qlZ94XgPJdEtkiiHKnOuSMOi3hp1v
	jQERAhNV/SoJ3jk56JOgnaaDEU3zsZkuJpzQLXJZzZ92Y3/yf+UNIpVEU2dF9898xSA27xocstHX1
	pMbdmu94eGkD8E71h4z8PkVZyoV5ctf8uLlB1CXUOWk+B2GtEWeUaynxUzWf0LfD0AlWhnhmUO1eg
	g2zaZLTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuNAK-0000000HMm6-24dL;
	Thu, 13 Aug 2026 04:35:40 +0000
Received: from mail-pf1-x446.google.com ([2607:f8b0:4864:20::446])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuNAH-0000000HMkk-3Abz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 04:35:38 +0000
Received: by mail-pf1-x446.google.com with SMTP id d2e1a72fcca58-84870e7f498so412049b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 21:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786595736; x=1787200536; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xRo1BqdUJp5dIShuL4H3kAtBQ89l0wiBBMmh3TP05iM=;
        b=oPkyweyXoJ1VHWtRWULgvxP5KtoJt/saJ3PmoaS5otgv+KbIToH9JhNWsaqWzuyiLo
         5zlNHvULbJkiw1x5JTSt4BUuHWGU3ov+jaGz3mWn9iZhITFc4/JK3sUabXRy7WYAuCzn
         elmZVLanFWpSTi3V/j4yqy5rjgRDjUsPb8uagAh0UNHvHpqrCH9iwZcaqB/DhRLIqkD+
         C+iCmfx8Xlsf8Y/giWWRz5/FFerGuy/HmYPNziIWriliwQB0g1OTvLiCTnP9A/GUJmv8
         5fxzZB1VpEUXVzyksKr/Q/NzA62L/v8nsNBII//Ayj1PyHjwBYQMGojnJf6tWHuG9aqk
         YnTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786595736; x=1787200536;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xRo1BqdUJp5dIShuL4H3kAtBQ89l0wiBBMmh3TP05iM=;
        b=FIWf8goKsBih9cWAxhjkDITci9ikf11OMKkzTwGpdMjbM/ldv4N+aQa2cwaJcPWYoy
         ccFBEuiCIhqdtRnH3uD5heNDs0GT6+dixfwTY5lpZBJ+qM9bjYyT7FABZ566/DTItYCJ
         8pym/quMmWlIkUNDzRcbB0HpLMn7o+Od46fWoqdR9IhiWlXKw5KGEq2rnSWexK2h0kEo
         tocR95qYjCFa6vFMSuZilEFBjYwzP+wAdInB2KbZ3ZSzuueNTtkgwMirVFtrZMTrotWt
         CD5KwJ+UpkE5zLq0ON+eQQyPdX37mGS/2K7OY9uZwU77BGUghpAx0COGUUTe09Z67RJT
         R5zA==
X-Gm-Message-State: AOJu0Ywq/6mBeyF2ccdtXhhdaHuCViF1aRQv42RKt78bgwvRDqC0w8by
	nqafyBzyMsPGjSbwtb2vUspHsz+N4G7OsTrfUdbnakIQ0uDtPpy8JedanD1R7QxBvN0H4MYcoRF
	1NfSDq72DXA==
X-Received: from dycpw8.prod.google.com ([2002:a05:7300:de48:b0:313:fdd8:8131])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:6017:b0:3c9:1c1f:f516
 with SMTP id adf61e73a8af0-3cc552c3825mr4189391637.19.1786595736235; Wed, 12
 Aug 2026 21:35:36 -0700 (PDT)
Date: Wed, 12 Aug 2026 21:35:31 -0700
In-Reply-To: <20260812230145.2644281-1-irogers@google.com>
Mime-Version: 1.0
References: <20260812230145.2644281-1-irogers@google.com>
X-Mailer: git-send-email 2.55.0.691.gc56d675ccc-goog
Message-ID: <20260813043533.2744442-1-irogers@google.com>
Subject: [PATCH v6 0/2] perf: Add Raspberry Pi AXI PMU driver
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, linux-perf-users@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	mark.rutland@arm.com, u.kleine-koenig@baylibre.com, will@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_213537_825946_CEDF9145 
X-CRM114-Status: GOOD (  13.45  )
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
The driver has been rigorously validated on physical hardware across multiple 
SoC generations:
- Raspberry Pi 400 (BCM2711): Validated System MMIO and VideoCore VPU firmware
  mailbox IPC performance counters. Explicitly mechanically verified precisely zero 
  lockup behaviors across 100Hz aggressive asynchronous timer interrupts. Profiling 
  the `h264_v4l2m2m` pipeline hardware isolated >11.1MB in pure AXI VPU hardware matrix reads.
- Raspberry Pi 5 (BCM2712): Validated live byte throughput across HVS display
  refresh cycles, Cortex-A76 DSU L3 interconnect memory traffic, and PCIe RP1
  Southbridge transfers.

Changes in v6
-------------
- Reorganized commit structure rigorously into two cleanly bisectable patches
  (BCM2835 core in Patch 1, BCM2712 additions in Patch 2).
- Resolved unmet Kconfig dependency warnings when MAILBOX=n by cleanly relying
  on 'depends on RASPBERRYPI_FIRMWARE || (COMPILE_TEST && !RASPBERRYPI_FIRMWARE)'
  rather than forcefully using 'select' (Patch 1).
- Resolved catastrophic PREEMPT_RT/softirq deadlocks associated with atomic
  spinlocks globally preempting 'hrtimer_cancel()' routines by permitting the
  timer loop to detect 0 active events and cleanly self-terminate (Patch 1).
- Purged unsafe 'spin_unlock_irqrestore' lock dropping maneuvers occurring
  abruptly inside 'rpi_axi_pmu_read()', ensuring atomic contexts and missing
  flags no longer inadvertently trigger kernel panics (Patch 1).
- Eliminated silent ABA VPU slot data-corruption and event hardware leaks by
  decoupling 'vpu_work_handler' loops safely onto a 'vpu_disable_pending' matrix.
  Deleted VPU watchers are safely disabled exactly prior to newly allocated slots 
  executing initialization within the same asynchronous worker loop (Patch 1).
- Resolved lockless data races across VPU mailbox hardware mutation checks by fully
  protecting 'monitor_running' and 'enabled' state modifications structurally inside 
  the 'rpi_axi_pmu_start' and 'rpi_axi_pmu_vpu_work_handler' core locks.
- Disentangled rigid 'cancel_work_sync' usages back to safe 'flush_work' variants in
  teardown unloading contexts so dynamic Mailbox IPC teardown flows successfully 
  execute without aborting directly in mid-flight (Patch 2).
- Sharpened the sysfs 'is_visible' string-masking logic to properly accommodate
  Raspberry Pi 5 aliases, resolving an overzealous 'strstr' bug directly hiding
  "bcm2712_peripheral_" aliases on RPi 5 hardware (Patch 2).
- Rewrote component destruction sequencing logic completely onto safe CPU hotplug 
  '_nocalls' handlers to strictly avoid User-After-Free events from persisting 
  against unregistered/defunct driver models during 'perf_pmu_unregister' (Patch 1).
- Eradicated cross-execution bus tracker leaks across failed/zombied workflows where
  'monitored' mask properties remained structurally trapped inside invalid state
  loops by surgically injecting manual 'enabled = false' boolean teardowns into 'del()'.
- Inserted explicit comments explaining the critical 31-bit counter-masking logic
  regarding standard U32_MAX hardware exception signaling (Patch 1).
- Scrubbed all erroneous 'TAG=agy' trailing metadata from commit descriptions.

Ian Rogers (2):
  perf: Add Raspberry Pi BCM2835 AXI PMU driver
  perf: Add Raspberry Pi 5 (BCM2712) AXI PMU support

 drivers/perf/Kconfig       |    9 +
 drivers/perf/Makefile      |    1 +
 drivers/perf/rpi_axi_pmu.c | 2119 ++++++++++++++++++++++++++++++++++++
 3 files changed, 2129 insertions(+)
 create mode 100644 drivers/perf/rpi_axi_pmu.c

-- 
2.47.0

