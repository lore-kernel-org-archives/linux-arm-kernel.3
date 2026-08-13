Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE14AC5CFDB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 08:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DgD/Qr6ThMB9P0bXoLiCRwMAEs2jUFNRi7uUt5JWbEM=; b=n0ErY/6giwQbHyzFxhpmQycsTw
	3Mb17Pd+OOa7MN0wjzDWT0DWFAYjvlfgwihl+8pWxDrNZl2AGsXB33lq700dnv9Z+4yya7PZZjY/c
	71eSesXXwsbrA14a9ASeKVipdO/86Xp2OSAqQh8PZw2/UO73dK6PmIWqkleEFI+Uj1HQE3Pu4UXJ9
	cHC5ZKHpMdWy3OGh56nL8WssUX0ttL4Zc8R2EGVxp1AKfjGcq2BhsL9lpku0zwOsseXH+c86ZkLd4
	uHlgmQrBGBNiSCZCpQGJFgexvIpWSqHOib+UUA39ar1aQ8BH5NJBtrThkDNL5PYHgVBEk5d/3D+cO
	EOPYr1Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuQPH-000000004xu-1Ndc;
	Thu, 13 Aug 2026 08:03:19 +0000
Received: from mail-pg1-x548.google.com ([2607:f8b0:4864:20::548])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuQPD-000000004wU-3Ydv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 08:03:17 +0000
Received: by mail-pg1-x548.google.com with SMTP id 41be03b00d2f7-cb835525b10so575083a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Aug 2026 01:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786608194; x=1787212994; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DgD/Qr6ThMB9P0bXoLiCRwMAEs2jUFNRi7uUt5JWbEM=;
        b=Yvc98aL75P2Lv9kDpndQcvRMw8vt0574sze2OPekpav/P9A+iFV8lE+qEYo/EnfqC7
         400wulRrPvNNEENjyCGNX71j+ic9pzipcQqrnKK/YpbSaRhT+KWiWVQtkyKkXGCdTuI/
         0ho5fzUjlxnQAtqQR5zm4RqLjY7Vn907BKprdkXxaJ/dpDMif7JGAvPQkpk/AsC5ks1l
         tY/vDeufKK6KaENz8Zxr8QUlwTJWwv1tiSgOB+pvKC31v+iEHBHkxA/nj9ZLP1zdAgPB
         zrurVx0RwG7n6KZVOq41w2pGTndtDpssEIakxvLD4loPfRmCnrdA38nncrrMIOcbvXof
         eywA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786608194; x=1787212994;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DgD/Qr6ThMB9P0bXoLiCRwMAEs2jUFNRi7uUt5JWbEM=;
        b=ibdNkIeD0YcdmJwRUBqu0RYEs5krB4AA74kI5SQ53qsA1HUij3EanG4C2JRyo71t1o
         CBNeOEwRwBU8lMOiWFUBQHBhI1QmJvXMqZkESimIXJWC1MIyS2Y5X5viDzoZo4ZhJODI
         vrBZwozTrOb32dXD5vHeZvXZ/beNy2HUEdS+yya3qBAq0bJ0T2ydo69K45b4j7eLy/F+
         1KFq4LZgTc6r90dY70Gjf2I4xPxnW6MOtIJQ4MPXh2vk7gpJcY1fExJNyq3U9YC8YYvX
         XhEQqOpoj4N5Df6Akiu1+UlbU3ySg6PTT0JV2a1Ldtq/G2GHeK8vVEdmNMej7TdKAhNs
         Hrkg==
X-Gm-Message-State: AOJu0YzpMjIvI3vO0t1EvcRvaBxnLI5/YmoSHoJFFWHzS8XYWONyFg3G
	I9tgmXAXP7hF3tHoko50O3RynDnENTnQG1DvDE8JZgX9twfSnZO6PTRLkhHSYOyNYyfOq+e8TaE
	sfwaevvW5fQ==
X-Received: from dlbpy9.prod.google.com ([2002:a05:7022:e989:b0:13d:311a:396b])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:3ca7:b0:3c3:b226:f165
 with SMTP id adf61e73a8af0-3cc553a59a7mr5906268637.35.1786608193966; Thu, 13
 Aug 2026 01:03:13 -0700 (PDT)
Date: Thu, 13 Aug 2026 01:03:07 -0700
In-Reply-To: <cover.1691900000.git.irogers@google.com>
Mime-Version: 1.0
References: <cover.1691900000.git.irogers@google.com>
X-Mailer: git-send-email 2.55.0.691.gc56d675ccc-goog
Message-ID: <cover.1691900000.git.irogers@google.com>
Subject: [PATCH v10 0/2] perf: Add Raspberry Pi AXI PMU driver
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, linux-perf-users@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	mark.rutland@arm.com, will@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_010315_901635_24B67430 
X-CRM114-Status: GOOD (  12.63  )
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
Message-ID: <20260813080307.qnUuB-qX2ytxIKTn2jaei_1s4wkYhYplFE1IFmQBA7k@z>

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

Changes in v10 (Addressing upstream integration feedback)
==============================
- Removed the unused `num_started` state tracking variable from `struct rpi_axi_hw_events`
  and its associated start/stop increments, cleanly addressing a reviewer's note on dead code.
- Replaced `flush_work()` with `cancel_work_sync()` in the `rpi_axi_pmu__exit` 
  and initialization error paths, rigorously ensuring no asynchronous VPU worker
  threads continue executing after PMU subsystem termination.
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

