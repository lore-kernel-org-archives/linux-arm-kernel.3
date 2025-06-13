Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DB33C71148
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 18:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NblYeoNVcHzV+fAbeZa0zedUGONWdfgEgJNM6nHcBrA=; b=JcZAPEHgFqJiNvaqwSE1DKVY9N
	5ExzK4IatDhbi0x26KJ/E5S55l2foH12Mw67OS+Guw4wGpQSwtfMsYFaBFr85kM9Uiy0IPrpA1XFF
	fSGkYVpJi8rQXEvqzuhv4WJMnb20QaUYe1sEDvaqf07QON0hlJqsVkpWErvIgLkN+/JK6xvZeg7yT
	svRJpWusNPAqNmYVzdbaCN4tSkwDpDCnETWxe1pKr5deLtTNMUf/JcYcAGY/DEyccrGZHdvLF+Tln
	iTa/+2YViVdkjwEF2x88gfsKeX998oNUNkY5vDjhUQR2O5Xm/Ryn/pRFcSR/OmRXOXFdN3DNvKQu0
	zrJqfmqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ8xZ-0000000HGHO-1Q41;
	Fri, 13 Jun 2025 18:17:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ6jt-0000000Gy99-45MO
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 13 Jun 2025 15:54:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=NblYeoNVcHzV+fAbeZa0zedUGONWdfgEgJNM6nHcBrA=; b=MfRrA2QF2TRBw2xij08EcnwKdo
	Xuf1XBhOPDB69m7XVjsMerBnELZIqepS3O5onEQ7j6es+Guh4OWrfxuIfUCh2HnX1E5B0xuaECqOp
	chMNqqXFhlAIAMKOpf5HbD+KolaQhMZlM/lkmrqU2NMz70mtYHi+JjHi+K80hi1PvWzohT3hqOXH1
	2VgrHdmgQNGpFA3OOzXtB55fnVRQfNMzs4N5jt6VFFO5bvZ2sMv6Zi3926GsPVE/tWwSrKdPggJ6f
	dOJ7fNGp1nF5fHuUcY6bpyl+o8ZXwKZbHSyYAin0Q6u748tMMPth0oA+1IrrrxZc9NU9q9/a1GtZ0
	5Tn+XrIQ==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ6jr-000000032AN-200L
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Jun 2025 15:54:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6E41122FA;
	Fri, 13 Jun 2025 08:54:19 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1C2323F59E;
	Fri, 13 Jun 2025 08:54:37 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 13 Jun 2025 16:53:45 +0100
Subject: [PATCH 12/12] perf arm_spe: Allow parsing both data source and
 events
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250613-arm_spe_support_hitm_overhead_v1_public-v1-12-6faecf0a8775@arm.com>
References: <20250613-arm_spe_support_hitm_overhead_v1_public-v1-0-6faecf0a8775@arm.com>
In-Reply-To: <20250613-arm_spe_support_hitm_overhead_v1_public-v1-0-6faecf0a8775@arm.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 James Clark <james.clark@linaro.org>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>
Cc: Arnaldo Carvalho de Melo <acme@redhat.com>, 
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
 Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749830053; l=4562;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=UX5EF4zeJjllOssAvdNBH4/sTghaOWwikwxcas08Nfc=;
 b=E1IU9UBRaUpgtQNokE27DHRgUNsFtC/rxSWPcE/LX7GZGYldWopdDSl0EQvZvofSYhpH68x8B
 m4bWCMErR+FCW3t8cnhPO+GuSLrOq/97uNAZ8pT1W3qF7+ch2F91Pz0
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_165444_021798_511210F4 
X-CRM114-Status: GOOD (  17.93  )
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

Current code skips to parse events after generating data source. The
reason is the data source packets have cache and snooping related info,
the afterwards event packets might contain duplicate info.

This commit changes to continue parsing the events after data source
analysis. If data source does not give out memory level and snooping
types, then the event info is used to synthesize the related fields.

As a result, both the peer snoop option ('-d peer') and hitm options
('-d tot/lcl/rmt') are supported by Arm SPE in the perf c2c.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 tools/perf/util/arm-spe.c | 69 ++++++++++++++++++++++++++++-------------------
 1 file changed, 41 insertions(+), 28 deletions(-)

