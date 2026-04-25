Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28F81FF8863
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Apr 2026 22:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RL6gbA3yHwRjF7ykSQ2dEvMc7Axg6yuH3FzRoVTsCT0=; b=M3mWKAo03+mzfSUGckXOuhTT80
	xfF6slR+MllVcJH1MZt2NVeSqVmfRUXNUpaMNKl9EX3lsZV8l/dX70tAJzELP/Q/rUngVLheeEGh9
	qZCEgTrLJle8RQOWxkDyMl4HLTpTYzWC2sYgNGmEyKZkm3h9kmTl7YcsOsJa/OSPttLMRA7VzP93E
	b2Au4Hft9OYC21plf/+9SqSUaNyCyHylZZMtrIor0tQ7/zi4UkY4Z3CU9JvK7OzYjFy5HdGgxUtQr
	jONRa6yWTmfqUyO1CQfHYFgvABfY1i80ctIQX069R2pHdm+m0MxdeYLT68RU/dRMmyZxOYDn0U3Ht
	AlmmreMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGlpN-0000000ExuB-06W1;
	Sat, 25 Apr 2026 22:50:21 +0000
Received: from mail-dl1-x1249.google.com ([2607:f8b0:4864:20::1249])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGlpG-0000000ExrB-23q7
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Apr 2026 22:50:15 +0000
Received: by mail-dl1-x1249.google.com with SMTP id a92af1059eb24-1270dcd11c1so5627234c88.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Apr 2026 15:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777157413; x=1777762213; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=RL6gbA3yHwRjF7ykSQ2dEvMc7Axg6yuH3FzRoVTsCT0=;
        b=T0XAaUuSEaey9CuEKREt+PAnR4tnbAVw2EdRx1KBFLmU0CJmKXoP984KRwFcxlu6TN
         0gkoyzgtOQqVbD68oUDGkqD6yQ2PIBHzMk8UxQLw1OY8YT/dcR0cnPOWjWQ+z9WwfNF9
         NZNWFw/XjO3+U2V8E6fed2p1zQxLujgbhlNn0gYeZufDkSkgRvTYeCEXeIM/8w1DZ056
         jt5DNAjTP84iZ07wQP4GNWWJhGw9ISPkVkheW0V9KUTXa8+lFs9CGEWuwcUUrQhbNx/r
         cXz41Nq8A87ttKPAf5QcnWrryejCWFJW+gjDtX8+iy/8HP21TN/Yoro5E98klJHuOliB
         X2fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777157413; x=1777762213;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RL6gbA3yHwRjF7ykSQ2dEvMc7Axg6yuH3FzRoVTsCT0=;
        b=Y3wL/g1QKE51xAv4DfyM0wRCjidSZu7ZlZ1dciBbswL0i01DLN87ntU7Y0wP9qfsGX
         QJ80d7O2KaD+8u23f4Bu7ejx164wxxW6rGvdqB4SYMyrdcz4h+b3Kl8Wl4waPV9DX21Q
         xEWfH0zs9dMdZY/ADnMGVUeWMVf8t+zagDHGVD0FURBhp+iNIW2DYxIGbi5Fe4Lyx167
         hMdxCGnWMSRWknaVFrrrInq9WjoHw/rg3MotVt4jNMNDBp/LmpUIDHCRYmzXxH2VL2Rd
         NcAAAnpY6LzY+EcjyKcqhj8kD+JZDcH9DeIvP6VuS3cHvR4I40TSXmo4nV4WGWz5GxO5
         rvpw==
X-Forwarded-Encrypted: i=1; AFNElJ8Vj0NjnGeSO1IZ/nb9H7q7WrAyhWtNVOLY1uD/BtXk69mswBItQ/Qg3j6mijlFvnnLA4hT5c7el/fUpifrSCHJ@lists.infradead.org
X-Gm-Message-State: AOJu0YyvAUAZo37zSPySRv+xiHEk27DprJJJkFAGZGeZUD/Y3bK+5q+1
	JCQOKEgd+IsGisS1e8zw2TqTREEKBHJx59pbmOQbazlzQaFMtqeXW9KEHZd7sSnQR9HeFUNIWMn
	F7+l0G96W1A==
X-Received: from dldnz4.prod.google.com ([2002:a05:701a:ca04:b0:12c:91ef:91f4])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:6981:b0:12c:856:ddcc
 with SMTP id a92af1059eb24-12c73fa3c9amr19853823c88.27.1777157413166; Sat, 25
 Apr 2026 15:50:13 -0700 (PDT)
Date: Sat, 25 Apr 2026 15:48:55 -0700
In-Reply-To: <20260425224951.174663-1-irogers@google.com>
Mime-Version: 1.0
References: <20260425174858.3922152-1-irogers@google.com> <20260425224951.174663-1-irogers@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260425224951.174663-4-irogers@google.com>
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
X-CRM114-CacheID: sfid-20260425_155014_527388_1F99FB0A 
X-CRM114-Status: UNSURE (   9.95  )
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


