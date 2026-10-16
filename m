Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B844CCF2C4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 21:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7DJXcVXeH2612xf2PKGIHlzDNUZS1igHzWjiz9dAsHs=; b=F2vgN9/eSSGoBBlFMz4xfb7R49
	AjGf3A8KcQPCtGwA9aqUs9KA2wSCuIoZmyJ5oW/q+k0HG+Vgdl/LwvEnOwllaz5FDJ9NW4iRTnCxi
	1zfm5ooXPmd5jSl+4jZvSfT3KOpIjDN61tpd2flJhBLHgX6CHMGGW+D5x28IPXrCDimumjmMX97pc
	EHNlI5Dw12JHUPxD5wGyR4EV1qm5UNg/rsLj664GtCNxFEc62AHDrm3+1KPRKaVLLfGL8+ba56jWV
	gjB+b5sjG4q7kGX0BXszFuXX+NkAiRwQy095T2G3/jHOMmZaTs+1HRZSCdpeXYPDMN8vG0GoEwo1y
	WMRPAQuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHpE6-000000044Dk-0A3D;
	Fri, 16 Oct 2026 21:12:30 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHpDf-00000004410-3wS6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 21:12:18 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 20DBD1516;
	Fri, 16 Oct 2026 14:12:00 -0700 (PDT)
Received: from e132581.arm.com (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D3B2B3F673;
	Fri, 16 Oct 2026 14:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792185123; bh=qu1AgX5nZvAwm7yz08mHTH7BHavVeMMILxgLJeeuNL4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=YNtUHuN5tq+ZyA6yHNz2ZFaC6CGotvd0C8JP9i/xwxRUUyAey4I1LT6LeHgVm0wb4
	 nTEGmSEQrLGwqPqlAAhWOqtirq7Phqrk+QT9C7RZaBTDr0Kfdh399IxyZ7lzKFPNgX
	 6Of8o+42SWo4m9Btu3QWnBwbjtKhuhs0d/vg3kbE=
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 16 Oct 2026 22:11:43 +0100
Subject: [PATCH v2 05/11] coresight: trbe: Leave headroom for
 stop-on-trigger mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-trbe_buffer_refactor_v2-v2-5-383ac26382fa@arm.com>
References: <20261016-trbe_buffer_refactor_v2-v2-0-383ac26382fa@arm.com>
In-Reply-To: <20261016-trbe_buffer_refactor_v2-v2-0-383ac26382fa@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Anshuman Khandual <anshuman.khandual@arm.com>, 
 Tamas Petz <tamas.petz@arm.com>, Tamas Zsoldos <tamas.zsoldos@arm.com>, 
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 coresight@lists.linaro.org, Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792185112; l=3111;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=qu1AgX5nZvAwm7yz08mHTH7BHavVeMMILxgLJeeuNL4=;
 b=Ami5tfZtfhiQQihX+fyQfImMnAlf05k08qAlMdv8heny++hnRux4kbH1IpDp6rnGQp9zoagBK
 JDYGRFsMpfCCPOrT4RpNZurld8hierWhRR1wL2td/SyeBH/OdfUo1s6
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_141204_062468_A3A3370B 
X-CRM114-Status: GOOD (  15.96  )
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

Arm ARM (ARM DDI 0487 M.c), rule R_XRRWP says:

 | If a Trigger Event is generated when collection is not stopped and
 | the trigger mode is Stop on trigger, then all of the following occur:
 | The Trace Buffer Unit initiates a trace unit flush of the trace unit.
 | ...

A Stop-on-trigger event may initiates a trace flush. The TRBE might
therefore continue writing trace data after the trigger event is
generated. If the trigger is programmed exactly at the boundary of the
free space, that flush can overwrite unconsumed trace data.

Reserve 4KiB of headroom when calculating the wrap-protection trigger
count. If the available space is not large enough to provide that
headroom, returns 0 for counter so effectively do not use it.

Subtract the headroom before rounding the count down to the hardware
alignment, retaining the check that the resulting trigger lies beyond
LIMIT. Rounding down preserves at least the requested headroom.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-trbe.c | 27 +++++++++++++++++++++++----
 1 file changed, 23 insertions(+), 4 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
index 95bbdbaca81bd59ac97b272216489c2f66393fa7..8187e264ff3c86d445b96c4935a8dbdf5ad9e77c 100644
--- a/drivers/hwtracing/coresight/coresight-trbe.c
+++ b/drivers/hwtracing/coresight/coresight-trbe.c
@@ -171,6 +171,21 @@ struct trbe_drvdata {
 	struct platform_device *pdev;
 };
 
+/*
+ * Arm ARM (ARM DDI 0487 M.B), section D6.5.3 Trigger event, R_XRRWP states:
+ *
+ * "If a Trigger Event is generated when collection is not stopped and the
+ *  trigger mode is Stop on trigger, then all of the following occur:
+ *  - The Trace Buffer Unit initiates a trace unit flush of the trace unit.
+ *  - The TRB_TRIG event is generated."
+ *
+ * The TRBE might therefore continue writing trace data after the trigger event
+ * is generated. When Stop-on-trigger is used to protect unconsumed data after
+ * buffer wrap, reserve 4KiB of headroom in the trigger count so it is safe to
+ * complete flush without overwriting that data.
+ */
+#define TRBE_TRIGGER_STOP_HEADROOM	SZ_4K
+
 /* Compute the buffer next state */
 struct trbe_buf_next {
 	u64 head;
@@ -460,11 +475,15 @@ static u32 trbe_normal_trigger_count(struct perf_output_handle *handle,
 	 *                                      limit
 	 *
 	 *                              |>>>>>>>>
-	 * >>>>>>>>>>>>>>>>>>>>>|
-	 *   ` Trigger counter covers the writable region, rounded down
-	 *     to the hardware alignment.
+	 * >>>>>>>>>>>>>>>>>|---|
+	 *                    ` headroom
+	 *
+	 * Trigger counter covers the writable region, but leave headroom
+	 * to avoid overwrite risk caused by trace unit flush after
+	 * trigger event is generated.
 	 */
-	count = round_down(handle->size, cpudata->trbe_hw_align);
+	count = round_down(handle->size - TRBE_TRIGGER_STOP_HEADROOM,
+			   cpudata->trbe_hw_align);
 	if (count <= limit - head)
 		return 0;
 

-- 
2.34.1


