Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6083FF885C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Apr 2026 22:41:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K/xS7q5C5QGMJMPDSriSnCglCHYvD9rGLYFUY/AUodE=; b=LJyudimo+YonHCEYkRnUQAgIwA
	4eoyOytDLeZ5HXaM32E4epIPuX30mMVUlNNYr0hEoP7ehyzM70aYTxyhVsZjqVKMprWi4YpdF5ge4
	yF5YivHYvbY2tJFEfdEK1zqGjzx8iPgoOkZ9Ry7DMjuVqMi7CHPpgPZQ45we4dp6e2L2yX9rGtFCO
	u+Iv3wb8rqVPUNrJCeLm3Iom8VZ3AdHTze7KmZszKY2HMr0uN3800hC0Y//OHWBei2Hi5EkRh+/Xi
	pJWTJiC1qntYK/6bj8A1VTAi6HDKq3549LBHN5gTb+raxqEj+GyTqJa5R3u+4ZB3XHqVTKtvpyDdL
	PoS7IowA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGlgx-0000000EslB-3fFI;
	Sat, 25 Apr 2026 22:41:39 +0000
Received: from mail-dl1-x1249.google.com ([2607:f8b0:4864:20::1249])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGlgu-0000000Esir-0Q3e
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Apr 2026 22:41:37 +0000
Received: by mail-dl1-x1249.google.com with SMTP id a92af1059eb24-12c20d5d7f4so43611085c88.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Apr 2026 15:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777156895; x=1777761695; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=K/xS7q5C5QGMJMPDSriSnCglCHYvD9rGLYFUY/AUodE=;
        b=EcWCSxwv8G14TFILIzFgrDV5aIIdfUN946Gt8lI6wzqqzSeVeqvrMaDAdECVUJNNyB
         EQIHjajr9/eAvKYzCk/gz2AnCntEqXJ2aj29Xeif5m/hcdzV0wQRju7OXMznedQERAZq
         B9gEV+eXBxwYNGd3qoSpwa3NxsDdfk/oWuihq45/N8yK14s8PLsc+2pAX8tL6X3mfQog
         m5u8XbLBMvhKtOel+gseoEA0LpgSAoRxEfuw4Wr/zSXuGTJoOMR/YZ4G7bQl97F2Bmh9
         G+zQd06jwFPgMKM5EmkWMtZJvcTQBZwUuYui0LoEOJsJ4BMMKgEHKhsIJX25pcWnLazS
         5ceg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777156895; x=1777761695;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K/xS7q5C5QGMJMPDSriSnCglCHYvD9rGLYFUY/AUodE=;
        b=DGAT/RSAsHcukmbdz6VwTq2AdkFBoYhr7nRTj0KuVt6ExHYUQT8hW1arxMrS9yMBgn
         bzQUoc9/TN20Lo+98HDuqPcubgIZf68KkO6TLeyjQnEoooHjf5s1MEYVippR3y6fRb0L
         NfigPM2/G5QHugeqSnAxzOSeOimcnBF50440fC5QoWQR6iUbuU5iZ3wiRlpy16704zjh
         yR6TUgrUKfXtvTvrLCkyN3PxHt6GwoWeZ64z2zuHWvRnk3IefcWMn73JmHhNbV5fK373
         CmM07JBxJyeJh4xIexLaMjOqFrOfKDwqwjO7yQ6x4VouOeP9hsvqecXnTAI12Cmk0hIC
         H3WQ==
X-Forwarded-Encrypted: i=1; AFNElJ/g6Qb1hk/1LuI4TsKixmLUWHz4cQLj2OHmekLULPdP+6k7c2fpIN+2MKDksUxuQMrYAezfrTmxLGpNbVfgejOP@lists.infradead.org
X-Gm-Message-State: AOJu0YzkGxPny+FUbbeO3tShUiDCw/kSBSGqrrN+jDYT6Cc9slGHst+U
	XqdIQgNLOGvX3Ql2vv3z7nGfCAsy0lGuG/z/OIzSLKTGHBMhpFI6nZPGc/4K5jfyFq0nBpJ+Jp8
	M1E9hhN+Cfg==
X-Received: from dlbrx24.prod.google.com ([2002:a05:7022:1718:b0:12d:b591:4bc6])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:383:b0:12b:ebb9:1c18
 with SMTP id a92af1059eb24-12c73fa739fmr21474492c88.31.1777156894496; Sat, 25
 Apr 2026 15:41:34 -0700 (PDT)
Date: Sat, 25 Apr 2026 15:40:27 -0700
In-Reply-To: <20260425224125.160890-1-irogers@google.com>
Mime-Version: 1.0
References: <20260425174858.3922152-1-irogers@google.com> <20260425224125.160890-1-irogers@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260425224125.160890-3-irogers@google.com>
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
X-CRM114-CacheID: sfid-20260425_154136_139579_9E3BCBD6 
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


