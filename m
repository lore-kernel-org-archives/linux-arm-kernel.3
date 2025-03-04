Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32BF7C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 12:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V2Vnms014tBeQ2aDubgu33i9XqfLahH1ItRSe+XSTNA=; b=2l8KTVsmwyyF3Gk9JXCBebgrzt
	beub7lBjCVBQ9a6EOJEBQaejEbejT0Xo63nGQ0t9ADKRpJks1yvA1DdC8LLvLuir+adGmY8uXwNRz
	HnijP87wv4p5qOUAtFObn+Vp8RGfEDx2Le19TKBiosvTfaVRIuNYZ9ECSckkl0Bs0cQJ6/VKxVEXJ
	MDHp9NSYJQiWmgZPn+E/TqxjBdwT/hX8kEkndrV+C5uU5ywoiQ5PQCO3p37ezVVTOcffoYftM07Hq
	YBTyuAO7ESZVh96ZjLB1C7I1V8ESSQcYKC7tvVLePY7Pjofc5Bb+V50ZaLC5eeyxuOEQxssK6WnMV
	EUU8rcmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpR5e-00000004Y1d-3tLw;
	Tue, 04 Mar 2025 12:09:38 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpQDA-00000004M56-1cyZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 11:13:21 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B3E2CFEC;
	Tue,  4 Mar 2025 03:13:33 -0800 (PST)
Received: from e132581.cambridge.arm.com (e132581.arm.com [10.2.76.71])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B94B73F5A1;
	Tue,  4 Mar 2025 03:13:17 -0800 (PST)
From: Leo Yan <leo.yan@arm.com>
To: Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Ian Rogers <irogers@google.com>,
	James Clark <james.clark@linaro.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	"Liang, Kan" <kan.liang@linux.intel.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Will Deacon <will@kernel.org>,
	Mike Leach <mike.leach@linaro.org>,
	Graham Woodward <graham.woodward@arm.com>,
	Paschalis.Mpeis@arm.com,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Leo Yan <leo.yan@arm.com>
Subject: [PATCH v4 12/12] perf arm-spe: Support previous branch target (PBT) address
Date: Tue,  4 Mar 2025 11:12:40 +0000
Message-Id: <20250304111240.3378214-13-leo.yan@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250304111240.3378214-1-leo.yan@arm.com>
References: <20250304111240.3378214-1-leo.yan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_031320_517532_C2C422F9 
X-CRM114-Status: GOOD (  22.89  )
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

When FEAT_SPE_PBT is implemented, the previous branch target address
(named as PBT) before the sampled operation, will be recorded.

This commit first introduces a 'prev_br_tgt' field in the record for
saving the PBT address in the decoder.

If the current operation is a branch instruction, by combining with PBT,
it can create a chain with two consecutive branches.  As the branch
stack stores branches in descending order, meaning a newer branch is
stored in a lower entry in the stack.  Arm SPE stores the latest branch
in the first entry of branch stack, and the previous branch coming from
PBT is stored into the second entry.

Otherwise, if current operation is not a branch, the last branch will be
saved for PBT only.  PBT lacks associated information such as branch
source address, branch type, and events.  The branch entry fills zeros
for the corresponding fields and only set its target address.

After:

  perf script -f --itrace=bl -F flags,addr,brstack
  jcc                   ffff800080187914 0xffff8000801878fc/0xffff800080187914/P/-/-/1/COND/-  0x0/0xffff8000801878f8/-/-/-/0//-
  jcc                   ffff8000802d12d8 0xffff8000802d12f8/0xffff8000802d12d8/P/-/-/1/COND/-  0x0/0xffff8000802d12ec/-/-/-/0//-
  jcc                   ffff8000813fe200 0xffff8000813fe20c/0xffff8000813fe200/P/-/-/1/COND/-  0x0/0xffff8000813fe200/-/-/-/0//-
  jcc                   ffff8000813fe200 0xffff8000813fe20c/0xffff8000813fe200/P/-/-/1/COND/-  0x0/0xffff8000813fe200/-/-/-/0//-
  jmp                   ffff800081410980 0xffff800081419108/0xffff800081410980/P/-/-/1//-  0x0/0xffff800081419104/-/-/-/0//-
  return                ffff80008036e064 0xffff80008141ba84/0xffff80008036e064/P/-/-/1/RET/-  0x0/0xffff80008141ba60/-/-/-/0//-
  jcc                   ffff8000803d54f0 0xffff8000803d54e8/0xffff8000803d54f0/P/-/-/1/COND/-  0x0/0xffff8000803d54e0/-/-/-/0//-
  jmp                   ffff80008015e468 0xffff8000803d46dc/0xffff80008015e468/P/-/-/1//-  0x0/0xffff8000803d46c8/-/-/-/0//-
  jmp                   ffff8000806e2d50 0xffff80008040f710/0xffff8000806e2d50/P/-/-/1//-  0x0/0xffff80008040f6e8/-/-/-/0//-
  jcc                   ffff800080721704 0xffff8000807216b4/0xffff800080721704/P/-/-/1/COND/-  0x0/0xffff8000807216ac/-/-/-/0//-

