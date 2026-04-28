Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93F06FF886F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 07:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FvZ6XnZhDqeAbUzg1oigROcVSwy0qm3+WBD99Jn9WsU=; b=OvMV57830JeX31jKMxemNzpuMI
	/NegIibuB4E79xvbmGDIlVVlj/c2FsD3EGdsKLK7nG8+OzqpkQDKHRKI23lSfKQ4KCw1QW4NQp0bl
	MDKnt1cKr3V5gxPyFGvg6F0zFaahlorAaJBWsWg/rEoq8n0An51Buv4VLIkBT7oPsByUCdEjzRxhp
	1jCjN6O5iSNcwceFc/ktX+5x/XFcvQrIzQpy5R7dPSHt+eeUBqkbpu/3SURnp05kFMHvgPCbv0FJF
	kUXVXNxeofd4ToojDru/24BZgBNBR/wn818Zgm91pb37y4GIfU2pbjPss+sSWA+W+QuTh2B69utCD
	tU0S+LSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHckg-00000000hw6-0WHN;
	Tue, 28 Apr 2026 07:21:02 +0000
Received: from mail-dy1-x134a.google.com ([2607:f8b0:4864:20::134a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHcjn-00000000gw1-3xRr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 07:20:09 +0000
Received: by mail-dy1-x134a.google.com with SMTP id 5a478bee46e88-2bdf6fe90a9so17674994eec.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 00:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777360806; x=1777965606; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=FvZ6XnZhDqeAbUzg1oigROcVSwy0qm3+WBD99Jn9WsU=;
        b=Znjtgnh4J7G8H7Hic3juOe0pBS62y/nWZDJpmCeJmcNKvBLgXCF1q9CETR3AA30leu
         JtEyGK6Ia1R+JZJJepYcYeK7alLvhsCH0fcFRz+ugV4evm6fQXz5iZli/EUIPlrLMdkF
         uxp3VWuQyNEoLKJ8TF3svxhMJYFPYTzTSLe5EAwsh8YfvZmBhGZYS2eybYq6NmK0fwu/
         FY0NRj3qN/cUosH7Ddm1H7EOOTpMXENfkt4G9DGOPMVBd2g4erg65SZooWQcwUQTPq6J
         MQLGVErZI8wmR0k8HhxqXRZguM7Uj1x4xrBmP9e7pvEL3Ga6xPONW7PX23Yh7fSJB7bz
         EcDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777360806; x=1777965606;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FvZ6XnZhDqeAbUzg1oigROcVSwy0qm3+WBD99Jn9WsU=;
        b=Fcmw0JXzCxnFlWjkomdnoxfv1YvR4/1T6MO0XAOcF4zi2vhJO3RQ42L6jyuB3Zihwy
         rjwE/5pbceX99IP6YqzW/L9bQwnNCTZQ8h5+8g7dOvm1M/eGygCRgI5W/ncxu7fX0Ew8
         GkccQxhqdjQAnCxpUw+ffrfvt7rtcGUUHIHsXF1tEdz/AUtDnCqIzYQflww7laGfxGjN
         FGGwZKMQM3MjuFLQ5IruwUiOySCxnJq4w0VBFZaC+KOeXb3+HPjb0DFvkBL2fGYwGahm
         kfYeIGdJOpYncG2wzy4tdYaXeFii+84dBvbJv6Q5jq35x+x6/tFEdIByxw3i52OTo8sv
         LJ0A==
X-Forwarded-Encrypted: i=1; AFNElJ8Kj2WO+zp6OEAjeGQib4auplKGzYW8pM8jtdW7yKR1oGMUXWLNyJ6HcHbMOaUW7/4L4DXJ3U2rbJsviWTT8aFs@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9r8eaj0JnJYsSW/5cx7bhkhk0yOuvZT6siz24zWzPb1WDordf
	y46g0kENpUvsVbN9HAXpxbdPlIFjEDQGvtreU1pbYupZIglgH2CdPLXoG09/otZCbo7mtinKneF
	sbpgW1xhv5w==
X-Received: from dlbut2.prod.google.com ([2002:a05:7022:7e02:b0:12c:8ccc:748c])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:ea2c:b0:11d:c22e:a131
 with SMTP id a92af1059eb24-12ddd961f1amr1047382c88.3.1777360805824; Tue, 28
 Apr 2026 00:20:05 -0700 (PDT)
Date: Tue, 28 Apr 2026 00:18:29 -0700
In-Reply-To: <20260428071903.1886173-1-irogers@google.com>
Mime-Version: 1.0
References: <20260425224951.174663-1-irogers@google.com> <20260428071903.1886173-1-irogers@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260428071903.1886173-25-irogers@google.com>
Subject: [PATCH v8 24/58] perf python: Move exported-sql-viewer.py and
 parallel-perf.py to tools/perf/python/
From: Ian Rogers <irogers@google.com>
To: acme@kernel.org, namhyung@kernel.org
Cc: adrian.hunter@intel.com, alice.mei.rogers@gmail.com, 
	dapeng1.mi@linux.intel.com, james.clark@linaro.org, leo.yan@linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, mingo@redhat.com, peterz@infradead.org, 
	tmricht@linux.ibm.com, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_002008_121852_B15C8BA5 
X-CRM114-Status: GOOD (  15.13  )
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


