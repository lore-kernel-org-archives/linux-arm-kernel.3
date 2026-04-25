Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1BABFF885C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Apr 2026 22:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l4V5NPppnOwBca93KfwrOU1gh2Bqmr4SRvd044JdzTk=; b=SYDrLVLxZQmeLrt/ElH5v1oJP8
	NaUtD+QjMAHsgmsXGysE4qvq9KMgMTysPPZdspevCeIK7y3oZks31T7RYfkHKzr/rGBUiKkUIp7ox
	W3WFgLhO/BCnwg+B4iz/OYX0/ChdWy6KEi8RjTsYOYWtOTt4kqOsRtySnF1Qw4ddNIid0Si+F2kPj
	v9X3j/FXuBmAxyce0yg214SjU0/mV38r0grbwUZnDZH5N/pEbshKKq5XxT+sxuxw0WE0aW4uIWJTA
	H0JuCkdurMknBQUqCv9nKbTwdYsjRSXxHDNJsSSLT3RPWEuVOhGbNmcbCxUcLTvY/HrXBxJtrLpj5
	9NAZDvvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGlsa-0000000F1T5-0EcL;
	Sat, 25 Apr 2026 22:53:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGlrI-0000000F026-3120
	for linux-arm-kernel@bombadil.infradead.org;
	Sat, 25 Apr 2026 22:52:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=l4V5NPppnOwBca93KfwrOU1gh2Bqmr4SRvd044JdzTk=; b=NxUdJFa9uk36AcZF9n/oQ4ItSC
	oTsFfyeUHjJAgKHeeW+XhMfcrSTY82V/q0hPNIXa96X38/g3knCQQwdekye2mhVni0+1oCaeOvrF1
	ZPiHe1MfcT8fn9ThB74uWQr0RK9XmOhxhG8cyYckRTS72oyfSxtOzSUjajRnIh3FX/cITbhtfndKC
	jrcoMbsdJcEeCGexnrabRJgls4OtaDP5kAsb34MSnWhll8xLtBdTt1nZnEsPBrYD3m37r1Dtelqyl
	Yu60pzOLMIG4gT6/CQyhHUe3tw88ZKoA+kM851oHW/BW+9pFWmNaYzTTF8MArTnR5qhjtm0i04d/F
	qJupDJcA==;
Received: from mail-dl1-x124a.google.com ([2607:f8b0:4864:20::124a])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGlrF-0000000GN6Z-1zkv
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Apr 2026 22:52:19 +0000
Received: by mail-dl1-x124a.google.com with SMTP id a92af1059eb24-12c87ba0890so30475688c88.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Apr 2026 15:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777157535; x=1777762335; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=l4V5NPppnOwBca93KfwrOU1gh2Bqmr4SRvd044JdzTk=;
        b=DLdlA1BnGO9NBL4A9mFGFZYgVj6RcVRBdzuSeKlfu0H14H2bYlBUqAUmGresMowRuJ
         d14OrHQc3uQ+CC929w4hSHnPQ7cXq8+5XZOvLMph5ki4NlCNYeCqKyzeEXI61cVd/hPG
         TSCF0yDR+YqL/EvQhU4HVKbORPCl/XPkvfgejTJJ11PQBB7k8tyeWYOKhkgWVIxbCr3w
         gX8/jWsaH1WT3fcwgKZI6cwd4MDHjmqgJuzIecEE9rBfUKmP2eIWcTAg3cehS73lWKb+
         HhYFcClciv+I8UNE/K9Ofd/bNTyQaNdp5FMfgEww0p14Tf7+JrtX1tqZuNj5qRFYx2ur
         ga/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777157535; x=1777762335;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l4V5NPppnOwBca93KfwrOU1gh2Bqmr4SRvd044JdzTk=;
        b=HWp6IxJpDWpOba8UYGAjMs5A+UECSxizJIMfMextB0EQnfpVv8D0EhjQmukX2qhC6h
         hvg31dU1mxxz+cGNo5vRWxnlDbT17Da7kkLDsCmqtRdPFDzmayKsnCXNxlgifl2HDIKT
         BXPnJrLl/9NMpqP+h2tBPcB9DCKKKifhQ6eY9PjcgBsG4A5LTDrb8kp+X7tsTrwN545k
         eyA+WwbVRqrU0iIWF91WWpsNJXPeRcq+ZNQoJLgUPplTqTLaWXcppDtQBp6bGe4rf2Re
         the8GIj3xW9dVj8JP6dKeVG3R4/mVxJps4W65Qu30ldYw7xFJ9qmf6xkGtoGVpXNLd99
         +gRA==
X-Forwarded-Encrypted: i=1; AFNElJ85Qqtoyq3s30TjyIyH30DPtbaqZUQX6dvsGg7dLqkYF1xDwSpEAjw2QQbscCw/dKNECKSqJ+S1gi1AHDnauPLY@lists.infradead.org
X-Gm-Message-State: AOJu0Yxh83W303//MGehqlb8oHf2e6vcL/4FcFHdGhwTAegFDmShUtgQ
	V/BD4qT9iV4CPCxcz7dpKJOpA1BR8rvTzjMPllT4IPY06dUJGL/F/iEzGoEoN1daNxNfhoRHCWx
	1V5NMrTvw+Q==
X-Received: from dlbec10.prod.google.com ([2002:a05:7022:d8a:b0:12c:34da:e06e])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:689b:b0:12c:8cb9:fc7
 with SMTP id a92af1059eb24-12c8cb91328mr15865741c88.11.1777157534750; Sat, 25
 Apr 2026 15:52:14 -0700 (PDT)
Date: Sat, 25 Apr 2026 15:49:50 -0700
In-Reply-To: <20260425224951.174663-1-irogers@google.com>
Mime-Version: 1.0
References: <20260425174858.3922152-1-irogers@google.com> <20260425224951.174663-1-irogers@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260425224951.174663-59-irogers@google.com>
Subject: [PATCH v7 58/59] perf python: Improve perf script -l descriptions
From: Ian Rogers <irogers@google.com>
To: acme@kernel.org, adrian.hunter@intel.com, james.clark@linaro.org, 
	leo.yan@linux.dev, namhyung@kernel.org, tmricht@linux.ibm.com
Cc: alice.mei.rogers@gmail.com, dapeng1.mi@linux.intel.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, mingo@redhat.com, peterz@infradead.org, 
	Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260425_235217_597686_09639CA6 
X-CRM114-Status: GOOD (  12.24  )
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


