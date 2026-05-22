Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0244ACD4F3D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 22:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RZckQ+HwuCc0wRxxb6eUJU/ilfr6Pz3oy2PsBDZSEIc=; b=woOD8nzGHK6b+xgZEG7l2IdVK0
	gw76LZoAR3HvcWQoJ7NSkHS3CsZWZmRcexgNX8edTCESRowzPQFNm/ow5jzkys1/tbfy+CYYBb0Dp
	B6G7Ue9TEGQQYxT+g5p37B0Y4rNGJcwpcbMyDiqUr1gnV/iW3XYxu5OC+EdQF9UBdha3LaYVXZx3P
	wtNAFkRs9JdZ1KLCXyZtXhvdoqG+tHDK2zI1QGGswNJf0lNoXKc8taCLyGPjEkehCp3VyfSGhvSHU
	QqgjW7AWrVxrH6e5GGVKbRYQYFy3QQ0oFEp4ECC7mS3ttA2k5MGAOZBc248Q0gDi5AWudDMONGR/E
	6RNmCnkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQXzM-0000000C2h9-0dJ8;
	Fri, 22 May 2026 22:05:04 +0000
Received: from mail-dy1-x134a.google.com ([2607:f8b0:4864:20::134a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQXz7-0000000C2Vy-0mI6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 22:04:50 +0000
Received: by mail-dy1-x134a.google.com with SMTP id 5a478bee46e88-2f3eb8f3419so7890326eec.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 15:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779487488; x=1780092288; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=RZckQ+HwuCc0wRxxb6eUJU/ilfr6Pz3oy2PsBDZSEIc=;
        b=OSh/dF86lJI+0iaP77Y7mn0p0G1k8z9WRDom2M2FgC38T6oQyUl/tTkLvNXDPzcEpb
         Pw+sSljt54BRFVpTlSp1AoCk9BdtC/4xkMm3h5MJ/4+3YCxD4CYXdjBp+O5obNYco0Ib
         ezo0kVruz0w4WTz7/QWWJfzbdOcTzEFAeavQQKhENENMUh16oG/vViXVCadhaQgDnzbN
         et4+1xSxdOldLX2A+qxI/zoLXSnWl+tXHsBc9xD7xHTSIYwwjupS6ohgdXUFLlbroHic
         YSg1d4VIxd0A0XlAatLix8j6+t3fUaaQNM1euZOgNqetA3GDrE69Wc0woGf7ShETgqRg
         6X9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779487488; x=1780092288;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RZckQ+HwuCc0wRxxb6eUJU/ilfr6Pz3oy2PsBDZSEIc=;
        b=PmTPUIxI5Qr44hitrrLL9I0GQdpgqMLH1ZWX2IKC7RCgGhUkGNqv3gZOgmhVeFVEDq
         E0NNxpA4gh39IOhYhOoADlQCEuSXRJ/osXsnCcMGEjQOa4ELMO83B3DT2yCmyBa7XvfO
         7u2g+7R+ciBFnhfbYpNydHmAIM6RSxjmg6HfzBwMKogwucugoW4RIOCb5MCUtioxjKge
         HxBMdiIGbBn5vANtjnhA8ZVy91W/ay3uKotYb7+5NysrG6Je0FdI+9dDc7zNsbE1ZNXQ
         PIa1ptT/ZTflDmdgVrzjFL4UOVWDbbF7rEA41mU98mZ/Padr+GvKk7f8gycrFXByAcgS
         Mzfw==
X-Forwarded-Encrypted: i=1; AFNElJ99CimfZzzfcnnCzURs7PlYu55UEgoCirfQPt9/zxhlezYER/fezr5DlylhSejBRqztaFSkPK5yN78N1TmKItR7@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6axA3mQ7ck4RxudbboHip50NXTcKFm5Zjtwe61KX3f0fM5+vg
	tHxauIRBrqjTcnWfKzAGnqGmI497TDZfakhcsIEGc+IExepFGGCHZGsgmonXNfhL+xbwMUm+DUc
	OvQIbIAvdOw==
X-Received: from dyaz19-n1.prod.google.com ([2002:a05:693c:6393:10b0:303:98b0:efec])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:650b:b0:2b8:5159:eca5
 with SMTP id 5a478bee46e88-30449024b3bmr3046039eec.14.1779487487711; Fri, 22
 May 2026 15:04:47 -0700 (PDT)
Date: Fri, 22 May 2026 15:04:15 -0700
In-Reply-To: <20260522220435.2378363-1-irogers@google.com>
Mime-Version: 1.0
References: <20260428071903.1886173-1-irogers@google.com> <20260522220435.2378363-1-irogers@google.com>
X-Mailer: git-send-email 2.54.0.794.g4f17f83d09-goog
Message-ID: <20260522220435.2378363-5-irogers@google.com>
Subject: [PATCH v9 04/23] perf script: Sort includes and add missed explicit dependencies
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, namhyung@kernel.org
Cc: adrian.hunter@intel.com, alice.mei.rogers@gmail.com, 
	dapeng1.mi@linux.intel.com, james.clark@linaro.org, leo.yan@linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, mingo@redhat.com, peterz@infradead.org, 
	tmricht@linux.ibm.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_150449_235718_68E69FA5 
X-CRM114-Status: GOOD (  10.86  )
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
index c0918006e0ab..e330ae7f725e 100644
--- a/tools/perf/builtin-script.c
+++ b/tools/perf/builtin-script.c
@@ -1,75 +1,78 @@
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
 #include "util/unwind.h"
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
2.54.0.794.g4f17f83d09-goog


