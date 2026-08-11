Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 952FEC5B56A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 15:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8Jf25htTTjahKWtoEfo2hIZORvEQKfVJc2fvPx9rUTY=; b=n47OCItERFkC4xK5x9uJ7uV4d8
	gJFAdhEV4fCL7WR+hj4M+2FdZX2Z+MW3phfyb5mJFK8ncNwTLyawKiu8ChOK/GMs0ir71wEMZPvGx
	g9r0lgrnnNnvejU/7/FIpaXb8ohuKWK49v7mXHKaixFB2fohVTiKDpCbpv18cmu0h/GqlX4gFyVf+
	QOtjqljktoDBasXb1ZYdJwOfN9PyaS5AxNW64A1i7Ho/xCql/CKeBwUTSNr05OWZIYqBOwlE/J0kQ
	j+D/1XLA362BYaS0k+yCkQ8TZiOX/iMJ6/8YJf5eGbXB3e/rPk6MbKdtMq5VchI9U05Ge6jZYri4N
	FRi1RlAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtoRq-0000000EKbZ-0vdV;
	Tue, 11 Aug 2026 15:31:26 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtoRa-0000000EKKx-3JLk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 15:31:12 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4996f1ee4a4so18693555e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Aug 2026 08:31:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1786462269; x=1787067069; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8Jf25htTTjahKWtoEfo2hIZORvEQKfVJc2fvPx9rUTY=;
        b=Khl+vwtgfu/+AcuO9SpbUf6psS/fU4Xglpau9HZBEhEXHdheS0XSehbyV/2mM/gz3l
         KDQA1KqpASHBW5BV+02OL/gEPJ6Ck+3WryMrGV3J6D0XYreMfE3wSm7J4F+wQy+eVwOF
         zHc7/Xu9PwqgyTjwkmRYESEpJR7WO2guitGklWGruo0wkEg5xOlgZBYR5NrUlAd7YJ6b
         MRqYeKTEgQg8n30nMmpCIOMRE9y9LdjdJ9pe66+OS7idwRuFhnUqSq1E0VMFmpJN/EJy
         fGB4nJqL5FCNTJz0STL3Yh0VV0jQonxRurzh9iS68g8QFXT8LTch9qWiuAN34ebqURGS
         evYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786462269; x=1787067069;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8Jf25htTTjahKWtoEfo2hIZORvEQKfVJc2fvPx9rUTY=;
        b=WE7UohkNoQsAaaUozz7EnNCOtpe6nvjkJJlc1/CBpaRTtBJ15mWifBe+kOKke1JRoN
         NOqy7wkle26hAow/xCYTwNMdsLI/u4PjW++fzkt5ZkJax0hv3sPdQdsXWbuyyQ56T0sP
         ueoh2WlFWj2GEDCUXNzmcbyFWyWXxx2kab20swu7urzn7Q/qF7HhRzF8rJLvWeXFp+8q
         WkeO5Bdo7Bu0bUjBj43/SgONXPiyQ50BiN+PAZKTeloH25osb3jib3XWDWcp2c/hXr0g
         Gs4O4QxhcjwzpGCz6hXiu8QPGjGULQ/Km4BVdUa2HcNT3PVdXvLh9n9EMjNPRjDfJRND
         GEMQ==
X-Forwarded-Encrypted: i=1; AHgh+RpYBkx2BJbKVj0lSP7OnA8QB5Ef8euMbnvHdJ8ddT4nF13BhVmkGUntg8iHbPTb9Xj6g7KcVgpsSHfTEC0HBnnQ@lists.infradead.org
X-Gm-Message-State: AOJu0YzUq7BnlppFFOX712d3srQL8x/+vd3CQ66zhUb9/WjNW+d3qBxM
	3uPLZasyUsWLc4JDcHtYcaEP4Qzn1oznpxNW3IN28apT1B32JFPfK+9b45trSzMgeEo=
