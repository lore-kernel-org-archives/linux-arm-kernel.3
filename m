Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32617FED3F0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 16:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RL6gbA3yHwRjF7ykSQ2dEvMc7Axg6yuH3FzRoVTsCT0=; b=JoQH9+LPffE3EGqlpT+/3hMF5h
	lqbMCP7nRxlALcX0t5PruY9g5VgKCeBdxa0inyVIKC8NuJ84UwxkVYyNWiI506p2ZvSrO5dI7tS9z
	mfa7apPhSxoxY/cDBjhfC1lh39eORZwyuISjjMgz5C5e49PVX2tKHMuSr5KQh7jRy8LpE7AQzwCQL
	h18ZASSgyJgwc6hgnZOib8zuvSUp9lZqITb67jYLdtIt574KZdIf83PV6kF1Mb6aUjaQjbePn5VCi
	HEi+u/ctI92TKdT5GbH1jVnbQ4gvoPaNf6GKLRHbjtNgLts8gmIR2Z+bymfUAie71m6fXePxVDO+J
	F/YKLEig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGJh5-0000000DTIW-1qa2;
	Fri, 24 Apr 2026 16:47:55 +0000
Received: from mail-dy1-x1349.google.com ([2607:f8b0:4864:20::1349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGJh2-0000000DTGG-3HqI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Apr 2026 16:47:55 +0000
Received: by mail-dy1-x1349.google.com with SMTP id 5a478bee46e88-2dd1c74508cso12952467eec.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Apr 2026 09:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777049271; x=1777654071; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=RL6gbA3yHwRjF7ykSQ2dEvMc7Axg6yuH3FzRoVTsCT0=;
        b=a+RWIdtuboOU2oB6apVolkb33DrZIV8aegVZhnCQGypkD9qstQ6/lfQq7mxOnbynpF
         ZO5CE6LpSf3InkiWQEGqgZDGTrNO3YsYtIGk2QeWmCC8GJdtty9JnvWsIshkGKffg7cs
         OESTqLVClYke6XgjPZfcOwJjbwp3Kgu+fXMUkC+nU6t7j3pITRbFlAgbEapMpM/qho7+
         8Mz2CD9wYZt9JYrRmySlc7Rzge6+K0OXRssvs+wFUmQIIhZpqhWB7CtH96b7+rvprD4M
         foNKHDtZcGP2EQbGAAY/ibqAIBrq0kfsYJgIKqy+DDAf6vqQSioqheHZ7fOELAefRXHr
         6u8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777049271; x=1777654071;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RL6gbA3yHwRjF7ykSQ2dEvMc7Axg6yuH3FzRoVTsCT0=;
        b=qKeruueqavbckqPPhADwhmZJzKUX3WDWOUxNGaFjYxXaNUzayC2xf4YfqKD+ficQeS
         mny3kZpQTBqD9WqVBtPDG1F4t/eDhjcm9raQMD723Sw8pibofNfTgb+caEsflcp2yjCo
         N0NF6ot6uIqlqGekkyfOlHdClnYqK0NxfhNHdis3DMCdMdxsaITuga6qKTOtc5UwusiV
         p4ay3EYkbzp43/qYXO5ttiSF6hR+tnNTTKH6Ni8BOzjGxt+1Ri4HM76+iYj3lyGYuW7I
         w/laosHO6Thk3p3eUvJdD6PGXuaHkuor+QUNZIEmuHdCOMPuWmIvQISWK52JVHccLxVe
         DiZw==
X-Forwarded-Encrypted: i=1; AFNElJ9uheLzQGJ89JKwZ2hoS2lEQm9KR+/+paV8fZBHpfki2mHeMhRxmRWnTejkvUd2q3DyOb0boQNpulSf6GnVCAm5@lists.infradead.org
X-Gm-Message-State: AOJu0YwYYkQQpt2Xpm8/Q5Cv48VkgacVu5zl/gmSzlNpm9jEIcnyEWwM
	DD5lZA6q8/uzDtwsdgn9hVI5icch56PA3RzczF3vYsuB58GRaMTygjCzrwTO0HbF5htblKfzXJ3
	WVU95XOs3bg==
X-Received: from dyjh29.prod.google.com ([2002:a05:7300:561d:b0:2e0:f299:f616])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:2d15:b0:2c9:ee15:a0d6
 with SMTP id 5a478bee46e88-2e47901662fmr20345135eec.29.1777049251118; Fri, 24
 Apr 2026 09:47:31 -0700 (PDT)
Date: Fri, 24 Apr 2026 09:46:25 -0700
In-Reply-To: <20260424164721.2229025-1-irogers@google.com>
Mime-Version: 1.0
References: <20260423163406.1779809-1-irogers@google.com> <20260424164721.2229025-1-irogers@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260424164721.2229025-4-irogers@google.com>
Subject: [PATCH v5 03/58] perf arch x86: Sort includes and add missed explicit dependencies
From: Ian Rogers <irogers@google.com>
To: acme@kernel.org, adrian.hunter@intel.com, james.clark@linaro.org, 
	leo.yan@linux.dev, namhyung@kernel.org, tmricht@linux.ibm.com
Cc: alice.mei.rogers@gmail.com, dapeng1.mi@linux.intel.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, mingo@redhat.com, peterz@infradead.org, 
	Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_094752_835789_8B2824E5 
X-CRM114-Status: UNSURE (   9.91  )
X-CRM114-Notice: Please train this message.
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
 tools/perf/arch/x86/util/intel-bts.c | 20 +++++++++++--------
 tools/perf/arch/x86/util/intel-pt.c  | 29 +++++++++++++++-------------
 2 files changed, 28 insertions(+), 21 deletions(-)

diff --git a/tools/perf/arch/x86/util/intel-bts.c b/tools/perf/arch/x86/util/intel-bts.c
index 85c8186300c8..100a23d27998 100644
--- a/tools/perf/arch/x86/util/intel-bts.c
+++ b/tools/perf/arch/x86/util/intel-bts.c
@@ -4,26 +4,30 @@
  * Copyright (c) 2013-2015, Intel Corporation.
  */
 
+#include "../../../util/intel-bts.h"
+
 #include <errno.h>
-#include <linux/kernel.h>
-#include <linux/types.h>
+
 #include <linux/bitops.h>
+#include <linux/kernel.h>
 #include <linux/log2.h>
+#include <linux/types.h>
 #include <linux/zalloc.h>
 
+#include <internal/lib.h> // page_size
+
+#include "../../../util/auxtrace.h"
 #include "../../../util/cpumap.h"
+#include "../../../util/debug.h"
 #include "../../../util/event.h"
-#include "../../../util/evsel.h"
 #include "../../../util/evlist.h"
+#include "../../../util/evsel.h"
 #include "../../../util/mmap.h"
-#include "../../../util/session.h"
+#include "../../../util/pmu.h"
 #include "../../../util/pmus.h"
-#include "../../../util/debug.h"
 #include "../../../util/record.h"
+#include "../../../util/session.h"
 #include "../../../util/tsc.h"
-#include "../../../util/auxtrace.h"
-#include "../../../util/intel-bts.h"
-#include <internal/lib.h> // page_size
 
 #define KiB(x) ((x) * 1024)
 #define MiB(x) ((x) * 1024 * 1024)
diff --git a/tools/perf/arch/x86/util/intel-pt.c b/tools/perf/arch/x86/util/intel-pt.c
index c131a727774f..0307ff15d9fc 100644
--- a/tools/perf/arch/x86/util/intel-pt.c
+++ b/tools/perf/arch/x86/util/intel-pt.c
@@ -3,36 +3,39 @@
  * intel_pt.c: Intel Processor Trace support
  * Copyright (c) 2013-2015, Intel Corporation.
  */
+#include "../../../util/intel-pt.h"
 
 #include <errno.h>
 #include <stdbool.h>
-#include <linux/kernel.h>
-#include <linux/types.h>
+
 #include <linux/bitops.h>
+#include <linux/err.h>
+#include <linux/kernel.h>
 #include <linux/log2.h>
+#include <linux/types.h>
 #include <linux/zalloc.h>
-#include <linux/err.h>
 
-#include "../../../util/session.h"
+#include <api/fs/fs.h>
+#include <internal/lib.h> // page_size
+#include <subcmd/parse-options.h>
+
+#include "../../../util/auxtrace.h"
+#include "../../../util/config.h"
+#include "../../../util/cpumap.h"
+#include "../../../util/debug.h"
 #include "../../../util/event.h"
 #include "../../../util/evlist.h"
 #include "../../../util/evsel.h"
 #include "../../../util/evsel_config.h"
-#include "../../../util/config.h"
-#include "../../../util/cpumap.h"
 #include "../../../util/mmap.h"
-#include <subcmd/parse-options.h>
 #include "../../../util/parse-events.h"
-#include "../../../util/pmus.h"
-#include "../../../util/debug.h"
-#include "../../../util/auxtrace.h"
 #include "../../../util/perf_api_probe.h"
+#include "../../../util/pmu.h"
+#include "../../../util/pmus.h"
 #include "../../../util/record.h"
+#include "../../../util/session.h"
 #include "../../../util/target.h"
 #include "../../../util/tsc.h"
-#include <internal/lib.h> // page_size
-#include "../../../util/intel-pt.h"
-#include <api/fs/fs.h>
 #include "cpuid.h"
 
 #define KiB(x) ((x) * 1024)
-- 
2.54.0.545.g6539524ca2-goog


