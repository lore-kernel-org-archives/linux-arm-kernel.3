Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCD24C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 14:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CtE5+SwfaqiVt1ovz5nhzu1q4YH4d9K6aiYS2Nt3N1g=; b=gbWCGpJBHUDMHJ+dV8fvSmO1jk
	PQ5Ac4BZtKcOZcIv/u68eHolJIZ5Ou/DUIK3JAFs+3L/6UzcHxeXtnPPonDn5Rd/6Qsk3qdKuKqP3
	pfyB0kHkqg2U8GTAuJWQ4oHOByOWmOmMAzVIqDgCRLOyLr3RxvfEm32oAt7t3pwRQtRopdYjWoy5y
	dE//M3KIgRlDN9P8e7aiInYDN2ohbsZuycR0NUUpA0DmIQYlTcYHgv/+QdSBIHjgZXGhdnOhs18dU
	VChBJcepuBDc4/yq+dn9KoEAQCm274EZ8GMvq3LtXB8l4vFi2XAmrdyLy23m8/mKBL1S02ByEaiCu
	q79wQcwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuWNn-00000000qFD-1UBQ;
	Thu, 13 Aug 2026 14:26:11 +0000
Received: from mail-pg1-x545.google.com ([2607:f8b0:4864:20::545])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuWNl-00000000qEZ-1IVr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 14:26:10 +0000
Received: by mail-pg1-x545.google.com with SMTP id 41be03b00d2f7-cbedf42f199so1005996a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Aug 2026 07:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786631168; x=1787235968; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CtE5+SwfaqiVt1ovz5nhzu1q4YH4d9K6aiYS2Nt3N1g=;
        b=VhiC1Qg9OsXOYN8kfr3IM2mYfoZvP/ho5pRDKAAGSQYM7nwyWzVJEClQqpT0xdGKnO
         dbURLhBAxb+FL6Z9R2r3WiaCLDh+srykL3qDogf8faVOghbhL9ksyzkkj9LSnww/7o1w
         AO7nOaGtoUcjzbEBEjTLWhQhbGS2ioh8B8r103DyI4/TAz8ZU+sS5Tz7MciUOdj1umAe
         Itkh8BmKQOZp3l92mEib14jWtCCaWY02qudAEl+vN9pLf93Fx6C/SH1dmx1wgBLIj/J3
         kexBYI6jrpQ02b+D0rugW8fAyGmkv6L9rrW9xsKdRYTXkMPQa0LrZeIFGrQyCSlqV+D9
         mr1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786631168; x=1787235968;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CtE5+SwfaqiVt1ovz5nhzu1q4YH4d9K6aiYS2Nt3N1g=;
        b=r2W9LgHoZfTOz70q+daSC/HZqTUcDKYmX+2dRmPufPkhleNfKMJ+XaWB3+BcmdvfKl
         Z5tbYxA61bZ11FedrFJep8H6YUvFcIhlGYo6WPJ1Je+PFpLYaj63S1/5H4ivhpX1AUsw
         urHa4K3OiRUBfqFrWiD28Px7dcfluXr4+WZLNzYVQd+gVldwRqREkKId88alyWJDc9TX
         yXqcR0YIxuIz/JNdyAbWEuO4Q5UtFC6+nu29lr8lEQZE6DHB4j5qR/MP6J+po2745GyZ
         e4W+t1ZKT3EwJud72TqszkpAyGUkmqvM+w2eF4MumzFi+hxFMddCF1yJ+bFbQJ0ts9Cx
         HZEQ==
X-Gm-Message-State: AOJu0YxlCtDABW2g/04nGpKPNY4WdY3Pdbo/f6JvHaE8cnOejVxkfoVU
	7idgFOz/BQnomgF9YwasyvY9vO8vbDbFfn4pJ2M8ymdD70TVg/JS98OKgLRHWEyZgy59kQDq+bG
	Izef1z7PG3Q==
X-Received: from dled8-n1.prod.google.com ([2002:a05:701b:42c8:10b0:13b:8289:9a55])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:999d:b0:3c3:9a7f:7307
 with SMTP id adf61e73a8af0-3cc55319ed3mr6860167637.24.1786631167816; Thu, 13
 Aug 2026 07:26:07 -0700 (PDT)
Date: Thu, 13 Aug 2026 07:26:02 -0700
In-Reply-To: <cover.1691900000.git.irogers@google.com>
Mime-Version: 1.0
References: <cover.1691900000.git.irogers@google.com>
X-Mailer: git-send-email 2.55.0.691.gc56d675ccc-goog
Message-ID: <cover.1691900000.git.irogers@google.com>
Subject: [PATCH v11 0/2] perf: Add Raspberry Pi AXI PMU driver
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, linux-perf-users@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	mark.rutland@arm.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_072609_385057_BB829272 
X-CRM114-Status: GOOD (  13.46  )
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
Message-ID: <20260813142602.xMUIIMiPilE_F_nl2maItT-TgkSFp1o7aYdAgKaeTdE@z>

