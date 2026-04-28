Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 798B8FF886F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 07:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dv/wZt06TAEWoI0SMLj1YS0ILpIarRzTY+ClpzLsEU4=; b=azz9Ala+/VDGpyHhqMmRUcxPcI
	2TKmtlQ1RAiAr7qvuQ0PG0X0h5sR4wpxliYhzTCZz5po0+UMpzkVsy9/rxkPnAp78Us63puv/SkaA
	3BgTS9D8NoQL0cIU1YwvQx+9pPYNJwfrzYRA8Km/JVo6H31yQTkTvfmIvABMoVlCRKnpvwcExDRhl
	xfRVTSGVN/MeYI4/0pNqCAmsmkRgHC1mGGLk8Wnlv8FGY6OWaucnDmIEoozD/KEoIAr9PqWy6b1H5
	7iRbTjXstcjcWbRSKCHv9bRtOhEkGRMg8vy+Saphnti7r7SPVYJolh1xhI6hLNK1bUZ9KWDA/yTu6
	XTiXlNaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHckV-00000000hjl-2MYL;
	Tue, 28 Apr 2026 07:20:51 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHcjb-00000000gfc-3cjA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 07:19:58 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-36472c6a7d8so3765510a91.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 00:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777360794; x=1777965594; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Dv/wZt06TAEWoI0SMLj1YS0ILpIarRzTY+ClpzLsEU4=;
        b=XIsSEhUTWcPmcjY6ELNxLzpeKPSute9RckXuSMSLsRJBsD1zYIJLyCjGBrSj0p88RG
         9jiSomK7fF+2gSjpi9ImwBlEVdFOUOLTPZ3dRoHb5krDaP9X0jKM2NhW0IAsXc6yEYCF
         mYljk6jy4ECVA5u3E4wdYs2LJ219IpN5sUpMUCJlZwE81jz323K6q7JsUsrWE2wOp43A
         iORbQNO3fvp96AEsp6vhnPYvvwylHRPvgfFissWqmtmlh8ezyJjOC8J/Ho5A59AdxY2t
         ZfFMBuhj7PspxxzKZo6INXbNE88sIzrV8OVlMYiCx6iOykM63ZiWGvnflXA3jzKHQ75l
         tAWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777360794; x=1777965594;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Dv/wZt06TAEWoI0SMLj1YS0ILpIarRzTY+ClpzLsEU4=;
        b=bnA5VhCBlLj3r+oorBGlOnzhi0An6NeUlc+iquCMdfpEfp9a907356S93C5F4+wgQb
         XZKu6Ey76xXhKjF7CNnScyqs2ktS25IH6dHmM4vitcpZ++T9ff8K0c10UcvoX7VEL7P2
         u+aMOdzauigVuZzqNpiZSw5cNcGablTNaDIVpCZI6v7tPWkyuD/Rf5BHCJb68AOoooFi
         rWomXxyFUH/k2ViQz7qXVj3dI+ywJN+u+/Ib4ggqTGx2bc45mxILaLuNs4jL+b2jQ3El
         lxZ1ZuvrTtsAUugLiKsGq4jv19rf+LVF2Ows6sLz0cXS3q3CjMjI6u8JNkCSnxZ9Hyb2
         GJGw==
X-Forwarded-Encrypted: i=1; AFNElJ9kHWNhcUprgyP/F3zXhYfPySqZd/NX+gAWBus4y+5MO5V1RcxxftflLZJwq1qBISVN6ySzwd+UsXfjf/PmIn2x@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7KmGIZiu2WmKohAJErMsEvSc8I6uPNg/0REDZrrKvRV+5wmOY
	oTKY1SXrv29ycPTDk0ZAMLjhF+sEpgtuXeweaw7ADo90Ki3u0dJ3sdbk55u6g1296Od0C1Hl2+j
	E0kqAREw79A==
X-Received: from pgtt124.prod.google.com ([2002:a63:2d82:0:b0:c73:fbb5:af1b])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1a92:b0:35b:e56e:a17e
 with SMTP id 98e67ed59e1d1-364920a55e8mr2010942a91.17.1777360794333; Tue, 28
 Apr 2026 00:19:54 -0700 (PDT)
