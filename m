Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A088CCD195
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 10:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yfcg307Vl0OfcuvkvFvSQZkqXTaTYSx8aGmylC3U4ak=; b=ZEpKrgG6PZ0V/Ht3rFzeDUEtiY
	mA8S/Q8JA3DNk/u1hv++5QQzMCTbG9ULcI2QNSObSdnhlQAGhocq2yWtMNw7zhzdibTaHCFZYM2Nw
	Thv/IkIsmy8B6e6Vc6eYxOP85sQPOYQHGnsK23KW3RFp/1x39MJkfPyZeQyJTzwHDweb6+jCNjDZO
	Xz01Geq8TZZgP4TSmEeUN3lxt2lwkKBPMgSJsE8ZmsX8LUw2VuF6oI3GaG9fl8IEO2K3ZMv8OJPjq
	Xb6hI0fBInr11wINAO4+QpH1ssfpwdLne5fAFO+3q37j1yEIwk59mOOcPk+Otky94YTi9D4HzKx1Z
	CMDB88kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9hLp-00000007QrV-38sN;
	Fri, 17 Oct 2025 10:06:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9hLm-00000007QlO-1dHH
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 17 Oct 2025 10:06:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=yfcg307Vl0OfcuvkvFvSQZkqXTaTYSx8aGmylC3U4ak=; b=it/Lo4Fu2f9rtxxTQYWbtkH2W6
	kzwM1T9Qli92Khl4XgSi3mxvSJk5e0janUcdTCdXgR74Hob8C6KkLTBX5I56EBKpSSudE6oByVg+l
	Uu0C0GuKqxcIRIv+AOQWH5pOjDKH3Bs35Np6ZMslAWchgT78bO32prjfguMP4HuFkvWGxIydU/aXY
	ZJw2v+84YkVKIqXUynBZEiUl7DstMyL9A8bVD6cPHFxtXoGB5ArYVmvKcK+Xpa/HGwsmUN2GFS6WU
	nI00lz/T2QnYAUi1tLY0sBmzpHJtoc0UB85TS5M5EXhtJcRH1C0n1dt8bz0uX4coe8A/4oZB5wMdu
	6oFH6yJg==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9hLH-00000007RcY-2tTu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 10:06:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B2E5B1595;
	Fri, 17 Oct 2025 03:05:30 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3EC813F59E;
	Fri, 17 Oct 2025 03:05:37 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 17 Oct 2025 11:05:07 +0100
Subject: [PATCH v2 18/25] perf/uapi: Extend data source fields
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251017-perf_support_arm_spev1-3-v2-18-2d41e4746e1b@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760695507; l=3220;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=3iw/P+AX4UJGoOiKlHAm4WlW+3qWo8a2n9HzWZAvfJM=;
 b=Z7lVotmYhCuvloD5hosgEKAxIXvHbgWnu1PRHfE6m1CSvrzI1FTGth78wixCL4RAjeIwVUlX9
 gCTum0lcI0hBKkDKVKVDZRniyCsmXpFKDUu8Qwh6otA/rZW/CYBq3qq
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_110610_596808_2C1E2138 
X-CRM114-Status: GOOD (  10.80  )
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

Arm CPUs introduce several new types of memory operations, like MTE tag
accessing, system register access for nested virtualization, memcpy &
memset, and Guarded Control Stack (GCS).

For memory operation details, Arm SPE provides information like data
(parallel) processing, floating-point, predicated, atomic, exclusive,
acquire/release, gather/scatter, and conditional.

This commit introduces a field 'mem_op_ext' for extended operation type.
The extended operation type can be combined with the existed operation
type to express a memory type, for examples, a PERF_MEM_OP_GCS type can
be set along with PERF_MEM_OP_LOAD to present a load operation for
GCS register access.

Bit fields are also added to represent detailed operation attributes.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 include/uapi/linux/perf_event.h | 32 ++++++++++++++++++++++++++++++--
 1 file changed, 30 insertions(+), 2 deletions(-)

diff --git a/include/uapi/linux/perf_event.h b/include/uapi/linux/perf_event.h
index 78a362b8002776e5ce83a0d7816601638c61ecc6..9b9fa59fd828756b5e8e93520da5a269f0dfff52 100644
--- a/include/uapi/linux/perf_event.h
+++ b/include/uapi/linux/perf_event.h
@@ -1309,14 +1309,32 @@ union perf_mem_data_src {
 			mem_snoopx  :  2, /* Snoop mode, ext */
 			mem_blk     :  3, /* Access blocked */
 			mem_hops    :  3, /* Hop level */
-			mem_rsvd    : 18;
+			mem_op_ext  :  4, /* Extended type of opcode */
+			mem_dp      :  1, /* Data processing */
+			mem_fp      :  1, /* Floating-point */
+			mem_pred    :  1, /* Predicated */
+			mem_atomic  :  1, /* Atomic operation */
+			mem_excl    :  1, /* Exclusive */
+			mem_ar      :  1, /* Acquire/release */
+			mem_sg      :  1, /* Scatter/Gather */
+			mem_cond    :  1, /* Conditional */
+			mem_rsvd    :  6;
 	};
 };
 #elif defined(__BIG_ENDIAN_BITFIELD)
 union perf_mem_data_src {
 	__u64 val;
 	struct {
-		__u64	mem_rsvd    : 18,
+		__u64	mem_rsvd    :  6,
+			mem_cond    :  1, /* Conditional */
+			mem_sg      :  1, /* Scatter/Gather */
+			mem_ar      :  1, /* Acquire/release */
+			mem_excl    :  1, /* Exclusive */
+			mem_atomic  :  1, /* Atomic operation */
+			mem_pred    :  1, /* Predicated */
+			mem_fp      :  1, /* Floating-point */
+			mem_dp      :  1, /* Data processing */
+			mem_op_ext  :  4, /* Extended type of opcode */
 			mem_hops    :  3, /* Hop level */
 			mem_blk     :  3, /* Access blocked */
 			mem_snoopx  :  2, /* Snoop mode, ext */
@@ -1426,6 +1444,16 @@ union perf_mem_data_src {
 /* 5-7 available */
 #define PERF_MEM_HOPS_SHIFT			43
 
+/* Extended type of memory opcode: */
+#define PERF_MEM_EXT_OP_NA			0x0    /* Not available */
+#define PERF_MEM_EXT_OP_MTE_TAG			0x1    /* MTE tag */
+#define PERF_MEM_EXT_OP_NESTED_VIRT		0x2    /* Nested virtualization */
+#define PERF_MEM_EXT_OP_MEMCPY			0x3    /* Memory copy */
+#define PERF_MEM_EXT_OP_MEMSET			0x4    /* Memory set */
+#define PERF_MEM_EXT_OP_SIMD			0x5    /* SIMD */
+#define PERF_MEM_EXT_OP_GCS			0x6    /* Guarded Control Stack */
+#define PERF_MEM_EXT_OP_SHIFT			46
+
 #define PERF_MEM_S(a, s) \
 	(((__u64)PERF_MEM_##a##_##s) << PERF_MEM_##a##_SHIFT)
 

-- 
2.34.1


