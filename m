Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B972C54ED1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 May 2025 07:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:From:Subject
	:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YBLkKYkdQ5SiRC198gXvkCB/ma/yQ9E3LOnnNzaUpPE=; b=IOLbM04AG/gLqdYvXNIt8t+P9E
	yeABGigEF8ync1ZsmubZ91glg05nbTxBh37EF2TmXSDLcbd5bvr9apbbXHTc7ZbWP/k4P/bo4vNpR
	sOzd6q/M4RtIPZlREJMj03IJ0DRoJX5qGwNLPH1Kkv0z83OGMtc3ljkhFM332XTLiiZY3sHbfGoRb
	8nSpZV+PUI6UPZn5C0eg7fVBcxEP6wSksVBsr+SJzh4sm/s9XJ4Ght+0sQ0lQPjAlBwV/HN7RsqLF
	L3YLnvb+KxnclITPgQcIg37DHEVe1IZfhRfCVmtlqTV51AVfUvvOdyBz1Mrt4+TiHndP9gRDiXLYb
	m4wI9WYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJoII-0000000A6LE-3sAo;
	Tue, 27 May 2025 07:00:14 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJo0z-0000000A3WK-0d6q
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 May 2025 06:42:22 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-74292762324so2000393b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 May 2025 23:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748328139; x=1748932939; darn=lists.infradead.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YBLkKYkdQ5SiRC198gXvkCB/ma/yQ9E3LOnnNzaUpPE=;
        b=rR3bCc6j6ao5xrTg+dWOV4fHQxeLP1AeNi2yL65bTtUEpTtxFX8GwT0kurPZkBx+dO
         tO0iU6rn2x/D0ADyadMe89tqAgTPp3/AjB0ayw7dd7MmBlKF8dESt6w7jDW0iJxyfO+2
         yLdM2Tf4CEE33t3iQxz+78RKGRAW8TSXjRYLV9bTtnxdVBZ71LS3WBeeJGPHfjmoCUTn
         3fn8OUUht021PvYsYmfaympINnNfG4evMeZbx6UwbPNe8SZync4f1PsYrFCVWjriMljS
         j/3Z1iQ3qhtMAS9cxtFNi2FvX12r3AQ4N+dp7nr+DTWKUcdgah4WVFHsr9UOVOwCv3pf
         PU9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748328139; x=1748932939;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YBLkKYkdQ5SiRC198gXvkCB/ma/yQ9E3LOnnNzaUpPE=;
        b=mKYgrfb3UwjVw45+uuvNO4SVIJb6HhEvp1w4plRxgTGvgnAjvSDHEEfxY++76+7ArW
         XfEA38UANQKosHFCVctlXpVDv4M8HRxKH8Z1n6trTaTU7aInLYHpASiM114zmBfnsOPJ
         tWx492PeoL45kHaRUNuNR/e9+Sf0WFRYs1n6EM5CIK3D7ZmDLl0kTVeDMgb0AzK4NFBn
         hqdad9AuRNBHfL2TKXs2a+DLcxs1m3UdbyzxA6jIa874RP8aERPfOMkwezeyQBngkA1s
         0GNeVV4lhxFoOvSzWKqhEEBMw1Nxgk0HvKsx1GtuuU3U9N06s00oTzjsl5reh/kwkLXx
         V8Gg==
X-Forwarded-Encrypted: i=1; AJvYcCXbpWAe9iWHHvFf3TUNCGlOYbwNGAumQXjfVIkifP9r3VgVGccFGZLEt3Wo3jHywXBmSkgRmAbuUSO4eWRJPNUE@lists.infradead.org
X-Gm-Message-State: AOJu0Yyh2wCWp6mXIB6KU3xB4vkZwLRY7Wtfeht1A0YGw9YyCBdf1KbG
	MqFcvie0IHACkHl8y2LxmDKPe6KLGlIwZnsd6oWsShs45hJ7tei/Wn5LHIBKbDnpT4htDOxnc4s
	i4/lAmwMnIQ==