Date: Tue, 28 Apr 2026 00:18:23 -0700
In-Reply-To: <20260428071903.1886173-1-irogers@google.com>
Mime-Version: 1.0
References: <20260425224951.174663-1-irogers@google.com> <20260428071903.1886173-1-irogers@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260428071903.1886173-19-irogers@google.com>
Subject: [PATCH v8 18/58] perf python: Extend API for stat events in python.c
From: Ian Rogers <irogers@google.com>
To: acme@kernel.org, namhyung@kernel.org
Cc: adrian.hunter@intel.com, alice.mei.rogers@gmail.com, 
	dapeng1.mi@linux.intel.com, james.clark@linaro.org, leo.yan@linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, mingo@redhat.com, peterz@infradead.org, 
	tmricht@linux.ibm.com, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_001955_961761_305C5726 
X-CRM114-Status: GOOD (  21.15  )
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

Add stat information to the session. Add call backs for stat events.

Assisted-by: Gemini:gemini-3.1-pro-preview
Signed-off-by: Ian Rogers <irogers@google.com>
---
v5:
1. Fix Memory Corruption: Corrected the memory offset for `stat_round_type`
   in `pyrf_stat_round_event__members` by adding the base offset of
   `struct pyrf_event`.
2. Fix Memory Leak: Added `Py_XDECREF()` to free the unused return value
   of the Python callback in `pyrf_session_tool__stat_round()`.

---
v7:
- Added comprehensive size checks in pyrf_event__new for all event
  types.
- Fixed line length warning.
---
 tools/perf/util/python.c | 177 +++++++++++++++++++++++++++++++++++++--
 1 file changed, 170 insertions(+), 7 deletions(-)

diff --git a/tools/perf/util/python.c b/tools/perf/util/python.c
index 2ff588517c29..144fbc85fcb3 100644
--- a/tools/perf/util/python.c
+++ b/tools/perf/util/python.c
@@ -341,6 +341,77 @@ static PyTypeObject pyrf_lost_event__type = {
 	.tp_repr	= (reprfunc)pyrf_lost_event__repr,
 };
 
