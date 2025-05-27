Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB0A2C54F30
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 May 2025 07:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:From:Subject
	:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XNsWVbZHKMTH+JLxsWG7Haie8oSBX2sugIIaYnA3oGo=; b=DHzk27gv2M7EAqUHCGx3UO4w8B
	riozVQTRL6u/hSZznAbPItDoz3zYrpZ2wI4RwZ5WKOa6ofvI+EyFP1Y1Zz1D33gK6+gkA9ScmHdIS
	6CfTg2bOYkosBLfeJFieuOg5oLnyn/TC5vfsaHYR4CGLsjusYN73lVDdq/yBCWnpOJRh0G8FFZQ3d
	VssMKgkSB19LBvU10idGiLmaH15TYEWiWbJaM4S3RE1vH8jKV4UXjqd6CjSOCJ8se0iRNDzJkLqsp
	DHf/YRVn3joVIwbWB1t3deg9yxRD/+mUQ6xe54eXlO3+wrd5jxUVBGsWelZp1avK3x2PKgBfj9QL4
	jiZSK+vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJoKQ-0000000A6nk-33ss;
	Tue, 27 May 2025 07:02:26 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJo11-0000000A3Xg-0zMJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 May 2025 06:42:24 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-e7dc8eb9509so379107276.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 May 2025 23:42:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748328141; x=1748932941; darn=lists.infradead.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XNsWVbZHKMTH+JLxsWG7Haie8oSBX2sugIIaYnA3oGo=;
        b=fH1q8J22TkZG+0gcYXSZ9z757QTOhSiIun+ti660IOvT9+it5IziB9CWOo7qbzqXqq
         zUVRhnpP0UuXf8axSK+XOKS/fPU6slI5aQDEJ1DJOkPFqVDBX1MNO4pcvKLKL87benYY
         1sSnnEJUjEXMT0xtAr6BAllrD+lKrnfD9+pHD5E4ZQ2A7h/5/vy5Njo8HviLUamX83Li
         ouuq2TC1OmYXDdPScSi22RbejfRnv+14eYRH0Wdf6Udo0aOdtJuYOsKpX/jzKz82OP98
         PYwxCIf0X5OK4low6wg6QIzb7vWNGi7Aci+boWggXzZic8dLL6uG1mxkJxejiRHCklXN
         LGkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748328141; x=1748932941;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XNsWVbZHKMTH+JLxsWG7Haie8oSBX2sugIIaYnA3oGo=;
        b=jXW9s4ekQNYuFRhddd5f5gXfrgszFa45nxIl9EIhk6rVGWtbQZQPP5kC0hQskXtszG
         cQJ2aO0Bh6Uh6Sk0OvBWl4DDXV51z1LvrjCpZqbXqI22D/vkzOofEEnwsjRGUR7Bm13m
         296Lbs7QFjUeQ01diYxkEibH4letrs1prKLt3rysZThn/GgWrPRKbLBIkrfBF3Yp+3sD
         5T8jLniI7QmYxPzBFLFo2zn/g1hpbt+EOv877wFupaH7hZ53QveuoOxa4SjC5/BZ389B
         0vDcw8iJdZ/0zZk++WjN+p3jK8IeSeRAzE8aEC0Xk+0MH0OIGJIi9vtWHbm45Bo+mKtW
         x5aw==
X-Forwarded-Encrypted: i=1; AJvYcCXsVFv7hUAUitOWglx7i/7q9SZbkmhHPdC4i9njHRIk5BjUtmfCRhdKN7lfpGJHjbQqc69cokXL2Y0GdHk9gHqL@lists.infradead.org
X-Gm-Message-State: AOJu0YyqYpXj4O0NPU5zDz0zlWVryoyd4J7wu2V9mJRW1tkgmNFVVDAH
	8s5XH01hOFLyT+vycOtduZjENB0nUMBP+fJriPh9jiJdVTpxiwXPiCoCJrSIy78ED9+s7mY42Qf
	p7iB/PKmFxw==
X-Google-Smtp-Source: AGHT+IHfYe4oI4XOwek2vvEbiP89zehdPT5a0EmY7OUCuHhLrrjgpYB6bXn3UfQb9gmsOs6Ovv3aB3zUDwc2
X-Received: from ybbgy9.prod.google.com ([2002:a05:6902:4489:b0:e7d:c5dd:c1d5])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6902:310f:b0:e7d:5f06:91ff
 with SMTP id 3f1490d57ef6-e7d9189aa34mr11597728276.8.1748328141648; Mon, 26
 May 2025 23:42:21 -0700 (PDT)
