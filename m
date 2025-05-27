Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C34EFC54F30
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 May 2025 06:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:From:Subject
	:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EQf+Z2part0hsdtY7//u4THJS4IDXYFor1XjnfmY5gg=; b=rWTUdqByVE+cW7OKlf45LRv4mY
	miZjXE/lnwTke8V4cEBZe+qPAK08pDnVr+5xWukGdApNFll5DW+RABLD4ormng94jE/wIwtRrDxlD
	riS9iMDb673r2ujM4ya6BWfqIzEElM488j+U46iIy9wqB4kuv1fG4ydZj4rQZI/LDA4HaDTfRVQoR
	oYF8mVfXuv9wd54kjGnsJt7Qu9gjaPhFQAbSI3VF5cEY4hrm9xbZYR9EFism4r4rRXxJBVHfNXyee
	n7qs7sJC82EFdqxUbL0wNorVQuenS5Y2le0xLUQeO84GPne/wI63bG5/gRUc0jxHRGsN50huH5J6V
	WFxNniVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJoGC-0000000A5mx-0wOe;
	Tue, 27 May 2025 06:58:04 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJo0w-0000000A3Uy-1pkD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 May 2025 06:42:20 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-3113a29e1fdso3154725a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 May 2025 23:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748328137; x=1748932937; darn=lists.infradead.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EQf+Z2part0hsdtY7//u4THJS4IDXYFor1XjnfmY5gg=;
        b=CkMDIgyLdVlFDpbz01PD00VRkt1/TqZiMqh7seg+RZuk/an9RwDA5SxV3B3XSz5Ba1
         hdpnC6UqibbJeew8fON9dm51Kq3lnyvRq7cDNCl9ptLKlqcnHdvua7Ls0oWOa0BSwysI
         GueJLz1pOfxu11vs8OiJLTkGUileGMbNhmi6SwD2RAyHYivI5cPlHq581czSDwW91iAw
         pPjKEA49BzTlgJ5BIW5S5IFmd9h5Yv39i7QXlDZO7F464YdM/eicPXfoR67Rz3nLC3w3
         1UyuYRHfok2RWJ2UaUUfoVSSqcluOp48ZOR1o+72FJ4r9gntM/fcosZjRDUDo8Iu86rs
         7vDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748328137; x=1748932937;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EQf+Z2part0hsdtY7//u4THJS4IDXYFor1XjnfmY5gg=;
        b=Ht9EtlsGOGb0aKkPvMJ9yWurShFTK6BCQCahmU1eHLoGB2ohNwOya5Bz0Z6WD9zEm4
         tPM1Hfdv/9JTJYadhIJBPRZ5fGXZ4AcQb/MiYmaW0QmEO/lxH1HmT4tmu5TS1ChWPDMD
         kru+zDn7SpvSGiirNHnmAUce0OubpHUxb3sBVTUVRhkwYcOfsIMmFy8aygOmdAHi/7fz
         QNhgCuBC7kVVy8PhJGozAjtH0qDQHm3u3PHYIFgDqe2uPZxvwYw0LUZsUvA5eIkkmn8m
         qPLk8v0MBuhflqcHijsPFTkfxTOQ9X0tU37ogtRM4qVXV2vLGlm3o5RZGCG/7mGIv47j
         iR1Q==
X-Forwarded-Encrypted: i=1; AJvYcCXNvpxe/bd2tWdkF3ZTI50NRorIJMyx5aNgkBc9sr4iMtKmnrBueB5sJ0iDKZNUBeD8dy2nKGi3acUshp4vVVcH@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9ulidudOMIFVkxneI/hDWxgXYMbhYBhsEYJfJZ/5RcaOoLxuy
	atQdIIlXUGFiBZBRdKcedxZoxUM2iSnkHyR/NbasF+3OxIdanXayccxCVXkj4uHzkspOpy6RG0q
	gd+2xXqubwQ==
X-Google-Smtp-Source: AGHT+IH63nXw7pXDu0b2FYWDPpqXAyJ0WhvWKd5PccXZpsPz9a+Wx6sv15yS8l2Bt2yFk1APhDR1qWujVQuT
X-Received: from pjbpq14.prod.google.com ([2002:a17:90b:3d8e:b0:311:2c1f:b0d8])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3f0d:b0:309:f407:5ad1
 with SMTP id 98e67ed59e1d1-311108a1d6amr22190394a91.14.1748328137381; Mon, 26
 May 2025 23:42:17 -0700 (PDT)
