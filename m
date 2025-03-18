Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D32AC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 03:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:From:Subject
	:References:Mime-Version:Message-Id:In-Reply-To:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DQo9te7ZzJhvscCqCJ9snuZUA/U+ZRpIQMTgL/AyPbA=; b=i+mfUmpc9LeeCl40i+8aH06FKI
	270ANWCpEoO6Hdi3CMzSmCFBwRO9a0x24W+bHi4LeqJtMCYNn++3iTsfFtoDbxn/1bUHEev6RkCN2
	R73+5/wi1G6u5M2dKqTN14cVtUVB0hSwGD97qY6oRdG9LSEYIXJ83xwwz9YhCyHFuLTqSnrlkRW0a
	A3utcEZebUfSxQaMDUQs+KXjYYetb33m2HHFnuYur5uLoFqhqjWT0c33pcq+rKhmJkgYOFgqpZSgJ
	xKQON0RoILgpMki6nn8zNKn3kAqM42O0eKb/s/33GqeOxAZUt/vpY6qRoIXBgWTcMQd3q0Waix+wS
	wrJSCXVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuO65-00000004aW9-0Lqg;
	Tue, 18 Mar 2025 03:58:33 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuNgp-00000004WON-0XD2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 03:32:31 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-e6432a0dad8so2503129276.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Mar 2025 20:32:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742268746; x=1742873546; darn=lists.infradead.org;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DQo9te7ZzJhvscCqCJ9snuZUA/U+ZRpIQMTgL/AyPbA=;
        b=c/61Vk/mWNjFPW93RptXlN9vthitP2iwK+AQyi+y4tqaKrS6qnaoJB3CGkG2KNjgOx
         6GYKJVK0K8AEN18duRJ/2i4d6xaN4qam5Kb6aoTpcEl0uSj3DN8ANbzYCLNqIwd+/ffN
         lFvch2mfl8f2avyuJLvV7etgm24iUmglyBpxhdYXJBhhuNvgMQBII6M/YSlZgNdO/ooN
         WSnEyPENSgQhqmWzTSpp3K+kj6Vy/IpsmcKQqEvWjL5t6idaWnrt9Y7sBN2Da1NVgDl5
         RPzXd9Ht8R7HfPIVvFAGrwtpn1Os9nvOwFoAVx7OE4VAdEmif4SxJGc8xKtvnj5ljY3L
         Guew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742268746; x=1742873546;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DQo9te7ZzJhvscCqCJ9snuZUA/U+ZRpIQMTgL/AyPbA=;
        b=ko20W6zWE2/CdO59LLAyzQDKsntxNUu8JwnbDYzO5V0ApE3JqJT9w76TY8rwbZjDyU
         npgipJZrTlZhaymSOiQ9u4WLsBumUKG6jP0hLRmSzK2ElFQxwu2MViwyCHcSw1O5YiDs
         Hc+XfXqp8yyoKiAU4ED8VOdA6eaDiBPU5YoaceW8nTOdjk3hTAGjqxoKcT7gFRTK3pJD
         3xRHNiBSbCZyKvsqOkkgKdLEo0htI71c0R2SYrl0bGyQrx6dg6nqULb7NeFussZjAQ30
         s3uiRU2yk0IK4HDFPK6lhqPlECRiZZT71bfV2li7MIjs2AGMdl3uPc5Y9DN4P5W6eNla
         z3YA==
X-Forwarded-Encrypted: i=1; AJvYcCWKQhkclUiO9BBZ9NRlvhgULN9kjuRi47pjv/nW8Oj+XNFe86jlLM2Tl/OGHiFUNa/cPI8kVUWSF6cspaDd1UDS@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/XyfGFKEWtgOUmhijZMyKGu93fx5aEgdTIw0pGks8nZLxEwuV
	a+i72le7q/n+zRrF2BYrflV6lQEt0QyVYfUz0BMuRUyXX78/Vl8dENBTZYeGinl6Yu1uyi0fgYo
	9L2TMpA==
X-Google-Smtp-Source: AGHT+IGRlVl7Gw//953kKsnqnEm7y8Rwpz1NXG8HWXbHdCQFY9o6z5zJFDv6lHgSfJyidVHvfm/4CNW4I8zo
X-Received: from irogers.svl.corp.google.com ([2620:15c:2c5:11:ef29:15ce:a42a:b69f])
 (user=irogers job=sendgmr) by 2002:a25:8209:0:b0:e5b:f74:f5a with SMTP id
 3f1490d57ef6-e63f65f1718mr7472276.8.1742268745758; Mon, 17 Mar 2025 20:32:25
 -0700 (PDT)
Date: Mon, 17 Mar 2025 20:31:50 -0700
In-Reply-To: <20250318033150.119174-1-irogers@google.com>
Message-Id: <20250318033150.119174-14-irogers@google.com>
Mime-Version: 1.0
References: <20250318033150.119174-1-irogers@google.com>
X-Mailer: git-send-email 2.49.0.rc1.451.g8f38331e32-goog
Subject: [PATCH v6 13/13] perf trace: Fix BTF memory leak
From: Ian Rogers <irogers@google.com>
To: Ian Rogers <irogers@google.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Kan Liang <kan.liang@linux.intel.com>, 
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, 
	James Clark <james.clark@linaro.org>, Mike Leach <mike.leach@linaro.org>, 
	Leo Yan <leo.yan@linux.dev>, guoren <guoren@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Charlie Jenkins <charlie@rivosinc.com>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Jiri Slaby <jirislaby@kernel.org>, 
	"=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?=" <bjorn@rivosinc.com>, Howard Chu <howardchu95@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	"linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>, linux-riscv@lists.infradead.org, 
	Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_203227_155371_14B7DEC8 
X-CRM114-Status: GOOD (  11.04  )
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

Add missing btf__free in trace__exit.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/builtin-trace.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tools/perf/builtin-trace.c b/tools/perf/builtin-trace.c
index a5f31472980b..d4bbb6a1e817 100644
--- a/tools/perf/builtin-trace.c
+++ b/tools/perf/builtin-trace.c
@@ -5339,6 +5339,12 @@ static void trace__exit(struct trace *trace)
 		zfree(&trace->syscalls.table);
 	}
 	zfree(&trace->perfconfig_events);
+#ifdef HAVE_LIBBPF_SUPPORT
+	if (trace->btf != NULL) {
+		btf__free(trace->btf);
+		trace->btf = NULL;
+	}
+#endif
 }
 
 #ifdef HAVE_BPF_SKEL
-- 
2.49.0.rc1.451.g8f38331e32-goog


