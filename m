Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29911C5AC67
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 08:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ixdeBYynArpsix+QJOhKjoMwqlLEZo89UtTQqf0yC/4=; b=XSnZPVwbVBsYbxqmpy3c2Fz47b
	hxkn45I0HaRaZQ+5sNfzFD90RxTsa3uK8pNbDAFcSBKTG+yjSy8ufacd6IpG5pnzE8ftpbLPOO4ln
	ZOiU+1729qqab3ea/vRSjj9ul0FYF5d7JgsFY/qusFj/Wu+E3MUrTpE1gPD31MJEgm3zVZRRObHDR
	PAzaIKoBePHXZVEZtxF8bgg6S2yWK4N4U5ind6Tucu7a9uI3p2R3kcPhjliG1vzy0Ne5VhqhBQXIT
	kftZF3hXVwaeBRLXEDnpsfpiwvOEZIOut2Fy0Rl+u2QVNVw9hkfAi2TEgrrmhE4uj/sKr4Y0ZIxMA
	TRx+Vlyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wti0K-0000000Dd8v-3n8m;
	Tue, 11 Aug 2026 08:38:36 +0000
Received: from mail-pg1-x547.google.com ([2607:f8b0:4864:20::547])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wti0H-0000000Dd72-27E6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 08:38:35 +0000
Received: by mail-pg1-x547.google.com with SMTP id 41be03b00d2f7-cbb20f82a0eso3464319a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Aug 2026 01:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786437512; x=1787042312; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ixdeBYynArpsix+QJOhKjoMwqlLEZo89UtTQqf0yC/4=;
        b=tbGzX7hu0zV0m253sKG/LbJG8vA17p7JjosCE7um74Bhf1Qk49DbNxOmMf6i7UIVI0
         dpS5nyLIg2ca21wg7N3YBnIC6qdI+1DeG+/EDs1fmMpYR58d/hpnPyAEv82YdcNot40o
         nbeHLkRwlHA5148p9fEhtxob2DUWafAehqAXGwyBA3Uqhr3o46hVgwd9mrkH97nf5YQA
         Cz3+Rt+qxEtI5gehXAyVtvlIIQC4ULHoUZ4g1Rvmo0X7XWPA7UYafAjrPEo+p6RWvP2R
         bJy+ECOJjU6tfhKRUV/3P6VAz6Al1AXWm9GFClSh5a4jm+DSOHrEuGh6jOPAgUBXDODK
         pSRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786437512; x=1787042312;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ixdeBYynArpsix+QJOhKjoMwqlLEZo89UtTQqf0yC/4=;
        b=ebXzDTqk9LOzSdIuSD/c/IZZ9YtlD7D5R46EeV6PH21e9PodvpugMgCUrqTjBCqNLv
         PSdnMV7n3qMPpXus+YsYSRlfqvGnr6eL3Gw3W9LVuAryd+qapJluc/Yub+UrvX0Tas57
         7eS/XiQNYw/mlZMbHQXmp3uksR3e6oIe+5jSgxwXjfYD5FZZANDEQ5imxhrHj9BvH4fv
         l/GyisHrcrkyFc+4yz7c50ucJ9AEfhe/ijgCrcK2kfUL/GsJ9EY0UpDx8YpF7zVkwNog
         ZInv7Po9Qj7fjnAVwfCSzyf60wxOF0dP11ghbsj6mQ5/JT35Jpq4XkIzAbfwIhzUikNY
         uLPQ==
X-Forwarded-Encrypted: i=1; AHgh+RqG956bfUJknQDJeE/wUdwDBTtfG3HI/bfRyjJVg5W2l8MEOXOmRhttUQayHnMX1cg1gt4A9XbrH0vyW06V8vDh@lists.infradead.org
X-Gm-Message-State: AOJu0YwF7U5rRqWNYdk5Ywpd3DX/Vl1gH6sa81cSBnBoVm0KVMypLn2R
	zkIYHtowpPPzE4cv1ex3W/3X0RSDdMWW3tRM8KANf1U07zHILp77y2Pn9GiPzLomYsW0r5RxQEB
	jx8YJAmtdnw==
X-Received: from dldz13-n1.prod.google.com ([2002:a05:701b:418d:10b0:13c:e20a:efb6])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:d83:b0:3c3:875d:704d
 with SMTP id adf61e73a8af0-3cc2baaa24emr2409791637.25.1786437511665; Tue, 11
 Aug 2026 01:38:31 -0700 (PDT)
Date: Tue, 11 Aug 2026 01:38:25 -0700
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.679.g6767b8d81c-goog
Message-ID: <20260811083828.2057695-1-irogers@google.com>
Subject: [PATCH v1 0/2] perf: Add Raspberry Pi AXI PMU driver
From: Ian Rogers <irogers@google.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org
Cc: Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_013833_537289_99334E22 
X-CRM114-Status: GOOD (  11.39  )
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

Ian Rogers (2):
  perf: Add Raspberry Pi BCM2835 AXI PMU driver
  perf: Add Raspberry Pi 5 (BCM2712) AXI PMU support

 drivers/perf/Kconfig       |   10 +
 drivers/perf/Makefile      |    1 +
 drivers/perf/rpi_axi_pmu.c | 1948 ++++++++++++++++++++++++++++++++++++
 3 files changed, 1959 insertions(+)
 create mode 100644 drivers/perf/rpi_axi_pmu.c

-- 
2.55.0.679.g6767b8d81c-goog


