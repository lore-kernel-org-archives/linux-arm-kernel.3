Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EE01C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 06:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gb9MsvAU21XMuxBAL1AnROv8wUcrBW21oBvrQrAmcYU=; b=sk5sRv+53RJ/C3PWZfS86capHU
	zbELLCwoG777Z5EQFB4JbANtdDUeleVAkqoUgxrJp4mouuWSPfDRLuLZHb/ZK9vPA0B4C506jWVxE
	KlNBCG01gFPde/9CKc8YLdImPQRimFLtgLc+09dmtX68a17Qq87Gi09qrp1IAD1hYSxNN3ZSdCtUT
	116B7Uln6W98HFAr4nmXOf7GcB7m4KgICuaK/sU0/lCxxu3h3ai9KGlgy+m6wGWkW0hqTGFyX05zY
	bsOL6Tqp+yE/x/JkeovLKdm/9HiFMhDkiMIfMI2qfad7uLVyVJtSsNM4ktvSIdAbaRNFeFudZB/Ij
	125P7jzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuP99-0000000HV3N-1Gnu;
	Thu, 13 Aug 2026 06:42:35 +0000
Received: from mail-pg1-x548.google.com ([2607:f8b0:4864:20::548])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuP97-0000000HV2b-19TN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 06:42:34 +0000
Received: by mail-pg1-x548.google.com with SMTP id 41be03b00d2f7-cbb6433e9d4so2306925a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 23:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786603352; x=1787208152; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gb9MsvAU21XMuxBAL1AnROv8wUcrBW21oBvrQrAmcYU=;
        b=ZxQJJ/PkILO/4oxvPPWKY+nBoch8YBAfT/RGly+5J87dTJ3nO+GqV+uwr5CONfAbRF
         zLnUKZF8U5je4pMNivmMsmfYPmM2soopvvIOrRQp9tKX/oxPJ2X6J1OZ7MkDE7UdE7QP
         /w98ptUA3Vp2ExwWrGp2lGZpkQOj4BvuOq5YUyGNZlJz3xMc7FoBlDhxtQ6E5SOR4cuj
         rwDDa78Ye0ZKtr5IHCNATb3L1GL7sozyy5ezbns8ENTFWj5qM7bq3q5S3+hHC+FsePm+
         WTUNWlDSygfqor/wRMXA710QiCPdTiE9z/XbhSLubcmb3ZCpA5KC/8HOoihMZ3sYIjC+
         RfnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786603352; x=1787208152;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gb9MsvAU21XMuxBAL1AnROv8wUcrBW21oBvrQrAmcYU=;
        b=NnjehbNI1VhSicYATbCt98GfqEhREf+4dck2uwzV4ki15k7c/wjJuU3dGQv9qvBJ1g
         /g4yGvmlTtKAwzklCDFYc8frEqK+PjhKhqGDhVqMLmh2GHaYdqDI1MzlOR7NQoCIC0Zr
         HC1PbeHD6jwUck1ZiJ/IYAcgEotxOb1BpHW5bJcdl0ih9HvA6N+M3KRTucVeeGoHsC2m
         RqKFyM3owhrf2Bpa2ZaRzJkNP9OINMLm0l4OPxXLJ934mWnL39+YSKIQ49qhYsWjUAJI
         A0m3ToFhBrqOGhOgBnSxCnG53+dc/MJwWvNpzxSoFM58jOZkr/aIWwmFfyNU5izcBGYT
         q1Xw==
X-Gm-Message-State: AOJu0YzI7fUhDQwG8p0FzHV9f8NaeD+LF7A7MzYrVNg/+3+PCr7OjAVF
	mKJJonJs3mwpgw1ecNLMUZW4BFeLjbxEjJDUCBB0aCqg2lpjbR6fgnVNyHta9R5ssDS3xakH9df
	MkkdqorXPqg==
X-Received: from dlbcm34.prod.google.com ([2002:a05:7022:68a2:b0:13f:c741:a50b])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:1602:b0:3b4:8f18:33a
 with SMTP id adf61e73a8af0-3cc54f4d129mr5116115637.1.1786603351538; Wed, 12
 Aug 2026 23:42:31 -0700 (PDT)