+static const char pyrf_stat_event__doc[] = PyDoc_STR("perf stat event object.");
+
+static PyMemberDef pyrf_stat_event__members[] = {
+	sample_members
+	member_def(perf_event_header, type, T_UINT, "event type"),
+	member_def(perf_record_stat, id, T_ULONGLONG, "event id"),
+	member_def(perf_record_stat, cpu, T_UINT, "event cpu"),
+	member_def(perf_record_stat, thread, T_UINT, "event thread"),
+	member_def(perf_record_stat, val, T_ULONGLONG, "counter value"),
+	member_def(perf_record_stat, ena, T_ULONGLONG, "enabled time"),
+	member_def(perf_record_stat, run, T_ULONGLONG, "running time"),
+	{ .name = NULL, },
+};
+
+static PyObject *pyrf_stat_event__repr(const struct pyrf_event *pevent)
+{
+	return PyUnicode_FromFormat(
+		"{ type: stat, id: %llu, cpu: %u, thread: %u, val: %llu, ena: %llu, run: %llu }",
+		pevent->event.stat.id,
+		pevent->event.stat.cpu,
+		pevent->event.stat.thread,
+		pevent->event.stat.val,
+		pevent->event.stat.ena,
+		pevent->event.stat.run);
+}
+
+static PyTypeObject pyrf_stat_event__type = {
+	PyVarObject_HEAD_INIT(NULL, 0)
+	.tp_name	= "perf.stat_event",
+	.tp_basicsize	= sizeof(struct pyrf_event),
+	.tp_new		= PyType_GenericNew,
+	.tp_dealloc	= (destructor)pyrf_event__delete,
+	.tp_flags	= Py_TPFLAGS_DEFAULT|Py_TPFLAGS_BASETYPE,
+	.tp_doc		= pyrf_stat_event__doc,
+	.tp_members	= pyrf_stat_event__members,
+	.tp_getset	= pyrf_event__getset,
+	.tp_repr	= (reprfunc)pyrf_stat_event__repr,
+};
+
+static const char pyrf_stat_round_event__doc[] = PyDoc_STR("perf stat round event object.");
+
+static PyMemberDef pyrf_stat_round_event__members[] = {
+	sample_members
+	member_def(perf_event_header, type, T_UINT, "event type"),
+	{ .name = "stat_round_type", .type = T_ULONGLONG,
+	  .offset = offsetof(struct pyrf_event, event) + offsetof(struct perf_record_stat_round, type),
+	  .doc = "round type" },
+	member_def(perf_record_stat_round, time, T_ULONGLONG, "round time"),
+	{ .name = NULL, },
+};
+
+static PyObject *pyrf_stat_round_event__repr(const struct pyrf_event *pevent)
+{
+	return PyUnicode_FromFormat("{ type: stat_round, type: %llu, time: %llu }",
+				   pevent->event.stat_round.type,
+				   pevent->event.stat_round.time);
+}
+
+static PyTypeObject pyrf_stat_round_event__type = {
+	PyVarObject_HEAD_INIT(NULL, 0)
+	.tp_name	= "perf.stat_round_event",
+	.tp_basicsize	= sizeof(struct pyrf_event),
+	.tp_new		= PyType_GenericNew,
+	.tp_dealloc	= (destructor)pyrf_event__delete,
+	.tp_flags	= Py_TPFLAGS_DEFAULT|Py_TPFLAGS_BASETYPE,
+	.tp_doc		= pyrf_stat_round_event__doc,
+	.tp_members	= pyrf_stat_round_event__members,
+	.tp_getset	= pyrf_event__getset,
+	.tp_repr	= (reprfunc)pyrf_stat_round_event__repr,
+};
+
 static const char pyrf_read_event__doc[] = PyDoc_STR("perf read event object.");
 
 static PyMemberDef pyrf_read_event__members[] = {
@@ -1032,6 +1103,12 @@ static int pyrf_event__setup_types(void)
 	if (err < 0)
 		goto out;
 	err = PyType_Ready(&pyrf_context_switch_event__type);
+	if (err < 0)
+		goto out;
+	err = PyType_Ready(&pyrf_stat_event__type);
+	if (err < 0)
+		goto out;
+	err = PyType_Ready(&pyrf_stat_round_event__type);
 	if (err < 0)
 		goto out;
 	err = PyType_Ready(&pyrf_callchain_node__type);
@@ -1057,6 +1134,8 @@ static PyTypeObject *pyrf_event__type[] = {
 	[PERF_RECORD_SAMPLE]	 = &pyrf_sample_event__type,
 	[PERF_RECORD_SWITCH]	 = &pyrf_context_switch_event__type,
 	[PERF_RECORD_SWITCH_CPU_WIDE]  = &pyrf_context_switch_event__type,
+	[PERF_RECORD_STAT]	 = &pyrf_stat_event__type,
+	[PERF_RECORD_STAT_ROUND] = &pyrf_stat_round_event__type,
 };
 
 static PyObject *pyrf_event__new(const union perf_event *event, struct evsel *evsel,
@@ -1089,13 +1168,13 @@ static PyObject *pyrf_event__new(const union perf_event *event, struct evsel *ev
 	case PERF_RECORD_EXIT:
 		min_size = sizeof(struct perf_record_fork);
 		break;
+	case PERF_RECORD_LOST:
+		min_size = sizeof(struct perf_record_lost);
+		break;
 	case PERF_RECORD_THROTTLE:
 	case PERF_RECORD_UNTHROTTLE:
 		min_size = sizeof(struct perf_record_throttle);
 		break;
-	case PERF_RECORD_LOST:
-		min_size = sizeof(struct perf_record_lost);
-		break;
 	case PERF_RECORD_READ:
 		min_size = sizeof(struct perf_record_read);
 		break;
@@ -2117,7 +2196,40 @@ static PyObject *pyrf_evsel__get_attr_wakeup_events(PyObject *self, void */*clos
 	return PyLong_FromUnsignedLong(pevsel->evsel->core.attr.wakeup_events);
 }
 
+static PyObject *pyrf_evsel__get_ids(struct pyrf_evsel *pevsel, void *closure __maybe_unused)
+{
+	struct evsel *evsel = pevsel->evsel;
+	PyObject *list = PyList_New(0);
+
+	if (!list)
+		return NULL;
+
+	for (u32 i = 0; i < evsel->core.ids; i++) {
+		PyObject *id = PyLong_FromUnsignedLongLong(evsel->core.id[i]);
+		int ret;
+
+		if (!id) {
+			Py_DECREF(list);
+			return NULL;
+		}
+		ret = PyList_Append(list, id);
+		Py_DECREF(id);
+		if (ret < 0) {
+			Py_DECREF(list);
+			return NULL;
+		}
+	}
+
+	return list;
+}
+
 static PyGetSetDef pyrf_evsel__getset[] = {
+	{
+		.name = "ids",
+		.get = (getter)pyrf_evsel__get_ids,
+		.set = NULL,
+		.doc = "event IDs.",
+	},
 	{
 		.name = "tracking",
 		.get = pyrf_evsel__get_tracking,
@@ -2890,6 +3002,8 @@ static const struct perf_constant perf__constants[] = {
 	PERF_CONST(RECORD_LOST_SAMPLES),
 	PERF_CONST(RECORD_SWITCH),
 	PERF_CONST(RECORD_SWITCH_CPU_WIDE),
+	PERF_CONST(RECORD_STAT),
+	PERF_CONST(RECORD_STAT_ROUND),
 
 	PERF_CONST(RECORD_MISC_SWITCH_OUT),
 	{ .name = NULL, },
@@ -3266,6 +3380,7 @@ struct pyrf_session {
 	struct perf_tool tool;
 	struct pyrf_data *pdata;
 	PyObject *sample;
+	PyObject *stat;
 };
 
 static int pyrf_session_tool__sample(const struct perf_tool *tool,
@@ -3291,6 +3406,47 @@ static int pyrf_session_tool__sample(const struct perf_tool *tool,
 	return 0;
 }
 
+static int pyrf_session_tool__stat(const struct perf_tool *tool,
+				   struct perf_session *session,
+				   union perf_event *event)
+{
+	struct pyrf_session *psession = container_of(tool, struct pyrf_session, tool);
+	struct evsel *evsel = evlist__id2evsel(session->evlist, event->stat.id);
+	PyObject *pyevent = pyrf_event__new(event, evsel, psession->session);
+	const char *name = evsel ? evsel__name(evsel) : "unknown";
+	PyObject *ret;
+
+	if (pyevent == NULL)
+		return -ENOMEM;
+
+	ret = PyObject_CallFunction(psession->stat, "Os", pyevent, name);
+	if (!ret) {
+		PyErr_Print();
+		Py_DECREF(pyevent);
+		return -1;
+	}
+	Py_DECREF(ret);
+	Py_DECREF(pyevent);
+	return 0;
+}
+
+static int pyrf_session_tool__stat_round(const struct perf_tool *tool,
+					 struct perf_session *session __maybe_unused,
+					 union perf_event *event)
+{
+	struct pyrf_session *psession = container_of(tool, struct pyrf_session, tool);
+	PyObject *pyevent = pyrf_event__new(event, /*evsel=*/NULL, psession->session);
+	PyObject *ret;
+
+	if (pyevent == NULL)
+		return -ENOMEM;
+
+	ret = PyObject_CallFunction(psession->stat, "O", pyevent);
+	Py_XDECREF(ret);
+	Py_DECREF(pyevent);
+	return 0;
+}
+
 static PyObject *pyrf_session__find_thread(struct pyrf_session *psession, PyObject *args)
 {
 	struct machine *machine;
@@ -3322,13 +3478,13 @@ static PyObject *pyrf_session__find_thread(struct pyrf_session *psession, PyObje
 static PyObject *pyrf_session__new(PyTypeObject *type, PyObject *args, PyObject *kwargs)
 {
 	struct pyrf_data *pdata;
-	PyObject *sample = NULL;
-	static char *kwlist[] = { "data", "sample", NULL };
+	PyObject *sample = NULL, *stat = NULL;
+	static char *kwlist[] = { "data", "sample", "stat", NULL };
 	struct pyrf_session *psession;
 	struct perf_session *session;
 
-	if (!PyArg_ParseTupleAndKeywords(args, kwargs, "O!|O", kwlist, &pyrf_data__type, &pdata,
-					 &sample))
+	if (!PyArg_ParseTupleAndKeywords(args, kwargs, "O!|OO", kwlist, &pyrf_data__type, &pdata,
+					 &sample, &stat))
 		return NULL;
 
 	psession = PyObject_New(struct pyrf_session, type);
@@ -3337,6 +3493,7 @@ static PyObject *pyrf_session__new(PyTypeObject *type, PyObject *args, PyObject
 
 	psession->session = NULL;
 	psession->sample = NULL;
+	psession->stat = NULL;
 
 	Py_INCREF(pdata);
 	psession->pdata = pdata;
@@ -3358,8 +3515,13 @@ static PyObject *pyrf_session__new(PyTypeObject *type, PyObject *args, PyObject
 	} while (0)
 
 	ADD_TOOL(sample);
+	ADD_TOOL(stat);
 	#undef ADD_TOOL
 
+	if (stat)
+		psession->tool.stat_round = pyrf_session_tool__stat_round;
+
+
 	psession->tool.comm		= perf_event__process_comm;
 	psession->tool.mmap		= perf_event__process_mmap;
 	psession->tool.mmap2            = perf_event__process_mmap2;
@@ -3399,6 +3561,7 @@ static void pyrf_session__delete(struct pyrf_session *psession)
 	perf_session__delete(psession->session);
 	Py_XDECREF(psession->pdata);
 	Py_XDECREF(psession->sample);
+	Py_XDECREF(psession->stat);
 	Py_TYPE(psession)->tp_free((PyObject *)psession);
 }
 
-- 
2.54.0.545.g6539524ca2-goog


