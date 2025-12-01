Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E457D116F1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Dec 2025 11:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AxDeZ5TalWqvaTEq8gpbASdYedmY4EZkty9BiVXuztM=; b=hojLfTuL4Jb4Mpa5TnFOB9nLgA
	+DuaJwnb6O663npRIGqccKsns4mdZAkHXLjJIo6pz/fdXaOyNpCXtS+GYwXCtvnUPeiZSokDknALp
	DnGI0uwXfFiwv/iaCUDpuHXmY3taX/H9TA/DBhpPYyt27BC1ftbArgcPfvVxQWt8rAKkkGT2XCNyz
	/jbT10Y+PmRHa3p0brSx742yqkGxF/e7bi4LkMxRpcF9dk7SZXfxTABzbNe4tIW4qUGs2mYBT0vX6
	OzUyhXF9FDX5MPuUgoVQuwXdJFXCnLbSZmX62lj8+CidsHoq4EszxP9+75cARS9rPZiFwyUqMkLsh
	PX7O3tAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ1zW-00000003ROy-3Kdp;
	Mon, 01 Dec 2025 11:22:50 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ1zU-00000003RL5-02KT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Dec 2025 11:22:49 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 320D71595;
	Mon,  1 Dec 2025 03:22:40 -0800 (PST)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 10BF63F7B4;
	Mon,  1 Dec 2025 03:22:44 -0800 (PST)
From: Leo Yan <leo.yan@arm.com>
Date: Mon, 01 Dec 2025 11:22:04 +0000
Subject: [PATCH 14/19] coresight: trbe: Refactor
 compute_trbe_buffer_limit()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251201-trbe_buffer_refactor_v1-1-v1-14-7da32b076b28@arm.com>
References: <20251201-trbe_buffer_refactor_v1-1-v1-0-7da32b076b28@arm.com>
In-Reply-To: <20251201-trbe_buffer_refactor_v1-1-v1-0-7da32b076b28@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
 Anshuman Khandual <anshuman.khandual@arm.com>, 
 Yeoreum Yun <yeoreum.yun@arm.com>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Tamas Petz <tamas.petz@arm.com>, 
 Tamas Zsoldos <tamas.zsoldos@arm.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
 Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
 Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764588125; l=3669;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=pdBR+vHQTejdXMyQCGeDWKUBEJWy99o13yGFD4L3f8I=;
 b=Hmo3a2QT2DsoM7rDrG/lKaNtOxyiNlks/bbGtYN9y7F7T2KvSHz41ysRmE4Y8+Oui2MvkevKV
 GJQHuQ2gOsjDSaahhZzNT2OPPflU2YZDrAv1xoLcJUGBRluhPm2QoxV
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_032248_165557_BA67B375 
X-CRM114-Status: GOOD (  15.50  )
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

Refactor compute_trbe_buffer_limit() to perform the computation and
handle failures. The return type is changed from a limit offset to an
error number (0 is for success).

This refactoring is for future extensions, such as calculating
additional values (e.g., the trigger count). No functional changes are
introduced.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-trbe.c | 44 +++++++++++++++++-----------
 1 file changed, 27 insertions(+), 17 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
index 206eaf103cd94f36220cb6bddd1a78012f5de35a..941aa46e9b11f60c707eb40093964de454a3fd83 100644
--- a/drivers/hwtracing/coresight/coresight-trbe.c
+++ b/drivers/hwtracing/coresight/coresight-trbe.c
@@ -332,7 +332,7 @@ static void trbe_pad_buf(struct perf_output_handle *handle, int len)
 		perf_aux_output_skip(handle, len);
 }
 
-static unsigned long trbe_snapshot_offset(struct perf_output_handle *handle)
+static int trbe_snapshot_offset(struct perf_output_handle *handle)
 {
 	struct trbe_buf *buf = etm_perf_sink_config(handle);
 
@@ -341,7 +341,8 @@ static unsigned long trbe_snapshot_offset(struct perf_output_handle *handle)
 	 * the decoder to reset in case of an overflow or corruption.
 	 * So we can use the entire buffer for the snapshot mode.
 	 */
-	return buf->nr_pages * PAGE_SIZE;
+	buf->trbe_limit = buf->trbe_base + buf->nr_pages * PAGE_SIZE;
+	return 0;
 }
 
 static u64 trbe_min_trace_buf_size(struct perf_output_handle *handle)
@@ -510,7 +511,7 @@ static unsigned long __trbe_normal_offset(struct perf_output_handle *handle)
 	return 0;
 }
 
-static unsigned long trbe_normal_offset(struct perf_output_handle *handle)
+static int trbe_normal_offset(struct perf_output_handle *handle)
 {
 	struct trbe_buf *buf = etm_perf_sink_config(handle);
 	u64 limit = __trbe_normal_offset(handle);
@@ -529,19 +530,34 @@ static unsigned long trbe_normal_offset(struct perf_output_handle *handle)
 		limit = __trbe_normal_offset(handle);
 		head = PERF_IDX2OFF(handle->head, buf);
 	}
-	return limit;
+
+	if (!limit)
+		return -ENOSPC;
+
+	buf->trbe_limit = buf->trbe_base + limit;
+	return 0;
 }
 
-static unsigned long compute_trbe_buffer_limit(struct perf_output_handle *handle)
+static int trbe_compute_next(struct perf_output_handle *handle)
 {
 	struct trbe_buf *buf = etm_perf_sink_config(handle);
-	unsigned long offset;
+	int ret;
+
+	perf_aux_output_flag(handle, PERF_AUX_FLAG_CORESIGHT_FORMAT_RAW);
 
 	if (buf->snapshot)
-		offset = trbe_snapshot_offset(handle);
+		ret = trbe_snapshot_offset(handle);
 	else
-		offset = trbe_normal_offset(handle);
-	return buf->trbe_base + offset;
+		ret = trbe_normal_offset(handle);
+
+	if (ret)
+		return ret;
+
+	buf->trbe_write = buf->trbe_base + PERF_IDX2OFF(handle->head, buf);
+
+	/* Set the base of the TRBE to the buffer base */
+	buf->trbe_hw_base = buf->trbe_base;
+	return 0;
 }
 
 static void clr_trbe_status(void)
@@ -986,15 +1002,9 @@ static int __arm_trbe_enable(struct trbe_buf *buf,
 {
 	int ret = 0;
 
-	perf_aux_output_flag(handle, PERF_AUX_FLAG_CORESIGHT_FORMAT_RAW);
-	buf->trbe_limit = compute_trbe_buffer_limit(handle);
-	buf->trbe_write = buf->trbe_base + PERF_IDX2OFF(handle->head, buf);
-	if (buf->trbe_limit == buf->trbe_base) {
-		ret = -ENOSPC;
+	ret = trbe_compute_next(handle);
+	if (ret)
 		goto err;
-	}
-	/* Set the base of the TRBE to the buffer base */
-	buf->trbe_hw_base = buf->trbe_base;
 
 	ret = trbe_apply_work_around_before_enable(buf);
 	if (ret)

-- 
2.34.1


