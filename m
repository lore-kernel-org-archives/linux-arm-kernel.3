Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86829CD98E1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 15:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+VVoEj6gKLm6QpDzoKPZEs8KuFBJW/1u5UDllJ4ILPs=; b=EEBP7tmvgoZrrS+uJFS6YalDyu
	1FLANQHT9vvderCX/Hg4R1lPjP/btYfmyIG/konyJGsFRDyQ37JFId8987I15UsCshHZ+J8O4114q
	IMTSA/MAzYoieJw6ienY8O3PKO4Rlcyp7O+7Vc3CiybiHRJ+JMVBsTZ38tE4zVuQMw/3GvH4lwaBW
	Za7U3qSBpN8h2SYlvnvSAFfhW9MTjD3i96c18FJKOIpLLgJumzXUkseCw+Xol3SeU3H/3eAT+zf2q
	QCVKzcgqoeR9JvTpItdX2GV8LoXw//BVcLVx3Omuo238Hx2hAPqxtovcq8YTjFu0jJMgN22jMoJhc
	AaSw8G1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZWAY-0000000G3cs-3wCV;
	Tue, 16 Jun 2026 15:57:42 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZWAV-0000000G3bf-295K
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Jun 2026 15:57:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D93F143983;
	Tue, 16 Jun 2026 15:57:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E2B81F00A3A;
	Tue, 16 Jun 2026 15:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781625458;
	bh=+VVoEj6gKLm6QpDzoKPZEs8KuFBJW/1u5UDllJ4ILPs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=g3MFfWnbbjmGUc3L793M2E9oL6Z2upxdxulI4iWXaWHZu6RksYYoKjmGSp+2GqfSy
	 cgFTdz9frDYcnMdcAtgpWTvoBl0VQGnLnXhIsNC3lJo4hgByeJe7UMBCqtI2/aA5O7
	 x51vWyjKqZthh0Oz6+ar5ipR5H0vXOr53neW+RVSU0MvfWJKSxhXzODdJHIj5yLI7o
	 ZxyVRLzixfwVnB8PZZevUGQ4L7xo/1tyBESPqKSrznvTVnH/rgfIXUs3t/6XngyqW8
	 IjhV5pqJcZ964PznEce84RdsNKWtl+4VQMfb8vQPsURaApZMx4ietWNOIk/1XgMQ9o
	 0wdLO3Ihu/qog==
From: Puranjay Mohan <puranjay@kernel.org>
To: bpf@vger.kernel.org
Cc: Puranjay Mohan <puranjay@kernel.org>,
	Puranjay Mohan <puranjay12@gmail.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	John Fastabend <john.fastabend@gmail.com>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
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
Subject: [PATCH v5 2/4] perf/core: Clear the whole branch entry in perf_clear_branch_entry()
Date: Tue, 16 Jun 2026 08:57:07 -0700
Message-ID: <20260616155716.2631508-3-puranjay@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260616155716.2631508-1-puranjay@kernel.org>
References: <20260616155716.2631508-1-puranjay@kernel.org>
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

perf_clear_branch_entry_bitfields() resets the bitfields of struct
perf_branch_entry one at a time and deliberately leaves from/to alone,
since callers overwrite those immediately. The list of assignments has to
be kept in sync with the struct by hand, and it has already drifted:
new_type and priv were added to perf_branch_entry but never cleared here,
so stale values can leak into the records handed to userspace.

Clear the entry with a single struct assignment instead:

	*br = (struct perf_branch_entry){ };

Every caller writes from/to right after the clear, so zeroing them as well
is harmless and the dead stores are elided on the x86 LBR read paths.
There is no longer anything to keep in sync when a field is added.

The helper no longer touches only the bitfields, so rename it to
perf_clear_branch_entry() and update the callers, fixing up the
br+nr/br+out spacing on the touched lines while at it.

Fixes: b190bc4ac9e6 ("perf: Extend branch type classification")
Fixes: 5402d25aa571 ("perf: Capture branch privilege information")
Suggested-by: James Clark <james.clark@linaro.org>
Signed-off-by: Puranjay Mohan <puranjay@kernel.org>
---
 arch/x86/events/amd/brs.c   |  2 +-
 arch/x86/events/amd/lbr.c   |  2 +-
 arch/x86/events/intel/lbr.c |  6 +++---
 drivers/perf/arm_brbe.c     |  2 +-
 include/linux/perf_event.h  | 16 ++--------------
 5 files changed, 8 insertions(+), 20 deletions(-)

