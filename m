Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 846FFCC6B38
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 16:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AY/o/kn2al6k/r+D6a/ShOVwiPgEDXAfFpjHPYqVD6Q=; b=VMXwxLP+UVIpZDtqqDz3YT2UVg
	U/HUcWjNP2u9BWgx5JwG03KS05+x1RGjm1fZFQ5v62O+dlWD2HOgd7KF0G/Xs0oW4bVLRS9Q5pl04
	zRQcCegzJRDCDwGMjxTxD7ftYw6eCMBE7C3U4GmV9kslK6JGSLe/ntXzja84eXPqmtVuyFtnMij1k
	/aWOHu9DP0Lm3MA0FDFsElkr81eaSjIIWf4JpBS5e9HHdKvLzASSrZA7RHBcHeXhg64RxVmXWQeoH
	i/9VmpENoR7f+RtFdR2Zug3QlGIt9C/pIRaJrZMMU+hAt1Rxcm7ovGgvU35ze8BbAWObRdmUKSh+C
	SHRqn/cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHlDH-00000003Ti7-3Txk;
	Fri, 16 Oct 2026 16:55:23 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHlDC-00000003Tel-0Aba
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 16:55:19 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3ECD01516;
	Fri, 16 Oct 2026 09:55:14 -0700 (PDT)
Received: from e132581.arm.com (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EC1C63F7B4;
	Fri, 16 Oct 2026 09:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792169717; bh=FAfYRNcwGOqb2dGzqQkyQAmanFpEh4raI/GRcP6unT8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ilngyQjumPlaCZ1rTAb2T3ylkuG6vRvmCdbMFW8kSZqCZtYoXcrhFXzKJKVs441ot
	 izYphg7YfV8VMRPLRjboUBAPCz65evy0sbU0UBWAvQjSuf0k1s5AK+AyfsJX/IA2Dc
	 aIGVxHjtjvt2urYIkWtz58Gxk+jgWqRtzLZnmkXs=
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 16 Oct 2026 17:55:01 +0100
Subject: [PATCH v2 03/23] coresight: trbe: Use helpers for checking errata
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-trbe_enable_disable_irq_handle_refactor-v2-3-3f57cf3199b1@arm.com>
References: <20261016-trbe_enable_disable_irq_handle_refactor-v2-0-3f57cf3199b1@arm.com>
In-Reply-To: <20261016-trbe_enable_disable_irq_handle_refactor-v2-0-3f57cf3199b1@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Anshuman Khandual <anshuman.khandual@arm.com>, 
 Tamas Petz <tamas.petz@arm.com>, Tamas Zsoldos <tamas.zsoldos@arm.com>, 
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 coresight@lists.linaro.org, Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792169710; l=2030;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=FAfYRNcwGOqb2dGzqQkyQAmanFpEh4raI/GRcP6unT8=;
 b=iCDPV0eGNJBH9AAF9ztR1T3QIVAmyPD27hmA4MsF6tAxbVp+RE7r/2sHzk6KBPt5cN0VfZNUF
 huffIKcRxBcA+mETsTzmtyOTddpQG3j6CkJJkzL5b07S0ZequYw+AFh
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_095518_209354_560536D8 
X-CRM114-Status: GOOD (  13.27  )
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

Use the existing helpers for checking errata instead of open coded
equivalent.

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-trbe.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
index 02d12445763a86d58c79bdf5143f761827456bc3..8ec0b4c4987f25d10ee0b2f80c27e10f76357387 100644
--- a/drivers/hwtracing/coresight/coresight-trbe.c
+++ b/drivers/hwtracing/coresight/coresight-trbe.c
@@ -738,7 +738,7 @@ static unsigned long trbe_get_trace_size(struct perf_output_handle *handle,
 	 * the space we skipped with IGNORE packets. And we are always
 	 * guaranteed to have at least a PAGE_SIZE space in the buffer.
 	 */
-	if (trbe_has_erratum(buf->cpudata, TRBE_WORKAROUND_OVERWRITE_FILL_MODE) &&
+	if (trbe_may_overwrite_in_fill_mode(buf->cpudata) &&
 	    !WARN_ON(size < overwrite_skip))
 		__trbe_pad_buf(buf, start_off, overwrite_skip);
 
@@ -961,7 +961,7 @@ static int trbe_apply_work_around_before_enable(struct trbe_buf *buf)
 	 *  - At trace collection:
 	 *     - Pad the 256bytes skipped above again with IGNORE packets.
 	 */
-	if (trbe_has_erratum(buf->cpudata, TRBE_WORKAROUND_OVERWRITE_FILL_MODE)) {
+	if (trbe_may_overwrite_in_fill_mode(buf->cpudata)) {
 		if (WARN_ON(!IS_ALIGNED(buf->trbe_write, PAGE_SIZE)))
 			return -EINVAL;
 		buf->trbe_hw_base = buf->trbe_write;
@@ -985,7 +985,7 @@ static int trbe_apply_work_around_before_enable(struct trbe_buf *buf)
 	 *     - Adjust the TRBLIMITR.LIMIT to leave the extra PAGE outside
 	 *       the TRBE's range (i.e [TRBBASER, TRBLIMITR.LIMI] ).
 	 */
-	if (trbe_has_erratum(buf->cpudata, TRBE_WORKAROUND_WRITE_OUT_OF_RANGE)) {
+	if (trbe_may_write_out_of_range(buf->cpudata)) {
 		s64 space = buf->trbe_limit - buf->trbe_write;
 		/*
 		 * We must have more than a PAGE_SIZE worth space in the proposed

-- 
2.34.1


