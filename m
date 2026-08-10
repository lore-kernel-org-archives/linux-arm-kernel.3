Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3487C5AD55
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 14:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3O/+SZ7geqimaArcLKH3MA7DqfQqJvqA49n8+lsUdwM=; b=nxnwXYbU/giAp2U4env3MNXIAk
	NfVw4zkDdaBd26vbCEsvl7Pb2CtwBNWfJVNzgzGVCH7ELodG6NuD25cUdiwWHY4D1Kr8/+IsBdqwc
	NYToAoTRzTZngImI52esEvXMn91DyPjV4j/YagpXO6G680hkzpZSCbFQoUASMbqzCYx1NhP86i6ds
	iPPXV4LxFXbxzP6Vt4KX7I5ToPj92y4WnHH2jXgMU4a0/j9UcGGmOSOxrhOVnMu4HtC6uZ85wV/6l
	8T9zjNQUsbDylnlLWOd91HMeOS4eD9h4R6xX9e/b03m2MbxWZ8mywZFfYfDNKevZSQz3DsfkMgKBL
	RWpnCqew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtRFq-0000000C3hR-0wyw;
	Mon, 10 Aug 2026 14:45:30 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtRFi-0000000C3VH-0nIe
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 14:45:25 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 26B9D1516;
	Mon, 10 Aug 2026 07:45:17 -0700 (PDT)
Received: from e132581.arm.com (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 12FDA3F86F;
	Mon, 10 Aug 2026 07:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786373121; bh=rndGpDOOwKFFZbFJHDMOhNPElPkCEXmJILpKy8IZlOo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=KLHD2G7r8AQ+jrXy1OYuyGK+D3R4RutlHjYgDuuwU7/bpALEGZ/xvAw1WejxThnbM
	 ehzvE7VZWVgEWNLEPX1wzgt0UuOTaNL83r4pP+UxVgjsJauT+oAq+RGEmiiDN5b2sv
	 mb1pwQ1QVkZVrtv2HZZM/U2sl1+vZ6gDMQePHq94=
From: Leo Yan <leo.yan@arm.com>
Date: Mon, 10 Aug 2026 15:44:41 +0100
Subject: [PATCH 1/2] coresight: perf: Prefer large AUX mappings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260810-perf_aux_trace_large_granule-v1-1-03306c9339e3@arm.com>
References: <20260810-perf_aux_trace_large_granule-v1-0-03306c9339e3@arm.com>
In-Reply-To: <20260810-perf_aux_trace_large_granule-v1-0-03306c9339e3@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786373116; l=2435;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=evv7XjftHtscB+lJLe9pcHq8V246fb1R/QmDUNb49SM=;
 b=qqb1uyE0/5XqA+fICm1gisB2NhhJCGR4hYSbbjV7HsbSuEWUICSF/5X0sL8f8dQQPUyXKY3BR
 f40Zo7xnWYUAx9ozVl4uhX7EM91ccmCw3m74e9OV532EPLnqZ8V7aZj
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_074523_139890_4D518125 
X-CRM114-Status: GOOD (  12.45  )
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

From: Dev Jain <dev.jain@arm.com>

Commit 18049c8cff9c ("perf/aux: Allocate non-contiguous AUX pages by
default") changed AUX allocation to use order-0 pages by default unless
a PMU explicitly asks for contiguous allocations. That reduces
unnecessary memory fragmentation for PMUs which do not require larger
AUX chunks.

TRBE relies on page-table translation for writing the AUX buffer. If a
large AUX buffer is built from order-0 pages, vmap() has to map it with
many small mappings. This adds TLB pressure from the trace unit itself,
and can increase trace-buffer latency and contribute to trace
discontinuities.

Set PERF_PMU_CAP_AUX_PREFER_LARGE for the CoreSight PMU. This asks the
generic AUX allocator to try larger-order allocations so that, with
the vmap() large-mapping support, contiguous chunks can be mapped with
larger granules.

Apply the same preference to traditional sinks such as ETR. ETR uses
double buffering (a bounce buffer and an AUX buffer) and does not use
CPU page table when accessing the bounce buffer, so this does not
benefit TTW latency there. It can still help when the driver or perf
tool accesses the AUX buffer.

With the mm large-mapping series already applied, a sparse branch test
using a 1GB AUX buffer with TRBE showed the following results over 10
iterations:

  l1d_tlb_refill: 163.7 -> 148.2  (-9.47%)
  l2d_tlb_refill: 161,884.9 -> 513.1  (-99.68%)
  dtlb_walk: 72.8 -> 63.9  (-12.23%)

This shows the intended reduction in TLB refill pressure and TLB walks
once the AUX buffer can use larger mappings.

Signed-off-by: Dev Jain <dev.jain@arm.com>
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-etm-perf.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
index 09b21a711a8764ea429d712890265c84648e889e..9646a1aab65b5b0b75c622bd18667ba0b916674f 100644
--- a/drivers/hwtracing/coresight/coresight-etm-perf.c
+++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
@@ -1036,7 +1036,8 @@ int __init etm_perf_init(void)
 
 	etm_pmu.capabilities		= (PERF_PMU_CAP_EXCLUSIVE |
 					   PERF_PMU_CAP_ITRACE |
-					   PERF_PMU_CAP_AUX_PAUSE);
+					   PERF_PMU_CAP_AUX_PAUSE |
+					   PERF_PMU_CAP_AUX_PREFER_LARGE);
 
 	etm_pmu.attr_groups		= etm_pmu_attr_groups;
 	etm_pmu.task_ctx_nr		= perf_sw_context;

-- 
2.34.1