diff --git a/tools/perf/util/arm-spe.c b/tools/perf/util/arm-spe.c
index 8a889f727f9cd5351b4ca027935112eddd16ea6c..8fde6f6cbce92aabf20d25b01ee2ade4aae7ea61 100644
--- a/tools/perf/util/arm-spe.c
+++ b/tools/perf/util/arm-spe.c
@@ -909,40 +909,54 @@ static void arm_spe__synth_memory_level(struct arm_spe_queue *speq,
 {
 	struct arm_spe *spe = speq->spe;
 
-	if (data_src->mem_op == PERF_MEM_OP_LOAD)
-		arm_spe__synth_ld_memory_level(record, data_src);
-	if (data_src->mem_op == PERF_MEM_OP_STORE)
-		arm_spe__synth_st_memory_level(record, data_src);
+	/*
+	 * The data source packet contains more info for cache levels for
+	 * peer snooping. So respect the memory level if has been set by
+	 * data source parsing.
+	 */
+	if (!data_src->mem_lvl) {
+		if (data_src->mem_op == PERF_MEM_OP_LOAD)
+			arm_spe__synth_ld_memory_level(record, data_src);
+		if (data_src->mem_op == PERF_MEM_OP_STORE)
+			arm_spe__synth_st_memory_level(record, data_src);
+	}
 
 	if (!data_src->mem_lvl) {
 		data_src->mem_lvl = PERF_MEM_LVL_NA;
 		data_src->mem_lvl_num = PERF_MEM_LVLNUM_NA;
 	}
 
-	if (record->type & ARM_SPE_DATA_SNOOPED) {
-		if (record->type & ARM_SPE_HITM)
-			data_src->mem_snoop = PERF_MEM_SNOOP_HITM;
-		else
-			data_src->mem_snoop = PERF_MEM_SNOOP_HIT;
-	} else {
-		u64 *metadata = arm_spe__get_metadata_by_cpu(spe, speq->cpu);
-
-		/*
-		 * Set NA ("Not available") mode if no meta data or the
-		 * SNOOPED event is not supported.
-		 */
-		if (!metadata ||
-		    !(metadata[ARM_SPE_CAP_EVENTS] & ARM_SPE_DATA_SNOOPED))
-			data_src->mem_snoop = PERF_MEM_SNOOP_NA;
-		else
-			data_src->mem_snoop = PERF_MEM_SNOOP_NONE;
+	/*
+	 * If 'mem_snoop' has been set by data source packet, skip to set
+	 * it at here.
+	 */
+	if (!data_src->mem_snoop) {
+		if (record->type & ARM_SPE_DATA_SNOOPED) {
+			if (record->type & ARM_SPE_HITM)
+				data_src->mem_snoop = PERF_MEM_SNOOP_HITM;
+			else
+				data_src->mem_snoop = PERF_MEM_SNOOP_HIT;
+		} else {
+			u64 *metadata =
+				arm_spe__get_metadata_by_cpu(spe, speq->cpu);
+
+			/*
+			 * Set NA ("Not available") mode if no meta data or the
+			 * SNOOPED event is not supported.
+			 */
+			if (!metadata ||
+			    !(metadata[ARM_SPE_CAP_EVENTS] & ARM_SPE_DATA_SNOOPED))
+				data_src->mem_snoop = PERF_MEM_SNOOP_NA;
+			else
+				data_src->mem_snoop = PERF_MEM_SNOOP_NONE;
+		}
 	}
 
 	if (record->type & ARM_SPE_REMOTE_ACCESS)
 		data_src->mem_remote = PERF_MEM_REMOTE_REMOTE;
 }
 
-static bool arm_spe__synth_ds(struct arm_spe_queue *speq,
+static void arm_spe__synth_ds(struct arm_spe_queue *speq,
 			      const struct arm_spe_record *record,
 			      union perf_mem_data_src *data_src)
 {
@@ -961,19 +975,18 @@ static bool arm_spe__synth_ds(struct arm_spe_queue *speq,
 	} else {
 		metadata = arm_spe__get_metadata_by_cpu(spe, speq->cpu);
 		if (!metadata)
-			return false;
+			return;
 
 		midr = metadata[ARM_SPE_CPU_MIDR];
 	}
 
 	for (i = 0; i < ARRAY_SIZE(data_source_handles); i++) {
 		if (is_midr_in_range_list(midr, data_source_handles[i].midr_ranges)) {
-			data_source_handles[i].ds_synth(record, data_src);
-			return true;
+			return data_source_handles[i].ds_synth(record, data_src);
 		}
 	}
 
-	return false;
+	return;
 }
 
 static u64 arm_spe__synth_data_source(struct arm_spe_queue *speq,
@@ -992,8 +1005,8 @@ static u64 arm_spe__synth_data_source(struct arm_spe_queue *speq,
 	else
 		return 0;
 
-	if (!arm_spe__synth_ds(speq, record, &data_src))
-		arm_spe__synth_memory_level(speq, record, &data_src);
+	arm_spe__synth_ds(speq, record, &data_src);
+	arm_spe__synth_memory_level(speq, record, &data_src);
 
 	if (record->type & (ARM_SPE_TLB_ACCESS | ARM_SPE_TLB_MISS)) {
 		data_src.mem_dtlb = PERF_MEM_TLB_WK;

-- 
2.34.1


