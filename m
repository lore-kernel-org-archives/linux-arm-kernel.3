Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B9F5CDC16B
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 11:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8A8ELLNrWq+oO6vgYKp30QM7S/LZirGlTjIFSPE7w/8=; b=2ljTeNT9V81vsU5u1IwX86HaKv
	OCtRtvXFVUN/1ZStKghV9fo1R0aAsc/0HMBMcWpRdcntLM3ncHP9vaqWE/HJZe+Ldxv7ehOGI6IIh
	ooUmoa5pAuLMA+j9DS25dSfE8lzyPUmYFg4ajk74BQQa5eoO0LwIuSAQS06zYtiNbL7kMZq6Yvjb+
	qp6Oz4I3AoLjDP5o1HDdMdrzB+vqKCLVQUonmyKVagy5I3F6V/cTP0iCdwUokZnf2wQAlDmRu4HfI
	onL87WDdxc5P9jhwObanM32cd3HmNg0WiPNdGdrvjHrk03N0Z8M+myESTKTyg5QAAlB4ROu/AR4yW
	Gwhn+b4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd5gs-0000000Cvz8-2Q5t;
	Tue, 06 Jan 2026 11:57:34 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd5gq-0000000Cvw2-0vMY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 11:57:33 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ED47B497;
	Tue,  6 Jan 2026 03:57:24 -0800 (PST)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9D8FA3F5A1;
	Tue,  6 Jan 2026 03:57:29 -0800 (PST)
From: Leo Yan <leo.yan@arm.com>
Date: Tue, 06 Jan 2026 11:56:51 +0000
Subject: [PATCH v4 6/8] perf sort: Sort disabled and full predicated flags
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260106-perf_support_arm_spev1-3-v4-6-bb2d143b3860@arm.com>
References: <20260106-perf_support_arm_spev1-3-v4-0-bb2d143b3860@arm.com>
In-Reply-To: <20260106-perf_support_arm_spev1-3-v4-0-bb2d143b3860@arm.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
 Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
 James Clark <james.clark@linaro.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Arnaldo Carvalho de Melo <acme@redhat.com>, 
 linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767700634; l=2803;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=OlYIb8cc4V9RmgLF3Zyiwupb6WwcLfvDpHSGDNTzc3A=;
 b=YOwoCLpBqU43lDpyl3Ju8+ZQeyZIlTD+KPvRhY/54roDCLWK5CgDRhepLAEtYawUM9AGT+DTs
 VPDDufTUA1GDR5j+cXPYun6kbEJ26pzW0kyLvcMLdc8ltAHwKjvUgTI
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_035732_383592_B392F69F 
X-CRM114-Status: GOOD (  13.52  )
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

According to the Arm ARM (ARM DDI 0487, L.a), section D18.2.6
"Events packet", apart from the empty predicate and partial
predicates, an SVE or SME operation can be predicate-disabled
or full predicated.

To provide complete results, introduce two predicate types for
these cases.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 tools/perf/util/sample.h | 13 +++++++++----
 tools/perf/util/sort.c   | 15 ++++++++++-----
 2 files changed, 19 insertions(+), 9 deletions(-)

diff --git a/tools/perf/util/sample.h b/tools/perf/util/sample.h
index 504256474f22fa8ec647429d182a6d04f8d05c39..c0ba8dc6c055597e6b01c28eab7178d5c2b3c3ed 100644
--- a/tools/perf/util/sample.h
+++ b/tools/perf/util/sample.h
@@ -68,8 +68,8 @@ struct aux_sample {
 
 struct simd_flags {
 	u8	arch:  2,	/* architecture (isa) */
-		pred:  2,	/* predication */
-		resv:  4;	/* reserved */
+		pred:  3,	/* predication */
+		resv:  3;	/* reserved */
 };
 
 /* simd architecture flags */
@@ -81,8 +81,13 @@ enum simd_op_flags {
 };
 
 /* simd predicate flags */
-#define SIMD_OP_FLAGS_PRED_PARTIAL	0x01	/* partial predicate */
-#define SIMD_OP_FLAGS_PRED_EMPTY	0x02	/* empty predicate */
+enum simd_pred_flags {
+	SIMD_OP_FLAGS_PRED_NONE = 0x0,	/* Not available */
+	SIMD_OP_FLAGS_PRED_PARTIAL,	/* partial predicate */
+	SIMD_OP_FLAGS_PRED_EMPTY,	/* empty predicate */
+	SIMD_OP_FLAGS_PRED_FULL,	/* full predicate */
+	SIMD_OP_FLAGS_PRED_DISABLED,	/* disabled predicate */
+};
 
 struct perf_sample {
 	u64 ip;
diff --git a/tools/perf/util/sort.c b/tools/perf/util/sort.c
index e8f793eed33f78b7688b3f949e8254cbb64c3709..72ad35559bc2ff89ba65208bb18d4db3224be034 100644
--- a/tools/perf/util/sort.c
+++ b/tools/perf/util/sort.c
@@ -207,18 +207,23 @@ static int hist_entry__simd_snprintf(struct hist_entry *he, char *bf,
 				     size_t size, unsigned int width __maybe_unused)
 {
 	const char *name;
+	const char *pred_str = ".";
 
 	if (!he->simd_flags.arch)
 		return repsep_snprintf(bf, size, "");
 
 	name = hist_entry__get_simd_name(&he->simd_flags);
 
-	if (he->simd_flags.pred & SIMD_OP_FLAGS_PRED_EMPTY)
-		return repsep_snprintf(bf, size, "[e] %s", name);
-	else if (he->simd_flags.pred & SIMD_OP_FLAGS_PRED_PARTIAL)
-		return repsep_snprintf(bf, size, "[p] %s", name);
+	if (he->simd_flags.pred == SIMD_OP_FLAGS_PRED_EMPTY)
+		pred_str = "e";
+	else if (he->simd_flags.pred == SIMD_OP_FLAGS_PRED_PARTIAL)
+		pred_str = "p";
+	else if (he->simd_flags.pred == SIMD_OP_FLAGS_PRED_DISABLED)
+		pred_str = "d";
+	else if (he->simd_flags.pred == SIMD_OP_FLAGS_PRED_FULL)
+		pred_str = "f";
 
-	return repsep_snprintf(bf, size, "[.] %s", name);
+	return repsep_snprintf(bf, size, "[%s] %s", pred_str, name);
 }
 
 struct sort_entry sort_simd = {

-- 
2.34.1


