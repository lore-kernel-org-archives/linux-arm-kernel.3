Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 091A1FED3F1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 16:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v/GPyVwDCpJjt6s/fMuS2x3pB1WGSLhH82Ue3kSnZpg=; b=YJuYqcrgqojebkQMsp/AJPiW3w
	AaLzh3UuwA6Ma2kUYQqlNJukPgWI+ZNzlBIUO9vPjcNmYJCb565QaeACyYrfFkz4aMAFpw6pZmwGn
	I7OFZsH2HurUOxPEkeaDAZbrPGutlxwszlGSk1JdpLj9OVJvZ08TP431WYspHHQ98JkYtFVT+dtMO
	Vi0rMyqHUMJBF7cb+MDA44oof1/ngw8/zpeLk04LYUn/N7A5NxhTld0RvbUv88JrEkHH4iZNOAo8S
	9trpP66z25Je+AWL0Rf9Jlbtjy188QoTxQdp2ygF7fP6FmLvj5w59hc6P6RCetiPVbd7T9HsYvS0/
	vkW1+n0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGJht-0000000DU2M-21pB;
	Fri, 24 Apr 2026 16:48:45 +0000
Received: from mail-dy1-x134a.google.com ([2607:f8b0:4864:20::134a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGJhe-0000000DTkY-2nCY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Apr 2026 16:48:35 +0000
Received: by mail-dy1-x134a.google.com with SMTP id 5a478bee46e88-2cc75e79b97so20874647eec.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Apr 2026 09:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777049309; x=1777654109; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=v/GPyVwDCpJjt6s/fMuS2x3pB1WGSLhH82Ue3kSnZpg=;
        b=AJmZQmUXUCM38ksRffU2fyG48c7s2h1rONy3BzFlXcIxAMy20XYcLptRGIAaoMhrUy
         k68tq4ApNKROzb9zkwLfb/6DQ3HaZ3BjxBYDAsoKzuwVBRKFYYRKOXQE7tEKmzjs+4cl
         zgLZ6991JtiqrC0lrqs3mqQ+ICnP16497sqY7shW66Crda/SY4E7LrRNv/1DHAiMur7L
         jptTA19JwKFJugyQpLB4jvbog/q1pclMQzmVU01VBF/7z0ezPT26t9XaMtqMTIPVpY4e
         EY3OnwFyTej845dvZ5oiY0P9I/gQSzDfiBndoEoqJ0nPyC8+YUgaYl679bBjj6552pdX
         6BBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777049309; x=1777654109;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v/GPyVwDCpJjt6s/fMuS2x3pB1WGSLhH82Ue3kSnZpg=;
        b=Ar88eT8JwVmBzbwEE1lbogH+7bCqVVjHa4Jd8JUCW5TKqyy3AZexKiQFbIKlWy2ZLn
         PD2EtVHgMdpI+a96hf0ElSF/Rp3Y7ZExt7MR3h1ghb9Rv/2MAXYWs2IBwdFBMhKPMft8
         DIDFPSZRythft5oUWVrMWWV10TkfBqjeGGjyAGeAyO0zCjvkkYni33GEf092KVk/OBM3
         5C92HZF3w9twOa1pGUVWX6QTYzsuWXxjlWO1Gpgn0S1cRBuCB1E50Ci/tKmuP9j6M2mw
         hm9Ct4JDgQDJ5+I7CKTa/uisg0zQbS0pYW1tEUHe2d6OnwITAOd3wVlU+EwnPVvHHCXA
         vsoA==
X-Forwarded-Encrypted: i=1; AFNElJ9NWYJVTEYjS5CAkMGAIAkqgt/PoIr8KHencoZdX1VLU+MN+iMMShWo5+4u/Z5ykL6ZBpaQa2lhFlp7HKLR4/jD@lists.infradead.org
X-Gm-Message-State: AOJu0Yye0Z6M6uOX2bBuI6pwcodfZBrPhtxBItfIQJgUY9lreTLC78E0
	an8yzvHvQx5N1C8CGLHIpXbtV4wvPo1WWvcjc3iBgZM6DgKkxMGiGN+We20XCER3ArqYeMTaJNX
	opyJI73X3zQ==
X-Received: from dybgt36.prod.google.com ([2002:a05:7301:2224:b0:2d1:6536:ac8a])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:d512:b0:2c7:3a7:c7a7
 with SMTP id 5a478bee46e88-2e47951866bmr18879658eec.25.1777049309118; Fri, 24
 Apr 2026 09:48:29 -0700 (PDT)
Date: Fri, 24 Apr 2026 09:46:42 -0700
In-Reply-To: <20260424164721.2229025-1-irogers@google.com>
Mime-Version: 1.0
References: <20260423163406.1779809-1-irogers@google.com> <20260424164721.2229025-1-irogers@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260424164721.2229025-21-irogers@google.com>
Subject: [PATCH v5 20/58] perf python: Extend API for stat events in python.c
From: Ian Rogers <irogers@google.com>
To: acme@kernel.org, adrian.hunter@intel.com, james.clark@linaro.org, 
	leo.yan@linux.dev, namhyung@kernel.org, tmricht@linux.ibm.com
Cc: alice.mei.rogers@gmail.com, dapeng1.mi@linux.intel.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, mingo@redhat.com, peterz@infradead.org, 
	Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_094830_826330_2802B661 
X-CRM114-Status: GOOD (  19.19  )
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
v2:

1. Avoided Name Collision: Renamed the second "type" field in
   pyrf_stat_round_event__members[] to "stat_round_type" to prevent it
   from hiding the event header's type attribute.

2. Fixed Leak and Exception Handling in Callback: Added proper
   reference count handling for the result of PyObject_CallFunction()
   in pyrf_session_tool__stat() , and added an exception check that
   aborts the loop if the Python callback fails.

3. Fixed Leak in Destructor: Added Py_XDECREF(psession->stat); to
   pyrf_session__delete() to release the stat callback reference.
---
 tools/perf/util/python.c | 170 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 166 insertions(+), 4 deletions(-)

diff --git a/tools/perf/util/python.c b/tools/perf/util/python.c
index dc10d8a42d92..c4f0e01b64f3 100644
--- a/tools/perf/util/python.c
+++ b/tools/perf/util/python.c
@@ -299,6 +299,76 @@ static PyTypeObject pyrf_lost_event__type = {
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
+	  .offset = offsetof(struct perf_record_stat_round, type), .doc = "round type" },
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
@@ -986,6 +1056,12 @@ static int pyrf_event__setup_types(void)
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
@@ -1010,6 +1086,8 @@ static PyTypeObject *pyrf_event__type[] = {
 	[PERF_RECORD_SAMPLE]	 = &pyrf_sample_event__type,
 	[PERF_RECORD_SWITCH]	 = &pyrf_context_switch_event__type,
 	[PERF_RECORD_SWITCH_CPU_WIDE]  = &pyrf_context_switch_event__type,
+	[PERF_RECORD_STAT]	 = &pyrf_stat_event__type,
+	[PERF_RECORD_STAT_ROUND] = &pyrf_stat_round_event__type,
 };
 
 static PyObject *pyrf_event__new(const union perf_event *event)
@@ -1020,7 +1098,9 @@ static PyObject *pyrf_event__new(const union perf_event *event)
 	if ((event->header.type < PERF_RECORD_MMAP ||
 	     event->header.type > PERF_RECORD_SAMPLE) &&
 	    !(event->header.type == PERF_RECORD_SWITCH ||
-	      event->header.type == PERF_RECORD_SWITCH_CPU_WIDE)) {
+	      event->header.type == PERF_RECORD_SWITCH_CPU_WIDE ||
+	      event->header.type == PERF_RECORD_STAT ||
+	      event->header.type == PERF_RECORD_STAT_ROUND)) {
 		PyErr_Format(PyExc_TypeError, "Unexpected header type %u",
 			     event->header.type);
 		return NULL;
@@ -1880,7 +1960,40 @@ static PyObject *pyrf_evsel__get_attr_wakeup_events(PyObject *self, void */*clos
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
@@ -2640,6 +2753,8 @@ static const struct perf_constant perf__constants[] = {
 	PERF_CONST(RECORD_LOST_SAMPLES),
 	PERF_CONST(RECORD_SWITCH),
 	PERF_CONST(RECORD_SWITCH_CPU_WIDE),
+	PERF_CONST(RECORD_STAT),
+	PERF_CONST(RECORD_STAT_ROUND),
 
 	PERF_CONST(RECORD_MISC_SWITCH_OUT),
 	{ .name = NULL, },
@@ -3056,6 +3171,46 @@ static int pyrf_session_tool__sample(const struct perf_tool *tool,
 	return 0;
 }
 
+static int pyrf_session_tool__stat(const struct perf_tool *tool,
+				   struct perf_session *session,
+				   union perf_event *event)
+{
+	struct pyrf_session *psession = container_of(tool, struct pyrf_session, tool);
+	PyObject *pyevent = pyrf_event__new(event);
+	struct evsel *evsel = evlist__id2evsel(session->evlist, event->stat.id);
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
+	PyObject *pyevent = pyrf_event__new(event);
+
+	if (pyevent == NULL)
+		return -ENOMEM;
+
+	PyObject_CallFunction(psession->stat, "O", pyevent);
+	Py_DECREF(pyevent);
+	return 0;
+}
+
+
 static PyObject *pyrf_session__process(struct pyrf_session *psession, PyObject *args)
 {
 	struct machine *machine;
@@ -3088,10 +3243,11 @@ static int pyrf_session__init(struct pyrf_session *psession, PyObject *args, PyO
 {
 	struct pyrf_data *pdata;
 	PyObject *sample = NULL;
-	static char *kwlist[] = { "data", "sample", NULL };
+	PyObject *stat = NULL;
+	static char *kwlist[] = { "data", "sample", "stat", NULL };
 
-	if (!PyArg_ParseTupleAndKeywords(args, kwargs, "O!|O", kwlist, &pyrf_data__type, &pdata,
-					 &sample))
+	if (!PyArg_ParseTupleAndKeywords(args, kwargs, "O!|OO", kwlist, &pyrf_data__type, &pdata,
+					 &sample, &stat))
 		return -1;
 
 	Py_INCREF(pdata);
@@ -3113,8 +3269,13 @@ static int pyrf_session__init(struct pyrf_session *psession, PyObject *args, PyO
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
@@ -3156,6 +3317,7 @@ static void pyrf_session__delete(struct pyrf_session *psession)
 {
 	Py_XDECREF(psession->pdata);
 	Py_XDECREF(psession->sample);
+	Py_XDECREF(psession->stat);
 	perf_session__delete(psession->session);
 	Py_TYPE(psession)->tp_free((PyObject *)psession);
 }
-- 
2.54.0.545.g6539524ca2-goog


