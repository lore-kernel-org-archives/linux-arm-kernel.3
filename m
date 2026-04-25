Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A729CFF8864
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Apr 2026 22:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WGkE3qmLEV+WvW1f6i+WSiVTMFxII7e5rmRTRboaSrI=; b=2VLdfbF6IYEN/xbTBb1TMs78FK
	KX8uf3oC6Eanc0XQhhVkWMtnWaG3dHnRPtOxMmmTkFLQbAkIv/OOjnnDqX/3feHgwEtpsBm5PqSud
	+lvh0zXDAw0xhE0/vMQTrSjbOKWNxMjtM3Ap5Rdjlalfwh3JsdXTaKv9NHmP9wvnevxyf13ExUT/w
	ufy9mo2kGPZpSpFDJTZ2EHANktpMYxwQPYi/SNCjjwd8VaaDmzXrP3PYQ+ERbVYT7p7bPzLVXWKBd
	P26scSiIqc2Px837RigXyONZqreXqxMBWedtjSn67NrW3Rscn+OQsPjUhiXgEtoHcr4QbwSMY8Ve3
	DKX+EJBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGlqM-0000000Eyvj-14aG;
	Sat, 25 Apr 2026 22:51:22 +0000
Received: from mail-dy1-x1349.google.com ([2607:f8b0:4864:20::1349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGlpp-0000000EyLh-373d
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Apr 2026 22:50:56 +0000
Received: by mail-dy1-x1349.google.com with SMTP id 5a478bee46e88-2ba8013a9e3so10459323eec.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Apr 2026 15:50:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777157448; x=1777762248; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=WGkE3qmLEV+WvW1f6i+WSiVTMFxII7e5rmRTRboaSrI=;
        b=iCQcMgjIOSk1xIt+TdUF5b2L+kVH6K06gloayrOHL8OZg8nkTdY9C7aHZ2WBgqVgaV
         6YFpbOqdxYXrE1twu6Ph78lAw2KxKCq6Ke9F7NkjlLi4dIXAXsn9KyeT7xF0AvqqxYIg
         K+r4HEBQ/e+2/sh0MnB3qep3XViwn/H5uX+WGba+M7W2S9JSSIFb818dUPwYBJNpb+JV
         mZ7Rdf7ZXV19b2xt+hder10mr02HIDcA67EVTpxpglFKLcSEi3URohaHGi8ZPn2QkgZq
         aSEM2ys7mq/Gz3edY9LWznBfYo/cCx8xilmJZyXzPdanyZ5xGs63TNM5+poy8ngHxFel
         MJfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777157448; x=1777762248;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WGkE3qmLEV+WvW1f6i+WSiVTMFxII7e5rmRTRboaSrI=;
        b=i3TXPtaVkh3iE7Ac/37oZ2gI1gQm4FJh8tIIuo91kfJovMfjDj8C29hvrn+DYV0Jh/
         l5TeL5RcRYP/ELngcJ9KuVw2/z5BKGVl3q96DcX9sEfdYEk4IwN2kbfnr5ww2z7GfjSd
         EC/koAuzNRNxlh5TfccTmdVwetoH7NWksJpuAlX/j3fowb2XgUehzvRJQD5uZktgRf4b
         1fjzK8dmsl7JnZACreRZNxBCpl1bOeW/6+4pZuBG8navzq/U4E6DrRp5DSroHy+9EkTi
         H9nOgUz3p4bXP1LrSKCXBZA1HeupOGftZJUMilTfSK8oi4h8/UO1QLbbhSg5I41UGO5X
         YMDQ==
X-Forwarded-Encrypted: i=1; AFNElJ83LMOGNtpTp9i75jAvnIV5MGruxBOUmkKKCKy5zx3bFbgzmh13+bCpX69HRgtOsSzQio6Zf5MReJARAXVNdqtc@lists.infradead.org
X-Gm-Message-State: AOJu0Yxgqh01qtVYL3WzzXm2ZMHUX+ggnPBQLBPrMXHy/OgW5G4+XxfI
	oDzl/G8E4UY7ms8L4R7W5tyaTwaWJgEzpqaZxNW0Hzo2e+fkF95OfIDUAV1D4Rhe1cBgSiW8ESw
	ff1hraTg9Kw==
X-Received: from dlbro6.prod.google.com ([2002:a05:7022:1586:b0:12d:cb64:e75d])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:4583:b0:128:df80:1852
 with SMTP id a92af1059eb24-12c73f75b29mr19057213c88.9.1777157448192; Sat, 25
 Apr 2026 15:50:48 -0700 (PDT)
Date: Sat, 25 Apr 2026 15:49:09 -0700
In-Reply-To: <20260425224951.174663-1-irogers@google.com>
Mime-Version: 1.0
References: <20260425174858.3922152-1-irogers@google.com> <20260425224951.174663-1-irogers@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260425224951.174663-18-irogers@google.com>
Subject: [PATCH v7 17/59] perf python: Refactor and add accessors to sample event
From: Ian Rogers <irogers@google.com>
To: acme@kernel.org, adrian.hunter@intel.com, james.clark@linaro.org, 
	leo.yan@linux.dev, namhyung@kernel.org, tmricht@linux.ibm.com
Cc: alice.mei.rogers@gmail.com, dapeng1.mi@linux.intel.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, mingo@redhat.com, peterz@infradead.org, 
	Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260425_155049_846288_F5DED566 
X-CRM114-Status: GOOD (  19.05  )
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

Add common evsel field for events and move sample specific fields to
only be present in sample events. Add accessors for sample events.

Assisted-by: Gemini:gemini-3.1-pro-preview
Signed-off-by: Ian Rogers <irogers@google.com>
---
v5:
1. Fix Uninitialized Memory: Restore zero-initialization of `pevent->sample`
   in `pyrf_event__new()` to prevent wild free crashes on error paths.

v6:
- Refactored `pyrf_event__new` to take `evsel` and `session`, and use
  dynamic allocation based on event size. Updated callers.
---
 tools/perf/util/python.c | 516 ++++++++++++++++++++++++++++++++-------
 1 file changed, 434 insertions(+), 82 deletions(-)

diff --git a/tools/perf/util/python.c b/tools/perf/util/python.c
index 861973144106..824cf58645e0 100644
--- a/tools/perf/util/python.c
+++ b/tools/perf/util/python.c
@@ -8,22 +8,29 @@
 #include <internal/lib.h>
 #include <perf/mmap.h>
 
+#include "addr_location.h"
+#include "build-id.h"
 #include "callchain.h"
 #include "comm.h"
 #include "counts.h"
 #include "data.h"
 #include "debug.h"
+#include "dso.h"
 #include "dwarf-regs.h"
 #include "event.h"
 #include "evlist.h"
 #include "evsel.h"
 #include "expr.h"
+#include "map.h"
 #include "metricgroup.h"
 #include "mmap.h"
 #include "pmus.h"
 #include "print_binary.h"
 #include "record.h"
+#include "sample.h"
 #include "session.h"
+#include "srccode.h"
+#include "srcline.h"
 #include "strbuf.h"
 #include "symbol.h"
 #include "syscalltbl.h"
@@ -32,7 +39,6 @@
 #include "tool.h"
 #include "tp_pmu.h"
 #include "trace-event.h"
-#include "util/sample.h"
 
 #ifdef HAVE_LIBTRACEEVENT
 #include <event-parse.h>
@@ -40,6 +46,8 @@
 
 PyMODINIT_FUNC PyInit_perf(void);
 
+static PyObject *pyrf_evsel__from_evsel(struct evsel *evsel);
+
 #define member_def(type, member, ptype, help) \
 	{ #member, ptype, \
 	  offsetof(struct pyrf_event, event) + offsetof(struct type, member), \
@@ -52,21 +60,53 @@ PyMODINIT_FUNC PyInit_perf(void);
 
 struct pyrf_event {
 	PyObject_HEAD
+	/** @sample: The parsed sample from the event. */
 	struct perf_sample sample;
-	union perf_event   event;
+	/** @al: The address location from machine__resolve, lazily computed. */
+	struct addr_location al;
+	/** @al_resolved: True when machine__resolve been called. */
+	bool al_resolved;
+	/** @event: The underlying perf_event that may be in a file or ring buffer. */
+	union perf_event event;
 };
 
 #define sample_members \
-	sample_member_def(sample_ip, ip, T_ULONGLONG, "event ip"),			 \
 	sample_member_def(sample_pid, pid, T_INT, "event pid"),			 \
 	sample_member_def(sample_tid, tid, T_INT, "event tid"),			 \
 	sample_member_def(sample_time, time, T_ULONGLONG, "event timestamp"),		 \
-	sample_member_def(sample_addr, addr, T_ULONGLONG, "event addr"),		 \
 	sample_member_def(sample_id, id, T_ULONGLONG, "event id"),			 \
 	sample_member_def(sample_stream_id, stream_id, T_ULONGLONG, "event stream id"), \
 	sample_member_def(sample_period, period, T_ULONGLONG, "event period"),		 \
 	sample_member_def(sample_cpu, cpu, T_UINT, "event cpu"),
 
+static PyObject *pyrf_event__get_evsel(PyObject *self, void *closure __maybe_unused)
+{
+	struct pyrf_event *pevent = (void *)self;
+
+	if (!pevent->sample.evsel)
+		Py_RETURN_NONE;
+
+	return pyrf_evsel__from_evsel(pevent->sample.evsel);
+}
+
+static PyGetSetDef pyrf_event__getset[] = {
+	{
+		.name = "evsel",
+		.get = pyrf_event__get_evsel,
+		.set = NULL,
+		.doc = "tracking event.",
+	},
+	{ .name = NULL, },
+};
+
+static void pyrf_event__delete(struct pyrf_event *pevent)
+{
+	if (pevent->al_resolved)
+		addr_location__exit(&pevent->al);
+	perf_sample__exit(&pevent->sample);
+	Py_TYPE(pevent)->tp_free((PyObject *)pevent);
+}
+
 static const char pyrf_mmap_event__doc[] = PyDoc_STR("perf mmap event object.");
 
 static PyMemberDef pyrf_mmap_event__members[] = {
@@ -105,9 +145,12 @@ static PyTypeObject pyrf_mmap_event__type = {
 	PyVarObject_HEAD_INIT(NULL, 0)
 	.tp_name	= "perf.mmap_event",
 	.tp_basicsize	= sizeof(struct pyrf_event),
+	.tp_new		= PyType_GenericNew,
+	.tp_dealloc	= (destructor)pyrf_event__delete,
 	.tp_flags	= Py_TPFLAGS_DEFAULT|Py_TPFLAGS_BASETYPE,
 	.tp_doc		= pyrf_mmap_event__doc,
 	.tp_members	= pyrf_mmap_event__members,
+	.tp_getset	= pyrf_event__getset,
 	.tp_repr	= (reprfunc)pyrf_mmap_event__repr,
 };
 
@@ -140,9 +183,12 @@ static PyTypeObject pyrf_task_event__type = {
 	PyVarObject_HEAD_INIT(NULL, 0)
 	.tp_name	= "perf.task_event",
 	.tp_basicsize	= sizeof(struct pyrf_event),
+	.tp_new		= PyType_GenericNew,
+	.tp_dealloc	= (destructor)pyrf_event__delete,
 	.tp_flags	= Py_TPFLAGS_DEFAULT|Py_TPFLAGS_BASETYPE,
 	.tp_doc		= pyrf_task_event__doc,
 	.tp_members	= pyrf_task_event__members,
+	.tp_getset	= pyrf_event__getset,
 	.tp_repr	= (reprfunc)pyrf_task_event__repr,
 };
 
@@ -172,6 +218,7 @@ static PyTypeObject pyrf_comm_event__type = {
 	.tp_flags	= Py_TPFLAGS_DEFAULT|Py_TPFLAGS_BASETYPE,
 	.tp_doc		= pyrf_comm_event__doc,
 	.tp_members	= pyrf_comm_event__members,
+	.tp_getset	= pyrf_event__getset,
 	.tp_repr	= (reprfunc)pyrf_comm_event__repr,
 };
 
@@ -201,9 +248,12 @@ static PyTypeObject pyrf_throttle_event__type = {
 	PyVarObject_HEAD_INIT(NULL, 0)
 	.tp_name	= "perf.throttle_event",
 	.tp_basicsize	= sizeof(struct pyrf_event),
+	.tp_new		= PyType_GenericNew,
+	.tp_dealloc	= (destructor)pyrf_event__delete,
 	.tp_flags	= Py_TPFLAGS_DEFAULT|Py_TPFLAGS_BASETYPE,
 	.tp_doc		= pyrf_throttle_event__doc,
 	.tp_members	= pyrf_throttle_event__members,
+	.tp_getset	= pyrf_event__getset,
 	.tp_repr	= (reprfunc)pyrf_throttle_event__repr,
 };
 
@@ -236,9 +286,12 @@ static PyTypeObject pyrf_lost_event__type = {
 	PyVarObject_HEAD_INIT(NULL, 0)
 	.tp_name	= "perf.lost_event",
 	.tp_basicsize	= sizeof(struct pyrf_event),
+	.tp_new		= PyType_GenericNew,
+	.tp_dealloc	= (destructor)pyrf_event__delete,
 	.tp_flags	= Py_TPFLAGS_DEFAULT|Py_TPFLAGS_BASETYPE,
 	.tp_doc		= pyrf_lost_event__doc,
 	.tp_members	= pyrf_lost_event__members,
+	.tp_getset	= pyrf_event__getset,
 	.tp_repr	= (reprfunc)pyrf_lost_event__repr,
 };
 
@@ -269,6 +322,7 @@ static PyTypeObject pyrf_read_event__type = {
 	.tp_flags	= Py_TPFLAGS_DEFAULT|Py_TPFLAGS_BASETYPE,
 	.tp_doc		= pyrf_read_event__doc,
 	.tp_members	= pyrf_read_event__members,
+	.tp_getset	= pyrf_event__getset,
 	.tp_repr	= (reprfunc)pyrf_read_event__repr,
 };
 
@@ -276,16 +330,17 @@ static const char pyrf_sample_event__doc[] = PyDoc_STR("perf sample event object
 
 static PyMemberDef pyrf_sample_event__members[] = {
 	sample_members
+	sample_member_def(sample_ip, ip, T_ULONGLONG, "event ip"),
+	sample_member_def(sample_addr, addr, T_ULONGLONG, "event addr"),
+	sample_member_def(sample_phys_addr, phys_addr, T_ULONGLONG, "event physical addr"),
+	sample_member_def(sample_weight, weight, T_ULONGLONG, "event weight"),
+	sample_member_def(sample_data_src, data_src, T_ULONGLONG, "event data source"),
+	sample_member_def(sample_insn_count, insn_cnt, T_ULONGLONG, "event instruction count"),
+	sample_member_def(sample_cyc_count, cyc_cnt, T_ULONGLONG, "event cycle count"),
 	member_def(perf_event_header, type, T_UINT, "event type"),
 	{ .name = NULL, },
 };
 
-static void pyrf_sample_event__delete(struct pyrf_event *pevent)
-{
-	perf_sample__exit(&pevent->sample);
-	Py_TYPE(pevent)->tp_free((PyObject*)pevent);
-}
-
 static PyObject *pyrf_sample_event__repr(const struct pyrf_event *pevent)
 {
 	PyObject *ret;
@@ -373,6 +428,199 @@ get_tracepoint_field(struct pyrf_event *pevent, PyObject *attr_name)
 }
 #endif /* HAVE_LIBTRACEEVENT */
 
+static int pyrf_sample_event__resolve_al(struct pyrf_event *pevent)
+{
+	struct evsel *evsel = pevent->sample.evsel;
+	struct evlist *evlist = evsel ? evsel->evlist : NULL;
+	struct perf_session *session = evlist ? evlist__session(evlist) : NULL;
+
+	if (pevent->al_resolved)
+		return 0;
+
+	if (!session)
+		return -1;
+
+	addr_location__init(&pevent->al);
+	if (machine__resolve(&session->machines.host, &pevent->al, &pevent->sample) < 0) {
+		addr_location__exit(&pevent->al);
+		return -1;
+	}
+
+	pevent->al_resolved = true;
+	return 0;
+}
+
+static PyObject *pyrf_sample_event__get_dso(struct pyrf_event *pevent,
+					    void *closure __maybe_unused)
+{
+	if (pyrf_sample_event__resolve_al(pevent) < 0 || !pevent->al.map)
+		Py_RETURN_NONE;
+
+	return PyUnicode_FromString(dso__name(map__dso(pevent->al.map)));
+}
+
+static PyObject *pyrf_sample_event__get_dso_long_name(struct pyrf_event *pevent,
+						      void *closure __maybe_unused)
+{
+	if (pyrf_sample_event__resolve_al(pevent) < 0 || !pevent->al.map)
+		Py_RETURN_NONE;
+
+	return PyUnicode_FromString(dso__long_name(map__dso(pevent->al.map)));
+}
+
+static PyObject *pyrf_sample_event__get_dso_bid(struct pyrf_event *pevent,
+						void *closure __maybe_unused)
+{
+	char sbuild_id[SBUILD_ID_SIZE];
+
+	if (pyrf_sample_event__resolve_al(pevent) < 0 || !pevent->al.map)
+		Py_RETURN_NONE;
+
+	build_id__snprintf(dso__bid(map__dso(pevent->al.map)), sbuild_id, sizeof(sbuild_id));
+	return PyUnicode_FromString(sbuild_id);
+}
+
+static PyObject *pyrf_sample_event__get_map_start(struct pyrf_event *pevent,
+						  void *closure __maybe_unused)
+{
+	if (pyrf_sample_event__resolve_al(pevent) < 0 || !pevent->al.map)
+		Py_RETURN_NONE;
+
+	return PyLong_FromUnsignedLong(map__start(pevent->al.map));
+}
+
+static PyObject *pyrf_sample_event__get_map_end(struct pyrf_event *pevent,
+						void *closure __maybe_unused)
+{
+	if (pyrf_sample_event__resolve_al(pevent) < 0 || !pevent->al.map)
+		Py_RETURN_NONE;
+
+	return PyLong_FromUnsignedLong(map__end(pevent->al.map));
+}
+
+static PyObject *pyrf_sample_event__get_map_pgoff(struct pyrf_event *pevent,
+						  void *closure __maybe_unused)
+{
+	if (pyrf_sample_event__resolve_al(pevent) < 0 || !pevent->al.map)
+		Py_RETURN_NONE;
+
+	return PyLong_FromUnsignedLongLong(map__pgoff(pevent->al.map));
+}
+
+static PyObject *pyrf_sample_event__get_symbol(struct pyrf_event *pevent,
+					       void *closure __maybe_unused)
+{
+	if (pyrf_sample_event__resolve_al(pevent) < 0 || !pevent->al.sym)
+		Py_RETURN_NONE;
+
+	return PyUnicode_FromString(pevent->al.sym->name);
+}
+
+static PyObject *pyrf_sample_event__get_sym_start(struct pyrf_event *pevent,
+						  void *closure __maybe_unused)
+{
+	if (pyrf_sample_event__resolve_al(pevent) < 0 || !pevent->al.sym)
+		Py_RETURN_NONE;
+
+	return PyLong_FromUnsignedLongLong(pevent->al.sym->start);
+}
+
+static PyObject *pyrf_sample_event__get_sym_end(struct pyrf_event *pevent,
+						void *closure __maybe_unused)
+{
+	if (pyrf_sample_event__resolve_al(pevent) < 0 || !pevent->al.sym)
+		Py_RETURN_NONE;
+
+	return PyLong_FromUnsignedLongLong(pevent->al.sym->end);
+}
+
+static PyObject *pyrf_sample_event__get_raw_buf(struct pyrf_event *pevent,
+						void *closure __maybe_unused)
+{
+	if (pevent->event.header.type != PERF_RECORD_SAMPLE)
+		Py_RETURN_NONE;
+
+	return PyBytes_FromStringAndSize((const char *)pevent->sample.raw_data,
+					 pevent->sample.raw_size);
+}
+
+static PyObject *pyrf_sample_event__srccode(PyObject *self, PyObject *args)
+{
+	struct pyrf_event *pevent = (void *)self;
+	u64 addr = pevent->sample.ip;
+	char *srcfile = NULL;
+	char *srccode = NULL;
+	unsigned int line = 0;
+	int len = 0;
+	PyObject *result;
+	struct addr_location al;
+
+	if (!PyArg_ParseTuple(args, "|K", &addr))
+		return NULL;
+
+	if (pyrf_sample_event__resolve_al(pevent) < 0)
+		Py_RETURN_NONE;
+
+	if (addr != pevent->sample.ip) {
+		addr_location__init(&al);
+		thread__find_symbol_fb(pevent->al.thread, pevent->sample.cpumode, addr, &al);
+	} else {
+		addr_location__init(&al);
+		al.thread = thread__get(pevent->al.thread);
+		al.map = map__get(pevent->al.map);
+		al.sym = pevent->al.sym;
+		al.addr = pevent->al.addr;
+	}
+
+	if (al.map) {
+		struct dso *dso = map__dso(al.map);
+
+		if (dso) {
+			srcfile = get_srcline_split(dso, map__rip_2objdump(al.map, addr),
+						    &line);
+		}
+	}
+	addr_location__exit(&al);
+
+	if (srcfile) {
+		srccode = find_sourceline(srcfile, line, &len);
+		result = Py_BuildValue("(sIs#)", srcfile, line, srccode, (Py_ssize_t)len);
+		free(srcfile);
+	} else {
+		result = Py_BuildValue("(sIs#)", NULL, 0, NULL, (Py_ssize_t)0);
+	}
+
+	return result;
+}
+
+static PyObject *pyrf_sample_event__insn(PyObject *self, PyObject *args __maybe_unused)
+{
+	struct pyrf_event *pevent = (void *)self;
+	struct thread *thread;
+	struct machine *machine;
+
+	if (pyrf_sample_event__resolve_al(pevent) < 0)
+		Py_RETURN_NONE;
+
+	thread = pevent->al.thread;
+
+	if (!thread || !thread__maps(thread))
+		Py_RETURN_NONE;
+
+	machine = maps__machine(thread__maps(thread));
+	if (!machine)
+		Py_RETURN_NONE;
+
+	if (pevent->sample.ip && !pevent->sample.insn_len)
+		perf_sample__fetch_insn(&pevent->sample, thread, machine);
+
+	if (!pevent->sample.insn_len)
+		Py_RETURN_NONE;
+
+	return PyBytes_FromStringAndSize((const char *)pevent->sample.insn,
+					 pevent->sample.insn_len);
+}
+
 static PyObject*
 pyrf_sample_event__getattro(struct pyrf_event *pevent, PyObject *attr_name)
 {
@@ -386,13 +634,103 @@ pyrf_sample_event__getattro(struct pyrf_event *pevent, PyObject *attr_name)
 	return obj ?: PyObject_GenericGetAttr((PyObject *) pevent, attr_name);
 }
 
+static PyGetSetDef pyrf_sample_event__getset[] = {
+	{
+		.name = "raw_buf",
+		.get = (getter)pyrf_sample_event__get_raw_buf,
+		.set = NULL,
+		.doc = "event raw buffer.",
+	},
+	{
+		.name = "evsel",
+		.get = pyrf_event__get_evsel,
+		.set = NULL,
+		.doc = "tracking event.",
+	},
+	{
+		.name = "dso",
+		.get = (getter)pyrf_sample_event__get_dso,
+		.set = NULL,
+		.doc = "event dso short name.",
+	},
+	{
+		.name = "dso_long_name",
+		.get = (getter)pyrf_sample_event__get_dso_long_name,
+		.set = NULL,
+		.doc = "event dso long name.",
+	},
+	{
+		.name = "dso_bid",
+		.get = (getter)pyrf_sample_event__get_dso_bid,
+		.set = NULL,
+		.doc = "event dso build id.",
+	},
+	{
+		.name = "map_start",
+		.get = (getter)pyrf_sample_event__get_map_start,
+		.set = NULL,
+		.doc = "event map start address.",
+	},
+	{
+		.name = "map_end",
+		.get = (getter)pyrf_sample_event__get_map_end,
+		.set = NULL,
+		.doc = "event map end address.",
+	},
+	{
+		.name = "map_pgoff",
+		.get = (getter)pyrf_sample_event__get_map_pgoff,
+		.set = NULL,
+		.doc = "event map page offset.",
+	},
+	{
+		.name = "symbol",
+		.get = (getter)pyrf_sample_event__get_symbol,
+		.set = NULL,
+		.doc = "event symbol name.",
+	},
+	{
+		.name = "sym_start",
+		.get = (getter)pyrf_sample_event__get_sym_start,
+		.set = NULL,
+		.doc = "event symbol start address.",
+	},
+	{
+		.name = "sym_end",
+		.get = (getter)pyrf_sample_event__get_sym_end,
+		.set = NULL,
+		.doc = "event symbol end address.",
+	},
+	{ .name = NULL, },
+};
+
+static PyMethodDef pyrf_sample_event__methods[] = {
+	{
+		.ml_name  = "srccode",
+		.ml_meth  = (PyCFunction)pyrf_sample_event__srccode,
+		.ml_flags = METH_VARARGS,
+		.ml_doc	  = PyDoc_STR("Get source code for an address.")
+	},
+	{
+		.ml_name  = "insn",
+		.ml_meth  = (PyCFunction)pyrf_sample_event__insn,
+		.ml_flags = METH_NOARGS,
+		.ml_doc	  = PyDoc_STR("Get instruction bytes for a sample.")
+	},
+	{ .ml_name = NULL, }
+};
+
 static PyTypeObject pyrf_sample_event__type = {
 	PyVarObject_HEAD_INIT(NULL, 0)
 	.tp_name	= "perf.sample_event",
 	.tp_basicsize	= sizeof(struct pyrf_event),
+	.tp_new		= PyType_GenericNew,
+	.tp_dealloc	= (destructor)pyrf_event__delete,
 	.tp_flags	= Py_TPFLAGS_DEFAULT|Py_TPFLAGS_BASETYPE,
 	.tp_doc		= pyrf_sample_event__doc,
 	.tp_members	= pyrf_sample_event__members,
+	.tp_getset	= pyrf_sample_event__getset,
+	.tp_methods	= pyrf_sample_event__methods,
 	.tp_repr	= (reprfunc)pyrf_sample_event__repr,
 	.tp_getattro	= (getattrofunc) pyrf_sample_event__getattro,
 };
@@ -428,25 +766,18 @@ static PyTypeObject pyrf_context_switch_event__type = {
 	PyVarObject_HEAD_INIT(NULL, 0)
 	.tp_name	= "perf.context_switch_event",
 	.tp_basicsize	= sizeof(struct pyrf_event),
+	.tp_new		= PyType_GenericNew,
+	.tp_dealloc	= (destructor)pyrf_event__delete,
 	.tp_flags	= Py_TPFLAGS_DEFAULT|Py_TPFLAGS_BASETYPE,
 	.tp_doc		= pyrf_context_switch_event__doc,
 	.tp_members	= pyrf_context_switch_event__members,
+	.tp_getset	= pyrf_event__getset,
 	.tp_repr	= (reprfunc)pyrf_context_switch_event__repr,
 };
 
 static int pyrf_event__setup_types(void)
 {
 	int err;
-	pyrf_mmap_event__type.tp_new =
-	pyrf_task_event__type.tp_new =
-	pyrf_comm_event__type.tp_new =
-	pyrf_lost_event__type.tp_new =
-	pyrf_read_event__type.tp_new =
-	pyrf_sample_event__type.tp_new =
-	pyrf_context_switch_event__type.tp_new =
-	pyrf_throttle_event__type.tp_new = PyType_GenericNew;
-
-	pyrf_sample_event__type.tp_dealloc = (destructor)pyrf_sample_event__delete,
 
 	err = PyType_Ready(&pyrf_mmap_event__type);
 	if (err < 0)
@@ -490,10 +821,14 @@ static PyTypeObject *pyrf_event__type[] = {
 	[PERF_RECORD_SWITCH_CPU_WIDE]  = &pyrf_context_switch_event__type,
 };
 
-static PyObject *pyrf_event__new(const union perf_event *event)
+static PyObject *pyrf_event__new(const union perf_event *event, struct evsel *evsel,
+				 struct perf_session *session __maybe_unused)
 {
 	struct pyrf_event *pevent;
 	PyTypeObject *ptype;
+	size_t size;
+	int err;
+	size_t min_size = sizeof(struct perf_event_header);
 
 	if ((event->header.type < PERF_RECORD_MMAP ||
 	     event->header.type > PERF_RECORD_SAMPLE) &&
@@ -504,19 +839,62 @@ static PyObject *pyrf_event__new(const union perf_event *event)
 		return NULL;
 	}
 
-	// FIXME this better be dynamic or we need to parse everything
-	// before calling perf_mmap__consume(), including tracepoint fields.
-	if (sizeof(pevent->event) < event->header.size) {
-		PyErr_Format(PyExc_TypeError, "Unexpected event size: %zd < %u",
-			     sizeof(pevent->event), event->header.size);
-		return NULL;
+	ptype = pyrf_event__type[event->header.type];
+
+	switch (event->header.type) {
+	case PERF_RECORD_MMAP:
+		min_size = sizeof(struct perf_record_mmap);
+		break;
+	case PERF_RECORD_COMM:
+		min_size = sizeof(struct perf_record_comm);
+		break;
+	case PERF_RECORD_FORK:
+	case PERF_RECORD_EXIT:
+		min_size = sizeof(struct perf_record_fork);
+		break;
+	case PERF_RECORD_THROTTLE:
+	case PERF_RECORD_UNTHROTTLE:
+		min_size = sizeof(struct perf_record_throttle);
+		break;
+	case PERF_RECORD_LOST:
+		min_size = sizeof(struct perf_record_lost);
+		break;
+	case PERF_RECORD_READ:
+		min_size = sizeof(struct perf_record_read);
+		break;
+	case PERF_RECORD_SWITCH:
+	case PERF_RECORD_SWITCH_CPU_WIDE:
+		min_size = sizeof(struct perf_record_switch);
+		break;
+	default:
+		break;
 	}
+	if (event->header.size < min_size)
+		return PyErr_Format(PyExc_ValueError, "Event size %u too small for type %u",
+				    event->header.size, event->header.type);
+
+	/* Allocate just enough memory for the size of event. */
+	size = offsetof(struct pyrf_event, event) + event->header.size;
+	pevent = (struct pyrf_event *)PyObject_Malloc(size);
+	if (pevent == NULL)
+		return PyErr_NoMemory();
 
-	ptype = pyrf_event__type[event->header.type];
-	pevent = PyObject_New(struct pyrf_event, ptype);
-	if (pevent != NULL) {
-		memcpy(&pevent->event, event, event->header.size);
-		perf_sample__init(&pevent->sample, /*all=*/false);
+	/* Copy the event for memory safety and initilaize variables. */
+	PyObject_Init((PyObject *)pevent, ptype);
+	memcpy(&pevent->event, event, event->header.size);
+	perf_sample__init(&pevent->sample, /*all=*/true);
+	pevent->al_resolved = false;
+	addr_location__init(&pevent->al);
+
+	if (!evsel)
+		return (PyObject *)pevent;
+
+	/* Parse the sample again so that pointers are within the copied event. */
+	err = evsel__parse_sample(evsel, &pevent->event, &pevent->sample);
+	if (err < 0) {
+		Py_DECREF(pevent);
+		return PyErr_Format(PyExc_OSError,
+				    "perf: can't parse sample, err=%d", err);
 	}
 	return (PyObject *)pevent;
 }
@@ -1209,7 +1587,7 @@ static PyObject *pyrf_evsel__str(PyObject *self)
 	struct pyrf_evsel *pevsel = (void *)self;
 	struct evsel *evsel = pevsel->evsel;
 
-	return PyUnicode_FromFormat("evsel(%s/%s/)", evsel__pmu_name(evsel), evsel__name(evsel));
+	return PyUnicode_FromFormat("evsel(%s)", evsel__name(evsel));
 }
 
 static PyMethodDef pyrf_evsel__methods[] = {
@@ -1771,9 +2149,11 @@ static PyObject *pyrf_evlist__read_on_cpu(struct pyrf_evlist *pevlist,
 {
 	struct evlist *evlist = pevlist->evlist;
 	union perf_event *event;
+	struct evsel *evsel;
 	int sample_id_all = 1, cpu;
 	static char *kwlist[] = { "cpu", "sample_id_all", NULL };
 	struct mmap *md;
+	PyObject *pyevent;
 	int err;
 
 	if (!PyArg_ParseTupleAndKeywords(args, kwargs, "i|i", kwlist,
@@ -1781,44 +2161,31 @@ static PyObject *pyrf_evlist__read_on_cpu(struct pyrf_evlist *pevlist,
 		return NULL;
 
 	md = get_md(evlist, cpu);
-	if (!md) {
-		PyErr_Format(PyExc_TypeError, "Unknown CPU '%d'", cpu);
-		return NULL;
-	}
+	if (!md)
+		return PyErr_Format(PyExc_TypeError, "Unknown CPU '%d'", cpu);
 
-	if (perf_mmap__read_init(&md->core) < 0)
-		goto end;
+	err = perf_mmap__read_init(&md->core);
+	if (err < 0) {
+		return PyErr_Format(PyExc_OSError,
+				    "perf: error mmap read init, err=%d", err);
+	}
 
 	event = perf_mmap__read_event(&md->core);
-	if (event != NULL) {
-		PyObject *pyevent = pyrf_event__new(event);
-		struct pyrf_event *pevent = (struct pyrf_event *)pyevent;
-		struct evsel *evsel;
-
-		if (pyevent == NULL)
-			return PyErr_NoMemory();
-
-		evsel = evlist__event2evsel(evlist, event);
-		if (!evsel) {
-			Py_DECREF(pyevent);
-			Py_INCREF(Py_None);
-			return Py_None;
-		}
+	if (event == NULL)
+		Py_RETURN_NONE;
 
+	evsel = evlist__event2evsel(evlist, event);
+	if (!evsel) {
+		/* Unknown evsel. */
 		perf_mmap__consume(&md->core);
-
-		err = evsel__parse_sample(evsel, &pevent->event, &pevent->sample);
-		if (err) {
-			Py_DECREF(pyevent);
-			return PyErr_Format(PyExc_OSError,
-					    "perf: can't parse sample, err=%d", err);
-		}
-
-		return pyevent;
+		Py_RETURN_NONE;
 	}
-end:
-	Py_INCREF(Py_None);
-	return Py_None;
+	pyevent = pyrf_event__new(event, evsel, evlist__session(evlist));
+	perf_mmap__consume(&md->core);
+	if (pyevent == NULL)
+		return PyErr_Occurred() ? NULL : PyErr_NoMemory();
+
+	return pyevent;
 }
 
 static PyObject *pyrf_evlist__open(struct pyrf_evlist *pevlist,
@@ -2013,10 +2380,7 @@ static PyObject *pyrf_evlist__str(PyObject *self)
 	evlist__for_each_entry(pevlist->evlist, pos) {
 		if (!first)
 			strbuf_addch(&sb, ',');
-		if (!pos->pmu)
-			strbuf_addstr(&sb, evsel__name(pos));
-		else
-			strbuf_addf(&sb, "%s/%s/", pos->pmu->name, evsel__name(pos));
+		strbuf_addstr(&sb, evsel__name(pos));
 		first = false;
 	}
 	strbuf_addstr(&sb, "])");
@@ -2499,24 +2863,12 @@ static int pyrf_session_tool__sample(const struct perf_tool *tool,
 				     struct machine *machine __maybe_unused)
 {
 	struct pyrf_session *psession = container_of(tool, struct pyrf_session, tool);
-	PyObject *pyevent = pyrf_event__new(event);
-	struct pyrf_event *pevent = (struct pyrf_event *)pyevent;
+	PyObject *pyevent = pyrf_event__new(event, sample->evsel, psession->session);
 	PyObject *ret;
 
 	if (pyevent == NULL)
 		return -ENOMEM;
 
-	memcpy(&pevent->event, event, event->header.size);
-	if (evsel__parse_sample(evsel, &pevent->event, &pevent->sample) < 0) {
-		Py_DECREF(pyevent);
-		return -1;
-	}
-	/* Avoid shallow copy pointing to lazily allocated memory that would be double freed. */
-	pevent->sample.user_regs = NULL;
-	pevent->sample.intr_regs = NULL;
-	if (pevent->sample.merged_callchain)
-		pevent->sample.callchain = NULL;
-
 	ret = PyObject_CallFunction(psession->sample, "O", pyevent);
 	if (!ret) {
 		PyErr_Print();
-- 
2.54.0.545.g6539524ca2-goog


