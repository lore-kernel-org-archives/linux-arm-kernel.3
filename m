Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6927FED3F3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 16:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cG/0Aa00VOrcCbwfgsMLDLxzG3YoyfXWRPuqDAM4Krs=; b=pp1rP8Pv+3qMWG4GJpQx7nxEo0
	gkgfc8K2KFsQv4b97KyZmMyRHcosohwz3WNkJpZsFd32B1mu0BpyiAyUp/8oNmnPKltL7Hn+i62LY
	SEKGMoM/SE6Ia74MR5CaYp/c6wi+GmXKOwM/eiG7h9YY2EjN0w9AqnW841AcdohFJb9AQBd2iRE5z
	KmzBlX7LtZCg5Zy35t4K/n33I5b7QuJOJ0GT1XIuMbMPeNHhOphQewyTErkJSl2Dx3tr7uiDNLCjy
	W2uFtgUPN50x2T2LWo9+q9CcEKvVBFg6994H3Cb0E9yRyKhW1DKj48NEOAIryHrn729hiYvGfB7vp
	RKjsyzqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGJhs-0000000DU18-1VSB;
	Fri, 24 Apr 2026 16:48:44 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGJhd-0000000DTjK-1cgm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Apr 2026 16:48:33 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-2b458add85aso81833895ad.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Apr 2026 09:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777049307; x=1777654107; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=cG/0Aa00VOrcCbwfgsMLDLxzG3YoyfXWRPuqDAM4Krs=;
        b=P1Zefz03lefYythz77jzrvSkubNJ9xI2euWvaIlAOhET4qFXSGuyKNQxr5DFEd3DRM
         jtWwErVcj6t4HbLdnzXFV2VwaFqkXVMmMlyAWfODwgtdmcS/Qo/Bc+fmL710ftln6std
         KyyhUc64KLNxZLqHTG+RuXJlOGXUWMt2b7pGje0TPqiySYnhQm1UuexpG/awLxIkvi/Z
         WJ7rOpC3981mGkCwzK43cYkzNe3iYua2ziRRWfCtWoze7np5rZiLCQ3GAaCorxIRhTmd
         Ubd58IWhPNMBDdt6qnlkjgoaS/2gOobFGRZC9YwNPiS2+9h+DkY+QUzz/ozfdS460IxW
         Z4NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777049307; x=1777654107;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cG/0Aa00VOrcCbwfgsMLDLxzG3YoyfXWRPuqDAM4Krs=;
        b=ochItl+QMK/Gy0yTulQAQ3a2vwYs7ys8ik0ktDyXfexIBPKiftdjDUzYEyNTVsE9yd
         hlDj8KH7S23drj0lJ+7Mv/gI3FBfj5A9B4RzSdHefqQkettRgZhH9cCiZhjvHxmF9DP+
         jRY+Av31DJWQF01RSz9YJsYX6j7+ybvrjsW7dPRzpHu/QoqZkZjQ7D5FJvvdCoTjHTSd
         BgiV3vqY5orWxXeOUhf0Ps7hy4XElbe+yp3L93iMk1Nvj1Qx1YGkGfGRRidq0dXShT/W
         U+eaXreGD6POpvxJO2673CXZXbsuncFuKu5Z2YBuLSaupbiZJY6rDnfnEbFeLqZnbJom
         hp1g==
X-Forwarded-Encrypted: i=1; AFNElJ+FHISsbkoILbQgVhqNPBIX8WxglR3UeB4kIyz645hR9FgKaGTlcRNJL/XY23bxuaurqPrVxfgKGWB28bbspXh4@lists.infradead.org
X-Gm-Message-State: AOJu0YyHcLJ6oT8IW6jUbb5Pl7h1ViUcSjsXV59e2WtX604jWyOYlyfD
	82qXiiDCSlFCmjMKJmS3KeQMAtTXPgNebXsgpbHtTquk+HIF7QJ/XnBK5hSX6iul4gbeG0e81j8
	3PSG2urjCXg==
X-Received: from pldd13.prod.google.com ([2002:a17:902:c18d:b0:2b4:5c5f:b38f])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:11ce:b0:2b4:5ff5:e51f
 with SMTP id d9443c01a7336-2b5f9f51dfemr339838925ad.36.1777049306859; Fri, 24
 Apr 2026 09:48:26 -0700 (PDT)
Date: Fri, 24 Apr 2026 09:46:41 -0700
In-Reply-To: <20260424164721.2229025-1-irogers@google.com>
Mime-Version: 1.0
References: <20260423163406.1779809-1-irogers@google.com> <20260424164721.2229025-1-irogers@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260424164721.2229025-20-irogers@google.com>
Subject: [PATCH v5 19/58] perf python: Add config file access
From: Ian Rogers <irogers@google.com>
To: acme@kernel.org, adrian.hunter@intel.com, james.clark@linaro.org, 
	leo.yan@linux.dev, namhyung@kernel.org, tmricht@linux.ibm.com
Cc: alice.mei.rogers@gmail.com, dapeng1.mi@linux.intel.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, mingo@redhat.com, peterz@infradead.org, 
	Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_094830_592561_817ADA16 
X-CRM114-Status: GOOD (  10.81  )
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
index 28961ad47010..dc10d8a42d92 100644
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
@@ -3230,7 +3231,26 @@ static PyObject *pyrf__syscall_id(PyObject *self, PyObject *args)
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


