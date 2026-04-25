Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85CA2FF8864
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Apr 2026 22:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RL6gbA3yHwRjF7ykSQ2dEvMc7Axg6yuH3FzRoVTsCT0=; b=DtXuzzFnL/kd88bfbLacxoA/Gr
	+nVuR0hty6KqSSCDANXwQ0QM8yoT70xbkbLxu5D+KBKrv8XDSmbNUI1YcS78HPeJAZNkEItyZ5VZa
	gK3Sbsv5rSdaNeN3gFy7AQoJF030usq2kYZsoBvQqbLIA5kHsy46iCbgHM+TZq2aY/vI+0pccsc9s
	tVoFXe2lFnDSfLzjSY6UMlw5NE0Y3tzQ3KadRMo7/8y0uJ8NW6llUIhyb04AtXJpFckb7rLQpQxzg
	7s1OKJRC0RyPHT2cLVRDQFdbkPt7PEE6ZSQke/uW/JuV78nLkHgHFDNhiU6RP53kFqj19qF62cPxd
	vuKFjY0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGlh3-0000000Esnl-2pHW;
	Sat, 25 Apr 2026 22:41:45 +0000
Received: from mail-dl1-x124a.google.com ([2607:f8b0:4864:20::124a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGlgw-0000000EskA-02Wd
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Apr 2026 22:41:39 +0000
Received: by mail-dl1-x124a.google.com with SMTP id a92af1059eb24-12dba1e866dso3396154c88.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Apr 2026 15:41:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777156897; x=1777761697; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=RL6gbA3yHwRjF7ykSQ2dEvMc7Axg6yuH3FzRoVTsCT0=;
        b=c92Z6QSRfspAM7S9Ppof+QtWshVNQqoSlHW8GTl3owYmNm6FoZKPJnvi9RUJjDY0Je
         BfQ7VnvwXeddjGqDvcSuZH89UfmwMz5gRYGwEZGY0rTcXhFQbINoGgJg43XCkPYuyxzl
         6vUGIn6jXOtpg3reUzi+Trg9KXUhoiUryHZ0rMBR2ho1x+irm1t3NVbo4d6zPSJjUkx1
         LaMcPGy5TYN76u2L8LbIozFr4B/miO41ux8maGm7rkcJaCS8uOa0wuME0bTODCIbOaW9
         lbo/ZwPTkEZPQPdIMstxAhYfojOOIEuBB91rzL5E2/ItDR33m1GOPtpcxOLXSX+xLvWJ
         FsKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777156897; x=1777761697;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RL6gbA3yHwRjF7ykSQ2dEvMc7Axg6yuH3FzRoVTsCT0=;
        b=mSLqZ08rqCOW/XFVuYckQX+eadCrJRyIhbqSmYrIzJp1ccsuXY0/5EmMKNqT/YoeLm
         SFT9c+5illweLjU88DRYjycWQEdfnBsnQlHEHWOOZl4XrfvzYpcoN3prFv/FDOieti/W
         q9mU9JLAzn24MVB5HIV3Z6uKxdkmbhlmlXflQJidrunkLvpnhl1//T3nudMp3ATVL5CL
         p6/pGIkec2WAEXcQcDRPVwi3KEGGATDarcheltpEzip5OAGbIxwhPtAcZRX8tDGa6EP0
         J2xOBF9kbsgFmBReAvQLpA9Zh7ulMqiMKo8TU7SFfWgIo9ADhF2iFu45AwYyQp+6tNp6
         kxjg==
X-Forwarded-Encrypted: i=1; AFNElJ/fO0pKGd99TsdDgRDrLBznUuYjY7bC27KaBqlbdKu10hCbMnr60/fUTsh1Ox+/0nzdQ9u/VJZYO+/EU1cXtVQ2@lists.infradead.org
X-Gm-Message-State: AOJu0YxWUDiRINpWAEJy2dbYGFmWdUQCTlihOiG29iY45OIp0z8dzCus
	hRgv6nWwrLGgZjqG0/CySq3X8DQaOrYwPyZmTciaRNcDBJpUY7Ogq/tpnL7B+/KS3K4wHyOB6pK
	GRigJPq++mg==
X-Received: from dlbpu6.prod.google.com ([2002:a05:7022:e886:b0:12c:8eb0:61d9])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:2385:b0:12c:aae:7b43
 with SMTP id a92af1059eb24-12c73b5af08mr15016774c88.24.1777156896516; Sat, 25
 Apr 2026 15:41:36 -0700 (PDT)
Date: Sat, 25 Apr 2026 15:40:28 -0700
In-Reply-To: <20260425224125.160890-1-irogers@google.com>
Mime-Version: 1.0
References: <20260425174858.3922152-1-irogers@google.com> <20260425224125.160890-1-irogers@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260425224125.160890-4-irogers@google.com>
Subject: [PATCH v7 03/59] perf arch x86: Sort includes and add missed explicit dependencies
From: Ian Rogers <irogers@google.com>
To: acme@kernel.org, adrian.hunter@intel.com, james.clark@linaro.org, 
	leo.yan@linux.dev, namhyung@kernel.org, tmricht@linux.ibm.com
Cc: alice.mei.rogers@gmail.com, dapeng1.mi@linux.intel.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, mingo@redhat.com, peterz@infradead.org, 
	Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260425_154138_089877_4AAD686A 
X-CRM114-Status: UNSURE (   9.85  )
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


