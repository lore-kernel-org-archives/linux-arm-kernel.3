Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5D7DC5DF87
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 09:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8Jf25htTTjahKWtoEfo2hIZORvEQKfVJc2fvPx9rUTY=; b=FWA8DyD9gR/sj3LNx+oWn4USyA
	aZjyYsokBhpmHIsAQOSX1BK761+eZk4HXLCvdT5vWXSfc2kt9KLQd7zu+DKgcZg/pnmh885pQvPBv
	bXUeDWFhIfHhQR8VNtY3BdWz1Wf4MGROuFYYhwu0Qg+IhJN6oigW0lhfpv/p+0pzRqODD6OfoJ4w+
	TM11HaUxhqp+FnqpisFPQulOjkuhRfFrCjrcxwvwBsX+Vr7aZ2dOGbDD/cXy//+tSY9XgJwkPBUAY
	h0aky4mzLQ0XYTjItpL6VSy4Npu0zsVytnIhCVFFpm0NmiWuiCKlVRLzeL0km1i7LS+MEfMHHujSX
	W7ZB4j2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxLtD-0000000Cxd3-3Fn8;
	Fri, 21 Aug 2026 09:50:19 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxLsd-0000000Cx3G-2ujD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 09:49:45 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-482c58a8683so21017f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Aug 2026 02:49:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1787305782; x=1787910582; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8Jf25htTTjahKWtoEfo2hIZORvEQKfVJc2fvPx9rUTY=;
        b=zFUheZtIwjWhUwN8ORo5y2FLSx8KpPvE9pfOdF+KMT/7KZ9JkTcnKvxPhDIYizGg9T
         ClA+Oi+/C7OGSdAdYg78ah7hfN7zh2juDSVkO0ByPKPNv16vqcJXJi90aB+g68GSiA2R
         aRIgHp04B7VJ0si0+3umbplj0xpS1ktddEJ6etCCkO5JcJnYHaQTFXYY/CXIj1lttmhV
         FxrmK777RabbdNPdLSHn/jEwEyfKuZfRA+Bibb/yLYylenLIrpGXbQdo2kRbOEqy70s1
         gdtAJcKzZ1pATQxROEwC3TiXUNDtIglSxJ54GWo8LgcrxsP1RstHWNqpVduZakeAH/2Z
         NIHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787305782; x=1787910582;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8Jf25htTTjahKWtoEfo2hIZORvEQKfVJc2fvPx9rUTY=;
        b=aXiSu8V5rsQgP6EqlPGr8CSDDJ3tuii7iPoYswORImM7DaaiL8N0fo3byCsapJl2zq
         6853FEah1PjvFXtq8pzoU/Qu6CLBDgF8tMLoT1kre2HYPhfNYEljYbV+7elvkIRPyVjB
         4q/7o4j/+cKcLd7NRIGlPCNDgp1diRM4INa3mYz4rcPrIy300Qf64tlIBjlMnvFx28x1
         NeS7moxxvYjLJlPEY/064tYOXkQ0zIpS+jFVu2+HLITFIb4c6BAcuOygrpIkEKMwvITD
         ne5mVtOe149gmsV7cBaZDiGto/dEDda0FsFNAhQiOs7PNvAH8X6txT9+zYgY8FqgtT9i
         R6Og==
X-Forwarded-Encrypted: i=1; AHgh+Ro2ka4uW2RbaaMMOjziIGfYcFm+/gACscVZp4UmIUo/HauKOYc5OwYoAkug8Qw4XuByMRAD/hVpzMJKiNFG5L/h@lists.infradead.org
X-Gm-Message-State: AFuF++mQXxVtU7zIC4KwtDgUxITRUHeKOmEsSiAq5y9Dc7rkDoXV3zrl
	XI2aMOmT/2Q2NNSYvAsVeB0KEKKhK1Zv+63JXrTybINOwdwMN707YOpKOCLKbnppTp4=
X-Gm-Gg: AR+sD1255bwUGBp92uT52t/+6AC93v/VRHAkI6idPtzuO4PxQ5/mtrZg+bnWVuQHq9z
	WqKkZaDSxd1aWMps1BKgzEzbBW19D4lGNH+MK9uFQn8YSQIncq+8AJiC/4en9Btjhrk+332xNdo
	QoX0YPEnN8lSXpRRfcfh8sz+OgMHXfC+Kx2UJHA815HDmjF6lVVZOWu5YnJVhjHH4m8B/tdh09Z
	Rj8YjTRMi61D30N6DeSh7xUuHffNm6bDMep+2RbP67S/njXDDia78zqySgbN+kPhqrrpGbRyBke
	QNLohMgYh+vj8nMjIUF8x3k53lD1XgvAutzC0XZzTZCrPV5R9V2NCXDl4iUFjwYFoUBc5nGPKOI
	Gf1MGMBA3ppU7BnjE31UJcFBbL09xVzCC/uWyeMijceX4Vuvs+h5Ia0GcXxnqqeZEXLkhadWtJr
	7bgxdoQdU60HhwYi8a9huq20HVGQqgbPkfaU88Ela3BNn61d+KE3GV6/qRadX4iPYJ
X-Received: by 2002:a05:6000:2589:b0:482:bf17:e685 with SMTP id ffacd0b85a97d-482c0b88f19mr8390069f8f.11.1787305782104;
        Fri, 21 Aug 2026 02:49:42 -0700 (PDT)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14d05a6sm17683479f8f.35.2026.08.21.02.49.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 02:49:41 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Fri, 21 Aug 2026 10:49:10 +0100
Subject: [PATCH v2 12/14] perf test: Allow infinite named_thread loops
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-james-cs-unformatted-per-thread-fix-v2-12-00c4fd0701b4@linaro.org>
References: <20260821-james-cs-unformatted-per-thread-fix-v2-0-00c4fd0701b4@linaro.org>
In-Reply-To: <20260821-james-cs-unformatted-per-thread-fix-v2-0-00c4fd0701b4@linaro.org>
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
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
Cc: Leo Yan <leo.yan@linux.dev>, linux-arm-kernel@lists.infradead.org, 
 coresight@lists.linaro.org, linux-perf-users@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Arnaldo Carvalho de Melo <acme@redhat.com>, 
 linux-doc@vger.kernel.org, James Clark <james.clark@linaro.org>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_024943_856238_725FDE32 
X-CRM114-Status: GOOD (  14.50  )
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


