Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F3D4FF8860
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Apr 2026 17:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mqXJIn8r4IA9Gva4etcbzr/XlHSVW6Lm8pY9GKRmyzg=; b=i9s5GHAMCpAR3mBSY/lpXCk9Fw
	1j22mU4sGBbBJoI+4Axog+ODZXJn0KJmHrbcA2PHwtJFJIRnY/sCWEl2MBiqO3uaglFS0N1bRXXTM
	+zNHViRpnPQzzaJfHOeU49XWcdFRe/anZWwpmheYz1oU5Hlwn/czcuSUBaCeoXCZpzoHjccq2vhhe
	ew8R4W3nAelLDAB7oQDhN4aXsAvMZLQB3MZqxPueeE38lLzKszV0+VTOzsUQYBQR7ryHRooCqBwpl
	0FvYi477D/pIH2ykPswhxqhmKP2XhSPr6xrnEO2l+8M5Vax7adlvFooam9puqbK8c8H28hdPtRFz0
	ApgxGoEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGh7z-0000000EcCu-24rR;
	Sat, 25 Apr 2026 17:49:15 +0000
Received: from mail-dy1-x134a.google.com ([2607:f8b0:4864:20::134a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGh7v-0000000EcB0-1EH8
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Apr 2026 17:49:12 +0000
Received: by mail-dy1-x134a.google.com with SMTP id 5a478bee46e88-2d8c521be48so6138838eec.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Apr 2026 10:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777139349; x=1777744149; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=mqXJIn8r4IA9Gva4etcbzr/XlHSVW6Lm8pY9GKRmyzg=;
        b=Cq6vddVpzS1e7wQeEYPFm1XyNmBmYIzhR+KyMXDpz1Hcmfj/T/feQpSqy4prA6APnA
         sVmo/8VzQaq1g9MoHByRmB8YHMchSUMxalg5L2wnAEyA1ElgRNRPVnfSHcQfFgyXrNoo
         X3yBPCNLKv6WJvzBMxLS/CjHxuD2Y3GT0RxRHlxg2lH0ZrlpDPdbSn4EEFZclvM/D6XW
         rtpDFRgPA1B8T7OVFhLipFKoLuATE+idzdJJ9V8Nj8nRCpM+vylYzqLKRAwjwW95lrU/
         v7gxwpvKMKfsmBbHw4bmIauR0PF+hmzsZ386hicdk8NT/JdW0CfNC3xse94FDylYUNnU
         tt9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777139349; x=1777744149;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mqXJIn8r4IA9Gva4etcbzr/XlHSVW6Lm8pY9GKRmyzg=;
        b=HyE17kULL2ipO8GWwhIHRfDjFvIH1eR3xZD1NurF7eIyuUqYDL4YLpRBP1CpSit1Kc
         xaevZLPocYh/jWDe7DWGc03EG20VPVXhuzc4BB3kAw4vDFQ8ty3bugxUcXyfHu3ISU3R
         ArMnVvzf953P7UjImAPvvGdfugOp18U9Sh0R543ErvuRQ/wA6racUI1RlFSbPUR5andn
         LU72rBqnjk6Jdfq/S/yuwUABP5/7GJwM3dwzx4OsDl7C9pEbOq7mkOtIbHQ8m0c+vcW1
         ONIQVp66W1RjrgGI8+WYEi0UCAFn2VUbeESoTgksrDeCQObJdjuLt8JDr/5aAEOlpGrx
         uZ/A==
X-Forwarded-Encrypted: i=1; AFNElJ+JtoabUYfudOkdqkE7/Fty1hVtqBVJHAjdlqJhar2UR+1+A9unh3/ztqULZ+WjKjOHmt9T7eHJV3nQOu3rUrJU@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5TsvF7um/xFnDu6H6qrrbImU+W/o/Z3d/qmFk7FaXNTjIupbY
	jINN/p84OcNFME7p+nUnQ0efveyF6ISoMawymnhNZBE/obcbk8c/Pj0BhZPPTY9Uy8yk+yV1RIR
	T9EdThiuoYw==
X-Received: from dlbrh4.prod.google.com ([2002:a05:7022:f304:b0:12b:eb91:8863])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:1283:b0:128:d5bd:3557
 with SMTP id a92af1059eb24-12c73ae5574mr15608343c88.4.1777139349253; Sat, 25
 Apr 2026 10:49:09 -0700 (PDT)
Date: Sat, 25 Apr 2026 10:48:02 -0700
In-Reply-To: <20260425174858.3922152-1-irogers@google.com>
Mime-Version: 1.0
References: <20260424164721.2229025-1-irogers@google.com> <20260425174858.3922152-1-irogers@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260425174858.3922152-5-irogers@google.com>
Subject: [PATCH v6 04/59] perf tests: Sort includes and add missed explicit dependencies
From: Ian Rogers <irogers@google.com>
To: acme@kernel.org, adrian.hunter@intel.com, james.clark@linaro.org, 
	leo.yan@linux.dev, namhyung@kernel.org, tmricht@linux.ibm.com
Cc: alice.mei.rogers@gmail.com, dapeng1.mi@linux.intel.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, mingo@redhat.com, peterz@infradead.org, 
	Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260425_104911_329531_E80DFC4D 
X-CRM114-Status: GOOD (  10.26  )
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


