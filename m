Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5648EC624D3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 16:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1FmwgBnF7ivRkTiZaJQUXFfrSzr8cBynCbocKJZ8k2Y=; b=ogq2fXkEVpMroGD9oOFrHNEEyj
	Y+ebY1XOGfRGmUJ6uYjtT0tGEPoG9n8c+Hao3AL8mtijbq1HtxeRb0kRXvfrkbvCtNz72acZws3r6
	SqfYkweykDi0oFwRpnuju7nACmdMUhQ0+yASRanlSR3UW+tOVwl5EDKT/DvJPw5s1Bsmm5ExONepV
	kt3hLtb9Ud8fULRemExOwchLZiZnA42NdwYHErnhLV8mC4TDFLfnI+vZgu3zz0iZSmt1dlcaOn2xH
	fiDxnJUBJ566wwYEz1Lx4QVX4FCWmHO7FysOk5YNFkCgEp7UsEls9CmVwR4m2wo5yru29YMGPfIAd
	mpk+L8cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1RTZ-0000000CgD2-3D27;
	Tue, 01 Sep 2026 16:36:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1RTN-0000000Cg99-3JhJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 16:36:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 479931756;
	Tue,  1 Sep 2026 09:36:29 -0700 (PDT)
Received: from e132581.arm.com (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 436883F85F;
	Tue,  1 Sep 2026 09:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788280593; bh=plbS3HrWoctD/KTUTIyQWYwlq1nvdgjH+NpGvIk01I0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Rvw1F4JqFT9cmvfKZRxPyC/CyJi67KrhZbPdsaRElG7OG4W1iSsG6YHGXDbveaNBr
	 GXDQuv2tEcSYrw0/EVsUH2EGMXpkB1+PETo0WQuEVIL1zRNhrics/94/sKwvuHtGPC
	 taC87RhVxDsDn+VLt0PZrzeKrPkXQAa7JTnRYDP8=
From: Leo Yan <leo.yan@arm.com>
Date: Tue, 01 Sep 2026 17:36:17 +0100
Subject: [PATCH 3/3] coresight: perf: Suppress ITRACE start records
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-perf_suppress_itrace_start_records-v1-3-c4fbc6860859@arm.com>
References: <20260901-perf_suppress_itrace_start_records-v1-0-c4fbc6860859@arm.com>
In-Reply-To: <20260901-perf_suppress_itrace_start_records-v1-0-c4fbc6860859@arm.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Will Deacon <will@kernel.org>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mark Rutland <mark.rutland@arm.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 James Clark <james.clark@linaro.org>, Mike Leach <mike.leach@arm.com>, 
 Tamas Petz <tamas.petz@arm.com>, Tamas Zsoldos <tamas.zsoldos@arm.com>
Cc: linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org, 
 Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788280584; l=1225;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=plbS3HrWoctD/KTUTIyQWYwlq1nvdgjH+NpGvIk01I0=;
 b=M2xhsj9QnStXjg3/CiMvt7fs5r0R/XWoUkx20EZFiAisrr2dCZzjJbYY5Mj6SIxtIj7qKyvHO
 VipAxQad+BbDz1TkoYFA1EA67dG2VjzHfDd/uuk+eI5PPdPX1L9B0jf
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_093633_981670_5BF64059 
X-CRM114-Status: GOOD (  10.61  )
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

PERF_RECORD_ITRACE_START establishes the initial thread context at the
beginning of a trace. Afterwards, decoders track the thread context using
context packets.

Call perf_event_itrace_started() after successfully starting the event
to prevent perf core from emitting redundant PERF_RECORD_ITRACE_START
records when the event is scheduled in again.

When per-thread mode traces multiple child threads, tooling should
enable context ID tracing instead to identify each thread.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-etm-perf.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
index 09b21a711a8764ea429d712890265c84648e889e..80502e8b084074980000a039e73e1a164940011d 100644
--- a/drivers/hwtracing/coresight/coresight-etm-perf.c
+++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
@@ -613,6 +613,8 @@ static void etm_event_start(struct perf_event *event, int flags)
 		perf_report_aux_output_id(event, hw_id);
 	}
 
+	perf_event_itrace_started(event);
+
 out:
 	/* Tell the perf core the event is alive */
 	event->hw.state = 0;

-- 
2.34.1


