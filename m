Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82B97FF885C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Apr 2026 22:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pih4PvjlzSX23VUBfhxJgrdaziaLdcdiDaL3PE08L8Q=; b=cIw6Qn0BLkBuyGqSgB8ypx6du8
	5xXdnf5szAV6mJoJt9VvmIUsdd1Hn2cvlwmHA4LPdUlNwL163dTRVzqYbfwBegasGTg8x18O+cjEm
	a/qXBB3kDlEscp8GK8KlfNOhBloxD2eU74D1hiwFjNLGI3lmwu8u84GKmC81wBC9xHzRDr6Kx37sm
	XibE3FLqM4iE30iSjgXyOSWg5TxADvYT2h3hNVj0rqBNt4QseXRkIsuyu49yo/VcI68NkYyxIYXg2
	G3XCBIjYowk68SCoSCq34R8TZVlETojENol0T20Qhd0CjLWOrK6TnBiMbU+y4DHIcJ/PU/U0n9EAO
	5utoI2vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGlpW-0000000Ey2d-1taQ;
	Sat, 25 Apr 2026 22:50:30 +0000
Received: from mail-dl1-x1249.google.com ([2607:f8b0:4864:20::1249])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGlpT-0000000Exyp-1jL3
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Apr 2026 22:50:28 +0000
Received: by mail-dl1-x1249.google.com with SMTP id a92af1059eb24-1275c6fc58aso13993242c88.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Apr 2026 15:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777157426; x=1777762226; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Pih4PvjlzSX23VUBfhxJgrdaziaLdcdiDaL3PE08L8Q=;
        b=e7gZLFMtoqPBZ3vfw4triEsXM5H5uwNBnlcf5HQFEdopx3QJ9Idp8otoe4sDf1B7jN
         e3YO0O3Ie9lq8/bdIVKuxP0Ku2WstIvRMV/0DuSv+OYqAg33XJ7+cKygDvlq8Cl10ZbB
         BcxPR8z0KO/TtP3vCjTYFhvzR2IfHsrDsaqZkXwDkyzM7cgdakcA3O+13juaf/ttjUF4
         cF+yoZ1U/gYXPlNfYpxJ5JfG8i0zM0CPy18fpvmrsrUnwZjkhQ/w7qbfKCIg+jiZwXyp
         MUiCVUXF3L2b/bd2/bbmdXbV3hwzD7JCpJZ8330dis6c9V568HiViYEWd0+h4bWE4wLb
         8lKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777157426; x=1777762226;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Pih4PvjlzSX23VUBfhxJgrdaziaLdcdiDaL3PE08L8Q=;
        b=iQdP2F5St8e95j1ajHpbiioih9I33l0MZsV+a64kPRq48FE0sSf3spgV4WFPwdcHln
         imcg2ZRfla+//x8vq2AOI51LR9MmuNMbUce4iG/jQXELwu3kyLKQUksWOU0RSABhkjpV
         7cfPfmLAOhSXsb9lGQIzEU+qOauaYNOX54lf96IblKjrOrJoGjiJkAhvZjpLy6PrQNBv
         IEluM+iAuskZ73MJbI02dql23hPDJPM4F1phfVB7Bcwsow5opIUnNMMQu+p3HOgTZqxz
         5ma8IQrFoAs1xvz/5gK59Ad5HR/5tiLV43sqv3WHw0LPX0rSjBZPf5Fxb2od0NJMpIw0
         c2aw==
X-Forwarded-Encrypted: i=1; AFNElJ+Wmq53QxmpqIbjeZE2e6HoX8pwy1lkz/mipDY6IbNdGdH+UWi+tUlhDVtiAng79TtdTGZ1+zw1MQLZiayfgLAR@lists.infradead.org
X-Gm-Message-State: AOJu0YyHXLEugwCMAj7wq6PPuwjaf1Q3E6+rHI1IwXvcrRbWogzDqSv+
	h5R1NM3il4zz+BLQTTIyJv13PiOl1j06GubUod0cYnHDpTdCtw+Yz8QP1r4htwgbBx+WNQTzkut
	v2NKrcToFjA==
X-Received: from dlec6-n2.prod.google.com ([2002:a05:701b:4286:20b0:12d:bbdf:edcb])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:90a:b0:128:d715:b717
 with SMTP id a92af1059eb24-12c73f82878mr18014490c88.13.1777157425996; Sat, 25
 Apr 2026 15:50:25 -0700 (PDT)
Date: Sat, 25 Apr 2026 15:48:59 -0700
In-Reply-To: <20260425224951.174663-1-irogers@google.com>
Mime-Version: 1.0
References: <20260425174858.3922152-1-irogers@google.com> <20260425224951.174663-1-irogers@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260425224951.174663-8-irogers@google.com>
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
X-CRM114-CacheID: sfid-20260425_155027_447500_B7845992 
X-CRM114-Status: UNSURE (   9.04  )
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


