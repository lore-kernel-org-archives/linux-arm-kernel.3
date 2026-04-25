Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAFEAFF885A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Apr 2026 22:42:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nmZaRmxvqC34085lIoL5dgTRYciZnOOQN4pPPp0OcBc=; b=lZAkFaNp4/YoxPhRHEFmX+9B+o
	ekc3Xq4patqfqrQlEWsV1+egwzLatKhFgQQhA0LXmi4z9m4hQywyEskaFbDMbFc6rlnFk4oLyizrw
	85++MI1SNShsqZC+CCbVWO7e04LJbTJqNlsbZsEGFZkwrjd4GKuegNNfrKAKyCzb3l47EZ0zuXhyH
	Et3FaUv0e3QdjoJA5qziOfFJKfl4wMhp4E5QW6Q5iEwkkcpPpaM0STctoqX9D+asm36F/UZtZwlxE
	TdqSN8DHCqPiQzYL4KU4NWlQyI92NSajrRyr5bRuVKmgp62tRPOjEyW4dUhXEjSkPhQD38oaq157N
	BDSldoPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGlha-0000000EtNh-41Fe;
	Sat, 25 Apr 2026 22:42:19 +0000
Received: from mail-dy1-x1349.google.com ([2607:f8b0:4864:20::1349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGlhN-0000000Et6C-1HL6
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Apr 2026 22:42:06 +0000
Received: by mail-dy1-x1349.google.com with SMTP id 5a478bee46e88-2d93379001eso20009892eec.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Apr 2026 15:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777156924; x=1777761724; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=nmZaRmxvqC34085lIoL5dgTRYciZnOOQN4pPPp0OcBc=;
        b=U7yvW5ZPiQYIPERxVm3GFL74fam+P9Y5fCZHbXcIjgRm+L9OK39791iXTpCEPmt8K8
         rf+khCVG/qBPPVudTRrdHmp/lIlkxKLCNC3+PJKl/Hfbfe5s985Znbk/Qg3l3Mb3ztNV
         yySu7Y4fbOZDlE1N//XNuRVEhoi952JGmCBosjEyBMCFs7Bd9ER+NO9FTFQwZLnBIEsB
         71jszS+BCqU8Nt5K6rDSR4jBbE/ACLLlYtVixMXzwSn/HvjwMdALn1Netco0CqrZeeuz
         uZEvvyO7Q01Gk647w6eUcfH2rN4PXmcdrx4awCj+iEPk2naxUkjho10tns3MSKgMss0w
         MjGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777156924; x=1777761724;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nmZaRmxvqC34085lIoL5dgTRYciZnOOQN4pPPp0OcBc=;
        b=fB1tAcrgP6pLf++YqFnbQnK74K86hMuQ8SjZUj7LFKyULeRKZNm1T+8FSmpgWs3Du/
         mNL4NWbgOeyYjgOdYAXlldoNsvOfcgyiEYDipCtR0mpMOM0ibMDasL8fSy4KLp3wQ0Zu
         IqczbS28Asmgd/kVKn5rd4kR53UVd8t/U4intuqO1cCcXa2CE5iDTos/F11CaM5LDVUl
         p9roBOId3QcNl/WZ4/hMRqA3ca6z0RDxR6TYzGayNwYzA4ORWyMIpJCSEnsbVWPq1zpq
         /WIdJlQXFhkadGrY3TZ8zvaNoZPZ8DtJFCPpezQmBNJLC4h6axT2twPxhgLxDC1Nm3Mc
         jfVw==
X-Forwarded-Encrypted: i=1; AFNElJ8FJFkvF8GKu6enAAMviVrZ1oJaHMvIjnxrJxKNmvsciV/avKLn/yLbSEX2BF5Z0jvaCrhuoF1/MhzQ28Nw8v3O@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3Zetz+7Om7tzyhvbApFebHUZM1gjmoLdfEfFL7i7OQgmhRte5
	V4wzg7qHHhlyfDyth3T1ijiNPCmNGmC6GJANktqqJG1wHWLUaq4nGFAMhKcjMv1SijFTDDq2prW
	FocF0MBu7tQ==
X-Received: from dycpv7.prod.google.com ([2002:a05:7300:de07:b0:2da:4712:5fcf])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:f0e:b0:2e6:ff79:e34c
 with SMTP id 5a478bee46e88-2e6ff7a0431mr12080767eec.8.1777156924120; Sat, 25
 Apr 2026 15:42:04 -0700 (PDT)
Date: Sat, 25 Apr 2026 15:40:41 -0700
In-Reply-To: <20260425224125.160890-1-irogers@google.com>
Mime-Version: 1.0
References: <20260425174858.3922152-1-irogers@google.com> <20260425224125.160890-1-irogers@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260425224125.160890-17-irogers@google.com>
Subject: [PATCH v7 16/59] perf python: Add syscall name/id to convert syscall
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
X-CRM114-CacheID: sfid-20260425_154205_352963_5161657B 
X-CRM114-Status: GOOD (  16.20  )
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
 tools/perf/util/Build    |  2 +-
 tools/perf/util/python.c | 48 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 49 insertions(+), 1 deletion(-)

diff --git a/tools/perf/util/Build b/tools/perf/util/Build
index 70cc91d00804..fd55d02dd433 100644
--- a/tools/perf/util/Build
+++ b/tools/perf/util/Build
@@ -75,7 +75,7 @@ perf-util-y += sample.o
 perf-util-y += sample-raw.o
 perf-util-y += s390-sample-raw.o
 perf-util-y += amd-sample-raw.o
-perf-util-$(CONFIG_TRACE) += syscalltbl.o
+perf-util-y += syscalltbl.o
 perf-util-y += ordered-events.o
 perf-util-y += namespaces.o
 perf-util-y += comm.o
diff --git a/tools/perf/util/python.c b/tools/perf/util/python.c
index 1af53480661f..861973144106 100644
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
@@ -2669,6 +2671,40 @@ static int pyrf_session__setup_types(void)
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
@@ -2702,6 +2738,18 @@ static PyMethodDef perf__methods[] = {
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


