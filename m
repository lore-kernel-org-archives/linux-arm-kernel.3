Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15319C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Jul 2025 14:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uUg96rPWYDaq3rXrZXzxOGSH5nZ6u+SuJ1KpDYic0Dc=; b=ACiz82c8D/rh0cbdRERxjsFSUL
	Wpoh7jFI2U7NMCvhAV45Hv8wqfj376zVxIizXXBk5FjmKrt4XgWI4ObiObRc1mLIyTWWR9hIviNsO
	uY+TnjkX9bqO35rbYuWogFgnPh0MLYn+tf0ilyFJkgpZ85Qz/RQZ8qT9sPcHaN0F0bsCHbcCkTllh
	sQxUDTogzoKajVjN1T+g4M/ZS8WIJZ/+Z2jA75ZS0Jefvic/zZ5k88F/S7oOx+2adGDGZtCI5sauQ
	vPB2nkpV7esE2Rk84tuYzrHH6B6Xd9XhdLBxnYGerUytvAZiZ3QEQrtWLMBA8eI4GzuJl8OXdV65m
	Q8cd/1xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhTtK-00000003mB8-0gim;
	Thu, 31 Jul 2025 14:04:18 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhTJk-00000003gun-1eaa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Jul 2025 13:27:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 174471D13;
	Thu, 31 Jul 2025 06:27:24 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 126273F66E;
	Thu, 31 Jul 2025 06:27:29 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Date: Thu, 31 Jul 2025 14:25:47 +0100
Subject: [PATCH v4 12/15] perf arm_spe: Improve CPU number retrieving in
 per-thread mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250731-arm_spe_support_hitm_overhead_v1_public-v4-12-58e5677a412b@arm.com>
References: <20250731-arm_spe_support_hitm_overhead_v1_public-v4-0-58e5677a412b@arm.com>
In-Reply-To: <20250731-arm_spe_support_hitm_overhead_v1_public-v4-0-58e5677a412b@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753968422; l=1871;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=tSdX7nxAmbuhi7LmUY+XdoS5sBr1mFSU1t8XRmTC4u0=;
 b=lAnvN3WiHM9+BiqCID6b3MU9Q2ZSMHE+73s89Xx3tbYzS8mKh4uRJFqyaQFsK7JgzjjOTHBBT
 GjZPlycaFUyDccjP04yPvoDboJZfzUqubzs0/dUYh7ULme+FVwREsnN
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250731_062732_482102_EF9616FB 
X-CRM114-Status: GOOD (  14.25  )
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

In per-thread mode on a homogeneous system, the current code simply
picks the first metadata entry for data source parsing.

This change improves that by using the PMU type to find the matching PMU
event. From there, it reads the CPU map and uses the first CPU ID to
fetch the metadata.

Although this makes no difference when there's only one Arm SPE PMU, it
helps for future support of multiple SPE events.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 tools/perf/util/arm-spe.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/tools/perf/util/arm-spe.c b/tools/perf/util/arm-spe.c
index db681dd2aed205655e77f3dfcd7eb3c33f20277a..2ac10b8008527a066c9b2f67a22eb8511af9239a 100644
--- a/tools/perf/util/arm-spe.c
+++ b/tools/perf/util/arm-spe.c
@@ -914,6 +914,9 @@ static bool arm_spe__synth_ds(struct arm_spe_queue *speq,
 			      union perf_mem_data_src *data_src)
 {
 	struct arm_spe *spe = speq->spe;
+	struct perf_cpu_map *cpus;
+	struct perf_cpu perf_cpu;
+	int16_t cpu_nr;
 	u64 *metadata = NULL;
 	u64 midr;
 	unsigned int i;
@@ -935,13 +938,21 @@ static bool arm_spe__synth_ds(struct arm_spe_queue *speq,
 			if (!spe->is_homogeneous)
 				return false;
 
-			/* In homogeneous system, simply use CPU0's metadata */
-			if (spe->metadata)
-				metadata = spe->metadata[0];
+			cpus = perf_pmus__find_by_type(spe->pmu_type)->cpus;
+			if (!cpus)
+				return false;
+
+			/* In a homogeneous system, fetch the first CPU in the map. */
+			perf_cpu = perf_cpu_map__cpu(cpus, 0);
+			if (perf_cpu.cpu == -1)
+				return false;
+
+			cpu_nr = perf_cpu.cpu;
 		} else {
-			metadata = arm_spe__get_metadata_by_cpu(spe, speq->cpu);
+			cpu_nr = speq->cpu;
 		}
 
+		metadata = arm_spe__get_metadata_by_cpu(spe, cpu_nr);
 		if (!metadata)
 			return false;
 

-- 
2.34.1


