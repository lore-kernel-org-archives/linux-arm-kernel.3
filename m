Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 250CDD116F1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Dec 2025 11:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AKUXwxRnHMPAYKymyr7pglAj03cR5A5H2/hnyZYc+uM=; b=n/Yw3QnTZznUDCxmrCN2UDHuil
	q8DpB27sT17ls+Ua7tctTSZKbVhZaqYTld0vakTZyLqm73roNstSmi+0Xc4+F1rpWYjB1tPzo6gf4
	8Pk6hRE6Q/uM4cwRYl3d8ypd42Y7SSR+XgcmAZowVNp/FDI7XvYN3VMVxKSjthR4YkUrHQeTQ1Tau
	IjmAD/AFc5Q/2LJXnbyoxXn0p7E2VJNkwZFZ62oRxHqN9BEa80qi+Qs9SKO4+shenAuHSgtyUuAKa
	18qorB9gHOTkwxnkSNzmj7PQhzzMrKaJOW48ZQBW0lpu7f0Oq+4yEIwK8rfVjtVoX8eoA9TYhZ8Rx
	aQOHhF6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ1zJ-00000003R5b-0Dbx;
	Mon, 01 Dec 2025 11:22:37 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ1zG-00000003R22-0axp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Dec 2025 11:22:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 35121153B;
	Mon,  1 Dec 2025 03:22:26 -0800 (PST)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 13E583F59E;
	Mon,  1 Dec 2025 03:22:30 -0800 (PST)
From: Leo Yan <leo.yan@arm.com>
Date: Mon, 01 Dec 2025 11:21:59 +0000
Subject: [PATCH 09/19] coresight: trbe: Add fault action argument to
 trbe_handle_overflow()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251201-trbe_buffer_refactor_v1-1-v1-9-7da32b076b28@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764588125; l=1665;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=ksnOW813/iK1sop8lflRXFLjB5lzQz2UyBhXvDajeUw=;
 b=FymtGmZmDoYUeDSYYDJzHDfusIr5gd+3LCACayX07U7EGpHbpD/+PMIJnWQTugSmTqfH0PXGq
 LRhPTtr7wwiAxLQTaUOGwzOHMYh5s/lK2CI47ZA0OnwDtEerPJg1MSC
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_032234_253656_AB4D2777 
X-CRM114-Status: GOOD (  10.98  )
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

Add a new argument to trbe_handle_overflow() for the fault action, which
is used to compare the wrap event for trace size calculation.

No functional change intended; this is preparation for a later update.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-trbe.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
index 0caa4a6b437a3aa39fc6bcc72a23711b54f7c598..f56ecdeaa6596afb440e4d53732e08a85f9bf89d 100644
--- a/drivers/hwtracing/coresight/coresight-trbe.c
+++ b/drivers/hwtracing/coresight/coresight-trbe.c
@@ -1078,14 +1078,15 @@ static void trbe_handle_spurious(struct perf_output_handle *handle)
 	set_trbe_enabled(buf->cpudata, trblimitr);
 }
 
-static int trbe_handle_overflow(struct perf_output_handle *handle)
+static int trbe_handle_overflow(struct perf_output_handle *handle,
+				enum trbe_fault_action act)
 {
 	struct perf_event *event = handle->event;
 	struct trbe_buf *buf = etm_perf_sink_config(handle);
 	unsigned long size;
 	struct etm_event_data *event_data;
 
-	size = trbe_get_trace_size(handle, buf, true);
+	size = trbe_get_trace_size(handle, buf, act == TRBE_FAULT_ACT_WRAP);
 	if (buf->snapshot)
 		handle->head += size;
 
@@ -1179,7 +1180,7 @@ static irqreturn_t arm_trbe_irq_handler(int irq, void *dev)
 
 	switch (act) {
 	case TRBE_FAULT_ACT_WRAP:
-		truncated = !!trbe_handle_overflow(handle);
+		truncated = !!trbe_handle_overflow(handle, act);
 		break;
 	case TRBE_FAULT_ACT_SPURIOUS:
 		trbe_handle_spurious(handle);

-- 
2.34.1


