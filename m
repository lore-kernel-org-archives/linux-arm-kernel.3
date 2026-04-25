Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29FD0FF885A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Apr 2026 22:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9169CYggYX8a+HEsC3bSJNy6IomTsX+Hp0FHeVzozsY=; b=IOkVLasxfER0xUGTDnAx0D1f9H
	JI6MQGMvyGoMtaZxHCeJEr8nuu1hQroxzolRtk497cXXqgGuMg0cfgd0wDEimp/jlwGijE+mKESes
	X2TTg3bh1fU9OofJIedCPmF9meJmMGii6bOjOFPots4wv9Nl9qN6+0WQ/tZPvLqKMCEEWB1XadgFv
	vtw7EnzH3fDU5a68zumboPc/ycYfj72KazZHna5bZnR0b5jafBf1bTiIpZqbb8Rtb9PB0CkHYHB1e
	SeHWkMAtyDinKF8enwfYVRIrSvBtu8/XxLTXMayXvEnXfrzB/Qlgaw7qK+nUPO4EEQTPqhCXe8O2j
	pEMgT3ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGlps-0000000EyQE-34Nk;
	Sat, 25 Apr 2026 22:50:52 +0000
Received: from mail-dl1-x1249.google.com ([2607:f8b0:4864:20::1249])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGlpj-0000000EyFT-28EX
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Apr 2026 22:50:49 +0000
Received: by mail-dl1-x1249.google.com with SMTP id a92af1059eb24-126e8ee6227so9132353c88.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Apr 2026 15:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777157442; x=1777762242; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=9169CYggYX8a+HEsC3bSJNy6IomTsX+Hp0FHeVzozsY=;
        b=vqM2LKNrZ6/3XYRmLJ3ECznxCAAr2lIgCVyfR+WLVM+59DbMIC+6PxaojgSjgeis2v
         L1bxW31ClTeS8B9zxVLeVsIV/27HsMsDmVIh7435pidmse0D3fycvOeW1GPNeMzn/wqk
         WRr/gwhNkCWhF/2FFSBJJq8rbUZ/rEh2fa1mnohy1F8NBYOxLpw1ItMltTtNNwwySk5h
         GgOrte4TfTK0ynv59HhuMWuWtUb2zZvu8bfeRsrIQkcj2fUey6S2/gR9iCE5A94ORBKQ
         jcQL8PyfgwPSIDZwnkOtzn2CtYfGMr0gREC7081NTc8gQmCQm7dP74FRp5Pa/KWEK/wj
         QrzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777157442; x=1777762242;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9169CYggYX8a+HEsC3bSJNy6IomTsX+Hp0FHeVzozsY=;
        b=o+45YzPPDm/IEVYG3/a5tpKs4j4ZKZnybOJw79+gx19I8muWmgSQjI8F6iKKmBPqHj
         ap2XRHMao8Jzm3+BaRRfd9zczYntv2IBcWBufHD4OSM2UgoH5GAVqqQCFUCdV9y9IESD
         kUSWCNg84dBCx2j+e8J2ONQLen79MYVD6Emy5jGSNtLhk+0QJDloDPh/+aTQ6xYbKna3
         1WOCovb938vRMyFg4LixmNqpr6n6ue4Wk4+kbB1/GSJAl7HLjxfYSr/70yfdFWZ6Vp/o
         irf0Jeoruzeal0SUqRJzFEx3cv4RZ8JviS6W/alr9ICQO25tLq7iO/VbFHlUqQjHIE2S
         ih1g==
X-Forwarded-Encrypted: i=1; AFNElJ8Nzl6FQaxlicGc7ELfE5ggXG07ExJVxvFaCNuOHooX26K6lWprvSS9t1tpk2VMdlzbZl0xPNZr3cj+6nJMHwaD@lists.infradead.org
X-Gm-Message-State: AOJu0YyLO5Js90FFwtliFDngHCTrReiXVWKZzO+J+qmpb3as59w/5Rm3
	KEuzARSaP4ivZDAM7PSrBKe4ynkea+dyKaYQHqVn7eLO7R280JP0LbEXJuk6mnnXjpc+DoD2tU9
	tjpD74assmQ==
