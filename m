Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCB90FED3F0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 16:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pih4PvjlzSX23VUBfhxJgrdaziaLdcdiDaL3PE08L8Q=; b=Flo5xLvbGEwxWwuHJcPrcl4KCz
	rn5IwxJuPpIRRxW8uxN4F1Y/8NH8Gs8AzEUmiSniHyUJPhHVuf2D90IHtNEMoPFvYkv4xHvi0r8jF
	j7BTZX+rMVin5pZmGtqRjB8etbayNSTl0GLq0Mw0+8H8RiQqquuC5+n0QTusVHaIsj1E3gpUNqJQv
	FXEPKbb67TJzf5hAfpOJDGFyJhmcdfXdD1lMaKb9Je/d42QkpOxK/OY/vzQdMggx3LgCfwLdfOjRm
	8qQc0vTswqLrOhYWH5ABFo/+LYTu2BnRKDUGZMeLkgDGELmnQ/46BMA2hxOZIzEKDsn/U1Hjc0Nw/
	FIBGyfKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGJhG-0000000DTQj-3wVJ;
	Fri, 24 Apr 2026 16:48:06 +0000
Received: from mail-dy1-x134a.google.com ([2607:f8b0:4864:20::134a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGJhA-0000000DTMB-42hn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Apr 2026 16:48:02 +0000
Received: by mail-dy1-x134a.google.com with SMTP id 5a478bee46e88-2c0ba59a830so12541089eec.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Apr 2026 09:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777049280; x=1777654080; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Pih4PvjlzSX23VUBfhxJgrdaziaLdcdiDaL3PE08L8Q=;
        b=uT/Pkx7sTKpHstOrrSLU0+eLt6TfWw1T2PYw244ol54MNWrVhZ1wZK0CG5fzdmXfFF
         1huXudAvlnhFRwC4jxJ4Yn8psyM73W0e2N/+wNl67uE3DDWU/WT8DUB4czfcSHY9KPI4
         MSj/sftQLYezDoIpEFVO21h6HeO3UU8ayaWrfHzMClO+ENTEtP2Vfnf28/ADjth4Y4qu
         /+jDwrbOwxVM9yrSZlv/N5PqsKi33Vwc3JckOEVwoGXpnA0MpRqvftTKgv5LVnpNqek8
         umdVV9QnavBazngSYVX0VUEwCi9TWbD45LCxYIWrlQWwIK4y23kpwjyadganbZIwsMST
         u+Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777049280; x=1777654080;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Pih4PvjlzSX23VUBfhxJgrdaziaLdcdiDaL3PE08L8Q=;
        b=YAwAtmSy3XGFhSx16sInALCJDHiCO9u4OY3uxij5MB3DfzaZ3GtbdWmOWMDXszVS8R
         bqs6W7kOqW4ZwNYOLe/a7IONh5QL2A83NiJCu0okn1c7zVwPIJyYdN0KUkX094HCjOeK
         2bkJLiiUQDMJ7iGNHERkkjSYzXCF2W272+7198b5YK4uMFXiOwEhIrGP4EsHPQLApZlO
         hJHNRPhsvyXvOz9+HxhgQLlUPEkY2pPzbXf9YmR5coC7B1ShxNP+FSx+eu5KBdZl0MCl
         MU+V55fcpK7xBdSyEuDP9g7uAHTdgguyF8ZpnjMjIkR0Tc8Zp8/WKUjweN8vGL3SKvuH
         KsrA==
X-Forwarded-Encrypted: i=1; AFNElJ+v+PpikUgcmbqvbVXJLXp99bOKxWOButVO6zZeIsjFI7agdfvcnYalqyE3NrK0/goVVixWkxKWxIng17JYU2lP@lists.infradead.org
X-Gm-Message-State: AOJu0YwSytEateLto9E5LbEdfMabgEO4JG7KPzaM1+xBobe9I6BQxlf6
	cQMz8q2bBK86aU5/W0W+9rtXmIUEIAOfKr01s9xOjDkZCarTnpE28VsJ6lvcn9nBZo1wJsLOc8m
	Q1LHyVCRlOg==
X-Received: from dybmf1.prod.google.com ([2002:a05:7301:901:b0:2d8:f479:9a89])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:3d19:b0:2c1:7793:7bbb
 with SMTP id 5a478bee46e88-2e4873f3103mr19715418eec.27.1777049279688; Fri, 24
 Apr 2026 09:47:59 -0700 (PDT)
Date: Fri, 24 Apr 2026 09:46:29 -0700
In-Reply-To: <20260424164721.2229025-1-irogers@google.com>
Mime-Version: 1.0
References: <20260423163406.1779809-1-irogers@google.com> <20260424164721.2229025-1-irogers@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260424164721.2229025-8-irogers@google.com>
Subject: [PATCH v5 07/58] perf python: Add missed explicit dependencies
From: Ian Rogers <irogers@google.com>
To: acme@kernel.org, adrian.hunter@intel.com, james.clark@linaro.org, 
	leo.yan@linux.dev, namhyung@kernel.org, tmricht@linux.ibm.com
Cc: alice.mei.rogers@gmail.com, dapeng1.mi@linux.intel.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, mingo@redhat.com, peterz@infradead.org, 
	Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_094801_019471_6E45B4DA 
X-CRM114-Status: UNSURE (   9.10  )
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


