Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4020FED3F1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 16:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TiCzqIIsCpDeADhoki4N8x1LD0SbRK3k+MFHddyXRA8=; b=rJlIXpiHw/vOz+/AmoAG75kqdE
	l354qNrJYwvPkkqOnxCwkNDAeUynodd/FuifSiSQQb0SiEHKmod7mS7tmAAPbtaKE4TZFxPye7pg+
	yke+HAR2ragF9n/W756ZfoMOc4GJK441vr4q2xr3ZFq+dbEuaTlyFACdhFroSIUdOi/UOgxOM8B+T
	b/TA8TUXxbugRZA5Cfmnc/inIdBChWVRo2j1vh03QPBkDjk3mAZM/CWARZYLaPPR4pE4kmFiQYPRL
	553vFyWcSd99BHPfE32Mwbk5THaE2at8jbfH6AbCROyz/vugl3lU5ykR3scAPpmSESB9cdvYRJTIY
	+8ZpuqXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGJho-0000000DTwP-36gy;
	Fri, 24 Apr 2026 16:48:40 +0000
Received: from mail-dy1-x1349.google.com ([2607:f8b0:4864:20::1349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGJhX-0000000DTdj-36hv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Apr 2026 16:48:28 +0000
Received: by mail-dy1-x1349.google.com with SMTP id 5a478bee46e88-2bda35eab74so7010909eec.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Apr 2026 09:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777049301; x=1777654101; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=TiCzqIIsCpDeADhoki4N8x1LD0SbRK3k+MFHddyXRA8=;
        b=jnCpMMzloH6eVRDxcjHcniOIawR+cPMfAcBpcnNycd5uR5SIfXK4tCjSFMnNLd8vpA
         Bs57zQ4I4uoz+jgQMNnJ7Z642I+v1t4fbdVOCUDEJUcBTImcLEYxf5OZ/eD7Ov3n5iTl
         ERPGUniZQwUixHYyjU8xAc3Jcsvr4A9xV+ZJPBPBrXWf1Qssxk9ahFsxceeAA8Q5Zqt4
         h2Chhh1YTNYpmG8AZwfcVurbk1xawncWY4JsjFW2CiKF+a51c1ShoIfyLi62CnpbR1oz
         8/DpXbyN6zbq37GqKVHL2y0XhcmXWKxovDZZmohoc25O17g/lJZY/E1r9+vK/opdfZHq
         1L8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777049301; x=1777654101;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TiCzqIIsCpDeADhoki4N8x1LD0SbRK3k+MFHddyXRA8=;
        b=LVTq8/NDUbrIcidN+Jc2vKdH/QkwSVf1x5Fl+tHHTns3ZRKilzOpBznIqg6mFojKpq
         wbdbPBWxvhnhaUCpphRnNFo3Jd2/EniKf8blJFBlp1+Vj0IaQxjzUxgL3eQDv5veNZdO
         0R1rl9uxf/fGQiW1rGjqUOGUuSb9JjZufF0aoaQPEu6ZHXtfWyeGjR1rGlmOo5+Qhoix
         wK8F8kXoaahsUE3RnBTszXqw5Eb70mcLMwPDikRrSnWtaEU7lQXsAUV7KuM7zQ4Ix73w
         33YnsiVsoR7jzWa+C04bwPj1tKPyZVIa7xCQzraC7YF6WzvUqCC6pM9eCoPykA5VTu22
         Mv+A==
X-Forwarded-Encrypted: i=1; AFNElJ8W6BaGitrCmjmouFf6d9I6p1hKDIGhdaIU93AKt+n3gCbQdKpacsixgtLVz8JFKRoY6wwE1xNEv5ZkMsCYrb8f@lists.infradead.org
X-Gm-Message-State: AOJu0YwletE4os4C83trRkWnE+5+KRVpYBwsWBo2iGAKWJuVzE4fB0/X
	5+W9R0gCp60d8IhPPBYyFe3yAFfXJ068pLFjyYoSEie+ORAVQiRXhKJJ36+83m7LntdYPrSNvLR
	3XydhjGNOzw==
X-Received: from dybbs6.prod.google.com ([2002:a05:7300:a206:b0:2df:75ae:2719])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:2e88:b0:2d9:6652:524b
 with SMTP id 5a478bee46e88-2e42e201f39mr11442254eec.17.1777049300798; Fri, 24
 Apr 2026 09:48:20 -0700 (PDT)
Date: Fri, 24 Apr 2026 09:46:38 -0700
In-Reply-To: <20260424164721.2229025-1-irogers@google.com>
Mime-Version: 1.0
References: <20260423163406.1779809-1-irogers@google.com> <20260424164721.2229025-1-irogers@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260424164721.2229025-17-irogers@google.com>
Subject: [PATCH v5 16/58] perf python: Add syscall name/id to convert syscall
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
X-CRM114-CacheID: sfid-20260424_094824_044537_7287FE80 
X-CRM114-Status: GOOD (  14.09  )
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
---
 tools/perf/util/python.c | 44 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/tools/perf/util/python.c b/tools/perf/util/python.c
index 35eda69a32e1..f240905e07d6 100644
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
@@ -2635,6 +2637,36 @@ static int pyrf_session__setup_types(void)
 	return PyType_Ready(&pyrf_session__type);
 }
 
+static PyObject *pyrf__syscall_name(PyObject *self, PyObject *args)
+{
+	const char *name;
+	int id;
+
+	if (!PyArg_ParseTuple(args, "i", &id))
+		return NULL;
+
+	name = syscalltbl__name(EM_HOST, id);
+	if (!name)
+		Py_RETURN_NONE;
+	return PyUnicode_FromString(name);
+}
+
+static PyObject *pyrf__syscall_id(PyObject *self, PyObject *args)
+{
+	const char *name;
+	int id;
+
+	if (!PyArg_ParseTuple(args, "s", &name))
+		return NULL;
+
+	id = syscalltbl__id(EM_HOST, name);
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
@@ -2668,6 +2700,18 @@ static PyMethodDef perf__methods[] = {
 		.ml_flags = METH_NOARGS,
 		.ml_doc	  = PyDoc_STR("Returns a sequence of pmus.")
 	},
+	{
+		.ml_name  = "syscall_name",
+		.ml_meth  = (PyCFunction) pyrf__syscall_name,
+		.ml_flags = METH_VARARGS,
+		.ml_doc	  = PyDoc_STR("Turns a syscall number to a string.")
+	},
+	{
+		.ml_name  = "syscall_id",
+		.ml_meth  = (PyCFunction) pyrf__syscall_id,
+		.ml_flags = METH_VARARGS,
+		.ml_doc	  = PyDoc_STR("Turns a syscall name to a number.")
+	},
 	{ .ml_name = NULL, }
 };
 
-- 
2.54.0.545.g6539524ca2-goog