X-Received: from dlbto5.prod.google.com ([2002:a05:7022:3b05:b0:12c:1f83:7b4c])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:3d87:b0:12a:85ef:1e50
 with SMTP id a92af1059eb24-12c73f6c614mr20784618c88.12.1777157442219; Sat, 25
 Apr 2026 15:50:42 -0700 (PDT)
Date: Sat, 25 Apr 2026 15:49:06 -0700
In-Reply-To: <20260425224951.174663-1-irogers@google.com>
Mime-Version: 1.0
References: <20260425174858.3922152-1-irogers@google.com> <20260425224951.174663-1-irogers@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260425224951.174663-15-irogers@google.com>
Subject: [PATCH v7 14/59] perf python: Add wrapper for perf_data file abstraction
From: Ian Rogers <irogers@google.com>
To: acme@kernel.org, adrian.hunter@intel.com, james.clark@linaro.org, 
	leo.yan@linux.dev, namhyung@kernel.org, tmricht@linux.ibm.com
Cc: alice.mei.rogers@gmail.com, dapeng1.mi@linux.intel.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, mingo@redhat.com, peterz@infradead.org, 
	Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260425_155043_601453_C81DB88F 
X-CRM114-Status: GOOD (  18.93  )
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

The perf_data struct is needed for session supported.

Assisted-by: Gemini:gemini-3.1-pro-preview
Signed-off-by: Ian Rogers <irogers@google.com>
---
v2:
1. Fixed Memory & FD Leaks in pyrf_data__init : Added cleanup of old
   state (closing file and freeing path) if __init__ is called
   multiple times on the same object.

2. Fixed Invalid Free in pyrf_data__delete : Ensured pdata->data.path
   is always dynamically allocated via strdup() , even for the default
   "perf.data" . This avoids passing a static string literal to free().

3. Fixed NULL Pointer Dereference in pyrf_data__str : Added a check
   for NULL path to prevent segfaults if str() or repr() is called on
   an uninitialized object.

4. Guarded fd Argument Usage: Added a check to ensure that if an fd is
   provided, it corresponds to a pipe, failing gracefully with a
   ValueError otherwise.

v7:
- Added pyrf_data__new to zero-initialize pdata->data to fix
  crash on re-initialization.
---
 tools/perf/util/python.c | 103 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 102 insertions(+), 1 deletion(-)

diff --git a/tools/perf/util/python.c b/tools/perf/util/python.c
index 2ba3556c4f16..aa63c7ffe822 100644
--- a/tools/perf/util/python.c
+++ b/tools/perf/util/python.c
@@ -10,6 +10,7 @@
 
 #include "callchain.h"
 #include "counts.h"
+#include "data.h"
 #include "event.h"
 #include "evlist.h"
 #include "evsel.h"
@@ -2316,6 +2317,102 @@ static PyObject *pyrf__metrics(PyObject *self, PyObject *args)
 	return list;
 }
 
