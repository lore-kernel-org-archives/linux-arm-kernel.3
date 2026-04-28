Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8AD1FF8870
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 07:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l4V5NPppnOwBca93KfwrOU1gh2Bqmr4SRvd044JdzTk=; b=O7pmAAIfldlvmLOph3dDMzMz5i
	AhDqUJSXQT0OENWgyNhkk/8q2fSIOqJLcVwcx8SxqVj/RWYdZKJat1hKGtw6STLlXNT3+eZSLKPO5
	ydTieQ0te9TAWnjOkdgSi2OoWhSxnHiIqPuhCXpk+c1OPYTH7xKG4Oh0gzsUHbUBOC4gYwEq10xJF
	gbvCgzbapRBjZoJ34yvAcB8rsZKjDt7i7PKlqOlwQbpx09F+6jHsNjsthKmuH9JiN6fsipfwYc5bt
	ut+U5pGkPKL3rJukgZ4LmNVvuLpRMGLGF+TyG7r+71T7qJNuUYpViPIU3boXtcYL0KzQq4Zm/A/fY
	mKK6k2vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHcmz-00000000kNU-0IyP;
	Tue, 28 Apr 2026 07:23:25 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHckv-00000000iDz-0VLZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 07:21:28 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-2b461b36990so120526185ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 00:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777360875; x=1777965675; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=l4V5NPppnOwBca93KfwrOU1gh2Bqmr4SRvd044JdzTk=;
        b=bznb5e77Pd7PdzE8nEju8JOy01+l/x6/PG5JXKt6SIgbtUpjfhv7JkpBS28EIX7vHy
         Sc8+yoflHZuqAkaW/CS/QGkPzNXzsQOAkgUYfEb4oTZY8qneJxSwqix8jF/fdLrAzP07
         IqWcO25oLlUHndvifZyHkdmUzv8E5fddVWlHuP1Qrvq+9kniENwKlCp6iKJjZmG2bi4x
         xLsCng+0lpY5a0Cs7sfEtpEq/fGDuQr3loSsLIm0Sez/J1gBs2XuW8sMzB2NNduYF5+W
         MYpPXem/KEytQaB+Uppnehoxf3MJ56O9cZ6kfQ8vK4u3WdcTNS3kRM8NGV5s16ErcKEk
         ecqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777360875; x=1777965675;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l4V5NPppnOwBca93KfwrOU1gh2Bqmr4SRvd044JdzTk=;
        b=bYkj3Jx7kW+WTlTtM20aCKf6qPRH5wGQ7vR4jtrpovilYvYbHyxiI3RNEA3b7vhuKW
         qFyOsU4y61dVcq6v9ujEtQIttoq2QoChseko1+JEO5NHV6GPE+K1Ij+IpAfQfKl+UmZL
         s9Pi99ZXrfsNFhrZPLnlM2c4jnHToXfOZwEIKJcUXm0ROPwBcXoq8FiJVGhGTS1tXqnw
         kUR0IvMDwG3CTXpkJ2tAouTwVfng0tZYJwpD2togrkbGJZgo4hkupZbsYC3JBHcLMf7s
         w3znzK0WQGfVQoxHDq5rLO9fDAmmcLyp7BtgD7+II7tpXmXb/EX+b6/fXWIebmQ0IJpK
         ffBA==
X-Forwarded-Encrypted: i=1; AFNElJ9Tea965nwKyaM+wtnLyJPengpl9YIby6Hi78nMjO7mxnSi1QG9RKfKppnXmOaTvtSvI25OK2SkHHqMt1l7J3ux@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4GEifA9WPKCqWnoHv/tFoMzv45H+mOoUOKauuVzuFoH9urdvJ
	GfpUluKrYGNA88eYJODtgDZ5cvsoTSAAIQYyhDraETfoM6d6bRtcIRs4/sqa5TNF7lxX9MmC+4j
	et54toUbssw==
