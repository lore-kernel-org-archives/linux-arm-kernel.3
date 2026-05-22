Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08E6ECD5BB0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 22:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sDdmXqvEMI43mhKt8ZAE/A+JQXqAF6Df2G8xQMsdPH0=; b=ZT0RYErWuiSR1ZEWbDvY4A+Lgt
	SGk1ia7OeDVbRJaMMrUGw41h+SRqkKaRGvhGFqQPI07bFmYmKnP+Ci9z9x4w3+jewC9J1UOx0v1jA
	omt1bVGkExJuZN6y403lT/73qBISb3353brVWxwkaVgwNr7Y/EOQ4WSscT5x76a4aEwMVVMtpUHNV
	f72udRDWyAVn1QgAEm3tjUZ5rCy8+rS0DrvmHGtsTH5YSgsHdxcDh2GmPhPlgooq7FwW42ZtMLYyE
	7bK0I6Dkx9cV3Np7gFZDiG2/cYX5FdJxKe1fIgS6aunkeln0jV52By+1+75poeuKZYSRiO7ebWMq/
	ITrrhd1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQXzh-0000000C33G-35Dj;
	Fri, 22 May 2026 22:05:25 +0000
Received: from mail-dy1-x1349.google.com ([2607:f8b0:4864:20::1349])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQXzQ-0000000C2l6-069k
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 22:05:09 +0000
Received: by mail-dy1-x1349.google.com with SMTP id 5a478bee46e88-2f2d983d109so4312329eec.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 15:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779487507; x=1780092307; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=sDdmXqvEMI43mhKt8ZAE/A+JQXqAF6Df2G8xQMsdPH0=;
        b=J7OCk5THx2gbhXvJIF7urjmSpANPhCVi6gdK2ZWbCff61rNsGSqNMtqu1QAO0RMDaa
         7cBXDmQNGYntDN5grbvuJwoGiEKBIOLim+peyIcryi64ZWGEgisTgYPgOM33gjThrdYP
         WtQqcQk0Q6Bc18z/yeqTlA8u7iJ60dT1lEcjm2lm1gHt2chT6I1/DtZKWJqNGQJ5pTDm
         bMlLyL3OzSHK8TDLb7I2z14o59H4kjVnL7WIYcgn8SPU8mFi2n3S1aSdQja3a0nYgkxh
         rXp+uKtusOQGyq62fl4v+HXjsecQv2QHuTDqgcRB0UqpZWxnl4NA7F4+hvuRkM7WZUPV
         6SAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779487507; x=1780092307;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sDdmXqvEMI43mhKt8ZAE/A+JQXqAF6Df2G8xQMsdPH0=;
        b=dD2Ge3TKr33vVApUICyc6C8HQPWiILIOXefjzX6YvPSK6NdaAU2TNAOY6uOhENMEiY
         LbdqK2g0oiPM+9tcDjWrbivfb8Z8u9H5LMsPF3UjxX5aFJRTJuDp/OdJblgGg2sk6j4z
         TmU4V4FYrkaL1FCf6cqNNbujqOhp2Hly2h4Ywwj2FEDyCzrTo08ef/E2TDEalsy3yU8f
         /ojktLoEVO0HrenV0vnuvoxdyWQqZYuu006Fcpuk3fyDf5IzgN7qQzKKXf4U/9StY6Hb
         9iZ6rGB0ElC+hlJpCI4RAQQ/mJ2d2TtChmuLYWvo5u1MRV8ttaxMQriFOJRKa/aRLVUh
         2OgA==
X-Forwarded-Encrypted: i=1; AFNElJ89NTD2Z5zik4QnuC6pMmkYFlS6IfsAFISj6ImSm0WY3xg1QLsVU84RqK3lgbtnmwCJxPBQMRkvQtBul2zI0ZlC@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9G2mmk5jddSLFfjsE/SCvKUUTdjIDOUhzY25WpzTmsHIIiJyY
	Ioyoc14N7o5oqya+TY4eHgSzzjfm3yyr2wm5km2mrTOB8OWmLEyxeeNf7RWSXfc0H6wMmFMMdGC
	gYxrMu/QMQw==
X-Received: from dybtv21.prod.google.com ([2002:a05:7300:f495:b0:2f9:af7:503f])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:7f9f:b0:2d8:97d6:6ac8
 with SMTP id 5a478bee46e88-30449141470mr2895866eec.21.1779487506383; Fri, 22
 May 2026 15:05:06 -0700 (PDT)
Date: Fri, 22 May 2026 15:04:23 -0700
In-Reply-To: <20260522220435.2378363-1-irogers@google.com>
Mime-Version: 1.0
References: <20260428071903.1886173-1-irogers@google.com> <20260522220435.2378363-1-irogers@google.com>
X-Mailer: git-send-email 2.54.0.794.g4f17f83d09-goog
Message-ID: <20260522220435.2378363-13-irogers@google.com>
Subject: [PATCH v9 12/23] perf python: Use evsel in sample in pyrf_event
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, namhyung@kernel.org
Cc: adrian.hunter@intel.com, alice.mei.rogers@gmail.com, 
	dapeng1.mi@linux.intel.com, james.clark@linaro.org, leo.yan@linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, mingo@redhat.com, peterz@infradead.org, 
	tmricht@linux.ibm.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_150508_121788_4A2F0734 
