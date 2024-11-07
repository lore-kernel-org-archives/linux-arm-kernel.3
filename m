Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3854D5AE6F
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 07:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:From:Subject
	:References:Mime-Version:Message-Id:In-Reply-To:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jp6Q6rsYTy2pkFfmFp9hLJ/9ui9ITiVOsHTsdSSP0vY=; b=fyyIsy7ItHFd8DKOpbdtqlnmRM
	Kh32TtJdHV5j7EQt0XINm8j/f2qMgZIa1sYed3M6X6rBn/6jeuU1IKsTPUPq26+ayZ24Vw5AFk+8s
	kYrDI3+I/EKnPkcHzXylPCcan8oWu2vlTKxj1CDMDdmDvGsAl45Cl9749Y5USuk/rCcpMD3pnVKVI
	plYmaMNySQ0xOfKCCfFzwUwFkZos9vjAJyAXr1EEwfeJUDgUiRtWQEfIyTpJYgzRcXLU837Zy2S7T
	vPh8ktyzf/kTROTQwUe4GxcDSLyDYkGTB/cOTJV2R8bVm3EqC7lWnD0S9vwf29wlyEsJiRG+eW05m
	w9O1tfqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8wyR-00000005ziq-2vsq;
	Thu, 07 Nov 2024 07:30:35 +0000
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8wke-00000005wys-1wfq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Nov 2024 07:16:21 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-6ea86f1df79so12648987b3.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 Nov 2024 23:16:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730963779; x=1731568579; darn=lists.infradead.org;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Jp6Q6rsYTy2pkFfmFp9hLJ/9ui9ITiVOsHTsdSSP0vY=;
        b=TMmn2JQlw9NzMgGl+QhfxA/tenhHU9eh0kfRvYojnNCqNtgX35CcXOR1xMjrSlRAE8
         5hJmds9meckXF8Gbc6lyhAt1uZOg17PqCFtDttpv1W6nFfyegUOcTzZfuR7MjgLkEghw
         zqC2NdnMQeKaeXGRNyUiOnO10FMS/dLQXRd8e6Kw1I5Itt38XlfYKzVQt+Qx8ADDm0jA
         tfOfDTk6txV6S32yC5SXpgXAYCOfEzhNpSlD/nJJWkfSmQ4tiSLtcR+u1NtoSOr3FTwn
         6ljoY+qoDnLeKfXguCQAiEzrwgxoAZFcskfB7iLfQHL1CMOWHoW2RkvhqUq0f8gKqHoD
         mb9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730963779; x=1731568579;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Jp6Q6rsYTy2pkFfmFp9hLJ/9ui9ITiVOsHTsdSSP0vY=;
        b=o8zcQI4i5OV67T4lGbQOnmKYHbzpiaq7l+wkYyxydNcQILPL2PhNmuG7AIiO7sZ6vC
         bw/7/GwHYGndx49+vSNaPS6gYgpouKqmqyVauIyutr6LdJK6UzVNIbEz/PBwdoQwytbk
         hZj5hdQ/eUNl7ocenjrXVpPYs0DPZRu+gU8QNcsAIwqgOSR6hSNT/CjG5Kp6inooEUak
         Hm48BwQagnbEYvCF2e5CogoXAEjgR3/qN0jDYOVMVLD80Syo3ipBo06KmemIjLems75z
         THoU7GlIak69tIvppCvwG5nc72m0gl06hHpX02bfd38jaHArMrlZRR83iGd1p9AlBsq/
         mWfw==
X-Forwarded-Encrypted: i=1; AJvYcCUzIafWdkO9z4nkQUlbhw0YGqew0jnAbyRrlFz8uTHnyIVZvBVs4as0ApoV7DnHBTEeZrmfFuNqELyM5Wc6CjX7@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1wVNnXXiFdLC/RGxMoCfW+v2LcasntyzfC7oklpEF8aFMOsD6
	XePZzEapZWNKFf7esrYZl9tE0gcbzMEUCsECce30sBN2O81vbOmApVMense4wARbg4mJ0hCQXrt
	4QZqE9A==
X-Google-Smtp-Source: AGHT+IFjJTkBX3Ww5U3GdP9ImzIAFri1PsUtkuPx9cggbPAOvXg0q9D0jMn+HqGO7HRg6a+gW1C87/H1x3x6
X-Received: from irogers.svl.corp.google.com ([2620:15c:2c5:11:acc7:bda:7167:18d8])
 (user=irogers job=sendgmr) by 2002:a81:a8c3:0:b0:6e3:d670:f603 with SMTP id
 00721157ae682-6e9d8aada53mr4568187b3.3.1730963779222; Wed, 06 Nov 2024
 23:16:19 -0800 (PST)
