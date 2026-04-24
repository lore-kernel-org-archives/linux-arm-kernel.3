Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A989BFED3F0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 16:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l4V5NPppnOwBca93KfwrOU1gh2Bqmr4SRvd044JdzTk=; b=HAsF7puutCpBTJ75jKtn+bn7u1
	Chclmm0cVjZ8b2A1kj1iWVMEPhiEEz6kHrggm9dc2KwQlOZ81ekf/tj9XSXFQSnqUmsyJgnpGKa82
	Tj/W8Dm4PPMOy4OdvRWulZwMTnPY17GmNXZAsnSdOoEHFcl5vp57JFJLiWXbPvooVXNbUhzvnFWfP
	0N7PZQhbxPAu+VDDlo5qgVuYNIFmxnAVABt66n4ATWf2vZ1CeDYE0CG2gzOq55F+TIVp7agbozUYy
	Ok+XQ1WyqRXJ6KDblwJ1XnpGDydpFHyqbcNX6iVfN4lgW+GCHLbDCnn8/ATl+Kzj62kj39YtpvB0C
	ZA6hc8xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGJkD-0000000DWce-2583;
	Fri, 24 Apr 2026 16:51:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGJiz-0000000DVEO-0gVn
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 24 Apr 2026 16:49:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=l4V5NPppnOwBca93KfwrOU1gh2Bqmr4SRvd044JdzTk=; b=eEjSjUSYneEkIcavZaRj4sEAlM
	Qnm5I/6bZjT5JPRtrME8Dp3z6t7LmiqU64MRzlYDhGIIYMQVYA9mlcBIzzZ6VZDhfmUKVNRnxQUk5
	QC31SKsk+No4UXsI2P63W92Elz/5qeZ8MGdzs5VnA4/kzyXtULzEXE5KE96bKfK8Ky6oWCAjC83z1
	u1SN/dOi19VdEdk1EmlplIchBpBfvsQq+JAx0J2hIsoDp/qgYuTfCWKvrTBBiVkL/MdCYwpwL3RtW
	JjltNo0PvjrtCalu863XPaNhtf7nRR/iFt9g6v+3DlCOtFcHkC1DKo/ajr5y54g5qI706gakInzcf
	+h5kKUiQ==;
Received: from mail-dy1-x1349.google.com ([2607:f8b0:4864:20::1349])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGJiv-0000000F9iT-2fq4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Apr 2026 16:49:51 +0000
Received: by mail-dy1-x1349.google.com with SMTP id 5a478bee46e88-2de07c12745so19757290eec.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Apr 2026 09:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777049387; x=1777654187; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=l4V5NPppnOwBca93KfwrOU1gh2Bqmr4SRvd044JdzTk=;
        b=omeDuSnwisOXiijLloOA+W8NyNLL6zEgBvHd/d/g6ujDCs++liGHD/eqM9AZVQGWhX
         GYtxi1XeoWFFlrYZOVSP2WmLQ3JhuP7ab56VEY85R9+5rbxIk3J7xdPnxgnhTIW0Goex
         PFGVGeWwG4Y/fKPY9gJj1J8zSdeEW+pnjrVAJ7I9m+Pd4yriFTDFEOX1xd2l09GcweO9
         q83f467g8SYw41gY38Ldv7UhOdA6pAnDLy8yKncSIEuHSpB0/HygGtUht1c1TrohQ7/U
         A45kNdnskpDKEQES/wh69aIFiMEHv5ouCmU1Ib3BJlp1M5jdxKHY7jjmZiYyeZHQ/SYw
         2PIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777049387; x=1777654187;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l4V5NPppnOwBca93KfwrOU1gh2Bqmr4SRvd044JdzTk=;
        b=JYZGff0gk3DRoBp5vM//GQIvWPmn4sb/9/NHmNynynC+cl1S9CfXooMAY03kNsL4n4
         uWAeVsajnzWoYEUm5RH1ncTwImw/jrfigqlWBGYMlOOSTHGGNs3fzQQWnuK2Rv0lqaxI
         3iby9RmYo5c5i5WoSB558Dt3Zkeqv3zUa6CBJaHPR586NnqddomIDJ2HrPnvBoj5YZ4D
         Dv8KsPmi7WD+gbEeer9SFyQvm3kW1E4hJvx3ZlztayWI9e3Tebfx3rhVO96C9o4vgAiA
         pjHOu8Na4tW/f3O+F4O2fxZhskrQkr8rXN9p45JSUysl5LiooCB7opzyayp4PXT185JD
         LVng==
X-Forwarded-Encrypted: i=1; AFNElJ++NH+8gkHMzjbLk4v8TitPt/I46mNVO6Dgj3DdBYIz7MtlfA+7oQrocBj6h3m9HIlBYgvm0P8cZCkWbl0dDdMi@lists.infradead.org
X-Gm-Message-State: AOJu0YzPJzf2DW+qxmU0vGXvO5l3NrvxVuEsNyBbmmE2PLVDVk3yLxGl
	ENh+kXwcneBohskOqbfbSAp+vr2Bb67vuKnXMZNlQH0HgCyejReKjm5EthXxRh2EJv+s4Ij6obD
	La6BmValQ4A==
X-Received: from dycnr11-n1.prod.google.com ([2002:a05:7300:e9cb:10b0:2e5:fa99:f6e4])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:f193:b0:2df:5715:82be
 with SMTP id 5a478bee46e88-2e466044880mr17000479eec.2.1777049386687; Fri, 24
 Apr 2026 09:49:46 -0700 (PDT)
Date: Fri, 24 Apr 2026 09:47:20 -0700
In-Reply-To: <20260424164721.2229025-1-irogers@google.com>
Mime-Version: 1.0
References: <20260423163406.1779809-1-irogers@google.com> <20260424164721.2229025-1-irogers@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260424164721.2229025-59-irogers@google.com>
Subject: [PATCH v5 58/58] perf python: Improve perf script -l descriptions
From: Ian Rogers <irogers@google.com>
To: acme@kernel.org, adrian.hunter@intel.com, james.clark@linaro.org, 
	leo.yan@linux.dev, namhyung@kernel.org, tmricht@linux.ibm.com
Cc: alice.mei.rogers@gmail.com, dapeng1.mi@linux.intel.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, mingo@redhat.com, peterz@infradead.org, 
	Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_174949_814797_47E26427 
X-CRM114-Status: GOOD (  12.40  )
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


