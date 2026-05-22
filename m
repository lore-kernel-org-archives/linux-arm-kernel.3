Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACB78CD5BB0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 22:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vgwQv6hVW+kKgJ2hjv8Wx2O4MMy7o/9pGzID9sBFXtA=; b=NMuEVAJdODUOo65yt8zhfnAK0n
	9FThLXaUO+V0PONVd0xFSOxMfY7Kt3k3JmuGFS8xhCAT1yEbDQOBCpAQZlBFGEoqdtqGtHo8Ns18T
	hBfdxK7uMqTxhb6M8ipjfQ43D9hGOxbhPyEO6KVJVIXSjBlS8EgPispfQrz/HIvZNlzUzi/yDVGeV
	13nkUzoDh67J3d2Fh6uvhjUKtfLA1+ctsCJ0zUMIbzKa/DzaY+b6Z0gkRls0cNTOz3VmlOY5BdYHB
	V5f2Ob46PN0HRvK17nEi2WkAuC/T6YEEL9gzYIN8nXogU7vbGd1qupJfOC+fUCW1RpHOLyZLpV02B
	oF7/Qtsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQXzx-0000000C3Lo-03Af;
	Fri, 22 May 2026 22:05:41 +0000
Received: from mail-dy1-x1349.google.com ([2607:f8b0:4864:20::1349])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQXzY-0000000C2uU-15JC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 22:05:20 +0000
Received: by mail-dy1-x1349.google.com with SMTP id 5a478bee46e88-2ee34588671so8871726eec.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 15:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779487515; x=1780092315; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=vgwQv6hVW+kKgJ2hjv8Wx2O4MMy7o/9pGzID9sBFXtA=;
        b=s+sFOZ64VMsRsx4Tn21xfpieJRDORY7Ed+NkhtLYEK/zrOEE+OqW/fJ23K4tVyhQye
         LzY9x9an4jQ0eqE+1m06JHDtzwr0hAo7XVLqnWxWrb6J8l/STXkkICIxNxKT23LGJKeC
         ou9wuX7UwTaEu/+qwBTFQ9eI0F7Z9VgeUmZ4PjRvC3qe0x9PlplZpALDX1fzvauTCmPR
         OP2ZsF7R6BgN5pHb0wvoLJK+0QgdPVEcF9v7NSPfOu/xr6Fhfrerlb0I+F/8Iz/8raZ4
         erdCAgp/CCAd6SmKX+quhg8OhNILPX2OMz5Bp4EAp3ywCGoMM/B7FmMxLc4+S47F4ttE
         ZqLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779487515; x=1780092315;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vgwQv6hVW+kKgJ2hjv8Wx2O4MMy7o/9pGzID9sBFXtA=;
        b=XLOq7c7/xatO1UjhYYfCfIeHb90z80/UhLo4/ANNyDxoIrJPHj6gGVLsSkThFDKdgZ
         t/A8ZHy32ONvpm1TwRHiBVhwsAx2F0bxQGWn3p0ZaV4S0I8XVK9qYZfgovrMmUJzNnMu
         qG9tj8UNaN0L2EZ247hNom/Ejprz60RPR8qabcTmyZWQkX3Hxj0ZEGB2xbtpDTrVEKeI
         SpH1IiIkMD38ZZVewsnqKkq6o87lB70vVvgs8aHuuB1uTBqmBaqwzEvHRmjLgwG3M8QD
         SAY0TqXaxiDgBRJmQNe1xOnozxpD0QE7DxQjjuvZ9sqyFMBt2a6duqBDvHmipiCrJVVA
         qPVA==
X-Forwarded-Encrypted: i=1; AFNElJ9b7hpF7cFa8MB6FMSeKSrdrJrM8eiW9/64c7WcHSK11AnYlRmjaBEku9TxBXF8GV1EJDGEQUI9IEayp8eBiTuh@lists.infradead.org
X-Gm-Message-State: AOJu0YxCFfVgV7S8yYpE2o+lAhsy/bdgcwunC/uRFgpP+Y1S2HR7EIFS
	P65BK0Dd9PCGviHh5QR0c0EVlAvpnsVZWhJMpZJQuw2e8mPl+8q+ozGe2PJF0fInv+akilCRGIW
	guuGjkbCwVg==
