Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5C56C5CFC1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 00:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mN+xGdtQ4SY4k8K/VufISRawtQX2DXw8ATcE7ukH54U=; b=Q6OpynT+eLF+cvk5HtKGgV4f+J
	9NlAK5ruiKYYRtYC0omQn6et/k8bAdg+h+oundGLTBbtiSr9Lf/fTw4S2AZuYj1jquocrTaiK7GrI
	I6MlrKVihekKR9SExnejNCeFbie70gLLZ8GeX9UZnrOKDnn7N7o31k6A7A1XsWXeSf84EPEJET+1l
	smbXcv3Zm+z6sVcMXgN/Nqnfhb6sxDB8s7rlimNTeTpj56DUdKC1K+c/4TaFFvm6ReYlKBH03IAqm
	ek9tovJpz22pY1pRwKmfzHXm/UbAXIj96ZwTwehXheAXVPpn/3224Jb6Sd5Vc3747aZlGdrkc220d
	cdFGPMtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtwor-0000000F96T-3Zgm;
	Wed, 12 Aug 2026 00:27:45 +0000
Received: from mail-pg1-x545.google.com ([2607:f8b0:4864:20::545])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtwoj-0000000F93p-3fEy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 00:27:39 +0000
Received: by mail-pg1-x545.google.com with SMTP id 41be03b00d2f7-cb5cc1e13f8so355801a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Aug 2026 17:27:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786494454; x=1787099254; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mN+xGdtQ4SY4k8K/VufISRawtQX2DXw8ATcE7ukH54U=;
        b=lcBAWwK/lBcV8xVUggIoInvAQdY6AGxB9zTBWeXXjg+s/sLm/3G72IKoDuGz3VXund
         tizRHh4qc8156TSFkhPAJp8cRd2Crqdo/Ith508mjgZyCQJiILHwDY9+jWRuh2LN2+6N
         DOTnNG6S+bfHQ2L5OOuzAY5Ae5ifhhA5jMsamtxDynzk0T4cqLeh4dKI/K/KEvjiCXxt
         v60R7fng/tUB6upuo4mfSOMe5V0pjpCh3nR38iJhZQlmJ8j0YABZASK39B1YVtC/dWYe
         i0V87+KDXkPY4jQXCwq/DyybUBgyqwJ0dyZHSVqu5N57q3vUHYPRjX35SxJbMMGtyPN2
         i6yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786494454; x=1787099254;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mN+xGdtQ4SY4k8K/VufISRawtQX2DXw8ATcE7ukH54U=;
        b=F10ljpktx9G2tRwtKKEnUhHsfKPS4yX14mjsmNt/kH876k0SB+oNaglNb4pQ7qruX4
         Bne55GeaKa6yUxIa1BkipFZMofOB1rCkOFFfkcX3JzWcauvpqW8bW4kjjDe47c/0TUI7
         QAoey3B5D3hqQMGq0Kf0M/QQ8uYvCEDANQL+TKmOFEPphPVLgGdEKD/DKz04t8JtxoDa
         hYxPDZaBAUxUiD8loDiDtg7Hi/+c7mb3i731jyaMZCzKKxDFVxk8jj8Nl6RDp5pWlj2B
         3oKeHmCCJjvYfMdxbuRS21AZu8XNT4/oyB9Jg8FkWJ9CTg7k8BOtGq8eb4r6n0jDHXGE
         hzUQ==
X-Gm-Message-State: AOJu0Ywr6TyWczxqIqjBiEoc2MHiT3w9fsW6keTeSG0Unpx2T/rZ2WrP
	gCGKrx3Wej7e2n53tKiMR2Kr+j482c4k54RhUeQyYXdgNiKjI+e/y0WsKVXUH2bN7eJqW2dmVUI
	C1aXRIz17Qg==
X-Received: from dlbqj22.prod.google.com ([2002:a05:7022:ec16:b0:13f:bdf3:f58])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:62cc:b0:3bf:a638:4376
 with SMTP id adf61e73a8af0-3cc3f7333d8mr907428637.21.1786494454226; Tue, 11
 Aug 2026 17:27:34 -0700 (PDT)
Date: Tue, 11 Aug 2026 17:27:26 -0700
In-Reply-To: <20260811235112.2267241-1-irogers@google.com>
Mime-Version: 1.0
References: <20260811235112.2267241-1-irogers@google.com>
X-Mailer: git-send-email 2.55.0.679.g6767b8d81c-goog
Message-ID: <20260812002728.2283079-1-irogers@google.com>
Subject: [PATCH v3 0/2] perf: Add Raspberry Pi AXI PMU driver
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, linux-perf-users@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	mark.rutland@arm.com, u.kleine-koenig@baylibre.com, will@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_172737_997354_CAC2A3BF 
X-CRM114-Status: GOOD (  14.09  )
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

Changes in v3
-------------
- 64-bit Device Tree reg Parsing: Replaced of_property_read_u32_index with
  platform_get_resource(pdev, IORESOURCE_MEM, i) to retrieve mailbox offsets,
  supporting 64-bit DT layouts (#address-cells = <2>).
- Firmware Phandle Fallback Safety: In rpi_axi_pmu__init(), if firmware node is
  missing or rpi_firmware_get() returns NULL, explicitly set MON__VPU use_mailbox_interface = false.
  config_is_valid() then returns -EINVAL for VPU events, preventing NULL pointer dereferences.
- Driver Teardown Order: In rpi_axi_pmu__exit(), unregister perf_pmu_unregister(&pmu->pmu)
  first to block new event allocations before removing CPU hotplug callbacks, cancelling hrtimer,
  and syncing workqueue.
- Probe Error Unwind Safety: Updated rpi_axi_pmu__init() error paths to call hrtimer_cancel()
  and cancel_work_sync() before returning probe failure.
- Thread-Safe enabled[idx] Setting: Set enabled[idx] = true under pmu->lock after verifying
  event generation sequence in vpu_work_handler(), eliminating TOCTOU race conditions.
- PREEMPT_RT Compatibility: Switched hrtimer setup and start to HRTIMER_MODE_REL_SOFT
  so timer callbacks run in softirq context, allowing spinlock_t acquisitions on PREEMPT_RT.
- CPU Offline Timer Migration: In rpi_axi_pmu_offline_cpu(), restart hrtimer using unpinned
  HRTIMER_MODE_REL_SOFT so perf migrates timer execution to the target CPU.
- Suppress Unsafe Sysfs Unbind: Set .suppress_bind_attrs = true in platform_driver.
- Kconfig Cleanup: Removed non-existent ARCH_BCM2712 symbol from depends on in Kconfig.
- Legacy Sysfs Alias Filtering: Updated rpi_axi_pmu_events_is_visible() to filter out all
  legacy RPi 1-4 System Monitor aliases (ccp2tx_, mphi_, h264_, v3d_, jpeg_, peripheral_,
  cpu_uc_, cpu_l2_, etc.) on BCM2712 systems.

Ian Rogers (2):
  perf: Add Raspberry Pi BCM2835 AXI PMU driver
  perf: Add Raspberry Pi 5 (BCM2712) AXI PMU support

 drivers/perf/Kconfig       |   10 +
 drivers/perf/Makefile      |    1 +
 drivers/perf/rpi_axi_pmu.c | 2022 ++++++++++++++++++++++++++++++++++++
 3 files changed, 2033 insertions(+)
 create mode 100644 drivers/perf/rpi_axi_pmu.c

-- 
2.55.0.679.g6767b8d81c-goog


