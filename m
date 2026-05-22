Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C10F5CD5BB0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 22:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p+Ps4mCr8gi146N9Gz5RD0kRPKapXZPgmaFKoDB0Lgo=; b=SeJqnXR+XhL0ZQNUAbzIQ8ue0q
	SOv440ZSWxqRsIvVCR8SQePIQeoc5C9aNRNXub9h1on9WPW64NADxRv91U7zV2MCKITLQl4Q/wcgX
	paUvbz3QLB1oyGwDum277ZXOV11W4mmHutLsdFJH2t0On+ZwOYHwnhf5nd5mszSfJHxBN+gLqskBe
	apPicIEuF2m2GchfC1ltkOu+6z6jYbJTvPMT1GTF4k4afcSSoIuXW/PuJavKUUlCck2fHN1/qpdrC
	x35wrbL5ceOW8pGRVhLR8N9X4QsQLiOO0XLSLxam/ywsRMnrIJIcfCFBYlWUBB2NtdeKhKYaAsJzE
	T7aXTPTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQXzM-0000000C2hP-1SUw;
	Fri, 22 May 2026 22:05:04 +0000
Received: from mail-dy1-x134a.google.com ([2607:f8b0:4864:20::134a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQXzC-0000000C2ZT-04Ua
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 22:04:55 +0000
Received: by mail-dy1-x134a.google.com with SMTP id 5a478bee46e88-2efc342ef15so9644403eec.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 15:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779487493; x=1780092293; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=p+Ps4mCr8gi146N9Gz5RD0kRPKapXZPgmaFKoDB0Lgo=;
        b=JksF251CiFb06sM6h1stMrb6FA3N1P05LVoL7IbozIjqjFhXEVRBK2mHhvRuNXY/15
         qE9U5IcZ6sJZlUz6LHf1tUJsStZS0+tsOF1plXXn5RecSPhZSfAAE9R/S1qRofe9674W
         sRDpIrYIkPWitJHwUwUiQdSOx5bk8ZW9C8B96vRrENsEfMUX8tnTpqJVyVdDF12+bAw9
         0hNbpNg8jfF/gmAARjSfH8/TO4IUdOFO4v/WizBsObNDapCEAItm/3LenPOcMINmbknL
         QPxgRelaoNj9RpfS7unC2TehSYEOKWEgCKwDyKHp1AtnxYjmANoANlLvwTldjxprK3GE
         vUFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779487493; x=1780092293;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p+Ps4mCr8gi146N9Gz5RD0kRPKapXZPgmaFKoDB0Lgo=;
        b=O+nFKb9I3AnQU7E0vR0vzuIlA4PWIJqz+zdk+amrhp+plnNhqDAYpLmYtWsK6tOW7u
         /HsUzMTxNs3hEHdfYdLk6AtgHfN6Lyoc2y3W5p7JFHzCtcgtCI3We0HxxmL9U/LFHt0C
         D1UvMWSQm5sTNxDgEDDs91yvWFHEYO/49aG+09VT/FlgtXqeLgmrIOr4wJ/b9OUSyn4X
         9zMfy0zJ6+FOewIcHRH3lKhOFkiz+AnlubUlZqMQYSj+iRE38nrVmumqMRzEdaT/L+3n
         cvcJ8+ZUAEdrEiRywVF3VfUymqD105VQjv6tU9YrJi0M47BiqVJFF6vXbToSdEnnR9HK
         HnvQ==
X-Forwarded-Encrypted: i=1; AFNElJ/ga3cMAF/t2dCZOPOTq/DPdnIv/YzYuIljEqGY8PWaxQjN72MnLniyKbjVznT+NjQ8+rqLFxTNU9KVtwQiJBqE@lists.infradead.org
X-Gm-Message-State: AOJu0YwsgxMevvtMRIP1WX7CuffYbht0ZlylAnx14qT4IVtyDkVGFFaL
	J24a1LiPgFe6Ub/dyPBY4nRnZawdkqU+x1GOvJgIV6WOAU9puaMVNiLTS75LjD+UOTRozDjDRei
	aXePtABTElA==
X-Received: from dyjt24.prod.google.com ([2002:a05:7300:7b18:b0:2f2:fc0:8869])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:6446:b0:2f8:42b0:e63d
 with SMTP id 5a478bee46e88-30448f363demr2843328eec.2.1779487492324; Fri, 22
 May 2026 15:04:52 -0700 (PDT)
Date: Fri, 22 May 2026 15:04:17 -0700
In-Reply-To: <20260522220435.2378363-1-irogers@google.com>
Mime-Version: 1.0
References: <20260428071903.1886173-1-irogers@google.com> <20260522220435.2378363-1-irogers@google.com>
X-Mailer: git-send-email 2.54.0.794.g4f17f83d09-goog
Message-ID: <20260522220435.2378363-7-irogers@google.com>
Subject: [PATCH v9 06/23] perf python: Add missed explicit dependencies
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, namhyung@kernel.org
Cc: adrian.hunter@intel.com, alice.mei.rogers@gmail.com, 
	dapeng1.mi@linux.intel.com, james.clark@linaro.org, leo.yan@linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, mingo@redhat.com, peterz@infradead.org, 
	tmricht@linux.ibm.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_150454_075895_31D5DA6D 
X-CRM114-Status: UNSURE (   9.27  )
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
 tools/perf/util/python.c | 25 +++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/tools/perf/util/python.c b/tools/perf/util/python.c
index cc1019d29a5d..dd937d714e99 100644
--- a/tools/perf/util/python.c
+++ b/tools/perf/util/python.c
@@ -1,30 +1,35 @@
 // SPDX-License-Identifier: GPL-2.0
-#include <Python.h>
-#include <structmember.h>
 #include <inttypes.h>
-#include <poll.h>
+
 #include <linux/err.h>
+#include <poll.h>
+
+#include <Python.h>
+#include <internal/lib.h>
 #include <perf/cpumap.h>
-#ifdef HAVE_LIBTRACEEVENT
-#include <event-parse.h>
-#endif
 #include <perf/mmap.h>
+#include <structmember.h>
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
2.54.0.794.g4f17f83d09-goog


