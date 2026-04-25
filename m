Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D6FFFF885C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Apr 2026 17:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pih4PvjlzSX23VUBfhxJgrdaziaLdcdiDaL3PE08L8Q=; b=IFfbi3bI6PEZb3ZVAxsZGXtEon
	uE7cjJlvyvyNaP2SqMXYaDRqkCgu+AtvuVAFjGqqFwOWFyJK3uf1mYLvCChXENnhpIuPybBcfKsRN
	RlBWgMNQHyLLB5qrdTs2T21VDHPX3X7WmIVTPt556JmGTAEFKLhRqhiTferX2GGcm492Q3S0oMCLI
	wo4VVoRgcrrqqjxM5/ej6JixOkfrYmpCgTSVnfXtY3SPFMviVzvPWFwF7LXerzN3I7Qz2L9h1fN4Y
	4PMFrqffpqoLGqmRM4YujKjQv/jzezLSrQY2SMOAoQrSXD3sC9mfswSqjXQjLT9ynCeXFhpI32IlL
	wMUcwlKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGh8C-0000000EcLB-2fwz;
	Sat, 25 Apr 2026 17:49:28 +0000
Received: from mail-dy1-x1349.google.com ([2607:f8b0:4864:20::1349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGh80-0000000EcDZ-3jl7
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Apr 2026 17:49:17 +0000
Received: by mail-dy1-x1349.google.com with SMTP id 5a478bee46e88-2d9da2559aeso24385804eec.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Apr 2026 10:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777139355; x=1777744155; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Pih4PvjlzSX23VUBfhxJgrdaziaLdcdiDaL3PE08L8Q=;
        b=JHl0aNI64bnAHHL1No936jMXWzdqOW+eju+iD4ApYUgywHoxQh6UdHOoZCtCQavLNW
         64FsUZRHhQB24yvqHW8VnFLAAUvXZY33Cig87JB21iyPlXWw9r8N5xjR9wHnXQoNXUWy
         /BNL2yRndsakpXcpBfrje8vEJedgvsHCe2fGRKWrrP+EgtC0NIkcGTU+3uUETUManuZG
         e5/2DKOpxOQJavu1OFCbhEu9cU6u3gaDQ3aNgr75cMnVJbG/ryCHlyyme3wF1HOgjiOI
         RXoeYUC+k7842J4YQHUyRhuMakGEs/7Hq/j2+/fesLQ1RPxSiN2paRc+j/8lI4lCLGNL
         m73Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777139355; x=1777744155;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Pih4PvjlzSX23VUBfhxJgrdaziaLdcdiDaL3PE08L8Q=;
        b=kG0moCZW8WmsbeVwxj3TLLIkuf31VlnFYWJKr7BawAWOZQ7PuUlP06eEIlxSSMTp8Q
         dqjYI+LokVR6VJobuAmMPBms5FWGLE8treDpZ3xKPEhWLEk5Q+4DJMnoFDSS/j5QDR3U
         A4FdtEH3Q1A8jfXwjSp8rcJl/IBTfBAfQcY39VvU0x8eyvZ7uurbIyRsjHTG5NNDqS1l
         u6Fcjermo5FUvyoFaASq01UT1Uuv6wNMGsVFPxQiHaT4LZUDTXEB0/AbHyXFgosSUL5M
         pAEQUKoqBPqppdoEVwxHLZk4Auv2IZVIXTuh20mYwBth0Un37hlXyoKeAa3nzFP3ygyB
         JSow==
X-Forwarded-Encrypted: i=1; AFNElJ+8nsRXUm6cbtA4HMWoqPCZkO2Pzn6fyIMr/kBzTstt2SoYzkzJGOwP8eNjPzJiPTByFbM+WuyfsXd9ufUO8Ks0@lists.infradead.org
X-Gm-Message-State: AOJu0YwHbFPkaKaKbWUjVIbTDWSwCChe3HNAAUpx+tU1sDBGtXwVMGII
	Nv1xmKgGTLCvV+GTmjNXAAGueLaDSHOpKs8fQNnjDy6n2to0ETFm8Yn5tz/Y/bgIE4lgfqc3wS6
	GW+j1o91hXQ==
X-Received: from dycnr28-n1.prod.google.com ([2002:a05:7300:e9dc:10b0:2d5:d26c:d4bc])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:230c:b0:2da:7e33:9261
 with SMTP id 5a478bee46e88-2e47951dedfmr21517858eec.27.1777139355126; Sat, 25
 Apr 2026 10:49:15 -0700 (PDT)
Date: Sat, 25 Apr 2026 10:48:05 -0700
In-Reply-To: <20260425174858.3922152-1-irogers@google.com>
Mime-Version: 1.0
References: <20260424164721.2229025-1-irogers@google.com> <20260425174858.3922152-1-irogers@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260425174858.3922152-8-irogers@google.com>
Subject: [PATCH v6 07/59] perf python: Add missed explicit dependencies
From: Ian Rogers <irogers@google.com>
To: acme@kernel.org, adrian.hunter@intel.com, james.clark@linaro.org, 
	leo.yan@linux.dev, namhyung@kernel.org, tmricht@linux.ibm.com
Cc: alice.mei.rogers@gmail.com, dapeng1.mi@linux.intel.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, mingo@redhat.com, peterz@infradead.org, 
	Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260425_104916_924166_DA8C3607 
X-CRM114-Status: UNSURE (   9.14  )
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


