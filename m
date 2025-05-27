Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B9F1C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 May 2025 07:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:From:Subject
	:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qa+bZ6NfDiwN6emHRNVhAg+nUxfKRoBgxQCLCaEZspk=; b=oO+xc5Bk1HMFwzpRbMQHOehPsq
	moJ2NFMBv4e+w9WPmGC3y5ezQEFyAYR5DFR+goGVKR8qyDs+pbInA7/IeVAeZsmPSqyNa3SjTp8Ry
	/bsThZXgsyW5aiTpLyeje8MkX3aqAiejIPn1wA3vmHmlrxr2meeuI6F4C6b66fxKQvPjw4YZEYapd
	z4/z+pNxv89EQIui6NKAsKErkw3OxCCVgx684gpm4sebFL4MyG7fb8GquGQYJaP8dzhGPXybj+MAQ
	VGoZbP+EzeJiFjZz0faWvR5DJh73ldl0dxgbyfK3lgge6BnsOQTJ0dKHaa08BEbh1+gBUOF8CQRMn
	uu0vpd0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJoQk-0000000A7IA-3iMM;
	Tue, 27 May 2025 07:08:58 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJo17-0000000A3Zz-05ek
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 May 2025 06:42:30 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-7394772635dso2068532b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 May 2025 23:42:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748328148; x=1748932948; darn=lists.infradead.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qa+bZ6NfDiwN6emHRNVhAg+nUxfKRoBgxQCLCaEZspk=;
        b=lnDXBjYDY/LJk9+CuoMzGAXvjpdKZgR862i6tPZV22UfCKwNm/1g9coZStYz7mNAVD
         XhwxtMK6Ho9lWuMStu3cD6MAwJp4U9WWSHRf4wULlP0YhBia5MlIRVpYNQP/AOxkCpku
         isEdrGYIaW3wZdIYBtnVlLlsI9KXWHoDJuE/FGFI5s5moG3vPwBEELIFNlMId4iySNLg
         pldunavLcgEmEljuCIsw7QuEqppFUJw9NYiHkxK42al2/lR7SeNRB5866iSbCqc/1vi6
         5qZcFpvFlwzgL0yh87c66HZYwpZJ/ih/hYyB10PAkU4lMQEHsrJwrh9L5ucv7EXCZtm9
         u42g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748328148; x=1748932948;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qa+bZ6NfDiwN6emHRNVhAg+nUxfKRoBgxQCLCaEZspk=;
        b=jBWKJclW3aKJQWZRnGMffeFih232/alr+emdypw8kGAPQ1S7GZvWDZ5bkNCkP1qYVb
         fmjeFHrqSURnDHl9m+2VOU4ArtsOqXsOpOqrZOEWTyu1wzQ9+LcF/5/BB84JLEUoOjDy
         gQeQOQW17aOJRktOE1T2sKHuhgEMbfeGKDnsSAILL5K0pcF5XrgS0JrbaFH7okuZuCGE
         elHwkZnpUF0EtfRXloS3PiGiTS2ChfJjaZdu0eXnPztaKaCs2yrW28iQf26FBZcD1vMn
         mV29HMjtTjIKzu4ZEw6ytu3hiwJ/wzbHB2NXmzjF9PJkmQ89Lm+Q3mq3v8kCkils4ifX
         E/mg==
X-Forwarded-Encrypted: i=1; AJvYcCU5SjjKk3+ToExbxmAC0zZ1m/1AMiBs6P6tM5O/eavUSx6NgK4dly/aSS2TKGV48YxsafRrxQsfXG9AqWpqQsgf@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8cnxJ0P/90G91JiLBC0gFcT9Frhel84p8TLrfZfR4CnOENZ4D
	kLeUOKuIku5dkzzF6iVu5KdE23k84tkVMqvS0f5TzDlK74WT8BJlxUK46viaE0OZRaDJxV0jvU2
	TR7a3S5NJ3Q==
X-Google-Smtp-Source: AGHT+IFaY7Epe7TFUjEZoxVGrbJT8LG2DopMwMAi0GAGc08duoLIMdGL5EAMIRWUbJCsETCGf/3a/aibp3BX
X-Received: from pfjd1.prod.google.com ([2002:a05:6a00:2441:b0:730:743a:f2b0])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:ace:b0:740:6f69:8d94
 with SMTP id d2e1a72fcca58-745fdac936dmr18806567b3a.0.1748328147867; Mon, 26
 May 2025 23:42:27 -0700 (PDT)
