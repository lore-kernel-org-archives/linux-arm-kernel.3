Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92544E77179
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 12:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:From:Cc:To:Subject:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gYnZuGaBVb8OoJaBG5fmz2bM/VwUfcvVK7JqyrVSEE0=; b=GppbZE8PFPINQujLRlYDG9stBq
	Nr26mXT5zcWpUKcbo4jz5l/6hmopo5udT70N7D+0ySXZTew+agveUbOq6+bxwvZkBWNSc7Zvb/7PM
	YTumxNiLC+Hzm0TxaJ9hltEqI8bU4giQQk4NcHRQOiNw26AfOX4f9x2/QTfE2zzNhjlp7f6kBYgCx
	gXIDGQQuUrzdkr1oaxoOfgRktFWQa3IaMTp/0DxyB6+QJQErTLM3utvamx9TSO3yEj9Ol/wZsH/Ci
	LcPyFHHEjvrftaUokotbEsqKu/9lWMip3MheHYDuL/C9ZmE6g0cSfm0VOkOaQ67mSKOtjQi2TqbXy
	TIrndj+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJX9k-00000001Wsm-2CE2;
	Fri, 06 Dec 2024 12:10:00 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJX8h-00000001Wlc-3Q5E;
	Fri, 06 Dec 2024 12:08:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8ABCBA411D1;
	Fri,  6 Dec 2024 12:07:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 964E7C4CEDE;
	Fri,  6 Dec 2024 12:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1733486934;
	bh=9K6GHCZMrxbO9GvnHCeqOPFlq+CzNBqgiuCnhr67PNg=;
	h=Subject:To:Cc:From:Date:From;
	b=bczx4L1PZwB96R37jqIEdxv9XqTsQxV5apl0ZHiibhlsdIRpUFlNjBHCnPIYWoXAZ
	 arrQ7pKYSI84xUjkaILVl/YG7qDIs5EQIQGUOTnjqHvQlu/3qkHaK5x7EMwSUxLtfK
	 cR9kW+zolfwDBssCTFOE9p11KAinTz1CxjGBTI9M=
Subject: Patch "perf jevents: fix breakage when do perf stat on system metric" has been added to the 6.12-stable tree
To: acme@redhat.com,adrian.hunter@intel.com,alexander.shishkin@linux.intel.com,alexghiti@rivosinc.com,aou@eecs.berkeley.edu,atrajeev@linux.vnet.ibm.com,ben717@andestech.com,bgray@linux.ibm.com,chenhuacai@kernel.org,clement.legoffic@foss.st.com,dima@secretsauce.net,gregkh@linuxfoundation.org,irogers@google.com,james.clark@linaro.org,john.g.garry@oracle.com,jolsa@kernel.org,kan.liang@linux.intel.com,leo.yan@linux.dev,linux-arm-kernel@lists.infradead.org,linux-riscv@lists.infradead.org,linux@treblig.org,maobibo@loongson.cn,mark.rutland@arm.com,mhiramat@kernel.org,mike.leach@linaro.org,mingo@redhat.com,namhyung@kernel.org,palmer@dabbelt.com,paul.walmsley@sifive.com,peterz@infradead.org,ravi.bangoria@amd.com,sandipan.das@amd.com,will@kernel.org,xu.yang_2@nxp.com,yangyicong@hisilicon.com
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Fri, 06 Dec 2024 13:08:06 +0100
Message-ID: <2024120606-nearly-arousal-e45f@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_040855_979755_24DE0378 
X-CRM114-Status: GOOD (  19.22  )
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


This is a note to let you know that I've just added the patch titled

    perf jevents: fix breakage when do perf stat on system metric

to the 6.12-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     perf-jevents-fix-breakage-when-do-perf-stat-on-system-metric.patch
and it can be found in the queue-6.12 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From 4a159e6049f319bef6f9e6d2ccdd322f57d24830 Mon Sep 17 00:00:00 2001
From: Xu Yang <xu.yang_2@nxp.com>
Date: Thu, 7 Nov 2024 08:20:28 -0800
Subject: perf jevents: fix breakage when do perf stat on system metric
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Xu Yang <xu.yang_2@nxp.com>

commit 4a159e6049f319bef6f9e6d2ccdd322f57d24830 upstream.

When do perf stat on sys metric, perf tool output nothing now:

  $ perf stat -a -M imx95_ddr_read.all -I 1000
  $

This command runs on an arm64 machine and the Soc has one DDR hw pmu
except one armv8_cortex_a55 pmu. Their maps show as follows:

