Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83A20CCA468
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 16:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nCyFjzihBG3VGjCH1y7iS+yoGFwKQbqEyHkikaHUV74=; b=hqr5K3hP58IQDwXzTUHhN74umV
	TYZ6x/rzXw300eXsFTLTazJ9ANHDjaI0yAbegvzH+Dc6RkZtvuR8A9dPsSmGhIX2JJ9SLNJseWxWZ
	HlV/5xch637pEh8NLP/NNQvfvfwfy9TQwxce9yoJ6oXKPTaEAGVjz76Wy4wkddH6IvGXUo+pMOfyN
	1y+xTUQLevY48uGKqu26EJpTAyOwb+G5RGx5h/SloDrjB9Poq1cx+TiiXGDeeQ8isV5usfcgAZoT2
	KEO8hDxLut0P6L0YEnvpCqQhuutKt7X1jWuZrTDesZMtnDWqxT8mU2uuDYGQL/4AGc8IOwPrrDbok
	GVbTN6fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3Gtz-000000030H5-172E;
	Mon, 29 Sep 2025 16:39:03 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3GtU-00000002zox-0XYA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Sep 2025 16:38:33 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B36FC1CC4;
	Mon, 29 Sep 2025 09:38:23 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5AF833F66E;
	Mon, 29 Sep 2025 09:38:30 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Date: Mon, 29 Sep 2025 17:37:59 +0100
Subject: [PATCH 23/25] perf sort: Sort disabled and full predicated flags
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250929-perf_support_arm_spev1-3-v1-23-1150b3c83857@arm.com>
References: <20250929-perf_support_arm_spev1-3-v1-0-1150b3c83857@arm.com>
In-Reply-To: <20250929-perf_support_arm_spev1-3-v1-0-1150b3c83857@arm.com>
To: Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
 Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
 James Clark <james.clark@linaro.org>
Cc: Arnaldo Carvalho de Melo <acme@redhat.com>, 
 linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759163872; l=2583;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=9DgUIDtSBub4xxUhrwS3IOUa2/casbTUCxqkU1V8J7s=;
 b=cDloOdTprN298IBmh/nz0Jy2ojqCsZ4xZpebZycYnvyWZ5ek0T3ElvRVexgI5Wecs97iUXA7X
 n5YYUkCGfQcALQBWLJd8nkMsLnUtk7g5KR5heBrcm9+kXBk0GtwhByY
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_093832_302911_41926F3C 
X-CRM114-Status: GOOD (  13.04  )
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
or fully predicated.

To provide reliable results, introduce two predicate types for
these cases.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 tools/perf/util/sample.h |  6 ++++--
 tools/perf/util/sort.c   | 11 ++++++++---
 2 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/tools/perf/util/sample.h b/tools/perf/util/sample.h
index 405876885e1f273c039cb67187c6e5c39c91a612..d38810021fb9d6cb29f02267ae2a223cbe55839d 100644
--- a/tools/perf/util/sample.h
+++ b/tools/perf/util/sample.h
@@ -68,8 +68,8 @@ struct aux_sample {
 
 struct simd_flags {
 	u8	arch:  3,	/* architecture (isa) */
-		pred:  2,	/* predication */
-		resv:  3;	/* reserved */
+		pred:  4,	/* predication */
+		resv:  1;	/* reserved */
 };
 
 /* simd architecture flags */
@@ -80,6 +80,8 @@ struct simd_flags {
 /* simd predicate flags */
 #define SIMD_OP_FLAGS_PRED_PARTIAL	0x01	/* partial predicate */
 #define SIMD_OP_FLAGS_PRED_EMPTY	0x02	/* empty predicate */
+#define SIMD_OP_FLAGS_PRED_FULL		0x04	/* full predicate */
+#define SIMD_OP_FLAGS_PRED_DISABLED	0x08	/* disabled predicate */
 
 struct perf_sample {
 	u64 ip;
diff --git a/tools/perf/util/sort.c b/tools/perf/util/sort.c
index c7596e9ca089c170988dbc43a00f6973039261cd..44c2d2623d529cde78ea16f281a6501c2bde9c66 100644
--- a/tools/perf/util/sort.c
+++ b/tools/perf/util/sort.c
@@ -207,6 +207,7 @@ static int hist_entry__simd_snprintf(struct hist_entry *he, char *bf,
 				     size_t size, unsigned int width __maybe_unused)
 {
 	const char *name;
+	const char *pred_str = ".";
 
 	if (!he->simd_flags.arch)
 		return repsep_snprintf(bf, size, "");
@@ -214,11 +215,15 @@ static int hist_entry__simd_snprintf(struct hist_entry *he, char *bf,
 	name = hist_entry__get_simd_name(&he->simd_flags);
 
 	if (he->simd_flags.pred & SIMD_OP_FLAGS_PRED_EMPTY)
-		return repsep_snprintf(bf, size, "[e] %s", name);
+		pred_str = "e";
 	else if (he->simd_flags.pred & SIMD_OP_FLAGS_PRED_PARTIAL)
-		return repsep_snprintf(bf, size, "[p] %s", name);
+		pred_str = "p";
+	else if (he->simd_flags.pred & SIMD_OP_FLAGS_PRED_DISABLED)
+		pred_str = "d";
+	else if (he->simd_flags.pred & SIMD_OP_FLAGS_PRED_FULL)
+		pred_str = "f";
 
-	return repsep_snprintf(bf, size, "[.] %s", name);
+	return repsep_snprintf(bf, size, "[%s] %s", pred_str, name);
 }
 
 struct sort_entry sort_simd = {

-- 
2.34.1


