Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ADEFC5B572
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 07:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c55HlxdAuLgeE4D6zJzLV99h/PLClnRkIxVnHbAj8Zc=; b=becQM7+eNCmBN7l1/dpuDCU96t
	ISxdJORC/3GrA77wlPUd2/I4RW0xaETUKFzxuzaqWg7jqIzCXZ6v8XK6St+fkTvFbm9cJuwtxdgid
	htEfgtoSLqUdN3PxHUdZdj5vloYZ1twB4UhZxwtvpoVihl2XzR7GTJVADv1nTKiE97L8AJCb5JT14
	oW+4dH4pSu+/aogzsZFumU/fs+8iQtTBtriQHpwNo+vJnaW8hzWrUWmK4xO9tUgGwDPhSQMM9+YgD
	jEQ3VQjbTNqEQbWaa1YkrEJU2It4ZT79ykDSvY2hGK0DqV2+3GISJISRvQTpAfOZUEaJf6XN06D3T
	8nPjdBNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuPtu-000000000e9-2X6d;
	Thu, 13 Aug 2026 07:30:54 +0000
Received: from mail-pj1-x1047.google.com ([2607:f8b0:4864:20::1047])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuPtr-000000000d7-3LsY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 07:30:53 +0000
Received: by mail-pj1-x1047.google.com with SMTP id 98e67ed59e1d1-38e11baa66eso2061012a91.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Aug 2026 00:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786606250; x=1787211050; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c55HlxdAuLgeE4D6zJzLV99h/PLClnRkIxVnHbAj8Zc=;
        b=VUEayLUrOjPh48YcL+Rtf1kr5zpcdK0fnYJj9jXyoYJ6x+s/VP54fv7DtdAmGHA9UE
         71KBGaKFIrTsUGbNs7ygK83e4fRhpiQamsrEHu3rHtDzJ3s48PBXkm/ZsZb8XOYcPNq3
         b1RvM0APUq71cQYr7mTaeIqcxxZCuTKSLIJ69OkTGPqxJv53o3mu7vhmWz6lOa/qCKuB
         SGOp4bdoJFr5Z2H0l6FKbyQiySpZNhtn1MSFjphoX41TOL9xvYBQr9pK5Fey5CAD8DtI
         SluhLUx66Yw9koFHnsRjzkxkRGQzUheVpXzCazC1iRnj4xKbqTz4ZaDGILweyNlaHEcS
         IyTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786606250; x=1787211050;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c55HlxdAuLgeE4D6zJzLV99h/PLClnRkIxVnHbAj8Zc=;
        b=Kb+/kv9L9YySUu2R993ZFX85eXKRdFb3TfvCtkP7RX8L4Ams45s9+VCLsgKiAnU+qd
         hSKvGwSaD+RKYECPhHyCVNlGC+g5yGxpti82LDeVvgSypvwfrrUdKShMndNVqNEL4IQi
         kCeZkrVm6Tjvk3wGOV8NOiD6x2tkbWmqguWwOem3F3w8ZEtgB63MCvOw8wBukVnLgEI6
         GHLr9vYIp6EzdCMOWbVhKilb4SHI5E0BhLstm70BiV6eG5khpOClUncxXttnnx55hdWO
         BidnGfQrLIT3fa6aWNUpmV34Bv4Tn5sIKfyYr3SRVA8E8uMsDbY1ADZKwjpkMUYI0X7z
         u+tQ==
X-Gm-Message-State: AOJu0YzXDppjoFgHbmTiZz7+6a3hhks227DfojYFzwAEf81NiwY77eix
	3v+Yn931mxNYkvRWVwmaMhTTQ666dVH6l2L+8hczZIx+ds0RDX+1QCkHO50UpB5GmYxVXRSl+Ql
	UlRMt+Vu2ng==
X-Received: from dlb8.prod.google.com ([2002:a05:7022:608:b0:141:3f8:cbe2])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5288:b0:38e:ad9d:1151
 with SMTP id 98e67ed59e1d1-3931dfd01b0mr4679263a91.4.1786606250339; Thu, 13
 Aug 2026 00:30:50 -0700 (PDT)
Date: Thu, 13 Aug 2026 00:30:43 -0700
In-Reply-To: <20260813064228.2799872-1-irogers@google.com>
Mime-Version: 1.0
References: <20260813064228.2799872-1-irogers@google.com>
X-Mailer: git-send-email 2.55.0.691.gc56d675ccc-goog
Message-ID: <cover.1691900000.git.irogers@google.com>
Subject: [PATCH v9 0/2] perf: Add Raspberry Pi AXI PMU driver
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, linux-perf-users@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	mark.rutland@arm.com, u.kleine-koenig@baylibre.com, will@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_003051_904844_FF5B73E5 
X-CRM114-Status: GOOD (  12.26  )
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

Changes in v9 (Addressing upstream integration feedback)
==============================
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

