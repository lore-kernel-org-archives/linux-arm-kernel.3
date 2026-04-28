Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 036E9FF885A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 07:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j1gKO7YE159lzRxtp3cqFIqyDD3fMB5ThR/PuFBByjQ=; b=Ma3PfZ48qcK1RGB/aNMjME8AUx
	nOTTsZaRvgJ80mcEL3tADgqkvAnXNL7nOFPiZruBmSi0op1B3cUSDRQgADfNp1S5NB7OWBlHn/lPT
	H9ZA6qGgYtsY1q82lL/2hm0E7dEjLs51KVPEzjJN9QpMiT/b7lSMQMiy1HbY/VuySxJgge944ycnS
	aBTBWL6a7vfVby7oJopUHxjFBiezS6tSzHupkroHnrpj2jP8Ti+kCVPYxN99Yzpc5GNcTMq9CDq7+
	xtf13fbiZuO8DeNvE1qnscD9hN11kLVyXtDHVJLBcfqV83pVk10kq9gHzdjvOjCddKbQ06UP5o8te
	DG1wYNRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHckW-00000000hl7-2fR3;
	Tue, 28 Apr 2026 07:20:52 +0000
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHcjg-00000000gkY-1GYr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 07:20:01 +0000
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-c799ee56bd6so2947949a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 00:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777360798; x=1777965598; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=j1gKO7YE159lzRxtp3cqFIqyDD3fMB5ThR/PuFBByjQ=;
        b=hsTCgxhFUrMLRME6bzII6Xs7QR/r+PDQPikhCgONFQtDJFzOlNoyeRkzeOam1P/DrX
         HMfKlcXKdLNcLo5GET0ankm05sphaKz7L33W0LNi0UHzgHdzj0poGLdXcQh8ldGc2bap
         j5O2IJjlojvdBN9tqqSdlm2ptUjU0ebHfQQBNfRgP7mbnaTfAr62ZqITfU/gsk8hcbLw
         RFb7BUgP2ckA9qIGSFXXHHhfVF8BVANroWNU0z8MDiLrT5qiMz8HNBvsj7y73MrLS+7D
         OjsB2n8MKZJi/KWz5PWsxAXsXKyOaTGRIiQn9HUU+vo1darthts8gR1gJb3aPHjFUM6q
         GZtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777360798; x=1777965598;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j1gKO7YE159lzRxtp3cqFIqyDD3fMB5ThR/PuFBByjQ=;
        b=d1ZFB5uJPCvZuC8EWZTS8Y2Ds0ROAOeySAnseGR20RqcXaq5Q8j3EE9C46ZX4m7kNd
         4SlqhSW9/udsvj76YWEoG5iIKJA7aMThpxk/Y+ecJTNTF/mnCYKwujRJcNrBI6L/EKHV
         4AvhPr4cCSxXRAYTKteOjfzNr7pv2JUw0hQOgQBMZzJHRqlL/8caEbfgMmC2cq3xd3k+
         UeELrt/56SrKFCOvTm7kvKcVIK5q+jBlierOVwXMah8bDOx+xFrDBbAR4zgofHk8XGGb
         vyUzcLRZ694kzLqnz3rEykAeyP9FWQRrDA8G1y8W9nP+dKO0TNzqUO8Z2o1qninFuTqy
         G77w==
X-Forwarded-Encrypted: i=1; AFNElJ9/j2lXNm1Fmpkao4+qkVvccvCN6WRBLcYxFoidACrRimyuH1xO75A9yAAxqompc/8iS1hEtSpgW/m01E8sKH/Z@lists.infradead.org
X-Gm-Message-State: AOJu0YweZKQzD9y/J2HH3DJMWk9vLDZji4lpQtf9jPikTYdEBokRQTNg
	W4YNYP5PMCQFF8PY3q6h3FCOTJrmYia42rfeWMRemDxRKo+IAEBlOsGhUbZt3Fc+kYAWI3pYiTo
	2QpFZgPpoRA==
X-Received: from pgc12.prod.google.com ([2002:a05:6a02:2f8c:b0:c79:1600:6a09])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:e210:b0:39f:3ca8:a31c
 with SMTP id adf61e73a8af0-3a39c2e1812mr2289909637.53.1777360798186; Tue, 28
 Apr 2026 00:19:58 -0700 (PDT)
Date: Tue, 28 Apr 2026 00:18:25 -0700
In-Reply-To: <20260428071903.1886173-1-irogers@google.com>
Mime-Version: 1.0
References: <20260425224951.174663-1-irogers@google.com> <20260428071903.1886173-1-irogers@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260428071903.1886173-21-irogers@google.com>
Subject: [PATCH v8 20/58] perf python: Add syscall name/id to convert syscall
 number and name
From: Ian Rogers <irogers@google.com>
To: acme@kernel.org, namhyung@kernel.org
Cc: adrian.hunter@intel.com, alice.mei.rogers@gmail.com, 
	dapeng1.mi@linux.intel.com, james.clark@linaro.org, leo.yan@linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, mingo@redhat.com, peterz@infradead.org, 
	tmricht@linux.ibm.com, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_002000_374421_15F9D832 
