Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01733CC6B38
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 16:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lm564hSzx82eyyT6WT3/LlWcZzenw0HeMomXuktzxq8=; b=BR2M5+tw6RvKqxynWHg8PorvEc
	YFeZ1S7DkjMV021R8zlPpbCiKV+kYjXWJ+COPCAiwntWIwXy9NpJ7h1rqyC06dZ3cXntSeRzFu7Ek
	NwoyWGJo2wqPyv2YbgQcaA2vSK/iGOATcMRD99kuRkQ2deDboaV1ssmyr0B4arBALG1el+2RMDPu+
	RKcGBtNNpqqr745P+UM0RaOPzs3jfwCb90Rqc0I9yj8rWrEIV3Gco4Y8VHF/NU7c/Wplz+mnQmh/J
	c58WENt7YGs2g85A0IjoMDGJjddwPJN5Oa7wAAoUfnimy7erjfr6XZGmRYbvqdUzEeaC8RJSBlbkr
	/3wpdY0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHlDX-00000003TuC-1IIv;
	Fri, 16 Oct 2026 16:55:39 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHlDG-00000003Tgh-0VsD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 16:55:23 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E7E1C1691;
	Fri, 16 Oct 2026 09:55:17 -0700 (PDT)
Received: from e132581.arm.com (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9B4123F7B4;
	Fri, 16 Oct 2026 09:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792169721; bh=SyBzZt3O86TDMtF4xYx6AN6rseQVmhgogVimkx0ESIA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=m9gQkpsXroOS0sXK3iysBq2z0TYkbhTJd9S4bVPJe58BZg2zms0wk13rvpDyj9lJg
	 3TYzD5xOAUDdGNgnXg3AzZ4ifRGKQcKCBwmu+GkmaJmpBOoyrDOMO/cS12vdnyfKrp
	 AsqtVkjDcAuYAQgb9tQ3jiRcE7PMoBwULQmMjNOc=
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 16 Oct 2026 17:55:03 +0100
Subject: [PATCH v2 05/23] coresight: trbe: Validate perf handle before
 using sink data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-trbe_enable_disable_irq_handle_refactor-v2-5-3f57cf3199b1@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792169710; l=2057;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=SyBzZt3O86TDMtF4xYx6AN6rseQVmhgogVimkx0ESIA=;
 b=wxpu3pNbgVscwghOB0sXLosLqB3LMQPEfRUR07xlblcAQiyG5113/P5gYkQgZddIQnUxseLvI
 owkaZHbWhJFBOK69a5tFRS6erxFCRPiyoXTOVzUtzMzl87BqUnkMGhy
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_095522_258269_FE187ED1 
X-CRM114-Status: GOOD (  12.81  )
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

The TRBE IRQ handler calls etm_perf_sink_config(handle) before
validating the per-CPU perf handle and its AUX transaction. This may
dereference a NULL handle after disabling TRBE or access stale sink
data after perf_aux_output_end().

Validate the handle and AUX transaction before accessing the sink
configuration. Move the local buffer lookup closer to its use.
Remove the warning for a NULL handle, which is expected after
disabling TRBE.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-trbe.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
index 91fbdbad3676ffae399df0b4d4ddcd603a40e86c..a7c1037a048f5236598f8f3a7cc4f47bff9d329c 100644
--- a/drivers/hwtracing/coresight/coresight-trbe.c
+++ b/drivers/hwtracing/coresight/coresight-trbe.c
@@ -1150,12 +1150,18 @@ static irqreturn_t arm_trbe_irq_handler(int irq, void *dev)
 {
 	struct perf_output_handle **handle_ptr = dev;
 	struct perf_output_handle *handle = *handle_ptr;
-	struct trbe_buf *buf = etm_perf_sink_config(handle);
+	struct trbe_buf *buf;
 	enum trbe_fault_action act;
 	u64 status;
 	bool truncated = false;
 	u64 trfcr;
 
+	if (!handle || !perf_get_aux(handle))
+		return IRQ_NONE;
+
+	if (!is_perf_trbe(handle))
+		return IRQ_NONE;
+
 	/* Reads to TRBSR_EL1 is fine when TRBE is active */
 	status = read_sysreg_s(SYS_TRBSR_EL1);
 	/*
@@ -1171,16 +1177,11 @@ static irqreturn_t arm_trbe_irq_handler(int irq, void *dev)
 	 * Ensure the trace is visible to the CPUs and
 	 * any external aborts have been resolved.
 	 */
+	buf = etm_perf_sink_config(handle);
 	trbe_drain_and_disable_local(buf->cpudata);
 	clr_trbe_irq();
 	isb();
 
-	if (WARN_ON_ONCE(!handle) || !perf_get_aux(handle))
-		return IRQ_NONE;
-
-	if (!is_perf_trbe(handle))
-		return IRQ_NONE;
-
 	act = trbe_get_fault_act(handle, status);
 	switch (act) {
 	case TRBE_FAULT_ACT_WRAP:

-- 
2.34.1


