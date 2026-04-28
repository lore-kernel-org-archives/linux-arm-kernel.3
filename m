Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0BF1FF885A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 07:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/WTnvipP2as1A/df6EBdlpk0BxoJR4un9G7x1A54Ihc=; b=3ydiSuJAAvnfemuhcX1tfHMWlJ
	0TOVmdNkEzWf5LN7ir+aw6BcldlLLIUTJ5zW3Heez57B2UQ/+RH7SNNfzxttCdBMv6Ktt+Qj+0KFd
	mYsE/bddfhXEQdsROtDKYThT3KkMVUzdn4Y0DrMXid1DtJMdj1PQRs4GJnw5L0IbcF+aIM7m9kmDI
	OSWOn8IaCuzeWMjp9TUklgQz4PcvKAdj1u4INj2GTwoOg35pUSNk035hxL+aGeglEHaepAHj6+ECn
	8pVfjAaw7HYTtlhlc7Lhx1WPWJVrueN/BCaWaKT6h4xd4ypThfZ5rQvrpMitQiCSDiH3ws9RgqAmq
	D0r+nIiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHcjd-00000000gie-1DaP;
	Tue, 28 Apr 2026 07:19:57 +0000
Received: from mail-dl1-x124a.google.com ([2607:f8b0:4864:20::124a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHcjQ-00000000gVa-0fTM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 07:19:45 +0000
Received: by mail-dl1-x124a.google.com with SMTP id a92af1059eb24-12c8ccc7593so14028949c88.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 00:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777360783; x=1777965583; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=/WTnvipP2as1A/df6EBdlpk0BxoJR4un9G7x1A54Ihc=;
        b=Q35CkPNzfazoqD0uIR0c5zs8TdYG7YmdaDLiBZcSyVg5v4gLoiM+RX1OUeezgdJ3z2
         kqZdd/c+YCTOHOcPPK8XH9igudijO/HNhLcnaG3+tg1vymVa7+tMX33NsTzxx6PRG9+R
         H3oPWCHNLmaQ8s8TniQEsp01arLTs63U+3Zq96m+7+jQisvTikesC8ZiYYqbRjMNKS28
         +64KvnyNDYOZODZnlXHhmk4Ghy8m0CE8DE5UbNztzELQJdFf4CM0AV/f/ZRcnV9Ot5sY
         vpnQh90LlN81LN90X3jrbTRa5SM7Z1E1XQe4aVN2MBf0H6xLVZGRM92vewGxoUxhPz1O
         SYtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777360783; x=1777965583;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/WTnvipP2as1A/df6EBdlpk0BxoJR4un9G7x1A54Ihc=;
        b=iwyFnR81wtaSn1tBnvhO0GxhzCR3x8PUh723i1LEZmaj3+NMesckz+dWsr7/4TLd0f
         gKQXGY9ei3cBnMN7G88Sg15KWf2hCy2blFoPyO1zivsEuWSywG/OExFkH64PZKWMSD7t
         3+Lw+eQD7NzBTWrudf6wp+vu48S4tQSG9uoTzAOEHewB8lxBm7QGVTkfPIOG6KE7tDwA
         hNgmnggBCOwmOKBkWNy+ZQaMAIWsrFjfP5vFxOi3HAdECg94YVKSFVwLlw99yLQLh/4q
         CBnMalerqV6sddi6XQ/Id0o2LHIA5IQAQnDJtpjfkxIkSRLreli6JjoAPVh7tj5kdZYM
         Nm6Q==
X-Forwarded-Encrypted: i=1; AFNElJ8Lm6JRv0tHkzD+dM1AeYd5Q3PKFdkcmlBP5SEeWk3hLN2BRZ9i/N3jfG5uL4rZLjwnJzMGAWr1Bx2PXWVA201H@lists.infradead.org
X-Gm-Message-State: AOJu0YzQZrq0O6yAPMT1gwNSpQnFFuMesyu2QyQB5qT/OGDar0p9A9sU
	+0xC6ZXoznicFgMisxxZ2Equq2zc1Gm7E9pXzE6crR3d4ONaUVVdhDIuKmg5nvz69tzwThGAbWK
	TsbAEnxNlag==
X-Received: from dlbpt10.prod.google.com ([2002:a05:7022:e80a:b0:12d:b1c5:1596])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:6726:b0:12c:3d30:37ba
 with SMTP id a92af1059eb24-12ddd9e2b2bmr744392c88.25.1777360783035; Tue, 28
 Apr 2026 00:19:43 -0700 (PDT)
Date: Tue, 28 Apr 2026 00:18:17 -0700
In-Reply-To: <20260428071903.1886173-1-irogers@google.com>
Mime-Version: 1.0
References: <20260425224951.174663-1-irogers@google.com> <20260428071903.1886173-1-irogers@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260428071903.1886173-13-irogers@google.com>
Subject: [PATCH v8 12/58] perf python: Use evsel in sample in pyrf_event
From: Ian Rogers <irogers@google.com>
To: acme@kernel.org, namhyung@kernel.org
Cc: adrian.hunter@intel.com, alice.mei.rogers@gmail.com, 
	dapeng1.mi@linux.intel.com, james.clark@linaro.org, leo.yan@linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, mingo@redhat.com, peterz@infradead.org, 
	tmricht@linux.ibm.com, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_001944_240035_F719FD14 
X-CRM114-Status: GOOD (  14.73  )
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
index 4b8d6349b7b1..61a7ee1f4c2f 100644
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
@@ -1798,8 +1796,6 @@ static PyObject *pyrf_evlist__read_on_cpu(struct pyrf_evlist *pevlist,
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


