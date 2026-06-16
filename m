Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5529BCD98E7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 14:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OPmsrZT2R6iMMHPV/KK9dhDkX2KkLK+pSTJBH7ORQKc=; b=MSD7r7KFxEsghssXdEWw9gwsJd
	X+dH+WW4usMOWHKRRMzwFCJ02rjPASt512wP0fEBH+gx1uNWsiMuiXnnpNwsi2AQW6iM8jqesxGKG
	PhkbCsqhmuPtE01nrGxvA9/j19cThpztxS86HpPq9xcG9/NxLTcjrL9canZOJE8tXE5zhwSQ67odT
	kBJ9dO/4mEmqbNiG+gJ+pgZgD0EK77vjufrb4NxBbQ7MJgvV2VMI054V4Qf+0PN/Ow8ISR0hIeziv
	eJv38WXtvWR6hg2G648frYPXGufEV7KYItsrHe/HsibJjr5/xy0TIqQnYx2xmhNCF3tv+SDve9ujb
	4iB5ZZYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZV8Z-0000000Fwmc-0nyf;
	Tue, 16 Jun 2026 14:51:35 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZV8T-0000000Fwjd-1VvF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Jun 2026 14:51:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 698E02008;
	Tue, 16 Jun 2026 07:51:23 -0700 (PDT)
Received: from e132581.arm.com (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2A28F3F915;
	Tue, 16 Jun 2026 07:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1781621488; bh=zoC1/c9+WvVSVLsjHXXqOJOvAPqRgs/hMu+estlqjkU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=HC7Crh5QHOE5GBKzwcAg5yHNHh4t1gZd9vuAR+1GhwR7PeG5VyKPks3uTBhfkIBmY
	 QVzCILU2aW4UFsG+3pDSaA2XzVnaLX/CeBXGoSGF515QBICIX4+PEwxunuko+e75M5
	 BonRGv/ZP6UHDlhY2BGvF8/d6Q2uEDLEhJcG9g6k=
From: Leo Yan <leo.yan@arm.com>
Date: Tue, 16 Jun 2026 15:51:09 +0100
Subject: [PATCH v9 1/9] perf cs-etm: Fix thread leaks on trace queue init
 failure
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260616-b4-arm_cs_callchain_support_v1-v9-1-f8fad931c413@arm.com>
References: <20260616-b4-arm_cs_callchain_support_v1-v9-0-f8fad931c413@arm.com>
In-Reply-To: <20260616-b4-arm_cs_callchain_support_v1-v9-0-f8fad931c413@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781621481; l=1380;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=zoC1/c9+WvVSVLsjHXXqOJOvAPqRgs/hMu+estlqjkU=;
 b=6MYTtSNDXguRtLAOhXEAoQkso5XmF1yaDeXIfVKys/VA8U6xPRt3APnu4eIF4p9z4du9GL+6u
 HOdWZ1FWC89DGtyHb/8ROfU29MPoiWf4gj2baJBWpd56mii3Owq0fup
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_075129_517670_BF452C69 
X-CRM114-Status: UNSURE (   9.92  )
X-CRM114-Notice: Please train this message.
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
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 tools/perf/util/cs-etm.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
index 0927b0b9c06b15046afeafe23fe170b8248cfcc6..d484a6155c2c22fa916d0365987302f6bb9978e9 100644
--- a/tools/perf/util/cs-etm.c
+++ b/tools/perf/util/cs-etm.c
@@ -627,6 +627,8 @@ static int cs_etm__init_traceid_queue(struct cs_etm_queue *etmq,
 					       queue->tid);
 	tidq->decode_thread = machine__findnew_thread(&etm->session->machines.host, -1,
 					       queue->tid);
+	if (!tidq->frontend_thread || !tidq->decode_thread)
+		goto out;
 
 	tidq->packet = zalloc(sizeof(struct cs_etm_packet));
 	if (!tidq->packet)
@@ -661,6 +663,8 @@ static int cs_etm__init_traceid_queue(struct cs_etm_queue *etmq,
 	zfree(&tidq->prev_packet);
 	zfree(&tidq->packet);
 out:
+	thread__zput(tidq->frontend_thread);
+	thread__zput(tidq->decode_thread);
 	return rc;
 }
 

-- 
2.34.1


