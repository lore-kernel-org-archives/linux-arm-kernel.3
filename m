Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C90BFED3F1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 16:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K/xS7q5C5QGMJMPDSriSnCglCHYvD9rGLYFUY/AUodE=; b=3iEGoSQHwp1zII/EEF6Cuq56UD
	Bd3RKDD2nTcab27lHTSc7hy/GdursPjQmhWlmxXot33jlrniWjL0Dg3rzT7xfL/ZYgErHO0xCAe2V
	oBq4AFEOKm1M3bcACzNCaDNb8KE4OJgRjgTOYDo7N39lMIMslb/y1JBGk9FNfH//gzasz/lFu+tdU
	XZqYP8nPBKzuVD9x4Pu7g9HuqLpLsnJRNGkW9XZbvOqsfTLCaUe7T51zwI7OZMwGUg1ORTTHJeLKA
	QKaLVpIPTajRxlMDswtE8erMaUj72oCAj5GdPz4NOGggz2r37vzT3UP8IPuNNE72ac4h7DPb+SM4U
	tkaZ4g2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGJgm-0000000DTAZ-2sAK;
	Fri, 24 Apr 2026 16:47:36 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGJgg-0000000DT8c-3w2I
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Apr 2026 16:47:32 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-3594620fe97so17474974a91.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Apr 2026 09:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777049250; x=1777654050; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=K/xS7q5C5QGMJMPDSriSnCglCHYvD9rGLYFUY/AUodE=;
        b=DTrwN7dHj6p+u0aGBnsixsN5Q1i8HiSZzXEJr73KNc3XhqQQqjRzNWab4/qF+JjfKh
         CZWP4ZXCr37EMvU5+C2M9mCVNngIZlBNLcstvfwv/PqyhriSTY4lP7IGu5qLaHtq4oOK
         0VpyiNj1CDGCXYGcrXyYorZZxWtnASB7jNT0QtlYfVXPmOKXsMVgu3bXuRIyUioeqqQ9
         bNhyLpShPbfsbFfs7S6eIueyQAR+BU29FxcYf9L4pI8ESzMohzCU/qW7gywyDTT06T3g
         jzlaDrYUqv8CZln3lCuCfMLDCRwCkzxnAYdSdEJ7En6b8zhLKenzk0rWqowANerwpzJh
         2xOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777049250; x=1777654050;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K/xS7q5C5QGMJMPDSriSnCglCHYvD9rGLYFUY/AUodE=;
        b=bzdjsQKGFyXpApBMC/jrh30wEVGTPx/cTSydkyvGsUWuNXdB82NdHIvgFZsNBqG+iK
         /crJ3wYaKxqRjEw09yzHUfK24jcHQzmFgazrbovzgZysfOHqbQ9m9rHt44p9FiP9VTe/
         mrL4ySLKgMxkItiC+/hU7ig7My2iRfYMl162NqaVz9ifLj3NXKQTRT7lnh+HxDK5EwAz
         uuV0T13WRPCrtRfJ6yr9J+uQ0ha4AAHF/a/2OzOakZCwGuJkXBqrjPGl5evNC1XwSqYW
         NK1zKSRWsYnzCohqk7VfmLMCOMYpR6jkiWDBLQlGIci8Z3OD42zILaUKt9YIjPQkhFha
         x0QA==
X-Forwarded-Encrypted: i=1; AFNElJ90XDVnqUvDB3J0DSztlRsQuQyWzvw6H4iHEGPuJwhkkH+/kMWmJg+ZC7FzqvGeOhX7Y0dIQN7OJ0N+vWrmHPe3@lists.infradead.org
X-Gm-Message-State: AOJu0YzPzULLZ65eg1hiivxCHenVrdClJiIxH0xwr/3q5WDXdiu73KFs
	+QJCYIGDvBd5t5/aSfHfOnNERUr4eh/Ckq/zg+FzDfQk/TDtHv49PsZVG04nFbhGRPj5qD5an1O
	zkf+UjILbsA==
X-Received: from pgbfq1.prod.google.com ([2002:a05:6a02:2981:b0:bac:6acd:818b])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:7f85:b0:3a1:76d3:c1b4
 with SMTP id adf61e73a8af0-3a176d45d70mr27186517637.30.1777049249361; Fri, 24
 Apr 2026 09:47:29 -0700 (PDT)
Date: Fri, 24 Apr 2026 09:46:24 -0700
In-Reply-To: <20260424164721.2229025-1-irogers@google.com>
Mime-Version: 1.0
References: <20260423163406.1779809-1-irogers@google.com> <20260424164721.2229025-1-irogers@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260424164721.2229025-3-irogers@google.com>
Subject: [PATCH v5 02/58] perf arch arm: Sort includes and add missed explicit dependencies
From: Ian Rogers <irogers@google.com>
To: acme@kernel.org, adrian.hunter@intel.com, james.clark@linaro.org, 
	leo.yan@linux.dev, namhyung@kernel.org, tmricht@linux.ibm.com
Cc: alice.mei.rogers@gmail.com, dapeng1.mi@linux.intel.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, mingo@redhat.com, peterz@infradead.org, 
	Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_094731_002321_796F251B 
X-CRM114-Status: GOOD (  10.08  )
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


