Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0026BCAC582
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 15:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QTJdpddCk9BmTY3+NaWXDYkYrx2oOcH+GpuOFCa6sTE=; b=YSdPm8dOYEeb2Y2tXAcC73xBRA
	UmkaHSMlc6+vNgDu8SbSbfh46vilh2wWE1joQWyjgCMl/okIzDbKQtB9JJ53XRWqVm9WasBoxMmRJ
	7wHTXzA8S3pAESLe6YTLog8gpnOzdUxrO3rJpLIujtXjyL5UUCo9atC8S98Iwhao/TxZxH9gJo19J
	8UJ42LuTT8ac0BRtN1ksBwAf52mB0LWPau9XcB6zbNfxSsBcrMgPMfEIOfQoyG6Fc6ROPSY+eJg83
	xhgznYfjaTMoBUO9EFgO088iwMUyIDkyGm5uxJGL9laBFExIWruhduOrhg/Uo6z1IUIkwvUIMxDCK
	UOWGAlgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux5vi-0000000ALLj-0bI6;
	Fri, 12 Sep 2025 15:43:18 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux5vb-0000000ALCl-2Flu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 15:43:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AC7131A25;
	Fri, 12 Sep 2025 08:43:02 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EACD43F694;
	Fri, 12 Sep 2025 08:43:08 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 12 Sep 2025 16:42:18 +0100
Subject: [PATCH v5 13/14] perf arm_spe: Set HITM flag
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250912-arm_spe_support_hitm_overhead_v1_public-v5-13-0800880da0a7@arm.com>
References: <20250912-arm_spe_support_hitm_overhead_v1_public-v5-0-0800880da0a7@arm.com>
In-Reply-To: <20250912-arm_spe_support_hitm_overhead_v1_public-v5-0-0800880da0a7@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757691759; l=3698;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=ON2/9YnAdEDqUoo8kuk+zKWqe1rVAcJ/TqrxBuYfQfA=;
 b=e2ddGXFXmZENyicKxeRKvDXwnYnHQPLjTWJOEYkhIXska41dJwqnkOr2dNX/BaSpXY+JlpCLi
 FSDabXuABorAtbar8XjAnYbXyi01M75X3BIXfiAXNzg7gw7v+bw2ms9
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_084311_681230_B6A1A76F 
X-CRM114-Status: GOOD (  17.46  )
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

Since FEAT_SPEv1p4, Arm SPE provides extra two events "Cache data
modified" and "Data snooped".

Set the snoop mode as:

- If both the "Cache data modified" event and the "Data snooped" event
  are set, which indicates a load operation that snooped from a outside
  cache and hit a modified copy, set the HITM flag to inspect false
  sharing.
- If the snooped event bit is not set, and the snooped event has been
  supported by the hardware, set as NONE mode (no snoop operation).
- If the snooped event bit is not set, and the event is not supported or
  absent the events info in the meta data, set as NA mode (not
  available).

Don't set any mode for only "Cache data modified" event, as it hits a
local modified copy.

Reviewed-by: James Clark <james.clark@linaro.org>
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 tools/perf/util/arm-spe-decoder/arm-spe-decoder.h |  2 ++
 tools/perf/util/arm-spe.c                         | 26 +++++++++++++++++++++--
 2 files changed, 26 insertions(+), 2 deletions(-)

diff --git a/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h b/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h
index 3afa8703b21db9d231eef93fe981e0c20d562e83..fbb57f8052371e51d562d9dd6098e97fc099461c 100644
--- a/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h
+++ b/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h
@@ -28,6 +28,8 @@
 #define ARM_SPE_L2D_ACCESS		BIT(EV_L2D_ACCESS)
 #define ARM_SPE_L2D_MISS		BIT(EV_L2D_MISS)
 #define ARM_SPE_RECENTLY_FETCHED	BIT(EV_RECENTLY_FETCHED)
+#define ARM_SPE_DATA_SNOOPED		BIT(EV_DATA_SNOOPED)
+#define ARM_SPE_HITM			BIT(EV_CACHE_DATA_MODIFIED)
 
 enum arm_spe_op_type {
 	/* First level operation type */
diff --git a/tools/perf/util/arm-spe.c b/tools/perf/util/arm-spe.c
index 58f80b5c0ab969448c962adb31abde5067cf4be3..08cb493c3265ade3093c84a90fa5e47dcd77c8f1 100644
--- a/tools/perf/util/arm-spe.c
+++ b/tools/perf/util/arm-spe.c
@@ -894,9 +894,12 @@ static void arm_spe__synth_st_memory_level(const struct arm_spe_record *record,
 	}
 }
 
-static void arm_spe__synth_memory_level(const struct arm_spe_record *record,
+static void arm_spe__synth_memory_level(struct arm_spe_queue *speq,
+					const struct arm_spe_record *record,
 					union perf_mem_data_src *data_src)
 {
+	struct arm_spe *spe = speq->spe;
+
 	if (data_src->mem_op == PERF_MEM_OP_LOAD)
 		arm_spe__synth_ld_memory_level(record, data_src);
 	if (data_src->mem_op == PERF_MEM_OP_STORE)
@@ -907,6 +910,25 @@ static void arm_spe__synth_memory_level(const struct arm_spe_record *record,
 		data_src->mem_lvl_num = PERF_MEM_LVLNUM_NA;
 	}
 
+	if (record->type & ARM_SPE_DATA_SNOOPED) {
+		if (record->type & ARM_SPE_HITM)
+			data_src->mem_snoop = PERF_MEM_SNOOP_HITM;
+		else
+			data_src->mem_snoop = PERF_MEM_SNOOP_HIT;
+	} else {
+		u64 *metadata = arm_spe__get_metadata_by_cpu(spe, speq->cpu);
+
+		/*
+		 * Set NA ("Not available") mode if no meta data or the
+		 * SNOOPED event is not supported.
+		 */
+		if (!metadata ||
+		    !(metadata[ARM_SPE_CAP_EVENT_FILTER] & ARM_SPE_DATA_SNOOPED))
+			data_src->mem_snoop = PERF_MEM_SNOOP_NA;
+		else
+			data_src->mem_snoop = PERF_MEM_SNOOP_NONE;
+	}
+
 	if (record->type & ARM_SPE_REMOTE_ACCESS)
 		data_src->mem_remote = PERF_MEM_REMOTE_REMOTE;
 }
@@ -963,7 +985,7 @@ arm_spe__synth_data_source(struct arm_spe_queue *speq,
 		return data_src;
 
 	if (!arm_spe__synth_ds(speq, record, &data_src))
-		arm_spe__synth_memory_level(record, &data_src);
+		arm_spe__synth_memory_level(speq, record, &data_src);
 
 	if (record->type & (ARM_SPE_TLB_ACCESS | ARM_SPE_TLB_MISS)) {
 		data_src.mem_dtlb = PERF_MEM_TLB_WK;

-- 
2.34.1