Date: Wed,  6 Nov 2024 23:16:00 -0800
In-Reply-To: <20241107071600.9082-1-irogers@google.com>
Message-Id: <20241107071600.9082-8-irogers@google.com>
Mime-Version: 1.0
References: <20241107071600.9082-1-irogers@google.com>
X-Mailer: git-send-email 2.47.0.199.ga7371fff76-goog
Subject: [PATCH v1 7/7] perf pmu: Move pmu_metrics_table__find and remove ARM override
From: Ian Rogers <irogers@google.com>
To: John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, 
	James Clark <james.clark@linaro.org>, Mike Leach <mike.leach@linaro.org>, 
	Leo Yan <leo.yan@linux.dev>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Huacai Chen <chenhuacai@kernel.org>, Bibo Mao <maobibo@loongson.cn>, 
	Athira Rajeev <atrajeev@linux.vnet.ibm.com>, Ben Zong-You Xie <ben717@andestech.com>, 
	Alexandre Ghiti <alexghiti@rivosinc.com>, Sandipan Das <sandipan.das@amd.com>, 
	Benjamin Gray <bgray@linux.ibm.com>, Xu Yang <xu.yang_2@nxp.com>, 
	Ravi Bangoria <ravi.bangoria@amd.com>, 
	"=?UTF-8?q?Cl=C3=A9ment=20Le=20Goffic?=" <clement.legoffic@foss.st.com>, Yicong Yang <yangyicong@hisilicon.com>, 
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>, Dima Kogan <dima@secretsauce.net>, 
	"Dr. David Alan Gilbert" <linux@treblig.org>, linux-arm-kernel@lists.infradead.org, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_231620_608488_36868D87 
X-CRM114-Status: GOOD (  18.87  )
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

Move pmu_metrics_table__find to the jevents.py generated pmu-events.c
and remove indirection override for ARM. The movement removes
perf_pmu__find_metrics_table that exists to enable the ARM
override. The ARM override isn't necessary as just the CPUID, not PMU,
is used in the metric table lookup. On non-ARM the CPU argument is
just ignored for the CPUID, for ARM -1 is passed so that the CPUID for
the first logical CPU is read.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/arch/arm64/util/pmu.c         | 20 --------------------
 tools/perf/pmu-events/empty-pmu-events.c | 20 ++++----------------
 tools/perf/pmu-events/jevents.py         | 20 ++++----------------
 tools/perf/pmu-events/pmu-events.h       |  2 +-
 tools/perf/util/pmu.c                    |  5 -----
 tools/perf/util/pmu.h                    |  1 -
 6 files changed, 9 insertions(+), 59 deletions(-)

diff --git a/tools/perf/arch/arm64/util/pmu.c b/tools/perf/arch/arm64/util/pmu.c
index a0964b191fcb..895fb0d0610c 100644
--- a/tools/perf/arch/arm64/util/pmu.c
+++ b/tools/perf/arch/arm64/util/pmu.c
@@ -1,29 +1,9 @@
 // SPDX-License-Identifier: GPL-2.0
 
-#include <internal/cpumap.h>
-#include "../../../util/cpumap.h"
-#include "../../../util/header.h"
 #include "../../../util/pmu.h"
 #include "../../../util/pmus.h"
 #include "../../../util/tool_pmu.h"
 #include <api/fs/fs.h>
-#include <math.h>
-
-const struct pmu_metrics_table *pmu_metrics_table__find(void)
-{
-	struct perf_pmu *pmu;
-
-	/* Metrics aren't currently supported on heterogeneous Arm systems */
-	if (perf_pmus__num_core_pmus() > 1)
-		return NULL;
-
-	/* Doesn't matter which one here because they'll all be the same */
-	pmu = perf_pmus__find_core_pmu();
-	if (pmu)
-		return perf_pmu__find_metrics_table(pmu);
-
-	return NULL;
-}
 
 u64 tool_pmu__cpu_slots_per_cycle(void)
 {
diff --git a/tools/perf/pmu-events/empty-pmu-events.c b/tools/perf/pmu-events/empty-pmu-events.c
index 2151e8a43f16..1c7a2cfa321f 100644
--- a/tools/perf/pmu-events/empty-pmu-events.c
+++ b/tools/perf/pmu-events/empty-pmu-events.c
@@ -587,24 +587,12 @@ const struct pmu_events_table *perf_pmu__find_events_table(struct perf_pmu *pmu)
         return NULL;
 }
 
