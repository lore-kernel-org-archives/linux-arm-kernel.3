Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72581FF885A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Apr 2026 22:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mqXJIn8r4IA9Gva4etcbzr/XlHSVW6Lm8pY9GKRmyzg=; b=ubK/UFVWFHk+20OBPl3RAYW3Dq
	cRT1YLpdXXJ4VyeQrmr96+EiSFLqEIqnlrdz903ErKvLMHjWlhX/1IghphBnJCqrSn62SDQdWOsai
	nfoj1zhXuYQ20iFXQpBg4WOjzTkqcnoEGdaDNNiEAm/j3qhedXmYUL2+HjioM2RWkHZUKxW4VMtIU
	RuK/6Hha76OIFFAryQWF7SoR9o6DThLeFIfXXvFUD6Uc2zmwIPiRLHw9cuEI3pJDx6Cty4Ea1qrlJ
	rtSnZyK7ZReqogIF3qMAF2b7YRvoSzaeTi/7YKaehlJFhrYb/R5kFV3kglr3n0tsF7Gvamdf/aUDf
	3y0bGPrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGlpN-0000000Exup-1S0a;
	Sat, 25 Apr 2026 22:50:21 +0000
Received: from mail-dy1-x1349.google.com ([2607:f8b0:4864:20::1349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGlpJ-0000000Exs2-3c71
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Apr 2026 22:50:19 +0000
Received: by mail-dy1-x1349.google.com with SMTP id 5a478bee46e88-2de07c12745so25487361eec.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Apr 2026 15:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777157416; x=1777762216; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=mqXJIn8r4IA9Gva4etcbzr/XlHSVW6Lm8pY9GKRmyzg=;
        b=Zo/7if46zthIbQETd0dM+js0w6axwf2SQd0CMAuRmGuEj2W5QRYiTwpY75JOvD8OBu
         SyMhcCfPRIC81qbCaeuu0mpsWnNDoIC67wia4chmtQTGYSXLZoqAmfznvk4R9+zTTAtI
         IQ5YDpFJQja7XufIhODARNFn7KMC10LHEiJUSVk7Ys35+26wmehwlzbHPgPoLsCD+OXg
         g8uTpFMVVauRPLoIDnucicl7SBHH+J3naPN5+IRbKA86gPBz7UCZuoi1vV4Tszwjmkqt
         xH2mlrGQwKVRj3A5r29TZbQgvnFl00QULNwJ5H7r/uJtgFZoPkZZIoBvpebbCMVSBuFu
         3UIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777157416; x=1777762216;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mqXJIn8r4IA9Gva4etcbzr/XlHSVW6Lm8pY9GKRmyzg=;
        b=ay2lsNFOdBzH0qyJ6bnz7XDv7dzgVtNbwBKqp7rzjy3dFGCGTUOJxtYr3BYCBisGg6
         4IDsG1r2rnQ4iHqzW/kwOhRfcVE6Z7T++wFUSVKkhGN5jGsRjLz0sqoxOBBcpqK+u8Xw
         V2sO7GNQsTDO5cgybe4ZwbJHHptnwJgpOmLboVvq3s5J+X9h0V1vnQrzjQ2r6BuUF8gy
         c825A0itLWDYy3FaKou/46vLQrieErU22tmwGBWTeylUu5gmw8JdZBDtD0A+31iX/tFg
         syK9eG9y64s2Cqozv4Krthhqb78wEUw9TzDUuAZniieK/6YRBnaWV33mUFA38+dCYTfY
         4ZVg==
X-Forwarded-Encrypted: i=1; AFNElJ9bZOL8tqqp2t8/pAlVvl2hsr0F9eVfiXbGcQyR3Ni8HcLXHk3/SuADSd35XhM3NE3DmMNAua3RtXv96UEb4Jdq@lists.infradead.org
X-Gm-Message-State: AOJu0YzSEGUm30PrasK0dV87jfmN+1sh9oWaVSYt6BGt7tClRi5khYja
	dbRQQxgq2bITlAQq2AgD4snMDN0eed/WcTMaPsY0GYYFpHBBId+F9AhwsKdUdF91vAPlObtFVAJ
	azX2w4CM+qg==
X-Received: from dycqb7.prod.google.com ([2002:a05:7300:fe87:b0:2df:9320:a159])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:d517:b0:2e0:4edd:64e8
 with SMTP id 5a478bee46e88-2e47a2faf4amr23570921eec.24.1777157415407; Sat, 25
 Apr 2026 15:50:15 -0700 (PDT)
Date: Sat, 25 Apr 2026 15:48:56 -0700
In-Reply-To: <20260425224951.174663-1-irogers@google.com>
Mime-Version: 1.0
References: <20260425174858.3922152-1-irogers@google.com> <20260425224951.174663-1-irogers@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260425224951.174663-5-irogers@google.com>
Subject: [PATCH v7 04/59] perf tests: Sort includes and add missed explicit dependencies
From: Ian Rogers <irogers@google.com>
To: acme@kernel.org, adrian.hunter@intel.com, james.clark@linaro.org, 
	leo.yan@linux.dev, namhyung@kernel.org, tmricht@linux.ibm.com
Cc: alice.mei.rogers@gmail.com, dapeng1.mi@linux.intel.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, mingo@redhat.com, peterz@infradead.org, 
	Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260425_155017_897684_7E81EDA8 
X-CRM114-Status: GOOD (  10.16  )
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


