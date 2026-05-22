Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65FDBCD4F3D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 22:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O/OkUfIECucUs4dgUQxXg6gu1NGDepTpokWupB8NdEw=; b=g1lxo0pRdq8OwQU21uymFqnu/H
	EFwXziotXGRZRTKEMzfCXUHoHrSYIwUAq6QmtRn+C368qEW0X09V2SJsFfIoH/Vqih18nMh/Jt47F
	pZQO5PSOz/ZZNo9u9/uZRl/OuugQdY4LFZiCa0Gy3tIalbnpZdKSgDpqry4/hFqaWkl4SUQuEHWAe
	inBUnvs2QlOXsBRy1SiD8ft5RGvNHU/yG6uCEMEUL6bJec42raZi3OIAldd0JbJGovO1/q9JWcC5y
	W70bacf/y8JQtpAoICMbZFZY/iBbhElJoANF+fBSVwE8JPm0Fgfo+wG3lRPWNeOKcxWh1RJMwPQEY
	6HST8ddA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQXzz-0000000C3Qz-2fOU;
	Fri, 22 May 2026 22:05:43 +0000
Received: from mail-dl1-x124a.google.com ([2607:f8b0:4864:20::124a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQXzl-0000000C38e-2Exk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 22:05:31 +0000
Received: by mail-dl1-x124a.google.com with SMTP id a92af1059eb24-1353ac304f3so11853130c88.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 15:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779487528; x=1780092328; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=O/OkUfIECucUs4dgUQxXg6gu1NGDepTpokWupB8NdEw=;
        b=LOurnvjElZQ4TxfHqplebmlPlko6fC+RmrG2AihDBTJvS3c2WrZIc7A+xvoPMy3W1i
         MNml3AKjIir9CldqOCUkTrMMtMPSC6E4xTQwKi1SzVujs1vIaMjb8ZDBJOOPsw1h4eul
         lQ7r4+8rwwnCeBWLzKXtW6oxTJZ8NyBv+Zpei7WToRKZAUl01XMKA4HLvSSwbsKbLg3W
         ENIpihB76hmgRmDSPBXzYtL80twJHPOvh4uy+/60GsK364bYOwIn7i7CxRBoehnEBr7e
         mnwZhBB1es7AKo+B/r5KHi3OZ5t5HK63nHrYhztVSJIeOIqDVXklLmoRvr9lWPfSryJP
         3udw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779487528; x=1780092328;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O/OkUfIECucUs4dgUQxXg6gu1NGDepTpokWupB8NdEw=;
        b=owgYvQwoYwFwK3TM9o+wCl0nx+0kHXoLefyVbe841+RE1gb2/HGhmH37CeXhw9AfhF
         7Ue88OGREyoy1RI74ITYnDwf6cS3LHjOPww8VNRlLJDX7dJBLd9qbgBA+DyH2dCKD5Q+
         1e4fgnKN9Zps9oC/vcAOzmFOcMarDvYxKCGtgFns9kui2o+Ky+JmDue9yxiyDNNuNvX/
         ixUvJZKtqj8zhnpu89oiF9IUC5hNweh6T0r4MJIhimdbyvaYJc+DNZTPyjmYhSxmpBzv
         vgjdTgLN36juD4IKF7Nj5to54/FBoGgG3v1qxh3kL6MWKj2ksFQmE/ITTMRtctIWoqRt
         JmQQ==
X-Forwarded-Encrypted: i=1; AFNElJ/ZeE5TX+CVrLcGEZsd0xra7FTalAXR2jUxDy8s29U1T49CMt8ueRUj1YN07Y5OHzrZixfOmK3JN1E4hQZPOjV5@lists.infradead.org
X-Gm-Message-State: AOJu0Ywa+MoMVXbWBRoW9yw82f8Go2ZvnNxhjoMTe2O4DPGfeyaNUMWi
	nvH1DvSJbE/VIm+600tE3RzX0Xd529t+kDbbtIPHMH5FOP01AM+Zdt+6BYh2uO0nWUCjM2eYHE7
	DcNp1a5muNw==
X-Received: from dleb20-n1.prod.google.com ([2002:a05:701b:4254:10b0:12d:bbdf:edcb])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:41aa:b0:132:956b:3a3
 with SMTP id a92af1059eb24-1365f70a0bemr1819078c88.10.1779487528034; Fri, 22
 May 2026 15:05:28 -0700 (PDT)
Date: Fri, 22 May 2026 15:04:32 -0700
In-Reply-To: <20260522220435.2378363-1-irogers@google.com>
Mime-Version: 1.0
References: <20260428071903.1886173-1-irogers@google.com> <20260522220435.2378363-1-irogers@google.com>
X-Mailer: git-send-email 2.54.0.794.g4f17f83d09-goog
Message-ID: <20260522220435.2378363-22-irogers@google.com>
Subject: [PATCH v9 21/23] perf python: Add config file access
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, namhyung@kernel.org
Cc: adrian.hunter@intel.com, alice.mei.rogers@gmail.com, 
	dapeng1.mi@linux.intel.com, james.clark@linaro.org, leo.yan@linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, mingo@redhat.com, peterz@infradead.org, 
	tmricht@linux.ibm.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_150529_593972_CE2EF215 
X-CRM114-Status: GOOD (  11.18  )
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
index 23eb65adb392..458aca9db091 100644
--- a/tools/perf/util/python.c
+++ b/tools/perf/util/python.c
@@ -14,6 +14,7 @@
 #include "build-id.h"
 #include "callchain.h"
 #include "comm.h"
+#include "config.h"
 #include "counts.h"
 #include "data.h"
 #include "debug.h"
@@ -3828,7 +3829,26 @@ static PyObject *pyrf__syscall_id(PyObject *self, PyObject *args, PyObject *kwar
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
2.54.0.794.g4f17f83d09-goog


