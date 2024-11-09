Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA9E8D5E362
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 Nov 2024 10:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:CC:References:To:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QlmixrcoQf9rpzgan+Qy750S8xUOlkwY7o/5rjNFGrw=; b=Q1ayyKm5pHu9YsvBdxEpxWS50b
	9rZALoeJ1jgOZc/dNFMUj5PJBBpWndT7xEQwyn2MVQd550ZTXPJDniWc6cAeYEadwA72iIKmyJ2Q7
	KN0135t2VAqYPQrl1iHNvRMsNxX/LpGCPDJeAec1GIrr5/1V8SKY8NSnkBiseY0Xmb37wtvt/73+v
	hnFJ8njtDLQB0yB8OLglE8uZU18IWmswscJPpjM+MgBK9OXhTQ1Yfek4cas3EHKmj5VMPsaplyO9p
	yKSuqdBiXIZAzgQ2+nwcAXE6EQ2kgwQJ7JlI7HnqsrsuRIAjyFjDKvNI0TaK7hfvXOlFrWr2tFpMB
	I2EDCECw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9j8p-0000000D6it-1nNr;
	Sat, 09 Nov 2024 10:56:31 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9j72-0000000D6cI-3pxo;
	Sat, 09 Nov 2024 10:54:43 +0000
Received: from mail.maildlp.com (unknown [172.19.162.112])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Xlt1l0RCNz2Fb3N;
	Sat,  9 Nov 2024 18:52:43 +0800 (CST)
Received: from kwepemd200014.china.huawei.com (unknown [7.221.188.8])
	by mail.maildlp.com (Postfix) with ESMTPS id EEC931400DA;
	Sat,  9 Nov 2024 18:54:27 +0800 (CST)
Received: from [10.67.121.177] (10.67.121.177) by
 kwepemd200014.china.huawei.com (7.221.188.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Sat, 9 Nov 2024 18:54:26 +0800
Subject: Re: [PATCH v2 8/8] perf pmu: Move pmu_metrics_table__find and remove
 ARM override
To: Ian Rogers <irogers@google.com>, Xu Yang <xu.yang_2@nxp.com>
References: <20241107162035.52206-1-irogers@google.com>
 <20241107162035.52206-9-irogers@google.com>
CC: John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, James
 Clark <james.clark@linaro.org>, Mike Leach <mike.leach@linaro.org>, Leo Yan
	<leo.yan@linux.dev>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar
	<mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim
	<namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Alexander
 Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>, Kan Liang
	<kan.liang@linux.intel.com>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Huacai Chen
	<chenhuacai@kernel.org>, Bibo Mao <maobibo@loongson.cn>, Athira Rajeev
	<atrajeev@linux.vnet.ibm.com>, Ben Zong-You Xie <ben717@andestech.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>, Sandipan Das
	<sandipan.das@amd.com>, Benjamin Gray <bgray@linux.ibm.com>, Ravi Bangoria
	<ravi.bangoria@amd.com>, =?UTF-8?Q?Cl=c3=a9ment_Le_Goffic?=
	<clement.legoffic@foss.st.com>, Yicong Yang <yangyicong@hisilicon.com>,
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>, Dima Kogan
	<dima@secretsauce.net>, "Dr. David Alan Gilbert" <linux@treblig.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-perf-users@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>, Junhao He
	<hejunhao3@huawei.com>
From: Yicong Yang <yangyicong@huawei.com>
Message-ID: <5a57de7c-924e-ccd6-8981-b9fddc647465@huawei.com>
Date: Sat, 9 Nov 2024 18:54:26 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20241107162035.52206-9-irogers@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.121.177]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemd200014.china.huawei.com (7.221.188.8)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241109_025441_318189_E756923E 
X-CRM114-Status: GOOD (  23.28  )
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

Hi,

On 2024/11/8 0:20, Ian Rogers wrote:
> Move pmu_metrics_table__find to the jevents.py generated pmu-events.c
> and remove indirection override for ARM. The movement removes
> perf_pmu__find_metrics_table that exists to enable the ARM
> override. The ARM override isn't necessary as just the CPUID, not PMU,
> is used in the metric table lookup. On non-ARM the CPU argument is
> just ignored for the CPUID, for ARM -1 is passed so that the CPUID for
> the first logical CPU is read.

Since the logic here's already been touching, is it possible to step it further to just
ignore the CPUID matching when finding the system metrics/events tables? It's may not be
that reasonable for finding a system metrics/events from the CPUID, since one system PMU may
exists on different platforms with different CPU types.

FYI, there's a similiar problem when trying to count the system metrics but fails [1].
I've tested with this series but the problem still exists.

[1] https://lore.kernel.org/linux-perf-users/20241010074430.16685-1-hejunhao3@huawei.com/

Thanks.

