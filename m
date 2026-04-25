Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9DFBFF8863
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Apr 2026 22:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=niT+j+ygae4DUDVZvlLCzSKgJX/QJcllkfXgy9y3G00=; b=fiLGDpCjrsAQTR9Ltnm70T9AeA
	rn/Zr6w5XMveYHi5huWvC+mI2WBNHwFT6/U4UylmBFQz04xvHBNu8SvdgwmdC82IcXL+dNq4kaSCU
	xM2Uldv21/vpwRBKW+obaukeu5bO1m+VHSpeOSdFWsaiNrk3A1DmI0AKTVd7fJSp8t/V2QOV2G9Nt
	y5YybDWgS2PqzdC5uf8V7va46zxODQU+AF9WHiYMQncz2Y0kNGsY+owBexJVpKAg2jvNmQM11DkI4
	Jt5uxu9kzSevhFzTCx225YUyjVeVrCunNZM8Hto/0qPAeWigFStYZh0sMD+eiv7/kX9teZxke+G6H
	+cDRGZJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGlhD-0000000Esvh-0vGW;
	Sat, 25 Apr 2026 22:41:55 +0000
Received: from mail-dl1-x1249.google.com ([2607:f8b0:4864:20::1249])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGlh6-0000000EspN-2etg
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Apr 2026 22:41:49 +0000
Received: by mail-dl1-x1249.google.com with SMTP id a92af1059eb24-12c21dbc9c1so33836628c88.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Apr 2026 15:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777156907; x=1777761707; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=niT+j+ygae4DUDVZvlLCzSKgJX/QJcllkfXgy9y3G00=;
        b=Oj7Pl8+GyESjRqzz58cNRt6HmoKlDCvCqQNaCMpDCqWeQPevzIJlRn6/inUhFfidLW
         kLPTfma2m0Ec7mSAKxdnpkMHe3Oob8Y/0zK42nqQsK36sZjcLjSXiPd7gd7a0s+Kf8wk
         Ajrm48S6r9VqTJD2DWCaFZNLoFMDzN96M2WQXO7CcofNopvjtEZFlr5w7hfLdlOnoshT
         y17BuaaSkDc141YjrXjIH2BcTHlMYinn5+MN7RU5F5QkCorOo6AdIAq7lGijeKQV6I7R
         TiaPKdB8xYkBVye/WpSaYpfXty3cNydMZCd+Ck+mcpim0b84Xl1I0IhuxMsoXJXkvBoK
         DK1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777156907; x=1777761707;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=niT+j+ygae4DUDVZvlLCzSKgJX/QJcllkfXgy9y3G00=;
        b=s0hjmDPEwrjFtOsx4dXj2wlFMBQd7IIkWhhsc5IDTAygM3i49GkLd/bLMooHlIrrIN
         qJA4moJkmkQz0Jpi7bovmBHbXeyydFtQhPuZop2Rowd4tMi9ZbWotbSMRQn/VsLtzmto
         PcvutjeIN1lfOVCzceRdS4RBmWXb0h6SD632kSVS2zcCTMVS59Los1UFGCulndZBdjKI
         Sz+C47G4Pe8+bS8H4QICYJAzDuWKDT928RvuIOlJyPJp2yLQeM7aB//peKve6l/kFw9Z
         unG3Mv1NA+voYBvnYTJWNbJiCtiV2J1PLJ+Kjy76oa+gvhFCVBKGc7WJfwdJmiSC7qfS
         FPcg==
X-Forwarded-Encrypted: i=1; AFNElJ/Q/4gGTW3FCzc+Iv0XEg3qs2NUwdEnvQilydBEsIkeXdjWbiY6IbQRkIwO1t2twYm3+VeESEJ3xSkEjAlBzksy@lists.infradead.org
X-Gm-Message-State: AOJu0YzybOlwIoyFM+NhMJaWAc5ezAGiKpiWdJ6ezS7laaxeQI4RDuTB
	HvnBIqUw4tGpGgDDv11/VGjBljA91guzT0MDOcH3SHMFfldAvfnIyDebF9cfxtBp/463vzVDLNN
	KJtxegJK7+A==
X-Received: from dlbec10.prod.google.com ([2002:a05:7022:d8a:b0:12c:34da:e06e])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:eac8:b0:128:d714:3ca6
 with SMTP id a92af1059eb24-12c73f7167cmr22119688c88.12.1777156907006; Sat, 25
 Apr 2026 15:41:47 -0700 (PDT)
Date: Sat, 25 Apr 2026 15:40:33 -0700
In-Reply-To: <20260425224125.160890-1-irogers@google.com>
Mime-Version: 1.0
References: <20260425174858.3922152-1-irogers@google.com> <20260425224125.160890-1-irogers@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260425224125.160890-9-irogers@google.com>
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
X-CRM114-CacheID: sfid-20260425_154148_689912_04367665 
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


