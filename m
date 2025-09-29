Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E656CCA468
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 16:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=czIIptYIxAlB+YB8RRN9FN1SjqAuF7B4IlgM4RZWOo0=; b=G1EQtlFzJz5S0X+/uqVghqbPvU
	xKBL3yaLGvhaBQyyE77rHnRqyK2GvCbWeV8KykSnCyVvkj84UFdArUuGuJ6Rmxhw/1FePEZ/1hTgk
	Ih2fCk4Ip2j7s/D3IpyTV8p5jEI30GaJYz6IjXPic4EpSHtOH6dsuUspG8t8ALLDWS1svYOh9uaZP
	tze/1/JI9j+R2AGIj4Pna+VfJkHuQWeFJYeuATOdEKa+SdHctDJf1frwvYnN+K3Inmk/O1HdL8daK
	mgK8ZhqTuoVYW+cZciV8NNlcb115NrqKcGaolLc4CBM8ag7wHMUMWkfw4eiOOH5m776Vfn4hRwvkc
	z58IjX/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3Gto-0000000303b-0FrG;
	Mon, 29 Sep 2025 16:38:52 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3GtN-00000002zib-2xgw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Sep 2025 16:38:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 22A4F1758;
	Mon, 29 Sep 2025 09:38:17 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C10003F66E;
	Mon, 29 Sep 2025 09:38:23 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Date: Mon, 29 Sep 2025 17:37:55 +0100
Subject: [PATCH 19/25] perf/uapi: Extend data source fields
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250929-perf_support_arm_spev1-3-v1-19-1150b3c83857@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759163872; l=3062;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=MrUJws3XOxSEfzYPriUT8JOz/TWITk3TYSqTpdF5/j0=;
 b=Nr8EAIpiZWrSgkY5XYqq1BoG4Ov0skvjgCTno8ELCn0dHObMktjjjQuKGXzy6HJd/jrnLVxR1
 SUj3TsWpWhCBsJCb449GVhjkifYYFL01z1WCSC3Vp54L2+g3O7HnV8Y
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_093826_172211_7346EFA4 
X-CRM114-Status: GOOD (  12.64  )
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

Also use a field 'mem_aff' to store affiliate information.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 include/uapi/linux/perf_event.h | 28 ++++++++++++++++++++++++++--
 1 file changed, 26 insertions(+), 2 deletions(-)

diff --git a/include/uapi/linux/perf_event.h b/include/uapi/linux/perf_event.h
index 78a362b8002776e5ce83a0d7816601638c61ecc6..51ab37d44ac31fcdc4bc919c14d5f97e560d9339 100644
--- a/include/uapi/linux/perf_event.h
+++ b/include/uapi/linux/perf_event.h
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
 

-- 
2.34.1