const struct pmu_events_map pmu_events_map[] = {
{
	.arch = "arm64",
	.cpuid = "0x00000000410fd050",
	.event_table = {
		.pmus = pmu_events__arm_cortex_a55,
		.num_pmus = ARRAY_SIZE(pmu_events__arm_cortex_a55)
	},
	.metric_table = {
		.pmus = NULL,
		.num_pmus = 0
	}
},

static const struct pmu_sys_events pmu_sys_event_tables[] = {
{
	.event_table = {
		.pmus = pmu_events__freescale_imx95_sys,
		.num_pmus = ARRAY_SIZE(pmu_events__freescale_imx95_sys)
	},
	.metric_table = {
		.pmus = pmu_metrics__freescale_imx95_sys,
		.num_pmus = ARRAY_SIZE(pmu_metrics__freescale_imx95_sys)
	},
	.name = "pmu_events__freescale_imx95_sys",
},

Currently, pmu_metrics_table__find() will return NULL when only do perf
stat on sys metric. Then parse_groups() will never be called to parse
sys metric_name, finally perf tool will exit directly. This should be a
common problem.

To fix the issue, this will keep the logic before commit f20c15d13f01
("perf pmu-events: Remember the perf_events_map for a PMU") to return a
empty metric table rather than a NULL pointer.

This should be fine since the removed part just check if the table match
provided metric_name.  Without these code, the code in parse_groups()
will also check the validity of metrci_name too.

Fixes: f20c15d13f017d4b ("perf pmu-events: Remember the perf_events_map for a PMU")
Reviewed-by: James Clark <james.clark@linaro.org>
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
Tested-by: Xu Yang <xu.yang_2@nxp.com>
Acked-by: Ian Rogers <irogers@google.com>
Cc: Adrian Hunter <adrian.hunter@intel.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>
Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Cc: Benjamin Gray <bgray@linux.ibm.com>
Cc: Ben Zong-You Xie <ben717@andestech.com>
Cc: Bibo Mao <maobibo@loongson.cn>
Cc: Clément Le Goffic <clement.legoffic@foss.st.com>
Cc: Dima Kogan <dima@secretsauce.net>
Cc: Dr. David Alan Gilbert <linux@treblig.org>
Cc: Huacai Chen <chenhuacai@kernel.org>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Jiri Olsa <jolsa@kernel.org>
Cc: John Garry <john.g.garry@oracle.com>
Cc: Kan Liang <kan.liang@linux.intel.com>
Cc: Leo Yan <leo.yan@linux.dev>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Masami Hiramatsu <mhiramat@kernel.org>
Cc: Mike Leach <mike.leach@linaro.org>
Cc: Namhyung Kim <namhyung@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Ravi Bangoria <ravi.bangoria@amd.com>
Cc: Sandipan Das <sandipan.das@amd.com>
Cc: Will Deacon <will@kernel.org>
Cc: Yicong Yang <yangyicong@hisilicon.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-riscv@lists.infradead.org
Cc: stable@vger.kernel.org
Link: https://lore.kernel.org/r/20241107162035.52206-2-irogers@google.com
Signed-off-by: Ian Rogers <irogers@google.com>
Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 tools/perf/pmu-events/empty-pmu-events.c |   12 +-----------
 tools/perf/pmu-events/jevents.py         |   12 +-----------
 2 files changed, 2 insertions(+), 22 deletions(-)

--- a/tools/perf/pmu-events/empty-pmu-events.c
+++ b/tools/perf/pmu-events/empty-pmu-events.c
@@ -539,17 +539,7 @@ const struct pmu_metrics_table *perf_pmu
         if (!map)
                 return NULL;
 
-        if (!pmu)
-                return &map->metric_table;
-
-        for (size_t i = 0; i < map->metric_table.num_pmus; i++) {
-                const struct pmu_table_entry *table_pmu = &map->metric_table.pmus[i];
-                const char *pmu_name = &big_c_string[table_pmu->pmu_name.offset];
-
-                if (pmu__name_match(pmu, pmu_name))
-                           return &map->metric_table;
-        }
-        return NULL;
+	return &map->metric_table;
 }
 
 const struct pmu_events_table *find_core_events_table(const char *arch, const char *cpuid)
--- a/tools/perf/pmu-events/jevents.py
+++ b/tools/perf/pmu-events/jevents.py
@@ -1089,17 +1089,7 @@ const struct pmu_metrics_table *perf_pmu
         if (!map)
                 return NULL;
 
-        if (!pmu)
-                return &map->metric_table;
-
-        for (size_t i = 0; i < map->metric_table.num_pmus; i++) {
-                const struct pmu_table_entry *table_pmu = &map->metric_table.pmus[i];
-                const char *pmu_name = &big_c_string[table_pmu->pmu_name.offset];
-
-                if (pmu__name_match(pmu, pmu_name))
-                           return &map->metric_table;
-        }
-        return NULL;
+	return &map->metric_table;
 }
 
 const struct pmu_events_table *find_core_events_table(const char *arch, const char *cpuid)


Patches currently in stable-queue which might be from xu.yang_2@nxp.com are

queue-6.12/perf-jevents-fix-breakage-when-do-perf-stat-on-system-metric.patch

