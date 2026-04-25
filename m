Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E64EFF885A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Apr 2026 22:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mqXJIn8r4IA9Gva4etcbzr/XlHSVW6Lm8pY9GKRmyzg=; b=HL7UsU2tAV7YkAZJLnMaQUGxyn
	FVJz2i2jqrKVMgbb0ZH7waGOnq38F9QHEebw5G+2stJKuJb6ElUwXjNP/NWXlBFkNjkeI3s/PXknO
	q6gEhhQZzyg0WE0rdGjLoo06KT2XK1AlRoMJt5YzdjYruWVRdiBMlwpaoYixdU6Uokk3Ed6V6h1BN
	6UF7UyLS2Wn+JYQrzusgBinGcx1sEZ4JUt7HzJ1KSg98dZ2thDr4cY+2ltNhVhj3ZJ3h76IqI3WrS
	GlWauE+94DiZxjtQsiDqyJ1h0zNP7LXgCYsy1qg/78Bc0vun01zo+UwCkJJQEfNJkdOhgw/Lk5jT2
	HpyE2Ysw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGlh3-0000000Eso3-450K;
	Sat, 25 Apr 2026 22:41:45 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGlgy-0000000Eskk-1WqZ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Apr 2026 22:41:41 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-2b24a00d12cso91120655ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Apr 2026 15:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777156899; x=1777761699; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=mqXJIn8r4IA9Gva4etcbzr/XlHSVW6Lm8pY9GKRmyzg=;
        b=wgFqSlyboN97U/o3Lpc4gTT35QmvvITuP3XBSpAICPepSD0wuoXsZJwlgBugafF0du
         EB3NBMmYLKm98ffmxFQQ09/A+BnsIrSHfeiitU3IKK1f43vU+Sr30c4F6/NR+sRlSkWE
         1ObJCjQvhXIHZjaBK4mi/29v+4nbOoIlpygYxmqQb5Vga0MTihF1U4PkJYIpY92P5ZPX
         PkUw8A1i0IW2eQL3Lxwe5EAGN5qvZeJUp5hRWxx5Sy7PaBK8XCMWXB/WbHYEOVW/7yPY
         bmzLMU+9qBYmy1/xS343VG1n3mKwVjFCAkExU9zRRRf8TOKOMNLRkU7qTX+T0sUi8zeX
         KUuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777156899; x=1777761699;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mqXJIn8r4IA9Gva4etcbzr/XlHSVW6Lm8pY9GKRmyzg=;
        b=iGLApRZiyg8snc4CNPeA+xnnGoyCVv3UAbtbhMKibjjK+npRjmOkKKs1f1nR4aocXP
         oobmurPfihLJ/oeye560TCN6ZnYiNNdg60BcMV0+5wcIxWzkEPX5nZth7Ouo9Tnh2c5f
         K/8KPHevrbhyMhiyOzkmbmU47tCfRzr/fy/Pj8crC0w71GiwDRxESDIvvNa+wkHxoggr
         ooENP3Jdrp4INmunr9rlHkYUVAD3QJmgXaWsSJEKtckx86zaUvP3hgvGuhRUZrFklOqV
         NyoTWzut0fWSIVt1RQ9Ye0nMJkLhHUkQLdyNT5MOJit9rjzdbjI5Z/jeceRsOQWHcudn
         1ThA==
X-Forwarded-Encrypted: i=1; AFNElJ+YcEGfqWHi2U9MmQJbOx0hzp63Yz3O8yz/0i3kI3+TH8zJ7xjXrqaLgV7RtTeDU75+wclSXCsi0cTQtWqQoRwR@lists.infradead.org
X-Gm-Message-State: AOJu0YxG1W0PwFnr5ikREfXXmmqPY+mN9sqLalU99fviWZc1ZIDhDEwh
	KtOVUQX5pVQhKiocI8L3ZmLMLcdyeo7Q6OcUDepo6Gl7yuxwGUEJoE8h5hQOuadm6jdluDWbl7F
	2OBHDWNS/Og==
X-Received: from plbmt13.prod.google.com ([2002:a17:903:b0d:b0:2b2:5092:b66e])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:ca85:b0:2b2:5491:e32f
 with SMTP id d9443c01a7336-2b5f9ebd9fcmr260384085ad.16.1777156898574; Sat, 25
 Apr 2026 15:41:38 -0700 (PDT)
Date: Sat, 25 Apr 2026 15:40:29 -0700
In-Reply-To: <20260425224125.160890-1-irogers@google.com>
Mime-Version: 1.0
References: <20260425174858.3922152-1-irogers@google.com> <20260425224125.160890-1-irogers@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260425224125.160890-5-irogers@google.com>
Subject: [PATCH v7 04/59] perf tests: Sort includes and add missed explicit dependencies
From: Ian Rogers <irogers@google.com>
To: acme@kernel.org, adrian.hunter@intel.com, james.clark@linaro.org, 
	leo.yan@linux.dev, namhyung@kernel.org, tmricht@linux.ibm.com
Cc: alice.mei.rogers@gmail.com, dapeng1.mi@linux.intel.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, mingo@redhat.com, peterz@infradead.org, 
	Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260425_154140_399473_11E4E40F 
X-CRM114-Status: GOOD (  10.16  )
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


