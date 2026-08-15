Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0FE4C5CFC1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Aug 2026 08:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OdsGJg3/bnI8gejy/gpQo+aRW64eJvTmzTGE3VoGfbc=; b=xrJZ3Cou+bQFpbTvq0+m0iX/zj
	Qhe8BjWjiIM6O7Kt/nyXb28Oc5LbWhYqp0A1zDJHMnBWJ8+D0W6gJVsmtn7n1sM/xjWb1RvyzgWrM
	Q4OHrHKgtwUDXsU7CO3l8AZJPGQA0CAmeEBPiPI6UGQiCjOXfx7oFR5t/VYlI1xLoI9CBzQsWyW00
	WkMRYqb0HJRROwW6azmctHUVKMKLcxgfxOGeE9OJpyb8qJnLLIrj2E+E2PtGXBUwgJrMBIgWnUEwB
	W1t9cWx02cjO7vmJ7vGOXwHx86AS29BJWrKFWQjhZhMc0SFH3UDxM0oA/FPUAbaOqooWzHWQj4Iiw
	fKi3HhOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wv9dV-00000003eve-2F3q;
	Sat, 15 Aug 2026 08:21:01 +0000
Received: from mail-pl1-x646.google.com ([2607:f8b0:4864:20::646])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wv9dO-00000003etB-0jDO
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Aug 2026 08:20:57 +0000
Received: by mail-pl1-x646.google.com with SMTP id d9443c01a7336-2cea6a46766so29511845ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 15 Aug 2026 01:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786782052; x=1787386852; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OdsGJg3/bnI8gejy/gpQo+aRW64eJvTmzTGE3VoGfbc=;
        b=a8X6T4h/xa815BEPRxAOWg/+0u6PDoD0+jbZ4F7uj47F46nfKdmE6zxImueKY/NYDZ
         +qNQDtsOR6f+dktzgCIN7FSIj1wPeh7cduwcx4B3/+5YqYqUiurfYPtGk5MTaAXt3Log
         Nc9bB0lPeNGp4CRv+ZRTQJnVYLqAGzfr/mW+JoeUo9uHH8yAXqTCwkouEwado/NVaUZM
         yxdlmNcIfdIAj9ysG86D8bVhpnN+5N+JIyv5uGI11yvlTzKy9glMLr+EFkjhxQ/hHboq
         /UwABrcFFl97rcvFIjq2MisWvFSJqHY4EeplNgl8La6GIpKeDsT5fbgvaBNT7otLuQpX
         YZ1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786782052; x=1787386852;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OdsGJg3/bnI8gejy/gpQo+aRW64eJvTmzTGE3VoGfbc=;
        b=ZLE4OD/eGGtN4T6BY84+gGeCIL+kkw4wl/uIzyQniLpcUpFN7wC0dmboGhuXpeHWf6
         HXVsdJAtx7cGSghuKcvfxkRp97p0WIVtAeBbX3Se4sd59662AtsOhWTqoZOB/nC7uMNn
         /al/izVSoWVbJ5WxyCUBQ22oPMoWVueO/JuWRCh9znSG7XD1GgfEU7/Ab6hcqFr0fhpv
         GoZyqX6JfzkcleZopi7rZ2yyy5+p7xwFT9zwuT57xsL9HFt1WYO/CUSAxo493p5wVkTH
         QcO8qm7Dk52t1FLLmUAm5cC0B+BZyC4DBTSgjSAVb3LGtfh1RQSIpW5fgSy2SwgTHZBn
         /0Yg==
X-Gm-Message-State: AOJu0YxuO1zrNapDUvrltoPcU8qCnt9xCA3IYrD/TEyp4l/Yn9Cd4C1w
	FUru5xBtsyWpClUPQWL+HudWl/hgqw/HlWKJ6UGRGQ/olOsmzlaLkg87Y+n+K43hYKPueP4VMcC
	AlCsb4D1WyA==
X-Received: from dybmx7.prod.google.com ([2002:a05:7300:d407:b0:315:3174:2b9])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:26c7:b0:2ba:6518:a6d4
 with SMTP id d9443c01a7336-2d3b0cb5ceemr140411845ad.20.1786782051879; Sat, 15
 Aug 2026 01:20:51 -0700 (PDT)