Date: Mon, 26 May 2025 23:41:48 -0700
In-Reply-To: <20250527064153.149939-1-irogers@google.com>
Mime-Version: 1.0
References: <20250527064153.149939-1-irogers@google.com>
X-Mailer: git-send-email 2.49.0.1151.ga128411c76-goog
Message-ID: <20250527064153.149939-7-irogers@google.com>
Subject: [PATCH v1 06/11] perf top: Make perf_env locally scoped
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
X-CRM114-CacheID: sfid-20250526_234218_477243_96255EB8 
X-CRM114-Status: GOOD (  17.72  )
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

The use of the global host perf_env variable is potentially
inconsistent within the code. Switch perf top to using a locally
scoped variable that is generally accessed through the session.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/builtin-top.c | 35 ++++++++++++++++++++++++-----------
 1 file changed, 24 insertions(+), 11 deletions(-)

diff --git a/tools/perf/builtin-top.c b/tools/perf/builtin-top.c
index 3c89568dd6d0..9ca0617047fd 100644
--- a/tools/perf/builtin-top.c
+++ b/tools/perf/builtin-top.c
@@ -1301,7 +1301,7 @@ static int __cmd_top(struct perf_top *top)
 	perf_set_multithreaded();
 
 	if (perf_hpp_list.socket) {
-		ret = perf_env__read_cpu_topology_map(&perf_env);
+		ret = perf_env__read_cpu_topology_map(perf_session__env(top->session));
 		if (ret < 0) {
 			char errbuf[BUFSIZ];
 			const char *err = str_error_r(-ret, errbuf, sizeof(errbuf));
@@ -1624,6 +1624,7 @@ int cmd_top(int argc, const char **argv)
 		NULL
 	};
 	int status = hists__init();
+	struct perf_env host_env;
 
 	if (status < 0)
 		return status;
@@ -1639,12 +1640,17 @@ int cmd_top(int argc, const char **argv)
 
 	status = perf_config(perf_top_config, &top);
 	if (status)
-		return status;
+		goto out_delete_evlist;
 	/*
 	 * Since the per arch annotation init routine may need the cpuid, read
 	 * it here, since we are not getting this from the perf.data header.
 	 */
-	status = perf_env__read_cpuid(&perf_env);
+	perf_env__init(&host_env);
+	status = perf_env__set_cmdline(&host_env, argc, argv);
+	if (status)
+		goto out_delete_evlist;
+
+	status = perf_env__read_cpuid(&host_env);
 	if (status) {
 		/*
 		 * Some arches do not provide a get_cpuid(), so just use pr_debug, otherwise
@@ -1661,18 +1667,24 @@ int cmd_top(int argc, const char **argv)
 
 	if (disassembler_style) {
 		annotate_opts.disassembler_style = strdup(disassembler_style);
-		if (!annotate_opts.disassembler_style)
-			return -ENOMEM;
+		if (!annotate_opts.disassembler_style) {
+			status = -ENOMEM;
+			goto out_delete_evlist;
+		}
 	}
 	if (objdump_path) {
 		annotate_opts.objdump_path = strdup(objdump_path);
-		if (!annotate_opts.objdump_path)
-			return -ENOMEM;
+		if (!annotate_opts.objdump_path) {
+			status = -ENOMEM;
+			goto out_delete_evlist;
+		}
 	}
 	if (addr2line_path) {
 		symbol_conf.addr2line_path = strdup(addr2line_path);
-		if (!symbol_conf.addr2line_path)
-			return -ENOMEM;
+		if (!symbol_conf.addr2line_path) {
+			status = -ENOMEM;
+			goto out_delete_evlist;
+		}
 	}
 
 	status = symbol__validate_sym_arguments();
@@ -1826,7 +1838,7 @@ int cmd_top(int argc, const char **argv)
 		top.session = NULL;
 		goto out_delete_evlist;
 	}
-	top.session->env = &perf_env;
+	top.session->env = &host_env;
 
 	if (!evlist__needs_bpf_sb_event(top.evlist))
 		top.record_opts.no_bpf_event = true;
@@ -1841,7 +1853,7 @@ int cmd_top(int argc, const char **argv)
 			goto out_delete_evlist;
 		}
 
-		if (evlist__add_bpf_sb_event(top.sb_evlist, &perf_env)) {
+		if (evlist__add_bpf_sb_event(top.sb_evlist, &host_env)) {
 			pr_err("Couldn't ask for PERF_RECORD_BPF_EVENT side band events.\n.");
 			status = -EINVAL;
 			goto out_delete_evlist;
@@ -1863,6 +1875,7 @@ int cmd_top(int argc, const char **argv)
 	evlist__delete(top.evlist);
 	perf_session__delete(top.session);
 	annotation_options__exit();
+	perf_env__exit(&host_env);
 
 	return status;
 }
-- 
2.49.0.1151.ga128411c76-goog