This patch series adds an uncore Performance Monitoring Unit (PMU) driver
for Broadcom AXI system and VideoCore VPU performance monitors found on
Raspberry Pi SoCs (BCM2835 through BCM2712 / Raspberry Pi 1 through 5).

Motivation & Background
==============================
Currently, Linux lacks a standard perf-API compatible driver for the
Broadcom AXI performance counter blocks on Raspberry Pi platforms. Prior
out-of-tree vendor solutions relied on custom debugfs nodes and ad-hoc
kthreads, preventing integration with standard Linux perf tooling (`perf stat`,
`perf list`, etc.).

This driver implements standard `struct pmu` hardware uncore callbacks
under `drivers/perf/`, exposing human-readable sysfs event aliases, unit
scaling (`Bytes`), and bus filtering directly to user space.

Key Architectural Improvements & Features
==============================
1. Standard Linux Perf Integration:
   - Exposes uncore AXI interconnect events via `/sys/bus/event_source/devices/rpi_axi_pmu/`.
   - Supports event sampling and hardware counter accumulation (`local64_add`),
     automatically managing 31-bit hardware counter wraparound across high-bandwidth
     interconnect transfers.

2. CPU Hotplug Support (`cpuhp`):
   - Registers dynamic CPU hotplug notifiers (`CPUHP_AP_ONLINE_DYN`).
   - Automatically migrates PMU context (`perf_pmu_migrate_context`) to an online
     CPU core when a designated CPU goes offline, safely guarding memory teardown boundaries.

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
==============================
The driver has been rigorously validated on real hardware:
- Raspberry Pi 400 (BCM2711): Validated System L2, ARM CPU, and VideoCore VPU
  firmware mailbox IPC performance counters organically spanning multi-slice multiplexing boundaries.
- Raspberry Pi 5 (BCM2712): Validated live byte throughput across HVS display
  refresh cycles, Cortex-A76 DSU L3 interconnect memory traffic, and PCIe RP1
  Southbridge transfers independently configuring `bcm2712_` filters.

Changes in v11 (Addressing upstream integration feedback)
==============================
- Removed the unused `num_started` state tracking variable from `struct rpi_axi_hw_events`
  and its associated start/stop increments, cleanly addressing a reviewer's note on dead code.
- Eliminated KCSAN data race warnings in `rpi_axi_pmu_read_counter()`. Annotated
  the `enabled[idx]` flag with `READ_ONCE()` during lockless VPU thread polling, and matching
  `WRITE_ONCE()` barriers during subsystem teardowns.
- Restored `flush_work()` in `rpi_axi_pmu__exit`. When the module is unloaded, 
  `perf_pmu_unregister()` asynchronously schedules `vpu_work` to gracefully
  disable the physical VideoCore IPC hardware. Using `cancel_work_sync()` was 
  blindly dropping these critical queued disables, silently leaking running hardware monitors!
  Included an explicit defensive comment mathematically documenting this dependency.
- Inverted PMU and CPU hotplug initialization sequence in `probe()` 
  to cleanly eliminate a theoretical `devm_kzalloc` memory UAF race.
- Embedded a robust boolean initialization guard physically into the 
  hotplug event handler, definitively securing offline context callbacks
  from concurrent access panics during concurrent failures.
- Architecturally radically simplified BCM2712 sysfs generation loops 
  by switching to an explicit inverse `bcm2712_` whitelist. This 
  mathematically prevents ghost suffix parameters (`.unit` and `.scale`) 
  from orphaned legacy VPU transactions bleeding into userspace dynamically.
- Explicitly appended documentation notes organically defending the inclusion 
  of the `#if LINUX_VERSION_CODE` legacy shim surrounding `hrtimer_setup` 
  for seamlessly preserving downstream compatibility with Raspberry Pi LTS
  kernel deployments natively.

Ian Rogers (2):
  perf: Add Raspberry Pi BCM2835 AXI PMU driver
  perf: Add Raspberry Pi 5 (BCM2712) AXI PMU support

 drivers/perf/Kconfig       |   10 +
 drivers/perf/Makefile      |    1 +
 drivers/perf/rpi_axi_pmu.c | 2877 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 2888 insertions(+)
 create mode 100644 drivers/perf/rpi_axi_pmu.c

-- 
2.41.0

