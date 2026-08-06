Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9272C56208
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 13:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9MvHu1Pl2ssBHzhmhTZmBr2JBtolR+FQT5i70MkMUxQ=; b=2CdAODaW7EukkntqnmlFdFLWwM
	/Wwdh1cI7tmFHv+xYX4yX5Ujfz6qIxd4sfi1fWrymI4KIaWbH3TL4YgB00rcFSqamLkPYIpzeoMhH
	0U2hqugTZ9wPQPnMm/xfao63shUqjNhMzGsdHSYmDSixSKYKJvXByDiuBXEafQtXGdoYd+KoU74uN
	p1opIG4XscqZtbMPJNfCpzhbIF07fboLtvWJaRAO9Ih0gzglXifUV57fOb4akrm04IaL1VrD4mViU
	teS+aD8X+T2uic2QXWk30vXbuAyt4DiEWCB/jcDAG1ljue6YTAjgNaaSK02cqjMrkUsxsi28Edlgi
	T4DiZBfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wryXI-00000005wYB-0Ivh;
	Thu, 06 Aug 2026 13:53:28 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wryXH-00000005wXz-1gme
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 13:53:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D356A60A99;
	Thu,  6 Aug 2026 13:53:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 556B71F000E9;
	Thu,  6 Aug 2026 13:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786024406;
	bh=9MvHu1Pl2ssBHzhmhTZmBr2JBtolR+FQT5i70MkMUxQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Vp2tN+o31EsdMyor7sYZoPaRvifAaVI0ng6axlV+D3HQZ87rBtnUL8FxPgESR/eDI
	 9fdM4SQ9ACgkezeHcW04FMFaql9Kc9HS9j98nmY02HT4aq4BjB+azty6HJ0TC8viGH
	 OHTurSNVGbLVxdOrIS0VEo/JvBDtm0nkMTyC0shIJqgDSgYYJaIm25iiVUAINwwHhL
	 8/3ZF10KVCp7Yp1PtMbSSe2DjxVAh69HMDlAyvLHou2ejEHUOA0nZju/1D6F8G8ZMp
	 Yfwt98mBfhcbk0xLoPkLu79bZhedv0iXd+GbPj0i1ykSn9dMI065p8MR7Nh2NWn0n+
	 dXYvxhXgj8iZw==
From: Puranjay Mohan <puranjay@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>
Cc: Puranjay Mohan <puranjay@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	James Clark <james.clark@linaro.org>,
	Usama Arif <usama.arif@linux.dev>,
	Will Deacon <will@kernel.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Ravi Bangoria <ravi.bangoria@amd.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	x86@kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 3/3] perf/core: Clear the whole branch entry in perf_clear_branch_entry()
Date: Thu,  6 Aug 2026 06:52:23 -0700
Message-ID: <20260806135224.3267890-4-puranjay@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260806135224.3267890-1-puranjay@kernel.org>
References: <20260806135224.3267890-1-puranjay@kernel.org>
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

perf_clear_branch_entry_bitfields() clears the bitfields of struct
perf_branch_entry one by one and leaves from/to alone, since callers
overwrite those straight away. The list has to be kept in sync with the
struct by hand and has already fallen behind: new_type and priv were
added to perf_branch_entry and never added here.

Only BRBE writes those two, and neither is written for every record.
brbe_set_perf_entry_type() leaves new_type alone for a branch type it
does not recognise, and priv is not set for source-only records.
arm_pmuv3.c allocates the per-CPU branch stack with kmalloc(), so such a
record carries whatever the slot held: uninitialised kmalloc() data on
the first pass over the buffer, the previous record's values after that.
Both reach userspace through the branch stack. Nothing under
arch/x86/events/ writes either field, so x86 is unaffected.

Clear the entry with a single struct assignment instead:

	*br = (struct perf_branch_entry){ };

The bitfields add up to exactly 64 bits, so there is no padding, and
every caller assigns from/to immediately afterwards, so zeroing those as
well changes nothing. PERF_BR_SPEC_NA is 0, so dropping the explicit
spec assignment leaves the behaviour unchanged. Nothing needs keeping in
sync when a field is added.

