Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D20FBC982C1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 15:49:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hGjXC2kbJQKm6PevHw8xehX6sr3D0HOmtOazf2L6Udc=; b=13nZlNVOX/ZfVsOhzjnx9hiehj
	ajpYcCpK7IwCDkOjWYCz9rt/FsMilK5Ip80Dhd1S26Q26/lVy6bnWl3D6CrITtl/boecgKJ3NzZYN
	WkYXyNzjo/s0Zo5PKsiI47D1Yqbp1KJLtGa8A2dMInRNVwvR3DNgOh/nVGwlOJ5aN5J+F0+1bX3Q6
	19aE7Kgq+Zrb+k+j3OHptCt1QB9YArFRapJKHM4Uc8WZ/3DLcVNpDQ+rOQgT3HYP01DcWhETxwumb
	ByYTc1KaaqgCWC05VjxrLbjsq53f7cE70ZjEX9cXI2GhfjwwoK+49j1jAj0xLQ08WwRdHRZuty/fh
	KQdshNhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6VPm-00000007Hyf-3G4r;
	Tue, 15 Sep 2026 15:49:46 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6VPX-00000007Hll-091S
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 15:49:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8E1391570;
	Tue, 15 Sep 2026 08:49:26 -0700 (PDT)
Received: from e132581.arm.com (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C2BAD3F882;
	Tue, 15 Sep 2026 08:49:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789487370; bh=AydmBDCGxJoieq4qMCoYXMM5JRa7TDwIw3gGM515xLI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ChgiyNeE2xQD0onL/5oFutj0JGE3PYEkM4/YTnJoJwh4MYSRTfGG/fvyRDvzxHRmM
	 73uqGT5hvFRPPwYoU1EpC7qfRiCEbzXH8QwNYVN6tLx89J8hEZTvl5y8JbYo2uqxaV
	 4NktOchFCenfKns0ljWbexDM16ZyThJ10tMxs2DU=
From: Leo Yan <leo.yan@arm.com>
Date: Tue, 15 Sep 2026 16:48:56 +0100
Subject: [PATCH 10/25] coresight: trbe: Pad snapshot buffers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-arm_cs_support_aux_sample-v1-10-35cf6f297d20@arm.com>
References: <20260915-arm_cs_support_aux_sample-v1-0-35cf6f297d20@arm.com>
In-Reply-To: <20260915-arm_cs_support_aux_sample-v1-0-35cf6f297d20@arm.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 James Clark <james.clark@linaro.org>, Mike Leach <mike.leach@arm.com>, 
 Anshuman Khandual <anshuman.khandual@arm.com>, 
 Yeoreum Yun <yeoreum.yun@arm.com>, Jonathan Corbet <corbet@lwn.net>, 
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
Cc: Ingo Molnar <mingo@kernel.org>, linux-perf-users@vger.kernel.org, 
 linux-kernel@vger.kernel.org, coresight@lists.linaro.org, 
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
 Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789487340; l=2612;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=AydmBDCGxJoieq4qMCoYXMM5JRa7TDwIw3gGM515xLI=;
 b=bd4sFk+qXNO9HuRRhhh3F+uLaoxL8tn7YVQjLkFsE6GIeJ7NwBuxuMIRYAIx4ZvuAiPAk1bip
 6i8LIzRyHHMA8GEVzvqeMnmAN1Ge4EYpG1tqKv8++0vekOc6OW54RR7
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_084931_186102_8682F7B4 
X-CRM114-Status: GOOD (  17.11  )
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

Snapshot buffers use the head as the write pointer without checking its
alignment or the space remaining before the limit. After a stop or a
move to another CPU, the head can be misaligned for the current TRBE.
It can also leave too little space for the Fill mode out-of-range
workaround.

Pad the head to the current CPU's alignment. If the remaining buffer
cannot hold the minimum trace region, pad to the end of buffer. Update
the head for setting next write pointer.

Fixes: 3fbf7f011f24 ("coresight: sink: Add TRBE driver")
Assisted-by: Codex:gpt-6
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-trbe.c | 36 ++++++++++++++++++----------
 1 file changed, 24 insertions(+), 12 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
index c7cbca45f2debd4047b93283ea9fe5dd9e1f2ebf..a31f2ebc327cd681344a62de28c0b3840505a9cb 100644
--- a/drivers/hwtracing/coresight/coresight-trbe.c
+++ b/drivers/hwtracing/coresight/coresight-trbe.c
@@ -374,18 +374,6 @@ static void trbe_pad_buf(struct perf_output_handle *handle, int len)
 		perf_aux_output_skip(handle, len);
 }
 
-static unsigned long trbe_snapshot_offset(struct perf_output_handle *handle)
-{
-	struct trbe_buf *buf = etm_perf_sink_config(handle);
-
-	/*
-	 * The ETE trace has alignment synchronization packets allowing
-	 * the decoder to reset in case of an overflow or corruption.
-	 * So we can use the entire buffer for the snapshot mode.
-	 */
-	return buf->nr_pages * PAGE_SIZE;
-}
-
 static u64 trbe_min_trace_buf_size(struct perf_output_handle *handle)
 {
 	u64 size = TRBE_TRACE_MIN_BUF_SIZE;
@@ -405,6 +393,30 @@ static u64 trbe_min_trace_buf_size(struct perf_output_handle *handle)
 	return size;
 }
 
+static unsigned long trbe_snapshot_offset(struct perf_output_handle *handle)
+{
+	struct trbe_buf *buf = etm_perf_sink_config(handle);
+	struct trbe_cpudata *cpudata = buf->cpudata;
+	u64 buf_size = (u64)buf->nr_pages << PAGE_SHIFT;
+	u64 head = PERF_IDX2OFF(handle->head, buf);
+	u64 next = round_up(head, cpudata->trbe_align);
+
+	/*
+	 * A task event may migrate to a CPU with a different alignment or
+	 * errata. Make sure it has enough space, pad up to the alignment
+	 * required by the current TRBE.
+	 */
+	if (buf_size - next < trbe_min_trace_buf_size(handle))
+		next = buf_size;
+
+	if (next != head) {
+		__trbe_pad_buf(buf, head, next - head);
+		handle->head += next - head;
+	}
+
+	return buf_size;
+}
+
 /*
  * TRBE Limit Calculation
  *

-- 
2.34.1