X-Google-Smtp-Source: AGHT+IHqlWKmFD9yc2csGjHzi/9TzTaV3F/Ku4c45zz+W7Lqi3AOLD7NV2uIbBNeShcVb9hrPPZxDweD3Vwi
X-Received: from pfad17.prod.google.com ([2002:a05:6a00:291:b0:746:1a2e:b29b])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:2d1b:b0:740:4095:4d07
 with SMTP id d2e1a72fcca58-745fdf4aabcmr19069753b3a.12.1748328139389; Mon, 26
 May 2025 23:42:19 -0700 (PDT)
Date: Mon, 26 May 2025 23:41:49 -0700
In-Reply-To: <20250527064153.149939-1-irogers@google.com>
Mime-Version: 1.0
References: <20250527064153.149939-1-irogers@google.com>
X-Mailer: git-send-email 2.49.0.1151.ga128411c76-goog
Message-ID: <20250527064153.149939-8-irogers@google.com>
Subject: [PATCH v1 07/11] perf session: Add host_env argument to perf_session__new
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
X-CRM114-CacheID: sfid-20250526_234221_189936_A14183DF 
X-CRM114-Status: GOOD (  16.94  )
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

When creating a perf_session the host perf_env may or may not want to
be used. For example, `perf top` uses a host perf_env while `perf
inject` does not. Add a host_env argument to perf_session__new so that
sessions requiring a host perf_env can pass it in. Currently if none
is specified the global perf_env variable is used, but this will
change in later patches.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/builtin-inject.c | 3 ++-
 tools/perf/util/session.c   | 5 +++--
 tools/perf/util/session.h   | 5 +++--
 3 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/tools/perf/builtin-inject.c b/tools/perf/builtin-inject.c
index 1b8c4ff39124..e6f1bf093bc3 100644
--- a/tools/perf/builtin-inject.c
+++ b/tools/perf/builtin-inject.c
@@ -2532,7 +2532,8 @@ int cmd_inject(int argc, const char **argv)
 	inject.tool.auxtrace		= perf_event__repipe_auxtrace;
 	inject.tool.dont_split_sample_group = true;
 	inject.session = __perf_session__new(&data, &inject.tool,
-					     /*trace_event_repipe=*/inject.output.is_pipe);
+					     /*trace_event_repipe=*/inject.output.is_pipe,
+					     /*host_env=*/NULL);
 
 	if (IS_ERR(inject.session)) {
 		ret = PTR_ERR(inject.session);
diff --git a/tools/perf/util/session.c b/tools/perf/util/session.c
index beb74d9fcc07..9b477cc73c85 100644
--- a/tools/perf/util/session.c
+++ b/tools/perf/util/session.c
@@ -137,7 +137,8 @@ static int ordered_events__deliver_event(struct ordered_events *oe,
 
 struct perf_session *__perf_session__new(struct perf_data *data,
 					 struct perf_tool *tool,
-					 bool trace_event_repipe)
+					 bool trace_event_repipe,
+					 struct perf_env *host_env)
 {
 	int ret = -ENOMEM;
 	struct perf_session *session = zalloc(sizeof(*session));
@@ -191,7 +192,7 @@ struct perf_session *__perf_session__new(struct perf_data *data,
 				symbol_conf.kallsyms_name = perf_data__kallsyms_name(data);
 		}
 	} else  {
-		session->machines.host.env = &perf_env;
+		session->machines.host.env = host_env ?: &perf_env;
 	}
 	if (session->evlist)
 		session->evlist->session = session;
diff --git a/tools/perf/util/session.h b/tools/perf/util/session.h
index 088868f1004a..baa59fab761b 100644
--- a/tools/perf/util/session.h
+++ b/tools/perf/util/session.h
@@ -109,12 +109,13 @@ struct perf_tool;
 
 struct perf_session *__perf_session__new(struct perf_data *data,
 					 struct perf_tool *tool,
-					 bool trace_event_repipe);
+					 bool trace_event_repipe,
+					 struct perf_env *host_env);
 
 static inline struct perf_session *perf_session__new(struct perf_data *data,
 						     struct perf_tool *tool)
 {
-	return __perf_session__new(data, tool, /*trace_event_repipe=*/false);
+	return __perf_session__new(data, tool, /*trace_event_repipe=*/false, /*host_env=*/NULL);
 }
 
 void perf_session__delete(struct perf_session *session);
-- 
2.49.0.1151.ga128411c76-goog


