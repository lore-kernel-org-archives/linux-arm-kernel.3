Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24902C5B56D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 16:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lXRCN/qYZW99d3FlFsEXKteX6xTS2JbUH2gWTWpXWFQ=; b=iSyfTWQf7ec2cIlP0u4NM6CSAi
	BscTvgTuDpbrNMZtsYlQrN9Ek0pLfwJFjqGJaSDZ0gSK61iejVu/u1+MZ9gyy+I2PVtaBejqyLyW9
	hrP1i9ZvOnKpNLTDWVvqQvnDTcAOGSKvPz6OnuJML4KYHsLzKi0f/nuuQq4xiUt9kTkSuFn0Y8L6n
	LrbxRw+K4SQOMiyMQjnP9uI3czmkewPeph46eGRU0Iob+tXtGCT3K5zH4SQTfKiw8/R8zuci43YXo
	dNr6d918R+kybEZQw7Tzasa9ztrYN9hc9Kcy6QwRQ1emrxw4RDveNsOqbtVQwZjEOte53OJzowQna
	E/TLBSNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtT9R-0000000CRK1-3FlU;
	Mon, 10 Aug 2026 16:47:01 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtT9Q-0000000CRIq-0OpH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 16:47:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 855A843F72;
	Mon, 10 Aug 2026 16:46:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FAA51F00A3D;
	Mon, 10 Aug 2026 16:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786380419;
	bh=lXRCN/qYZW99d3FlFsEXKteX6xTS2JbUH2gWTWpXWFQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=n/C2h29y/UAVYyqoIvkDbqqEvGJ1HVcB141+KOkPsOmi0AcuGMqp23Mn74bdwqj8M
	 6KUaNNHIQYinALlzy6qrmFmEMayQ8eANVEHpjDObcNDJYY/S6AENvT46+YSJogT/yY
	 gq3SecBIXhAqzIvXesJ9BneBe0GDTHr540w7mJhEyoAIwB4kLMqgtQ8CYpYKxqZ/Wm
	 L3H1tyvHCKdZyhpqP7p3wvT+6qsRkxsMphDXEeMdhcI5x9ICdVlwpjQqXes322CF/d
	 r9tj5oJIN831Vnc4p13QOEVbub3VPSQNv99TSaOfH+xd8nWvS2in8L36srg3gVKdAi
	 W4QtAG3/4jIKw==
From: Puranjay Mohan <puranjay@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>
Cc: Puranjay Mohan <puranjay@kernel.org>,
	bpf@vger.kernel.org,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Puranjay Mohan <puranjay12@gmail.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	John Fastabend <john.fastabend@gmail.com>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Leo Yan <leo.yan@arm.com>,
	Rob Herring <robh@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	James Clark <james.clark@linaro.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Shuah Khan <shuah@kernel.org>,
	Breno Leitao <leitao@debian.org>,
	Ravi Bangoria <ravi.bangoria@amd.com>,
	Stephane Eranian <eranian@google.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Usama Arif <usama.arif@linux.dev>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com
Subject: [PATCH v6 2/3] perf/arm64: Add BRBE support for bpf_get_branch_snapshot()
Date: Mon, 10 Aug 2026 09:46:19 -0700
Message-ID: <20260810164622.1829843-3-puranjay@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260810164622.1829843-1-puranjay@kernel.org>
References: <20260810164622.1829843-1-puranjay@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Implement the perf_snapshot_branch_stack static call for BRBE.

brbe_enable() and brbe_disable() run from the overflow interrupt and the
add/remove IPIs, so the snapshot masks exceptions before sampling BRBE
state. It pauses BRBE next, with trace_hardirqs_off() and the read after
that so neither evicts a record. valid_brbe_version() runs before the
mask; the static call is only reached from BPF programs, which run with
migration disabled.

BRBFCR_EL1 is read before the pause and written back after the read, and
a freeze in between would set PAUSED behind the saved value. PMCR_EL0.E
is cleared across that window: the overflow driven conditions of Arm ARM
(DDI 0487 M.a) D19.3 need a bit in PMOVSCLR_EL0, which a stopped counter
cannot set, and RLBQZR needs BRBCR_EL1.FZPSS, which brbe_enable() leaves
clear. The counters restart only after the unpause, since a paused BRBE
cannot freeze for its own overflow handler.

Branches are missed while paused, so the buffer is invalidated before
recording resumes rather than left with a hole, and a concurrent branch
stack event loses what it had collected. BRBE that arrived frozen is left
alone; it stopped before the snapshot ran, so its records are intact and
belong to whoever froze it.

