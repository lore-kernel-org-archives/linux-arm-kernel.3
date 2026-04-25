Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFCAFFF885C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Apr 2026 22:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5qNJyUA9ryt9seTGqwkY6UAT2Vxtn3jg366bqqeB58s=; b=ob9eEshtoQvEDBlvwuhlAEqt3J
	sfXG1TINbv1XB9scHBdelHwWsoEYeuf3Sd1tpjPQtEzKyQLo3qhnyxYrdRL99M4PdELMFtMTfV9T1
	i33d1B15iFE4lqdxAj0S1j2BfO2+jpRjthlw0RDgISMGmU5XrxcYWTWOPkGSraO9qHOYXoxH9XMYh
	NFWwl60vaEqusRABKeuWjMubI3Rr6vxC4xifu5FWE8IQGZHOaOQxIcYulTq+zLUnfHphTpUHASSey
	NBTFz7mlo2jpqoGE5FlStATmbHYukn8PaDceljDO7UlEoHjVBRvgowiWKQ1GgzZGxKKXKDRBbUhG6
	0BiH2VtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGlqL-0000000Eyv8-3Lvr;
	Sat, 25 Apr 2026 22:51:21 +0000
Received: from mail-dy1-x134a.google.com ([2607:f8b0:4864:20::134a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGlpt-0000000EyR9-3tgX
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Apr 2026 22:50:56 +0000
Received: by mail-dy1-x134a.google.com with SMTP id 5a478bee46e88-2c0f6593ef5so11439687eec.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Apr 2026 15:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777157453; x=1777762253; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=5qNJyUA9ryt9seTGqwkY6UAT2Vxtn3jg366bqqeB58s=;
        b=eJkjLccILrpGfBnhaOutEBhWlG8WhviyFrnclUTKfwEnwyi3VCxfFCclAhD0XkLPkh
         RCyuL06DN3DarD/Wg80wym6Gbr4RGzZHfIrEGK0rUOWNsrOinfucblbh2jO08q6m1WJw
         +oUAQQyh6RSkoecxpX1IVohPUr/Vmy/k0e3BCvxMd2mQqawYqdSab5QjVtDpx2OeMp2T
         wPq6xHfFEHkqScQTbPVD68nIZSZbnPwSHn1NUkUTh8CfhDZd82ZVks8hPGWWcAd1h8QR
         bB41sZEFalKRlU1t/+0s7o62ASQpdBG3hMaduvirLSOMR39lUP+46kk7IN77hlZKnlm4
         Dc2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777157453; x=1777762253;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5qNJyUA9ryt9seTGqwkY6UAT2Vxtn3jg366bqqeB58s=;
        b=f67EZ+2kiSW49k0BbxgkyuhNWA/kzu7VCodtQkUXcggmw72y6dyhmdEEZKS3arMJhL
         fJdY+79FaQvSk9tZw9uJjoVBB2Zzm+FQF/vnpzrhOMAEt41WtZ/Qi7zIgkrNUZ9V0dVg
         /KBsmW0Eh6zsETiM6tmCNlWgbmypdVE0pDxNlMwJLQIlaCQDVq8vqonVqteflYWetY5r
         kuHFpZ/nbAgJ4Auw+QGL4kkkewsI4NA+0CdqmG7KZiDi23y68T9oa537EwvFITXkpO1c
         GoqB/nA9XKDsM5Ok8Y5MRwHp6odQ3///GB87LCI+fehfgGJmZfUZwXypjwmxip0I8sAi
         NVGg==
X-Forwarded-Encrypted: i=1; AFNElJ8i0N/3gudQ2Mj28P4Ibtl8UIRX4kpyBNxTJ2t0WVPTDJXHG4jbyLyoH1+jN5oY5ndHVJR0vJovB4sPw5a+heOD@lists.infradead.org
X-Gm-Message-State: AOJu0YzqLZF/V2B0WsWI+cQ60CyCZLOcQb5uun2YjiVLokKn/JVI6nyc
	mSsh7NSdLTSFFuf3iQ8f4YDx6a23Mnq9qPiFcQlM1BIXhBNV6HTLSVel0K3j0LEM8D7aBY6ojJB
	nV2Ij97BsNA==
X-Received: from dybaz36.prod.google.com ([2002:a05:7300:6c24:b0:2da:2525:9f3])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:f90:b0:2ea:7901:8d72
 with SMTP id 5a478bee46e88-2ea79019c06mr8624190eec.17.1777157452753; Sat, 25
 Apr 2026 15:50:52 -0700 (PDT)
Date: Sat, 25 Apr 2026 15:49:11 -0700
In-Reply-To: <20260425224951.174663-1-irogers@google.com>
Mime-Version: 1.0
References: <20260425174858.3922152-1-irogers@google.com> <20260425224951.174663-1-irogers@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260425224951.174663-20-irogers@google.com>
Subject: [PATCH v7 19/59] perf python: Add config file access
From: Ian Rogers <irogers@google.com>
To: acme@kernel.org, adrian.hunter@intel.com, james.clark@linaro.org, 
	leo.yan@linux.dev, namhyung@kernel.org, tmricht@linux.ibm.com
Cc: alice.mei.rogers@gmail.com, dapeng1.mi@linux.intel.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, mingo@redhat.com, peterz@infradead.org, 
	Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260425_155054_026169_2EE0930C 
X-CRM114-Status: GOOD (  10.74  )
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
index 2953c4c8e142..5478561ca62c 100644
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
@@ -3296,7 +3297,26 @@ static PyObject *pyrf__syscall_id(PyObject *self, PyObject *args, PyObject *kwar
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


