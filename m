Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39B3EFF8870
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 07:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gVX9vTJ6DzeN8b9iChBp6ZbHODR3lqJPETUzipsrmEo=; b=GGe+yDUZSAq+joYkJGUFomGmzQ
	Rt7qCU5v9497jozW3e3IHKUP0dYiE5HvmzRVK1xzt58Fp3jikAzpy6sKzjzUc64mLDL6fgZs9noiT
	WilrjLdJiZtrar1EVU3iDnzssUIQfZ/+nG/FQYmBN4govfA1/PDKxO7147gznpR6Q+WInq9GTlwnp
	hzT0YvNw6jrs1SZXrP/pY8CI4I41DWUaS8KPphQ1C/yvrv5J2xbeR9oh4utOBwYGQZ9jJ3J7ssTyi
	bqkd3PG0aP39gxFSGHzuV8EluF+hROhBsWKdo7Vw8WuVGLO1aPgW618RyctMqNkrL3q7MwGW+LH2s
	woJc3eiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHckY-00000000hnB-1Oax;
	Tue, 28 Apr 2026 07:20:54 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHcji-00000000gpC-3Yi2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 07:20:04 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-35d99c2908cso10798887a91.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 00:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777360801; x=1777965601; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=gVX9vTJ6DzeN8b9iChBp6ZbHODR3lqJPETUzipsrmEo=;
        b=NUJNQ3pPx2OW/SHEBseRXRt1xXQVO0V0Fa3bsLopCeCxfkJM67sTP78S2pxCDnG0zX
         FbomR1t3Z7fruSvQivcxcGOs7B17rUQkfT2tE20+lI7UHBCC1/tWKky4GKoQBP3cbuwo
         pIvfAFXTG6npBhneTkV7uyYMxM09bDrFbC8yBEa7nhlCS1sQG2/tRtyUfg0G7g0KF2I/
         qx0evUgT7SKt52DFyHWbzLDxr7IyNWsn3Y8XAGzS4Dtss7Aec20DLY3QG62ZWGVkih7n
         myfis0HqhjG2vInlPsDyymWJe5+2rrlozsQ0xIwe7qbb5/SI+VCaruKMsVFDsSClBktt
         BVyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777360801; x=1777965601;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gVX9vTJ6DzeN8b9iChBp6ZbHODR3lqJPETUzipsrmEo=;
        b=Neh1r0Jr/I19goCV6albaq4uMVm1u3TDVAmGg5gMMUwTN9Ni/WE3WMM68gdPOqynKn
         P89t7I+c+l62K/NgXQY/gBYsWT/a8rgL486oNYlieohwreqBIdG+z45Rh2axhqHmSspD
         SlaHHRVfd3wD/nfPDUs6AjwJMPIflhdH4LyotbSkAwxWzS1PHZg7rQNlxPndpo9ohfxG
         3s6b9zpbE5uRiDqassV6v1d2MmsJlCZHTBaYFLEV05f/peQZHdyHE/OsfDKgS4PJ9TqO
         76VVALSGQvV2r0hO0rHgbdIgy0ntPFafpXj5iz36zEYz/7cKE3EsmP1cw+w2ZfVWqs4Z
         WaFg==
X-Forwarded-Encrypted: i=1; AFNElJ+QW2SB4DqVxmxujW7/660A6cvvFdc3uk7HkQxAlM+mAjQSvL4aazcgSxNfWtxhR9FwrOyzwsL+Von/Y5Q8Qs5n@lists.infradead.org
X-Gm-Message-State: AOJu0Yyjtq2ajzbhvvaY5BGxwPcTpjobJLN4yUHqTxwn21ySnIkhuVZs
	+928ckf507VOHj3HvFo3ITTMitDgD7JfhapYaSmbvaPCoXlvD0NS8+pi6qBexbNvTHa1DlTOV2O
	adbOMGVQfrg==
X-Received: from plrt5.prod.google.com ([2002:a17:902:b205:b0:2a3:1bf9:d25])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4c92:b0:359:f2e1:5906
 with SMTP id 98e67ed59e1d1-36491f6c206mr1956484a91.4.1777360799930; Tue, 28
 Apr 2026 00:19:59 -0700 (PDT)
Date: Tue, 28 Apr 2026 00:18:26 -0700
In-Reply-To: <20260428071903.1886173-1-irogers@google.com>
Mime-Version: 1.0
References: <20260425224951.174663-1-irogers@google.com> <20260428071903.1886173-1-irogers@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260428071903.1886173-22-irogers@google.com>
Subject: [PATCH v8 21/58] perf python: Add config file access
From: Ian Rogers <irogers@google.com>
To: acme@kernel.org, namhyung@kernel.org
Cc: adrian.hunter@intel.com, alice.mei.rogers@gmail.com, 
	dapeng1.mi@linux.intel.com, james.clark@linaro.org, leo.yan@linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, mingo@redhat.com, peterz@infradead.org, 
	tmricht@linux.ibm.com, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_002002_949950_178485AF 
X-CRM114-Status: GOOD (  11.68  )
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

Add perf.config_get(name) to expose the perf configuration system.

Assisted-by: Gemini:gemini-3.1-pro-preview
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/python.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/tools/perf/util/python.c b/tools/perf/util/python.c
index 69d443c504d3..0e7f2a0bb532 100644
--- a/tools/perf/util/python.c
+++ b/tools/perf/util/python.c
@@ -12,6 +12,7 @@
 #include "build-id.h"
 #include "callchain.h"
 #include "comm.h"
+#include "config.h"
 #include "counts.h"
 #include "data.h"
 #include "debug.h"
@@ -3821,7 +3822,26 @@ static PyObject *pyrf__syscall_id(PyObject *self, PyObject *args, PyObject *kwar
 	return PyLong_FromLong(id);
 }
 
+static PyObject *pyrf__config_get(PyObject *self, PyObject *args)
+{
+	const char *config_name, *val;
+
+	if (!PyArg_ParseTuple(args, "s", &config_name))
+		return NULL;
+
+	val = perf_config_get(config_name);
+	if (!val)
+		Py_RETURN_NONE;
+	return PyUnicode_FromString(val);
+}
+
 static PyMethodDef perf__methods[] = {
+	{
+		.ml_name  = "config_get",
+		.ml_meth  = (PyCFunction) pyrf__config_get,
+		.ml_flags = METH_VARARGS,
+		.ml_doc	  = PyDoc_STR("Get a perf config value.")
+	},
 	{
 		.ml_name  = "metrics",
 		.ml_meth  = (PyCFunction) pyrf__metrics,
-- 
2.54.0.545.g6539524ca2-goog