X-Received: from dycac4.prod.google.com ([2002:a05:7301:5504:b0:2f9:af7:5047])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:9f05:b0:2ee:be86:7b90
 with SMTP id 5a478bee46e88-3044912f80cmr2339689eec.29.1779487514868; Fri, 22
 May 2026 15:05:14 -0700 (PDT)
Date: Fri, 22 May 2026 15:04:26 -0700
In-Reply-To: <20260522220435.2378363-1-irogers@google.com>
Mime-Version: 1.0
References: <20260428071903.1886173-1-irogers@google.com> <20260522220435.2378363-1-irogers@google.com>
X-Mailer: git-send-email 2.54.0.794.g4f17f83d09-goog
Message-ID: <20260522220435.2378363-16-irogers@google.com>
Subject: [PATCH v9 15/23] perf python: Refactor and add accessors to sample event
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, namhyung@kernel.org
Cc: adrian.hunter@intel.com, alice.mei.rogers@gmail.com, 
	dapeng1.mi@linux.intel.com, james.clark@linaro.org, leo.yan@linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, mingo@redhat.com, peterz@infradead.org, 
	tmricht@linux.ibm.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_150517_387317_9B5D9D35 
X-CRM114-Status: GOOD (  20.13  )
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
only be present in sample events. Add accessors for sample
events. Ensure offsets are within the bounds of the event. Allocate
just enough memory for the copied event, don't make the maximum event
size each time.

Assisted-by: Gemini:gemini-3.1-pro-preview
Signed-off-by: Ian Rogers <irogers@google.com>
---
v5:
1. Fix Uninitialized Memory: Restore zero-initialization of `pevent->sample`
   in `pyrf_event__new()` to prevent wild free crashes on error paths.

v6:
- Refactored `pyrf_event__new` to take `evsel` and `session`, and use
  dynamic allocation based on event size. Updated callers.

v8:
- Ensure events are properly deallocated.
---
 tools/perf/util/python.c | 618 +++++++++++++++++++++++++++++++++------
 1 file changed, 534 insertions(+), 84 deletions(-)

diff --git a/tools/perf/util/python.c b/tools/perf/util/python.c
index 18a48779c591..029915b7a1fe 100644
--- a/tools/perf/util/python.c
+++ b/tools/perf/util/python.c
@@ -10,21 +10,28 @@
 #include <perf/mmap.h>
 #include <structmember.h>
 
+#include "addr_location.h"
+#include "build-id.h"
 #include "callchain.h"
 #include "comm.h"
 #include "counts.h"
 #include "data.h"
 #include "debug.h"
+#include "dso.h"
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
 #include "thread.h"
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
@@ -105,9 +145,11 @@ static PyTypeObject pyrf_mmap_event__type = {
 	PyVarObject_HEAD_INIT(NULL, 0)
 	.tp_name	= "perf.mmap_event",
 	.tp_basicsize	= sizeof(struct pyrf_event),
+	.tp_dealloc	= (destructor)pyrf_event__delete,
 	.tp_flags	= Py_TPFLAGS_DEFAULT|Py_TPFLAGS_BASETYPE,
 	.tp_doc		= pyrf_mmap_event__doc,
 	.tp_members	= pyrf_mmap_event__members,
+	.tp_getset	= pyrf_event__getset,
 	.tp_repr	= (reprfunc)pyrf_mmap_event__repr,
 };
 
@@ -140,9 +182,11 @@ static PyTypeObject pyrf_task_event__type = {
 	PyVarObject_HEAD_INIT(NULL, 0)
 	.tp_name	= "perf.task_event",
 	.tp_basicsize	= sizeof(struct pyrf_event),
+	.tp_dealloc	= (destructor)pyrf_event__delete,
 	.tp_flags	= Py_TPFLAGS_DEFAULT|Py_TPFLAGS_BASETYPE,
 	.tp_doc		= pyrf_task_event__doc,
 	.tp_members	= pyrf_task_event__members,
+	.tp_getset	= pyrf_event__getset,
 	.tp_repr	= (reprfunc)pyrf_task_event__repr,
 };
 