Reviewed-by: Ian Rogers <irogers@google.com>
Reviewed-by: James Clark <james.clark@linaro.org>
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 .../util/arm-spe-decoder/arm-spe-decoder.c    |   5 +-
 .../util/arm-spe-decoder/arm-spe-decoder.h    |   1 +
 tools/perf/util/arm-spe.c                     | 114 ++++++++++--------
 3 files changed, 70 insertions(+), 50 deletions(-)

diff --git a/tools/perf/util/arm-spe-decoder/arm-spe-decoder.c b/tools/perf/util/arm-spe-decoder/arm-spe-decoder.c
index 52bd0a4ea96d..688fe6d75244 100644
--- a/tools/perf/util/arm-spe-decoder/arm-spe-decoder.c
+++ b/tools/perf/util/arm-spe-decoder/arm-spe-decoder.c
@@ -28,7 +28,8 @@ static u64 arm_spe_calc_ip(int index, u64 payload)
 
 	/* Instruction virtual address or Branch target address */
 	if (index == SPE_ADDR_PKT_HDR_INDEX_INS ||
-	    index == SPE_ADDR_PKT_HDR_INDEX_BRANCH) {
+	    index == SPE_ADDR_PKT_HDR_INDEX_BRANCH ||
+	    index == SPE_ADDR_PKT_HDR_INDEX_PREV_BRANCH) {
 		ns = SPE_ADDR_PKT_GET_NS(payload);
 		el = SPE_ADDR_PKT_GET_EL(payload);
 
@@ -181,6 +182,8 @@ static int arm_spe_read_record(struct arm_spe_decoder *decoder)
 				decoder->record.virt_addr = ip;
 			else if (idx == SPE_ADDR_PKT_HDR_INDEX_DATA_PHYS)
 				decoder->record.phys_addr = ip;
+			else if (idx == SPE_ADDR_PKT_HDR_INDEX_PREV_BRANCH)
+				decoder->record.prev_br_tgt = ip;
 			break;
 		case ARM_SPE_COUNTER:
 			if (idx == SPE_CNT_PKT_HDR_INDEX_TOTAL_LAT)
diff --git a/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h b/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h
index 85b688a97436..5d232188643b 100644
--- a/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h
+++ b/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h
@@ -89,6 +89,7 @@ struct arm_spe_record {
 	u32 latency;
 	u64 from_ip;
 	u64 to_ip;
+	u64 prev_br_tgt;
 	u64 timestamp;
 	u64 virt_addr;
 	u64 phys_addr;
diff --git a/tools/perf/util/arm-spe.c b/tools/perf/util/arm-spe.c
index ed89b7dbc244..2a9775649cc2 100644
--- a/tools/perf/util/arm-spe.c
+++ b/tools/perf/util/arm-spe.c
@@ -237,8 +237,9 @@ static struct arm_spe_queue *arm_spe__alloc_queue(struct arm_spe *spe,
 	if (spe->synth_opts.last_branch) {
 		size_t sz = sizeof(struct branch_stack);
 
-		/* Allocate one entry for TGT */
-		sz += sizeof(struct branch_entry);
+		/* Allocate up to two entries for PBT + TGT */
+		sz += sizeof(struct branch_entry) *
+			min(spe->synth_opts.last_branch_sz, 2U);
 		speq->last_branch = zalloc(sz);
 		if (!speq->last_branch)
 			goto out_free;
@@ -362,68 +363,83 @@ static void arm_spe_prep_sample(struct arm_spe *spe,
 
 static void arm_spe__prep_branch_stack(struct arm_spe_queue *speq)
 {
+	struct arm_spe *spe = speq->spe;
 	struct arm_spe_record *record = &speq->decoder->record;
 	struct branch_stack *bstack = speq->last_branch;
 	struct branch_flags *bs_flags;
+	unsigned int last_branch_sz = spe->synth_opts.last_branch_sz;
+	bool have_tgt = !!(speq->flags & PERF_IP_FLAG_BRANCH);
+	bool have_pbt = last_branch_sz >= (have_tgt + 1U) && record->prev_br_tgt;
 	size_t sz = sizeof(struct branch_stack) +
-		    sizeof(struct branch_entry) /* TGT */;
+		    sizeof(struct branch_entry) * min(last_branch_sz, 2U) /* PBT + TGT */;
+	int i = 0;
 
 	/* Clean up branch stack */
 	memset(bstack, 0x0, sz);
 
-	if (!(speq->flags & PERF_IP_FLAG_BRANCH))
+	if (!have_tgt && !have_pbt)
 		return;
 
-	bstack->entries[0].from = record->from_ip;
-	bstack->entries[0].to = record->to_ip;
+	if (have_tgt) {
+		bstack->entries[i].from = record->from_ip;
+		bstack->entries[i].to = record->to_ip;
 
-	bs_flags = &bstack->entries[0].flags;
-	bs_flags->value = 0;
+		bs_flags = &bstack->entries[i].flags;
+		bs_flags->value = 0;
 
-	if (record->op & ARM_SPE_OP_BR_CR_BL) {
-		if (record->op & ARM_SPE_OP_BR_COND)
-			bs_flags->type |= PERF_BR_COND_CALL;
-		else
-			bs_flags->type |= PERF_BR_CALL;
-	/*
-	 * Indirect branch instruction without link (e.g. BR),
-	 * take this case as function return.
-	 */
-	} else if (record->op & ARM_SPE_OP_BR_CR_RET ||
-		   record->op & ARM_SPE_OP_BR_INDIRECT) {
-		if (record->op & ARM_SPE_OP_BR_COND)
-			bs_flags->type |= PERF_BR_COND_RET;
-		else
-			bs_flags->type |= PERF_BR_RET;
-	} else if (record->op & ARM_SPE_OP_BR_CR_NON_BL_RET) {
-		if (record->op & ARM_SPE_OP_BR_COND)
-			bs_flags->type |= PERF_BR_COND;
-		else
-			bs_flags->type |= PERF_BR_UNCOND;
-	} else {
-		if (record->op & ARM_SPE_OP_BR_COND)
-			bs_flags->type |= PERF_BR_COND;
-		else
-			bs_flags->type |= PERF_BR_UNKNOWN;
-	}
+		if (record->op & ARM_SPE_OP_BR_CR_BL) {
+			if (record->op & ARM_SPE_OP_BR_COND)
+				bs_flags->type |= PERF_BR_COND_CALL;
+			else
+				bs_flags->type |= PERF_BR_CALL;
+		/*
+		 * Indirect branch instruction without link (e.g. BR),
+		 * take this case as function return.
+		 */
+		} else if (record->op & ARM_SPE_OP_BR_CR_RET ||
+			   record->op & ARM_SPE_OP_BR_INDIRECT) {
+			if (record->op & ARM_SPE_OP_BR_COND)
+				bs_flags->type |= PERF_BR_COND_RET;
+			else
+				bs_flags->type |= PERF_BR_RET;
+		} else if (record->op & ARM_SPE_OP_BR_CR_NON_BL_RET) {
+			if (record->op & ARM_SPE_OP_BR_COND)
+				bs_flags->type |= PERF_BR_COND;
+			else
+				bs_flags->type |= PERF_BR_UNCOND;
+		} else {
+			if (record->op & ARM_SPE_OP_BR_COND)
+				bs_flags->type |= PERF_BR_COND;
+			else
+				bs_flags->type |= PERF_BR_UNKNOWN;
+		}
 
-	if (record->type & ARM_SPE_BRANCH_MISS) {
-		bs_flags->mispred = 1;
-		bs_flags->predicted = 0;
-	} else {
-		bs_flags->mispred = 0;
-		bs_flags->predicted = 1;
-	}
+		if (record->type & ARM_SPE_BRANCH_MISS) {
+			bs_flags->mispred = 1;
+			bs_flags->predicted = 0;
+		} else {
+			bs_flags->mispred = 0;
+			bs_flags->predicted = 1;
+		}
+
+		if (record->type & ARM_SPE_BRANCH_NOT_TAKEN)
+			bs_flags->not_taken = 1;
 
-	if (record->type & ARM_SPE_BRANCH_NOT_TAKEN)
-		bs_flags->not_taken = 1;
+		if (record->type & ARM_SPE_IN_TXN)
+			bs_flags->in_tx = 1;
 
-	if (record->type & ARM_SPE_IN_TXN)
-		bs_flags->in_tx = 1;
+		bs_flags->cycles = min(record->latency, 0xFFFFU);
+		i++;
+	}
 
-	bs_flags->cycles = min(record->latency, 0xFFFFU);
+	if (have_pbt) {
+		bs_flags = &bstack->entries[i].flags;
+		bs_flags->type |= PERF_BR_UNKNOWN;
+		bstack->entries[i].to = record->prev_br_tgt;
+		i++;
+	}
 
-	bstack->nr = 1;
+	bstack->nr = i;
 	bstack->hw_idx = -1ULL;
 }
 
@@ -1584,8 +1600,8 @@ arm_spe_synth_events(struct arm_spe *spe, struct perf_session *session)
 	}
 
 	if (spe->synth_opts.last_branch) {
-		if (spe->synth_opts.last_branch_sz > 1)
-			pr_debug("Arm SPE supports only one bstack entry (TGT).\n");
+		if (spe->synth_opts.last_branch_sz > 2)
+			pr_debug("Arm SPE supports only two bstack entries (PBT+TGT).\n");
 
 		attr.sample_type |= PERF_SAMPLE_BRANCH_STACK;
 		/*
-- 
2.34.1