X-Gm-Gg: AR+sD138oP3nbgOyAFt/is6jF7WU5HQL//uxARIIcV4TazbqeGaZU16LjIPmir+tuIy
	waOIRSwhLJbJA+yPTmlMd1Qp6jaNqML/gA0f/N09KVf2R3VW60NeMHoeFAK/gf1cJsHTfhWYRGq
	DsZzpHneE9sErNwkESxmbmUcpVczNwqfD4KVGANp17S9Qf3+idDuwcN/OYnG8s3/1SxgVR9yRbA
	sQztuUHDTi63vhQc2Gj0uFrUnKdLMJnkV416jvVLklDiHuvE0UNxqdDqCA327NvWlxzH0dhAxmN
	kRVEXN51EhNQF1csLg9LlHTntp0rdTvSOTl7QEpEfY/W3n7/xOFKfIPD4ZaxNoopsoPvHkbjyBr
	ZncGgk+jbQDUNy+/t7y6NgH38wHEebj2Nx1bFhDl69hN+iLfA7QxUVHXkexLmRZcuQHGfCqH9SM
	MlbsobPJRUIqdUUyfuV+hrOUZsfViJcKFtgdEZb/q3U47dflXtOfYM5JElwLoJZv7z
X-Received: by 2002:a05:600c:1550:b0:498:952:e276 with SMTP id 5b1f17b1804b1-499784358eamr51427345e9.8.1786462267978;
        Tue, 11 Aug 2026 08:31:07 -0700 (PDT)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49977dfacb6sm49865395e9.1.2026.08.11.08.31.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 08:31:07 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Tue, 11 Aug 2026 16:30:15 +0100
Subject: [PATCH 12/14] perf test: Allow infinite named_thread loops
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260811-james-cs-unformatted-per-thread-fix-v1-12-90565318f5f8@linaro.org>
References: <20260811-james-cs-unformatted-per-thread-fix-v1-0-90565318f5f8@linaro.org>
In-Reply-To: <20260811-james-cs-unformatted-per-thread-fix-v1-0-90565318f5f8@linaro.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, Leo Yan <leo.yan@arm.com>, 
 John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Suyash Mahar <smahar@meta.com>
Cc: Leo Yan <leo.yan@linux.dev>, linux-arm-kernel@lists.infradead.org, 
 coresight@lists.linaro.org, linux-perf-users@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Arnaldo Carvalho de Melo <acme@redhat.com>, 
 linux-doc@vger.kernel.org, James Clark <james.clark@linaro.org>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_083110_895737_BF2047A2 
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

The following test will want this to run forever, so add support by
treating 0 loops as infinite.

Convert i and named_threads_work to be unsigned to avoid undefined
signed overflow behavior in infinite loop mode.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/Documentation/perf-test.txt     | 2 +-
 tools/perf/tests/workloads/named_threads.c | 7 ++++---
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/tools/perf/Documentation/perf-test.txt b/tools/perf/Documentation/perf-test.txt
index 859df74e62ef..dca8972fec8d 100644
--- a/tools/perf/Documentation/perf-test.txt
+++ b/tools/perf/Documentation/perf-test.txt
@@ -68,7 +68,7 @@ OPTIONS
 		nrloops: brstack, context_switch_loop
 
 	'named_threads' accepts the number of threads and the number of loops to
-	do in each thread.
+	do in each thread. Use 0 for an infinite loop.
 
 	The datasym, landlock, deterministic and callchain workloads don't accept
 	any.
diff --git a/tools/perf/tests/workloads/named_threads.c b/tools/perf/tests/workloads/named_threads.c
index d051d41a3cfe..6672c2f77684 100644
--- a/tools/perf/tests/workloads/named_threads.c
+++ b/tools/perf/tests/workloads/named_threads.c
@@ -11,7 +11,7 @@
 #define MAX_THREADS 25
 
 static int iterations = 500;
-int named_threads_work = 1234;
+unsigned int named_threads_work = 1234;
 
 typedef void *(*thread_fn_t)(void *);
 
@@ -19,7 +19,8 @@ typedef void *(*thread_fn_t)(void *);
 noinline void *named_threads_thread##n(void *arg __maybe_unused)	\
 {									\
 	pthread_setname_np(pthread_self(), "thread" #n);		\
-	for (int i = 0; i < iterations; i++)				\
+	for (unsigned int i = 0;					\
+	     i < (unsigned int) iterations || iterations == 0; i++)	\
 		named_threads_work += 3;				\
 									\
 	return NULL;							\
@@ -65,7 +66,7 @@ static thread_fn_t thread_fns[MAX_THREADS] = {
 
 /*
  * Creates argv[0] threads that run a unique function named "thread[x]" which performs
- * a multiplication in a loop for argv[1] loops.
+ * a multiplication in a loop for argv[1] loops (use 0 for infinite loop).
  */
 static int named_threads(int argc, const char **argv)
 {

-- 
2.43.0


