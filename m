Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 128C5C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 17:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:From:Subject
	:Mime-Version:Message-Id:Date:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KvYyFj2nG1/TQMfnz/J5XJ8/WMEVshs5kPWwTWXCuSU=; b=0TCm6URPqDGLTqXtFjXDntCCp9
	VJmaQZcX7EFn7yQW8w3cNnYkRSJWUub7rwPi5vu+EKEMUDOq+Osfmciz2pjJ/0CHQnFecukGw7nWr
	xY0EqLSaOmD3Jd9kx/Yf9v+fRUKpn3cTH/wL1x4GqYoMWVNHM9/RpJaYPYMo8Ymmb9MSQyLQan58Z
	CdPa8SQ1kn9muJlrCRG2lPld1BWKdDJQoah2EBgyDtgAQwKiu8aj2OUD6w7DslristC88XyIkbvly
	rQ7kllHUxhZdQpFYp6D19PFgDqO1JW87/JDKj7sJNxvDi1RDRnCD6JsmKEQY/IgUqpbJU9I8Q8sb8
	pH2rLD0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuaeA-00000006fTX-0J1N;
	Tue, 18 Mar 2025 17:22:34 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuab3-00000006eoq-19Zf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 17:19:22 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-6fec6c91630so82236167b3.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Mar 2025 10:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742318359; x=1742923159; darn=lists.infradead.org;
        h=to:from:subject:mime-version:message-id:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=KvYyFj2nG1/TQMfnz/J5XJ8/WMEVshs5kPWwTWXCuSU=;
        b=NhPvQs/8AOVDhHdKJtcUexLgZNMJHt6HgikY33Xj555zdABR3Ktt4wvrm4yuyGPNa2
         klcbENAjTsgp4G1mS/mzZ08sR2ODAIbgUfB33S8Sc4j9FmGdzo0JnIQasw8lAhOPr1YU
         rmHEYUMBM+kce14pFZO/M4UDc6T5TDl2zpidnyFzbXJbgc3Iv2sB6oIlxpo6t7zj9eyN
         U2Biasv7yw9CvpBtClCRjyVIa/10YWjvcxpclbO4EmWPCnL4VlyTEos/96OegNbTI4WX
         7QKaACm42vCHrq+4L8mmEycDSr5d33VKaxW4r1N+8wVNkJXxErTumF4Lysb9SK4tWuNU
         kQ/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742318359; x=1742923159;
        h=to:from:subject:mime-version:message-id:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KvYyFj2nG1/TQMfnz/J5XJ8/WMEVshs5kPWwTWXCuSU=;
        b=QIoIu1IPcHm5yeSVC6KaexK7rGnVakr65oziXECXsP4Bj0v7JSTvmymIOp0IEsChqR
         823tlJu3F8g8wH93QdEk+scQSyx45kYrFdoUKj2nAhPGlxFZFqPbJewpw/draIzT5pDF
         Az2LBRotWem0GRR8FmFDDljNDhCpuW/r6ga9xgRxRgLsZLjsa+Chh4rIEzHUMjalrrAc
         VgG4TLqbjzptFz4QzBe/aaKwl8v+yRAwbxyfFMJ0OtCFpX8lGxlj4rQ+Ygm9FD8xi7e4
         vXtp8WuKJdEnRagKiROQ6vGusrw1a+NiChqzZ71rwIHXRYFkOs6xjievSrIba0eST9K4
         1Gug==
X-Forwarded-Encrypted: i=1; AJvYcCVVO/TyGrr5UqF65pq+olUFcKhcpYC6+rPsyVDhKmeV0J94FAkpRMWfTJra4L9LYci6u7ilIkBWMwfJxJ6a62z4@lists.infradead.org
X-Gm-Message-State: AOJu0YzMUvv6akTIQ5aq+kH29Maw2L1qJIqQVWm8Lt+YZ56vLPUButQV
	DSdemmPh8PNTMZRzbU7nLMdWBVdnm4Ibgp4ZRsewxkqMKtx0zDucDSQs0mlNDdKiNkdhcs0wWFv
	9koYIKA==
