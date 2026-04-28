Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE40BFF885A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 07:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pih4PvjlzSX23VUBfhxJgrdaziaLdcdiDaL3PE08L8Q=; b=MpKchKtwn3YC/PrTGcXDH1r+s4
	FCs/DzfJt+s++9kAfGfrzrOcBen6i+1O4OBXGs5cKGe5RI5qVFjxQ9IyrbI61i+nSeImGBF3sVP7l
	sXDn/pvPy01pV/5BoWRYjU3vDCfhVGUHJ5T+k00G4QFL+0XYxNUFvwpJOOKd3F4dHqPXMHOZwxymY
	5NqandVo4t1UgnxMN1EACuB1UXREcz6V9zhONCtvHWb6nV6OnKoUZ80FpGT5UCd/4HjrsJMSDnaad
	21AcK3cOdQiARF80zt7Td/PCt5nfRhjtd16UrUBj2bqCl1NvAZcKwc/mM9e8oIUCJ7SQH5udUqCPk
	eL3uZvnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHcja-00000000get-1lS7;
	Tue, 28 Apr 2026 07:19:54 +0000
Received: from mail-dy1-x134a.google.com ([2607:f8b0:4864:20::134a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHcjE-00000000gKK-2ckU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 07:19:33 +0000
Received: by mail-dy1-x134a.google.com with SMTP id 5a478bee46e88-2bdf6fe90a9so17674259eec.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 00:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777360771; x=1777965571; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Pih4PvjlzSX23VUBfhxJgrdaziaLdcdiDaL3PE08L8Q=;
        b=Ls70U21XYZY3NDA1kmbN6BqieOJJWHHMKYW0C6SAn+E2rV0b68UqLF2Ri+aMrQ0D8V
         PdfJEv1Z0Cz8O1QKEOv+99h3I2oWV1AZYyISrzGSQtvui5oqjAK4SierYwrMAq+s2n2j
         yRTdbRa6+5tU7h6FoYdFNl+2G/pcmPx3u+TFwOIlDEMT6Jb/ci74sk2NBVo6Tc/HUy3l
         +q3rzzFWVyvpj620hjH4w0C2YpiosARh2C0oZPFe1jyWax+HxydfxDfhL23tSdljxwIz
         kCufEnGDqiPRbUtglRHPfWCCG6/zKIXjimLWWN/ieYWkJMvR5r+O2+O4euBswbDt9ww5
         BkSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777360771; x=1777965571;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Pih4PvjlzSX23VUBfhxJgrdaziaLdcdiDaL3PE08L8Q=;
        b=BABtAfOXsNurF1Y06bHW3RvXPkA8P+piOCAG0yerQAcoOsD9/rQBoNlMudS1AtwjVE
         7N73i24K/oyEekInMV2UCLBYDDnnRWIIR0BR2hM6LdRwHjzCZQValtkfFZbrS8uwoVGj
         fCtZ+HWycY6LENgreA7AdWXDzlqVYuyVQkdbdghImI49MvcX7Ga40tnx3Xi3By8U6Xmy
         wRzOB4TAe7pQ51KFmpjfbXD+CPDPe8mp9KFPIqwBnKtSCdfVrdhPqCeTdGmrRfql74aj
         55J9m8qRJjM3sNkcmKPC1QMBTA6Q3viNr4FpSAsngdVdvV4l3A5XTmIu1S2BIhlYM0or
         HGwg==
X-Forwarded-Encrypted: i=1; AFNElJ+SCs+jvFF4JFgToZOXZce1FGrh5XLjR6wDgCU72afMPaNoFjVLiFPCvtV8rCU38qbSo3KbXWvL0zVemPahht7J@lists.infradead.org
X-Gm-Message-State: AOJu0Ywgwbay+kwfFb0jq7MExG0qWFmmJE8i/d4uZfKTOpZxUif/e8aW
	OuuOG+gpcdYxK+mGkVkYXpY1B+pDyq+aeOEl/gNVU7fPI2+Ple5Pv3gm/xzr+qmyEM1BAZ6P99N
	gz9W+t0/YHw==
X-Received: from dyblf37.prod.google.com ([2002:a05:7301:a25:b0:2da:4e8f:1752])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:d706:b0:2ed:e14:7f54
 with SMTP id 5a478bee46e88-2ed0e1484d5mr414992eec.30.1777360771072; Tue, 28
 Apr 2026 00:19:31 -0700 (PDT)
Date: Tue, 28 Apr 2026 00:18:11 -0700
In-Reply-To: <20260428071903.1886173-1-irogers@google.com>
Mime-Version: 1.0
References: <20260425224951.174663-1-irogers@google.com> <20260428071903.1886173-1-irogers@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260428071903.1886173-7-irogers@google.com>
Subject: [PATCH v8 06/58] perf python: Add missed explicit dependencies
From: Ian Rogers <irogers@google.com>
To: acme@kernel.org, namhyung@kernel.org
Cc: adrian.hunter@intel.com, alice.mei.rogers@gmail.com, 
	dapeng1.mi@linux.intel.com, james.clark@linaro.org, leo.yan@linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, mingo@redhat.com, peterz@infradead.org, 
	tmricht@linux.ibm.com, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_001932_664891_7891EC3B 
X-CRM114-Status: UNSURE (   9.98  )
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