+struct pyrf_data {
+	PyObject_HEAD
+
+	struct perf_data data;
+};
+
+static int pyrf_data__init(struct pyrf_data *pdata, PyObject *args, PyObject *kwargs)
+{
+	static char *kwlist[] = { "path", "fd", NULL };
+	char *path = NULL;
+	int fd = -1;
+
+	if (!PyArg_ParseTupleAndKeywords(args, kwargs, "|si", kwlist, &path, &fd))
+		return -1;
+
+	if (pdata->data.open)
+		perf_data__close(&pdata->data);
+	free((char *)pdata->data.path);
+
+	if (!path)
+		path = "perf.data";
+
+	pdata->data.path = strdup(path);
+	if (!pdata->data.path) {
+		PyErr_NoMemory();
+		return -1;
+	}
+
+	if (fd != -1) {
+		struct stat st;
+
+		if (fstat(fd, &st) < 0 || !S_ISFIFO(st.st_mode)) {
+			PyErr_SetString(PyExc_ValueError,
+					"fd argument is only supported for pipes");
+			free((char *)pdata->data.path);
+			pdata->data.path = NULL;
+			return -1;
+		}
+	}
+
+	pdata->data.mode = PERF_DATA_MODE_READ;
+	pdata->data.file.fd = fd;
+	if (perf_data__open(&pdata->data) < 0) {
+		PyErr_Format(PyExc_IOError, "Failed to open perf data: %s",
+			     pdata->data.path ? pdata->data.path : "perf.data");
+		return -1;
+	}
+	return 0;
+}
+
+static void pyrf_data__delete(struct pyrf_data *pdata)
+{
+	perf_data__close(&pdata->data);
+	free((char *)pdata->data.path);
+	Py_TYPE(pdata)->tp_free((PyObject *)pdata);
+}
+
+static PyObject *pyrf_data__str(PyObject *self)
+{
+	const struct pyrf_data *pdata = (const struct pyrf_data *)self;
+
+	if (!pdata->data.path)
+		return PyUnicode_FromString("[uninitialized]");
+	return PyUnicode_FromString(pdata->data.path);
+}
+
+static PyObject *pyrf_data__new(PyTypeObject *type, PyObject *args, PyObject *kwargs)
+{
+	struct pyrf_data *pdata;
+
+	pdata = (struct pyrf_data *)PyType_GenericNew(type, args, kwargs);
+	if (pdata)
+		memset(&pdata->data, 0, sizeof(pdata->data));
+	return (PyObject *)pdata;
+}
+
+static const char pyrf_data__doc[] = PyDoc_STR("perf data file object.");
+
+static PyTypeObject pyrf_data__type = {
+	PyVarObject_HEAD_INIT(NULL, 0)
+	.tp_name	= "perf.data",
+	.tp_basicsize	= sizeof(struct pyrf_data),
+	.tp_dealloc	= (destructor)pyrf_data__delete,
+	.tp_flags	= Py_TPFLAGS_DEFAULT|Py_TPFLAGS_BASETYPE,
+	.tp_doc		= pyrf_data__doc,
+	.tp_init	= (initproc)pyrf_data__init,
+	.tp_repr	= pyrf_data__str,
+	.tp_str		= pyrf_data__str,
+};
+
+static int pyrf_data__setup_types(void)
+{
+	pyrf_data__type.tp_new = pyrf_data__new;
+	return PyType_Ready(&pyrf_data__type);
+}
+
 static PyMethodDef perf__methods[] = {
 	{
 		.ml_name  = "metrics",
@@ -2378,7 +2475,8 @@ PyMODINIT_FUNC PyInit_perf(void)
 	    pyrf_cpu_map__setup_types() < 0 ||
 	    pyrf_pmu_iterator__setup_types() < 0 ||
 	    pyrf_pmu__setup_types() < 0 ||
-	    pyrf_counts_values__setup_types() < 0)
+	    pyrf_counts_values__setup_types() < 0 ||
+	    pyrf_data__setup_types() < 0)
 		return module;
 
 	/* The page_size is placed in util object. */
@@ -2426,6 +2524,9 @@ PyMODINIT_FUNC PyInit_perf(void)
 	Py_INCREF(&pyrf_counts_values__type);
 	PyModule_AddObject(module, "counts_values", (PyObject *)&pyrf_counts_values__type);
 
+	Py_INCREF(&pyrf_data__type);
+	PyModule_AddObject(module, "data", (PyObject *)&pyrf_data__type);
+
 	dict = PyModule_GetDict(module);
 	if (dict == NULL)
 		goto error;
-- 
2.54.0.545.g6539524ca2-goog


