Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C7B4D5AE6E
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 07:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:From:Subject
	:References:Mime-Version:Message-Id:In-Reply-To:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d5CBVRj+oeokqCZ8tX2zkzcVhcgEep+JK2ByfRR+yWc=; b=A8l179LPM8Wr3B1BDklGlYzuC1
	u0JTBdDbiQJlhL0+y0/4d67Dm+eX/HKd3frxozyB4Iprsp5PrQadD7gaYiMZHLjh/bZ4N/BdEsIq1
	aPsmxPpuXRenK27T3hEaaVlin46aZfeQcRZ/5N0O+lKAmOWuhN8+eptFYOOnVMz7+DcXY1KcNF4Mo
	pt5Hh2hNKhk2JYttCAOiVx+nZLcvqevuq2UCrdcWuULoLsU1u94eix55m2wwkU+wJh05CA45o3ewC
	JKqiDq1ihoyFdmPMcdb7mnkNYZdbGpa8NOAxYYB19JXxxwqGf61doD8+xbNLPZLqitAw6UOPkT3sl
	5m8bG2Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8wo3-00000005xx6-1F9W;
	Thu, 07 Nov 2024 07:19:51 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8wkR-00000005wod-1F1X
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Nov 2024 07:16:10 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-e30cf121024so1063296276.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 Nov 2024 23:16:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730963766; x=1731568566; darn=lists.infradead.org;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d5CBVRj+oeokqCZ8tX2zkzcVhcgEep+JK2ByfRR+yWc=;
        b=XRF+EqaVKWEuj3L/jF8qdQnyf6lBCLV5EkplIDGNGeLo3dfC9X1cv0Z+eVTES2jcZW
         FpwQNWHmQbalnkiTk+UbYp+e/PZ8pq8Vc1ZyT7icleUBYoF0Y03rZq9RktbVKeft2gyr
         yISZFJkQsDl31SbxWpmYQkotYAK/VlbTenvwAU3WrSCI410WG7f41cBr/R2h5Re5VDJi
         K1svfH/2EgipOX/Y5wcxKEdMfWdL8y7DOHLN4RNXrSxNJKTS+jGhy/AMT2k2Ygcgo1YE
         LsoO4RUV6GPAUU6ApTHLf0ggPb3jbLgSgKYHZv0arxa9+d1vpW+ybo0SnrE/U7+MIjOM
         IDyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730963766; x=1731568566;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d5CBVRj+oeokqCZ8tX2zkzcVhcgEep+JK2ByfRR+yWc=;
        b=CDAYzLMryWB0PbDokrXwUe1i8743ODNM/7Xu0u37Xzn0MkNRagEetl0TXFZ7iHC4J1
         hbPIJvhPFIIcKS2Kom4IMbQxxQL0h3x2R5ZAXkvllH+F9LbWhdCYcbNeLeRWYQx8dpCb
         6La9McEpD4ojcJ9IROVHIbMiIN85ryGXAFE/eY0IwObjqNjFk0bWxzHzpWOVr8ZehDMd
         K6Mu56iVCFUffBZhPseN1ZMulPjNaPg+5QdXtYwpd+XReWzqD7HCn725ylQ1QpR77Fir
         VcC5jmTzvj+rPo/QKx8wTBmn1VxOI+QhYojgIjpT7HRCBfGVigSLdNXqh6yugfulqwgi
         svGA==
X-Forwarded-Encrypted: i=1; AJvYcCVf+HwvpRCVmvuiB5S+YPwON26n97kV4YWxiHqp3Z5t5izzoGQNTYmRDv3StPnVuPDGetik93RTFaCU9MWQhwL1@lists.infradead.org
X-Gm-Message-State: AOJu0Yyj7XTjij8OpKxWc11GycRBUZHFnZH6f3d1CzJw+4J2wmsgq5Ry
	NRjbMw860rKDNBmKwc/1ZiyzWm/asgtVjQBVw2I4gom7+TT12nSQ+N2O+F2w+F9W2ICSnyLjHp2
	WO44Jig==
X-Google-Smtp-Source: AGHT+IEd0XW+XP13/lIdiLfA1JS+O6Mq9dYjD7PUyhpWzqvtXDfGa/+OwNkNynbL8Jl1y47mBuEBrXARi0WE
X-Received: from irogers.svl.corp.google.com ([2620:15c:2c5:11:acc7:bda:7167:18d8])
 (user=irogers job=sendgmr) by 2002:a25:a305:0:b0:e11:639b:6428 with SMTP id
 3f1490d57ef6-e3087722c24mr85002276.0.1730963765469; Wed, 06 Nov 2024 23:16:05
 -0800 (PST)
Date: Wed,  6 Nov 2024 23:15:54 -0800
In-Reply-To: <20241107071600.9082-1-irogers@google.com>
Message-Id: <20241107071600.9082-2-irogers@google.com>
Mime-Version: 1.0
References: <20241107071600.9082-1-irogers@google.com>
X-Mailer: git-send-email 2.47.0.199.ga7371fff76-goog
Subject: [PATCH v1 1/7] perf header: Move is_cpu_online to numa bench
From: Ian Rogers <irogers@google.com>
To: John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, 
	James Clark <james.clark@linaro.org>, Mike Leach <mike.leach@linaro.org>, 
	Leo Yan <leo.yan@linux.dev>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Huacai Chen <chenhuacai@kernel.org>, Bibo Mao <maobibo@loongson.cn>, 
	Athira Rajeev <atrajeev@linux.vnet.ibm.com>, Ben Zong-You Xie <ben717@andestech.com>, 
	Alexandre Ghiti <alexghiti@rivosinc.com>, Sandipan Das <sandipan.das@amd.com>, 
	Benjamin Gray <bgray@linux.ibm.com>, Xu Yang <xu.yang_2@nxp.com>, 
	Ravi Bangoria <ravi.bangoria@amd.com>, 
	"=?UTF-8?q?Cl=C3=A9ment=20Le=20Goffic?=" <clement.legoffic@foss.st.com>, Yicong Yang <yangyicong@hisilicon.com>, 
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>, Dima Kogan <dima@secretsauce.net>, 
	"Dr. David Alan Gilbert" <linux@treblig.org>, linux-arm-kernel@lists.infradead.org, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_231607_361536_FA3931C8 
