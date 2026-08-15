Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 821C4C5CFDB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Aug 2026 17:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zRir0jKcwf5JyTfl0WhTdOqzrrIy+7c+DcZ//dpq500=; b=rshY6fqZAwaLuh5PpttEhcf1oG
	A/6NFeGZPnd6IHIrFaMsNyGc8OSnVIHsSrKzgOFB5/wBym0eRpiQYEACWW7BXUqGBoDTG4dkubu5w
	LPAvz8VeecVZ8osJ1e0xiDuYAW6rmv0SqYohVo5Z9Y+4Hz3SWTmRsF7YXQ4nayX9kQKX+WsGKWLTJ
	T/bM4a5xbQahD5hA5vZMqkIxklz67nQ0w9sKdfMyi9nUNLNNafzcm3GCliJgsP9PhDrhUK+Vj0v81
	TWpKsJgIxz4KZm2mu5AWrvJtPxX7HWOcGbTGD0iRQOlteQndm8//eobbOzjGElm/r4LNhiTfJib5/
	DswaRt9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvIAT-00000003ymE-426v;
	Sat, 15 Aug 2026 17:27:37 +0000
Received: from mail-pg1-x548.google.com ([2607:f8b0:4864:20::548])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvIAQ-00000003ykC-0j6y
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Aug 2026 17:27:37 +0000
Received: by mail-pg1-x548.google.com with SMTP id 41be03b00d2f7-cbedc1899f7so1217071a12.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 15 Aug 2026 10:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786814852; x=1787419652; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zRir0jKcwf5JyTfl0WhTdOqzrrIy+7c+DcZ//dpq500=;
        b=rDWKpoQjixpWFXM/yx+0zZSc6jVfdgvnfrwRmVZ+Vf8K8TTfiioWc9HeSwWHSI/AoV
         R5Kg0R/pjH6zgRgin2+Irat16Xxe9VmPWOBgN9n9wOLPdtKCtiq8qX064hXhcjJIyQPj
         ITMssuSY7pMnTvwi9JRASPuyrwBt5PyYcuG5NyZJf+/aWjjqLLyZ9D69Xg0GT/H8tSPI
         e5qWAGWD+UnWBcbtPZA4knGvDccARG8vAjdsZuzxYjbJfejlal7o6U3d+uP4a2mXL/0u
         or41cV4lCil+Wy64SpYNWub+eBGqjC3PCtQwriboSAjwpV74rfa/tbqWolynbfMTswtD
         7sCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786814852; x=1787419652;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zRir0jKcwf5JyTfl0WhTdOqzrrIy+7c+DcZ//dpq500=;
        b=PjHSCHMvWCc+96FpT3sqPKkGsKySTRwSR1+H/Krg1OTNdP+ruQu/CwXHJXXM3jYFAJ
         mdlbncUbuAdkss+QyIqDo14Iqfbj/6LppKIZn1JeLLpdraZOZXMu7I4dzjRYkpMj8T8E
         BdsJHxBAxexQeqdqpltMZ8udcIl2STXmWaSJChcw0LXeKBNGYL7uGxl5pqBIVb6/MkQR
         KjeBcOEEZFqk6yM6icy2DyTe87PZmPOfA9I1uU+7tcz3FI1cluQc6gSOgCVum0KuOacE
         XWNW/JPHcssE2waE58W5jBo55Dtm8FHb/A+GaYFyNqMjYJjYz7sid34XrDXZGXrDehdc
         NJug==
X-Gm-Message-State: AOJu0Ywv/DAIbEvmgl+YkSPaaGqPBaI5n7lEtBdUWQoZIVj3IPnGhVc/
	ZpfyJiJovWTt/Jx6EIqZGj71im0GH//K7Snr34S9hkVkyDMAVC/Zhu0WyDwTZx3sYTgJLbTX0JL
	u74HBFTVAoA==
X-Received: from dlbpy7.prod.google.com ([2002:a05:7022:e987:b0:13b:92c7:dcf7])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:7f92:b0:3cc:9618:f51a
 with SMTP id adf61e73a8af0-3cc9619062cmr2665890637.8.1786814852070; Sat, 15
 Aug 2026 10:27:32 -0700 (PDT)
Date: Sat, 15 Aug 2026 10:27:09 -0700
In-Reply-To: <20260815082048.4043217-1-irogers@google.com>
Mime-Version: 1.0
References: <20260815082048.4043217-1-irogers@google.com>
X-Mailer: git-send-email 2.55.0.691.gc56d675ccc-goog
Message-ID: <20260815172712.50119-1-irogers@google.com>
Subject: [PATCH v13 0/3] perf: Add Raspberry Pi AXI PMU driver
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, florian.fainelli@broadcom.com, 
	linux-perf-users@vger.kernel.org, linux-rpi-kernel@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	pbrobinson@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260815_102734_215387_6C04B868 
X-CRM114-Status: GOOD (  10.75  )
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

Changes since v12
==============================
- Schema Enforcement: Added an `allOf` / `if` block to
  `brcm,bcm2835-axiperf.yaml` to mandate the `firmware` property when
  compiling dtbs against older silicon (`brcm,bcm2835-axiperf` and
  `brcm,bcm2711-axiperf`). Validated the documentation example to
  securely meet this constraint.
- Sysfs Arrays: Rehydrated the missing dynamic PMU Sysfs string
  definitions (`PMU_EVENT_ATTR_STRING`) and memory pointers for the
  BCM2712 CPU L2 and Master ID filtered events, ensuring they are
  cleanly exported to Userspace.
- Whitespace formatting: Purged excess consecutive vertical blank
  lines inadvertently dropped into the sysfs definitions across
  boundaries in Patch 2 and Patch 3.
- Documentation nits: Rectified and clarified a misleading comment
  regarding synchronous reads for the BCM2712 VPU explicitly isolated
  from native runtime monitoring.

Ian Rogers (3):
  dt-bindings: perf: Add Broadcom Raspberry Pi AXI PMU definition
  perf: Add Raspberry Pi BCM2835 AXI PMU driver
  perf: Add Raspberry Pi 5 (BCM2712) AXI PMU support

 .../bindings/perf/brcm,bcm2835-axiperf.yaml   |   77 +
 drivers/perf/rpi_axi_pmu.c                    | 2903 +++++++++++++++++
 2 files changed, 2980 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/perf/brcm,bcm2835-axiperf.yaml
 create mode 100644 drivers/perf/rpi_axi_pmu.c

-- 
2.55.0.691.gc56d675ccc-goog


