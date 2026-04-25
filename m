Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8BA2FF885A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Apr 2026 22:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5qNJyUA9ryt9seTGqwkY6UAT2Vxtn3jg366bqqeB58s=; b=NRkxpUdQbr4jnGnc4R2xVDGpi4
	G71dDJExYA/4aB1BjkkMDe1JHnusqmPJyS5NRAN/kcrbu+ueZVSvs6QOUw0XV4VQqyApGJBg/r5q7
	uajghAS7ZIMWpOYoY+9ZmL+8uXqwI+/oQbA+eVqgndVWRE2Ks4SaIMkcmyNd32od32+S6cIfY6++J
	iZP8CmnTsxLtvTUxFAxRjp0EJnGHcuxi3IzH6ln3fWaNd58lNVorDn3SseG4JHEKJ3gkwSNhtTMN0
	enHJx2z3enO9sqg1YJbiznUKQn6g1xzgc/EERQtNvs741TbBEdW73fUzemOwEVOV4+smZqFmYUakl
	6NSk08Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGlhz-0000000Etry-3sFw;
	Sat, 25 Apr 2026 22:42:45 +0000
Received: from mail-dy1-x134a.google.com ([2607:f8b0:4864:20::134a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGlhT-0000000EtE9-34DT
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Apr 2026 22:42:13 +0000
Received: by mail-dy1-x134a.google.com with SMTP id 5a478bee46e88-2d8a677cdfaso9574481eec.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Apr 2026 15:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777156930; x=1777761730; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=5qNJyUA9ryt9seTGqwkY6UAT2Vxtn3jg366bqqeB58s=;
        b=lsYGttT19y6w0URVqirnK2kya0EpPpn9LpfXCT0eUnAhpS1LOVVPVzXUKNX+XpNP6Q
         SZ/PNAppI8qVdVsVJms9cfJP15twgudTYkKDZdA2nZVoGxrya/iN0nYQV7PCCeHEvwUL
         tAfov/dGgOHjYG/K7W41bK3olxUF3a988oTKICb022/VIQUH7Ccogb29gIKI2IHeHNv0
         wumOYBXNQz66O+pnEhwyKPQWilQvyCUee1+1QgdISD61QxZK3qjsdJVNBrzH6Ng9hB6y
         VVlB7yK4AijH3ZU3Gva5vFhEAyEnsEAYcylExlva5z7Qj+xJ5ozbhm/8UZef/YSOlSHV
         6TAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777156930; x=1777761730;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5qNJyUA9ryt9seTGqwkY6UAT2Vxtn3jg366bqqeB58s=;
        b=JxkZpeDhq+hOsKjnk2Uu3JX9FHEQ7m44QY+qsV8YOTkWxpxvHoAVmORbYsHDsS/CfC
         v+IDplN1DoQ93kotzULroVRLEAVVXa3GNoVFKn5B9J8oKwyR8+4BiOQnXZ+qUqdTdeU8
         lU0nHHFIhE5hNorvBCxyQSzWyHPxMxU8YIW1gW3/RgytN0boDNFh+buX5ukB4sAr4K0Z
         GRcafryzdIvYrw8Cs1ss5pDbteW4VhRbw1ESW5rfkIg/qYoBRilhTKWlvUJ3KIXdhdHZ
         so4ohtcf65ADxxhhfVgg4ASE5zAX3ULb2aGdOzLvtUwI3vADzSCaiP8PLCONHzH7YO7J
         wQPQ==
X-Forwarded-Encrypted: i=1; AFNElJ/+SgqLdOJvm1NEvBTpbZK703tugxhHpUKkxMz+/0WGy4XQj6dJX0LNCSz58wXHdDbuXCKtmY9J58rfVhVrbQ/7@lists.infradead.org
X-Gm-Message-State: AOJu0YxOH3YA6a37xSa+ZQKwyIuxyNqZS1cLWl590rwP39d6vQaOGhUU
	eVbHZ4/Cc7pynxN4nJQNr1ARaYTbXh4z+awu4K2Zwkygji6GLedrgQJsErB2+LWBDx+gBfmOa81
	18Ea7dP+Q4g==
X-Received: from dybfx10.prod.google.com ([2002:a05:7300:c38a:b0:2de:831d:2756])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:dc93:b0:2da:45f8:1b41
 with SMTP id 5a478bee46e88-2e478c1f80fmr17612030eec.19.1777156930309; Sat, 25
 Apr 2026 15:42:10 -0700 (PDT)
Date: Sat, 25 Apr 2026 15:40:44 -0700
In-Reply-To: <20260425224125.160890-1-irogers@google.com>
Mime-Version: 1.0
References: <20260425174858.3922152-1-irogers@google.com> <20260425224125.160890-1-irogers@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260425224125.160890-20-irogers@google.com>
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
X-CRM114-CacheID: sfid-20260425_154211_806318_90C4C8E9 
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


