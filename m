Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E885FED3F1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 16:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LcG6S8sD2yT7zpeIqrswUwSHsWXSEMkUZJMomhjZP3s=; b=C7z8xDObpS5ycSZVfzFXE1PjZk
	qxwBJxcbnajgXfbfHf7KZgXdWl/f1YYxO7lYO+kD+sIErkME5JRoCMpBemHLdGQTxt2mQzfei5d6o
	QlM2/if5Y2JErK86SPd36IeRrxtgTEVdGadGH/1kWxsa48rsVPeszTxC0Pj9U07oUGVD7MAOLkaIa
	UKKlNl0A54mwLZBwjSreedZPVGLxqXX/KXeMDOVh7A9g3uD3GSYgqhKT+TfDYLcZrvcQ81GG1zzRH
	sn5y/1RU9QOxoPKCGuxjndoLfkZiHwbZpbazhgYw5M0kkqJ5Tbb0uShKi8E3SODRFfhLQK3GRzPyC
	uolRZ/xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGJhZ-0000000DTgq-2uB8;
	Fri, 24 Apr 2026 16:48:25 +0000
Received: from mail-dl1-x1249.google.com ([2607:f8b0:4864:20::1249])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGJhO-0000000DTX4-2CrC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Apr 2026 16:48:18 +0000
Received: by mail-dl1-x1249.google.com with SMTP id a92af1059eb24-12dc3d81736so998517c88.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Apr 2026 09:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777049293; x=1777654093; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=LcG6S8sD2yT7zpeIqrswUwSHsWXSEMkUZJMomhjZP3s=;
        b=WDq+HX0OWgYWVdHU9XYj5xALoZRltmQeWco/TxZSECZ7DucnAlfttC0h0O2qtWfZDn
         NBvxiaPguUzEKu5k1f6ljMr59pea97ZD2YQlgTHf3LIfmI/sqNvr7fTvRk+bzvbrV1Gj
         S3HcbWWu0yW7Dli0BVEmab+OZLeTLtNp0+fWgPaDxdEFnb38+Wr8wUIts8xCAt/zP3Xz
         HBe3JKyf2slaYdCzRpc7IyT16NCnkkPRvKhBflfIlTOtWoHSD613U6EEfgxMuYSLuBH2
         mFr66SPw8AUnVW/zsTRMMNhU3ajTCKYiFik3nPYA2tS7Qr3hpWBeYmNhCM0+XZQeNA7e
         ZA9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777049293; x=1777654093;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LcG6S8sD2yT7zpeIqrswUwSHsWXSEMkUZJMomhjZP3s=;
        b=PKo+QpqYlh1p1ZIYLsVLt1IOU5FRXo63LFq6vrTuqSUDkul6rB2jGFxI2R/jeZHXzl
         UbUF5bDnmmdjk7HyaL8edkErJyFKLqKXtdNULHfLFjCQb6VdNL2Aax2fhfMVVTyJGgkm
         J643MfKA7yk6OZMmkuWyLQMzfDl8lddHOiGBZ96jc/L4U1MGdu4hipVqXGN0txfYk0lq
         ZImQtIWVzB/088dPkLIquz6FeAYA2s+NlxEDt4oSMZgHrKoxgW91sIlrjdQQk0kXO6s6
         drT/Vqw5pPqUwFKKddJ5qDhTcdHRF9+ddFHFVCIPS32wlYmSdrjqmG5DelOCaJicud+n
         bqpQ==
X-Forwarded-Encrypted: i=1; AFNElJ+DiLp8n82GM9oqU6+gkBUveS2zHmysKYvpTeLqRVUrT5JPxIWH6S0ZfOsYBLPfnOyLuDJ+TZz1DjBqPaj05Gt/@lists.infradead.org
X-Gm-Message-State: AOJu0Yxexf/HzsjRdaii1rPmmx8FFPuygK2DJCVW3ER6VpRm9RT5xUUi
	jj1qk8rtSUFFyzT4vGNLtevbqQYRNkC9rCmedpn9GJOHzzFf3jQgrMQbwWrVL0C8fcXKuA8012r
	kG2m6q50NLg==
X-Received: from dled13-n1.prod.google.com ([2002:a05:701b:42cd:10b0:12a:ad8d:be18])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:6289:b0:12c:33dd:fa15
 with SMTP id a92af1059eb24-12c73fb4362mr18237669c88.34.1777049292407; Fri, 24
 Apr 2026 09:48:12 -0700 (PDT)
Date: Fri, 24 Apr 2026 09:46:35 -0700
In-Reply-To: <20260424164721.2229025-1-irogers@google.com>
Mime-Version: 1.0
References: <20260423163406.1779809-1-irogers@google.com> <20260424164721.2229025-1-irogers@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260424164721.2229025-14-irogers@google.com>
Subject: [PATCH v5 13/58] perf python: Use evsel in sample in pyrf_event
From: Ian Rogers <irogers@google.com>
To: acme@kernel.org, adrian.hunter@intel.com, james.clark@linaro.org, 
	leo.yan@linux.dev, namhyung@kernel.org, tmricht@linux.ibm.com
Cc: alice.mei.rogers@gmail.com, dapeng1.mi@linux.intel.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, mingo@redhat.com, peterz@infradead.org, 
	Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_094814_621216_028F10F9 
X-CRM114-Status: GOOD (  13.85  )
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


