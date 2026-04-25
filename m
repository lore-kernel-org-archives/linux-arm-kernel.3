Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDB1BFF885A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Apr 2026 22:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PdL5J++jQFS0WI1Hq1Y43G2dZXRWh1hnOIKdQUKwLiY=; b=f82tQascDUKDaXGg2O/KVJ4mpH
	EYo4umksy1MM1bYGEbUcTMPna4LKH+G/QFGcJ1kIzRbd7Gao5L51ecggCTyvPYD+VqXrPLvY0Et5L
	DGz2vL+RGhwTUxCHcEhDvLb6wxErhEbjfs5Oeco1tuKzzi41NcwUov3B3ig6e5QwHtLn8pYzYrTVQ
	uY/FMDp/eYzQ375ysj0Sw/h33JVRny+9kyeTvcB13CDl3HbEsG2hsj0DJtjfoKSmStCMQCl2N6nh5
	9wDxX2uRQZ4kRYwZlJp/rtEXCzKz4Be8xpoeDamqjfOQVrSu/T6RtobkZL5fsu23Eg6izdnrA1d4f
	yXWS2dUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGlpV-0000000Ey1j-2zGc;
	Sat, 25 Apr 2026 22:50:29 +0000
Received: from mail-dy1-x134a.google.com ([2607:f8b0:4864:20::134a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGlpL-0000000Exsg-1Zj7
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Apr 2026 22:50:20 +0000
Received: by mail-dy1-x134a.google.com with SMTP id 5a478bee46e88-2eaed3d96d7so860323eec.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Apr 2026 15:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777157418; x=1777762218; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=PdL5J++jQFS0WI1Hq1Y43G2dZXRWh1hnOIKdQUKwLiY=;
        b=CUw0LD/FHID4o0qAtXq8+XiunDR27GeJk9DM17n76lDSP3d0yBtxnXu+DttTsTSLjv
         xDogYapeE4ftGO0I60OwoMK9WcXuy8eXTdb5ccl1jo9CmFE4ossi1vXT8WZCSipC5sYk
         C/1P0idDs1721Yqcu2cfe9+MljrDxr4bxAJFi7ctojSPN82SCOzT6gSuOLYVn2W9gloe
         V8q2LMRD28NgUwsbzPYr0GnPX60oz3F8SeOC3Cye7HCC1HCqlljMkp0aZaNhXMr+qF4P
         oR4DC6B4LKmZjMrRe3pfl+r2QXGKRz97zNYctu4KhdR2FNv3s9JUZcpwdEaQhCt2bW4C
         pPEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777157418; x=1777762218;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PdL5J++jQFS0WI1Hq1Y43G2dZXRWh1hnOIKdQUKwLiY=;
        b=cvAlOT5pfzaKONDt/ZaYOXuUzEq1iNOdjKj+OSENt2Z83yoXfBs4wxJqnYBKKjMeen
         a15LQBqnWkc0nnOCrMu6Ot3dsLk2852VB/DidDYZhCx4JERrX2Y2cfr0tlPdB3CamO1j
         BfK8SVtrGqul0Qc873pnK9XEE13fTHOh5uGPS/8/iHYHOZrpNn1pCHHbM8IDkAGB2hb7
         3kjVDuAOx8DXecYawU7Hfc/G5A8f1SkZiLezFtecMGLgNK6sG8oE0VPlOR2gAjN7/4on
         9aCCgRR9iw7EhCHLSu1Zn8fSmR5naEtTvs5Az+P9avmlMTqXNJ8KlLAB3r2Kcoo8CU2e
         F0SA==
X-Forwarded-Encrypted: i=1; AFNElJ/GI9p4xNYyfD4s4BIi87uSzlbkh9acbWV3z9Jb+LUAFcKlz66feMY6J8gXmMpsZQx/MZPMQv2eD+mqfx3U0smq@lists.infradead.org
X-Gm-Message-State: AOJu0Ywe7wkVygKeVRTlApc2W6G+U5a5TXeGX+zhZLG2p5zHIwpGjTFu
	SNHmr2masVEz8cmDwa2mbwr5ZIS7zj0kZA64cFf4S9555Kwa4dX9zVFdUNbEjb59NkljncsRrXT
	GzGsStt5Rbg==
X-Received: from dybzy3.prod.google.com ([2002:a05:7301:e103:b0:2df:af:8fde])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:fd09:b0:2da:d4b4:c85a
 with SMTP id 5a478bee46e88-2e464dad10cmr17831870eec.11.1777157417586; Sat, 25
 Apr 2026 15:50:17 -0700 (PDT)
Date: Sat, 25 Apr 2026 15:48:57 -0700
In-Reply-To: <20260425224951.174663-1-irogers@google.com>
Mime-Version: 1.0
References: <20260425174858.3922152-1-irogers@google.com> <20260425224951.174663-1-irogers@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260425224951.174663-6-irogers@google.com>
Subject: [PATCH v7 05/59] perf script: Sort includes and add missed explicit dependencies
From: Ian Rogers <irogers@google.com>
To: acme@kernel.org, adrian.hunter@intel.com, james.clark@linaro.org, 
	leo.yan@linux.dev, namhyung@kernel.org, tmricht@linux.ibm.com
Cc: alice.mei.rogers@gmail.com, dapeng1.mi@linux.intel.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, mingo@redhat.com, peterz@infradead.org, 
	Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260425_155019_412695_68BA171C 
X-CRM114-Status: GOOD (  10.43  )
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