Records are read with a NULL event, which skips the per-event software
filter. The hardware filters still apply, so the caller sees the union of
the privilege and branch type filters of all active events. That matches
x86 and is acceptable because bpf_get_branch_snapshot() is only reachable
from program types already requiring CAP_BPF and CAP_PERFMON.

bpf_get_branch_snapshot() returns -ENOENT when called from a BPF program
attached to the CPU PMU's own overflow handler, since armv8pmu_stop()
zeroes BRBCR_EL1 before the handler runs.

Introduce for_each_brbe_entry() to share bank iteration between
brbe_read_filtered_entries() and the snapshot.

Signed-off-by: Puranjay Mohan <puranjay@kernel.org>
---
 drivers/perf/arm_brbe.c  | 135 +++++++++++++++++++++++++++++++--------
 drivers/perf/arm_brbe.h  |   9 +++
 drivers/perf/arm_pmuv3.c |   5 +-
 3 files changed, 121 insertions(+), 28 deletions(-)

diff --git a/drivers/perf/arm_brbe.c b/drivers/perf/arm_brbe.c
index ba554e0c846c4..9e7e69c43b17d 100644
--- a/drivers/perf/arm_brbe.c
+++ b/drivers/perf/arm_brbe.c
@@ -9,6 +9,8 @@
 #include <linux/types.h>
 #include <linux/bitmap.h>
 #include <linux/perf/arm_pmu.h>
+#include <linux/perf/arm_pmuv3.h>
+#include <asm/daifflags.h>
 #include "arm_brbe.h"
 
 #define BRBFCR_EL1_BRANCH_FILTERS (BRBFCR_EL1_DIRECT   | \
@@ -250,10 +252,13 @@ static bool valid_brbidr(u64 brbidr)
 	return valid_brbe_format(brbe_format) && valid_brbe_cc(brbe_cc) && valid_brbe_nr(brbe_nr);
 }
 
-static bool valid_brbe_version(int brbe_version)
+static __always_inline bool valid_brbe_version(void)
 {
-	return brbe_version == ID_AA64DFR0_EL1_BRBE_IMP ||
-	       brbe_version == ID_AA64DFR0_EL1_BRBE_BRBE_V1P1;
+	u64 aa64dfr0 = read_sysreg_s(SYS_ID_AA64DFR0_EL1);
+	int brbe = cpuid_feature_extract_unsigned_field(aa64dfr0, ID_AA64DFR0_EL1_BRBE_SHIFT);
+
+	return brbe == ID_AA64DFR0_EL1_BRBE_IMP ||
+	       brbe == ID_AA64DFR0_EL1_BRBE_BRBE_V1P1;
 }
 
 static void select_brbe_bank(int bank)
@@ -271,6 +276,20 @@ static void select_brbe_bank(int bank)
 	isb();
 }
 
+static inline void __brbe_advance(int *bank, int *idx, int nr_hw)
+{
+	if (++(*idx) >= BRBE_BANK_MAX_ENTRIES &&
+	    *bank * BRBE_BANK_MAX_ENTRIES + *idx < nr_hw) {
+		*idx = 0;
+		select_brbe_bank(++(*bank));
+	}
+}
+
+#define for_each_brbe_entry(idx, nr_hw)					\
+	for (int __bank = (select_brbe_bank(0), 0), idx = 0;		\
+	     __bank * BRBE_BANK_MAX_ENTRIES + idx < (nr_hw);		\
+	     __brbe_advance(&__bank, &idx, (nr_hw)))
+
 static bool __read_brbe_regset(struct brbe_regset *entry, int idx)
 {
 	entry->brbinf = get_brbinf_reg(idx);
@@ -474,11 +493,9 @@ unsigned int brbe_num_branch_records(const struct arm_pmu *armpmu)
 
 void brbe_probe(struct arm_pmu *armpmu)
 {
-	u64 brbidr, aa64dfr0 = read_sysreg_s(SYS_ID_AA64DFR0_EL1);
-	u32 brbe;
+	u64 brbidr;
 
-	brbe = cpuid_feature_extract_unsigned_field(aa64dfr0, ID_AA64DFR0_EL1_BRBE_SHIFT);
-	if (!valid_brbe_version(brbe))
+	if (!valid_brbe_version())
 		return;
 
 	brbidr = read_sysreg_s(SYS_BRBIDR0_EL1);
@@ -575,7 +592,7 @@ static void brbe_set_perf_entry_type(struct perf_branch_entry *entry, u64 brbinf
 	}
 }
 
-static int brbinf_get_perf_priv(u64 brbinf)
+static int brbinf_get_perf_priv(u64 brbinf, const struct perf_event *event)
 {
 	int brbe_el = brbinf_get_el(brbinf);
 
@@ -589,11 +606,13 @@ static int brbinf_get_perf_priv(u64 brbinf)
 			return PERF_BR_PRIV_KERNEL;
 		return PERF_BR_PRIV_HV;
 	default:
-		pr_warn_once("%d - unknown branch privilege captured\n", brbe_el);
+		if (event)
+			pr_warn_once("%d - unknown branch privilege captured\n", brbe_el);
 		return PERF_BR_PRIV_UNKNOWN;
 	}
 }
 