The helper no longer touches only bitfields, so rename it to
perf_clear_branch_entry().

Fixes: b190bc4ac9e6 ("perf: Extend branch type classification")
Fixes: 5402d25aa571 ("perf: Capture branch privilege information")
Suggested-by: James Clark <james.clark@linaro.org>
Reviewed-by: James Clark <james.clark@linaro.org>
Acked-by: Usama Arif <usama.arif@linux.dev>
Signed-off-by: Puranjay Mohan <puranjay@kernel.org>
---
 arch/x86/events/amd/brs.c   |  2 +-
 arch/x86/events/amd/lbr.c   |  2 +-
 arch/x86/events/intel/lbr.c |  6 +++---
 drivers/perf/arm_brbe.c     |  2 +-
 include/linux/perf_event.h  | 16 ++--------------
 5 files changed, 8 insertions(+), 20 deletions(-)

diff --git a/arch/x86/events/amd/brs.c b/arch/x86/events/amd/brs.c
index 06f35a6b58a5b..68c5f42965e91 100644
--- a/arch/x86/events/amd/brs.c
+++ b/arch/x86/events/amd/brs.c
@@ -343,7 +343,7 @@ void amd_brs_drain(void)
 
 		rdmsrq(brs_from(brs_idx), from);
 
-		perf_clear_branch_entry_bitfields(br+nr);
+		perf_clear_branch_entry(br + nr);
 
 		br[nr].from = from;
 		br[nr].to   = to;
diff --git a/arch/x86/events/amd/lbr.c b/arch/x86/events/amd/lbr.c
index 5b437dc8e4ce2..3639817456119 100644
--- a/arch/x86/events/amd/lbr.c
+++ b/arch/x86/events/amd/lbr.c
@@ -183,7 +183,7 @@ void amd_pmu_lbr_read(void)
 		    entry.to.split.reserved)
 			continue;
 
-		perf_clear_branch_entry_bitfields(br + out);
+		perf_clear_branch_entry(br + out);
 
 		br[out].from	= sign_ext_branch_ip(entry.from.split.ip);
 		br[out].to	= sign_ext_branch_ip(entry.to.split.ip);
diff --git a/arch/x86/events/intel/lbr.c b/arch/x86/events/intel/lbr.c
index f8fadb0b16a45..6541c7046c2b3 100644
--- a/arch/x86/events/intel/lbr.c
+++ b/arch/x86/events/intel/lbr.c
@@ -756,7 +756,7 @@ void intel_pmu_lbr_read_32(struct cpu_hw_events *cpuc)
 
 		rdmsrq(x86_pmu.lbr_from + lbr_idx, msr_lastbranch.lbr);
 
-		perf_clear_branch_entry_bitfields(br);
+		perf_clear_branch_entry(br);
 
 		br->from	= msr_lastbranch.from;
 		br->to		= msr_lastbranch.to;
@@ -847,7 +847,7 @@ void intel_pmu_lbr_read_64(struct cpu_hw_events *cpuc)
 		if (abort && x86_pmu.lbr_double_abort && out > 0)
 			out--;
 
-		perf_clear_branch_entry_bitfields(br+out);
+		perf_clear_branch_entry(br + out);
 		br[out].from	 = from;
 		br[out].to	 = to;
 		br[out].mispred	 = mis;
@@ -921,7 +921,7 @@ static void intel_pmu_store_lbr(struct cpu_hw_events *cpuc,
 		to = rdlbr_to(i, lbr);
 		info = rdlbr_info(i, lbr);
 
-		perf_clear_branch_entry_bitfields(e);
+		perf_clear_branch_entry(e);
 
 		e->from		= from;
 		e->to		= to;
diff --git a/drivers/perf/arm_brbe.c b/drivers/perf/arm_brbe.c
index ba554e0c846c4..effbdeacfcbb3 100644
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
index 48d851fbd8ea5..e034be4a473a8 100644
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


