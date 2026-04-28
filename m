Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3470BFF886F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 07:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mqXJIn8r4IA9Gva4etcbzr/XlHSVW6Lm8pY9GKRmyzg=; b=RVFKJsbTZwKaPLjUyHjTYXiJKU
	AEvbUqnGYB8dfBF59IPL+Z+bQQ67mEHduAam5gkbinvR3mxt3B99EYrvd3jDQ65i4gF6dpzspWvjz
	zmtLfN21a5qR+wIoQ6Db27E8xXTTlnFFCV5XrTCrJ9Wnd8i1DJyxPEwO6kGmT/udFRgD3HR1WWog/
	Yny6t7H40j8ScN8Elw9QYAPMhItHHegr59BDdQPtZzfmkU55nvwDJuBCM0hH6/w2JHp2aCl5vMK7F
	Nlite0FiSobjfCh3kiUuYw252sP09LGf+1se1Inb6TDvXm1OPaeld6V5Y3bd6HPm94157vEw2Imbd
	NToiu7xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHcjG-00000000gMP-0oVr;
	Tue, 28 Apr 2026 07:19:34 +0000
Received: from mail-dy1-x134a.google.com ([2607:f8b0:4864:20::134a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHcj8-00000000gHz-2oZb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 07:19:27 +0000
Received: by mail-dy1-x134a.google.com with SMTP id 5a478bee46e88-2de07c12745so36432753eec.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 00:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777360765; x=1777965565; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=mqXJIn8r4IA9Gva4etcbzr/XlHSVW6Lm8pY9GKRmyzg=;
        b=CyFJ7lf0DoeZoEJQJEMYqQN6Kb7L/d6mHg3E5Qvk2E4qHfqiEIh1nuYQJI9I2q5Ybx
         wj6kmjutjOIE5PgBXFyS+gnyfAF2jDBgAT3cc7DCv+vJKeqryO+HdOneo2Bd8HlGBgcK
         sygxFT5KY31pIWrBjEs1gbxOiZwIo/aG2+JuI1QgYRIuGtcE+yt6x9rLALE/imeCXOB/
         GaitmqzsYhFKh0Td9Z+IDJBaHvI7yf7DFWyj8nCHaoQJHtcWmJD641CGgpg1TwIqhL0q
         La5FhRZ/DlaCHkvC8ZVpkJXQtCI5YAu1iBxJYcdXkPBBaGgFUkYOOHvqJ07NZVM8NeFM
         Q2aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777360765; x=1777965565;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mqXJIn8r4IA9Gva4etcbzr/XlHSVW6Lm8pY9GKRmyzg=;
        b=HvUcdhMNkSFle1EW5L4pAeN0tnG6QnXYOsggL3goe3TEpa76NGxi5psoD+uuygjVYT
         ydZC6admjAS0FHzH+pOkbBbk6Dzq0oegd96194d4My9rYbcIOzgBr6Nqs6lYt4+Vdf9o
         4ihHjvpQwvDW/6FRLxx3ETj47QIxbbAXBrxoXkqTYRYj7YJnGPMQGcA8h5ANtLiRJdBS
         BOwdoB+cTyXylqtCFJYxYzNzt1Z45M7jJOjVzr1Fn5f3vmpg/vAH7ngZFBeL6E3nxalc
         Rr6XbP7I1cPzQK+8L7jx6mtqE0CGv2HX4ClAl/ALTN/m6BImVF0oXyP3iR2Lo0C6dQ+d
         PU+Q==
X-Forwarded-Encrypted: i=1; AFNElJ9+8ronEGp/rLFRaplpzTZuAvj/K/+jdfLFARWL3YBdMbnJDtz4e+GT7H4nH/LNGf/LNHucFyE88Mn4VNnm+vFP@lists.infradead.org
X-Gm-Message-State: AOJu0Yy92vE3F3MTpUD6QmwdR5j9pzz+TSQXjoyFxPsS/EWFXnfc1Tv6
	doRW2n6zofZxrKFF0GqqyEcODbaJz6VO0V42/mVzgZvkKBnioNpauQc5WYedpQJMXyFGCIMxPBA
	BtxdK4cd9bA==
X-Received: from dycnm7.prod.google.com ([2002:a05:7300:d187:b0:2d8:fc66:cd7b])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:678b:b0:2e2:3381:2fba
 with SMTP id 5a478bee46e88-2ed0a003e77mr1018917eec.3.1777360765045; Tue, 28
 Apr 2026 00:19:25 -0700 (PDT)
Date: Tue, 28 Apr 2026 00:18:08 -0700
In-Reply-To: <20260428071903.1886173-1-irogers@google.com>
Mime-Version: 1.0
References: <20260425224951.174663-1-irogers@google.com> <20260428071903.1886173-1-irogers@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260428071903.1886173-4-irogers@google.com>
Subject: [PATCH v8 03/58] perf tests: Sort includes and add missed explicit dependencies
From: Ian Rogers <irogers@google.com>
To: acme@kernel.org, namhyung@kernel.org
Cc: adrian.hunter@intel.com, alice.mei.rogers@gmail.com, 
	dapeng1.mi@linux.intel.com, james.clark@linaro.org, leo.yan@linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, mingo@redhat.com, peterz@infradead.org, 
	tmricht@linux.ibm.com, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_001926_709652_AAA7D461 
X-CRM114-Status: GOOD (  11.38  )
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
 tools/perf/tests/hwmon_pmu.c  | 14 +++++++++-----
 tools/perf/tests/mmap-basic.c | 18 +++++++++++-------
 2 files changed, 20 insertions(+), 12 deletions(-)

diff --git a/tools/perf/tests/hwmon_pmu.c b/tools/perf/tests/hwmon_pmu.c
index 4aa4aac94f09..ada6e445c4c4 100644
--- a/tools/perf/tests/hwmon_pmu.c
+++ b/tools/perf/tests/hwmon_pmu.c
@@ -1,15 +1,19 @@
 // SPDX-License-Identifier: (LGPL-2.1 OR BSD-2-Clause)
-#include "debug.h"
-#include "evlist.h"
 #include "hwmon_pmu.h"
-#include "parse-events.h"
-#include "tests.h"
+
 #include <errno.h>
+
 #include <fcntl.h>
-#include <sys/stat.h>
 #include <linux/compiler.h>
 #include <linux/kernel.h>
 #include <linux/string.h>
+#include <sys/stat.h>
+
+#include "debug.h"
+#include "evlist.h"
+#include "parse-events.h"
+#include "pmus.h"
+#include "tests.h"
 
 static const struct test_event {
 	const char *name;
diff --git a/tools/perf/tests/mmap-basic.c b/tools/perf/tests/mmap-basic.c
index 3313c236104e..8d04f6edb004 100644
--- a/tools/perf/tests/mmap-basic.c
+++ b/tools/perf/tests/mmap-basic.c
@@ -1,25 +1,29 @@
 // SPDX-License-Identifier: GPL-2.0
 #include <errno.h>
-#include <fcntl.h>
 #include <inttypes.h>
 #include <stdlib.h>
+
+#include <fcntl.h>
+#include <linux/err.h>
+#include <linux/kernel.h>
+#include <linux/string.h>
+
 #include <perf/cpumap.h>
+#include <perf/evlist.h>
+#include <perf/mmap.h>
 
 #include "cpumap.h"
 #include "debug.h"
 #include "event.h"
 #include "evlist.h"
 #include "evsel.h"
-#include "thread_map.h"
+#include "pmu.h"
+#include "pmus.h"
 #include "tests.h"
+#include "thread_map.h"
 #include "util/affinity.h"
 #include "util/mmap.h"
 #include "util/sample.h"
-#include <linux/err.h>
-#include <linux/kernel.h>
-#include <linux/string.h>
-#include <perf/evlist.h>
-#include <perf/mmap.h>
 
 /*
  * This test will generate random numbers of calls to some getpid syscalls,
-- 
2.54.0.545.g6539524ca2-goog


