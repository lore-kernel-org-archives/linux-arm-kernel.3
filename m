Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CF07CCD195
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 10:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KazYSMUi3seSS4oObUkpu/Tp1JR7fu/js/EwRQBrgiA=; b=SYyA8iGbRDIpgdZgL7fPeBs7jF
	l1sCg6xX5dADBfiGdb6C59ytome1GxBYmsvH26LfTzEAJCpjBbtd0eByuUtJ83L8YmpdoXiYp8QQ3
	6qOE/F+9mHSsG/hRcm4zoevZkmI7+779DLSCjovKedPHNS6t9CWV6EJioANcNqltI3VKY8VYaBB1v
	bvV+Lu8mVEGv+A7XuNlo2495JV9fArSYDe9YVuxdF0/0kCiqhN5WWmyDKNWovKovikJJKyR1sRipe
	s2+w/ZfpegQudb40DDu1TGah9fu9QN5kGVSJVTLLl8vgVsnNRVzE5We57caLaD153K+hJ54a18apd
	e8mBpGJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9hLt-00000007QvW-0xJD;
	Fri, 17 Oct 2025 10:06:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9hLm-00000007QmF-3cij
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 17 Oct 2025 10:06:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=KazYSMUi3seSS4oObUkpu/Tp1JR7fu/js/EwRQBrgiA=; b=V4ewC6ouOpDcoHbjgacbpBECAe
	PkNNpyjJbEA7d8BrhYaL7qaC67fjBL+jhYIen9fzIie3H4vR6ejWb0MBTcm64FpH34Qdk+Yvxs344
	5spTJRKsyNEzZMpOh5gPlKvWR9claax4RNdAggeHdbTaQgBC4GtWSCW/OKYAZeZYj1jn1t9hViUn2
	rGd38opNQP7qM+fZO3h+Z4ozHIx4gPtY+OCDZ0/fzCCSqjrQfbSJdY6jwOk7PH3CMN5uwnaIxCCV0
	+W4eE550LPZBLkBJi74jAzUx8RCvBic458bYjzqEp2Ya6vHqK7ryXV+Aoj+Wqpg+vZ4uD9ED5y/WN
	Cx5HPy7A==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9hLL-00000007Rca-3O40
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 10:06:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0819A1C14;
	Fri, 17 Oct 2025 03:05:34 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 88A103F59E;
	Fri, 17 Oct 2025 03:05:40 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 17 Oct 2025 11:05:09 +0100
Subject: [PATCH v2 20/25] perf mem: Print extended fields
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251017-perf_support_arm_spev1-3-v2-20-2d41e4746e1b@arm.com>
References: <20251017-perf_support_arm_spev1-3-v2-0-2d41e4746e1b@arm.com>
In-Reply-To: <20251017-perf_support_arm_spev1-3-v2-0-2d41e4746e1b@arm.com>
To: Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
 Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
 James Clark <james.clark@linaro.org>
Cc: Arnaldo Carvalho de Melo <acme@redhat.com>, 
 linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760695507; l=3651;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=A7ojri2MUqobrd+TLOmz8lLFTBFq9buLIlAc/yoYVBg=;
 b=0/5+Cd6MO1dTYaG5lGH1CEV0BhFhxYsOXXbiPrjcBt6WbaoBnMcFjnH8smdc4+XcH+nQNkSEz
 UIC/dYPYhK9Dp107mBiO3M1xqCRxpvUwQGUD/wKcqRmcgK5mell2y2N
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_110611_023399_EBD6FEA5 
X-CRM114-Status: GOOD (  13.47  )
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
index 80b3069427bc4bb5ffc3ab0856c01c76d9ba3ba6..c0aee982fb4f1a849c28a8bb01693855922832f6 100644
--- a/tools/perf/util/mem-events.c
+++ b/tools/perf/util/mem-events.c
@@ -413,11 +413,15 @@ static const char * const mem_hops[] = {
 
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
@@ -432,6 +436,19 @@ static int perf_mem__op_scnprintf(char *out, size_t sz, const struct mem_info *m
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
 
@@ -582,9 +599,6 @@ int perf_mem__blk_scnprintf(char *out, size_t sz, const struct mem_info *mem_inf
 	size_t l = 0;
 	u64 mask = PERF_MEM_BLK_NA;
 
-	sz -= 1; /* -1 for null termination */
-	out[0] = '\0';
-
 	if (mem_info)
 		mask = mem_info__const_data_src(mem_info)->mem_blk;
 
@@ -600,6 +614,44 @@ int perf_mem__blk_scnprintf(char *out, size_t sz, const struct mem_info *mem_inf
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
@@ -616,6 +668,8 @@ int perf_script__meminfo_scnprintf(char *out, size_t sz, const struct mem_info *
 	i += perf_mem__lck_scnprintf(out + i, sz - i, mem_info);
 	i += scnprintf(out + i, sz - i, "|BLK ");
 	i += perf_mem__blk_scnprintf(out + i, sz - i, mem_info);
+	i += scnprintf(out + i, sz - i, "|AFF");
+	i += perf_mem__aff_scnprintf(out + i, sz - i, mem_info);
 
 	return i;
 }

-- 
2.34.1


