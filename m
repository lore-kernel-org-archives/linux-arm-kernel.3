Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5768FF8860
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Apr 2026 17:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FvZ6XnZhDqeAbUzg1oigROcVSwy0qm3+WBD99Jn9WsU=; b=b7Fgn7zQIi56KacZCcnUh1aLvB
	AeYo1QBsZQuQB6/8g0bH1Cl/pBXdFWhv7N7GbNXpo3ECb03YC8elZo5w78QG4Yt9ibNkGNt0nUG72
	Ko8n/jv47mYmzMsC1eTxU3MCsuBsjrjB9EoDc6woCXKqAn60jR8q1hMCmnbMGlSAZOAtab6lZvfT0
	At4K+O05SS8OkUYWd7nSz0aT52BS1DuHgqSykpHOtEBBfHzWcphmPpasqe0C32sSTjvfuyZWgJ+Fd
	CjiK4DgRCk9xlt7NH6ftIyZdNmDkMCwnpdOQLcCkRl/Wn/cqePFE7K3JWodQ1+rUAeAbOm77cQYm8
	DHteIrtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGh9A-0000000EdVM-0BKW;
	Sat, 25 Apr 2026 17:50:28 +0000
Received: from mail-dy1-x134a.google.com ([2607:f8b0:4864:20::134a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGh8Y-0000000Ecly-0Y35
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Apr 2026 17:50:00 +0000
Received: by mail-dy1-x134a.google.com with SMTP id 5a478bee46e88-2e60238adb1so21145835eec.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Apr 2026 10:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777139389; x=1777744189; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=FvZ6XnZhDqeAbUzg1oigROcVSwy0qm3+WBD99Jn9WsU=;
        b=I7XL+rpXBdUA4ckxXQjsPbnUyja94BI3aJ22SjJ7m0yVaGxDq2Jz6UG41OBMccRr0x
         EbkEQlHKZCAR47EknYvy+/TvnUvtq8vQsJKDt1pE6GxshomDiNex/Njiw4o2aMbqhbLI
         gryi5FZmIew55lUkeSG5biT5PP8NmYL1b7LprFA5G+iTWBO5b9frKH+3NA4+BMYZqYRm
         /Kjkb/l6lVGFPWHzhXhCptsG/QDTfAugRLhVGY+YpRiK9ZimxAvWnlW4hbitGNua1dSm
         N4009Kmi2SkPEqd549kewhI84jKcHVWEhzV5map918o0PfiWlbfzcXHci/t8uodemgWz
         2EkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777139389; x=1777744189;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FvZ6XnZhDqeAbUzg1oigROcVSwy0qm3+WBD99Jn9WsU=;
        b=ESXv0VfgSfJ0N+/3YCckdDXUy3DRUbAh8vp/EZ+cHm+9upjOGdQ/0UBQFMXyftWBLl
         Ee7xV79M+XPv+dk/+NnE9e25k9EUmrfE39pnRsDvNJdgdpogW+yhsGcp0S6JjiLF/nVV
         GnjaPsdHjXW35/MkJ6LQrjkzb/eeJY0P5PvRdnGIdZKU7Bwo7ikz27Ua807a0qdxQyga
         x0C3qbkXzhDNkgrKR0h3tXKzJ/Wp8DqfprjNONw7sxdvuRJcZ3Q++N3CUNLaw5vF5P/I
         PH3XWAjkyzgQjArBZqTwlcMWpqL6Pa3WdKcqXRMh29aupczo2ww209aZHMnAyUHOlvuz
         3Efg==
X-Forwarded-Encrypted: i=1; AFNElJ+O0L5OiwmXj17B+dU1Oc/8Jyc7eLHTldmSf0BUdcJduFCqPD0zA/6iscvPgYL/19EvafpbeMdhOIN/m9n9NY+f@lists.infradead.org
X-Gm-Message-State: AOJu0Yxru7nc2mNf/7ajVHR3ptgkBSRaFe2hwaGpKgOmnaYajy7VQBKs
	zNAU7pUOuilsCaiN3A4DKlz5W1GYv9Br1Gf5uuLGhPF6HH68PafEhjDK27gXbpZJpkG2T9G0/Q1
	Obkvt2d0VGg==
X-Received: from dycmx3.prod.google.com ([2002:a05:693c:2883:b0:2d9:a817:812d])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:693c:310b:b0:2c7:ea98:d94
 with SMTP id 5a478bee46e88-2e464ea8a4cmr18105116eec.2.1777139388488; Sat, 25
 Apr 2026 10:49:48 -0700 (PDT)
Date: Sat, 25 Apr 2026 10:48:22 -0700
In-Reply-To: <20260425174858.3922152-1-irogers@google.com>
Mime-Version: 1.0
References: <20260424164721.2229025-1-irogers@google.com> <20260425174858.3922152-1-irogers@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260425174858.3922152-25-irogers@google.com>
Subject: [PATCH v6 24/59] perf python: Move exported-sql-viewer.py and
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
X-CRM114-CacheID: sfid-20260425_104950_221502_F2C3EFC3 
X-CRM114-Status: GOOD (  14.53  )
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


