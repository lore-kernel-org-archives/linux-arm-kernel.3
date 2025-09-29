Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BD25CAC5B9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 16:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r0tCEJhO4eF05TeyaVMKeWEnqDW9CPVB9jJpExmlTIk=; b=MgRpFYrJryJRcN8s7eOuB8ZxMc
	/RF2FDUYT716WriAv8v5LinKZ14TVylrVw0hlLAOwLCfH0mczxAJ5bs17I9/lqGX0UaawojgPrIOa
	xly9IS+Lp5pYP8sAg6nmHf5foO42Rb2WohowXpMS3rTVKz5mDPt/sXbSIixcPbYJOovk5Jdlci8ub
	lIbt4e6Y2yVLBNk3tjop4F6R2gTrzTmD079ebzkmWVgCzH+6m3YdfJg8tXN/UFgdbx+nwzWIJnw9e
	yl86sXEyxsJbA0cQqn3nQv+MmrAYYC/PIpDGEP92kJafbMK+USR/49eJW9L2FVKIQUU7ayWAAiAKE
	jf2CiHCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3Gtt-0000000309M-1Zfk;
	Mon, 29 Sep 2025 16:38:57 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3GtP-00000002zlc-2w5Q
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Sep 2025 16:38:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C1B8B1CC4;
	Mon, 29 Sep 2025 09:38:18 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6AB2F3F66E;
	Mon, 29 Sep 2025 09:38:25 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Date: Mon, 29 Sep 2025 17:37:56 +0100
Subject: [PATCH 20/25] perf mem: Print extended fields
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250929-perf_support_arm_spev1-3-v1-20-1150b3c83857@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759163872; l=5530;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=8BdDVyc7WprgKkp7xlV6N7AVJOhuMnOI+2wj0A8Aqgo=;
 b=DGIsOckTcZWpPbDkWqB0eG/UNYu3Kf1nJVxFUpDbpAAsoTq/fD6ytrIx1v7bSL1Cz5/N26I7h
 385JRSjysneA+Apph26bYSSZ4cNglzEuYGsTOiIeE69Izj664D6qwEM
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_093827_839143_782BB749 
X-CRM114-Status: GOOD (  14.98  )
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
 tools/include/uapi/linux/perf_event.h | 28 +++++++++++++++--
 tools/perf/util/mem-events.c          | 58 +++++++++++++++++++++++++++++++++--
 2 files changed, 82 insertions(+), 4 deletions(-)