Date: Mon, 26 May 2025 23:41:50 -0700
In-Reply-To: <20250527064153.149939-1-irogers@google.com>
Mime-Version: 1.0
References: <20250527064153.149939-1-irogers@google.com>
X-Mailer: git-send-email 2.49.0.1151.ga128411c76-goog
Message-ID: <20250527064153.149939-9-irogers@google.com>
Subject: [PATCH v1 08/11] perf bench synthesize: Avoid use of global perf_env
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, John Garry <john.g.garry@oracle.com>, 
	Will Deacon <will@kernel.org>, James Clark <james.clark@linaro.org>, 
	Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>, 
	Charlie Jenkins <charlie@rivosinc.com>, Colin Ian King <colin.i.king@gmail.com>, 
	Andi Kleen <ak@linux.intel.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Ravi Bangoria <ravi.bangoria@amd.com>, Graham Woodward <graham.woodward@arm.com>, 
	Ilkka Koskinen <ilkka@os.amperecomputing.com>, Zhongqiu Han <quic_zhonhan@quicinc.com>, 
	Yicong Yang <yangyicong@hisilicon.com>, Howard Chu <howardchu95@gmail.com>, 
	"Dr. David Alan Gilbert" <linux@treblig.org>, Levi Yun <yeoreum.yun@arm.com>, 
	Weilin Wang <weilin.wang@intel.com>, Michael Petlan <mpetlan@redhat.com>, 
	"=?UTF-8?q?Krzysztof=20=C5=81opatowski?=" <krzysztof.m.lopatowski@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, 
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>, Chun-Tse Shao <ctshao@google.com>, Ben Gainey <ben.gainey@arm.com>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250526_234223_274095_27F280CD 
X-CRM114-Status: GOOD (  16.24  )
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

The benchmark doesn't use a data file and so the header perf_env isn't
used. Stack allocate a host perf_env for use to avoid the use of the
global perf_env.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/bench/synthesize.c | 30 +++++++++++++++++++-----------
 1 file changed, 19 insertions(+), 11 deletions(-)

diff --git a/tools/perf/bench/synthesize.c b/tools/perf/bench/synthesize.c
index 9b333276cbdb..79d99ba50284 100644
--- a/tools/perf/bench/synthesize.c
+++ b/tools/perf/bench/synthesize.c
@@ -114,10 +114,13 @@ static int run_single_threaded(void)
 		.pid = "self",
 	};
 	struct perf_thread_map *threads;
+	struct perf_env host_env;
 	int err;
 
 	perf_set_singlethreaded();
-	session = perf_session__new(NULL, NULL);
+	perf_env__init(&host_env);
+	session = __perf_session__new(/*data=*/NULL, /*tool=*/NULL,
+				      /*trace_event_repipe=*/false, &host_env);
 	if (IS_ERR(session)) {
 		pr_err("Session creation failed.\n");
 		return PTR_ERR(session);
@@ -144,6 +147,7 @@ static int run_single_threaded(void)
 		perf_thread_map__put(threads);
 
 	perf_session__delete(session);
+	perf_env__exit(&host_env);
 	return err;
 }
 
@@ -154,17 +158,21 @@ static int do_run_multi_threaded(struct target *target,
 	u64 runtime_us;
 	unsigned int i;
 	double time_average, time_stddev, event_average, event_stddev;
-	int err;
+	int err = 0;
 	struct stats time_stats, event_stats;
 	struct perf_session *session;
+	struct perf_env host_env;
 
+	perf_env__init(&host_env);
 	init_stats(&time_stats);
 	init_stats(&event_stats);
 	for (i = 0; i < multi_iterations; i++) {
-		session = perf_session__new(NULL, NULL);
-		if (IS_ERR(session))
-			return PTR_ERR(session);
-
+		session = __perf_session__new(/*data=*/NULL, /*tool=*/NULL,
+					      /*trace_event_repipe=*/false, &host_env);
+		if (IS_ERR(session)) {
+			err = PTR_ERR(session);
+			goto err_out;
+		}
 		atomic_set(&event_count, 0);
 		gettimeofday(&start, NULL);
 		err = __machine__synthesize_threads(&session->machines.host,
@@ -173,10 +181,8 @@ static int do_run_multi_threaded(struct target *target,
 						process_synthesized_event,
 						true, false,
 						nr_threads_synthesize);
-		if (err) {
-			perf_session__delete(session);
-			return err;
-		}
+		if (err)
+			goto err_out;
 
 		gettimeofday(&end, NULL);
 		timersub(&end, &start, &diff);
@@ -198,7 +204,9 @@ static int do_run_multi_threaded(struct target *target,
 
 	printf("    Average time per event %.3f usec\n",
 		time_average / event_average);
-	return 0;
+err_out:
+	perf_env__exit(&host_env);
+	return err;
 }
 
 static int run_multi_threaded(void)
-- 
2.49.0.1151.ga128411c76-goog