@@ -169,9 +213,11 @@ static PyTypeObject pyrf_comm_event__type = {
 	PyVarObject_HEAD_INIT(NULL, 0)
 	.tp_name	= "perf.comm_event",
 	.tp_basicsize	= sizeof(struct pyrf_event),
+	.tp_dealloc	= (destructor)pyrf_event__delete,
 	.tp_flags	= Py_TPFLAGS_DEFAULT|Py_TPFLAGS_BASETYPE,
 	.tp_doc		= pyrf_comm_event__doc,
 	.tp_members	= pyrf_comm_event__members,
+	.tp_getset	= pyrf_event__getset,
 	.tp_repr	= (reprfunc)pyrf_comm_event__repr,
 };
 
@@ -201,9 +247,11 @@ static PyTypeObject pyrf_throttle_event__type = {
 	PyVarObject_HEAD_INIT(NULL, 0)
 	.tp_name	= "perf.throttle_event",
 	.tp_basicsize	= sizeof(struct pyrf_event),
+	.tp_dealloc	= (destructor)pyrf_event__delete,
 	.tp_flags	= Py_TPFLAGS_DEFAULT|Py_TPFLAGS_BASETYPE,
 	.tp_doc		= pyrf_throttle_event__doc,
 	.tp_members	= pyrf_throttle_event__members,
+	.tp_getset	= pyrf_event__getset,
 	.tp_repr	= (reprfunc)pyrf_throttle_event__repr,
 };
 
@@ -236,9 +284,11 @@ static PyTypeObject pyrf_lost_event__type = {
 	PyVarObject_HEAD_INIT(NULL, 0)
 	.tp_name	= "perf.lost_event",
 	.tp_basicsize	= sizeof(struct pyrf_event),
+	.tp_dealloc	= (destructor)pyrf_event__delete,
 	.tp_flags	= Py_TPFLAGS_DEFAULT|Py_TPFLAGS_BASETYPE,
 	.tp_doc		= pyrf_lost_event__doc,
 	.tp_members	= pyrf_lost_event__members,
+	.tp_getset	= pyrf_event__getset,
 	.tp_repr	= (reprfunc)pyrf_lost_event__repr,
 };
 
@@ -266,9 +316,11 @@ static PyTypeObject pyrf_read_event__type = {
 	PyVarObject_HEAD_INIT(NULL, 0)
 	.tp_name	= "perf.read_event",
 	.tp_basicsize	= sizeof(struct pyrf_event),
+	.tp_dealloc	= (destructor)pyrf_event__delete,
 	.tp_flags	= Py_TPFLAGS_DEFAULT|Py_TPFLAGS_BASETYPE,
 	.tp_doc		= pyrf_read_event__doc,
 	.tp_members	= pyrf_read_event__members,
+	.tp_getset	= pyrf_event__getset,
 	.tp_repr	= (reprfunc)pyrf_read_event__repr,
 };
 
@@ -276,16 +328,17 @@ static const char pyrf_sample_event__doc[] = PyDoc_STR("perf sample event object
 
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
@@ -303,6 +356,8 @@ static PyObject *pyrf_sample_event__repr(const struct pyrf_event *pevent)
 #ifdef HAVE_LIBTRACEEVENT
 static bool is_tracepoint(const struct pyrf_event *pevent)
 {
+	if (!pevent->sample.evsel)
+		return false;
 	return pevent->sample.evsel->core.attr.type == PERF_TYPE_TRACEPOINT;
 }
 
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
@@ -386,13 +634,102 @@ pyrf_sample_event__getattro(struct pyrf_event *pevent, PyObject *attr_name)
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
+	.tp_dealloc	= (destructor)pyrf_event__delete,
 	.tp_flags	= Py_TPFLAGS_DEFAULT|Py_TPFLAGS_BASETYPE,
 	.tp_doc		= pyrf_sample_event__doc,
 	.tp_members	= pyrf_sample_event__members,
+	.tp_getset	= pyrf_sample_event__getset,
+	.tp_methods	= pyrf_sample_event__methods,
 	.tp_repr	= (reprfunc)pyrf_sample_event__repr,
 	.tp_getattro	= (getattrofunc) pyrf_sample_event__getattro,
 };