X-Google-Smtp-Source: AGHT+IFPSXtbSEWitohgO7VMQCfcTTqptJqeHL+kp6kVB+7zkOLZaeS6VlTaqfbk3dWQLiZNfbrkJc6CPvLj
X-Received: from irogers.svl.corp.google.com ([2620:15c:2c5:11:ef29:15ce:a42a:b69f])
 (user=irogers job=sendgmr) by 2002:a25:d801:0:b0:e60:89be:c33a with SMTP id
 3f1490d57ef6-e63f5bdea0cmr8923276.0.1742318359222; Tue, 18 Mar 2025 10:19:19
 -0700 (PDT)
Date: Tue, 18 Mar 2025 10:19:14 -0700
Message-Id: <20250318171914.145616-1-irogers@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.rc1.451.g8f38331e32-goog
Subject: [PATCH v1] perf cpumap: Increment reference count for online cpumap
From: Ian Rogers <irogers@google.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@linaro.org>, 
	James Clark <james.clark@linaro.org>, John Garry <john.g.garry@oracle.com>, 
	Will Deacon <will@kernel.org>, Leo Yan <leo.yan@linux.dev>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, Howard Chu <howardchu95@gmail.com>, 
	Levi Yun <yeoreum.yun@arm.com>, "Dr. David Alan Gilbert" <linux@treblig.org>, 
	Thomas Falcon <thomas.falcon@intel.com>, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_101921_316517_85C06AE4 
X-CRM114-Status: GOOD (  19.72  )
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

Thomas Richter <tmricht@linux.ibm.com> reported a double put on the
cpumap for the placeholder core PMU:
https://lore.kernel.org/lkml/20250318095132.1502654-3-tmricht@linux.ibm.com/
Requiring the caller to get the cpumap is not how these things are
usually done, switch cpu_map__online to do the get and then fix up any
use cases where a put is needed.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/arch/arm/util/pmu.c | 5 +++--
 tools/perf/util/cpumap.c       | 2 +-
 tools/perf/util/evlist.c       | 5 +++--
 tools/perf/util/mem-events.c   | 5 ++++-
 tools/perf/util/mmap.c         | 4 ++--
 tools/perf/util/pmu.c          | 2 +-
 tools/perf/util/tool_pmu.c     | 1 +
 7 files changed, 15 insertions(+), 9 deletions(-)

diff --git a/tools/perf/arch/arm/util/pmu.c b/tools/perf/arch/arm/util/pmu.c
index 57dc94a6e38c..f70075c89aa0 100644
--- a/tools/perf/arch/arm/util/pmu.c
+++ b/tools/perf/arch/arm/util/pmu.c
@@ -18,7 +18,7 @@
 
 void perf_pmu__arch_init(struct perf_pmu *pmu)
 {
-	struct perf_cpu_map *intersect;
+	struct perf_cpu_map *intersect, *online = cpu_map__online();
 
 #ifdef HAVE_AUXTRACE_SUPPORT
 	if (!strcmp(pmu->name, CORESIGHT_ETM_PMU_NAME)) {
@@ -41,7 +41,8 @@ void perf_pmu__arch_init(struct perf_pmu *pmu)
 	}
 #endif
 	/* Workaround some ARM PMU's failing to correctly set CPU maps for online processors. */
-	intersect = perf_cpu_map__intersect(cpu_map__online(), pmu->cpus);
+	intersect = perf_cpu_map__intersect(online, pmu->cpus);
+	perf_cpu_map__put(online);
 	perf_cpu_map__put(pmu->cpus);
 	pmu->cpus = intersect;
 }
diff --git a/tools/perf/util/cpumap.c b/tools/perf/util/cpumap.c
index 9bc5e0370234..89570397a4b3 100644
--- a/tools/perf/util/cpumap.c
+++ b/tools/perf/util/cpumap.c
@@ -722,7 +722,7 @@ struct perf_cpu_map *cpu_map__online(void) /* thread unsafe */
 	if (!online)
 		online = perf_cpu_map__new_online_cpus(); /* from /sys/devices/system/cpu/online */
 
-	return online;
+	return perf_cpu_map__get(online);
 }
 
 bool aggr_cpu_id__equal(const struct aggr_cpu_id *a, const struct aggr_cpu_id *b)
