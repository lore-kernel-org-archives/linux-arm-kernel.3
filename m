Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70FB5FF885C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Apr 2026 22:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PdL5J++jQFS0WI1Hq1Y43G2dZXRWh1hnOIKdQUKwLiY=; b=PS4W8S70nUELd3miL76uOwtgLu
	6oe4XIapkIoyv7Cskhp/rELzjzh3kZfypjR8SlwMglmajEl96SLZoz1JV+1KT4GgFHtVaVphwiKse
	iz5Q8b9DhcktGTuuZUFgTSUZf7KaKzf+18ACAV3Gy1Dp3+EFrJvY9HUB3XOw5Vz8vOfjzKovobm9u
	iyC6Z7L654oMiu6kW1ZOqDod4jX2v3YfhZU3ZCLr7qnyLKnDNBBH9HutVV1I6pILWjnpfufkALAy6
	J+sZR0/xlwfXiesevtLX1d19OW2ItInDVYX9VPLLKeyRC39GVi8B6QOrVM1a10cxrBsHogu79WVjB
	yiqkopew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGlh4-0000000Esof-1Eo4;
	Sat, 25 Apr 2026 22:41:46 +0000
Received: from mail-dy1-x134a.google.com ([2607:f8b0:4864:20::134a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGlh0-0000000EsmC-0GH3
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Apr 2026 22:41:43 +0000
Received: by mail-dy1-x134a.google.com with SMTP id 5a478bee46e88-2bdf75bc88fso11621926eec.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Apr 2026 15:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777156901; x=1777761701; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=PdL5J++jQFS0WI1Hq1Y43G2dZXRWh1hnOIKdQUKwLiY=;
        b=CmzFLLhnAiETokf4RbSWld6Lgkz/4H4pr/EbI5E/V2GQNwzecaVQkrN2C0Zrz3BKU0
         /S7SZCDpvYz1B1+GBm7DJfyM3+WqcZGKe8i0PCyH8y6GxemDiiU3p5Tpitlo7dxunF5o
         T+0bQETKjC1BKx5XCpT87dQVK6m+d+iypCcOnXKQU0nrgVoe5uURvCKNjyVF2zEgElDK
         fATVztf6AncbwVo0zHgC6aessP5cpFEnYyXtLfGsuBgTc6H5t/PXYu27KVurlW/RXgqa
         ExyfW35esiyShuzg8pn7Jopvu4mVUZEAKuiNy1yXGRIMn4dVJU7cgtyPcrOCTnpe7TdM
         JWHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777156901; x=1777761701;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PdL5J++jQFS0WI1Hq1Y43G2dZXRWh1hnOIKdQUKwLiY=;
        b=dTuvYOpcjFAKxJypZs1f/iDHDnrCQ1HetdUFMmlXglu0Ma8H5F5u2pPpC3vuIEpppU
         D3cZa8RFSj/JArJIFLA17HZ5UfVblQje7zUqqYDpKkD5lMB5PdAkfQXqyFicE2m6pXdo
         9oubVGWvdYBpj0SmM2u1SsMs0B9nP5KHsD4nsiTUrmuAKx1AuTiwwAJIisaD/DP+LGma
         sle/lMgkFlID3Ns5Ob4mqb0NbFmRvtwDEpDEGjSA37n6NDaiCh+WD90+o2PGyB//5GWe
         rek+qtys/TZXE+r1GfhF0946YFZvGKBJHpBbPF1zKieBAEw5rarjbQAcsnNzP8VA2+4l
         6Ixg==
X-Forwarded-Encrypted: i=1; AFNElJ/nQBfJS4dKhHvibJUnRL5Meg0mGBi9sddVrE5lUqArkoafhr0hFputfzoUWiMvWvQumwKGkvl8oJrvcVu020j1@lists.infradead.org
X-Gm-Message-State: AOJu0YwNSNNpXVHHupcb9Fyvo3Q6aFwHJEceRCd0p4R2p60I7PAVHXVI
	yGcmVMSR4SWlbaSZ7siEYkCs4Vg/GLGynswMgvQWxcwhUK8xbqdD9fnhBB+AmtPdd3XuDeU/tFS
	DQxBYlAeF7g==
X-Received: from dycns6.prod.google.com ([2002:a05:7300:f786:b0:2df:c53c:24a5])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:748f:b0:2e0:909a:b9c
 with SMTP id 5a478bee46e88-2e478839eaamr19408597eec.15.1777156900661; Sat, 25
 Apr 2026 15:41:40 -0700 (PDT)
Date: Sat, 25 Apr 2026 15:40:30 -0700
In-Reply-To: <20260425224125.160890-1-irogers@google.com>
Mime-Version: 1.0
References: <20260425174858.3922152-1-irogers@google.com> <20260425224125.160890-1-irogers@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260425224125.160890-6-irogers@google.com>
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
X-CRM114-CacheID: sfid-20260425_154142_118556_A6368B8F 
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


