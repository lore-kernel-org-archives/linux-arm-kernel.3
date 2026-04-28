Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CF0FFF886F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 07:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tJuqBIsBHp8I+zU9u4yHTVu56TpbRMNDcYeLbhz4OBY=; b=5Eg3F//xGuJAuc9yb/7JDRSB9W
	T3SFRZl1n2VxGK+Bn44qvP0xKpqAelnFmSQJ/Bn6K/7i4lvv/K+HBF4HXVltM659ZQoQN6mrSIQhg
	ddjJ38/1mClvh9acBvElGKIH+s0qfOCTC94B7qUzrThRN/CNiL4jTss6whlEy6yh7loHoIm2UxUNx
	IydmK6QlLRdMgqGzqZOnP2u30bR3KOv+MdK5NohLddCLt0XdXmM5ALT18Ld6Wc7dXbhs3oxVI4PnU
	dTSg9xnor7KdU2tEqvx5hUjhZzGdTKj839imtoZcHBCGIUAaegEewFfNfK90yQHlKNhQCemaDX0hc
	5LF/BOXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHcji-00000000gpG-0UjB;
	Tue, 28 Apr 2026 07:20:02 +0000
Received: from mail-dl1-x1249.google.com ([2607:f8b0:4864:20::1249])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHcjX-00000000gbq-2pMh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 07:19:54 +0000
Received: by mail-dl1-x1249.google.com with SMTP id a92af1059eb24-12c726f4019so14411739c88.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 00:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777360790; x=1777965590; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=tJuqBIsBHp8I+zU9u4yHTVu56TpbRMNDcYeLbhz4OBY=;
        b=oaxTCeKUVYve4S52K+SZvAbqt9yC/mkqhNuW5rh1L8nyb9JqeEMnD33leCrdGZ3vQ/
         V+mxz0NCqcqctK1u+10NJyOCttkzt2YMy3zzxp5ufxyOJFJnWhKZV6TZYPzXumyyRnxb
         RTMFPacI50RRsG+1KSsEzmW36L4IB1TJrWNWYOwuMGzxQgaLzPWMWNuwKRkfROFcHu6O
         UaYkfd6vkxENSkHA2sBSV+4IspHlzbSfufRalJcE2QxVo2dYbIC23NoPpAeM4EhjwPqv
         Rs2uf57Y/g0KAiXOtLtlliQfjClZiIfSOyM6zGJP9pbQb4fjETR3mlj8sVK+Itcexxu3
         nmZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777360790; x=1777965590;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tJuqBIsBHp8I+zU9u4yHTVu56TpbRMNDcYeLbhz4OBY=;
        b=oMux02qUFGsegP8UNKE69NSeaLT45W64lG5wM+XgSwwJVR26PQPBibdr4bAf2GWNu+
         h2uEejJUsO//sXws5G7SdpTlN+i/i8WAIWayqsFZ4KEGMHOMg03LT67u/Y/isYBxAPP1
         hCqCBk7cl5RgykPQLwIxpmd4dC6sdxylbE9MDPY9r/8BXPgwIk4pY8ivm5up9qFPfufX
         aDvWQENc+OzfCHJLrDCuVV3Rs2p7SREPKLxlOH+5LybFZBxn6SmdydmAXvwVFWdlHsBs
         kSIQw+drn+vxbHbGNgrc9BdDqRGdmEnjZ9V3b+w2U3T286/mIBo4hFYDA22huiIl8JRC
         mTIA==
X-Forwarded-Encrypted: i=1; AFNElJ/uep+2h4G0OF0cXIYJSPHTAdN1lnnHFI0blxPdKthtGKGEfVMymt9kGLi6cGZJf6m3llwglhPquM1HmV2kwfTl@lists.infradead.org
X-Gm-Message-State: AOJu0YyNG17dbIo4c/KHlmttuSHTJJVtRErSFCfbk5kWrz7FP9/CjbOC
	XZKHUgwhwMFAYiq2B+HM4tqi5RtfAR1kjCIQuNVpaq4icYlwiVDfhCxYtW3zTeyCtLJHuKaHFcV
	Gl1XY/8zA/Q==
X-Received: from dlbrl15.prod.google.com ([2002:a05:7022:f50f:b0:12c:177a:ac1d])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:11f:b0:128:bf8d:44d2
 with SMTP id a92af1059eb24-12ddd944310mr790909c88.2.1777360790350; Tue, 28
 Apr 2026 00:19:50 -0700 (PDT)
Date: Tue, 28 Apr 2026 00:18:21 -0700
In-Reply-To: <20260428071903.1886173-1-irogers@google.com>
Mime-Version: 1.0
References: <20260425224951.174663-1-irogers@google.com> <20260428071903.1886173-1-irogers@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260428071903.1886173-17-irogers@google.com>
Subject: [PATCH v8 16/58] perf python: Add mmap2 event
From: Ian Rogers <irogers@google.com>
To: acme@kernel.org, namhyung@kernel.org
Cc: adrian.hunter@intel.com, alice.mei.rogers@gmail.com, 
	dapeng1.mi@linux.intel.com, james.clark@linaro.org, leo.yan@linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, mingo@redhat.com, peterz@infradead.org, 
	tmricht@linux.ibm.com, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_001951_740570_44082B2A 
X-CRM114-Status: GOOD (  14.19  )
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

If mmap is handled so should mmap2 events. Add support as a distinct
python event type.

