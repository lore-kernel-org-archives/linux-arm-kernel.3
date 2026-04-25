Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B1E9FF885C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Apr 2026 17:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K/xS7q5C5QGMJMPDSriSnCglCHYvD9rGLYFUY/AUodE=; b=dBtY43iDS27D3xUCU4h9/VJLVg
	GZ9t+FOkF2fc76WSrdZh0GeyrC5bYmgAkLbmKCY0WVWAGjSw5DkYQS5UzsL7hoW3zkr1YGtQmzXnv
	yH/4T1gSDNYnAFeb1NNX5ACNXZ73KGjCVfu87cnwT3UVV5GsmHaUqB/3wwJPIP26RIjaM7a1/ECbQ
	oAJARwbfWbfnUEI7iBVHYhDwpmOG4V4luZ/qMbO6vqASkO77N5FrHFDCzwT0W42ImlvxD2WcQCbhM
	5vzOKYgLjdOKO66bhrUri+RRFHqspWxClLi7Nb8SwehuvBVOYgew8TgleecwuK6ZSg0g+i52+8jMR
	4drvnnnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGh7y-0000000EcCN-3kil;
	Sat, 25 Apr 2026 17:49:14 +0000
Received: from mail-dl1-x124a.google.com ([2607:f8b0:4864:20::124a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGh7q-0000000Ec9f-3u3V
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Apr 2026 17:49:07 +0000
Received: by mail-dl1-x124a.google.com with SMTP id a92af1059eb24-12dbf4f678eso17389776c88.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Apr 2026 10:49:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777139345; x=1777744145; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=K/xS7q5C5QGMJMPDSriSnCglCHYvD9rGLYFUY/AUodE=;
        b=SC98izQEet8qF8K9/UB9nk0PW2UUp4gErMiMcu4GH7gr4QBe2fs+VAvkl+nRVzSiPP
         jYeDkVHtYOson6zIGzvuTIwmMHFTclD7SH8dLW84DV/Vjikr/9oM7iRcBEUhvymkMANZ
         /dgrKnxT9SoOh5UnFTw/6234FU1n1HKrHKsDZQb6vBlVlCMoUQ1jtlGV9Yo3BbNlxryW
         UTNbrhlWXq2ZkxnqTEuPFb3j1FpHzW7GrXEek4HBeDq/BZFtFNIDdHTlywmHkrgvErAr
         s5yE63Aem6YEDGHR3PmUpEz6xYNR8l0TR9TbksbrLBBZhh3qPiapIfNJY0IX4HXXNer1
         Dbcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777139345; x=1777744145;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K/xS7q5C5QGMJMPDSriSnCglCHYvD9rGLYFUY/AUodE=;
        b=CP0+usZ4VAARL2qy3yMwxebzvVZStBlBNN1gH8Co+p8SfNsezrxfmOgQ3bWUObiSkG
         R1BQ2u2MaZvlKWgJPELZPx4lwINrynt2ZfmREgfAvqiKXFTU+5ZLQ3wb1JTMsifTS7Wp
         Pqfrp/wJRX46ypU+HexA4x2y9wzi2t1AEk4dD0pPq2C209eikHk5hlMAYjC2/th1zECc
         lxLRUloVrAwusHp75bJsv0Jn+B3FAEGrm0JoSsUfgDlCJObWCMPhwYvda8eX84dlXDDF
         ypqZdedopEaS9ocoIUcMjRGxXIWnw7LPCttbKnP5MqlZAzqxiaq68NwYgkLgYyi/mIBS
         IgCQ==
X-Forwarded-Encrypted: i=1; AFNElJ9bEoZoeuFld/p6ONCMc/bU89PewFt9kSucpzT6+mPY+uOu/Uolc3S8GiCIN0eLOk5YDQbBOsB5F3YW+k7hK1U7@lists.infradead.org
X-Gm-Message-State: AOJu0YwILZ28IJ98pbLnWUOegDoShIcesEiIzd51OIZ3NluOsDc0PY25
	XkqL/SahG4sgR5vNhjKbu9gZcYOUUklvR2J/5izONPAS/WTXRARwjSjHI/HSar36Z6PoQ7NlVgU
	Tlw4S5CMAxg==
X-Received: from dlbur7-n1.prod.google.com ([2002:a05:7022:ea47:10b0:12c:4a54:8b0d])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:50d:b0:121:dea2:d54d
 with SMTP id a92af1059eb24-12c73f996bemr20453442c88.20.1777139345239; Sat, 25
 Apr 2026 10:49:05 -0700 (PDT)
Date: Sat, 25 Apr 2026 10:48:00 -0700
In-Reply-To: <20260425174858.3922152-1-irogers@google.com>
Mime-Version: 1.0
References: <20260424164721.2229025-1-irogers@google.com> <20260425174858.3922152-1-irogers@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260425174858.3922152-3-irogers@google.com>
Subject: [PATCH v6 02/59] perf arch arm: Sort includes and add missed explicit dependencies
From: Ian Rogers <irogers@google.com>
To: acme@kernel.org, adrian.hunter@intel.com, james.clark@linaro.org, 
	leo.yan@linux.dev, namhyung@kernel.org, tmricht@linux.ibm.com
Cc: alice.mei.rogers@gmail.com, dapeng1.mi@linux.intel.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, mingo@redhat.com, peterz@infradead.org, 
	Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260425_104906_964466_7C8F70DD 
X-CRM114-Status: UNSURE (   9.92  )
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
 tools/perf/arch/arm/util/cs-etm.c | 26 ++++++++++++++------------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/tools/perf/arch/arm/util/cs-etm.c b/tools/perf/arch/arm/util/cs-etm.c
index b7a839de8707..cdf8e3e60606 100644
--- a/tools/perf/arch/arm/util/cs-etm.c
+++ b/tools/perf/arch/arm/util/cs-etm.c
@@ -3,10 +3,13 @@
  * Copyright(C) 2015 Linaro Limited. All rights reserved.
  * Author: Mathieu Poirier <mathieu.poirier@linaro.org>
  */
+#include "../../../util/cs-etm.h"
+
+#include <errno.h>
+#include <stdlib.h>
 
-#include <api/fs/fs.h>
-#include <linux/bits.h>
 #include <linux/bitops.h>
+#include <linux/bits.h>
 #include <linux/compiler.h>
 #include <linux/coresight-pmu.h>
 #include <linux/kernel.h>
@@ -14,25 +17,24 @@
 #include <linux/string.h>
 #include <linux/types.h>
 #include <linux/zalloc.h>
+#include <sys/stat.h>
+
+#include <api/fs/fs.h>
+#include <internal/lib.h> // page_size
 
-#include "cs-etm.h"
-#include "../../../util/debug.h"
-#include "../../../util/record.h"
 #include "../../../util/auxtrace.h"
 #include "../../../util/cpumap.h"
+#include "../../../util/debug.h"
 #include "../../../util/event.h"
 #include "../../../util/evlist.h"
 #include "../../../util/evsel.h"
-#include "../../../util/perf_api_probe.h"
 #include "../../../util/evsel_config.h"
+#include "../../../util/perf_api_probe.h"
+#include "../../../util/pmu.h"
 #include "../../../util/pmus.h"
-#include "../../../util/cs-etm.h"
-#include <internal/lib.h> // page_size
+#include "../../../util/record.h"
 #include "../../../util/session.h"
-
-#include <errno.h>
-#include <stdlib.h>
-#include <sys/stat.h>
+#include "cs-etm.h"
 
 struct cs_etm_recording {
 	struct auxtrace_record	itr;
-- 
2.54.0.545.g6539524ca2-goog