X-Received: from plbaz10.prod.google.com ([2002:a17:902:a58a:b0:2b0:6314:419b])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:f54e:b0:2b0:ac1e:9737
 with SMTP id d9443c01a7336-2b97c40025dmr20426165ad.12.1777360874920; Tue, 28
 Apr 2026 00:21:14 -0700 (PDT)
Date: Tue, 28 Apr 2026 00:19:03 -0700
In-Reply-To: <20260428071903.1886173-1-irogers@google.com>
Mime-Version: 1.0
References: <20260425224951.174663-1-irogers@google.com> <20260428071903.1886173-1-irogers@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260428071903.1886173-59-irogers@google.com>
Subject: [PATCH v8 58/58] perf python: Improve perf script -l descriptions
From: Ian Rogers <irogers@google.com>
To: acme@kernel.org, namhyung@kernel.org
Cc: adrian.hunter@intel.com, alice.mei.rogers@gmail.com, 
	dapeng1.mi@linux.intel.com, james.clark@linaro.org, leo.yan@linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, mingo@redhat.com, peterz@infradead.org, 
	tmricht@linux.ibm.com, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_002117_204281_26E66C06 
X-CRM114-Status: GOOD (  13.33  )
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

Improve the description when running "perf script -l":
```
$ perf script -l
List of available scripts:
...
  counting                             Example for counting perf events.
...
  exported-sql-viewer                  exported-sql-viewer.py: view data from sql database.
...
  tracepoint                           Example showing how to enable a tracepoint and access its fields.
  twatch                               Example to show how to enable a tracepoint and access its fields.
...
```

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/python/counting.py            | 1 +
 tools/perf/python/exported-sql-viewer.py | 2 +-
 tools/perf/python/tracepoint.py          | 1 +
 tools/perf/python/twatch.py              | 1 +
 4 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/tools/perf/python/counting.py b/tools/perf/python/counting.py
index 02121d2bb11d..9adbbeccdacd 100755
--- a/tools/perf/python/counting.py
+++ b/tools/perf/python/counting.py
@@ -1,5 +1,6 @@
 #!/usr/bin/env python3
 # SPDX-License-Identifier: GPL-2.0
+"""Example for counting perf events."""
 # -*- python -*-
 # -*- coding: utf-8 -*-
 
diff --git a/tools/perf/python/exported-sql-viewer.py b/tools/perf/python/exported-sql-viewer.py
index f3ac96ada1f5..6d526a2502ca 100755
--- a/tools/perf/python/exported-sql-viewer.py
+++ b/tools/perf/python/exported-sql-viewer.py
@@ -1,6 +1,6 @@
 #!/usr/bin/env python
 # SPDX-License-Identifier: GPL-2.0
-# exported-sql-viewer.py: view data from sql database
+"""exported-sql-viewer.py: view data from sql database."""
 # Copyright (c) 2014-2018, Intel Corporation.
 
 # To use this script you will need to have exported data using either the
diff --git a/tools/perf/python/tracepoint.py b/tools/perf/python/tracepoint.py
index 15b0c8268996..d3bc22628ef7 100755
--- a/tools/perf/python/tracepoint.py
+++ b/tools/perf/python/tracepoint.py
@@ -1,5 +1,6 @@
 #! /usr/bin/env python
 # SPDX-License-Identifier: GPL-2.0
+"""Example showing how to enable a tracepoint and access its fields."""
 # -*- python -*-
 # -*- coding: utf-8 -*-
 
diff --git a/tools/perf/python/twatch.py b/tools/perf/python/twatch.py
index 04f3db29b9bc..e50cc2feb58a 100755
--- a/tools/perf/python/twatch.py
+++ b/tools/perf/python/twatch.py
@@ -1,5 +1,6 @@
 #! /usr/bin/env python
 # SPDX-License-Identifier: GPL-2.0-only
+"""Example to show how to enable a tracepoint and access its fields."""
 # -*- python -*-
 # -*- coding: utf-8 -*-
 #   twatch - Experimental use of the perf python interface
-- 
2.54.0.545.g6539524ca2-goog


