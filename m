Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03391CDC167
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 11:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tkJsqbVlTlNV8C43fHV69qm23zpVbOOo6P+GqtRGvXA=; b=12kIXYrSiM83HII1eFZNRXjIa2
	8dvYnbER47iet+IUN1HFcQ+snYgmSNrXpOIMyDXdWIVgB+KDvkOjQUudrQ5IioZ3aJMhGTmHOVQuM
	9lHRMhZdRlZ8LRi5/o2pNIQLWr7l0LYRzTPg4S6hH43bvTgIm9JasKXY4QPunijSlGyTDRiKRKxzA
	P19Rf1vL4XDvPyZo3s5XaTuI+e6zyy7dJCuqRHusBUrsR/NLh78QYIWC7nmOAT5nbF7Ga4psoMPDU
	3oQPhY1TPTJ3JxJVVFuK2HLLe0L/ux7eMGdS0ASznl/1qFYdRwACv9vDNLoJ4gGkCLHPfrXkA3FD5
	qAWJYwlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd5gl-0000000CvsF-2ajL;
	Tue, 06 Jan 2026 11:57:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd5gj-0000000Cvqk-1pxV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 11:57:26 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 711FD1595;
	Tue,  6 Jan 2026 03:57:17 -0800 (PST)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1FD573F5A1;
	Tue,  6 Jan 2026 03:57:21 -0800 (PST)
From: Leo Yan <leo.yan@arm.com>
Date: Tue, 06 Jan 2026 11:56:48 +0000
Subject: [PATCH v4 3/8] perf mem: Print extended fields
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260106-perf_support_arm_spev1-3-v4-3-bb2d143b3860@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767700634; l=3651;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=YpHIkEb61Q+vHzzu9Oa3xZJgjbfs5yLgy28iIWMTHpc=;
 b=o4yLA4055PxzZCjcZMslTIKh0XXcWDdEYfZRpv6EnOQblKqmGfR+ASLh0bavmQkDPxjUIN8bT
 inf+DfaGxWpAcMMKV+Ekj3Fo0SGJREyWkUB7UhnSzO8fG0nTZnm87qM
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_035725_618264_78C3BA9C 
X-CRM114-Status: GOOD (  14.47  )
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

Print the extended operation types and affiliate info.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 tools/perf/util/mem-events.c | 66 ++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 60 insertions(+), 6 deletions(-)

diff --git a/tools/perf/util/mem-events.c b/tools/perf/util/mem-events.c
index 0b49fce251fcc18417cb1037075b3e406a3e6481..19d46d04de182cadbd6dfad23a7ab987cc4dcaae 100644
--- a/tools/perf/util/mem-events.c
+++ b/tools/perf/util/mem-events.c
@@ -416,11 +416,15 @@ static const char * const mem_hops[] = {
 
 static int perf_mem__op_scnprintf(char *out, size_t sz, const struct mem_info *mem_info)
 {
-	u64 op = PERF_MEM_LOCK_NA;
+	union perf_mem_data_src data_src;
+	u64 op = PERF_MEM_OP_NA, ext_op = 0;
 	int l;
 
-	if (mem_info)
-		op = mem_info__const_data_src(mem_info)->mem_op;
+	if (mem_info) {
+		data_src = *mem_info__const_data_src(mem_info);
+		op = data_src.mem_op;
+		ext_op = data_src.mem_op_ext;
+	}
 
 	if (op & PERF_MEM_OP_NA)
 		l = scnprintf(out, sz, "N/A");
@@ -435,6 +439,19 @@ static int perf_mem__op_scnprintf(char *out, size_t sz, const struct mem_info *m
 	else
 		l = scnprintf(out, sz, "No");
 
+	if (ext_op == PERF_MEM_EXT_OP_MTE_TAG)
+		l += scnprintf(out + l, sz - l, " MTE");
+	else if (ext_op == PERF_MEM_EXT_OP_NESTED_VIRT)
+		l += scnprintf(out + l, sz - l, " NV");
+	else if (ext_op == PERF_MEM_EXT_OP_MEMCPY)
+		l += scnprintf(out + l, sz - l, " MEMCPY");
+	else if (ext_op == PERF_MEM_EXT_OP_MEMSET)
+		l += scnprintf(out + l, sz - l, " MEMSET");
+	else if (ext_op == PERF_MEM_EXT_OP_SIMD)
+		l += scnprintf(out + l, sz - l, " SIMD");
+	else if (ext_op == PERF_MEM_EXT_OP_GCS)
+		l += scnprintf(out + l, sz - l, " GCS");
+
 	return l;
 }
 
@@ -585,9 +602,6 @@ int perf_mem__blk_scnprintf(char *out, size_t sz, const struct mem_info *mem_inf
 	size_t l = 0;
 	u64 mask = PERF_MEM_BLK_NA;
 
-	sz -= 1; /* -1 for null termination */
-	out[0] = '\0';
-
 	if (mem_info)
 		mask = mem_info__const_data_src(mem_info)->mem_blk;
 
@@ -603,6 +617,44 @@ int perf_mem__blk_scnprintf(char *out, size_t sz, const struct mem_info *mem_inf
 	return l;
 }
 
+static int perf_mem__aff_scnprintf(char *out, size_t sz,
+				   const struct mem_info *mem_info)
+{
+	union perf_mem_data_src data_src;
+	size_t l = 0;
+
+	sz -= 1; /* -1 for null termination */
+	out[0] = '\0';
+
+	if (!mem_info)
+		goto out;
+
+	data_src = *mem_info__const_data_src(mem_info);
+
+	if (data_src.mem_dp)
+		l += scnprintf(out + l, sz - l, " DP");
+	if (data_src.mem_fp)
+		l += scnprintf(out + l, sz - l, " FP");
+	if (data_src.mem_pred)
+		l += scnprintf(out + l, sz - l, " PRED");
+	if (data_src.mem_atomic)
+		l += scnprintf(out + l, sz - l, " ATOMIC");
+	if (data_src.mem_excl)
+		l += scnprintf(out + l, sz - l, " EX");
+	if (data_src.mem_ar)
+		l += scnprintf(out + l, sz - l, " AR");
+	if (data_src.mem_sg)
+		l += scnprintf(out + l, sz - l, " SG");
+	if (data_src.mem_cond)
+		l += scnprintf(out + l, sz - l, " COND");
+
+out:
+	if (!l)
+		l += scnprintf(out + l, sz - l, " N/A");
+
+	return l;
+}
+
 int perf_script__meminfo_scnprintf(char *out, size_t sz, const struct mem_info *mem_info)
 {
 	int i = 0;
@@ -619,6 +671,8 @@ int perf_script__meminfo_scnprintf(char *out, size_t sz, const struct mem_info *
 	i += perf_mem__lck_scnprintf(out + i, sz - i, mem_info);
 	i += scnprintf(out + i, sz - i, "|BLK ");
 	i += perf_mem__blk_scnprintf(out + i, sz - i, mem_info);
+	i += scnprintf(out + i, sz - i, "|AFF");
+	i += perf_mem__aff_scnprintf(out + i, sz - i, mem_info);
 
 	return i;
 }

-- 
2.34.1


