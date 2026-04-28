Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DFC0FF886F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 07:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K/xS7q5C5QGMJMPDSriSnCglCHYvD9rGLYFUY/AUodE=; b=dLJcdbiNUbYk0S/PN1DuxrHw6k
	MHkvDlknmEjBfE+qHbNm2ljqYMKCLwFSSDqiWd/AB0znryi6uRBRYlNmxV8wThwnsI2kKANzeREJe
	8sb08o8obKEKgkC37Ofh01KlKtgN0dBQD0y56joT5ppG6fy5KonuDLBp3nnPw1A8xURAkNpPqBZOH
	AkxTxdmVX74Bw4VYQdJhTVXOr9ARvDZbyaGa8Zxj5ZyAnHsfQ+e6286J76/xuSigzsa0r8weHcQ2k
	6z7wr8Uf+E6cQIYY0Z764mgpQ75h0QuMTl1C0sgVk314qdSLG3UYNivUy45CD8LEH37Qw5qorisBj
	Aix3Ql/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHcj6-00000000gHC-3SK1;
	Tue, 28 Apr 2026 07:19:24 +0000
Received: from mail-dy1-x134a.google.com ([2607:f8b0:4864:20::134a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHcj4-00000000gGO-2am9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 07:19:23 +0000
Received: by mail-dy1-x134a.google.com with SMTP id 5a478bee46e88-2e60238adb1so27751500eec.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 00:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777360761; x=1777965561; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=K/xS7q5C5QGMJMPDSriSnCglCHYvD9rGLYFUY/AUodE=;
        b=uh5TL7mycGsQ0CnDx/28iJWAvTqCz60DWKjhO4DD0/y3L6fUxEal3o4tWN5NzdEV3m
         IOIsVB0xYH1XdO/XaC/3pFmWmRNRuWEFkXHIzB2kC3IkDrXwCDizg236P/QHxXYooCCT
         lVmBTqicdQeby4Y8QPrLVLQCUvwdYSOq/UKcN8fKCgVhNZz3aNBwrqjDu7IbwOSVa7Zh
         m816Nn4bk/7hKLN69jM9FvkPi4I/bqIsWAZlkHXZWoJmFzXSmxUfrkmaRKzx8C7HSZl/
         Gdkgebu1qx4N1lhUd8Fp+y4JoCxuqcQA3IZpP09C+NkdIVmZ8hzM7BcHkSbmEUMVFJ+v
         s0tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777360761; x=1777965561;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K/xS7q5C5QGMJMPDSriSnCglCHYvD9rGLYFUY/AUodE=;
        b=Sm5iJpMmpm2IZsHgLr6fVTklMfcyK09JtT2aLZUMTTYAA9DE8Cqo4KY9T4WrDJ0frz
         oZH0bFa4IHifo5jadeLNurVpf1mB1ARAABpK1qctqAhRiHsv+px6IPirnQYxKBYcbaoo
         1dyjojV9/ZgHFdgchD+ADzurkFB1zCDrYgG0Z2LFuD4BNGojIVlgY638Obl4kJMOgcds
         Pa17uQs/w062E+NTxqzT7y14P4oiyYkTnjZBBd1V4byJw1vuS0kaL7I6+CoUOZbkFMK3
         XMJGCX1KgAHVLsyuEiO40O1A6aNBfpgooHbxMSvvjbPznqjZM3C6nZthKKm9Qi5VV8Fh
         Oj/g==
X-Forwarded-Encrypted: i=1; AFNElJ9MAumk4hDDFHxpJ7M5p1vqfg+zb3RiQfXRC6UunhsvxwRRuBuiifOncJpHcMqMjit8sRICg/YPqQQa+7kHLotS@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8iLiYeVHlUqgcM2H+jKJUrDpSuZvLEhjEerv8M1H11wwhcmgf
	mtck46NJxcPhF65JZ5/PNpbquRV2bhiSvks8Eo/k6fVcGkImonUZSO1XPo65yeITTNmdVC1Z1X0
	MNWPNpNO43w==
X-Received: from dyji40.prod.google.com ([2002:a05:7300:7a28:b0:2d8:dd18:baee])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:fd07:b0:2ed:e16:6b4a
 with SMTP id 5a478bee46e88-2ed0e16f02amr534432eec.32.1777360761061; Tue, 28
 Apr 2026 00:19:21 -0700 (PDT)
Date: Tue, 28 Apr 2026 00:18:06 -0700
In-Reply-To: <20260428071903.1886173-1-irogers@google.com>
Mime-Version: 1.0
References: <20260425224951.174663-1-irogers@google.com> <20260428071903.1886173-1-irogers@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260428071903.1886173-2-irogers@google.com>
Subject: [PATCH v8 01/58] perf arch arm: Sort includes and add missed explicit dependencies
From: Ian Rogers <irogers@google.com>
To: acme@kernel.org, namhyung@kernel.org
Cc: adrian.hunter@intel.com, alice.mei.rogers@gmail.com, 
	dapeng1.mi@linux.intel.com, james.clark@linaro.org, leo.yan@linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, mingo@redhat.com, peterz@infradead.org, 
	tmricht@linux.ibm.com, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_001922_649972_60C34C8A 
X-CRM114-Status: GOOD (  10.95  )
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


