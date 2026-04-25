Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EDEBFF885C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Apr 2026 17:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fm4BzhaiNoNEhqaEIRecziDxpgSmNxYS1qVSWQUr3vA=; b=nhq2tCFFCcLjXLvw2nmDWaK5yb
	k5fSmbqVZuTjhc0EeobpBroZ+qVfXmTmz8E1sFuskpt88km+GMI0lJ+Ki7P812eSCGs7tUzXARYwC
	4heKLrBHdd2y6XWE79FNA5ChUflO7yQPAGdt1KqsJiyCguHOnA5Kx5Ds+mm9UeV2cV3uZmvwJzoQb
	IV++Awu+nE0Ymf4Q/79k6RaHjEdWYLqIyib5wOAE6W83NNhcKGXdEu6ZHhbNy4aRJqOlFZTlVRtn0
	HsDgzTLlgFKA3kTz4eho8V1Zl76ddyAlhEvcSyI/F4irVSPCxhHK5sHmggE1lkDbEAHGce66wVvNA
	I0LIY5TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGh8a-0000000Ecpp-1JPe;
	Sat, 25 Apr 2026 17:49:52 +0000
Received: from mail-dy1-x1349.google.com ([2607:f8b0:4864:20::1349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGh8I-0000000EcSc-0dP9
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Apr 2026 17:49:35 +0000
Received: by mail-dy1-x1349.google.com with SMTP id 5a478bee46e88-2bda35eab74so7643196eec.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Apr 2026 10:49:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777139373; x=1777744173; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Fm4BzhaiNoNEhqaEIRecziDxpgSmNxYS1qVSWQUr3vA=;
        b=Z15Pk9yw95M9yK2+VwarHvUk/VUJIxRUFZCIBI+iUhfJQLfrNQF1HWGX55peVdMMUs
         /RvHxotySFi5q4BByLBH1mf0w0lm7xmXVarrnkGCxZwOYmvukCkYWT13Att7hQwfwwLF
         ORXPp79jxrRiPysoAHpgxw7QLGdtSeAyHqKra8IbTfr3qDulEcSd1px2fsVU3sc1vMsc
         HNOjqi3y6sK08A0NGv0iXZ85Aml2TycseZAojcPGJQHGEEIh2sgl+6QKFVSzF7xgDWF2
         tD2oMVm78XKtjh6iCKNFZtzsbZa+V2MU64E/imiAN8SzXW4MKQ/VLUHuDDtwdENpnZqL
         9ejQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777139373; x=1777744173;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Fm4BzhaiNoNEhqaEIRecziDxpgSmNxYS1qVSWQUr3vA=;
        b=PDJGJlWpaO3b172DbIqWT5cj28+Ai1ZH/+VpIb8Z1BMwMtA7ux/cpU4u8Mwu7WX5J4
         jDKGapQ9k5Ljc+R0nCV+ZlfYW3EEybKvvz7eJZZc66wiVV6uI1Au7oQn17Lt+mZpmPCg
         fsWPjAsCJX7ba9SKkCf2Q6P8GAQFGCXErFNvK6wy12iXDWu94NTwUTC+mz/ilBEyElsW
         V3i7lxEu/scLWngU5RENqIYKw7HksoWYlM4SovUG3aTBCGijfCOjTaXx7+MsvKRbLQfI
         e3E53W3+fTUt9eu0WusEvoJuIw4bbFaPVc/Omc1FGQqmjDQlGiL6E8Maoxth5GwmdbYq
         ctuw==
X-Forwarded-Encrypted: i=1; AFNElJ9esdWmTgubYCLjBgWWOh4fvwjwUUXGrxB2QQ+9EyHAXe9odpy8jfLPsyl7TWxIGTPMzNHyjNFJ3aG+E7sJVAN0@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8KxErN6LgSvRaL4xa+WWhWcZnnAU4eDh/X0ohLKq9+5UoHwJN
	WC8VR/jMJLhypG7v1FFhE/Jg61lPtfVymmiBfPgNKLm2GdIX5QAqy3Jtfvq4EB0dtJDpoKOwdye
	F5qbQT+TUng==
X-Received: from dybta16.prod.google.com ([2002:a05:7301:6f10:b0:2d8:9b3:87f2])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:ec07:b0:2d8:4dee:6ad0
 with SMTP id 5a478bee46e88-2e42e20295amr14273592eec.16.1777139372620; Sat, 25
 Apr 2026 10:49:32 -0700 (PDT)
Date: Sat, 25 Apr 2026 10:48:14 -0700
In-Reply-To: <20260425174858.3922152-1-irogers@google.com>
Mime-Version: 1.0
References: <20260424164721.2229025-1-irogers@google.com> <20260425174858.3922152-1-irogers@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260425174858.3922152-17-irogers@google.com>
Subject: [PATCH v6 16/59] perf python: Add syscall name/id to convert syscall
 number and name
From: Ian Rogers <irogers@google.com>
To: acme@kernel.org, adrian.hunter@intel.com, james.clark@linaro.org, 
	leo.yan@linux.dev, namhyung@kernel.org, tmricht@linux.ibm.com
Cc: alice.mei.rogers@gmail.com, dapeng1.mi@linux.intel.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, mingo@redhat.com, peterz@infradead.org, 
	Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260425_104934_203034_35B36EC3 
X-CRM114-Status: GOOD (  14.47  )
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
---
 tools/perf/util/python.c | 48 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/tools/perf/util/python.c b/tools/perf/util/python.c
index d10359abd1ea..a10c4a292756 100644
--- a/tools/perf/util/python.c
+++ b/tools/perf/util/python.c
@@ -13,6 +13,7 @@
 #include "counts.h"
 #include "data.h"
 #include "debug.h"
+#include "dwarf-regs.h"
 #include "event.h"
 #include "evlist.h"
 #include "evsel.h"
@@ -25,6 +26,7 @@
 #include "session.h"
 #include "strbuf.h"
 #include "symbol.h"
+#include "syscalltbl.h"
 #include "thread.h"
 #include "thread_map.h"
 #include "tool.h"
@@ -2635,6 +2637,40 @@ static int pyrf_session__setup_types(void)
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
@@ -2668,6 +2704,18 @@ static PyMethodDef perf__methods[] = {
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