X-CRM114-Status: GOOD (  17.23  )
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

Use perf's syscalltbl support to convert syscall number to name
assuming the number is for the host machine. This avoids python
libaudit support as tools/perf/scripts/python/syscall-counts.py
requires.

Assisted-by: Gemini:gemini-3.1-pro-preview
Signed-off-by: Ian Rogers <irogers@google.com>
---
v2:

1. Guarded with HAVE_LIBTRACEEVENT : Wrapped the syscall functions and
   their entries in perf__methods with #ifdef HAVE_LIBTRACEEVENT to
   avoid potential linker errors if CONFIG_TRACE is disabled.

2. Changed Exception Type: Updated pyrf__syscall_id to raise a
   ValueError instead of a TypeError when a syscall is not found.

3. Fixed Typo: Corrected "name number" to "name" in the docstring for
   syscall_id.

v6:
- Added optional keyword-only `elf_machine` argument to `syscall_name`
  and `syscall_id`.

v7:
- Made syscalltbl.o unconditional in Build to fix undefined symbol
  when building without libtraceevent.
---
 tools/perf/util/Build    |  2 +-
 tools/perf/util/python.c | 48 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 49 insertions(+), 1 deletion(-)

diff --git a/tools/perf/util/Build b/tools/perf/util/Build
index 70cc91d00804..fd55d02dd433 100644
--- a/tools/perf/util/Build
+++ b/tools/perf/util/Build
@@ -75,7 +75,7 @@ perf-util-y += sample.o
 perf-util-y += sample-raw.o
 perf-util-y += s390-sample-raw.o
 perf-util-y += amd-sample-raw.o
-perf-util-$(CONFIG_TRACE) += syscalltbl.o
+perf-util-y += syscalltbl.o
 perf-util-y += ordered-events.o
 perf-util-y += namespaces.o
 perf-util-y += comm.o
diff --git a/tools/perf/util/python.c b/tools/perf/util/python.c
index c947abf8affe..69d443c504d3 100644
--- a/tools/perf/util/python.c
+++ b/tools/perf/util/python.c
@@ -16,6 +16,7 @@
 #include "data.h"
 #include "debug.h"
 #include "dso.h"
+#include "dwarf-regs.h"
 #include "event.h"
 #include "branch.h"
 #include "evlist.h"
@@ -33,6 +34,7 @@
 #include "srcline.h"
 #include "strbuf.h"
 #include "symbol.h"
+#include "syscalltbl.h"
 #include "thread.h"
 #include "thread_map.h"
 #include "tool.h"
@@ -3785,6 +3787,40 @@ static int pyrf_session__setup_types(void)
 	return PyType_Ready(&pyrf_session__type);
 }
 
+static PyObject *pyrf__syscall_name(PyObject *self, PyObject *args, PyObject *kwargs)
+{
+	const char *name;
+	int id;
+	int elf_machine = EM_HOST;
+	static char * const kwlist[] = { "id", "elf_machine", NULL };
+
+	if (!PyArg_ParseTupleAndKeywords(args, kwargs, "i|$i", kwlist, &id, &elf_machine))
+		return NULL;
+
+	name = syscalltbl__name(elf_machine, id);
+	if (!name)
+		Py_RETURN_NONE;
+	return PyUnicode_FromString(name);
+}
+
+static PyObject *pyrf__syscall_id(PyObject *self, PyObject *args, PyObject *kwargs)
+{
+	const char *name;
+	int id;
+	int elf_machine = EM_HOST;
+	static char * const kwlist[] = { "name", "elf_machine", NULL };
+
+	if (!PyArg_ParseTupleAndKeywords(args, kwargs, "s|$i", kwlist, &name, &elf_machine))
+		return NULL;
+
+	id = syscalltbl__id(elf_machine, name);
+	if (id < 0) {
+		PyErr_Format(PyExc_ValueError, "Failed to find syscall %s", name);
+		return NULL;
+	}
+	return PyLong_FromLong(id);
+}
+
 static PyMethodDef perf__methods[] = {
 	{
 		.ml_name  = "metrics",
@@ -3818,6 +3854,18 @@ static PyMethodDef perf__methods[] = {
 		.ml_flags = METH_NOARGS,
 		.ml_doc	  = PyDoc_STR("Returns a sequence of pmus.")
 	},
+	{
+		.ml_name  = "syscall_name",
+		.ml_meth  = (PyCFunction) pyrf__syscall_name,
+		.ml_flags = METH_VARARGS | METH_KEYWORDS,
+		.ml_doc	  = PyDoc_STR("Turns a syscall number to a string.")
+	},
+	{
+		.ml_name  = "syscall_id",
+		.ml_meth  = (PyCFunction) pyrf__syscall_id,
+		.ml_flags = METH_VARARGS | METH_KEYWORDS,
+		.ml_doc	  = PyDoc_STR("Turns a syscall name to a number.")
+	},
 	{ .ml_name = NULL, }
 };
 
-- 
2.54.0.545.g6539524ca2-goog


