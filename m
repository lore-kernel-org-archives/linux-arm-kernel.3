Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71E80C5AC67
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 05:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TWsMFBensQDbYfWMzAcPvH6Sa8JYBw+s1a4q7hk79CU=; b=T12xHN26Q90/+J/qAQUDrbqdNw
	Qyat77OAfRz8sNw/wRt12QT7NfHHSTFgiQ0L6h4vFiZ0RBI6wjdxKkFDviK/qOqgDfiU/y+WnGYMw
	AK5q2DDVoviuPdPwpk97cjyB6ik069AQoeZ2Wv17XoBB30GT6ukkkVWh0+/5CpGRVzldoPLmRojEt
	yofz7pFyIu2Qxtt5JNJElpVLF2uaMGPcM+EbmLrgR7Gr8M4DFZ0XPZlDFPgX2JY9ynlKLmwH4xgXo
	fq3Dpxi/Px+ByCOXQ3p0kUc3DuYKS8LrA4KUs2mK6VdYvVgfp0Bf7/FpOPBoeZCOh/fT5DlVvh1ok
	2/ZVggYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuNvW-0000000HPJG-48JS;
	Thu, 13 Aug 2026 05:24:26 +0000
Received: from mail-pf1-x448.google.com ([2607:f8b0:4864:20::448])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuNvT-0000000HPHy-3LQN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 05:24:25 +0000
Received: by mail-pf1-x448.google.com with SMTP id d2e1a72fcca58-84870e7f498so445781b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 22:24:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786598662; x=1787203462; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TWsMFBensQDbYfWMzAcPvH6Sa8JYBw+s1a4q7hk79CU=;
        b=otlY/IrkWCArFinSdQDb1TIIKY8sdfxZgQtW5i0ZhLEnMUzkHM7CaEB1ntuSBXLbLZ
         yJYID+5mxSzRGD0hTfIuCnv19J/4qvBdPVuu2BnS0gl4F1JdQK7/StNWVyi0kCKZ8tpc
         m7VtYTBX3T4JYCPrCWN7J4uRx6b/a0E7/An+PTmBS2RH7/lyz2HI1DWMNe0/YEwMYlac
         gwv91rzOwX9mOSMlR/go1j3WkVc/F9tSgeSUrXF56OuGZQi5/s9ifboiLMx/eczjQGs1
         yfD2Z8k6RpYGV+NdNCIsrFnAhWZYbR0FEW8KNc44MNi9vZIhgsr1NqWS4n7Sp1x3hDWk
         FR9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786598662; x=1787203462;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TWsMFBensQDbYfWMzAcPvH6Sa8JYBw+s1a4q7hk79CU=;
        b=LzWi6MzHxtUT+op9Ei0MQJm0chUTW93aNb08hXoA2zH16d2/dkNlNJhnnmfUtX6spL
         GQzsJqkub+VRtI7CSa1lPftFWxU5xZUQMe0EcyWxNEAg8Req8vSngTSplV7aqIt6AcwT
         sIpUWwpNiwYy83WORbIcbXK8yoprDguGHy8s5HE9xEAAh0Exst94evSR5S1oE7uHrcbU
         X7hfEfmMvchLrT2CmwDo8MkKvuSk776dy/rK5QXcpJx4x5IKWZAZhAn58PhweKqvTVSZ
         Rg5pRCOYRns3Dc1cgvRvhMX0jy9mtanJEnZEilXz4iCOgtEhEHwUmukzpGf/JRPkhskk
         BGmQ==
X-Gm-Message-State: AOJu0YyKoWCsnpAwHOG1X/xXawuE6Dqfu3XVu2pzTA0tiDe6e079Ssqm
	JOipNCu9cyrQo0JYb9TepIBSzWTWeBymkY+rb7CE5Lb1wE4lcGdjyF8dOYgxvVa1dcauLc+m7gs
	5jQyE4iYOrw==
X-Received: from dlbts18-n2.prod.google.com ([2002:a05:7022:b052:20b0:140:f2bb:6f2b])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:329d:b0:3c3:66c5:68cc
 with SMTP id adf61e73a8af0-3cc552c381amr4077224637.21.1786598661970; Wed, 12
 Aug 2026 22:24:21 -0700 (PDT)
Date: Wed, 12 Aug 2026 22:24:16 -0700
In-Reply-To: <20260813043533.2744442-1-irogers@google.com>
Mime-Version: 1.0
References: <20260813043533.2744442-1-irogers@google.com>
X-Mailer: git-send-email 2.55.0.691.gc56d675ccc-goog
Message-ID: <20260813052419.2770841-1-irogers@google.com>
Subject: [PATCH v7 0/2] perf: Add Raspberry Pi AXI PMU driver
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, linux-perf-users@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	mark.rutland@arm.com, u.kleine-koenig@baylibre.com, will@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_222423_831434_52787A0A 
X-CRM114-Status: GOOD (  10.56  )
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
=======================
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
     context, ensuring spinlock acquisitions are PREEMPT_RT safe.

5. SoC Generation Support:
   - Patch 1 adds core driver support for Broadcom BCM2835-BCM2711.
   - Patch 2 expands support for Broadcom BCM2712 (Raspberry Pi 5).

Changes in v7
=======================
- Mathematically scrubbed Patch 1 to explicitly isolate ALL 'bcm2712'
  constants, comments, and logic strictly into Patch 2.
- Explicitly initialized 'vpu_disable_pending' to false during bus
  watcher allocation to prevent orphaned hardware disables from stale
  recycled pointers (Patch 1).
- Maintained the out-of-tree LTS backward compatibility block exactly
  to preserve simultaneous compilation against Raspberry Pi Foundation
  downstream kernels.

Ian Rogers (2):
  perf: Add Raspberry Pi BCM2835 AXI PMU driver
  perf: Add Raspberry Pi 5 (BCM2712) AXI PMU support

 drivers/perf/rpi_axi_pmu.c | 2285 ++++++++++++++++++++++++++++++++++++
 1 file changed, 2285 insertions(+)
 create mode 100644 drivers/perf/rpi_axi_pmu.c

-- 
2.47.0

