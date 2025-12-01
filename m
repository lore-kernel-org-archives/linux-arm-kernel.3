Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2CD4D116F5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Dec 2025 11:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+iEVKxRBEN81/5UFDM89IJ47te4dISQJ8v9BGTXO0As=; b=0HruwB4l/Xm6C42XgP1m4RvuXd
	pZKA0LHTIGZwGcBR63xKA1Is2LLkeuOadbdd51sVoi1hEX/bf1aolCVO7n2cmPWiwKqivDOH3kVmB
	wm2+ZtMv6QljROzMkBN2h9L9P0jFSVEbAUKh4VBacCzmpwJjcTLl4K2hdHoz4moYnDRR6qWc41EY2
	EcmzMRhIFJq5L7xZ0GBfRUml2IoPdNKT8doHFGAAT4YkHxpks1au0a+s97s6paYt/4LKUY+ucQgrX
	XLX9zr4Nzj3tOVUyjtqt63XoirPZJ9pszqb4hs+E6Y6Jr8GCHFGqOGnIoKJRFFAN77JEwf0ryQYSs
	WC28uV1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ1yz-00000003Qnz-2W37;
	Mon, 01 Dec 2025 11:22:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ1yx-00000003QmK-0EJg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Dec 2025 11:22:16 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A143B153B;
	Mon,  1 Dec 2025 03:22:06 -0800 (PST)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 805AB3F59E;
	Mon,  1 Dec 2025 03:22:11 -0800 (PST)
From: Leo Yan <leo.yan@arm.com>
Date: Mon, 01 Dec 2025 11:21:52 +0000
Subject: [PATCH 02/19] coresight: trbe: Remove redundant disable operation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251201-trbe_buffer_refactor_v1-1-v1-2-7da32b076b28@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764588125; l=2104;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=LVlL57O5P5f7MwWK5l7g8QTDQyd/AvEeHETO4d4e2Ps=;
 b=RpodhpxKvSfrsVziIYFhBHNuTW4TcjqOsI2+VAr7kwEFjn4Vb6bkxQ253NbM7fqnMsHaGEGHR
 zATlaMhkjzpDuIQ/+wXvqc+ZA5nKyeDYzZ5bqIQdpyoe8z14OWmxV+H
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_032215_234123_2113D30F 
X-CRM114-Status: GOOD (  14.84  )
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

The trace unit is already disabled when trbe_stop_and_truncate_event()
is called, so draining and stopping the buffer in the function is
redundant.

Remove the unnecessary disable operation and rename the function to
trbe_truncate_event() to better reflect its purpose.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-trbe.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
index 0ddb3db0213cf0014e29decfb79da68b0a351b31..2f44e4a65e0ee2b2c8fdd06a51ab01fc57f44a4e 100644
--- a/drivers/hwtracing/coresight/coresight-trbe.c
+++ b/drivers/hwtracing/coresight/coresight-trbe.c
@@ -284,18 +284,10 @@ static void trbe_report_wrap_event(struct perf_output_handle *handle)
 	perf_aux_output_flag(handle, PERF_AUX_FLAG_COLLISION);
 }
 
-static void trbe_stop_and_truncate_event(struct perf_output_handle *handle)
+static void trbe_truncate_event(struct perf_output_handle *handle)
 {
 	struct trbe_buf *buf = etm_perf_sink_config(handle);
 
-	/*
-	 * We cannot proceed with the buffer collection and we
-	 * do not have any data for the current session. The
-	 * etm_perf driver expects to close out the aux_buffer
-	 * at event_stop(). So disable the TRBE here and leave
-	 * the update_buffer() to return a 0 size.
-	 */
-	trbe_drain_and_disable_local(buf->cpudata);
 	perf_aux_output_flag(handle, PERF_AUX_FLAG_TRUNCATED);
 	perf_aux_output_end(handle, 0);
 	*this_cpu_ptr(buf->cpudata->drvdata->handle) = NULL;
@@ -1008,7 +1000,7 @@ static int __arm_trbe_enable(struct trbe_buf *buf,
 	trbe_enable_hw(buf);
 	return 0;
 err:
-	trbe_stop_and_truncate_event(handle);
+	trbe_truncate_event(handle);
 	return ret;
 }
 
@@ -1169,7 +1161,7 @@ static irqreturn_t arm_trbe_irq_handler(int irq, void *dev)
 		trbe_handle_spurious(handle);
 		break;
 	case TRBE_FAULT_ACT_FATAL:
-		trbe_stop_and_truncate_event(handle);
+		trbe_truncate_event(handle);
 		truncated = true;
 		break;
 	}

-- 
2.34.1


