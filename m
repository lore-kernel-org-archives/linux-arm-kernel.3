Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 618D4FF8864
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Apr 2026 22:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l4V5NPppnOwBca93KfwrOU1gh2Bqmr4SRvd044JdzTk=; b=VHwvTBiaUG0wWkBdiN2pc669LV
	bUjloQCO4TgOAEvaok+JgvAb3RMKZPcCUfnKsW8cJ9Mzoboua/hbIAKldgI/0lVnjf0Ssd0fbS6aV
	QI/Chl57ifA+iUUZS/GEfBsCdxeux0qt8HOLnveGAzIU0I7rNbIlrDBMPkmEgUt4QAGTGLZ2ZNsNN
	0FdTll+kcJjbiqPzKzXTYeIhVHfaToUzyuoIU97Ic5uZj+sVaHHPFbjinG+zLQSi2wVL66DH+v0Na
	w6R4r5Ju8QknjStgC663rIhgPoI7LrVgO/h99E94wzDkpbSkzHwMEbmZ5T9ukLpllh5kxr2TLt85x
	Ls17JicQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGll8-0000000Ewle-07jH;
	Sat, 25 Apr 2026 22:45:58 +0000
Received: from mail-dy1-x1349.google.com ([2607:f8b0:4864:20::1349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGlkr-0000000EwVZ-0hW7
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Apr 2026 22:45:47 +0000
Received: by mail-dy1-x1349.google.com with SMTP id 5a478bee46e88-2ba9a744f7dso11748453eec.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Apr 2026 15:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777157138; x=1777761938; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=l4V5NPppnOwBca93KfwrOU1gh2Bqmr4SRvd044JdzTk=;
        b=jD1HlD7xxl5T5p7J33L0QoIwHJ0IfMsuLMPkOegUZrgPF0c2bu7ETgmrhRL+zx9kCC
         SZELS0YIYA98g9EFH+ejYk/RXkJrZ1NBk+FQvkCblrFshdDnSobbrA/1Pz9tnFX+pYDJ
         4s+7sb0VjUyBuR2WoRFM3sY/iiD/epCh2QP4UTWTgF7ieCB4x/Oyei/gt5ZL4WMgi+hn
         Elx+27nCKKypWbA2wqhObuZK2eS6YlI/Pg5hn/4jsFUwI1lF8iHi3HFZr+nA2aSrrGuP
         cadqXqZQ6/hUMx0cVA+9j0IWyhBiS4vy9gVQpHq4rY2htpsCOw72aLQaN51LqcQWXqV9
         UC4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777157138; x=1777761938;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l4V5NPppnOwBca93KfwrOU1gh2Bqmr4SRvd044JdzTk=;
        b=BktkgpLM+pUNXudW21zVJLsWMasfUvpPFwws66V0Hc3+qxxGjq6QJKidQSpCHXNgyM
         rNLRD5xXTMdfPgAEHH4pZJNInpSKLeu5tiERBQFncka2bOe5papSWWC/2K7pzOFHo6zc
         Un6yYqnn/dN27CLlHPLk0I1AkS10ASh2N0zExjnpcmg4EdI6uZCBaAC29W641sTRCamr
         lw87wq3AFkmaXzhipCvzWBpXhgZxMTpp9bwdgE0t2Iwx3KaBeLs5EpxoF68msLC7JGA2
         cWJrkc2IorQjMRK4P31yWTgwWuggitiVa9u8uOUXhiwtzAKfTPWRCxvKH45tA56B/cjQ
         9CBg==
X-Forwarded-Encrypted: i=1; AFNElJ/HolxXf/HsRDGk30A7rHxeHDA2tytERmfvRxo6GM0Whf5Na7/kahfz38JU4I/GHcO+npDP8Egwtkq+MC9pYFZl@lists.infradead.org
X-Gm-Message-State: AOJu0YzFoWO97SkjBlu+pT8Qk2qIpCHsQEfwdEZlK9Jo2vtV7hDvlMTy
	hZi7MLi7Dag2xPSeTk9ltuvskmK0TwtMFr9bBuD95XWW09VJLN1N9msMjmCDD4a4uBIOS6U4mpd
	BKxBrJvolVw==
X-Received: from dycai17.prod.google.com ([2002:a05:7300:fb11:b0:2d9:3459:1de6])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:214e:b0:2c4:dd55:ffc1
 with SMTP id 5a478bee46e88-2e464ea4fffmr19490662eec.2.1777157137979; Sat, 25
 Apr 2026 15:45:37 -0700 (PDT)
Date: Sat, 25 Apr 2026 15:45:02 -0700
In-Reply-To: <20260425224503.170337-1-irogers@google.com>
Mime-Version: 1.0
References: <20260425174858.3922152-1-irogers@google.com> <20260425224503.170337-1-irogers@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260425224503.170337-16-irogers@google.com>
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
X-CRM114-CacheID: sfid-20260425_154541_346839_AA49B16F 
X-CRM114-Status: GOOD (  12.39  )
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


