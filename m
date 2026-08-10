Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CD44C5AD55
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 14:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=no/QO/FW9qZaaMzd7JASTS50cUanEwOFqSyY/MASFzY=; b=kztR/1eGUx5RGL
	cmsqj8IGwT3IPBIvGvsOu/NG/aMFysFwd4UI7Nhpqh7oxQHRy+9GtWKbVOD3Rbkk2HpiFLrBJ4y7i
	69yO520g6ZxWwN+CUbR48sFwtJgzTk/AC6/VtMMEXW1aDo1/aViPMKAWYKuXbj+y0t2P4+O12cbjW
	qXHS+G58ujLvWIgMPl2jJ8RLhFEdbNVo5vBm7HD+pcYWQmFpCWu3HUr9BCosw7MYwq4XsKnmNgRTE
	ddgeKHzqlRFgD1G2DYlDarTkfQ7HfkmgcpwjiJrtaHfEQ8eKgrgKp9tbNV5xyFFcnBM8FST9S96rk
	BZ9pmQFNaSkt9ny5ICHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtRFl-0000000C3aO-18iT;
	Mon, 10 Aug 2026 14:45:25 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtRFh-0000000C3Sa-1XgO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 14:45:23 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C8B8A14BF;
	Mon, 10 Aug 2026 07:45:14 -0700 (PDT)
Received: from e132581.arm.com (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B1DA73F86F;
	Mon, 10 Aug 2026 07:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786373118; bh=lR9RsWa9YwMGSZLK9zGUNTtHx75HhVKXKnB25jcbvgE=;
	h=From:Subject:Date:To:Cc:From;
	b=AxoTYWzlqZ9uJ75aYFaVtYy/LyFM2LLrAz7GLETJWL8pLcew1mk1Krc7Va32Nu3Vc
	 TUldT2lGrYc/GCzjeh2wvhR+MwR3loipooBFeh6sp/f2o6vSoVXpA6AVqiQhbClkek
	 kXcQpYi1T6JoUmggV36KjkLdtvqR81o4uFXdlM2w=
From: Leo Yan <leo.yan@arm.com>
Subject: [PATCH 0/2] perf/arm: Prefer large AUX mappings for CoreSight and
 SPE
Date: Mon, 10 Aug 2026 15:44:40 +0100
Message-Id: <20260810-perf_aux_trace_large_granule-v1-0-03306c9339e3@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANjjeWoC/33NywqDMBCF4Vcps25KYlslXfU9ioRJnGjAGxMVi
 /juTYVuu/zP4jsbROJAER6nDZiWEMPQp1DnE7gG+5pEqFJDJrNcFqoQI7E3OK9mYnRkWuSaTM3
 Yzy2JSturdE7d7B0hESOTD+vBv8rUTYjTwO/jbVHf9Qfr//CihBTe5V5n3ha51U/k7uKGDsp93
 z97TzZ3xgAAAA==
X-Change-ID: 20260717-perf_aux_trace_large_granule-d9b30cc14b5a
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, 
 Anshuman Khandual <anshuman.khandual@arm.com>, 
 Mark Rutland <mark.rutland@arm.com>, Tamas Petz <tamas.petz@arm.com>, 
 Tamas Zsoldos <tamas.zsoldos@arm.com>, 
 Michiel van Tol <michiel.vantol@arm.com>, Dev Jain <dev.jain@arm.com>, 
 David Hildenbrand <david@kernel.org>, Yabin Cui <yabinc@google.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
 Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786373116; l=5308;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=lR9RsWa9YwMGSZLK9zGUNTtHx75HhVKXKnB25jcbvgE=;
 b=KJpm1mhSgiId0zE1EwYPY8OlCcnVxqUYKBM4Qm7YQcSWrEUKPrbzGm8Ub/iZ5Ui/lO/3LmjFM
 PF+YeIGIt4nDQCgcQfeBdhkPXfcnpiKQ8hXLAeWIrgL3ash+XJduUjp
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_074521_493823_C30C930D 
X-CRM114-Status: GOOD (  13.62  )
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

Since the commit:

 18049c8cff9 ("perf/aux: Allocate non-contiguous AUX pages by default")

it changed the AUX buffer allocator to allocate AUX pages page-by-page
(order=0) unless a PMU explicitly asks for contiguous allocations via
the capability flag PERF_PMU_CAP_AUX_PREFER_LARGE. The goal was to make
AUX allocation more memory-friendly by default, because not all PMUs
require physically contiguous AUX pages and large contiguous allocations
can contribute to fragmentation on long-running systems.

However, Arm SPE and CoreSight/TRBE rely on page-table translation when
writing trace data to memory. With page-by-page AUX allocation, a large
AUX buffer is mapped with many small mappings. This increases TLB
pressure, in practice this can increase trace-buffer latency due to
table translation walks (TTW) and contribute to trace discontinuities.

This series restores large AUX allocation for Arm CoreSight and SPE by
setting PERF_PMU_CAP_AUX_PREFER_LARGE.

This is intended to work together with the mm large-mapping series [1].
That series allows vmap() to map physically contiguous pages with
larger granules. With this series, perf first tries larger-order AUX
allocations, and the vmap() code can then create larger mappings for the
contiguous chunks.

The fragmentation concern from commit 18049c8cff9c should not block this
opt-in. PERF_PMU_CAP_AUX_PREFER_LARGE is a preference, not a hard
requirement. The AUX allocator already falls back to smaller orders when
a high-order allocation fails. So this series gives Arm trace PMUs the
performance benefit when large chunks are available.

The comparison below uses a baseline that already includes the mm
large-mapping series [1]. "Baseline" means that the mm series is applied
but this Arm PMU series is not. "Large AUX" means the same kernel plus
this series. Some configurations to mitigate noise during test:

  1) The tests were run with CPU10 isolated with the kernel parameter
     "isolcpus=10".
  2) CPU10 was used as the traced CPU, the PMU counter CPU, and the
     workload CPU. The perf control tasks were pinned to CPU2 so that
     they did not add extra work on CPU10.
  3) Each test was run for 10 iterations, and the tables report the
     average counter values across those runs.

