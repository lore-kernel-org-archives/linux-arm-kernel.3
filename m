Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBA0DFF885A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Apr 2026 22:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pih4PvjlzSX23VUBfhxJgrdaziaLdcdiDaL3PE08L8Q=; b=tjPUHql0ntdBuoyGLfwVdlg7jG
	xehjW4zo2KWU2Z9c9+zPqHYluWr5tjEEC9JADgUJTvfhzWIuUzKdiwPZLo4prNXD0i6Cin0kXiaOe
	ERhWyuyJ0ifDkLKZyPEmkLIFxCXe0/LzZoYYR8xg83zUpk4M2yr3NKE3luMx5mG9wnTTLMRiHXhkd
	hspevsnoQ03AyrFDUkMDazbu0L5o7LrAKf1VVaeSAHRNCp2cHtY9JMaroK4Rp6laIsXCDbgFuIs0f
	f001AZYsXmbBUr636fD4+ztrYoiUrLd91rsZKbttSp//nwKZLvlbuFGM96a62/Iz7faRi+hI3IWNl
	XdeP7u1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGlhC-0000000Esum-2kuw;
	Sat, 25 Apr 2026 22:41:54 +0000
Received: from mail-dy1-x134a.google.com ([2607:f8b0:4864:20::134a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGlh4-0000000Esnj-0hcc
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Apr 2026 22:41:47 +0000
Received: by mail-dy1-x134a.google.com with SMTP id 5a478bee46e88-2ba9a744f7dso11746712eec.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Apr 2026 15:41:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777156905; x=1777761705; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Pih4PvjlzSX23VUBfhxJgrdaziaLdcdiDaL3PE08L8Q=;
        b=cxGxsTteUDQBGoCZFByM++vQtV/bW12EQNxkGCIGp8SCQzoO/fqEaNnvPf4rNHqzmL
         wtsFYOxeEHWunA2sCT9jvpJK+G6uVvCEKkImoq1EqGnDjhRtM/6LDUpO+lB/Apwnd3my
         jLCkGh4zKRE2XIsUIR1Z2uiknf/XuTLY/SfWa2oELzcHGS2+qQ5ogwHGUeJ+8CXU/bpM
         ExOd4hHEhYhnqwwcncyBiLvJIAJmiJReS3mc2HG9221M0+GX0dgYbJXlYXNhzyEr4gnF
         fmXsFKSdwP1NhFby6R0yNuE9ySvNS1cXdrI/wfvGFe9+TiePqbAC8VJ53jVr8X2WLAeo
         hVTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777156905; x=1777761705;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Pih4PvjlzSX23VUBfhxJgrdaziaLdcdiDaL3PE08L8Q=;
        b=LeNsnFB79plYIcTz7YIfufa3OVuYpGPTUqZ3q0SB4Ina0eiVoIqeXWsFYkOCxBsce2
         0ib6zFjWZ4ujWAL1J/EnZtIKnBJ+Otv3SQjucEdYa/lfnx4okAPe24C5UiBuJmqOfkeP
         wzDXjqOnxvTXA6k0fdaKTV2GLqsxR5EPhSOaBWWqzpQ8aNW0nE+rmOy7sTj81mwZR/U0
         qbNJi2LNEyqGVP2+ynZ38432IDFPasFjl8UD0PZh/yC3QFjdQTZtZj5wZJ0nwW6FObRo
         /1ZGsT0vZriQu46HNnmNFr+lnpbEv886MEqZGy8pA9wScS+AWwKaDjIS+lYi2GfP0VvE
         9rqw==
X-Forwarded-Encrypted: i=1; AFNElJ+C/M/rypz6nQ9leqa7G4gr6nhbnX/B/wrs/6uBn1Wulmh0zuMAqkjZsdIaSPpeblh5VlhyxRKKJkJ3ZXf6jPwL@lists.infradead.org
X-Gm-Message-State: AOJu0Yzc0PKeNHXNfAbzaU8GLFbbcz2tc8UkVFHfLq3+Pt5Wy/03+48+
	fs2aYTPQh3ysd4jcNznewRcLdPtG8mQgfu1t5V81SV8yMM5LJ/K/MLPtU60IiqboqGQCu7xnXhS
	lDqA+ThaVGA==
X-Received: from dybb21.prod.google.com ([2002:a05:693c:6095:b0:2d9:61d4:4d0e])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:693c:300c:b0:2d9:3616:d897
 with SMTP id 5a478bee46e88-2e478a338c8mr19801407eec.22.1777156904906; Sat, 25
 Apr 2026 15:41:44 -0700 (PDT)
Date: Sat, 25 Apr 2026 15:40:32 -0700
In-Reply-To: <20260425224125.160890-1-irogers@google.com>
Mime-Version: 1.0
References: <20260425174858.3922152-1-irogers@google.com> <20260425224125.160890-1-irogers@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260425224125.160890-8-irogers@google.com>
Subject: [PATCH v7 07/59] perf python: Add missed explicit dependencies
From: Ian Rogers <irogers@google.com>
To: acme@kernel.org, adrian.hunter@intel.com, james.clark@linaro.org, 
	leo.yan@linux.dev, namhyung@kernel.org, tmricht@linux.ibm.com
Cc: alice.mei.rogers@gmail.com, dapeng1.mi@linux.intel.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, mingo@redhat.com, peterz@infradead.org, 
	Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260425_154146_199333_F464523D 
X-CRM114-Status: UNSURE (   9.02  )
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

Fix missing #include of pmus.h found while cleaning the evsel/evlist
header files.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/python.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/tools/perf/util/python.c b/tools/perf/util/python.c
index cc1019d29a5d..1e6c99efff90 100644
--- a/tools/perf/util/python.c
+++ b/tools/perf/util/python.c
@@ -5,26 +5,29 @@
 #include <poll.h>
 #include <linux/err.h>
 #include <perf/cpumap.h>
-#ifdef HAVE_LIBTRACEEVENT
-#include <event-parse.h>
-#endif
+#include <internal/lib.h>
 #include <perf/mmap.h>
+
 #include "callchain.h"
 #include "counts.h"
+#include "event.h"
 #include "evlist.h"
 #include "evsel.h"
-#include "event.h"
 #include "expr.h"
+#include "metricgroup.h"
+#include "mmap.h"
+#include "pmus.h"
 #include "print_binary.h"
 #include "record.h"
 #include "strbuf.h"
 #include "thread_map.h"
 #include "tp_pmu.h"
 #include "trace-event.h"
-#include "metricgroup.h"
-#include "mmap.h"
 #include "util/sample.h"
-#include <internal/lib.h>
+
+#ifdef HAVE_LIBTRACEEVENT
+#include <event-parse.h>
+#endif
 
 PyMODINIT_FUNC PyInit_perf(void);
 
-- 
2.54.0.545.g6539524ca2-goog


