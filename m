Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA10AFF8860
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Apr 2026 17:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LcG6S8sD2yT7zpeIqrswUwSHsWXSEMkUZJMomhjZP3s=; b=2VDADvavbvmWOYGotzay2RLCZM
	hCQwi28uu7y/RuzE7yWhY5QUHw5TUQh2PgDs8bBaawYE2m0PKxOBZCdC1+Ou9BXbrSMj55fR5uvEU
	Z9cG1hdfAny7KrxE7WVQgWHe2fEGO84IfsJKwdpYK8jAWYlflbV9kbSy+tc1nESF/A3OgajEu+ZnA
	JJXm+z4pviBX+ka3+WYMekjiBFrw4oMlLQkKidLwInPjboNCdSpbmvZxqKsUUlE3leYdf0PdpgNGM
	fuqqYg1x5dfKPH8fYdQoowYlbjCH3bvY0ZR672OttC4KU0ruNTEkhURrR406GN0s9TIjpIVTUPnAm
	TTfAl71A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGh8X-0000000Ecmo-44vF;
	Sat, 25 Apr 2026 17:49:49 +0000
Received: from mail-dy1-x134a.google.com ([2607:f8b0:4864:20::134a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGh8B-0000000EcJl-3MHt
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Apr 2026 17:49:28 +0000
Received: by mail-dy1-x134a.google.com with SMTP id 5a478bee46e88-2ba9a744f7dso11617878eec.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Apr 2026 10:49:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777139367; x=1777744167; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=LcG6S8sD2yT7zpeIqrswUwSHsWXSEMkUZJMomhjZP3s=;
        b=lad5f0QPGoEBGLBwcmwEcOTIuOwohJMBKpYygvAqmJp2CK88bFPKw+r8hXbkZEqN3K
         b2zWr5AneoFFTUq3zzyTxWqXRC+f96f8oyGOQMOed96z1znUJtE+aQVMof+GQSNvPHTg
         55h3GYpMWHfCgj3EufBge5dMO3ERKsUV/sTAsngsO8J9rrmzSkYnT4VnAX2fhUBQ4s+t
         pE15XP3gv8Fgm4meYmdUold89N5GhEGSAs3w8kIo3tr6ZtrF3R52iWVXszce4x5mfCxD
         krgM9U/EKABX8+eig0XYo/wBLld28Yjp/YOxSeoeqjAdr8K+sE9YasAtdURLqzuGXPXk
         k7zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777139367; x=1777744167;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LcG6S8sD2yT7zpeIqrswUwSHsWXSEMkUZJMomhjZP3s=;
        b=h8NdNT1vqQ/7RJptDgYUbgIibm9bCTXHu77so1vzZGUdsQ4+EMmWsUINyMDYGxlHXe
         9QsxD4z0hsct6VN870Ylt1Toae8KVKgHCJze54QuUxvYuJCyoPu7HBhrzk8u9f6zoHpM
         Y29Q9f7w/mwGkka1D5NNjJOFaLQug72PTAf4vk2ftde6K10vvYrWxTrcYm6cvhPXva48
         F2ltJUKmsXWHdEb4S2FrDEFqFEiRoljKY7sISBUBnr5QPFPymEYyRvekG7r0cebdNXRG
         SzFtlQT0K/gdcMBoUfg4UYNL1WALUozJn09kdfk02HCkBlYfQpMrMJkjQRwrNyMR2YUq
         GySw==
X-Forwarded-Encrypted: i=1; AFNElJ/XLxcXRpfsYy3zK9QeGA7hMWwIM9pE9CIQmjh030D8vGY1fd2Efs5b+3J8yWFPvoAw0PrB6mx8jkCbuxNbn46b@lists.infradead.org
X-Gm-Message-State: AOJu0YxOgTIIGPFqK/OfCzm7WJTEjpe20AjArRG2gMZrzk95C62hNUoW
	GgD6ZcZdvcXaIqoDYUCN1REqBBJTeYlDfLsUYLqfLjtGf9ccQqfsL0gxenPs3POY1gqlzpWPGfe
	cYvDemo12cg==
X-Received: from dycme6.prod.google.com ([2002:a05:693c:2406:b0:2d9:8c75:b19e])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:7fa6:b0:2d9:6373:ad09
 with SMTP id 5a478bee46e88-2e479019158mr21380798eec.25.1777139366672; Sat, 25
 Apr 2026 10:49:26 -0700 (PDT)
Date: Sat, 25 Apr 2026 10:48:11 -0700
In-Reply-To: <20260425174858.3922152-1-irogers@google.com>
Mime-Version: 1.0
References: <20260424164721.2229025-1-irogers@google.com> <20260425174858.3922152-1-irogers@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260425174858.3922152-14-irogers@google.com>
Subject: [PATCH v6 13/59] perf python: Use evsel in sample in pyrf_event
From: Ian Rogers <irogers@google.com>
To: acme@kernel.org, adrian.hunter@intel.com, james.clark@linaro.org, 
	leo.yan@linux.dev, namhyung@kernel.org, tmricht@linux.ibm.com
Cc: alice.mei.rogers@gmail.com, dapeng1.mi@linux.intel.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, mingo@redhat.com, peterz@infradead.org, 
	Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260425_104927_837692_D321C471 
X-CRM114-Status: GOOD (  13.89  )
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
index 3015b9b4b4da..9b16d832810f 100644
--- a/tools/perf/util/evsel.c
+++ b/tools/perf/util/evsel.c
@@ -3235,7 +3235,7 @@ int evsel__parse_sample(struct evsel *evsel, union perf_event *event,
 	union u64_swap u;
 
 	perf_sample__init(data, /*all=*/true);
-	data->evsel = evsel;
+	data->evsel = evsel__get(evsel);
 	data->cpu = data->pid = data->tid = -1;
 	data->stream_id = data->id = data->time = -1ULL;
 	data->period = evsel->core.attr.sample_period;
diff --git a/tools/perf/util/python.c b/tools/perf/util/python.c
index 0162d8a625de..0424290f8b77 100644
--- a/tools/perf/util/python.c
+++ b/tools/perf/util/python.c
@@ -43,7 +43,6 @@ PyMODINIT_FUNC PyInit_perf(void);
 
 struct pyrf_event {
 	PyObject_HEAD
-	struct evsel *evsel;
 	struct perf_sample sample;
 	union perf_event   event;
 };
@@ -274,7 +273,6 @@ static PyMemberDef pyrf_sample_event__members[] = {
 
 static void pyrf_sample_event__delete(struct pyrf_event *pevent)
 {
-	evsel__put(pevent->evsel);
 	perf_sample__exit(&pevent->sample);
 	Py_TYPE(pevent)->tp_free((PyObject*)pevent);
 }
@@ -296,7 +294,7 @@ static PyObject *pyrf_sample_event__repr(const struct pyrf_event *pevent)
 #ifdef HAVE_LIBTRACEEVENT
 static bool is_tracepoint(const struct pyrf_event *pevent)
 {
-	return pevent->evsel->core.attr.type == PERF_TYPE_TRACEPOINT;
+	return pevent->sample.evsel->core.attr.type == PERF_TYPE_TRACEPOINT;
 }
 
 static PyObject*
@@ -343,7 +341,7 @@ tracepoint_field(const struct pyrf_event *pe, struct tep_format_field *field)
 static PyObject*
 get_tracepoint_field(struct pyrf_event *pevent, PyObject *attr_name)
 {
-	struct evsel *evsel = pevent->evsel;
+	struct evsel *evsel = pevent->sample.evsel;
 	struct tep_event *tp_format = evsel__tp_format(evsel);
 	struct tep_format_field *field;
 
@@ -509,7 +507,7 @@ static PyObject *pyrf_event__new(const union perf_event *event)
 	pevent = PyObject_New(struct pyrf_event, ptype);
 	if (pevent != NULL) {
 		memcpy(&pevent->event, event, event->header.size);
-		pevent->evsel = NULL;
+		perf_sample__init(&pevent->sample, /*all=*/false);
 	}
 	return (PyObject *)pevent;
 }
@@ -1788,8 +1786,6 @@ static PyObject *pyrf_evlist__read_on_cpu(struct pyrf_evlist *pevlist,
 			return Py_None;
 		}
 
-		pevent->evsel = evsel__get(evsel);
-
 		perf_mmap__consume(&md->core);
 
 		err = evsel__parse_sample(evsel, &pevent->event, &pevent->sample);
diff --git a/tools/perf/util/sample.c b/tools/perf/util/sample.c
index cf73329326d7..7ec534dedc5c 100644
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
 #include "debug.h"
+#include "evsel.h"
 #include "thread.h"
-#include <elf.h>
+#include "../../arch/x86/include/asm/insn.h"
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
2.54.0.545.g6539524ca2-goog