> 
> Signed-off-by: Ian Rogers <irogers@google.com>
> ---
>  tools/perf/arch/arm64/util/pmu.c         | 20 --------------------
>  tools/perf/pmu-events/empty-pmu-events.c | 10 ++++------
>  tools/perf/pmu-events/jevents.py         | 10 ++++------
>  tools/perf/pmu-events/pmu-events.h       |  2 +-
>  tools/perf/util/pmu.c                    |  5 -----
>  tools/perf/util/pmu.h                    |  1 -
>  6 files changed, 9 insertions(+), 39 deletions(-)
> 
> diff --git a/tools/perf/arch/arm64/util/pmu.c b/tools/perf/arch/arm64/util/pmu.c
> index a0964b191fcb..895fb0d0610c 100644
> --- a/tools/perf/arch/arm64/util/pmu.c
> +++ b/tools/perf/arch/arm64/util/pmu.c
> @@ -1,29 +1,9 @@
>  // SPDX-License-Identifier: GPL-2.0
>  
> -#include <internal/cpumap.h>
> -#include "../../../util/cpumap.h"
> -#include "../../../util/header.h"
>  #include "../../../util/pmu.h"
>  #include "../../../util/pmus.h"
>  #include "../../../util/tool_pmu.h"
>  #include <api/fs/fs.h>
> -#include <math.h>
> -
> -const struct pmu_metrics_table *pmu_metrics_table__find(void)
> -{
> -	struct perf_pmu *pmu;
> -
> -	/* Metrics aren't currently supported on heterogeneous Arm systems */
> -	if (perf_pmus__num_core_pmus() > 1)
> -		return NULL;
> -
> -	/* Doesn't matter which one here because they'll all be the same */
> -	pmu = perf_pmus__find_core_pmu();
> -	if (pmu)
> -		return perf_pmu__find_metrics_table(pmu);
> -
> -	return NULL;
> -}
>  
>  u64 tool_pmu__cpu_slots_per_cycle(void)
>  {
> diff --git a/tools/perf/pmu-events/empty-pmu-events.c b/tools/perf/pmu-events/empty-pmu-events.c
> index 17306e316a3c..1c7a2cfa321f 100644
> --- a/tools/perf/pmu-events/empty-pmu-events.c
> +++ b/tools/perf/pmu-events/empty-pmu-events.c
> @@ -587,14 +587,12 @@ const struct pmu_events_table *perf_pmu__find_events_table(struct perf_pmu *pmu)
>          return NULL;
>  }
>  
> -const struct pmu_metrics_table *perf_pmu__find_metrics_table(struct perf_pmu *pmu)
> +const struct pmu_metrics_table *pmu_metrics_table__find(void)
>  {
> -        const struct pmu_events_map *map = map_for_pmu(pmu);
> -
> -        if (!map)
> -                return NULL;
> +        struct perf_cpu cpu = {-1};
> +        const struct pmu_events_map *map = map_for_cpu(cpu);
>  
> -	return &map->metric_table;
> +        return map ? &map->metric_table : NULL;
>  }
>  
>  const struct pmu_events_table *find_core_events_table(const char *arch, const char *cpuid)
> diff --git a/tools/perf/pmu-events/jevents.py b/tools/perf/pmu-events/jevents.py
> index e44b72e56ac3..d781a377757a 100755
> --- a/tools/perf/pmu-events/jevents.py
> +++ b/tools/perf/pmu-events/jevents.py
> @@ -1103,14 +1103,12 @@ const struct pmu_events_table *perf_pmu__find_events_table(struct perf_pmu *pmu)
>          return NULL;
>  }
>  
> -const struct pmu_metrics_table *perf_pmu__find_metrics_table(struct perf_pmu *pmu)
> +const struct pmu_metrics_table *pmu_metrics_table__find(void)
>  {
> -        const struct pmu_events_map *map = map_for_pmu(pmu);
> -
> -        if (!map)
> -                return NULL;
> +        struct perf_cpu cpu = {-1};
> +        const struct pmu_events_map *map = map_for_cpu(cpu);
>  
> -	return &map->metric_table;
> +        return map ? &map->metric_table : NULL;
>  }
>  
>  const struct pmu_events_table *find_core_events_table(const char *arch, const char *cpuid)
> diff --git a/tools/perf/pmu-events/pmu-events.h b/tools/perf/pmu-events/pmu-events.h
> index 5435ad92180c..675562e6f770 100644
> --- a/tools/perf/pmu-events/pmu-events.h
> +++ b/tools/perf/pmu-events/pmu-events.h
> @@ -103,7 +103,7 @@ int pmu_metrics_table__for_each_metric(const struct pmu_metrics_table *table, pm
>  				     void *data);
>  
>  const struct pmu_events_table *perf_pmu__find_events_table(struct perf_pmu *pmu);
> -const struct pmu_metrics_table *perf_pmu__find_metrics_table(struct perf_pmu *pmu);
> +const struct pmu_metrics_table *pmu_metrics_table__find(void);
>  const struct pmu_events_table *find_core_events_table(const char *arch, const char *cpuid);
>  const struct pmu_metrics_table *find_core_metrics_table(const char *arch, const char *cpuid);
>  int pmu_for_each_core_event(pmu_event_iter_fn fn, void *data);
> diff --git a/tools/perf/util/pmu.c b/tools/perf/util/pmu.c
> index 514cb865f57b..45838651b361 100644
> --- a/tools/perf/util/pmu.c
> +++ b/tools/perf/util/pmu.c
> @@ -818,11 +818,6 @@ static int is_sysfs_pmu_core(const char *name)
>  	return file_available(path);
>  }
>  
> -__weak const struct pmu_metrics_table *pmu_metrics_table__find(void)
> -{
> -	return perf_pmu__find_metrics_table(NULL);
> -}
> -
>  /**
>   * Return the length of the PMU name not including the suffix for uncore PMUs.
>   *
> diff --git a/tools/perf/util/pmu.h b/tools/perf/util/pmu.h
> index fba3fc608b64..7b3e71194e49 100644
> --- a/tools/perf/util/pmu.h
> +++ b/tools/perf/util/pmu.h
> @@ -260,7 +260,6 @@ void perf_pmu__arch_init(struct perf_pmu *pmu);
>  void pmu_add_cpu_aliases_table(struct perf_pmu *pmu,
>  			       const struct pmu_events_table *table);
>  
> -const struct pmu_metrics_table *pmu_metrics_table__find(void);
>  bool pmu_uncore_identifier_match(const char *compat, const char *id);
>  
>  int perf_pmu__convert_scale(const char *scale, char **end, double *sval);
> 

