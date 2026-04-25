Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67ED6FF8864
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Apr 2026 17:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l4V5NPppnOwBca93KfwrOU1gh2Bqmr4SRvd044JdzTk=; b=iaZPWvXpKij+YqvBXflVgQzIxY
	rmrMtIeaoWDqL+bGMylY60DeEIEm3Vt2KMMjPFLBUmNR/CQk/hwGLmtlazT9o9ut6JqLh/ut0bjS4
	hJfpLBfe5tYGMgZzOmIUzvVu9dyYESWKJpyWpmSo5tgU0/o4GCnoInwTGxwIo4lFkhtFF/u37WTIU
	4DebM5KWF18i7rMw/qvXQ8jj93jA9R9GQqQILCt0tT3MWOAdVFJy+kzNxY2x1g4uEYShe+vbPcL88
	mR02ypZ3r38GcDX2hv/swWzBe+djrRElDYb/FTIe4WMoElbftibGk+pXIqrJQ1h/qQv2EXSXT3H3F
	+0RsNb+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGhBp-0000000Efiz-0MQK;
	Sat, 25 Apr 2026 17:53:13 +0000
Received: from mail-dl1-x124a.google.com ([2607:f8b0:4864:20::124a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGh9f-0000000Ee5H-0EUh
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Apr 2026 17:51:15 +0000
Received: by mail-dl1-x124a.google.com with SMTP id a92af1059eb24-12c91ef7009so23335763c88.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Apr 2026 10:50:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777139457; x=1777744257; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=l4V5NPppnOwBca93KfwrOU1gh2Bqmr4SRvd044JdzTk=;
        b=njq+OpqFAhFQF2WJ03TZCNDybKG5AcUX9dA19BTrXFWUhG28gTPBwIIDOORCw6U19S
         hqstikmVxDSam8QGEC9LpQQ+f+ElB8d0plGDUP3ECaLOkHcU+kSTB7OTBK3ZiSJPNHSN
         zLCleIkE8lX6hdF6JTmOqx4bSvnEIhsU1I8ouKB5C2M+1jSQPgjrfoqP53kcqTIOvL0s
         v5YCS/XQzfIOEtXyTFBgvHXS28E9Y5czZfxc1jqdOeiUNf0bGpIO2OKwbmXG9Cx1Vsrr
         fl+pzV9Hvk6ByXC2KEtk6CJaEpCv7qgTB2nonfJm0scnieDnQqDK2rGkMasX0L9M9Squ
         0eVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777139457; x=1777744257;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l4V5NPppnOwBca93KfwrOU1gh2Bqmr4SRvd044JdzTk=;
        b=ctEzjUW/OAS6VEItKY2ETorow2hlRDDESV47OtOco0Iutn2Vf+vAwCK9DwaRZMr/kQ
         hmmg1a4Hl53NuyiNZknaufCMCuZyv+5upDLJCi+XunsQPiEtYlL8apxshp5a743yvkMB
         8h1UQxWyqq71Z3mtsxI6lF/aI88Obebsqnv1QC7WfeTIWC6UUyLMpZVUFHcMFXnNL3Q3
         cmacm4HqezSxT6yrtexswrL2ZTSn2e09GRa9TJ8xCoo/NIir9G4VQsusuizkEBJ1jV6+
         2uonemEQlKWyLFqz1eU5HNrBNPE5q5ZqDXYLM9U5IPri6oyHnua+7omXxoHfaTQ9+kBR
         EJ1A==
X-Forwarded-Encrypted: i=1; AFNElJ8UrGFbMvm9pbnbJ5tLi8buXfiC97NpBFZWdVP3DKDo5pLBn1mJ9iLI7UKHojZe8AkJFvzOx8TmTkU+l7CdkYkt@lists.infradead.org
X-Gm-Message-State: AOJu0YzuPS8vmSW35sQVRJ6RWefifHTAgWJJCdILRWt6hn6F/KGCkh+y
	v+kkF0nE+TJE6ArynAgYHDrLi2NGIj/AJy3ZRtkmUKLzZOtlSk8/b/bwGbgwiUCNLAERIdEKPmZ
	GpXwtkHUzrQ==
X-Received: from dlbqq1.prod.google.com ([2002:a05:7022:ed01:b0:12c:8bfc:84e3])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:12b:b0:11b:ec5f:1c37
 with SMTP id a92af1059eb24-12c73f996d4mr21334956c88.18.1777139457260; Sat, 25
 Apr 2026 10:50:57 -0700 (PDT)
Date: Sat, 25 Apr 2026 10:48:56 -0700
In-Reply-To: <20260425174858.3922152-1-irogers@google.com>
Mime-Version: 1.0
References: <20260424164721.2229025-1-irogers@google.com> <20260425174858.3922152-1-irogers@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260425174858.3922152-59-irogers@google.com>
Subject: [PATCH v6 58/59] perf python: Improve perf script -l descriptions
From: Ian Rogers <irogers@google.com>
To: acme@kernel.org, adrian.hunter@intel.com, james.clark@linaro.org, 
	leo.yan@linux.dev, namhyung@kernel.org, tmricht@linux.ibm.com
Cc: alice.mei.rogers@gmail.com, dapeng1.mi@linux.intel.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, mingo@redhat.com, peterz@infradead.org, 
	Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260425_105059_183285_D0631022 
X-CRM114-Status: GOOD (  12.50  )
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


