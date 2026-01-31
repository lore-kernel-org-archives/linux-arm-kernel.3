Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE462E7C6E2
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Jan 2026 20:03:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:From:Subject
	:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yU/No/CiRXNK30X5BW5gARgpwLegeQsixxR3xJoI9G0=; b=dhcgD+B1rAhU/MUz59h9eujKWm
	3HU3KbYWM8liqMvhovaFNk8VJH8jRRzNwG9f7dQQLvMGTWZMpxzm8vZH2tztrSFUv0L4OM7iGexyW
	4hJCCLlAmoLyl3hiE6LIohRxuI1YVedept4d1/tefHG0NEI05+6gtsDv48aiSZVKggYnzDp9TaatB
	HArcGKlNQkt2Vn/seZxJfyyIVG4/sqBa/mLVwR5N7hoqhRGzK8K+LMy4zHttfiEPgeF81airGVXI0
	FsnHhoYdEQPcV8ZTVhpEPCVIy8BZ7vh2tv2N/z4jLnmZMvkdvvAj/9OAXREWBmnIbCQK3MBvQq+28
	8qYjrcJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmHBZ-00000002wwY-0CVl;
	Sat, 31 Jan 2026 20:03:13 +0000
Received: from mail-dy1-x1349.google.com ([2607:f8b0:4864:20::1349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmHB4-00000002wWb-2GJJ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Jan 2026 20:02:43 +0000
Received: by mail-dy1-x1349.google.com with SMTP id 5a478bee46e88-2b7155ca88cso3346005eec.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 31 Jan 2026 12:02:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769889761; x=1770494561; darn=lists.infradead.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yU/No/CiRXNK30X5BW5gARgpwLegeQsixxR3xJoI9G0=;
        b=2ilZim0JawgMUwbqE7I/ciKOgY5DkfZiWDBE9g0LuJ3f8cr0bWyS+Kt0JnG7vSWYe/
         tYOoM1QOr7c+oP5cbIiN+qAIKqfMU35TCL52oofE+YcwV6ZTicxPBJjQ7PM+Qor80avR
         2n3YlyDCCT1omfGs1+nlfmG+4GiiNKIr7xCfzWdrGzRezAsJndwl+KMN1y/HwUipfEfC
         Hj+89mR0BWnlqBuK8qBOXAuN+Sm7nezBq3tL4blsc9CbTwH7K2d5zBIU2bL2kDM6PDcu
         OjPVp25feXnX+onMTEobBlShi0NI8KWY2p01UOq71Kv/zz2DGUAJFcpVqFPZL3YuUt/y
         gaug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769889761; x=1770494561;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yU/No/CiRXNK30X5BW5gARgpwLegeQsixxR3xJoI9G0=;
        b=BmRvWMqytZrTalkq0Hmv9Nj8I3Pf/xQTdmEaD1wL3QlxTM1Vl3DtiDGykHQpYVF/dE
         BYmwALuKXqU8tZI7BNSx6vXOmQk8rA2K4U/4B3HhgkD5xg9OtwSh0o1JaYhsWlXQi017
         OuVvECNsteqmIHmnEFJ5EMXPIKmfiHcuDdM+Yd2b/Vijrjjp6NUW2k0HwKaCRhvqcJBU
         Ne1ozWX6kqur7jITACtu75aibVYceE9dMZ+lTz0FuOyg8L2f0gTLXZl2VeLY68kWKpB3
         Mju5z89OlP4FItiYYnoq4oMthSgT+G3Nu6B6bOaPk8qSyl6dLowgTqmN3n0q5T0WFVK1
         sD3Q==
X-Forwarded-Encrypted: i=1; AJvYcCVyZwvwGlYXk8k2OKZilF7IIMLOHKeDAwHUgyPTTX21R/CuxOM6+5kFopZxiFlR9ZuMRyYAIqCKtztSay2erpmN@lists.infradead.org
X-Gm-Message-State: AOJu0YyOPFsufIYAA4Pxn8dw701MGMUH97/kJHRAL0pOyr6W0nNBiRPq
	xFmiWI5aPurzfNpBn9+cBWN7JHBTum0SVwwOt60qPNvi1Fuq4VZFaN9wPo8NxjbDlY3O1gF6XoV
	oiw9gWfPeXQ==
X-Received: from dyek9.prod.google.com ([2002:a05:7300:6409:b0:2b7:4867:6bd0])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:693c:2b13:b0:2ae:614a:330e
 with SMTP id 5a478bee46e88-2b7c8943db0mr3682412eec.41.1769889761125; Sat, 31
 Jan 2026 12:02:41 -0800 (PST)
Date: Sat, 31 Jan 2026 12:02:24 -0800
In-Reply-To: <20260131200224.1296136-1-irogers@google.com>
Mime-Version: 1.0
References: <20260131200224.1296136-1-irogers@google.com>
X-Mailer: git-send-email 2.53.0.rc1.225.gd81095ad13-goog
Message-ID: <20260131200224.1296136-7-irogers@google.com>
Subject: [PATCH v2 6/6] perf thread: Don't require machine to compute the e_machine
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, John Garry <john.g.garry@oracle.com>, 
	Will Deacon <will@kernel.org>, Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Shimin Guo <shimin.guo@skydio.com>, Yunseong Kim <ysk@kzalloc.com>, 
	Athira Rajeev <atrajeev@linux.ibm.com>, Quan Zhou <zhouquan@iscas.ac.cn>, 
	Andrew Jones <ajones@ventanamicro.com>, Anup Patel <anup@brainfault.org>, 
	Dapeng Mi <dapeng1.mi@linux.intel.com>, Thomas Falcon <thomas.falcon@intel.com>, 
	Blake Jones <blakejones@google.com>, Swapnil Sapkal <swapnil.sapkal@amd.com>, 
	Kan Liang <kan.liang@linux.intel.com>, Howard Chu <howardchu95@gmail.com>, 
	Anubhav Shelat <ashelat@redhat.com>, Aditya Bodkhe <aditya.b1@linux.ibm.com>, 
	Chun-Tse Shao <ctshao@google.com>, Andi Kleen <ak@linux.intel.com>, 
	Dmitry Vyukov <dvyukov@google.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260131_120242_600024_0ADF0B8C 
X-CRM114-Status: GOOD (  14.52  )
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

The machine can be calculated from a thread via its maps. Don't
require the machine argument to simplify callers and also to delay
computing the machine until a little later.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/scripting-engines/trace-event-python.c | 8 +++-----
 tools/perf/util/session.c                              | 3 +--
 tools/perf/util/thread.c                               | 5 +++++
 3 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/tools/perf/util/scripting-engines/trace-event-python.c b/tools/perf/util/scripting-engines/trace-event-python.c
index 62c9c73daef5..2b0df7bd9a46 100644
--- a/tools/perf/util/scripting-engines/trace-event-python.c
+++ b/tools/perf/util/scripting-engines/trace-event-python.c
@@ -837,7 +837,6 @@ static PyObject *get_perf_sample_dict(struct perf_sample *sample,
 					 PyObject *callchain)
 {
 	PyObject *dict, *dict_sample, *brstack, *brstacksym;
-	struct machine *machine;
 	uint16_t e_machine = EM_HOST;
 	uint32_t e_flags = EF_HOST;
 
@@ -926,10 +925,9 @@ static PyObject *get_perf_sample_dict(struct perf_sample *sample,
 			PyLong_FromUnsignedLongLong(sample->cyc_cnt));
 	}
 
-	if (al->thread) {
-		machine = maps__machine(thread__maps(al->thread));
-		e_machine = thread__e_machine(al->thread, machine, &e_flags);
-	}
+	if (al->thread)
+		e_machine = thread__e_machine(al->thread, /*machine=*/NULL, &e_flags);
+
 	if (set_regs_in_dict(dict, sample, evsel, e_machine, e_flags))
 		Py_FatalError("Failed to setting regs in dict");
 
diff --git a/tools/perf/util/session.c b/tools/perf/util/session.c
index 53f51c3f9603..4b465abfa36c 100644
--- a/tools/perf/util/session.c
+++ b/tools/perf/util/session.c
@@ -2972,9 +2972,8 @@ struct perf_session__e_machine_cb_args {
 static int perf_session__e_machine_cb(struct thread *thread, void *_args)
 {
 	struct perf_session__e_machine_cb_args *args = _args;
-	struct machine *machine = maps__machine(thread__maps(thread));
 
-	args->e_machine = thread__e_machine(thread, machine, &args->e_flags);
+	args->e_machine = thread__e_machine(thread, /*machine=*/NULL, &args->e_flags);
 	return args->e_machine != EM_NONE ? 1 : 0;
 }
 
diff --git a/tools/perf/util/thread.c b/tools/perf/util/thread.c
index 618f29afb160..22be77225bb0 100644
--- a/tools/perf/util/thread.c
+++ b/tools/perf/util/thread.c
@@ -499,6 +499,11 @@ uint16_t thread__e_machine(struct thread *thread, struct machine *machine, uint3
 		return e_machine;
 	}
 
+	if (machine == NULL) {
+		struct maps *maps = thread__maps(thread);
+
+		machine = maps__machine(maps);
+	}
 	tid = thread__tid(thread);
 	pid = thread__pid(thread);
 	if (pid != tid) {
-- 
2.53.0.rc1.225.gd81095ad13-goog


