Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EACC5FF885C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Apr 2026 22:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9169CYggYX8a+HEsC3bSJNy6IomTsX+Hp0FHeVzozsY=; b=wOQi1QhFyoqoroOgSKb+AiRUqQ
	2fR6kaBsTg/gxowuhbQi0QUfnpnkRDc9+LHrnaM/n5xP2VssHRUlLQRFDr3geU+NLuMk7Vndqgb6N
	w0toSr4yalOWtwuGpH1OkLNhmhfJFWHJ1Qgrlr7F06gss7niv0w3G7TTRJtSrEu/vWOurpTRIIP7f
	Zix8z8ZHu5CUaECgXnZzJ46j5h3/faGgmuWO8PJPLR1OGfJrWKs7trovzn8OCa0t9Td1DaMWkdyaa
	APqSNjODDvHZzyJNxccguj9yD7bGGA5AUGOOPY++ZcRRl7SPgBtROfXp9BOu4mUsRo9JmmGn27iM5
	0VwfOtvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGlhY-0000000EtKi-2Wgz;
	Sat, 25 Apr 2026 22:42:16 +0000
Received: from mail-dy1-x1349.google.com ([2607:f8b0:4864:20::1349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGlhJ-0000000Et1A-1Ggm
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Apr 2026 22:42:02 +0000
Received: by mail-dy1-x1349.google.com with SMTP id 5a478bee46e88-2e60238adb1so21608891eec.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Apr 2026 15:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777156920; x=1777761720; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=9169CYggYX8a+HEsC3bSJNy6IomTsX+Hp0FHeVzozsY=;
        b=SHCI2Ovux3byuASEVphWlfGivMrFjBudAs+5Fh4xZmYIuRHO9jtZL20USome/YVAHz
         KQnB5KqFjFZVOc0P9U3hEzdDrNaxW+D++5qoy+ZLOMX/+bZIpGt/RzgDAHWlHpUQ0Cq3
         cDnrsnCPbF2BPgVBQJnKPbLPg4y2hWVklUeaPL8zSpuwdI6W7661+d5SZyjKa02ly7cD
         wvQ3lvWud2oy/Zy9+qgST0LRxXfcehVEMEINwhDephowsOm5FVqf7rQTdxFh4LxLkWSD
         5j3BV3qk8nsGL4E7b9UHzSK5tKah6TnW+CdQE5lKl+gZlNU/1L6DVmsBbgwMI/+uWyOl
         DGBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777156920; x=1777761720;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9169CYggYX8a+HEsC3bSJNy6IomTsX+Hp0FHeVzozsY=;
        b=NB0ji1zYA0yh2/RZcpobn6SlGV+ytwzCErsc2TSqO+azosr8PTyVTgx+fKmWV3pugq
         AFxKK9HY5m2+AxFeLfnDwYtuwIYmugyHQztTByLwClS35HhjCaxzNoRlsSvDEFyCkgnO
         uKqZ7EzbKV4ieSKxkffTFxgsmpGZoE1WGiPSpWylLTHakpFvoZOsmPmzuDqPjyaaEaz4
         Ix1V52OSnnkiZt2qYNwszKxFE0psLzTu8f2ISN1kZ9gqZytcV/X9OmQJmOkBdDCc/BpY
         gcDkA65/MRAe6OO2zXqo/iBtXQ0WGnuHzp4cknVNgiwH4hY9J75JVnj+TmlME9+yBnV3
         VLEg==
X-Forwarded-Encrypted: i=1; AFNElJ+e3oRaHvKKltPSUXCqM0HrzuKJtcaGJinB2ysN4xkmsWzhEkI5+yyQ2kLmooI1nJSZlQNOMZNa8BFgfoFf+ePb@lists.infradead.org
X-Gm-Message-State: AOJu0Ywtpp7iaKTxnOqVKFJKlLU2g1M/I1SLiqNWXjLRkjY+n63ifGUy
	bqeCHLYCRrHPASxn7tFaAy5ywy0Lekt3144yPuc7IMmJj+I535e+iAPEX2Jq+IZz60428YWs7TB
	apAygSpuXYg==
X-Received: from dybkz15.prod.google.com ([2002:a05:7301:1a0f:b0:2d9:cb4f:864d])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:3d17:b0:2dd:405f:89b3
 with SMTP id 5a478bee46e88-2e4528ce85cmr21073178eec.0.1777156919870; Sat, 25
 Apr 2026 15:41:59 -0700 (PDT)
Date: Sat, 25 Apr 2026 15:40:39 -0700
In-Reply-To: <20260425224125.160890-1-irogers@google.com>
Mime-Version: 1.0
References: <20260425174858.3922152-1-irogers@google.com> <20260425224125.160890-1-irogers@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260425224125.160890-15-irogers@google.com>
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
X-CRM114-CacheID: sfid-20260425_154201_360752_242697FB 
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