diff --git a/arch/x86/events/amd/brs.c b/arch/x86/events/amd/brs.c
index 06f35a6b58a5..68c5f42965e9 100644
--- a/arch/x86/events/amd/brs.c
+++ b/arch/x86/events/amd/brs.c
@@ -343,7 +343,7 @@ void amd_brs_drain(void)
 
 		rdmsrq(brs_from(brs_idx), from);
 
-		perf_clear_branch_entry_bitfields(br+nr);
+		perf_clear_branch_entry(br + nr);
 
 		br[nr].from = from;
 		br[nr].to   = to;
diff --git a/arch/x86/events/amd/lbr.c b/arch/x86/events/amd/lbr.c
index d24da377df77..08401fd60585 100644
--- a/arch/x86/events/amd/lbr.c
+++ b/arch/x86/events/amd/lbr.c
@@ -181,7 +181,7 @@ void amd_pmu_lbr_read(void)
 		    entry.to.split.reserved)
 			continue;
 
-		perf_clear_branch_entry_bitfields(br + out);
+		perf_clear_branch_entry(br + out);
 
 		br[out].from	= sign_ext_branch_ip(entry.from.split.ip);
 		br[out].to	= sign_ext_branch_ip(entry.to.split.ip);
diff --git a/arch/x86/events/intel/lbr.c b/arch/x86/events/intel/lbr.c
index 72f2adcda7c6..295da179fa74 100644
--- a/arch/x86/events/intel/lbr.c
+++ b/arch/x86/events/intel/lbr.c
@@ -755,7 +755,7 @@ void intel_pmu_lbr_read_32(struct cpu_hw_events *cpuc)
 
 		rdmsrq(x86_pmu.lbr_from + lbr_idx, msr_lastbranch.lbr);
 
-		perf_clear_branch_entry_bitfields(br);
+		perf_clear_branch_entry(br);
 
 		br->from	= msr_lastbranch.from;
 		br->to		= msr_lastbranch.to;
@@ -846,7 +846,7 @@ void intel_pmu_lbr_read_64(struct cpu_hw_events *cpuc)
 		if (abort && x86_pmu.lbr_double_abort && out > 0)
 			out--;
 
-		perf_clear_branch_entry_bitfields(br+out);
+		perf_clear_branch_entry(br + out);
 		br[out].from	 = from;
 		br[out].to	 = to;
 		br[out].mispred	 = mis;
@@ -920,7 +920,7 @@ static void intel_pmu_store_lbr(struct cpu_hw_events *cpuc,
 		to = rdlbr_to(i, lbr);
 		info = rdlbr_info(i, lbr);
 
-		perf_clear_branch_entry_bitfields(e);
+		perf_clear_branch_entry(e);
 
 		e->from		= from;
 		e->to		= to;
diff --git a/drivers/perf/arm_brbe.c b/drivers/perf/arm_brbe.c
index ba554e0c846c..effbdeacfcbb 100644
--- a/drivers/perf/arm_brbe.c
+++ b/drivers/perf/arm_brbe.c
@@ -604,7 +604,7 @@ static bool perf_entry_from_brbe_regset(int index, struct perf_branch_entry *ent
 		return false;
 
 	brbinf = bregs.brbinf;
-	perf_clear_branch_entry_bitfields(entry);
+	perf_clear_branch_entry(entry);
 	if (brbe_record_is_complete(brbinf)) {
 		entry->from = bregs.brbsrc;
 		entry->to = bregs.brbtgt;
diff --git a/include/linux/perf_event.h b/include/linux/perf_event.h
index 48d851fbd8ea..e034be4a473a 100644
--- a/include/linux/perf_event.h
+++ b/include/linux/perf_event.h
@@ -1467,21 +1467,9 @@ static inline u32 perf_sample_data_size(struct perf_sample_data *data,
 	return size;
 }
 
-/*
- * Clear all bitfields in the perf_branch_entry.
- * The to and from fields are not cleared because they are
- * systematically modified by caller.
- */
-static inline void perf_clear_branch_entry_bitfields(struct perf_branch_entry *br)
+static inline void perf_clear_branch_entry(struct perf_branch_entry *br)
 {
-	br->mispred	= 0;
-	br->predicted	= 0;
-	br->in_tx	= 0;
-	br->abort	= 0;
-	br->cycles	= 0;
-	br->type	= 0;
-	br->spec	= PERF_BR_SPEC_NA;
-	br->reserved	= 0;
+	*br = (struct perf_branch_entry){ };
 }
 
 extern void perf_output_sample(struct perf_output_handle *handle,
-- 
2.53.0-Meta