diff --git a/tools/perf/util/evlist.c b/tools/perf/util/evlist.c
index 49e10d6981ad..c1a04141aed0 100644
--- a/tools/perf/util/evlist.c
+++ b/tools/perf/util/evlist.c
@@ -2534,10 +2534,10 @@ void evlist__warn_user_requested_cpus(struct evlist *evlist, const char *cpu_lis
 		return;
 
 	evlist__for_each_entry(evlist, pos) {
-		struct perf_cpu_map *intersect, *to_test;
+		struct perf_cpu_map *intersect, *to_test, *online = cpu_map__online();
 		const struct perf_pmu *pmu = evsel__find_pmu(pos);
 
-		to_test = pmu && pmu->is_core ? pmu->cpus : cpu_map__online();
+		to_test = pmu && pmu->is_core ? pmu->cpus : online;
 		intersect = perf_cpu_map__intersect(to_test, user_requested_cpus);
 		if (!perf_cpu_map__equal(intersect, user_requested_cpus)) {
 			char buf[128];
@@ -2547,6 +2547,7 @@ void evlist__warn_user_requested_cpus(struct evlist *evlist, const char *cpu_lis
 				cpu_list, pmu ? pmu->name : "cpu", buf, evsel__name(pos));
 		}
 		perf_cpu_map__put(intersect);
+		perf_cpu_map__put(online);
 	}
 	perf_cpu_map__put(user_requested_cpus);
 }
diff --git a/tools/perf/util/mem-events.c b/tools/perf/util/mem-events.c
index 9011784b950d..884d9aebce91 100644
--- a/tools/perf/util/mem-events.c
+++ b/tools/perf/util/mem-events.c
@@ -303,12 +303,15 @@ int perf_mem_events__record_args(const char **rec_argv, int *argv_nr, char **eve
 	}
 
 	if (cpu_map) {
-		if (!perf_cpu_map__equal(cpu_map, cpu_map__online())) {
+		struct perf_cpu_map *online = cpu_map__online();
+
+		if (!perf_cpu_map__equal(cpu_map, online)) {
 			char buf[200];
 
 			cpu_map__snprint(cpu_map, buf, sizeof(buf));
 			pr_warning("Memory events are enabled on a subset of CPUs: %s\n", buf);
 		}
+		perf_cpu_map__put(online);
 		perf_cpu_map__put(cpu_map);
 	}
 
diff --git a/tools/perf/util/mmap.c b/tools/perf/util/mmap.c
index a7ef4d8d57d8..a34726219af3 100644
--- a/tools/perf/util/mmap.c
+++ b/tools/perf/util/mmap.c
@@ -244,9 +244,8 @@ static void build_node_mask(int node, struct mmap_cpu_mask *mask)
 {
 	int idx, nr_cpus;
 	struct perf_cpu cpu;
-	const struct perf_cpu_map *cpu_map = NULL;
+	struct perf_cpu_map *cpu_map = cpu_map__online();
 
-	cpu_map = cpu_map__online();
 	if (!cpu_map)
 		return;
 
@@ -256,6 +255,7 @@ static void build_node_mask(int node, struct mmap_cpu_mask *mask)
 		if (cpu__get_node(cpu) == node)
 			__set_bit(cpu.cpu, mask->bits);
 	}
+	perf_cpu_map__put(cpu_map);
 }
 
 static int perf_mmap__setup_affinity_mask(struct mmap *map, struct mmap_params *mp)
diff --git a/tools/perf/util/pmu.c b/tools/perf/util/pmu.c
index 57450c73fb63..b7ebac5ab1d1 100644
--- a/tools/perf/util/pmu.c
+++ b/tools/perf/util/pmu.c
@@ -779,7 +779,7 @@ static struct perf_cpu_map *pmu_cpumask(int dirfd, const char *pmu_name, bool is
 	}
 
 	/* Nothing found, for core PMUs assume this means all CPUs. */
-	return is_core ? perf_cpu_map__get(cpu_map__online()) : NULL;
+	return is_core ? cpu_map__online() : NULL;
 }
 
 static bool pmu_is_uncore(int dirfd, const char *name)
diff --git a/tools/perf/util/tool_pmu.c b/tools/perf/util/tool_pmu.c
index 9156745ea180..b60ac390d52d 100644
--- a/tools/perf/util/tool_pmu.c
+++ b/tools/perf/util/tool_pmu.c
@@ -355,6 +355,7 @@ bool tool_pmu__read_event(enum tool_pmu_event ev, u64 *result)
 
 		if (online) {
 			*result = perf_cpu_map__nr(online);
+			perf_cpu_map__put(online);
 			return true;
 		}
 		return false;
-- 
2.49.0.rc1.451.g8f38331e32-goog


