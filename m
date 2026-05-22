Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 709B0CD5BB3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 22:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oLgxoRHXv6qZ3ND3G4At5I30r6SxZQ/gRRHwp7gOY3U=; b=Mv/Z1lmCubmuolU6qWF4PxLqgg
	VvYzKRRETMAUDz6x3P5IhzBM4JGzZCQR6vcKksi3LJk6WZFQYyUooW5y7D+tJ1YEwekSj79PlkVkK
	W0SlucJWAsxsnv7m65RbHeySAFyjlPAQeWFwBMNAzlLHKSDCIDK3pqmFJ+vYAzcBRCQ+piFeGatH+
	T+cPqzGrkdBPHKViP04GqzOnIXIEtmn7VOsMNQt+VujfWeLOSojNQMWZ0EME811AJX7XxAykdaW3N
	DxDE05o+uFxtt9nkMz4ZBf1QZyYpDarTTT2SjsOj32vS5JKYWQtyBmwGevT5WLfPJrqqqlLALaA+i
	6etLcT1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQXz9-0000000C2XO-01d4;
	Fri, 22 May 2026 22:04:51 +0000
Received: from mail-dy1-x1349.google.com ([2607:f8b0:4864:20::1349])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQXz5-0000000C2Uf-238n
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 22:04:48 +0000
Received: by mail-dy1-x1349.google.com with SMTP id 5a478bee46e88-304448ab58cso5503716eec.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 15:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779487486; x=1780092286; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=oLgxoRHXv6qZ3ND3G4At5I30r6SxZQ/gRRHwp7gOY3U=;
        b=UT6JpoooRSqt4xyqvoAIbmHy98OkdXbcFUq2zyLc5NJBD0cLAvSttxS972+IcbiPKY
         6joTolqZNiGmJRKgtq0/ge0UAI2RmhZUCI8hCzWeXbLFIK7GaBzs7uACbli1zjQd/85j
         2euRcHjB5QsraMU/1+PQCugcJB55MdQQqo7JhgNhZqSxR/BMNHVur5zTe8rO+iaCkpDY
         vhGMJ/4ktAK71iTZ8hLXIs2UQWIWccX2SQV1ZdR4rn/PAdF3OT6gDxpFgQEKU+/wUqsI
         4nUAu8dp7k4HD2Yt/Ut3cN7e3TvutX833f7MSIHN7Z4fNmb3Ruu4HPK8KOB7FK0EhNHj
         ZW3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779487486; x=1780092286;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oLgxoRHXv6qZ3ND3G4At5I30r6SxZQ/gRRHwp7gOY3U=;
        b=JasQ+OSgr+3hRhpJ26g1gAHwLCm6ciqPcI3EmtbWszw/U7ib8zCiENlqixdVXIRDBy
         tTgvteUSV1QVaQyRzwOWXUdsPntZN4MAvsFZ+1fQdLD+ygOMNQxiWv6TgmMzQ+K4burk
         pA7734egfN4AnfQKBIbiVJoIf2s/UwjC8iPJ+JCiUaMKb2T0ewio8Q98KevpTl0hQskJ
         aKSXMWEhWEVzu8ht33f24A2YIQdtwpYZbJpFHK5ijH+jRDqqIwr0sMyAaoRPAdNa5mhK
         dtTz63IIL2P7jIzl2UTK6ky1FriWg4GQOpzou0y2EdkRPeruvgAqC1x7KfvZKTz5cMQ6
         ma5Q==
X-Forwarded-Encrypted: i=1; AFNElJ8c3WUkFan9RkHk9p/2D+xn3J39ax99m7kk0XEfQQIgAiQKwzyJyH7CCyXVurqjJDX7Qy6CULadFBPMzChbo/In@lists.infradead.org
X-Gm-Message-State: AOJu0YzSYDs3ZVeMCMNrLMJ/sLTLWcF+VLtV4qlYTs0qy3YBMQtk4LKH
	yUMA4ykJSHZ0iGS6Pp2T43+QgSXXeJ8d0CVP/IVqyUbFg/ftD9QyeClDgmAnnMXG5d04btAW0T/
	9n5Cw6obE8A==