Assisted-by: Gemini:gemini-3.1-pro-preview
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/python.c | 60 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/tools/perf/util/python.c b/tools/perf/util/python.c
index 1ca296000351..ae009bc9a0d7 100644
--- a/tools/perf/util/python.c
+++ b/tools/perf/util/python.c
@@ -151,6 +151,54 @@ static PyTypeObject pyrf_mmap_event__type = {
 	.tp_repr	= (reprfunc)pyrf_mmap_event__repr,
 };
 
+static const char pyrf_mmap2_event__doc[] = PyDoc_STR("perf mmap2 event object.");
+
+static PyMemberDef pyrf_mmap2_event__members[] = {
+	sample_members
+	member_def(perf_event_header, type, T_UINT, "event type"),
+	member_def(perf_event_header, misc, T_UINT, "event misc"),
+	member_def(perf_record_mmap2, pid, T_UINT, "event pid"),
+	member_def(perf_record_mmap2, tid, T_UINT, "event tid"),
+	member_def(perf_record_mmap2, start, T_ULONGLONG, "start of the map"),
+	member_def(perf_record_mmap2, len, T_ULONGLONG, "map length"),
+	member_def(perf_record_mmap2, pgoff, T_ULONGLONG, "page offset"),
+	member_def(perf_record_mmap2, prot, T_UINT, "protection"),
+	member_def(perf_record_mmap2, flags, T_UINT, "flags"),
+	member_def(perf_record_mmap2, filename, T_STRING_INPLACE, "backing store"),
+	{ .name = NULL, },
+};
+
+static PyObject *pyrf_mmap2_event__repr(const struct pyrf_event *pevent)
+{
+	PyObject *ret;
+	char *s;
+
+	if (asprintf(&s, "{ type: mmap2, pid: %u, tid: %u, start: %#" PRI_lx64 ", "
+			 "length: %#" PRI_lx64 ", offset: %#" PRI_lx64 ", "
+			 "flags: %#x, prot: %#x, filename: %s }",
+		     pevent->event.mmap2.pid, pevent->event.mmap2.tid,
+		     pevent->event.mmap2.start, pevent->event.mmap2.len,
+		     pevent->event.mmap2.pgoff, pevent->event.mmap2.flags,
+		     pevent->event.mmap2.prot, pevent->event.mmap2.filename) < 0)
+		return PyErr_NoMemory();
+
+	ret = PyUnicode_FromString(s);
+	free(s);
+	return ret;
+}
+
+static PyTypeObject pyrf_mmap2_event__type = {
+	PyVarObject_HEAD_INIT(NULL, 0)
+	.tp_name	= "perf.mmap2_event",
+	.tp_basicsize	= sizeof(struct pyrf_event),
+	.tp_dealloc	= (destructor)pyrf_event__delete,
+	.tp_flags	= Py_TPFLAGS_DEFAULT|Py_TPFLAGS_BASETYPE,
+	.tp_doc		= pyrf_mmap2_event__doc,
+	.tp_members	= pyrf_mmap2_event__members,
+	.tp_getset	= pyrf_event__getset,
+	.tp_repr	= (reprfunc)pyrf_mmap2_event__repr,
+};
+
 static const char pyrf_task_event__doc[] = PyDoc_STR("perf task (fork/exit) event object.");
 
 static PyMemberDef pyrf_task_event__members[] = {
@@ -776,6 +824,9 @@ static int pyrf_event__setup_types(void)
 	int err;
 
 	err = PyType_Ready(&pyrf_mmap_event__type);
+	if (err < 0)
+		goto out;
+	err = PyType_Ready(&pyrf_mmap2_event__type);
 	if (err < 0)
 		goto out;
 	err = PyType_Ready(&pyrf_lost_event__type);
@@ -805,6 +856,7 @@ static int pyrf_event__setup_types(void)
 
 static PyTypeObject *pyrf_event__type[] = {
 	[PERF_RECORD_MMAP]	 = &pyrf_mmap_event__type,
+	[PERF_RECORD_MMAP2]	 = &pyrf_mmap2_event__type,
 	[PERF_RECORD_LOST]	 = &pyrf_lost_event__type,
 	[PERF_RECORD_COMM]	 = &pyrf_comm_event__type,
 	[PERF_RECORD_EXIT]	 = &pyrf_task_event__type,
@@ -971,6 +1023,11 @@ static PyObject *pyrf_event__new(const union perf_event *event, struct evsel *ev
 		size_t max_len = pevent->event.header.size - offsetof(struct perf_record_mmap, filename);
 
 		pevent->event.mmap.filename[max_len - 1] = '\0';
+	} else if (event->header.type == PERF_RECORD_MMAP2) {
+		/* Ensure '\0' string termination. */
+		size_t max_len = pevent->event.header.size - offsetof(struct perf_record_mmap2, filename);
+
+		pevent->event.mmap2.filename[max_len - 1] = '\0';
 	}
 
 	perf_sample__init(&pevent->sample, /*all=*/true);
@@ -3234,6 +3291,9 @@ PyMODINIT_FUNC PyInit_perf(void)
 	Py_INCREF(&pyrf_mmap_event__type);
 	PyModule_AddObject(module, "mmap_event", (PyObject *)&pyrf_mmap_event__type);
 
+	Py_INCREF(&pyrf_mmap2_event__type);
+	PyModule_AddObject(module, "mmap2_event", (PyObject *)&pyrf_mmap2_event__type);
+
 	Py_INCREF(&pyrf_lost_event__type);
 	PyModule_AddObject(module, "lost_event", (PyObject *)&pyrf_lost_event__type);
 
-- 
2.54.0.545.g6539524ca2-goog


