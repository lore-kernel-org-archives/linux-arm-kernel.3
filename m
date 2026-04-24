Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EE5CFED3F2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 16:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=niT+j+ygae4DUDVZvlLCzSKgJX/QJcllkfXgy9y3G00=; b=efbtVsncyc2gHv2VcUXdNjFTXS
	80D7W2EH/LLJcmGpP1isVUNfAnngPkQ5fLq+1yzYJBInAdNmVBfyTc7TeQ34E+BMZ86zL2P8+7NQj
	aTbdz0aWH7aXByBOVyTh8qNb/YVZqKz2QiBd9GnvGHz6sHPXAgur94M843MHTQHtyTsqtFHXdIwr6
	U1PpW4udKNFVuuJ7SxTC3EBOyxrUiJaF15kKBvR1+tqO4g3b9GNU15t0iDie906AkDMWiBYa4vyBX
	eTDx6CEmzTbveOCwBkk1IQCJxE2Kmcsv2OZQVN8/7VZbcz4S8DLk5EHVA367+5/3T4sWN3GnvF4D+
	HqXvXHfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGJhH-0000000DTRn-2B5y;
	Fri, 24 Apr 2026 16:48:07 +0000
Received: from mail-dy1-x1349.google.com ([2607:f8b0:4864:20::1349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGJhD-0000000DTNe-0HoP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Apr 2026 16:48:04 +0000
Received: by mail-dy1-x1349.google.com with SMTP id 5a478bee46e88-2bdf75bc88fso10402160eec.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Apr 2026 09:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777049282; x=1777654082; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=niT+j+ygae4DUDVZvlLCzSKgJX/QJcllkfXgy9y3G00=;
        b=adMAaySgMSWFuy+rECuXOVZo278mme9Jxalm0F4SxwEcGzvIptCavXXGj+3desboi2
         QYkvRbW+9Eeazd0egPpEhvcNouiB2BsNGEt8bGWBSzLWsntACG6/tPLQJhsi6JHo/Q8B
         Tmmi/1kAC7/3SJoLpQue9UHM7IrKPQLRP+DYSvj8aWvmGFH6SeKdpMTl3OkGXVVqW8Fb
         mm1y/znE5LSyZN2sSDOHKLQeVbKaV8xenzoUA/zCLvXXGkKCkaQSZXw6SNrgUy5O+Z+j
         F5KIu/y3knbO/lQm7ff9Z+od96RYrT1SyqCsZLAPjATWMT5FnmR5BnfkyGeADUWQsMvG
         Rkag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777049282; x=1777654082;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=niT+j+ygae4DUDVZvlLCzSKgJX/QJcllkfXgy9y3G00=;
        b=NeKfFVAh2f2+3i7ZgmTSRlbYzfUFSJCtylyISjiMXMXL1jZuoGHdDKPNgPTeu1G/YU
         Cqy+U7l7+O+vid4WAWl83SV997qka+KXKKKxgZQLDft6Sm6oGdhROHidgnZPMRjk2uUA
         0YByFivhFssp/TQs6tArOSG4ToIh1vn2X+scGX0LlutbVRCeXe7nEfXg/yMWhuQAO+oM
         FftBxWV1XJy3UBdvJlwoGI5ZwBUN0gHSjRwY2/BqCC+gnn+HYREgXAwrRuPmw2ndq0Tx
         a4jGUkWcA0GszZak06GmmHcTGcHyg4lcmg0UZa5irrF82jDrHFyI22esrZGH1NyIq2Fo
         crrg==
X-Forwarded-Encrypted: i=1; AFNElJ/k7gNJ8FucjXU/sNYcJaB7UnYtJ7943hr5n9f2d2UASjIr5sj3egcJktduHRH4cy2j2TJHVyHuZPItaM1WNvks@lists.infradead.org
X-Gm-Message-State: AOJu0YyAK77YWbFJg3P5PamHFjucsHElMXRwSShKhxiM3kB6ByWFoi7L
	P77roTkRGNsF+aqCGadkMpPet4A+Dien4QMPUDkRGFF2eddyS6ooNXi8ifBp+DF9v0tbSm+xDf8
	/gE1d64N4iQ==
X-Received: from dybrt7.prod.google.com ([2002:a05:7301:4707:b0:2d8:e988:4a97])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:4185:b0:2e0:1f09:d924
 with SMTP id 5a478bee46e88-2e464ea9aeemr17387563eec.5.1777049281746; Fri, 24
 Apr 2026 09:48:01 -0700 (PDT)
Date: Fri, 24 Apr 2026 09:46:30 -0700
In-Reply-To: <20260424164721.2229025-1-irogers@google.com>
Mime-Version: 1.0
References: <20260423163406.1779809-1-irogers@google.com> <20260424164721.2229025-1-irogers@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260424164721.2229025-9-irogers@google.com>
Subject: [PATCH v5 08/58] perf evsel/evlist: Avoid unnecessary #includes
From: Ian Rogers <irogers@google.com>
To: acme@kernel.org, adrian.hunter@intel.com, james.clark@linaro.org, 
	leo.yan@linux.dev, namhyung@kernel.org, tmricht@linux.ibm.com
Cc: alice.mei.rogers@gmail.com, dapeng1.mi@linux.intel.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, mingo@redhat.com, peterz@infradead.org, 
	Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_094803_124297_52A6FB90 
X-CRM114-Status: UNSURE (   8.78  )
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