The results show that using larger AUX mappings reduces the TLB pressure.
This is mainly visible in the refill events: CoreSight/TRBE shows a
large drop in l2d_tlb_refill and a smaller reduction in l1d_tlb_refill,
while SPE also reduces l2d_tlb_refill. The dtlb_walk event also drops in
both tests, which shows fewer data TLB walks after the AUX buffer can be
mapped with larger granules.

ETM sparse branch delay (cs_etm, AUX 1GB)

  taskset -c 2 perf stat -C 10 -e cycles:u,instructions:u,dtlb_walk:u,l1d_tlb:u,l1d_tlb_refill:u,l2d_tlb_refill:u \
    -- taskset -c 2 perf record -C 10 -m ,1G -e cs_etm// \
    -- taskset -c 10 ./sparse_branch_delay.elf

 |                | Baseline  | Large map |            |         |
 | Metric         | Avg.      | Avg.      | Delta      | Change  |
 |----------------+-----------+-----------+------------+---------|
 | dtlb_walk      |      72.8 |      63.9 |       -8.9 | -12.23% |
 | l1d_tlb        |   7,434.4 |   1,982.2 |   -5,452.2 | -73.34% |
 | l1d_tlb_refill |     163.7 |     148.2 |      -15.5 |  -9.47% |
 | l2d_tlb_refill | 161,884.9 |     513.1 | -161,371.8 | -99.68% |

SPE dd memory copy (arm_spe, AUX 512MB)

  taskset -c 2 perf stat -C 10 -e cycles:u,instructions:u,dtlb_walk:u,l1d_tlb:u,l1d_tlb_refill:u,l2d_tlb_refill:u \
    -- taskset -c 2 perf record -C 10 -m ,512M -e arm_spe_0/ts_enable=1,pa_enable=1,period=64,min_latency=0/ \
    -- taskset -c 10 dd if=/dev/zero of=/dev/shm/dd_mem_test bs=1M count=1024 status=progress

 |                | Baseline  | Large map |            |         |
 | Metric         | Avg.      | Avg.      | Delta      | Change  |
 |----------------+-----------+-----------+------------+---------|
 | dtlb_walk      |   1,760.2 |   1,387.9 |     -372.3 | -21.15% |
 | l1d_tlb        | 257,312.4 | 251,460.9 |   -5,851.5 |  -2.27% |
 | l1d_tlb_refill |  15,921.9 |  15,933.6 |       11.7 |  +0.07% |
 | l2d_tlb_refill |   4,285.0 |   2,796.5 |   -1,488.5 | -34.74% |

Note that after setting PREFER_LARGE for CoreSight and SPE, the existing
AUX trace drivers either prefer large pages or, in the case of Intel
BTS/PT, use the stronger AUX_NO_SG constraint. We can refactor this
later by either dropping PREFER_LARGE entirely or reversing the flag if
a driver needs discrete pages. For now, keep PREFER_LARGE to preserve
flexibility in the allocation policy.

[1] https://lore.kernel.org/linux-mm/20260715120813.3609949-1-jiangwen6@xiaomi.com/

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
Dev Jain (1):
      coresight: perf: Prefer large AUX mappings

Leo Yan (1):
      perf: arm_spe: Prefer large AUX mappings

 drivers/hwtracing/coresight/coresight-etm-perf.c | 3 ++-
 drivers/perf/arm_spe_pmu.c                       | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)
---
base-commit: db2ddb87143519e20a95aa36c60b36107b736a58
change-id: 20260717-perf_aux_trace_large_granule-d9b30cc14b5a

Best regards,
-- 
Leo Yan <leo.yan@arm.com>