Date: Mon, 26 May 2025 23:41:53 -0700
In-Reply-To: <20250527064153.149939-1-irogers@google.com>
Mime-Version: 1.0
References: <20250527064153.149939-1-irogers@google.com>
X-Mailer: git-send-email 2.49.0.1151.ga128411c76-goog
Message-ID: <20250527064153.149939-12-irogers@google.com>
Subject: [PATCH v1 11/11] perf env: Remove global perf_env
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
X-CRM114-CacheID: sfid-20250526_234229_063347_94C71D7D 
X-CRM114-Status: GOOD (  17.13  )
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

The global perf_env was used for the host, but if a perf_env wasn't
easy to come by it was used in a lot of places where potentially
recorded and host data could be confused. Remove the global variable
as now the majority of accesses retrieve the perf_env for the host
from the session.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/perf.c           | 3 ---
 tools/perf/util/bpf-event.c | 2 +-
 tools/perf/util/env.c       | 2 --
 tools/perf/util/env.h       | 2 --
 tools/perf/util/evsel.c     | 2 +-
 tools/perf/util/session.c   | 2 +-
 6 files changed, 3 insertions(+), 10 deletions(-)

diff --git a/tools/perf/perf.c b/tools/perf/perf.c
index f0617cc41f5f..88c60ecf3395 100644
--- a/tools/perf/perf.c
+++ b/tools/perf/perf.c
@@ -346,12 +346,9 @@ static int run_builtin(struct cmd_struct *p, int argc, const char **argv)
 		use_pager = 1;
 	commit_pager_choice();
 
-	perf_env__init(&perf_env);
-	perf_env__set_cmdline(&perf_env, argc, argv);
 	status = p->fn(argc, argv);
 	perf_config__exit();
 	exit_browser(status);
-	perf_env__exit(&perf_env);
 
 	if (status)
 		return status & 0xff;
diff --git a/tools/perf/util/bpf-event.c b/tools/perf/util/bpf-event.c
index c67e3ec938d0..f27890d5cfbb 100644
--- a/tools/perf/util/bpf-event.c
+++ b/tools/perf/util/bpf-event.c
@@ -184,7 +184,7 @@ static int perf_event__synthesize_one_bpf_prog(struct perf_session *session,
 	 * for perf-record and perf-report use header.env;
 	 * otherwise, use global perf_env.
 	 */
-	env = session->data ? perf_session__env(session) : &perf_env;
+	env = perf_session__env(session);
 
 	arrays = 1UL << PERF_BPIL_JITED_KSYMS;
 	arrays |= 1UL << PERF_BPIL_JITED_FUNC_LENS;
diff --git a/tools/perf/util/env.c b/tools/perf/util/env.c
index b363c933e782..02cf7670a52b 100644
--- a/tools/perf/util/env.c
+++ b/tools/perf/util/env.c
@@ -17,8 +17,6 @@
 #include "strbuf.h"
 #include "trace/beauty/beauty.h"
 
-struct perf_env perf_env;
-
 #ifdef HAVE_LIBBPF_SUPPORT
 #include "bpf-event.h"
 #include "bpf-utils.h"
diff --git a/tools/perf/util/env.h b/tools/perf/util/env.h
index d90e343cf1fa..9c6eaaf68c3e 100644
--- a/tools/perf/util/env.h
+++ b/tools/perf/util/env.h
@@ -150,8 +150,6 @@ enum perf_compress_type {
 struct bpf_prog_info_node;
 struct btf_node;
 
-extern struct perf_env perf_env;
-
 void perf_env__exit(struct perf_env *env);
 
 int perf_env__kernel_is_64_bit(struct perf_env *env);
diff --git a/tools/perf/util/evsel.c b/tools/perf/util/evsel.c
index 24c93ea5ba0a..988fe5c4137a 100644
--- a/tools/perf/util/evsel.c
+++ b/tools/perf/util/evsel.c
@@ -3849,7 +3849,7 @@ struct perf_env *evsel__env(struct evsel *evsel)
 {
 	struct perf_session *session = evsel__session(evsel);
 
-	return session ? perf_session__env(session) : &perf_env;
+	return session ? perf_session__env(session) : NULL;
 }
 
 static int store_evsel_ids(struct evsel *evsel, struct evlist *evlist)
diff --git a/tools/perf/util/session.c b/tools/perf/util/session.c
index 9b477cc73c85..94564b0f2b49 100644
--- a/tools/perf/util/session.c
+++ b/tools/perf/util/session.c
@@ -192,7 +192,7 @@ struct perf_session *__perf_session__new(struct perf_data *data,
 				symbol_conf.kallsyms_name = perf_data__kallsyms_name(data);
 		}
 	} else  {
-		session->machines.host.env = host_env ?: &perf_env;
+		session->machines.host.env = host_env;
 	}
 	if (session->evlist)
 		session->evlist->session = session;
-- 
2.49.0.1151.ga128411c76-goog


