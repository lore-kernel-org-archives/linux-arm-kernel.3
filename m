Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25439CD5BB0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 22:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+PYEbQ/Ax7WxxTaHLwQ4Nrd/42MyXIVdzUn7wSkN0kc=; b=XEWk8r3gmWV0b3f99ILkkMWbPf
	kiOEysCSr5qjQhG7V20dXDLhmXrv0DdlrS26Wiy5ZF5Q39nBnffBMgbhd97j5gwZV/0Y1VHmZI5IJ
	FStWBkvLfjPmXaUKZOqvN+baxJ12JB09aIwSeRukrktHldY74JVdrNDIE5ENB9UM+pkxAMwH+Mi+m
	cewpZKCvudy30DM0HtI7F0FX0Zzcl0L/QI+6Upl+l9YtYWVnltPmX6/PTPYPxDQ/ypFJRZ+uENIc/
	BFLsEYsyJbK3OyMEoRAmbCdst4czmq+EB82a1yntY2kf/aQJZHWPzR35hrcuTgov5XpCPm+qmL/5+
	QN8D8c3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQXz8-0000000C2Wr-3Lcg;
	Fri, 22 May 2026 22:04:50 +0000
Received: from mail-dl1-x1249.google.com ([2607:f8b0:4864:20::1249])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQXz1-0000000C2Sr-2Xuy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 22:04:44 +0000
Received: by mail-dl1-x1249.google.com with SMTP id a92af1059eb24-1353a6f29deso8909915c88.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 15:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779487482; x=1780092282; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=+PYEbQ/Ax7WxxTaHLwQ4Nrd/42MyXIVdzUn7wSkN0kc=;
        b=FqgBbJjK7xr435z3KtCuIsDmRVhEDCBcvjaPmvu0WYH1w4X6BasJu6+ptdIy6CCCE3
         Xpto1jW3a2VVOP9SCLMjiFE6/G6DUKZvmDHNmg7fHymSudCwR0EwjA83McHKkB2a7yY3
         GqPIJqDbTGWns+is7gNj35oWN7WkhCyPl09DWi5lg27vmKZmVhY7ORbo5zfOCAR+u2Uc
         /69sO4PRDmNDapOUv/knC3EZdVwqng1Oe6kByjUjCDduqCwK3chbn4ufvnZRGAwFrvSC
         /Gk4iOWRuoJlhUWLykgDxLyW2Yy67HHDiaff7JQpww/UEurdfZSTk+ur0VxKD+xiDVr6
         uTkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779487482; x=1780092282;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+PYEbQ/Ax7WxxTaHLwQ4Nrd/42MyXIVdzUn7wSkN0kc=;
        b=l5SGY3lpVIYcY3egvWY02wU+bMfCLIInhyLuMyZaImOq0PUV6Tw5b1ZoWPYATHseCN
         1ZK4ySVbD51jISW+kWdh5rKuh0YtI9qXGEb7OUQPymaiAir9+yqaIGh93kSp3HD7Lpf5
         ci2oCeaGzanDZzcLshQw5jleAFund0Xlw2E/62l/Q46Y+zrAL8bCr5z+AdCnzLMLAN+i
         2A7nBcXSurDz7+OVxGZVM+ONr+Md6CWJDcBXErQMrHVurnaUaZ2f3TvDZMnRhyYktv9B
         nKnK5e4cmyv15qWlTGSEJEviLA9JgJ2Y1/JkLk/1JDAeMhyBs9VlnWIgJxGIdc1Yp3BP
         lD9Q==
X-Forwarded-Encrypted: i=1; AFNElJ9BKQE63aE/pmfofUAww5X6/lrD90hVP7WCF1x5unIKsYM6YnnHWI8ND9OFK36/yiOixUD0LFW9tGA1r1dTlItr@lists.infradead.org
X-Gm-Message-State: AOJu0Yx033zsr8PqO602WUydYVSLA14MPpbgoabPu9d4Y/l5LzVz6cks
	/Z2Jvu9iCu6vJGCGYGEjmiV5sDVZhNxcwrY5qawBEhaBpJYy3bxIc8ur/6c5klYn/vxhzafTSOf
	H5nC0O1Dn1w==
X-Received: from dlbpk9.prod.google.com ([2002:a05:7022:3849:b0:136:1858:9f25])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:62b:b0:12a:68cc:3efb
 with SMTP id a92af1059eb24-1365f821dc7mr2239685c88.16.1779487481501; Fri, 22
 May 2026 15:04:41 -0700 (PDT)
Date: Fri, 22 May 2026 15:04:12 -0700
In-Reply-To: <20260522220435.2378363-1-irogers@google.com>
Mime-Version: 1.0
References: <20260428071903.1886173-1-irogers@google.com> <20260522220435.2378363-1-irogers@google.com>
X-Mailer: git-send-email 2.54.0.794.g4f17f83d09-goog
Message-ID: <20260522220435.2378363-2-irogers@google.com>
Subject: [PATCH v9 01/23] perf arch arm: Sort includes and add missed explicit dependencies
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, namhyung@kernel.org
Cc: adrian.hunter@intel.com, alice.mei.rogers@gmail.com, 
	dapeng1.mi@linux.intel.com, james.clark@linaro.org, leo.yan@linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, mingo@redhat.com, peterz@infradead.org, 
	tmricht@linux.ibm.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_150443_645392_CC63C0EE 
X-CRM114-Status: GOOD (  10.34  )
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
2.54.0.794.g4f17f83d09-goog