diff --git a/tools/include/uapi/linux/perf_event.h b/tools/include/uapi/linux/perf_event.h
index 78a362b8002776e5ce83a0d7816601638c61ecc6..51ab37d44ac31fcdc4bc919c14d5f97e560d9339 100644
--- a/tools/include/uapi/linux/perf_event.h
+++ b/tools/include/uapi/linux/perf_event.h
@@ -1309,14 +1309,18 @@ union perf_mem_data_src {
 			mem_snoopx  :  2, /* Snoop mode, ext */
 			mem_blk     :  3, /* Access blocked */
 			mem_hops    :  3, /* Hop level */
-			mem_rsvd    : 18;
+			mem_op_ext  :  6, /* Extended type of opcode */
+			mem_aff     :  8, /* Affiliate info */
+			mem_rsvd    :  4;
 	};
 };
 #elif defined(__BIG_ENDIAN_BITFIELD)
 union perf_mem_data_src {
 	__u64 val;
 	struct {
-		__u64	mem_rsvd    : 18,
+		__u64	mem_rsvd    :  4,
+			mem_aff     :  8, /* Affiliate info */
+			mem_op_ext  :  6, /* Extended type of opcode */
 			mem_hops    :  3, /* Hop level */
 			mem_blk     :  3, /* Access blocked */
 			mem_snoopx  :  2, /* Snoop mode, ext */
@@ -1426,6 +1430,26 @@ union perf_mem_data_src {
 /* 5-7 available */
 #define PERF_MEM_HOPS_SHIFT			43
 
+/* Extended type of memory opcode: */
+#define PERF_MEM_EXT_OP_MTE_TAG			0x0001 /* MTE tag */
+#define PERF_MEM_EXT_OP_NESTED_VIRT		0x0002 /* Nested virtualization */
+#define PERF_MEM_EXT_OP_MEMCPY			0x0004 /* Memory copy */
+#define PERF_MEM_EXT_OP_MEMSET			0x0008 /* Memory set */
+#define PERF_MEM_EXT_OP_SIMD			0x0010 /* SIMD */
+#define PERF_MEM_EXT_OP_GCS			0x0020 /* Guarded Control Stack */
+#define PERF_MEM_EXT_OP_SHIFT			46
+
+/* Affiliate info */
+#define PERF_MEM_AFF_DP				0x0001 /* Data processing */
+#define PERF_MEM_AFF_FP				0x0002 /* Floating-point */
+#define PERF_MEM_AFF_PRED			0x0004 /* Predicated */
+#define PERF_MEM_AFF_ATOMIC			0x0008 /* Atomic */
+#define PERF_MEM_AFF_EXCLUSIVE			0x0010 /* Exclusive */
+#define PERF_MEM_AFF_AR				0x0020 /* Acquire/release */
+#define PERF_MEM_AFF_SG				0x0040 /* Gather/Scatter */
+#define PERF_MEM_AFF_CONDITIONAL		0x0080 /* Conditional */
+#define PERF_MEM_AFF_SHIFT			52
+
 #define PERF_MEM_S(a, s) \
 	(((__u64)PERF_MEM_##a##_##s) << PERF_MEM_##a##_SHIFT)
 
diff --git a/tools/perf/util/mem-events.c b/tools/perf/util/mem-events.c
index 80b3069427bc4bb5ffc3ab0856c01c76d9ba3ba6..2d052abfa39d841f75b4b16143641841d8577d0c 100644
--- a/tools/perf/util/mem-events.c
+++ b/tools/perf/util/mem-events.c
@@ -413,11 +413,13 @@ static const char * const mem_hops[] = {
 
 static int perf_mem__op_scnprintf(char *out, size_t sz, const struct mem_info *mem_info)
 {
-	u64 op = PERF_MEM_LOCK_NA;
+	u64 op = PERF_MEM_OP_NA, ext_op = 0;
 	int l;
 
-	if (mem_info)
+	if (mem_info) {
 		op = mem_info__const_data_src(mem_info)->mem_op;
+		ext_op = mem_info__const_data_src(mem_info)->mem_op_ext;
+	}
 
 	if (op & PERF_MEM_OP_NA)
 		l = scnprintf(out, sz, "N/A");
@@ -432,6 +434,19 @@ static int perf_mem__op_scnprintf(char *out, size_t sz, const struct mem_info *m
 	else
 		l = scnprintf(out, sz, "No");
 
+	if (ext_op & PERF_MEM_EXT_OP_MTE_TAG)
+		l += scnprintf(out + l, sz - l, " MTE");
+	else if (ext_op & PERF_MEM_EXT_OP_NESTED_VIRT)
+		l += scnprintf(out + l, sz - l, " NV");
+	else if (ext_op & PERF_MEM_EXT_OP_MEMCPY)
+		l += scnprintf(out + l, sz - l, " MEMCPY");
+	else if (ext_op & PERF_MEM_EXT_OP_MEMSET)
+		l += scnprintf(out + l, sz - l, " MEMSET");
+	else if (ext_op & PERF_MEM_EXT_OP_SIMD)
+		l += scnprintf(out + l, sz - l, " SIMD");
+	else if (ext_op & PERF_MEM_EXT_OP_GCS)
+		l += scnprintf(out + l, sz - l, " GCS");
+
 	return l;
 }
 
@@ -600,6 +615,43 @@ int perf_mem__blk_scnprintf(char *out, size_t sz, const struct mem_info *mem_inf
 	return l;
 }
 
+static int perf_mem__aff_scnprintf(char *out, size_t sz,
+				   const struct mem_info *mem_info)
+{
+	size_t l = 0;
+	u64 mask = 0;
+
+	sz -= 1; /* -1 for null termination */
+	out[0] = '\0';
+
+	if (mem_info)
+		mask = mem_info__const_data_src(mem_info)->mem_aff;
+
+	if (!mask) {
+		l += scnprintf(out + l, sz - l, " N/A");
+		return l;
+	}
+
+	if (mask & PERF_MEM_AFF_DP)
+		l += scnprintf(out + l, sz - l, " DP");
+	if (mask & PERF_MEM_AFF_FP)
+		l += scnprintf(out + l, sz - l, " FP");
+	if (mask & PERF_MEM_AFF_PRED)
+		l += scnprintf(out + l, sz - l, " PRED");
+	if (mask & PERF_MEM_AFF_ATOMIC)
+		l += scnprintf(out + l, sz - l, " ATOMIC");
+	if (mask & PERF_MEM_AFF_EXCLUSIVE)
+		l += scnprintf(out + l, sz - l, " EX");
+	if (mask & PERF_MEM_AFF_AR)
+		l += scnprintf(out + l, sz - l, " AR");
+	if (mask & PERF_MEM_AFF_SG)
+		l += scnprintf(out + l, sz - l, " SG");
+	if (mask & PERF_MEM_AFF_CONDITIONAL)
+		l += scnprintf(out + l, sz - l, " COND");
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
+	i += scnprintf(out + i, sz - i, "|AFF ");
+	i += perf_mem__aff_scnprintf(out + i, sz - i, mem_info);
 
 	return i;
 }

-- 
2.34.1