X-CRM114-Status: GOOD (  18.35  )
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

The helper function is only used in the NUMA benchmark as typically
online CPUs are determined through
perf_cpu_map__new_online_cpus(). Reduce the scope of the function for
now.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/bench/numa.c  | 51 ++++++++++++++++++++++++++++++++++++++++
 tools/perf/util/header.c | 51 ----------------------------------------
 tools/perf/util/header.h |  1 -
 3 files changed, 51 insertions(+), 52 deletions(-)

diff --git a/tools/perf/bench/numa.c b/tools/perf/bench/numa.c
index 1fbd7c947abc..611451dbc234 100644
--- a/tools/perf/bench/numa.c
+++ b/tools/perf/bench/numa.c
@@ -533,6 +533,57 @@ static int parse_cpu_list(const char *arg)
 	return 0;
 }
 
+/*
+ * Check whether a CPU is online
+ *
+ * Returns:
+ *     1 -> if CPU is online
+ *     0 -> if CPU is offline
+ *    -1 -> error case
+ */
+static int is_cpu_online(unsigned int cpu)
+{
+	char *str;
+	size_t strlen;
+	char buf[256];
+	int status = -1;
+	struct stat statbuf;
+
+	snprintf(buf, sizeof(buf),
+		"/sys/devices/system/cpu/cpu%d", cpu);
+	if (stat(buf, &statbuf) != 0)
+		return 0;
+
+	/*
+	 * Check if /sys/devices/system/cpu/cpux/online file
+	 * exists. Some cases cpu0 won't have online file since
+	 * it is not expected to be turned off generally.
+	 * In kernels without CONFIG_HOTPLUG_CPU, this
+	 * file won't exist
+	 */
+	snprintf(buf, sizeof(buf),
+		"/sys/devices/system/cpu/cpu%d/online", cpu);
+	if (stat(buf, &statbuf) != 0)
+		return 1;
+
+	/*
+	 * Read online file using sysfs__read_str.
+	 * If read or open fails, return -1.
+	 * If read succeeds, return value from file
+	 * which gets stored in "str"
+	 */
+	snprintf(buf, sizeof(buf),
+		"devices/system/cpu/cpu%d/online", cpu);
+
+	if (sysfs__read_str(buf, &str, &strlen) < 0)
+		return status;
+
+	status = atoi(str);
+
+	free(str);
+	return status;
+}
+
 static int parse_setup_cpu_list(void)
 {
 	struct thread_data *td;
diff --git a/tools/perf/util/header.c b/tools/perf/util/header.c
index a6386d12afd7..55c28e4377ec 100644
--- a/tools/perf/util/header.c
+++ b/tools/perf/util/header.c
@@ -987,57 +987,6 @@ static int write_dir_format(struct feat_fd *ff,
 	return do_write(ff, &data->dir.version, sizeof(data->dir.version));
 }
 
-/*
- * Check whether a CPU is online
- *
- * Returns:
- *     1 -> if CPU is online
- *     0 -> if CPU is offline
- *    -1 -> error case
- */
-int is_cpu_online(unsigned int cpu)
-{
-	char *str;
-	size_t strlen;
-	char buf[256];
-	int status = -1;
-	struct stat statbuf;
-
-	snprintf(buf, sizeof(buf),
-		"/sys/devices/system/cpu/cpu%d", cpu);
-	if (stat(buf, &statbuf) != 0)
-		return 0;
-
-	/*
-	 * Check if /sys/devices/system/cpu/cpux/online file
-	 * exists. Some cases cpu0 won't have online file since
-	 * it is not expected to be turned off generally.
-	 * In kernels without CONFIG_HOTPLUG_CPU, this
-	 * file won't exist
-	 */
-	snprintf(buf, sizeof(buf),
-		"/sys/devices/system/cpu/cpu%d/online", cpu);
-	if (stat(buf, &statbuf) != 0)
-		return 1;
-
-	/*
-	 * Read online file using sysfs__read_str.
-	 * If read or open fails, return -1.
-	 * If read succeeds, return value from file
-	 * which gets stored in "str"
-	 */
-	snprintf(buf, sizeof(buf),
-		"devices/system/cpu/cpu%d/online", cpu);
-
-	if (sysfs__read_str(buf, &str, &strlen) < 0)
-		return status;
-
-	status = atoi(str);
-
-	free(str);
-	return status;
-}
-
 #ifdef HAVE_LIBBPF_SUPPORT
 static int write_bpf_prog_info(struct feat_fd *ff,
 			       struct evlist *evlist __maybe_unused)
diff --git a/tools/perf/util/header.h b/tools/perf/util/header.h
index a63a361f20f4..e91e89d22537 100644
--- a/tools/perf/util/header.h
+++ b/tools/perf/util/header.h
@@ -196,7 +196,6 @@ int write_padded(struct feat_fd *fd, const void *bf,
 
 #define MAX_CACHE_LVL 4
 
-int is_cpu_online(unsigned int cpu);
 int build_caches_for_cpu(u32 cpu, struct cpu_cache_level caches[], u32 *cntp);
 
 /*
-- 
2.47.0.199.ga7371fff76-goog


