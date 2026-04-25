Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4031DFF8864
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Apr 2026 17:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PdL5J++jQFS0WI1Hq1Y43G2dZXRWh1hnOIKdQUKwLiY=; b=xqW0Xff58Onj9FSBCWB60I40XD
	lMBJHGXnL4amp4g4cTCiJ0H0nzhftbB9L2ANMyEvsROGQv0gwfWVyHRL6+zyca+AHh6cTQI83b0yK
	ZZghQWJLVKs1WyMwsfkxGAIQXERj9SLh8hUTlmLLjTY+WoqFSNg/VuxeRUcc253XdIo7uZio55YY1
	/xznpvd/SUDXm/w6pEHeChf4QR5yri61WP45b7QdVMrFn2+ubTe1Og3oqa5vk/pAAzAk+kFzAQExV
	rLvnenxrqv2cWPU7Cq4aM3Mhl7arHHnmiYwT+iw+cZ4X6jZAjheryqDwlvKwa97QiidXMQHx+dpnB
	0PKses4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGh7z-0000000EcDD-3NLR;
	Sat, 25 Apr 2026 17:49:15 +0000
Received: from mail-dy1-x134a.google.com ([2607:f8b0:4864:20::134a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGh7w-0000000EcBd-2YHI
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Apr 2026 17:49:13 +0000
Received: by mail-dy1-x134a.google.com with SMTP id 5a478bee46e88-2cc75e79b97so24050357eec.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Apr 2026 10:49:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777139351; x=1777744151; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=PdL5J++jQFS0WI1Hq1Y43G2dZXRWh1hnOIKdQUKwLiY=;
        b=RHgzEA9wkKMa7O+IQ5ES6HuK9iqNVdMWYXyvJ90hj7VFxt95Zd1CJRTEmlSvm7jK5k
         2KAp4xOJBLmcWYpXOnmQuwzeUVTf81b+uyBTNDV3eQgjn8gh/GRAy8owHt1CPR3wWZQK
         fztslbyVZnEr1BJhNlU9uk+8qzklWMk7S4hDrDV3JlFFpmHh/1+vYFKCWchTu/SPqhJ6
         5W4wULY2ksRJYXdDGRXl9xwpcMrNgXQo2Ba0AcsiMxpkj99KUyg2V0WV2v77i4k2B4J/
         FLItq8Y6lDFOmBMsPySxOwg1C0fvDdjGSgsNIRAtX276ExdL4ZDItMEccyqnSn7dbJGd
         VNDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777139351; x=1777744151;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PdL5J++jQFS0WI1Hq1Y43G2dZXRWh1hnOIKdQUKwLiY=;
        b=kuRSXToHkYQ9NteHImNA6O3WJkKo67fDtd6K7dsA6UFvr7GF41lnO5hQBjGttVkkqb
         Xh4zyDo3MHuAmxam3VUv1cXWf88wWAHK8Rfe9lNOnf0UqlbzaIvaaoMwxhvok9jmR6XL
         6w33rj30hDaHujppI0FnCzeodjPE5OxX/IiAP5PzhE3Id19Ssy3F0mg90VGOyWKc9Izb
         Vgvz+yVbhV/dThd9TWTlMZTn54JfoG6R0ZIC9nCffvbYE1z13SYh5kxwA7YruinUganU
         q9kOJk9DpLn2Z5hyASVM85IJ8lrEbqa7+RBuI99FMyL15AGXl8EJdbisgVWtDowe5me8
         7kDw==
X-Forwarded-Encrypted: i=1; AFNElJ+BfUUVLh2DCR4P1MSr+UdxRMMeGr6F3i/x5OQsHVmHVKkAHnWu0Gug2FoPRx5LrBIv7w3lhxsylsa4yPrGGAgN@lists.infradead.org
X-Gm-Message-State: AOJu0Yx07ov4TbspEJQYSO+hAW7fr6vMrKK3nnXonmaWSbXckLAv4/jJ
	apXKPJ/8291E2+ACcQVaou7QPf1koW2bWDc2ygVnLs9lJxN+XCiAQB8LEOMxDEPo7hVwYABqA6P
	LewphrjSIbg==
X-Received: from dybbs6.prod.google.com ([2002:a05:7300:a206:b0:2df:75ae:2719])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:2392:b0:2ce:f3d7:221
 with SMTP id 5a478bee46e88-2e478a2f29cmr22827355eec.17.1777139351325; Sat, 25
 Apr 2026 10:49:11 -0700 (PDT)
Date: Sat, 25 Apr 2026 10:48:03 -0700
In-Reply-To: <20260425174858.3922152-1-irogers@google.com>
Mime-Version: 1.0
References: <20260424164721.2229025-1-irogers@google.com> <20260425174858.3922152-1-irogers@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260425174858.3922152-6-irogers@google.com>
Subject: [PATCH v6 05/59] perf script: Sort includes and add missed explicit dependencies
From: Ian Rogers <irogers@google.com>
To: acme@kernel.org, adrian.hunter@intel.com, james.clark@linaro.org, 
	leo.yan@linux.dev, namhyung@kernel.org, tmricht@linux.ibm.com
Cc: alice.mei.rogers@gmail.com, dapeng1.mi@linux.intel.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, mingo@redhat.com, peterz@infradead.org, 
	Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260425_104912_644282_D165AF67 
X-CRM114-Status: GOOD (  10.53  )
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

Fix missing #include of pmu.h found while cleaning the evsel/evlist
header files. Sort the remaining header files for consistency with the
rest of the code. Doing this exposed a missing forward declaration of
addr_location in print_insn.h, add this and sort the forward
declarations.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/builtin-script.c  | 111 ++++++++++++++++++-----------------
 tools/perf/util/print_insn.h |   5 +-
 2 files changed, 60 insertions(+), 56 deletions(-)

diff --git a/tools/perf/builtin-script.c b/tools/perf/builtin-script.c
index c8ac9f01a36b..853b141a0d50 100644
--- a/tools/perf/builtin-script.c
+++ b/tools/perf/builtin-script.c
@@ -1,74 +1,77 @@
 // SPDX-License-Identifier: GPL-2.0
-#include "builtin.h"
+#include <errno.h>
+#include <inttypes.h>
+#include <signal.h>
+#include <stdio.h>
+
+#include <dirent.h>
+#include <fcntl.h>
+#include <linux/bitmap.h>
+#include <linux/compiler.h>
+#include <linux/ctype.h>
+#include <linux/err.h>
+#include <linux/kernel.h>
+#include <linux/stringify.h>
+#include <linux/time64.h>
+#include <linux/unaligned.h>
+#include <linux/zalloc.h>
+#include <sys/param.h>
+#include <sys/stat.h>
+#include <sys/types.h>
+#include <sys/utsname.h>
+#include <unistd.h>
 
+#include <perf/evlist.h>
+#include <subcmd/exec-cmd.h>
+#include <subcmd/pager.h>
+#include <subcmd/parse-options.h>
+
+#include "asm/bug.h"
+#include "builtin.h"
+#include "perf.h"
+#include "print_binary.h"
+#include "print_insn.h"
+#include "ui/ui.h"
+#include "util/annotate.h"
+#include "util/auxtrace.h"
+#include "util/cgroup.h"
+#include "util/color.h"
 #include "util/counts.h"
+#include "util/cpumap.h"
+#include "util/data.h"
 #include "util/debug.h"
+#include "util/dlfilter.h"
 #include "util/dso.h"
-#include <subcmd/exec-cmd.h>
-#include "util/header.h"
-#include <subcmd/parse-options.h>
-#include "util/perf_regs.h"
-#include "util/session.h"
-#include "util/tool.h"
-#include "util/map.h"
-#include "util/srcline.h"
-#include "util/symbol.h"
-#include "util/thread.h"
-#include "util/trace-event.h"
+#include "util/dump-insn.h"
 #include "util/env.h"
+#include "util/event.h"
 #include "util/evlist.h"
 #include "util/evsel.h"
 #include "util/evsel_fprintf.h"
 #include "util/evswitch.h"
+#include "util/header.h"
+#include "util/map.h"
+#include "util/mem-events.h"
+#include "util/mem-info.h"
+#include "util/metricgroup.h"
+#include "util/path.h"
+#include "util/perf_regs.h"
+#include "util/pmu.h"
+#include "util/record.h"
+#include "util/session.h"
 #include "util/sort.h"
-#include "util/data.h"
-#include "util/auxtrace.h"
-#include "util/cpumap.h"
-#include "util/thread_map.h"
+#include "util/srcline.h"
 #include "util/stat.h"
-#include "util/color.h"
 #include "util/string2.h"
+#include "util/symbol.h"
 #include "util/thread-stack.h"
+#include "util/thread.h"
+#include "util/thread_map.h"
 #include "util/time-utils.h"
-#include "util/path.h"
-#include "util/event.h"
-#include "util/mem-info.h"
-#include "util/metricgroup.h"
-#include "ui/ui.h"
-#include "print_binary.h"
-#include "print_insn.h"
-#include <linux/bitmap.h>
-#include <linux/compiler.h>
-#include <linux/kernel.h>
-#include <linux/stringify.h>
-#include <linux/time64.h>
-#include <linux/zalloc.h>
-#include <linux/unaligned.h>
-#include <sys/utsname.h>
-#include "asm/bug.h"
-#include "util/mem-events.h"
-#include "util/dump-insn.h"
-#include <dirent.h>
-#include <errno.h>
-#include <inttypes.h>
-#include <signal.h>
-#include <stdio.h>
-#include <sys/param.h>
-#include <sys/types.h>
-#include <sys/stat.h>
-#include <fcntl.h>
-#include <unistd.h>
-#include <subcmd/pager.h>
-#include <perf/evlist.h>
-#include <linux/err.h>
-#include "util/dlfilter.h"
-#include "util/record.h"
+#include "util/tool.h"
+#include "util/trace-event.h"
 #include "util/util.h"
-#include "util/cgroup.h"
-#include "util/annotate.h"
-#include "perf.h"
 
-#include <linux/ctype.h>
 #ifdef HAVE_LIBTRACEEVENT
 #include <event-parse.h>
 #endif
diff --git a/tools/perf/util/print_insn.h b/tools/perf/util/print_insn.h
index 07d11af3fc1c..a54f7e858e49 100644
--- a/tools/perf/util/print_insn.h
+++ b/tools/perf/util/print_insn.h
@@ -5,10 +5,11 @@
 #include <stddef.h>
 #include <stdio.h>
 
-struct perf_sample;
-struct thread;
+struct addr_location;
 struct machine;
 struct perf_insn;
+struct perf_sample;
+struct thread;
 
 #define PRINT_INSN_IMM_HEX		(1<<0)
 
-- 
2.54.0.545.g6539524ca2-goog