-const struct pmu_metrics_table *perf_pmu__find_metrics_table(struct perf_pmu *pmu)
+const struct pmu_metrics_table *pmu_metrics_table__find(void)
 {
-        const struct pmu_events_map *map = map_for_pmu(pmu);
-
-        if (!map)
-                return NULL;
-
-        if (!pmu)
-                return &map->metric_table;
-
-        for (size_t i = 0; i < map->metric_table.num_pmus; i++) {
-                const struct pmu_table_entry *table_pmu = &map->metric_table.pmus[i];
-                const char *pmu_name = &big_c_string[table_pmu->pmu_name.offset];
+        struct perf_cpu cpu = {-1};
+        const struct pmu_events_map *map = map_for_cpu(cpu);
 
-                if (pmu__name_match(pmu, pmu_name))
-                           return &map->metric_table;
-        }
-        return NULL;
+        return map ? &map->metric_table : NULL;
 }
 
 const struct pmu_events_table *find_core_events_table(const char *arch, const char *cpuid)
diff --git a/tools/perf/pmu-events/jevents.py b/tools/perf/pmu-events/jevents.py
index 6d6780ca0889..d781a377757a 100755
--- a/tools/perf/pmu-events/jevents.py
+++ b/tools/perf/pmu-events/jevents.py
@@ -1103,24 +1103,12 @@ const struct pmu_events_table *perf_pmu__find_events_table(struct perf_pmu *pmu)
         return NULL;
 }
 
-const struct pmu_metrics_table *perf_pmu__find_metrics_table(struct perf_pmu *pmu)
+const struct pmu_metrics_table *pmu_metrics_table__find(void)
 {
-        const struct pmu_events_map *map = map_for_pmu(pmu);
-
-        if (!map)
-                return NULL;
-
-        if (!pmu)
-                return &map->metric_table;
-
-        for (size_t i = 0; i < map->metric_table.num_pmus; i++) {
-                const struct pmu_table_entry *table_pmu = &map->metric_table.pmus[i];
-                const char *pmu_name = &big_c_string[table_pmu->pmu_name.offset];
+        struct perf_cpu cpu = {-1};
+        const struct pmu_events_map *map = map_for_cpu(cpu);
 
-                if (pmu__name_match(pmu, pmu_name))
-                           return &map->metric_table;
-        }
-        return NULL;
+        return map ? &map->metric_table : NULL;
 }
 
 const struct pmu_events_table *find_core_events_table(const char *arch, const char *cpuid)
diff --git a/tools/perf/pmu-events/pmu-events.h b/tools/perf/pmu-events/pmu-events.h
index 5435ad92180c..675562e6f770 100644
--- a/tools/perf/pmu-events/pmu-events.h
+++ b/tools/perf/pmu-events/pmu-events.h
@@ -103,7 +103,7 @@ int pmu_metrics_table__for_each_metric(const struct pmu_metrics_table *table, pm
 				     void *data);
 
 const struct pmu_events_table *perf_pmu__find_events_table(struct perf_pmu *pmu);
-const struct pmu_metrics_table *perf_pmu__find_metrics_table(struct perf_pmu *pmu);
+const struct pmu_metrics_table *pmu_metrics_table__find(void);
 const struct pmu_events_table *find_core_events_table(const char *arch, const char *cpuid);
 const struct pmu_metrics_table *find_core_metrics_table(const char *arch, const char *cpuid);
 int pmu_for_each_core_event(pmu_event_iter_fn fn, void *data);
diff --git a/tools/perf/util/pmu.c b/tools/perf/util/pmu.c
index 514cb865f57b..45838651b361 100644
--- a/tools/perf/util/pmu.c
+++ b/tools/perf/util/pmu.c
@@ -818,11 +818,6 @@ static int is_sysfs_pmu_core(const char *name)
 	return file_available(path);
 }
 
-__weak const struct pmu_metrics_table *pmu_metrics_table__find(void)
-{
-	return perf_pmu__find_metrics_table(NULL);
-}
-
 /**
  * Return the length of the PMU name not including the suffix for uncore PMUs.
  *
diff --git a/tools/perf/util/pmu.h b/tools/perf/util/pmu.h
index fba3fc608b64..7b3e71194e49 100644
--- a/tools/perf/util/pmu.h
+++ b/tools/perf/util/pmu.h
@@ -260,7 +260,6 @@ void perf_pmu__arch_init(struct perf_pmu *pmu);
 void pmu_add_cpu_aliases_table(struct perf_pmu *pmu,
 			       const struct pmu_events_table *table);
 
-const struct pmu_metrics_table *pmu_metrics_table__find(void);
 bool pmu_uncore_identifier_match(const char *compat, const char *id);
 
 int perf_pmu__convert_scale(const char *scale, char **end, double *sval);
-- 
2.47.0.199.ga7371fff76-goog