Date: Wed, 12 Aug 2026 23:42:26 -0700
In-Reply-To: <20260813052419.2770841-1-irogers@google.com>
Mime-Version: 1.0
References: <20260813052419.2770841-1-irogers@google.com>
X-Mailer: git-send-email 2.55.0.691.gc56d675ccc-goog
Message-ID: <20260813064228.2799872-1-irogers@google.com>
Subject: [PATCH v8 0/2] perf: Add Raspberry Pi AXI PMU driver
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, linux-perf-users@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	mark.rutland@arm.com, u.kleine-koenig@baylibre.com, will@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_234233_321528_6A8370AD 
X-CRM114-Status: GOOD (  11.35  )
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
=======================
Currently, Linux lacks a standard perf-API compatible driver for the
Broadcom AXI performance counter blocks on Raspberry Pi platforms. Prior
out-of-tree vendor solutions relied on custom debugfs nodes and ad-hoc
kthreads, preventing integration with standard Linux perf tooling.

This driver implements standard `struct pmu` hardware uncore callbacks
under `drivers/perf/`, exposing human-readable sysfs event aliases, unit
scaling (`Bytes`), and bus filtering directly to user space.

Key Architectural Improvements & Features
=========================================
1. Standard Linux Perf Integration:
   - Exposes uncore AXI interconnect events via sysfs boundaries.
   - Supports event sampling and hardware counter accumulation,
     automatically managing 31-bit hardware counter wraparound.

2. CPU Hotplug Support (`cpuhp`):
   - Registers dynamic CPU hotplug notifiers (`CPUHP_AP_ONLINE_DYN`).
   - Automatically migrates PMU context to an online CPU core when a
     designated CPU goes offline, avoiding stale uncore state.

3. Hybrid Memory-Mapped & Mailbox Work Queue Architecture:
   - System Monitor (MMIO): Performs fast atomic-safe memory reads
     directly mapped over ARM physical memory space.
   - VPU Monitor (Mailbox IPC): For Broadcom BCM2835-BCM2711 platforms,
     VideoCore VPU monitor IPC calls are offloaded to process context via
     a dedicated workqueue (`vpu_work`) and serialized.

4. PREEMPT_RT & Safety Hardening:
   - Uses HRTIMER_MODE_REL_SOFT for timer callbacks to execute in softirq
     context, avoiding local hard interrupt nesting priority deadlocks.

5. SoC Generation Support:
   - Patch 1 adds core driver support for Broadcom BCM2835-BCM2711.
   - Patch 2 expands support for Broadcom BCM2712 (Raspberry Pi 5).

Changes in v8
=============
- Fully transitioned locking architecture from 'spinlock_t' globally to
  'raw_spinlock_t' to mathematically guarantee fastpath safety against
  "scheduling while atomic" crashes during PREEMPT_RT deployment where
  the perf core unconditionally disables hard IRQs prior to PMU callbacks.
- Re-architected 'RPI_AXI_PMU_TIMER_INTERVAL' significantly downward from
  2000ms natively to 100ms. This acts as a structural baseline compromise
  that prevents excessive VideoCore Mailbox IPC context-switch wakeovers
  on older Pi 1/2 boards, while safely minimizing uncollected residuals
  causing 0-byte dropouts during time multiplexing/undersubscribed traces.
- Enforced strict 100-column sysfs string macro breakages globally.
- Added proper .scale and .unit bytes aliases across all AXI transaction
  events.
- Fixed a fatal use-after-free initialization race condition catching cases
  where cpuhp_state instances were registered prior to the PMU backend,
  which allowed concurrent CPU hotplug migrations to panic aggressively
  against unregistered core structures.

Ian Rogers (2):
  perf: Add Raspberry Pi BCM2835 AXI PMU driver
  perf: Add Raspberry Pi 5 (BCM2712) AXI PMU support

 drivers/perf/rpi_axi_pmu.c | 2884 ++++++++++++++++++++++++++++++++++++
 1 file changed, 2884 insertions(+)
 create mode 100644 drivers/perf/rpi_axi_pmu.c

-- 
2.47.0

