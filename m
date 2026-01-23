Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B55BD6CFC1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 04:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hnFIG5HHO3A2+Y/hWwfDfrYBiEwun8dmfUcVel3fgHI=; b=oOuoZBcZtaR1PuDOd2eEYA69Gy
	4xfwsEKQtdK9JPRpt+cygPTtALkJs1Tv9Nn4Y+StTY9SC+La56tDj5ycW14/Qah7fK9q5S7AcmyOm
	PU5prNeU9XM/YNthE+1euEftt5zMBFciKFTkvj7xrHtJkPQgfiZHBZuzzV2AhzDmFd4IqV8XwQ3jI
	cDIW0093XO2lJFgh4ljVumntJg6PAG5/p/EahCkOZnoXevAh+FuRmexxSD1z2aGt8XKOfu/zuZdnV
	O5ZhRvqqIA4193LSyWf07ZNUY3mAsyEVeyNr2E/rg75o+vjbYVnLgcnTEeXb1/CWKA+/VpryF/MOa
	xswLd4EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vj8t7-00000008Cdu-0iXI;
	Fri, 23 Jan 2026 04:35:13 +0000
Received: from esa3.hc1455-7.c3s2.iphmx.com ([207.54.90.49])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vj8t4-00000008CdB-23aZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 04:35:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1769142910; x=1800678910;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=HXA+JXoJiYDtSq22sCzHR5KuBoCaYpCtJcY+LeEPl/Q=;
  b=YKpT8ug2VjZR0TvFAwOYwEkQ8OHci0C7qnkTlVfHFEie/U5I11MonNyz
   9KGpU8PrbanURKnKgLl2jOsxOj1Kr9VXZFecP2rfst2qq09G5bAhT6KZw
   MjPZ0SfQqUUEv9hB6GCOzPjLdHK89/ig2j4A6v6+OMpHxL+0NAJ7RguZ3
   FCskqP/iuxYwZPwIbl6tLRc9DdkSVYh6wK0GFqFP93iRVKyBXkGaGVf/H
   NxWmUz5tSQffM29ForXZuzgrYnJFyWHgGFkkRHYBv0gxTpyHSJ3+rU6Uu
   We4Msn2pTntqkvooaIXTTI5yEwoO5fyxjed+wTMl2/T2Tb7z866qvNazT
   g==;
X-CSE-ConnectionGUID: Aqrf4aaqTZepsp/aKiUO+Q==
X-CSE-MsgGUID: j83GbuxzRfGSt0D7UsRF1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="226779567"
X-IronPort-AV: E=Sophos;i="6.21,247,1763391600"; 
   d="scan'208";a="226779567"
Received: from unknown (HELO az2uksmgr3.o.css.fujitsu.com) ([52.151.125.128])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 13:35:06 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id EE3881002818
	for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Jan 2026 04:35:05 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id A56DEC0716B
	for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Jan 2026 04:35:05 +0000 (UTC)
Received: from sm-arm-grace06.ssoft.mng.com (sm-x86-stp01.soft.fujitsu.com [10.124.178.20])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 7B6221001521;
	Fri, 23 Jan 2026 04:35:01 +0000 (UTC)
From: Shaopeng Tan <tan.shaopeng@fujitsu.com>
To: fenghuay@nvidia.com,
	reinette.chatre@intel.com,
	ben.horgan@arm.com,
	james.morse@arm.com,
	shuah@kernel.org
Cc: linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	tan.shaopeng@fujitsu.com
Subject: [RFC PATCH 0/5] kselftest/resctrl: Enable CAT and NONCONT_CAT tests on ARM 
Date: Fri, 23 Jan 2026 13:40:26 +0900
Message-ID: <20260123044034.141247-1-tan.shaopeng@fujitsu.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_203511_071669_28CE7788 
X-CRM114-Status: GOOD (  23.96  )
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

Hello Fenghua, Reinette, Ben, James, and to whom it may concern,

