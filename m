Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B983EC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 19:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MeYGURnYxrZGBG+Ubo7k4tGB8KJ18u7ywYEwcehYbyI=; b=nRCTPou10ymzOlE5FUtIOTblsg
	XyidpVeyOyM6LN+1AxL2lAlA7ll5nCdSI8EWHkcbImZZ66fcuKHTb/OEl9PwT20vaSqCtupgQsBLO
	vzHNJU7HG766oVdGHeaSW1E7iw3hguIbYtNf1mSWoEODoZKYpba/3h35JVdGNqDzgfQBdQd1Hc9pu
	Opo4Y351DL2Ak5ZbnmU+J7/k08OXyBLZbPVR+JptMyGAbnsySp1uKK4MJWbGRbUTE8ij3o3nGbwgE
	Xs2F9UK4suRvis5sl0h3tYMYpxjxtbxBE+vK3m8giLJe7+sdwT+i4bOUxF779alGt2w04CIKQ2ZKC
	tbZoU9TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfNSC-00000005OmI-4AJ9;
	Thu, 02 Jul 2026 19:52:08 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfNSA-00000005OlR-1H98
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 19:52:07 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 03C6235B7;
	Thu,  2 Jul 2026 12:52:01 -0700 (PDT)
Received: from e132581.arm.com (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 72BFA3F673;
	Thu,  2 Jul 2026 12:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783021925; bh=y002zKxyZB0uXe6NnnbJmRPydE3S8YZiuy6SoqsWzTc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=jRjjvEhacZ44t2JA5R6t1xXtRZk3PYY1jrubF29h6YqDb8q9vt0/lIbrAKJjNXkU2
	 CJ/Vh5l6P3mIxrSbtY+FzvaZzZ/wJCaIeFZc5TPRVbRG74/3eYhugLipIVHpersgH6
	 KJ+YqAYLIqppHGq5Zq9LEKc0JtzwG7IqRQY7srSg=
From: Leo Yan <leo.yan@arm.com>
Date: Thu, 02 Jul 2026 20:51:36 +0100
Subject: [PATCH v11 1/9] perf cs-etm: Fix thread leaks on trace queue init
 failure
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-b4-arm_cs_callchain_support_v1-v11-1-846abbf600d7@arm.com>
References: <20260702-b4-arm_cs_callchain_support_v1-v11-0-846abbf600d7@arm.com>
In-Reply-To: <20260702-b4-arm_cs_callchain_support_v1-v11-0-846abbf600d7@arm.com>
To: Arnaldo Carvalho de Melo <acme@kernel.org>, 
 John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, 
 James Clark <james.clark@linaro.org>, Mike Leach <mike.leach@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, Al Grant <al.grant@arm.com>, 
 Paschalis Mpeis <paschalis.mpeis@arm.com>, Amir Ayupov <aaupov@fb.com>
Cc: linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org, 
 linux-perf-users@vger.kernel.org, Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783021918; l=1431;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=y002zKxyZB0uXe6NnnbJmRPydE3S8YZiuy6SoqsWzTc=;
 b=Z/BvdumWWPfxasbe4TeuHwYB0CKly+wYh4/2TbuBf1kcNwPxa3dM9szZ9bzaILVX9LSqDspw0
 D82Gg2aHk5ND33J8ikZw9LUmbcW/AvFW+LP4IIoE4zJBxHgu9y2A91D
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_125206_393540_BB1180CE 
X-CRM114-Status: GOOD (  10.37  )
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

cs_etm__init_traceid_queue() allocates the frontend and decode threads,
if a later allocation fails, the error path does not drop thread
reference that was already acquired.

Release both thread pointers with thread__zput() on the error path, so
does not leak thread references or leave stale pointers behind.

Fixes: 951ccccdc715 ("perf cs-etm: Only track threads instead of PID and TIDs")
Reviewed-by: James Clark <james.clark@linaro.org>
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 tools/perf/util/cs-etm.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
index 2284cda78abe1341d3823d2cfed027e711ff7e62..deca07d57282e431ff4d86350e222092930d330f 100644
--- a/tools/perf/util/cs-etm.c
+++ b/tools/perf/util/cs-etm.c
@@ -645,6 +645,8 @@ static int cs_etm__init_traceid_queue(struct cs_etm_queue *etmq,
 					       queue->tid);
 	tidq->decode_thread = machine__findnew_thread(&etm->session->machines.host, -1,
 					       queue->tid);
+	if (!tidq->frontend_thread || !tidq->decode_thread)
+		goto out;
 
 	tidq->packet = zalloc(sizeof(struct cs_etm_packet));
 	if (!tidq->packet)
@@ -679,6 +681,8 @@ static int cs_etm__init_traceid_queue(struct cs_etm_queue *etmq,
 	zfree(&tidq->prev_packet);
 	zfree(&tidq->packet);
 out:
+	thread__zput(tidq->frontend_thread);
+	thread__zput(tidq->decode_thread);
 	return rc;
 }
 

-- 
2.34.1


