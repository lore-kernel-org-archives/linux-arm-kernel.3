Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04EA1FF885C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Apr 2026 22:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K/xS7q5C5QGMJMPDSriSnCglCHYvD9rGLYFUY/AUodE=; b=gXy3SJOz8/IiFWeAVy8klZXfht
	vDiYlkw++OOZAIflGn0TX7PQtVo6o0i6wm71iT0jATg5vDD5G41avavvVMjlQ1yNb1CmvFkzoNvUR
	yk4dD8mX93Bjudfa7S8NO2/ujgmqdtpgthj0cOIDpGb5pFuyapoB5KE1boTyEP4YSGgu24MXnonOa
	38qO9umC+pEGUQoFQyfIr5wKjhseUAesTM3RRPwqEzcz4Qrvej/g8xZ7X5AYuPr3kgpSLCGjUWvwb
	Q5sMttVgHPQQMjtxqwJ07dcB8jWcV4oomNiWqAeAkv6dbkX29BIqrnYEryfy11lfPkENdleHOAr3n
	/xgEnhRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGlpM-0000000Extq-2wNd;
	Sat, 25 Apr 2026 22:50:20 +0000
Received: from mail-dy1-x1349.google.com ([2607:f8b0:4864:20::1349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGlpE-0000000ExqA-2E1T
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Apr 2026 22:50:13 +0000
Received: by mail-dy1-x1349.google.com with SMTP id 5a478bee46e88-2bdf75bc88fso11624761eec.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Apr 2026 15:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777157411; x=1777762211; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=K/xS7q5C5QGMJMPDSriSnCglCHYvD9rGLYFUY/AUodE=;
        b=mAxNVbm2+xNwMUkdOIMy2iQsy87YAQpZNCgwOdut0Xt5542l5gejUhRMK/yfRZZRZ3
         GgVwURWx63038iFc42eex5RUMPeZzhUcTYj3N30d95QqjHogK28td6VGPssmr46VaarJ
         dFwR4a77KPzFHAGNY80XJR5bxOWNw3M76TnU9Krf3A58aUyYn4KmTqo9W0WmBGIa4+sh
         xk5GKsjTNtzF69DRqOnewAwnHQ2XZwkiy8ewIEEWQadHGJ6zIxNr28vaNw3wMlRJ4COq
         MaqD1ge7XxnvZkEEFT8k6NrtR3gTpcxPd++XER1MMVZexYKpNHPSdTrAX5XONI7XFi8E
         pKEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777157411; x=1777762211;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K/xS7q5C5QGMJMPDSriSnCglCHYvD9rGLYFUY/AUodE=;
        b=fEVEPDV4fj+JcQZuDb9FDauG3qanNXFr2yoxCP6EQfUtoZtxgFi/DlQT2CNy99iuVQ
         7RrkLu0xvO5j5LFt0rJhLlUqTqAyPpZAz6/LnZeuxbCI5Pk3F52imlB4pWclVhkKW0eQ
         lDFLhn5fS1rrM92VNvbMAElXfquXnWDzc38xmzu/uRY9391JA5Vp4UB9+gzMBKbPbbev
         dB9aZoY0g45Phk1RpGO2u9Wk+vE8M70K+sykIGe4YraXb308lbKQ5Yq+hrGZ8AhoQejo
         MOUDY0kbl9QSYExyM9hP9Ijp7Nv2dQIKsJDLXUYtjqc/mgQhidtuKVKV1yHe85oFWzJh
         Y9bA==
X-Forwarded-Encrypted: i=1; AFNElJ+tSMhuUgOAFLWri8EL1POA3frMuKYcjMLzlmBw1YXGE4Oqmz1UMK434SBQ8xTpgRWU+taWHg05uCERewkQ5dOq@lists.infradead.org
X-Gm-Message-State: AOJu0YyqGx1EcgvjcBIqBc9k/xDo9pxMFmW+4RyRJpwBW0JtK+2/ka0k
	F0cnw1bQwZYRTmVg2zFaq+Z8w45ZJu2qLujohjQHTHfZ0NNcHOIAu4HE1pdGQ96umiNhnCkEQ5D
	ja0ziSWQ4Sw==
X-Received: from dybnj1.prod.google.com ([2002:a05:7300:d081:b0:2da:5e63:c8e4])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:693c:3108:b0:2d8:df01:d9f6
 with SMTP id 5a478bee46e88-2e478c20551mr20278918eec.23.1777157411417; Sat, 25
 Apr 2026 15:50:11 -0700 (PDT)
Date: Sat, 25 Apr 2026 15:48:54 -0700
In-Reply-To: <20260425224951.174663-1-irogers@google.com>
Mime-Version: 1.0
References: <20260425174858.3922152-1-irogers@google.com> <20260425224951.174663-1-irogers@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260425224951.174663-3-irogers@google.com>
Subject: [PATCH v7 02/59] perf arch arm: Sort includes and add missed explicit dependencies
From: Ian Rogers <irogers@google.com>
To: acme@kernel.org, adrian.hunter@intel.com, james.clark@linaro.org, 
	leo.yan@linux.dev, namhyung@kernel.org, tmricht@linux.ibm.com
Cc: alice.mei.rogers@gmail.com, dapeng1.mi@linux.intel.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, mingo@redhat.com, peterz@infradead.org, 
	Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260425_155012_565667_29B7B69E 
X-CRM114-Status: GOOD (  10.01  )
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

Fix missing #includes found while cleaning the evsel/evlist header
files. Sort the remaining header files for consistency with the rest
of the code.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/arch/arm/util/cs-etm.c | 26 ++++++++++++++------------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/tools/perf/arch/arm/util/cs-etm.c b/tools/perf/arch/arm/util/cs-etm.c
index b7a839de8707..cdf8e3e60606 100644
--- a/tools/perf/arch/arm/util/cs-etm.c
+++ b/tools/perf/arch/arm/util/cs-etm.c
@@ -3,10 +3,13 @@
  * Copyright(C) 2015 Linaro Limited. All rights reserved.
  * Author: Mathieu Poirier <mathieu.poirier@linaro.org>
  */
+#include "../../../util/cs-etm.h"
+
+#include <errno.h>
+#include <stdlib.h>
 
-#include <api/fs/fs.h>
-#include <linux/bits.h>
 #include <linux/bitops.h>
+#include <linux/bits.h>
 #include <linux/compiler.h>
 #include <linux/coresight-pmu.h>
 #include <linux/kernel.h>
@@ -14,25 +17,24 @@
 #include <linux/string.h>
 #include <linux/types.h>
 #include <linux/zalloc.h>
+#include <sys/stat.h>
+
+#include <api/fs/fs.h>
+#include <internal/lib.h> // page_size
 
-#include "cs-etm.h"
-#include "../../../util/debug.h"
-#include "../../../util/record.h"
 #include "../../../util/auxtrace.h"
 #include "../../../util/cpumap.h"
+#include "../../../util/debug.h"
 #include "../../../util/event.h"
 #include "../../../util/evlist.h"
 #include "../../../util/evsel.h"
-#include "../../../util/perf_api_probe.h"
 #include "../../../util/evsel_config.h"
+#include "../../../util/perf_api_probe.h"
+#include "../../../util/pmu.h"
 #include "../../../util/pmus.h"
-#include "../../../util/cs-etm.h"
-#include <internal/lib.h> // page_size
+#include "../../../util/record.h"
 #include "../../../util/session.h"
-
-#include <errno.h>
-#include <stdlib.h>
-#include <sys/stat.h>
+#include "cs-etm.h"
 
 struct cs_etm_recording {
 	struct auxtrace_record	itr;
-- 
2.54.0.545.g6539524ca2-goog


