Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 806BFFF8863
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Apr 2026 22:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FvZ6XnZhDqeAbUzg1oigROcVSwy0qm3+WBD99Jn9WsU=; b=bsd0ihX5NEtUtyRjEFu9QiJvNQ
	lcFY/BdPUBzKFgKq8lwREbdns6+UTqQDLNjhvNExZNxP1IPsBUodRSEHVj1GaNd0v4ENODiF5zPdo
	A5NBpgkQ7/pr1FqgzpyZ4t4etKdq/HGtDhTc1MpgKxsvTRXOg7QBzkLMjl33aWkQj1NP4W0f6mEcH
	0qqzjkTxHYhrVylpa2w6ofgaNGiElYFqaWobS0+LFcR9aWNiSi+cSjGNPO2TX8FXkiZLRlU0BE3hb
	iJ/tbWziWDyCvHgTxFMuxiKkYk6hOSSGCKW+ux9cB6MgRMcR549XhSUrmoaVGqjlW9UnNIG8eMcGQ
	HmfUlAsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGliC-0000000Eu79-3CUB;
	Sat, 25 Apr 2026 22:42:56 +0000
Received: from mail-dy1-x1349.google.com ([2607:f8b0:4864:20::1349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGlhe-0000000EtQp-0xZY
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Apr 2026 22:42:23 +0000
Received: by mail-dy1-x1349.google.com with SMTP id 5a478bee46e88-2ba8013a9e3so10454118eec.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Apr 2026 15:42:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777156941; x=1777761741; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=FvZ6XnZhDqeAbUzg1oigROcVSwy0qm3+WBD99Jn9WsU=;
        b=EuGTiiPdsnHE7ofV4Cqit3D4gLiCPLxuOZsjUIrE8vWyXxsBt54uvO566rJv8bw5UV
         gXGngdfbvzaa9qpzy5UEPDQQI9eaEctEbaPIlyjoHA1DofGPl4508CE4O4pVRFx1tCyf
         3+WODAWMnOGP271k/GI5oU6EyodBxGbXPK3LGPWAzvIToZdrodH+11Wpc9XLAp0L0juA
         nf81/wtr/cvMseabivVTz32NogDJr2eyOT1gbx2/mB7wS5H9Jc2/ZuflIQxGtzSUsD3q
         vElU0Tb8x+eT5/5RlQJTahIuA6+xEtroycX91hFJ2o8FnUDPcuEgpCY34FKWRx7/0NrN
         7bPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777156941; x=1777761741;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FvZ6XnZhDqeAbUzg1oigROcVSwy0qm3+WBD99Jn9WsU=;
        b=RmB1y2pdzydGBN4FRatIA/fH9i+yh3KqNzIbJ6dlofFuxMr3YEAg0XvCgjXVP6QKR+
         0UApi/wuYxAwxw/9YtJhCUEt0vyInUpgx4+irWuL3dphtr9OlxNAiK8RBVBRMY7SBWxa
         iOQG+CG5IpNpZjUGZmpefomA0N52cVpPL7yVI8jBpozoOOO9MybsmUfV9Z89WzHU03nK
         QsoDVinD6pNDIpLfyk0HmcOhJgoA1yrcPhlvD1qq/l3T8S5K/uV2LOiN+X7Tl4e8LXa9
         FeSCbKPW/BmDkvgu9HNThR9km3WAhthFZgzJvLNW6sI4Vf5eZ4RF0dUWJBcNPUyJqdny
         RnVg==
X-Forwarded-Encrypted: i=1; AFNElJ8J3+MV/muOGnt5ITlaBH8Sknb0kYinbCO0BrtSDK/fjkrw4edrcjg36XvI5iXC8nfiGJeVZdE0MktEIy8nNmSI@lists.infradead.org
X-Gm-Message-State: AOJu0YzkZWtDI5y6rKsMFvpH2MVjFly4MNDbmx947L01Y+sU9BtZQ/aE
	qn9ex+9BSxlQWAhft+w71f3yH3COJiuFYzmMrmRXKxig9ZKNqCwPhducDyg7PcNS9XUOchYH/2B
	kMe7P/tg73Q==
X-Received: from dycpv7.prod.google.com ([2002:a05:7300:de07:b0:2da:4712:5fcf])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:10c:b0:12c:61fe:fb49
 with SMTP id a92af1059eb24-12c73f6ded9mr20214163c88.6.1777156940749; Sat, 25
 Apr 2026 15:42:20 -0700 (PDT)
Date: Sat, 25 Apr 2026 15:40:49 -0700
In-Reply-To: <20260425224125.160890-1-irogers@google.com>
Mime-Version: 1.0
References: <20260425174858.3922152-1-irogers@google.com> <20260425224125.160890-1-irogers@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260425224125.160890-25-irogers@google.com>
Subject: [PATCH v7 24/59] perf python: Move exported-sql-viewer.py and
 parallel-perf.py to tools/perf/python/
From: Ian Rogers <irogers@google.com>
To: acme@kernel.org, adrian.hunter@intel.com, james.clark@linaro.org, 
	leo.yan@linux.dev, namhyung@kernel.org, tmricht@linux.ibm.com
Cc: alice.mei.rogers@gmail.com, dapeng1.mi@linux.intel.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, mingo@redhat.com, peterz@infradead.org, 
	Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260425_154222_282936_D4E746A1 
X-CRM114-Status: GOOD (  14.42  )
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

These scripts are standalone and not using the `perf script` libpython
support. Move to tools/perf/python in an effort to deprecate the
tools/perf/scripts/python support.

Signed-off-by: Ian Rogers <irogers@google.com>
---
v2:
1. Updated exported-sql-viewer.py : I updated the comments at the top
   of the script to use the new path
   tools/perf/python/exported-sql-viewer.py in the usage examples.

2. Fixed Test Path in script.sh : I updated the path in
   tools/perf/tests/shell/script.sh to point to the new location of
   parallel-perf.py at ../../python/parallel-perf.py .

v5:
1. Fix Test 105 Failure: Added a shebang line and marked the generated
   `db_test.py` script as executable in `script.sh`, preventing
   permission denied errors during standalone execution.
---
 tools/perf/{scripts => }/python/exported-sql-viewer.py | 4 ++--
 tools/perf/{scripts => }/python/parallel-perf.py       | 0
 tools/perf/tests/shell/script.sh                       | 4 +++-
 3 files changed, 5 insertions(+), 3 deletions(-)
 rename tools/perf/{scripts => }/python/exported-sql-viewer.py (99%)
 rename tools/perf/{scripts => }/python/parallel-perf.py (100%)

diff --git a/tools/perf/scripts/python/exported-sql-viewer.py b/tools/perf/python/exported-sql-viewer.py
similarity index 99%
rename from tools/perf/scripts/python/exported-sql-viewer.py
rename to tools/perf/python/exported-sql-viewer.py
index e0b2e7268ef6..f3ac96ada1f5 100755
--- a/tools/perf/scripts/python/exported-sql-viewer.py
+++ b/tools/perf/python/exported-sql-viewer.py
@@ -10,12 +10,12 @@
 # Following on from the example in the export scripts, a
 # call-graph can be displayed for the pt_example database like this:
 #
-#	python tools/perf/scripts/python/exported-sql-viewer.py pt_example
+#	python tools/perf/python/exported-sql-viewer.py pt_example
 #
 # Note that for PostgreSQL, this script supports connecting to remote databases
 # by setting hostname, port, username, password, and dbname e.g.
 #
-#	python tools/perf/scripts/python/exported-sql-viewer.py "hostname=myhost username=myuser password=mypassword dbname=pt_example"
+#	python tools/perf/python/exported-sql-viewer.py "hostname=myhost username=myuser password=mypassword dbname=pt_example"
 #
 # The result is a GUI window with a tree representing a context-sensitive
 # call-graph.  Expanding a couple of levels of the tree and adjusting column
diff --git a/tools/perf/scripts/python/parallel-perf.py b/tools/perf/python/parallel-perf.py
similarity index 100%
rename from tools/perf/scripts/python/parallel-perf.py
rename to tools/perf/python/parallel-perf.py
diff --git a/tools/perf/tests/shell/script.sh b/tools/perf/tests/shell/script.sh
index 7007f1cdf761..f983b80e77b7 100755
--- a/tools/perf/tests/shell/script.sh
+++ b/tools/perf/tests/shell/script.sh
@@ -43,6 +43,7 @@ test_db()
 	fi
 
 	cat << "_end_of_file_" > "${db_test}"
+#!/usr/bin/env python3
 perf_db_export_mode = True
 perf_db_export_calls = False
 perf_db_export_callchains = True
@@ -53,6 +54,7 @@ def sample_table(*args):
 def call_path_table(*args):
     print(f'call_path_table({args}')
 _end_of_file_
+	chmod +x "${db_test}"
 	case $(uname -m)
 	in s390x)
 		cmd_flags="--call-graph dwarf -e cpu-clock";;
@@ -76,7 +78,7 @@ test_parallel_perf()
 		err=2
 		return
 	fi
-	pp=$(dirname "$0")/../../scripts/python/parallel-perf.py
+	pp=$(dirname "$0")/../../python/parallel-perf.py
 	if [ ! -f "${pp}" ] ; then
 		echo "SKIP: parallel-perf.py script not found "
 		err=2
-- 
2.54.0.545.g6539524ca2-goog


