Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D072FFED3F0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 16:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/hOCLgpusdDNvj2grWCv+wASuKS65SLc2xpNZEUUXpk=; b=qOou5L5YZJ+wGgag1vKeHCnt/7
	JxV7mVrV6M+CZNEyx2fL7z6a80l7DnIlbIS2UKEsfcd97iJold8yEaCgMMnC9FS6Pv8IISHzMI3j7
	rPg2p7cecYzTuRSMPfDGmyIbyu6tXWEbVog9jAGUAo4Wbokaa82Wq1maAReIiDUuhdUmHh6JPuaNy
	wOgRWo6n2nHNEtDHZwPCA0gQY6bohdg6jY7PaIAtY3GbqV8okcGpR+OMjeBYpDYh7iCA82agTpf1d
	0PkomcABlyIzBZ4J0S5DYfdgR4AdVl9V1UTweZnlU2hVe/5Mupj1ZmpgT0xBHgKtXhnXKdnUzv2jw
	4RNQqE6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGJiE-0000000DUPv-0OOo;
	Fri, 24 Apr 2026 16:49:06 +0000
Received: from mail-dl1-x1249.google.com ([2607:f8b0:4864:20::1249])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGJhm-0000000DTsw-3n0X
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Apr 2026 16:48:43 +0000
Received: by mail-dl1-x1249.google.com with SMTP id a92af1059eb24-12c20d5d7f4so38122451c88.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Apr 2026 09:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777049317; x=1777654117; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=/hOCLgpusdDNvj2grWCv+wASuKS65SLc2xpNZEUUXpk=;
        b=icZ3CrQq+WOMw23w+Jme+qFs9uHv9ZbnYRgdUyhz06B6Q0uw4k2fjR9TVTLDi5Q0a5
         FC9n5iakhDo3Ft4qAnJMtEYqqv6bfarDzhJe0w39T0hLijQ2kAfW7EcH+AX6yXw01tfx
         5weQm8VtX0xJ6xvz/La8FgiXsr0BWmD00jjBROxCgqUNgPWbJGLvtC6upWSJAJ6X2bQ5
         ctD4jWNYrkHLaxClf2DNK+780iRT44maPzfBekbrAJeC8xPVqTKXnYjSY8GqIg9Vyy0z
         n/CbV25TPWVJexHWyZBtwoYs4dfflVQR990H0tXnSoe/bzGM4To1qtAVTEcGHhWlAbL2
         S2Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777049317; x=1777654117;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/hOCLgpusdDNvj2grWCv+wASuKS65SLc2xpNZEUUXpk=;
        b=cUyDUOTbMZHh0j4599IQVy15Y/UnpvhapHe/EXDwN6iqMcQWQFiBw5/yqlEWFdHlAd
         vqgMBuac+LG/ZEfMzTm7st6uJXXUny8iZxDjplAi2vcWH1T5O52/dwSXi9jfwQIiPO03
         KlMwZ4sChQLjUpiTSQIPLOmVdXw4sGozFTGvCQE80h1XK5tEuXSHsBXlRPyw9hCj3p0f
         vSjKhUbgIQ9i8U5pLgk01dVjjjfzAyGBFRzdbD7BGO6dKKEq0U26uGdBu61R2xhTNzix
         +vOsDnYhW/IbuM6cO8Y7CqTKZk1u8LWGxmIgxdk7OBAoNmO03QdGJHNjZXsHFib67lmw
         Mppg==
X-Forwarded-Encrypted: i=1; AFNElJ9On/tOZvN2fY17W86Qrqs6npjoW335h8XitxOsaXjA5A2IVI8zZh2G+hvvhE7ISBgFX5nYPiuCBod6/UxrAiuI@lists.infradead.org
X-Gm-Message-State: AOJu0Yy49h8XZ4ZLtorNRBGC7LWVrKh4rv8yDuJweNUBEYpjsPEiqN90
	LiIztI6WIGoK8zkOJHn4PFSo88yxbd45P98o6vAc2JuHKtohYmhNlZYcgNtQLtn0oWGszvOVarp
	DUgXRKlzSrw==
X-Received: from dldoa8.prod.google.com ([2002:a05:701a:ca88:b0:12a:77b3:9893])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:4199:b0:122:2f4:b24b
 with SMTP id a92af1059eb24-12c73f9bfebmr16411373c88.25.1777049316967; Fri, 24
 Apr 2026 09:48:36 -0700 (PDT)
Date: Fri, 24 Apr 2026 09:46:46 -0700
In-Reply-To: <20260424164721.2229025-1-irogers@google.com>
Mime-Version: 1.0
References: <20260423163406.1779809-1-irogers@google.com> <20260424164721.2229025-1-irogers@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260424164721.2229025-25-irogers@google.com>
Subject: [PATCH v5 24/58] perf python: Move exported-sql-viewer.py and
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
X-CRM114-CacheID: sfid-20260424_094839_054343_74C7E2C6 
X-CRM114-Status: GOOD (  14.09  )
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
---
 tools/perf/{scripts => }/python/exported-sql-viewer.py | 4 ++--
 tools/perf/{scripts => }/python/parallel-perf.py       | 0
 tools/perf/tests/shell/script.sh                       | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)
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
index 7007f1cdf761..2051c6e05569 100755
--- a/tools/perf/tests/shell/script.sh
+++ b/tools/perf/tests/shell/script.sh
@@ -76,7 +76,7 @@ test_parallel_perf()
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