X-CRM114-Status: GOOD (  14.12  )
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

Avoid a duplicated evsel by using the one in sample. Add
evsel__get/put to the evsel in perf_sample.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/evsel.c  |  2 +-
 tools/perf/util/python.c | 10 +++-------
 tools/perf/util/sample.c | 17 ++++++++++++-----
 3 files changed, 16 insertions(+), 13 deletions(-)

diff --git a/tools/perf/util/evsel.c b/tools/perf/util/evsel.c
index 37e8950ee990..957983e4fd53 100644
--- a/tools/perf/util/evsel.c
+++ b/tools/perf/util/evsel.c
@@ -3244,7 +3244,7 @@ int evsel__parse_sample(struct evsel *evsel, union perf_event *event,
 	union u64_swap u;
 
 	perf_sample__init(data, /*all=*/true);
-	data->evsel = evsel;
+	data->evsel = evsel__get(evsel);
 	data->cpu = data->pid = data->tid = -1;
 	data->stream_id = data->id = data->time = -1ULL;
 	data->period = evsel->core.attr.sample_period;
diff --git a/tools/perf/util/python.c b/tools/perf/util/python.c
index 7778f88c3810..e14e857cf90b 100644
--- a/tools/perf/util/python.c
+++ b/tools/perf/util/python.c
@@ -45,7 +45,6 @@ PyMODINIT_FUNC PyInit_perf(void);
 
 struct pyrf_event {
 	PyObject_HEAD
-	struct evsel *evsel;
 	struct perf_sample sample;
 	union perf_event   event;
 };
@@ -276,7 +275,6 @@ static PyMemberDef pyrf_sample_event__members[] = {
 
 static void pyrf_sample_event__delete(struct pyrf_event *pevent)
 {
-	evsel__put(pevent->evsel);
 	perf_sample__exit(&pevent->sample);
 	Py_TYPE(pevent)->tp_free((PyObject*)pevent);
 }
@@ -298,7 +296,7 @@ static PyObject *pyrf_sample_event__repr(const struct pyrf_event *pevent)
 #ifdef HAVE_LIBTRACEEVENT
 static bool is_tracepoint(const struct pyrf_event *pevent)
 {
-	return pevent->evsel->core.attr.type == PERF_TYPE_TRACEPOINT;
+	return pevent->sample.evsel->core.attr.type == PERF_TYPE_TRACEPOINT;
 }
 
 static PyObject*
@@ -345,7 +343,7 @@ tracepoint_field(const struct pyrf_event *pe, struct tep_format_field *field)
 static PyObject*
 get_tracepoint_field(struct pyrf_event *pevent, PyObject *attr_name)
 {
-	struct evsel *evsel = pevent->evsel;
+	struct evsel *evsel = pevent->sample.evsel;
 	struct tep_event *tp_format = evsel__tp_format(evsel);
 	struct tep_format_field *field;
 
@@ -511,7 +509,7 @@ static PyObject *pyrf_event__new(const union perf_event *event)
 	pevent = PyObject_New(struct pyrf_event, ptype);
 	if (pevent != NULL) {
 		memcpy(&pevent->event, event, event->header.size);
-		pevent->evsel = NULL;
+		perf_sample__init(&pevent->sample, /*all=*/false);
 	}
 	return (PyObject *)pevent;
 }
@@ -1802,8 +1800,6 @@ static PyObject *pyrf_evlist__read_on_cpu(struct pyrf_evlist *pevlist,
 			return Py_None;
 		}
 
-		pevent->evsel = evsel__get(evsel);
-
 		perf_mmap__consume(&md->core);
 
 		err = evsel__parse_sample(evsel, &pevent->event, &pevent->sample);
diff --git a/tools/perf/util/sample.c b/tools/perf/util/sample.c
index cf73329326d7..bccc19e2aaf2 100644
--- a/tools/perf/util/sample.c
+++ b/tools/perf/util/sample.c
@@ -1,18 +1,23 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 #include "sample.h"
+
+#include <stdlib.h>
+#include <string.h>
+
+#include <elf.h>
+#include <linux/zalloc.h>
+
+#include "../../arch/x86/include/asm/insn.h"
 #include "debug.h"
+#include "evsel.h"
 #include "thread.h"
-#include <elf.h>
+
 #ifndef EM_CSKY
 #define EM_CSKY		252
 #endif
 #ifndef EM_LOONGARCH
 #define EM_LOONGARCH	258
 #endif
-#include <linux/zalloc.h>
-#include <stdlib.h>
-#include <string.h>
-#include "../../arch/x86/include/asm/insn.h"
 
 void perf_sample__init(struct perf_sample *sample, bool all)
 {
@@ -29,6 +34,8 @@ void perf_sample__init(struct perf_sample *sample, bool all)
 
 void perf_sample__exit(struct perf_sample *sample)
 {
+	evsel__put(sample->evsel);
+	sample->evsel = NULL;
 	zfree(&sample->user_regs);
 	zfree(&sample->intr_regs);
 	if (sample->merged_callchain) {
-- 
2.54.0.794.g4f17f83d09-goog


