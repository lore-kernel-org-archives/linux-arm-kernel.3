Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82859FED3F1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 16:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mqXJIn8r4IA9Gva4etcbzr/XlHSVW6Lm8pY9GKRmyzg=; b=TSR6Dc8hx5/KV9FWQZzQR4ZXs5
	1jyvT88gGZ5uoroA+p/sc2mvhcGynUXacU+LNI0K5MrY07ax9RqKGzEZBG3skQAkjfTjruz0T6Opj
	Hwo3lK0ehQThP31jKlgmRjjiLZ4HGQ7Jyw+nTPsaEksxLBA51uY7cMjkf6DxQRpjMvW0qRpsNQi5m
	RaB6xa4jUEyP6BX1HuISqbkjuzEtfmZp+N6r0wB7P71uMR++1FJyfNE0vBuuSU4uiL7V7P2auR/2R
	tt0dXQpijrVmmMisVdFPh2JI+EIvpIoGP2GplCRqBp1GYGBxZO58wP3V+TYvKYdaKFdxpqNNHiWuU
	nddzodCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGJh9-0000000DTLD-39vg;
	Fri, 24 Apr 2026 16:47:59 +0000
Received: from mail-dy1-x1349.google.com ([2607:f8b0:4864:20::1349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGJh4-0000000DTHh-3hCO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Apr 2026 16:47:56 +0000
Received: by mail-dy1-x1349.google.com with SMTP id 5a478bee46e88-2bdf75bc88fso10401878eec.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Apr 2026 09:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777049274; x=1777654074; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=mqXJIn8r4IA9Gva4etcbzr/XlHSVW6Lm8pY9GKRmyzg=;
        b=YTbEcYdF1/3UM6FZ1VKxmkPJWe6GCrQV6ipJdfyXm43dbdZHFHMwOtL35AQT+ZA3Eo
         1ATxVneZUtUIEjMF8UYo3RQuUOXGziu5C6otoau56xb42cyn9ieqsoCTNtrCf3NnPOC1
         wRSbbyRnownyLDyf5QNwO7QE2YyVdG6x6Ye4VsZ0gjzudKpbk2bp51o50cYyRdYfcuqi
         ep7fNY6w4s1qOkYu1nw4HAfNEwk8joVNDcrGIH4bnyPDbm2zgst29E1M3tXSof1mr4XQ
         ZuJDYvFczMmG3x9bJo6HX3Bbtz4gbamiWzbQcjM6GlsJJWVciQCxTDpQFG9gtsE968nr
         T8CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777049274; x=1777654074;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mqXJIn8r4IA9Gva4etcbzr/XlHSVW6Lm8pY9GKRmyzg=;
        b=Tk/KhrDXrtD4r07NxjDn/wt0P2+IVKlkrpx2N5NyayJtFNh/a7zSLAg77XkTb6P9dG
         /TwYiJjGTgzk4vWdigJ4yOpkghSTjtV4H+xiHXpUqCWOBYHCw4nQkRlJBjez0jez/feC
         gpvu54gmE4sQkQB+QSG7xk1s2rnXBmOxRlnLUz7HTnc0jYaDJPESBsaDaZ+S3Et/bXsJ
         CLzpfgRrtytq1Hog9mszkrFcohFDkYg71EUSrX5MpbNOCt4iFN6nwp+rp0HkFb7rQZDf
         pdllCkS+Lknqknx/zqsn3kMnMJzgGM0N1leLYs40IV8yA8I9Uacm1PSlooKu2IdpiGSo
         td+w==
X-Forwarded-Encrypted: i=1; AFNElJ83hSKR05FT2+cPZtLPRKzYECjNTvzye76bDGXcC9lwHYA72Y0URfaRBFwQ4/GT8qyZyalC8+3tKL+x0JAnV37q@lists.infradead.org
X-Gm-Message-State: AOJu0Yxje6sliKsJyJv8WGZUV37FhoSZBf4y9D1N9rqGtd84YukEUyGX
	nkKzH8H9yTNeCMzmSKIksqJNan2WtP9fH9UxLH0ZclIhRFkTOvbSBT0vSy1ZctLJNu5WXkk0kn/
	6o8yfKxps6A==
X-Received: from dycrm24.prod.google.com ([2002:a05:693c:2a18:b0:2d9:8328:8324])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:3723:b0:2e2:27bb:a48c
 with SMTP id 5a478bee46e88-2e47883b6f3mr15670318eec.14.1777049273554; Fri, 24
 Apr 2026 09:47:53 -0700 (PDT)
Date: Fri, 24 Apr 2026 09:46:26 -0700
In-Reply-To: <20260424164721.2229025-1-irogers@google.com>
Mime-Version: 1.0
References: <20260423163406.1779809-1-irogers@google.com> <20260424164721.2229025-1-irogers@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260424164721.2229025-5-irogers@google.com>
Subject: [PATCH v5 04/58] perf tests: Sort includes and add missed explicit dependencies
From: Ian Rogers <irogers@google.com>
To: acme@kernel.org, adrian.hunter@intel.com, james.clark@linaro.org, 
	leo.yan@linux.dev, namhyung@kernel.org, tmricht@linux.ibm.com
Cc: alice.mei.rogers@gmail.com, dapeng1.mi@linux.intel.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, mingo@redhat.com, peterz@infradead.org, 
	Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_094754_937278_721C33E7 
X-CRM114-Status: GOOD (  10.22  )
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
index 3313c236104e..8d04f6edb004 100644
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
2.54.0.545.g6539524ca2-goog