X-Received: from dycok22.prod.google.com ([2002:a05:7301:db16:b0:2e5:fa99:f6e4])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:8b1f:b0:302:e560:afb5
 with SMTP id 5a478bee46e88-3044915659dmr2907607eec.18.1779487485728; Fri, 22
 May 2026 15:04:45 -0700 (PDT)
Date: Fri, 22 May 2026 15:04:14 -0700
In-Reply-To: <20260522220435.2378363-1-irogers@google.com>
Mime-Version: 1.0
References: <20260428071903.1886173-1-irogers@google.com> <20260522220435.2378363-1-irogers@google.com>
X-Mailer: git-send-email 2.54.0.794.g4f17f83d09-goog
Message-ID: <20260522220435.2378363-4-irogers@google.com>
Subject: [PATCH v9 03/23] perf tests: Sort includes and add missed explicit dependencies
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, namhyung@kernel.org
Cc: adrian.hunter@intel.com, alice.mei.rogers@gmail.com, 
	dapeng1.mi@linux.intel.com, james.clark@linaro.org, leo.yan@linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, mingo@redhat.com, peterz@infradead.org, 
	tmricht@linux.ibm.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_150447_574097_D7C138D9 
X-CRM114-Status: GOOD (  10.48  )
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
 tools/perf/tests/hwmon_pmu.c  | 14 +++++++++-----
 tools/perf/tests/mmap-basic.c | 18 +++++++++++-------
 2 files changed, 20 insertions(+), 12 deletions(-)

diff --git a/tools/perf/tests/hwmon_pmu.c b/tools/perf/tests/hwmon_pmu.c
index 4aa4aac94f09..ada6e445c4c4 100644
--- a/tools/perf/tests/hwmon_pmu.c
+++ b/tools/perf/tests/hwmon_pmu.c
@@ -1,15 +1,19 @@
 // SPDX-License-Identifier: (LGPL-2.1 OR BSD-2-Clause)
-#include "debug.h"
-#include "evlist.h"
 #include "hwmon_pmu.h"
-#include "parse-events.h"
-#include "tests.h"
+
 #include <errno.h>
+
 #include <fcntl.h>
-#include <sys/stat.h>
 #include <linux/compiler.h>
 #include <linux/kernel.h>
 #include <linux/string.h>
+#include <sys/stat.h>
+
+#include "debug.h"
+#include "evlist.h"
+#include "parse-events.h"
+#include "pmus.h"
+#include "tests.h"
 
 static const struct test_event {
 	const char *name;
diff --git a/tools/perf/tests/mmap-basic.c b/tools/perf/tests/mmap-basic.c
index a18d84d858aa..a69cd1046e9a 100644
--- a/tools/perf/tests/mmap-basic.c
+++ b/tools/perf/tests/mmap-basic.c
@@ -1,25 +1,29 @@
 // SPDX-License-Identifier: GPL-2.0
 #include <errno.h>
-#include <fcntl.h>
 #include <inttypes.h>
 #include <stdlib.h>
+
+#include <fcntl.h>
+#include <linux/err.h>
+#include <linux/kernel.h>
+#include <linux/string.h>
+
 #include <perf/cpumap.h>
+#include <perf/evlist.h>
+#include <perf/mmap.h>
 
 #include "cpumap.h"
 #include "debug.h"
 #include "event.h"
 #include "evlist.h"
 #include "evsel.h"
-#include "thread_map.h"
+#include "pmu.h"
+#include "pmus.h"
 #include "tests.h"
+#include "thread_map.h"
 #include "util/affinity.h"
 #include "util/mmap.h"
 #include "util/sample.h"
-#include <linux/err.h>
-#include <linux/kernel.h>
-#include <linux/string.h>
-#include <perf/evlist.h>
-#include <perf/mmap.h>
 
 /*
  * This test will generate random numbers of calls to some getpid syscalls,
-- 
2.54.0.794.g4f17f83d09-goog


