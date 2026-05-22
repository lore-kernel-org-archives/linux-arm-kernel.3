Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C3CACD5BB9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 22:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3dI6//58XLq+utXNtomlMShi/6Q6ufN1k/99x8z/TUk=; b=3Ftdxf9ifhTyFCjSb6agyk2MqL
	bNXyz2z3WLbbZIv7RE6OXXDU5kFMNmQMZLJgYHN4MTTNtjXEZvZnh8lwLna3RIf9nWYTD4oKtSMX4
	vXEj8zSxuY9MqwS9jt65/YquPX4+9dF1yvkfeu12CV0OKwYONr4PvkgWn8xM6CpxawGUSb9k/KULW
	PiAj8KxLelDFM7BhvzSG2YzVIO/yzYm+DIu5feQ4JB3GSkvDWujcJzl3Szebn0yr06XctAbo8P7yI
	u7662CgqvEm1nSzxLT6UJ5peExuxe28BZMC+uuWqO3mZH+z07ZfUz4xIAEedsbVwrgJuHHc6UyThK
	yWs1Qd6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQXzM-0000000C2hW-1wFl;
	Fri, 22 May 2026 22:05:04 +0000
Received: from mail-dl1-x124a.google.com ([2607:f8b0:4864:20::124a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQXzD-0000000C2b3-3ffi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 22:04:57 +0000
Received: by mail-dl1-x124a.google.com with SMTP id a92af1059eb24-12dece274b1so10412097c88.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 15:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779487495; x=1780092295; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=3dI6//58XLq+utXNtomlMShi/6Q6ufN1k/99x8z/TUk=;
        b=A7w8BpvEzNKEQprUckNGpW1IwAPr6GPzxR12wWsTPSRInVysSoxmsk5cxqvgY1GhTI
         e/Xxr2OLksjeobGKUIJ89rrPha+2hQALkqDOmSrQYD6+4A6sw2/mI+LeNP3W+TjDIgyX
         9KljW9TxDAFPG54PqoS84tFeOZWX/G8qLF/GQtZRhTT/yxCSexs+qYVf0F+mRHs7wCyl
         wgYms+LkCOsY4ejuOBEEkRnVH3mwu0ECsqYRSQ39M6/jX2esknIaOZX5uyVKvvz4ZhBK
         zQ/1bXG2MAm/z7M0zoy7/Vp1EIaCdFwTyNVMxGv1nKDCoT4QTKyAe0YQrEYHc8XVQEO1
         /uYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779487495; x=1780092295;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3dI6//58XLq+utXNtomlMShi/6Q6ufN1k/99x8z/TUk=;
        b=VVCUi2eSj580Txz2lSiFn6MpWuKOS76ZwL0kzbUfwKG9ud5QWQKUS1+hVx2gzeFOOi
         MEaLRaM8gIB/g03N1Fyqnl5h6mr4VeDvyymUDuwUhV1W9nya+nzSJ7rfEkD6n06ZGU+U
         DZSuO4sDiarnpA5zqS29+S4OOu8a21+tT7t8TvxEcGXDQZ/mb3aYmk06v6nKHfP6HVIs
         38JiYtKfB7Flsd9wjcMTT9sCyMXHlQx2zPiXNSOVfmX+o/PTkmCkfwowgS+ctytOXFGm
         FrIvf4fhayEmdCJ30+123x9Mw/N+8byKIQCazXbDMJB0E0gDZXcWgU6r2qAz9Y+88aV/
         Bt5w==
X-Forwarded-Encrypted: i=1; AFNElJ+0vbZTIyrH7rqS1DMA7gN4MZcMUfIZzVpf8l+Lls7Yxz9tHLGm+ga6FHKFqSY8ILy98r8RsgilyR9FFu7AR0pu@lists.infradead.org
X-Gm-Message-State: AOJu0YyvsuH5hvVwRweGb2qOyq/XSQdMipfnr1/05/YAVVD7V+jR24zx
	afpyGdlHwpRwM95U1zPFMb/dlX/uc8OoRTACmhVpFGhRm5NNnOHAieE9dqC1DWhkr10JxHcmFsC
	YSnOzwskgzw==
X-Received: from dlb3.prod.google.com ([2002:a05:7022:603:b0:135:e6d6:d14d])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:699f:b0:128:d5bd:3572
 with SMTP id a92af1059eb24-1365fb40573mr1929174c88.31.1779487494444; Fri, 22
 May 2026 15:04:54 -0700 (PDT)
Date: Fri, 22 May 2026 15:04:18 -0700
In-Reply-To: <20260522220435.2378363-1-irogers@google.com>
Mime-Version: 1.0
References: <20260428071903.1886173-1-irogers@google.com> <20260522220435.2378363-1-irogers@google.com>
X-Mailer: git-send-email 2.54.0.794.g4f17f83d09-goog
Message-ID: <20260522220435.2378363-8-irogers@google.com>
Subject: [PATCH v9 07/23] perf evsel/evlist: Avoid unnecessary #includes
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, namhyung@kernel.org
Cc: adrian.hunter@intel.com, alice.mei.rogers@gmail.com, 
	dapeng1.mi@linux.intel.com, james.clark@linaro.org, leo.yan@linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, mingo@redhat.com, peterz@infradead.org, 
	tmricht@linux.ibm.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_150455_922364_D40EEC2C 
X-CRM114-Status: UNSURE (   9.15  )
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
index 927e5b4756cc..2221694bb819 100644
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
2.54.0.794.g4f17f83d09-goog


