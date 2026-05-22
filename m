Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6CF5CD5BB0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 23:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jM4bdTdLVv/rhBQCW1JN696MSnte4z484SiWq30EwPI=; b=Gf96M6h8+SANbnBmz1m+dWgw58
	iWNkY4kLrzwhVgQUuCGUJTBYlFNox0y1Df0A6H/k48QirtALu7JNMhvhIKzHWLu6yMn0rB32RDaDF
	ttCCAvBvLuQePID+OaU6zbcMgq1YTOR4UPnGWD5AECC+lb1uA7MOnxtcm/8hT8u2CeJRYYTSnv8m0
	GWSgy3xAFY0wl6ALgHGHSdnTFZz9J+pynMLJN2bvavAfbVefafxqJbF/4Xc6xp+dBl/2c79LDTIqT
	7U+qxTL27q5rtYpsXEqkc80NR4PoizsH0kT18t22nUmOChJzNJpuYXYTT2Tpsd/LAL24CK17FH2Kw
	D2Yd1lzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQXzy-0000000C3Pn-45vB;
	Fri, 22 May 2026 22:05:42 +0000
Received: from mail-dy1-x134a.google.com ([2607:f8b0:4864:20::134a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQXzj-0000000C35D-1UWm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 22:05:28 +0000
Received: by mail-dy1-x134a.google.com with SMTP id 5a478bee46e88-3041c65a30bso3484939eec.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 15:05:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779487526; x=1780092326; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=jM4bdTdLVv/rhBQCW1JN696MSnte4z484SiWq30EwPI=;
        b=vpN9lMwgQCdbWd9XygRuGq66izOQYnQOwFIByFptOBlehuO9z7Rw5MhVz5y5OGt7U5
         j6D5g3EnHdQkX03i7AVTjSMfbPT3Z4LMtDYD/y1uAzCUWdtvFldl1fZBPwAZrhsAa0vR
         unHhhNJFo+Y17ZxZVC56r2uoofTtXO2uC0XQAl8Z/NGL3MorFO4su7H9dTuk8VDzZ9lg
         2O7CSpLvkjugNB9JpsMfYFti1/Yr76dZgJQO/p6WtngKaw4VTs0e+s/rBr4gwhh+pWRx
         bgIxTngtUtqvh+0aMU05Y6wfNHXrNxu3EIjuycAmHhm8rb8Utl+IwXZ351D3tVx3qGXq
         /AXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779487526; x=1780092326;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jM4bdTdLVv/rhBQCW1JN696MSnte4z484SiWq30EwPI=;
        b=lwv2Wq9gjWGe3xTMYwNolHwvT+XZcE6CEM8Yz40Ml3KtNPXDpzSCuV7FSwD2bfygD4
         Ho5hiDVpoIrjazxd+SMPqgGMxbOCEV4gDV5dLc5h1kPAU9r3CRVyIN1ku9PB7bd5sgSZ
         Q4cpY/YKjRtf4E8k9xEhTY2DO6bBlnxTudgx7Ss4ClpP6HVGmhE4Reniy97XXM3P+/cD
         E0rW2QdwDXzA5JOYJb0ovXM5nEDAlaaE5pIEpCyeZCYMR6gHFXKtmdSnXmvl+hoKD0pp
         KulpgUIN7wuzJ0rPWWTlqYz/O82D1YbSIBKI8E94JtV0SV991e6/J49jq81EcxDg6vfq
         hlBw==
X-Forwarded-Encrypted: i=1; AFNElJ85nax8Pw58cgYAijWj+lv6e9NgQvzurPOuNOSbGy9M4Dzo1FqN1pzMY8k8ky916KXf6ET9kDoWBC0H6CPqCPGd@lists.infradead.org
X-Gm-Message-State: AOJu0Yyi055HvQpoApMe9X9cmnAKS1WJvoyy70IbzaFkPlu1VkY2fuQz
	cPFjoKFj8htjcUanHbjP/jnn+86m33pizs3O+aCGb8O1xLnGA6gk5VQXsZYdVE5S3C7tEi80C+u
	UYsJw/ItxYA==
X-Received: from dycac4.prod.google.com ([2002:a05:7301:5504:b0:2f9:af7:5047])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:7fa6:b0:2ea:edc0:4fbe
 with SMTP id 5a478bee46e88-30449095631mr3131034eec.14.1779487526120; Fri, 22
 May 2026 15:05:26 -0700 (PDT)
Date: Fri, 22 May 2026 15:04:31 -0700
In-Reply-To: <20260522220435.2378363-1-irogers@google.com>
Mime-Version: 1.0
References: <20260428071903.1886173-1-irogers@google.com> <20260522220435.2378363-1-irogers@google.com>
X-Mailer: git-send-email 2.54.0.794.g4f17f83d09-goog
Message-ID: <20260522220435.2378363-21-irogers@google.com>
Subject: [PATCH v9 20/23] perf python: Add syscall name/id to convert syscall
 number and name
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, namhyung@kernel.org
Cc: adrian.hunter@intel.com, alice.mei.rogers@gmail.com, 
	dapeng1.mi@linux.intel.com, james.clark@linaro.org, leo.yan@linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, mingo@redhat.com, peterz@infradead.org, 
	tmricht@linux.ibm.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_150527_417668_11B51626 
X-CRM114-Status: GOOD (  16.92  )
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
 tools/perf/util/Build    |  1 -
 tools/perf/util/python.c | 48 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 48 insertions(+), 1 deletion(-)

diff --git a/tools/perf/util/Build b/tools/perf/util/Build
index 4bbc78b1f741..e37779f9dfe4 100644
--- a/tools/perf/util/Build
+++ b/tools/perf/util/Build
@@ -75,7 +75,6 @@ perf-util-y += sample.o
 perf-util-y += sample-raw.o
 perf-util-y += s390-sample-raw.o
 perf-util-y += amd-sample-raw.o
-
 perf-util-y += ordered-events.o
 perf-util-y += namespaces.o
 perf-util-y += comm.o
diff --git a/tools/perf/util/python.c b/tools/perf/util/python.c
index 218d772346e2..23eb65adb392 100644
--- a/tools/perf/util/python.c
+++ b/tools/perf/util/python.c
@@ -18,6 +18,7 @@
 #include "data.h"
 #include "debug.h"
 #include "dso.h"
+#include "dwarf-regs.h"
 #include "event.h"
 #include "branch.h"
 #include "evlist.h"
@@ -35,6 +36,7 @@
 #include "srcline.h"
 #include "strbuf.h"
 #include "symbol.h"
+#include "trace/beauty/syscalltbl.h"
 #include "thread.h"
 #include "thread_map.h"
 #include "tool.h"
@@ -3792,6 +3794,40 @@ static int pyrf_session__setup_types(void)
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
@@ -3825,6 +3861,18 @@ static PyMethodDef perf__methods[] = {
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
2.54.0.794.g4f17f83d09-goog