@@ -428,25 +765,17 @@ static PyTypeObject pyrf_context_switch_event__type = {
 	PyVarObject_HEAD_INIT(NULL, 0)
 	.tp_name	= "perf.context_switch_event",
 	.tp_basicsize	= sizeof(struct pyrf_event),
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
@@ -490,33 +819,175 @@ static PyTypeObject *pyrf_event__type[] = {
 	[PERF_RECORD_SWITCH_CPU_WIDE]  = &pyrf_context_switch_event__type,
 };
 
-static PyObject *pyrf_event__new(const union perf_event *event)
+static PyObject *pyrf_event__new(const union perf_event *event, struct evsel *evsel,
+				 struct perf_session *session __maybe_unused)
 {
 	struct pyrf_event *pevent;
-	PyTypeObject *ptype;
+	size_t size;
+	int err;
+	size_t min_size = sizeof(struct perf_event_header);
 
-	if ((event->header.type < PERF_RECORD_MMAP ||
-	     event->header.type > PERF_RECORD_SAMPLE) &&
-	    !(event->header.type == PERF_RECORD_SWITCH ||
-	      event->header.type == PERF_RECORD_SWITCH_CPU_WIDE)) {
-		PyErr_Format(PyExc_TypeError, "Unexpected header type %u",
+	if (event->header.type >= ARRAY_SIZE(pyrf_event__type) ||
+	    pyrf_event__type[event->header.type] == NULL) {
+		return PyErr_Format(PyExc_TypeError, "Unexpected header type %u",
 			     event->header.type);
-		return NULL;
 	}
 
-	// FIXME this better be dynamic or we need to parse everything
-	// before calling perf_mmap__consume(), including tracepoint fields.
-	if (sizeof(pevent->event) < event->header.size) {
-		PyErr_Format(PyExc_TypeError, "Unexpected event size: %zd < %u",
-			     sizeof(pevent->event), event->header.size);
-		return NULL;
+	switch (event->header.type) {
+	case PERF_RECORD_MMAP:
+		min_size = offsetof(struct perf_record_mmap, filename) + 1;
+		break;
+	case PERF_RECORD_MMAP2:
+		min_size = offsetof(struct perf_record_mmap2, filename) + 1;
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
+	case PERF_RECORD_AUX:
+		min_size = sizeof(struct perf_record_aux);
+		break;
+	case PERF_RECORD_ITRACE_START:
+		min_size = sizeof(struct perf_record_itrace_start);
+		break;
+	case PERF_RECORD_LOST_SAMPLES:
+		min_size = sizeof(struct perf_record_lost_samples);
+		break;
+	case PERF_RECORD_NAMESPACES:
+		min_size = offsetof(struct perf_record_namespaces, link_info);
+		break;
+	case PERF_RECORD_KSYMBOL:
+		min_size = sizeof(struct perf_record_ksymbol);
+		break;
+	case PERF_RECORD_BPF_EVENT:
+		min_size = sizeof(struct perf_record_bpf_event);
+		break;
+	case PERF_RECORD_CGROUP:
+		min_size = sizeof(struct perf_record_cgroup);
+		break;
+	case PERF_RECORD_TEXT_POKE:
+		min_size = offsetof(struct perf_record_text_poke_event, bytes);
+		break;
+	case PERF_RECORD_AUX_OUTPUT_HW_ID:
+		min_size = sizeof(struct perf_record_aux_output_hw_id);
+		break;
+	case PERF_RECORD_CALLCHAIN_DEFERRED:
+		min_size = sizeof(struct perf_record_callchain_deferred);
+		break;
+	case PERF_RECORD_HEADER_ATTR:
+		min_size = sizeof(struct perf_record_header_attr);
+		break;
+	case PERF_RECORD_HEADER_TRACING_DATA:
+		min_size = sizeof(struct perf_record_header_tracing_data);
+		break;
+	case PERF_RECORD_HEADER_BUILD_ID:
+		min_size = offsetof(struct perf_record_header_build_id, filename) + 1;
+		break;
+	case PERF_RECORD_ID_INDEX:
+		min_size = offsetof(struct perf_record_id_index, entries);
+		break;
+	case PERF_RECORD_AUXTRACE_INFO:
+		min_size = offsetof(struct perf_record_auxtrace_info, priv);
+		break;
+	case PERF_RECORD_AUXTRACE:
+		min_size = sizeof(struct perf_record_auxtrace);
+		break;
+	case PERF_RECORD_AUXTRACE_ERROR:
+		min_size = sizeof(struct perf_record_auxtrace_error);
+		break;
+	case PERF_RECORD_THREAD_MAP:
+		min_size = offsetof(struct perf_record_thread_map, entries);
+		break;
+	case PERF_RECORD_CPU_MAP:
+		min_size = sizeof(struct perf_record_cpu_map);
+		break;
+	case PERF_RECORD_STAT_CONFIG:
+		min_size = offsetof(struct perf_record_stat_config, data);
+		break;
+	case PERF_RECORD_STAT:
+		min_size = sizeof(struct perf_record_stat);
+		break;
+	case PERF_RECORD_STAT_ROUND:
+		min_size = sizeof(struct perf_record_stat_round);
+		break;
+	case PERF_RECORD_EVENT_UPDATE:
+		min_size = sizeof(struct perf_record_event_update);
+		break;
+	case PERF_RECORD_TIME_CONV:
+		min_size = sizeof(struct perf_record_time_conv);
+		break;
+	case PERF_RECORD_HEADER_FEATURE:
+		min_size = offsetof(struct perf_record_header_feature, data);
+		break;
+	case PERF_RECORD_COMPRESSED:
+		min_size = offsetof(struct perf_record_compressed, data);
+		break;
+	case PERF_RECORD_COMPRESSED2:
+		min_size = offsetof(struct perf_record_compressed2, data);
+		break;
+	case PERF_RECORD_BPF_METADATA:
+		min_size = offsetof(struct perf_record_bpf_metadata, entries);
+		break;
+	case PERF_RECORD_SCHEDSTAT_CPU:
+		min_size = sizeof(struct perf_record_schedstat_cpu);
+		break;
+	case PERF_RECORD_SCHEDSTAT_DOMAIN:
+		min_size = sizeof(struct perf_record_schedstat_domain);
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
+
+	/* Copy the event for memory safety and initilaize variables. */
+	PyObject_Init((PyObject *)pevent, pyrf_event__type[event->header.type]);
+	memcpy(&pevent->event, event, event->header.size);
+
+	if (event->header.type == PERF_RECORD_MMAP) {
+		/* Ensure '\0' string termination. */
+		size_t max_len = pevent->event.header.size - offsetof(struct perf_record_mmap, filename);
 
-	ptype = pyrf_event__type[event->header.type];
-	pevent = PyObject_New(struct pyrf_event, ptype);
-	if (pevent != NULL) {
-		memcpy(&pevent->event, event, event->header.size);
-		perf_sample__init(&pevent->sample, /*all=*/false);
+		pevent->event.mmap.filename[max_len - 1] = '\0';
+	}
+
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
@@ -1209,7 +1680,7 @@ static PyObject *pyrf_evsel__str(PyObject *self)
 	struct pyrf_evsel *pevsel = (void *)self;
 	struct evsel *evsel = pevsel->evsel;
 
-	return PyUnicode_FromFormat("evsel(%s/%s/)", evsel__pmu_name(evsel), evsel__name(evsel));
+	return PyUnicode_FromFormat("evsel(%s)", evsel__name(evsel));
 }
 
 static PyMethodDef pyrf_evsel__methods[] = {
@@ -1773,9 +2244,11 @@ static PyObject *pyrf_evlist__read_on_cpu(struct pyrf_evlist *pevlist,
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
@@ -1783,44 +2256,31 @@ static PyObject *pyrf_evlist__read_on_cpu(struct pyrf_evlist *pevlist,
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
@@ -2015,10 +2475,7 @@ static PyObject *pyrf_evlist__str(PyObject *self)
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
@@ -2528,19 +2985,12 @@ static int pyrf_session_tool__sample(const struct perf_tool *tool,
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
-	if (evsel__parse_sample(sample->evsel, &pevent->event, &pevent->sample) < 0) {
-		Py_DECREF(pyevent);
-		return -1;
-	}
-
 	ret = PyObject_CallFunction(psession->sample, "O", pyevent);
 	if (!ret) {
 		Py_DECREF(pyevent);
-- 
2.54.0.794.g4f17f83d09-goog


