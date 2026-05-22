Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18082CD4F3D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 22:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qK9dSpPcv6wOfbSQzn8e4LYSN0aiyiQIegu2xzHPiXg=; b=s/N90B7oX8mYej2dlt0I8KoZou
	12/FNZPz2MWWN2YhTeaaPmKqN8hZJzgH/NeYaPF+YTtxNod6mcAyH55/fddMDTb4WfVv40y9ZBkX0
	5N2ATVxnLYK3xR7fnJWZ8OTxs+vQaPQoLdhxE94eEhm7oAifsAP7mmmOmPPEzef0s1RbvKHbPyWtS
	VgmwSVzHnnsMLRWNZFQnEj5QMAYG2i2JERxkAVcgO56pt/y+Q/Rm8klBKki6gkFx3y8+RnoYdDqCl
	khqGPlT45Elrf+3jpZWVpw/ua5xzZjt5AH9J8+fIyDjTbscMxJuShH9rN7kzx3SGBzVLWC304++og
	c1llWCyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQXz8-0000000C2X4-3mR9;
	Fri, 22 May 2026 22:04:50 +0000
Received: from mail-dy1-x134a.google.com ([2607:f8b0:4864:20::134a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQXz3-0000000C2TT-216j
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 22:04:46 +0000
Received: by mail-dy1-x134a.google.com with SMTP id 5a478bee46e88-2bda35eab74so6831517eec.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 15:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779487484; x=1780092284; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=qK9dSpPcv6wOfbSQzn8e4LYSN0aiyiQIegu2xzHPiXg=;
        b=f2WNQU72r6Nw7/irWczrD2yQ1B93e+5hAZeXL3SERL/4sDTtyDzfD+MD6sVDAx2z/x
         p1LnqygZhZIlFgPGaieutYM+Wax4UKLei3KBU2I4E455eNNwSvfmztGdYfI0ZW+OyCMt
         mGy+4Ad1hCL0v6DY59vMHTpN/XMpy1cuqvUDnYmGDfD1OHYTx6r7XtlQfOPb/5rXUrl7
         Hx0IeeCpx2PnIecl7rvrUOHpdLeMsT7zHoaM2yMKQrA0+pw6kJVEu3kp4II4vRua+Y1O
         5WHTuTYdLENYGgfAnRwg2XmMpO6CzFJ96xYLCsRYBofPDNGXDOG3eOJcbOFo9k+WiTGp
         73SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779487484; x=1780092284;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qK9dSpPcv6wOfbSQzn8e4LYSN0aiyiQIegu2xzHPiXg=;
        b=ZnoqPwzPf4XMpjTh5x8QjkkMO2NuD65Ag3SMC7ya/nJTKRCr1V5nL2qDz4JeUTARML
         4JicOueHgaBua6dvZZlM0m1kk3Anjf6CbVhdA1M6aHOppwyzYOza/V3G/siwDcKNlJ2M
         BqBK4gLTAK5x4y0/sbkM85714RvYRFkQ6lqeQN7EqN8YJH3GavIteqPy6fk/sVWuiw4b
         5LddSXP+fuUclD8EMORu4LRy3LhloAX9+1mWdJlHoTjyBoBGJ9ZWjefJ39mOEi9Bys61
         si0Uul9Gwq8CKsf/1RXoASKdOKLrfz3/fTSNrX+1l68rR+gV8xw+nfXVfA957l1Hyg9V
         xvwA==
X-Forwarded-Encrypted: i=1; AFNElJ/rwqKuIpLXSa20tWhYXEie/ST43TM1mwFgf7H9anMgLCVf6uVyYmzH/SDaMfXQQnrYGKM7mtwLNvoEkxoDTSHp@lists.infradead.org
X-Gm-Message-State: AOJu0YwFWmMa+Y/3JxUIzZmtewqeini0GViPDPruBqyhih6dneL+OH+y
	tuIsM7H2RFVk05ATzbxhRV2V4NAztN/vmHZmqgZBo6BAXv8o7LF2wgDD8ibtWjVeHJvg9fZ6D8y
	ModCdsHdGpA==
X-Received: from dyblz48.prod.google.com ([2002:a05:7301:1630:b0:304:59b1:e122])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:7483:b0:2ee:7b2e:8a3e
 with SMTP id 5a478bee46e88-304304fbfa4mr4638762eec.1.1779487483670; Fri, 22
 May 2026 15:04:43 -0700 (PDT)
Date: Fri, 22 May 2026 15:04:13 -0700
In-Reply-To: <20260522220435.2378363-1-irogers@google.com>
Mime-Version: 1.0
References: <20260428071903.1886173-1-irogers@google.com> <20260522220435.2378363-1-irogers@google.com>
X-Mailer: git-send-email 2.54.0.794.g4f17f83d09-goog
Message-ID: <20260522220435.2378363-3-irogers@google.com>
Subject: [PATCH v9 02/23] perf arch x86: Sort includes and add missed explicit dependencies
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, namhyung@kernel.org
Cc: adrian.hunter@intel.com, alice.mei.rogers@gmail.com, 
	dapeng1.mi@linux.intel.com, james.clark@linaro.org, leo.yan@linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, mingo@redhat.com, peterz@infradead.org, 
	tmricht@linux.ibm.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_150445_520392_DE10F07F 
X-CRM114-Status: GOOD (  10.28  )
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
2.54.0.794.g4f17f83d09-goog