The MPAM driver is nearing upstream merge,
but resctrl_test doesn't work on the Arm architecture.
I'm actively working on a series to support CAT/NONCONT_CAT tests for the Arm. 
(Support for MBM/MBA tests will be considered in the future.)

While I've modified the resctrl_test code to enable CAT on Arm,
CAT test is failing in the NVIDIA Grace environment. 
(I don't have any other environments.)
Am I misunderstanding the CAT tests, or is there something specific
about Grace that I'm overlooking? Any advice would be greatly appreciated.

First of all,
when running CAT on Grace, I observed that cache limiting is working as expected.
I verified this by checking "sudo cat /sys/fs/resctrl/c1/mon_data/mon_L3_*/llc_occupancy".
Furthermore, I noticed that benchmark execution times varied directly with the limited cache size.

I reused the existing Intel CAT test methodology,
that involves collecting cache miss counts via perf_event during a benchmark task and then
verifying a correlation between the cache limit value and these miss counts.
https://lore.kernel.org/lkml/20231215150515.36983-23-ilpo.jarvinen@linux.intel.com/#r

I'm aware that the specific cache miss numbers and CAT's impact can
differ significantly depending on the microarchitecture or SoC.
For Arm, we need to establish an appropriate minimum difference in LLC
misses between a test with n+1 bits CBM to the test with n bits.

However, my experiments with Grace showed that even when I significantly
varied the cache span size, the average LLC miss counts remained nearly unchanged.

Detailed test results as follows:

# # Starting L3_CAT test ...
# # Mounting resctrl to "/sys/fs/resctrl"
# # Cache size :119537664
# # Writing benchmark parameters to resctrl FS
# # Write schema "L3:1=fc0" to resctrl FS
# # Write schema "L3:1=3f" to resctrl FS
# # Write schema "L3:1=fe0" to resctrl FS
# # Write schema "L3:1=1f" to resctrl FS
# # Write schema "L3:1=ff0" to resctrl FS
# # Write schema "L3:1=f" to resctrl FS
# # Write schema "L3:1=ff8" to resctrl FS
# # Write schema "L3:1=7" to resctrl FS
# # Write schema "L3:1=ffc" to resctrl FS
# # Write schema "L3:1=3" to resctrl FS
# # Write schema "L3:1=ffe" to resctrl FS
# # Write schema "L3:1=1" to resctrl FS
# # Checking for pass/fail
# # Number of bits: 6
# # Average LLC val: 1609252
# # Cache span (lines): 933888
# # Fail: Check cache miss rate changed more than 4.0%
# # Percent diff=-0.0
# # Number of bits: 5
# # Average LLC val: 1609038
# # Cache span (lines): 778240
# # Fail: Check cache miss rate changed more than 3.0%
# # Percent diff=0.7
# # Number of bits: 4
# # Average LLC val: 1620802
# # Cache span (lines): 622592
# # Fail: Check cache miss rate changed more than 2.0%
# # Percent diff=1.1
# # Number of bits: 3
# # Average LLC val: 1639214
# # Cache span (lines): 466944
# # Fail: Check cache miss rate changed more than 1.0%
# # Percent diff=0.9
# # Number of bits: 2
# # Average LLC val: 1653470
# # Cache span (lines): 311296
# # Pass: Check cache miss rate changed more than 0.0%
# # Percent diff=1.0
# # Number of bits: 1
# # Average LLC val: 1669618
# # Cache span (lines): 155648
# not ok 4 L3_CAT: test

Additionally, even with a fixed alloc buffer size(span = 119537664),
the Average LLC value remains nearly unchanged regardless of the limited cache size.
Furthermore, it appears that ARMV8_PMUV3_PERFCTR_L1D_CACHE_REFILL is
mapped to PERF_COUNT_HW_CACHE_MISSES in "./drivers/perf/arm_pmuv3.c",
to counteract this, I attempted to use the perf_event measurement event
to ARMV8_PMUV3_PERFCTR_LL_CACHE_MISS_RD,
ARMV8_PMUV3_PERFCTR_L3D_CACHE_REFILL,
and ARMV8_PMUV3_PERFCTR_L3D_CACHE_LMISS_RD,
however, the Average LLC value still remains nearly unchanged.

My modifications to resctrl_test (for context):

diff --git a/tools/testing/selftests/resctrl/cache.c
b/tools/testing/selftests/resctrl/cache.c
index 9a4a6c52b14c..9f00680039c6 100644
--- a/tools/testing/selftests/resctrl/cache.c
+++ b/tools/testing/selftests/resctrl/cache.c
@@ -8,7 +8,8 @@ char llc_occup_path[1024];
 void perf_event_attr_initialize(struct perf_event_attr *pea, __u64 config)
 {
        memset(pea, 0, sizeof(*pea));
-       pea->type = PERF_TYPE_HARDWARE;
+       //pea->type = PERF_TYPE_HARDWARE;
+       pea->type = PERF_TYPE_RAW;
        pea->size = sizeof(*pea);
        pea->read_format = PERF_FORMAT_GROUP;
        pea->exclude_kernel = 1;
diff --git a/tools/testing/selftests/resctrl/cat_test.c
b/tools/testing/selftests/resctrl/cat_test.c
index 58b1590695d1..3ecf22fa1983 100644
--- a/tools/testing/selftests/resctrl/cat_test.c
+++ b/tools/testing/selftests/resctrl/cat_test.c
@@ -8,6 +8,7 @@
  *    Sai Praneeth Prakhya <sai.praneeth.prakhya@intel.com>,
  *    Fenghua Yu <fenghua.yu@intel.com>
  */
+#include "perf/arm_pmuv3.h"
 #include "resctrl.h"
 #include <unistd.h>

@@ -181,7 +182,11 @@ static int cat_test(const struct resctrl_test *test,
        if (ret)
                goto reset_affinity;

        perf_event_attr_initialize(&pea, PERF_COUNT_HW_CACHE_MISSES);
+       //perf_event_attr_initialize(&pea, ARMV8_PMUV3_PERFCTR_L3D_CACHE);
+       //perf_event_attr_initialize(&pea, ARMV8_PMUV3_PERFCTR_LL_CACHE_MISS_RD);
+       //perf_event_attr_initialize(&pea, ARMV8_PMUV3_PERFCTR_L3D_CACHE_REFILL);
+       //perf_event_attr_initialize(&pea, ARMV8_PMUV3_PERFCTR_L3D_CACHE_LMISS_RD);
        perf_event_initialize_read_format(&pe_read);
        pe_fd = perf_open(&pea, bm_pid, uparams->cpu);
        if (pe_fd < 0) {
@@ -276,6 +281,7 @@ static int cat_run_test(const struct resctrl_test *test, const struct user_param
        };
        param.mask = long_mask;
        span = cache_portion_size(cache_total_size, start_mask, full_cache_mask);
+       //span = 119537664; //L3 cache size of my machine

        remove(param.filename);

Any insights or suggestions would be greatly appreciated.

Best regards,
Shaopeng TAN

---
Shaopeng Tan (5):
  kselftests/resctrl: Detect the ARM architecture
  kselftests/resctrl: enable noncont_cat for MPAM
  kselftests/resctrl: remove unnecessary exclude_idle
  kselftests/resctrl: set shareable_mask to zero if all bits are shared
    between software and hardware
  kselftests/resctrl: Add support for CAT test on ARM

 tools/testing/selftests/resctrl/cache.c         | 1 -
 tools/testing/selftests/resctrl/cat_test.c      | 5 +++--
 tools/testing/selftests/resctrl/fill_buf.c      | 4 ++++
 tools/testing/selftests/resctrl/resctrl.h       | 1 +
 tools/testing/selftests/resctrl/resctrl_tests.c | 7 +++++++
 tools/testing/selftests/resctrl/resctrlfs.c     | 2 ++
 6 files changed, 17 insertions(+), 3 deletions(-)

-- 
2.47.3


