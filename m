Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EE6EFF885A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Apr 2026 22:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=niT+j+ygae4DUDVZvlLCzSKgJX/QJcllkfXgy9y3G00=; b=mwB1YjYbgOLafLFnoGlUSotpYs
	/4unGNe9TKLvCi6eA1s/qVLWg231ayrkBTY9m3edgbfSXf/Dj11KdlMLJK12iPvEPXSxJDdAn6Vhz
	bcC+JiQQmKyNTBmpwzgYXIOjrj4tHoFjQpuVT6D5uCQs06DBBI4ZfDu0MkwGsF84tez4cGxrNc6lL
	j1tEVjeUrijbnrbU58WiZ2OKEHHOi/AwCShNOBDomV/kwois4ea9fBhWJzysodIzU/tw1gOxhCyfd
	kh+b+A3uoSmxFBZp5rTOGGalVEwlV/KMibsglACiVuXFAAPquEhlzraxBTI68uI8tGjbNAzp7ZkD5
	OyNrJ4zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGlpi-0000000EyFB-2jrR;
	Sat, 25 Apr 2026 22:50:42 +0000
Received: from mail-dy1-x134a.google.com ([2607:f8b0:4864:20::134a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGlpV-0000000Ey0m-1gph
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Apr 2026 22:50:30 +0000
Received: by mail-dy1-x134a.google.com with SMTP id 5a478bee46e88-2c0f6593ef5so11439452eec.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Apr 2026 15:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777157428; x=1777762228; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=niT+j+ygae4DUDVZvlLCzSKgJX/QJcllkfXgy9y3G00=;
        b=N59+UifxXPuZM3k0RT0jKQMiZw/EzUafC5YzABldRw9IXUCbTMAec063ZusuLOopVj
         zlXAtaRvatJNWtm9F2oXfC2wIaB1+wIJzPLn+5bHrgYeau17vG/qQZ6f4PRtGKPawPaL
         chgoEck4HyzYSPkUxqRZm/a8b9WbEqbCjguyHf60x7aP6xahyeWQVm0K8jsv/05i/dnk
         k1/CcsjvoDnh6h6C3GjasmQt3zD145Sp9wuLPor6uhBxG9QS57rBrVwey6/NlaxAgbkJ
         cVratLw5+brGaVi7EtBjNRK6z1jseJ2IC6xLAUWVNNkar66L9mhNgmW1ubFJqMdlmkyn
         zVUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777157428; x=1777762228;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=niT+j+ygae4DUDVZvlLCzSKgJX/QJcllkfXgy9y3G00=;
        b=qrnc8s5W4R5c1ACqzKI35/9DytY13d8o5oJV9TQyWHTsxmKpZm2DVBL2+0ZR0eQZEv
         +X0xlIyV7wJjIsd57UHOZFCzn33LwKU8JLiyE+4xSUtWfjLkiGFeNnX/uj9QWHMUL2xe
         HP/E6TdGqfMZfGYeGfyo2rPjILwhnLhU0oYqqYb70fGOpiWnEhhgYil/3bI0qIgDcKCC
         XwVs5yqE8eJooTrX0fXEyfklQ4Exu1XuosJAe3RrmD4uhg777KF8mw1q9hItd/kSgs+N
         JYvv8ZXnBc5VFkHeP2ffJvOAMoNW5CRXvx6Ba9LeaXvL3F56sNwIRKj8btDLzEdt6C6v
         17sw==
X-Forwarded-Encrypted: i=1; AFNElJ+T5c7xmP9ezkQxwrPt0nXb2NHMgvwZ2/O+25NmhIz0a+45yckkq09vt9pUOsDK0IdSACr0vHBS8dZgHtsCwvpe@lists.infradead.org
X-Gm-Message-State: AOJu0YyGPHVWOsTiY84dn8iTDUYqwBZfGzPcF6XXiqg/uRygSNgLX5q3
	iWhUhub28WZUcb2liEQfQy4b/eeiJiVvwiwMwUfp0HbQpmsD3sAqiXy/NazV2gVbUE0V90IiWfN
	tWFZ5J/lIIQ==
X-Received: from dlbpu10.prod.google.com ([2002:a05:7022:e88a:b0:12b:fba9:5eb0])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:4199:b0:12c:2cf8:2f30
 with SMTP id a92af1059eb24-12c73f83616mr19958155c88.15.1777157428055; Sat, 25
 Apr 2026 15:50:28 -0700 (PDT)
Date: Sat, 25 Apr 2026 15:49:00 -0700
In-Reply-To: <20260425224951.174663-1-irogers@google.com>
Mime-Version: 1.0
References: <20260425174858.3922152-1-irogers@google.com> <20260425224951.174663-1-irogers@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260425224951.174663-9-irogers@google.com>
Subject: [PATCH v7 08/59] perf evsel/evlist: Avoid unnecessary #includes
From: Ian Rogers <irogers@google.com>
To: acme@kernel.org, adrian.hunter@intel.com, james.clark@linaro.org, 
	leo.yan@linux.dev, namhyung@kernel.org, tmricht@linux.ibm.com
Cc: alice.mei.rogers@gmail.com, dapeng1.mi@linux.intel.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, mingo@redhat.com, peterz@infradead.org, 
	Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260425_155029_446843_73DC6090 
X-CRM114-Status: UNSURE (   8.71  )
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

Use forward declarations and remove unnecessary #includes in
evsel.h. Sort the forward declarations in evsel.h and evlist.h.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/evlist.h | 15 +++++++++------
 tools/perf/util/evsel.h  | 20 +++++++++++---------
 2 files changed, 20 insertions(+), 15 deletions(-)

diff --git a/tools/perf/util/evlist.h b/tools/perf/util/evlist.h
index e507f5f20ef6..e54761c670b6 100644
--- a/tools/perf/util/evlist.h
+++ b/tools/perf/util/evlist.h
@@ -2,29 +2,32 @@
 #ifndef __PERF_EVLIST_H
 #define __PERF_EVLIST_H 1
 
+#include <signal.h>
+
 #include <linux/compiler.h>
 #include <linux/kernel.h>
-#include <linux/refcount.h>
 #include <linux/list.h>
+#include <linux/refcount.h>
+#include <pthread.h>
+#include <unistd.h>
+
 #include <api/fd/array.h>
 #include <internal/evlist.h>
 #include <internal/evsel.h>
 #include <perf/evlist.h>
+
 #include "affinity.h"
 #include "events_stats.h"
 #include "evsel.h"
 #include "rblist.h"
-#include <pthread.h>
-#include <signal.h>
-#include <unistd.h>
 
-struct pollfd;
-struct thread_map;
 struct perf_cpu_map;
 struct perf_stat_config;
+struct pollfd;
 struct record_opts;
 struct strbuf;
 struct target;
+struct thread_map;
 
 /*
  * State machine of bkw_mmap_state:
diff --git a/tools/perf/util/evsel.h b/tools/perf/util/evsel.h
index 339b5c08a33d..b099c8e5dd86 100644
--- a/tools/perf/util/evsel.h
+++ b/tools/perf/util/evsel.h
@@ -2,28 +2,30 @@
 #ifndef __PERF_EVSEL_H
 #define __PERF_EVSEL_H 1
 
-#include <linux/list.h>
 #include <stdbool.h>
-#include <sys/types.h>
+
+#include <linux/list.h>
 #include <linux/perf_event.h>
 #include <linux/types.h>
+#include <sys/types.h>
+
 #include <internal/evsel.h>
 #include <perf/evsel.h>
+
 #include "symbol_conf.h"
-#include "pmus.h"
-#include "pmu.h"
 
+struct bperf_follower_bpf;
+struct bperf_leader_bpf;
+struct bpf_counter_ops;
 struct bpf_object;
 struct cgroup;
+struct hashmap;
 struct perf_counts;
+struct perf_pmu;
 struct perf_stat_config;
 struct perf_stat_evsel;
-union perf_event;
-struct bpf_counter_ops;
 struct target;
-struct hashmap;
-struct bperf_leader_bpf;
-struct bperf_follower_bpf;
+union perf_event;
 
 typedef int (evsel__sb_cb_t)(union perf_event *event, void *data);
 
-- 
2.54.0.545.g6539524ca2-goog


