Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04450FF885C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Apr 2026 17:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CkVuk0SY+S7oULlsa6bLwazSaIq+Fl1rUEE6RaS7too=; b=1LfskWJ2m33R5etYvTmhKmM13q
	lwpHjvy8OxTrMKiehmjf/dvgNLUXrPgpReumapYlaV9/wjbdQsx1vjMEv0IL3niXzs05uRFKamvOa
	XNNMLt7Ry4nbFgmmgqkRis6+jY39mWywKxFADxwZgoTW+SE2VIOYn1A6+jPTNounMRywC+ft1Ddci
	yee1h1Wy+yHSMm6PAU45FNh3DcPIwDWCRmpyhNkF49EfUyM5wCQkr4xaxWr2e4c5LK+Se6UMmsk7C
	A7Op8OFNJjNSncPLUCjmRo3J2E9xUuTCdbQVZsPBWRIbYYP+nvBVa3UZ3OCHrfM4XYPMZoOUE/DZE
	mUdJ3NLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGh8e-0000000EcvR-1mRt;
	Sat, 25 Apr 2026 17:49:56 +0000
Received: from mail-dy1-x134a.google.com ([2607:f8b0:4864:20::134a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGh8O-0000000EcaZ-2uoE
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Apr 2026 17:49:46 +0000
Received: by mail-dy1-x134a.google.com with SMTP id 5a478bee46e88-2ddd8ef5343so8701949eec.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Apr 2026 10:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777139379; x=1777744179; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=CkVuk0SY+S7oULlsa6bLwazSaIq+Fl1rUEE6RaS7too=;
        b=HbOnp1V5FdgwWj2oes6wxNb3VfuQ1VKOdsv76IHRkr9VWtFwBaQ3EaBXSNkBQbwS6/
         0b75tacOISKqci+lTro0H5FYO5u0HOOQNnpaGfwoX9rprUElbC2VkBdMqnryffRGiMES
         0Uzt+9hGlkmU0D2hEZfxjv6Ex7CGua0N1a3OAdKud6jPNn48+koG7M1qF8w7L+alKagJ
         mWI0789juo3VLkux9q5JpATkdUzCLQDlC0CGMwcD6iU3S39uyKkve8Q1Nm+5h2peLAc6
         1Re+EuzDp3G3v7yWcs/a9Ut99eT+/UJbrWyKSB4xk1Zc5JAOpHoZZqfuipqEFVHKlqlO
         cdzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777139379; x=1777744179;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CkVuk0SY+S7oULlsa6bLwazSaIq+Fl1rUEE6RaS7too=;
        b=NQUnXWzaQYAiDrUK2PEEhogYICQHc6HeYLKyVMpXe/H1Taq/QVAH0YZaW1YVUtbobc
         w3A2AmrYqR+1k3/MO3K9afi8+qM8fgvjnVg6OLpPMT+YkRerBKL7EWsoAY6UAZ5Sq1k7
         yJ5aVvhuRYA+lnagkBlzqpL/bEpF4XuY0iPlmTR5eNfEV4Bjl3qAV606PQUvpPupjqGb
         D2yPonXnqXSn3NVNp9tCYAfNzS3FN7ewwrT2ll+ib7gosuhQEi/InIn6szhjUjPxt3r3
         2UHdZKmHyUtL9b7gZYqH+UNMUVky38IbSVqcozPcaFiGemNnBQwJEDPvlE/VgqakhR8R
         UwVQ==
X-Forwarded-Encrypted: i=1; AFNElJ/n0Ax86wD0oBt0apcyeft9dhvMVb9XsZX2sN/oz3mw2LWtaOWrAEN3dhUxbwi6Y0eB8KdUYikY+Io5gBRo8t4W@lists.infradead.org
X-Gm-Message-State: AOJu0YxtLPdCyjZkf32/UR6zA3F1B5NQitDCzpG2RfqWB//Ksx7CPlOq
	4oXc7LnNxmgznucQ+oLIf0TvpAk+GtmYggiajRXGPE+bsgFovjTNSl402ZQSOufEcrRHvwcBIpZ
	b2PEeLeAyuA==
X-Received: from dyblf37.prod.google.com ([2002:a05:7301:a25:b0:2da:4e8f:1752])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:128d:b0:2da:a813:a5fd
 with SMTP id 5a478bee46e88-2e478936929mr21434649eec.22.1777139378769; Sat, 25
 Apr 2026 10:49:38 -0700 (PDT)
Date: Sat, 25 Apr 2026 10:48:17 -0700
In-Reply-To: <20260425174858.3922152-1-irogers@google.com>
Mime-Version: 1.0
References: <20260424164721.2229025-1-irogers@google.com> <20260425174858.3922152-1-irogers@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260425174858.3922152-20-irogers@google.com>
Subject: [PATCH v6 19/59] perf python: Add config file access
From: Ian Rogers <irogers@google.com>
To: acme@kernel.org, adrian.hunter@intel.com, james.clark@linaro.org, 
	leo.yan@linux.dev, namhyung@kernel.org, tmricht@linux.ibm.com
Cc: alice.mei.rogers@gmail.com, dapeng1.mi@linux.intel.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, mingo@redhat.com, peterz@infradead.org, 
	Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260425_104940_851229_801D8692 
X-CRM114-Status: GOOD (  10.85  )
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
index 70b5ad2b9b6f..b358852b3528 100644
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
@@ -3229,7 +3230,26 @@ static PyObject *pyrf__syscall_id(PyObject *self, PyObject *args, PyObject *kwar
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


