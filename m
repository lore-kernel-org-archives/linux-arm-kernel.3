Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A70C4FF8860
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Apr 2026 17:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=niT+j+ygae4DUDVZvlLCzSKgJX/QJcllkfXgy9y3G00=; b=UrUZfADRCReo7QIFziFrKXfIwE
	O7hrca4uLXgVMPw9bs8dwdjWqPd6u4RSwCrsFFDyBgc930wApppV+TZmxDTyWDL93jOR7uHzDU6vo
	L4wZRD7OlzVLITn2MUMsOuyISsR9Gi+iNpiTer6NTm2QEgjuB7ZjzYqv3fSKyGrVnzjqolhzlHrmj
	AWS4j4hmgfrCL/15aRUhSApT5OIxYKMdwWXo6bfknqamUOxZXStzeAszBL/FNFHaL+fhwHW5MwGoq
	vTTevAQaG/Klevc9F2rzEnEOU7M5KfCeJQudhOcTwGfazSvILx2gOd0xewmAN9aHdXrRFxQgfrbsu
	5GHj7Bbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGh8C-0000000EcLo-48Sc;
	Sat, 25 Apr 2026 17:49:28 +0000
Received: from mail-dy1-x1349.google.com ([2607:f8b0:4864:20::1349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGh82-0000000EcEC-1wYy
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Apr 2026 17:49:19 +0000
Received: by mail-dy1-x1349.google.com with SMTP id 5a478bee46e88-2c0f6593ef5so11276070eec.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Apr 2026 10:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777139357; x=1777744157; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=niT+j+ygae4DUDVZvlLCzSKgJX/QJcllkfXgy9y3G00=;
        b=kRHulghyR0sZnO6UvDSRYLq4G3B/sWSwZMbgb+p4FAbrBjEYw5qvWQK2LMK3maGYva
         yqJTOzXuRH43o+H0Go9r9w1WpBK5t/UWJK46Kck0ThEVN66HorWmtwWVmYl3tUjsCXZj
         3IR7cjf+ZKexUt906hqR/Bj7l9vCB71aX0/OXxVVIIIyWsjO9kFDeA/kozXtjN+SI70p
         JobpZS4cNvbymjwkNWBBOMCybcbDZTwutR32End0/4Ju/SDUgFOchCZIIwUOUzienXLs
         5w8+HAfbxd4hzh1rPlFovgdXAaKslSzIHntZ0/MxtoMJU6blWAEMTYj5ZF0GKwoXhyhl
         sPMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777139357; x=1777744157;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=niT+j+ygae4DUDVZvlLCzSKgJX/QJcllkfXgy9y3G00=;
        b=lSioBfma4CpelQtPyJ6NBxn03ei6+SGRBzsOOVphI0QshuCtRQ9DoTLMEyW8rNT0HB
         hUT7c6TPuggfv48qFMiluFRTa+7ZLOB1iO2lg4ogKBvE3NxSMgEkWSeG8Pys7ntue6NB
         7i9AD0ipTKJh483vScqRhT9EEyBCV3hWbOx9XxHnihoac0B/szwsGb4+6se526qJ+mYU
         S7WxeCrRnRU7RJjLSdOHfXKor1qiKYyQLeV6Yn7xDnzWA2N4wU2tzWRCq1M0JaI7Uwcw
         BiExqOdgf+sL7hLIMmRcaM0q5NVScMrRKQfIMkIIKQvfboX9/VDarTwuT1Xx4eBT8LWl
         OeXA==
X-Forwarded-Encrypted: i=1; AFNElJ9hmYb0z8qmaqZdVwUvV3T5ScsKA/YXBtPRyPPkg+EuGjW1zGSGzWEb3+hGZJKYumBvUSSUwDGNVGp6cjGCZfSH@lists.infradead.org
X-Gm-Message-State: AOJu0Yzgrgx+eD7uX+awrlVWoieYD2U3dTltINbluevnUSfU7S62PT43
	hrwic0cAQ6ODSfVLbLlWckwQi+5XoirIzKRi2VfHEvtC4wGxWWD0nFL3bQx3Xi+g1jHRC5b1V5N
	9L1kuvnClPQ==
X-Received: from dlbur7-n1.prod.google.com ([2002:a05:7022:ea47:10b0:12c:4a54:8b0d])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:1282:b0:127:3b1e:7e0e
 with SMTP id a92af1059eb24-12c73f9951amr17112131c88.20.1777139357205; Sat, 25
 Apr 2026 10:49:17 -0700 (PDT)
Date: Sat, 25 Apr 2026 10:48:06 -0700
In-Reply-To: <20260425174858.3922152-1-irogers@google.com>
Mime-Version: 1.0
References: <20260424164721.2229025-1-irogers@google.com> <20260425174858.3922152-1-irogers@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260425174858.3922152-9-irogers@google.com>
Subject: [PATCH v6 08/59] perf evsel/evlist: Avoid unnecessary #includes
From: Ian Rogers <irogers@google.com>
To: acme@kernel.org, adrian.hunter@intel.com, james.clark@linaro.org, 
	leo.yan@linux.dev, namhyung@kernel.org, tmricht@linux.ibm.com
Cc: alice.mei.rogers@gmail.com, dapeng1.mi@linux.intel.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, mingo@redhat.com, peterz@infradead.org, 
	Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260425_104918_503252_CD8CCFED 
X-CRM114-Status: UNSURE (   8.82  )
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