+/* @event is NULL for the snapshot: no software filter, and no printing. */
 static bool perf_entry_from_brbe_regset(int index, struct perf_branch_entry *entry,
 					const struct perf_event *event)
 {
@@ -618,10 +637,10 @@ static bool perf_entry_from_brbe_regset(int index, struct perf_branch_entry *ent
 
 	brbe_set_perf_entry_type(entry, brbinf);
 
-	if (!branch_sample_no_cycles(event))
+	if (!event || !branch_sample_no_cycles(event))
 		entry->cycles = brbinf_get_cycles(brbinf);
 
-	if (!branch_sample_no_flags(event)) {
+	if (!event || !branch_sample_no_flags(event)) {
 		/* Mispredict info is available for source only and complete branch records. */
 		if (!brbe_record_is_target_only(brbinf)) {
 			entry->mispred = brbinf_get_mispredict(brbinf);
@@ -633,7 +652,7 @@ static bool perf_entry_from_brbe_regset(int index, struct perf_branch_entry *ent
 		 * nor it is being supported in the kernel. Just warn here once
 		 * if TME related information shows up rather unexpectedly.
 		 */
-		if (brbinf_get_lastfailed(brbinf) || brbinf_get_in_tx(brbinf))
+		if (event && (brbinf_get_lastfailed(brbinf) || brbinf_get_in_tx(brbinf)))
 			pr_warn_once("Unknown transaction states\n");
 	}
 
@@ -642,7 +661,7 @@ static bool perf_entry_from_brbe_regset(int index, struct perf_branch_entry *ent
 	 * branch records.
 	 */
 	if (!brbe_record_is_source_only(brbinf))
-		entry->priv = brbinf_get_perf_priv(brbinf);
+		entry->priv = brbinf_get_perf_priv(brbinf, event);
 
 	return true;
 }
@@ -774,32 +793,94 @@ void brbe_read_filtered_entries(struct perf_branch_stack *branch_stack,
 {
 	struct arm_pmu *cpu_pmu = to_arm_pmu(event->pmu);
 	int nr_hw = brbe_num_branch_records(cpu_pmu);
-	int nr_banks = DIV_ROUND_UP(nr_hw, BRBE_BANK_MAX_ENTRIES);
 	int nr_filtered = 0;
 	u64 branch_sample_type = event->attr.branch_sample_type;
 	DECLARE_BITMAP(event_type_mask, PERF_BR_ARM64_MAX);
 
 	prepare_event_branch_type_mask(branch_sample_type, event_type_mask);
 
-	for (int bank = 0; bank < nr_banks; bank++) {
-		int nr_remaining = nr_hw - (bank * BRBE_BANK_MAX_ENTRIES);
-		int nr_this_bank = min(nr_remaining, BRBE_BANK_MAX_ENTRIES);
+	for_each_brbe_entry(i, nr_hw) {
+		struct perf_branch_entry *pbe = &branch_stack->entries[nr_filtered];
 
-		select_brbe_bank(bank);
+		if (!perf_entry_from_brbe_regset(i, pbe, event))
+			break;
 
-		for (int i = 0; i < nr_this_bank; i++) {
-			struct perf_branch_entry *pbe = &branch_stack->entries[nr_filtered];
+		if (!filter_branch_record(pbe, branch_sample_type, event_type_mask))
+			continue;
 
-			if (!perf_entry_from_brbe_regset(i, pbe, event))
-				goto done;
+		nr_filtered++;
+	}
 
-			if (!filter_branch_record(pbe, branch_sample_type, event_type_mask))
-				continue;
+	branch_stack->nr = nr_filtered;
+}
 
-			nr_filtered++;
+int brbe_snapshot_branch_stack(struct perf_branch_entry *entries, unsigned int cnt)
+{
+	u64 brbidr, brbfcr, brbcr, pmcr;
+	int nr_hw, nr_copied = 0;
+	bool paused_here = false;
+	unsigned long flags;
+
+	/* Called with migration disabled, so this is the CPU read below. */
+	if (!valid_brbe_version())
+		return 0;
+
+	flags = raw_local_daif_save();
+
+	brbcr = read_sysreg_s(SYS_BRBCR_EL1);
+	brbfcr = read_sysreg_s(SYS_BRBFCR_EL1);
+
+	/*
+	 * PAUSED is only ever set behind our back, so finding it set is final.
+	 * likely() keeps this inline; a taken branch costs a record.
+	 */
+	if (likely(brbcr && !(brbfcr & BRBFCR_EL1_PAUSED))) {
+		/*
+		 * Stop the counters so a freeze cannot set PAUSED behind the
+		 * value read below; the D19.3 conditions need a PMOVSCLR_EL0
+		 * bit, which a stopped counter cannot set.
+		 */
+		pmcr = read_pmcr();
+		write_pmcr(pmcr & ~ARMV8_PMU_PMCR_E);
+		isb();
+
+		brbfcr = read_sysreg_s(SYS_BRBFCR_EL1);
+		paused_here = !(brbfcr & BRBFCR_EL1_PAUSED);
+
+		write_sysreg_s(brbfcr | BRBFCR_EL1_PAUSED, SYS_BRBFCR_EL1);
+		isb();
+	}
+
+	trace_hardirqs_off();
+
+	/* Records outlive brbe_disable(). */
+	if (brbcr) {
+		brbidr = read_sysreg_s(SYS_BRBIDR0_EL1);
+		nr_hw = min_t(int, FIELD_GET(BRBIDR0_EL1_NUMREC_MASK, brbidr),
+			      BRBIDR0_EL1_NUMREC_64);
+
+		for_each_brbe_entry(i, nr_hw) {
+			if (nr_copied >= cnt)
+				break;
+
+			if (!perf_entry_from_brbe_regset(i, &entries[nr_copied], NULL))
+				break;
+
+			nr_copied++;
 		}
 	}
 
-done:
-	branch_stack->nr = nr_filtered;
+	if (paused_here) {
+		/* Branches were missed, so discard rather than leave a hole. */
+		brbe_invalidate();
+
+		/* Unpause first; a paused BRBE cannot freeze on overflow. */
+		write_sysreg_s(brbfcr, SYS_BRBFCR_EL1);
+		isb();
+		write_pmcr(pmcr);
+	}
+
+	local_daif_restore(flags);
+
+	return nr_copied;
 }
diff --git a/drivers/perf/arm_brbe.h b/drivers/perf/arm_brbe.h
index b7c7d8796c86f..0cc25737e5d49 100644
--- a/drivers/perf/arm_brbe.h
+++ b/drivers/perf/arm_brbe.h
@@ -10,6 +10,7 @@
 struct arm_pmu;
 struct perf_branch_stack;
 struct perf_event;
+struct perf_branch_entry;
 
 #ifdef CONFIG_ARM64_BRBE
 void brbe_probe(struct arm_pmu *arm_pmu);
@@ -22,6 +23,8 @@ void brbe_disable(void);
 bool brbe_branch_attr_valid(struct perf_event *event);
 void brbe_read_filtered_entries(struct perf_branch_stack *branch_stack,
 				const struct perf_event *event);
+int brbe_snapshot_branch_stack(struct perf_branch_entry *entries,
+			       unsigned int cnt);
 #else
 static inline void brbe_probe(struct arm_pmu *arm_pmu) { }
 static inline unsigned int brbe_num_branch_records(const struct arm_pmu *armpmu)
@@ -44,4 +47,10 @@ static void brbe_read_filtered_entries(struct perf_branch_stack *branch_stack,
 				       const struct perf_event *event)
 {
 }
+
+static inline int brbe_snapshot_branch_stack(struct perf_branch_entry *entries,
+					     unsigned int cnt)
+{
+	return 0;
+}
 #endif
diff --git a/drivers/perf/arm_pmuv3.c b/drivers/perf/arm_pmuv3.c
index 03359e078301f..c1afc1c5b4bc7 100644
--- a/drivers/perf/arm_pmuv3.c
+++ b/drivers/perf/arm_pmuv3.c
@@ -1495,8 +1495,11 @@ static int armv8_pmu_init(struct arm_pmu *cpu_pmu, char *name,
 	cpu_pmu->set_event_filter	= armv8pmu_set_event_filter;
 
 	cpu_pmu->pmu.event_idx		= armv8pmu_user_event_idx;
-	if (brbe_num_branch_records(cpu_pmu))
+	if (brbe_num_branch_records(cpu_pmu)) {
 		cpu_pmu->pmu.sched_task		= armv8pmu_sched_task;
+		static_call_update(perf_snapshot_branch_stack,
+				   brbe_snapshot_branch_stack);
+	}
 
 	cpu_pmu->name			= name;
 	cpu_pmu->map_event		= map_event;
-- 
2.53.0-Meta


