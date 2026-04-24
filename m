Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62631FED3F0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 16:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wM2h5mdu5BIohf7YOf7SjkCuYCdrfaX5/l3G92wMaFw=; b=MI+gDfZ634FSL6LFKLbdsrudqc
	r64Tghw+ekJQQery7RehwYCvnkjtfRgbzS7NBQeCNyDv1qYhs4nwrCtG5P68MkuEwr3AfDxgSjlHx
	bwLVYssp3yRHsbhrbXTG87Yo9SD8gXQIeXm1geAPwM1chQQwMon1NxQw6tTBCQmGDeOVVEyKGe28q
	TYTGeUAPTtvl5hOSjx3K37vTyOYoOlHcQg9n77KTny06fAC5Ym6dwekoX8DaPSzxrLy8Gme+uJObC
	CPHH5SLAVZ95UZU9aW7tqAPsrZrFW/WF5rzcsk8GygwG+myTXgUU26e4/Xqae66cccbIOg5yM3KXq
	iHLj8w/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGJhn-0000000DTvH-2lQy;
	Fri, 24 Apr 2026 16:48:39 +0000
Received: from mail-dy1-x134a.google.com ([2607:f8b0:4864:20::134a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGJhR-0000000DTZD-00Ab
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Apr 2026 16:48:20 +0000
Received: by mail-dy1-x134a.google.com with SMTP id 5a478bee46e88-2ddd8ef5343so7784496eec.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Apr 2026 09:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777049295; x=1777654095; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=wM2h5mdu5BIohf7YOf7SjkCuYCdrfaX5/l3G92wMaFw=;
        b=KkGuhZB6jwbUUeSNq2HBhthbaEPF1ET5E8F7g6kikAPnnU05PVtzrF03p4kpy8lN7p
         R8PNA9e7eg6AcMv2gnvl3QgbCLLDMK08Frph6Phj0Yzu4iA6frIvDtoJSgSFbsTvwdYx
         UutKcQLio+j4Y0UZdPqBE72sq2LnUQ4fMts2g8YivnZUaz17E8fn/+njHcZYMPIq6jFi
         nV82/x+pZaP+C6ux3TM3/P82o7OAZXgHXZAvlKO5rmvuTBVZKVNS9I4lHpnzPn/hhbnl
         Uc4o4A5NtBc/DO5kcTOYr+TrLZOyMYGdIScFlm3E5ISzBbOmVTLCNTpQL/wr0MkEJPdU
         troQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777049295; x=1777654095;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wM2h5mdu5BIohf7YOf7SjkCuYCdrfaX5/l3G92wMaFw=;
        b=i3YlxjV8NMgKA2ZCN/m0xZeRWaXH3LWQ9+Ds20lDLObDFcXSFh16MbnJcUsa5B5k5d
         QAsYVJFraWOo81uOyxkao4Y/seJ0Kx5LMYaxtPfmYls8lSXG5u0l6pLILYqBI4GKUN+Q
         GoCp2kNjXsjLiSKP/6947rAkxHh+J9ngBXVZicaDN/Py6c46LYwNqF++4E4hFscg2I6R
         WKtxLtJmYNBdw6UP0SjHOEm13PR+Xw96Ht1hobtRa/RxFwDDZxeKdVDHfJ5ZeoLkE9QO
         mTWbBLJfiU4ynrtL2b5gpgss/f8FCOOyir4r4bK8BLxlqOahMP9VH+c6txcgqO2/VdOh
         U/oQ==
X-Forwarded-Encrypted: i=1; AFNElJ/Ww1QGVOadg79bKtfgsV+U/XlFsHVwkXw/h6XfM2U+nSmdhS7UMUYBTrcTfl+V9vXCcW0yUxnjT703aDNx7LgM@lists.infradead.org
X-Gm-Message-State: AOJu0YxfWUOcOr3JE5143FRvDNt46j0QBxTHy38HythgnO1CG5o35+JH
	D/BK6R2UkZUA65ZADNtB20J6bfGc1+CeJuLkV2HqwYNa+ww3I1JubWMsJS/yVc2DaIjKeno4Ea4
	cLZUhB6LgdQ==
X-Received: from dybkz15.prod.google.com ([2002:a05:7301:1a0f:b0:2d9:cb4f:864d])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:641b:b0:2d1:d434:d022
 with SMTP id 5a478bee46e88-2e4521f9d92mr17381630eec.0.1777049294293; Fri, 24
 Apr 2026 09:48:14 -0700 (PDT)
Date: Fri, 24 Apr 2026 09:46:36 -0700
In-Reply-To: <20260424164721.2229025-1-irogers@google.com>
Mime-Version: 1.0
References: <20260423163406.1779809-1-irogers@google.com> <20260424164721.2229025-1-irogers@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260424164721.2229025-15-irogers@google.com>
Subject: [PATCH v5 14/58] perf python: Add wrapper for perf_data file abstraction
From: Ian Rogers <irogers@google.com>
To: acme@kernel.org, adrian.hunter@intel.com, james.clark@linaro.org, 
	leo.yan@linux.dev, namhyung@kernel.org, tmricht@linux.ibm.com
Cc: alice.mei.rogers@gmail.com, dapeng1.mi@linux.intel.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, mingo@redhat.com, peterz@infradead.org, 
	Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_094818_522002_3EF8729C 
X-CRM114-Status: GOOD (  18.03  )
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
---
 tools/perf/util/python.c | 93 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 92 insertions(+), 1 deletion(-)

diff --git a/tools/perf/util/python.c b/tools/perf/util/python.c
index 0424290f8b77..a2cdd92e0548 100644
--- a/tools/perf/util/python.c
+++ b/tools/perf/util/python.c
@@ -10,6 +10,7 @@
 
 #include "callchain.h"
 #include "counts.h"
+#include "data.h"
 #include "event.h"
 #include "evlist.h"
 #include "evsel.h"
@@ -2296,6 +2297,92 @@ static PyObject *pyrf__metrics(PyObject *self, PyObject *args)
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
+	pyrf_data__type.tp_new = PyType_GenericNew;
+	return PyType_Ready(&pyrf_data__type);
+}
+
 static PyMethodDef perf__methods[] = {
 	{
 		.ml_name  = "metrics",
@@ -2358,7 +2445,8 @@ PyMODINIT_FUNC PyInit_perf(void)
 	    pyrf_cpu_map__setup_types() < 0 ||
 	    pyrf_pmu_iterator__setup_types() < 0 ||
 	    pyrf_pmu__setup_types() < 0 ||
-	    pyrf_counts_values__setup_types() < 0)
+	    pyrf_counts_values__setup_types() < 0 ||
+	    pyrf_data__setup_types() < 0)
 		return module;
 
 	/* The page_size is placed in util object. */
@@ -2406,6 +2494,9 @@ PyMODINIT_FUNC PyInit_perf(void)
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


