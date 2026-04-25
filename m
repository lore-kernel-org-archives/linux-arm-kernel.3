Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 287AEFF885C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Apr 2026 22:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FvZ6XnZhDqeAbUzg1oigROcVSwy0qm3+WBD99Jn9WsU=; b=HaqcuxGfxZhrmIjBG919DaJkz2
	QrIa5AeYjYeUnn0k99ltQkQSJM02E/PI56f2QXhA2xprh0h+0TZDFfrukGC1GoX1SIdcp4PTlN89g
	7LMHf369yIyGrxEVLEWLi/S2HQruXjWX5QdnoJQQiElZnEJ6czIC/PBd0ILmOmt6KqqOnpoyU6lTs
	EgLDk+ki4H6FLRqWJMgu52A6WoIPd62Rf6fs2uHt6X66j1uu3kKKeCuoWwaaY/QMaCFkXfx/sm7Mq
	qPAbYZa0swq/5osCpyjA6la0yQnEHJwrkmUxyfN+UvrtChy+3RTMLBTMqYY55T27eba/IVjRCKoTf
	zVemAtvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGlqT-0000000Ez4c-45vw;
	Sat, 25 Apr 2026 22:51:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGlq9-0000000Eyi1-2nc6
	for linux-arm-kernel@bombadil.infradead.org;
	Sat, 25 Apr 2026 22:51:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=FvZ6XnZhDqeAbUzg1oigROcVSwy0qm3+WBD99Jn9WsU=; b=ljyJZAMIs8tOvf8mvfXUMPuLIp
	GihzlE1AIHY66UgDdRwLcFS8L6qRuhdXrbXiSWXBHXJ6w80nQ9ypJqQ4RM3/hYHVi3j+ehRwtu4hR
	3VW3cdEn6kcRe3AvACgo33Fwtq2gunRqUNUoXh32WXftx32iBi47r8BapwsbO1BY3IsfHbvCcM1hR
	3nrXZcPq4Q7AyIyHzDz42SIe/+wXqYnPSXznFi+JdXt4GI0r2My1UgUnvY6FJfNOPleOWolRVeqkP
	Zy78Q/PIr9XQzebKRsK9YzGjX+cfAyShuqb22cje+xtmqHqdkmR56rrrbBUzX/twGhBIOzHrASNKk
	FSj7p6EA==;
Received: from mail-dl1-x1249.google.com ([2607:f8b0:4864:20::1249])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGlq5-0000000GMX3-1dnU
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Apr 2026 22:51:08 +0000
Received: by mail-dl1-x1249.google.com with SMTP id a92af1059eb24-12c87ba0890so30473627c88.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Apr 2026 15:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777157463; x=1777762263; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=FvZ6XnZhDqeAbUzg1oigROcVSwy0qm3+WBD99Jn9WsU=;
        b=h/grhyMTQ1dodqqEohAVHfb9YpYjqyyY1dnUPRMiLOe+WQpQVfZnwws6r152BHH+dm
         JQQctTy4sZffnzZ20bd6mYxkr/lQGO9TGA9KLlDcP15e69FmldQtxvM4tx4t0kv6pYtw
         5RdQ+YEk+8FPrg9buWVWi5rjZHE2qVgQPpTXqzLhx7bZPDoAMs8+Uj1TxNgUE0vJxbW8
         fbfk6D7TLrD5z3tBttrAC1mPuUcn2+9EOYBY90841JyvNn6FW7YsMA0rAs3svguJA0dR
         JrZfYSpaYljd9B/lvTslWxN3gA3rlfLIDE2PQcSIgIRqRZ3y2yx+dsyT6+aBLl0oJe8p
         K6HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777157463; x=1777762263;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FvZ6XnZhDqeAbUzg1oigROcVSwy0qm3+WBD99Jn9WsU=;
        b=cE0z7mL5Qzivo8ztppMIZzgHgipEYvCF/ZoE0mn8oZXibWR1rpq8IwA8BlURWQPJay
         CNjyYKCkOWQLcr89rpViJyldTeUXQ1dfuyLKx8KXqmqths2VJM+UfOGuTXxNpPXyby99
         l6IzrdITAKFKMmnPzl+Qk7s6xGuOeZuA7BEruJFdvAfpKtLoBSEeflVFexUNYT2nBm7L
         ankoxtJ1nCmOq6CJ+wEbRToMRwgL8t8RsxcyBcZqxXhJsY6v1L6WQ1g1lHz7Cv+cbpGR
         axzTCPI216nUtjd2oHgnYQJvgeSNkH8+O8Wx1JBsEoF1R29Oas0BmNtg76udttuc+aUh
         kvIg==
X-Forwarded-Encrypted: i=1; AFNElJ8/Yf+2GXGmqCgTvYBW0rK91qM3o0/0rW8L8xjT33QhBvxALfzCMvQxTw4BjO+YjiyUI5eULWSOIAQIITwwYlfq@lists.infradead.org
X-Gm-Message-State: AOJu0YyAKQjZbph/f3BNZaceMHw9dtVrYAFMTKEAeFcBUBj0V5EbhQXv
	5Tp4hoZkwrUipAOhdR40G7L3U6D00/556oDjoyjrBoBJPn+C8Ct0B0Yy+wCDFmcojxJzWEZZezi
	/VlGWktGRaw==
X-Received: from dyb19.prod.google.com ([2002:a05:693c:6313:b0:2d9:db60:7492])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:f40b:b0:12d:ce36:8930
 with SMTP id a92af1059eb24-12dce369210mr1680182c88.3.1777157462870; Sat, 25
 Apr 2026 15:51:02 -0700 (PDT)
Date: Sat, 25 Apr 2026 15:49:16 -0700
In-Reply-To: <20260425224951.174663-1-irogers@google.com>
Mime-Version: 1.0
References: <20260425174858.3922152-1-irogers@google.com> <20260425224951.174663-1-irogers@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260425224951.174663-25-irogers@google.com>
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
X-CRM114-CacheID: sfid-20260425_235105_511361_330EA64D 
X-CRM114-Status: GOOD (  14.37  )
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