Date: Sat, 15 Aug 2026 01:20:45 -0700
In-Reply-To: <cover.1691900000.git.irogers@google.com>
Mime-Version: 1.0
References: <cover.1691900000.git.irogers@google.com>
X-Mailer: git-send-email 2.55.0.691.gc56d675ccc-goog
Message-ID: <20260815082048.4043217-1-irogers@google.com>
Subject: [PATCH v12 0/3] perf: Add Raspberry Pi AXI PMU driver
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, linux-perf-users@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Peter Robinson <pbrobinson@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260815_012054_205406_36CE818F 
X-CRM114-Status: GOOD (  12.06  )
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
     directly mapped over ARM physical memory space (`MON_SYSTEM`).
   - VPU Monitor (Mailbox IPC): For Broadcom BCM2835-BCM2711 platforms (RPi 1-4),
     VideoCore VPU monitor IPC calls are offloaded to process context via a dedicated
     workqueue (`vpu_work`) and serialized under `vpu_mutex`. This avoids atomic
     sleeps or blocking in timer/interrupt context.

4. SoC Generation Support:
   - Patch 1 documents device bindings for Broadcom.
   - Patch 2 adds core driver support for Broadcom BCM2835-BCM2711 (RPi 1-4).
   - Patch 3 expands support for Broadcom BCM2712 (Raspberry Pi 5), adding PCIe RP1
     Southbridge links, HEVC decoder, HVS display engine, and Cortex-A76 DSU L3
     interconnect monitoring dynamically via native MMIO readouts.

Hardware Validation
==============================
The driver has been rigorously validated on real hardware:
- Raspberry Pi 400 (BCM2711): Validated System L2, ARM CPU, and VideoCore
  VPU firmware mailbox IPC performance counters organically spanning
  multi-slice multiplexing boundaries.
- Raspberry Pi 5 (BCM2712): Validated live byte throughput across HVS
  display refresh cycles, Cortex-A76 DSU L3 interconnect memory traffic,
  and PCIe RP1 Southbridge transfers independently configuring `bcm2712_`
  filters.

Changes since v11
==============================
- Decoupled sysfs attribute groups into distinct bcm2835
  (`rpi_axi_pmu_bcm2835_attr_groups`) and BCM2712
  (`rpi_axi_pmu_bcm2712_attr_groups`) arrays dynamically assigned
  during probe based on `.chip`. This officially completely
  eradicates the runtime penalty of scraping string prefixes in
  `.is_visible`.
- Discovered and mitigated a CPU hotplug TOCTOU race vulnerability
  during `rpi_axi_pmu__init` initialization boundaries by introducing
  precise `cpus_read_lock()` atomic block wrapping around the pmu
  registration logic.
- Resolved transient probe dependencies by returning -EPROBE_DEFER
  natively when the mailbox firmware surface has not yet booted,
  preventing silent MMIO fallback.
- Addressed multiple stylistic and naming feedback nits (renamed
  variables using 'pitch' to 'stride', replaced invalid leading
  underscores in function prototypes, and formally introduced the
  MODULE_AUTHOR tag).
- Maintained strict patch separation between BCM2835 Mailbox proxy
  interfaces and BCM2712 native MMIO hardware extensions to streamline
  architectural review parsing.

Ian Rogers (3):
  dt-bindings: perf: Add Broadcom Raspberry Pi AXI PMU definition
  perf: Add Raspberry Pi BCM2835 AXI PMU driver
  perf: Add Raspberry Pi 5 (BCM2712) AXI PMU support

 .../bindings/perf/brcm,bcm2835-axiperf.yaml   |   64 +
 drivers/perf/rpi_axi_pmu.c                    | 2890 +++++++++++++++++
 2 files changed, 2954 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/perf/brcm,bcm2835-axiperf.yaml
 create mode 100644 drivers/perf/rpi_axi_pmu.c

-- 
2.55.0.691.gc56d675ccc-goog


