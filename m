Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FF77C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 14:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=boAnktI4cQc5lsDKwW956CEVpWCrgD0LMi0aN6i9K8Y=; b=Q1l3sMLqJXigtNq/jfvST9ZboO
	PqvGQeeja8DKtOxgTHoGIMFRxeXMr1oe9ka+OdWTffaIiPa2tI9b9PihGYjQbnPfhz+MJTLiz38sh
	1MlGZdR86VxSAut08ncaDMtDOhDXF74Cj8WRawiQD4Jlts1q47kdi3Ryn1Nw7yJywdhxvJx1WhR2P
	B9dLqQC40tPKSbBxbORf559EUV+s9lLbgkLSFYqGye+3JIw4qNsCHabzDx51pADb4CU1rQsEScklu
	wcaBtERiY/nLoN7ok6HTtAgQOp9hb+J/vNB0mXY3D6459orAynY8rS7PWT61Pe7bkPY8G4V5yLXtN
	CFnHmWig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYmYS-00000002eeC-37px;
	Mon, 07 Jul 2025 14:10:48 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYm4x-00000002Zzf-2bbW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 13:40:20 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7C2AF168F;
	Mon,  7 Jul 2025 06:40:06 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EF0BC3F6A8;
	Mon,  7 Jul 2025 06:40:16 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Date: Mon, 07 Jul 2025 14:39:34 +0100
Subject: [PATCH v3 12/14] perf arm_spe: Refactor
 arm_spe__get_metadata_by_cpu()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250707-arm_spe_support_hitm_overhead_v1_public-v3-12-33ea82da3280@arm.com>
References: <20250707-arm_spe_support_hitm_overhead_v1_public-v3-0-33ea82da3280@arm.com>
In-Reply-To: <20250707-arm_spe_support_hitm_overhead_v1_public-v3-0-33ea82da3280@arm.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 James Clark <james.clark@linaro.org>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 German Gomez <german.gomez@arm.com>, Ali Saidi <alisaidi@amazon.com>
Cc: Arnaldo Carvalho de Melo <acme@redhat.com>, 
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
 Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751895589; l=2930;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=I5RguSnrzI9C2Mua/gfwpAu8ZT3yNzuLFIDBxzDYqk4=;
 b=RINMD7EknfrG0uZtJ7CxNY3YC8NCP6xjxgyD5hBuMSl9hTSFwISDXo3FXQ8g3g6Cm9lEiEwmD
 +2sykV0k02DAyH7dRsWHg/vddsqpyMb2wxu2t3kUk2yiro+b5QMeaEX
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_064019_792835_39BF1C85 
X-CRM114-Status: GOOD (  18.62  )
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

Handle "CPU=-1" (per-thread mode) in the arm_spe__get_metadata_by_cpu()
function. As a result, the function is more general and will be invoked
by a sequential change.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 tools/perf/util/arm-spe.c | 55 ++++++++++++++++++++++-------------------------
 1 file changed, 26 insertions(+), 29 deletions(-)

diff --git a/tools/perf/util/arm-spe.c b/tools/perf/util/arm-spe.c
index 87cbba941d6f3066697ff430d6ce8e085b173032..e89182b6d27d3d00357db72d804f1d22d5765937 100644
--- a/tools/perf/util/arm-spe.c
+++ b/tools/perf/util/arm-spe.c
@@ -317,15 +317,38 @@ static int arm_spe_set_tid(struct arm_spe_queue *speq, pid_t tid)
 	return 0;
 }
 
-static u64 *arm_spe__get_metadata_by_cpu(struct arm_spe *spe, u64 cpu)
+static u64 *arm_spe__get_metadata_by_cpu(struct arm_spe *spe, int cpu)
 {
+	struct perf_cpu_map *cpus;
+	struct perf_cpu perf_cpu;
 	u64 i;
 
 	if (!spe->metadata)
 		return NULL;
 
+	/* CPU ID is -1 for per-thread mode */
+	if (cpu < 0) {
+		/*
+		 * On the heterogeneous system, due to CPU ID is -1,
+		 * cannot confirm the data source packet is supported.
+		 */
+		if (!spe->is_homogeneous)
+			return NULL;
+
+		cpus = perf_pmus__find_by_type(spe->pmu_type)->cpus;
+		if (!cpus)
+			return NULL;
+
+		/* In a homogeneous system, fetch the first CPU in the map. */
+		perf_cpu = perf_cpu_map__cpu(cpus, 0);
+		if (perf_cpu.cpu == -1)
+			return NULL;
+
+		cpu = perf_cpu.cpu;
+	}
+
 	for (i = 0; i < spe->metadata_nr_cpu; i++)
-		if (spe->metadata[i][ARM_SPE_CPU] == cpu)
+		if (spe->metadata[i][ARM_SPE_CPU] == (u64)cpu)
 			return spe->metadata[i];
 
 	return NULL;
@@ -914,9 +937,6 @@ static bool arm_spe__synth_ds(struct arm_spe_queue *speq,
 			      union perf_mem_data_src *data_src)
 {
 	struct arm_spe *spe = speq->spe;
-	struct perf_cpu_map *cpus;
-	struct perf_cpu perf_cpu;
-	int16_t cpu_nr;
 	u64 *metadata = NULL;
 	u64 midr;
 	unsigned int i;
@@ -929,30 +949,7 @@ static bool arm_spe__synth_ds(struct arm_spe_queue *speq,
 		cpuid = perf_env__cpuid(spe->session->evlist->env);
 		midr = strtol(cpuid, NULL, 16);
 	} else {
-		/* CPU ID is -1 for per-thread mode */
-		if (speq->cpu < 0) {
-			/*
-			 * On the heterogeneous system, due to CPU ID is -1,
-			 * cannot confirm the data source packet is supported.
-			 */
-			if (!spe->is_homogeneous)
-				return false;
-
-			cpus = perf_pmus__find_by_type(spe->pmu_type)->cpus;
-			if (!cpus)
-				return false;
-
-			/* In a homogeneous system, fetch the first CPU in the map. */
-			perf_cpu = perf_cpu_map__cpu(cpus, 0);
-			if (perf_cpu.cpu == -1)
-				return false;
-
-			cpu_nr = perf_cpu.cpu;
-		} else {
-			cpu_nr = speq->cpu;
-		}
-
-		metadata = arm_spe__get_metadata_by_cpu(spe, cpu_nr);
+		metadata = arm_spe__get_metadata_by_cpu(spe, speq->cpu);
 		if (!metadata)
 			return false;
 

-- 
2.34.1


