Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31EA7D4337C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 16:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:From:Subject
	:References:Mime-Version:Message-Id:In-Reply-To:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QeV5H6hULi4PmNWhXYnKicIpV1Vf/5KV4yP0bFilR2g=; b=jK3ztRJS93eZMnTkT+XvkUHK5u
	fA8wMrWreaIDXU66rG/S0AEW9QhFuzcpo6KD5X+2xz6Yd+SxhNubJHyQupDBLeCJr95a1GlPAIYZ6
	kQ1FtroDlujsv2Sz1SEdyr05wrzry3iy4G4nK+m2+i29B82Wwt3x1pBtVSDhNYTFYZEiaPUern4bA
	4hviv4OvOLr2UaQ44OM+1yjRIPnjm/79nQafJhOjS875LxfUmev0Eh9D3/J7QgR2eTpMa3bCbCrxH
	SfrYFTmJxlpc+EOoQOeSbQ40vUU02WKZtSUO+0C4571ztE5DrpaaFNdx3p4qN2Ac2IJNNQy7ZcMpR
	TVaeDZmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t95UA-00000007fdJ-0znp;
	Thu, 07 Nov 2024 16:35:54 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t95FZ-00000007bcO-0hrL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Nov 2024 16:20:51 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-e297a366304so1795071276.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 Nov 2024 08:20:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730996447; x=1731601247; darn=lists.infradead.org;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QeV5H6hULi4PmNWhXYnKicIpV1Vf/5KV4yP0bFilR2g=;
        b=eSvP4fUD+BDA76SdMib3FFTil16utduX6ht5WWAzntgFVPoUJO3wDjwVkFwBDTWAwn
         XDFaiyKgKddXOs+Qs11ue3S1s7dajV2onEc0NCD1G8NdmhhhashPAwdKJiFvRLyjWE5C
         uyWhD8Qy70NyH3pW/jJId/QKB8l5ti8+w+QeQgdRvSslcBG0ouMdmMUISw3baY4Eobfr
         ELhm9MZsv37R1t553CcaUfG2BUmI5o/pxO4WgfFk07WP72+IxiFhFMUdIVWf1J2WihuM
         +5iH+b45fkVksUIHXJxL5+HxT7TABFdfKrGBLcRM464rGGFEP/5WQaV1fap6gnhr4T7g
         e39w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730996447; x=1731601247;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QeV5H6hULi4PmNWhXYnKicIpV1Vf/5KV4yP0bFilR2g=;
        b=nKHGNoAgzbxGUjZefwbfnknUWChuNRMmoJ5C5VbY0e0Au7zqJiXMp7JCEonLARouot
         0Ajvxo7wLlLslLoLqRE0s6BF1mONbsj/jqGJNl/gAYBs9vSvFdRVbHsgK91wBQMtowQM
         ziuP7YOuYwZibN4KFNBhZtRTvaCety4pYL+KMn6TEkHbiY/W91xMKDTJ/W7UehHOkMIv
         o6fIMYQ9CvwpHxLJTmyCALDsssnQJfCEuOc5cc3QvYzeKJ4zn88TmGDJDYODpz2PV2TG
         j7ZqPNW+PaVJ1xWyEkRrU+8s65mY/p2dlUtSgPZ8ukLACSU+n1uLL7mhZRMtqwJJ3CE6
         Y3cQ==
X-Forwarded-Encrypted: i=1; AJvYcCWRw8cQU+/rpWFZ2AVlwnAI3cgc5bWdWhjkvWsUv7Fj6I4HCcRh4BqHBbjeaC4GCUCyMijDJXykocBpI4HD53B6@lists.infradead.org
X-Gm-Message-State: AOJu0Ywm4DzBep9TUDt8ascmfUrgbWQ9wy3at+bPEqRUOHy8uK7xge+Q
	PjFVjLs9SDrYjx6bnGVueCO0Vw1BTgUt58PD1JpPUr7pGcv+pGvI3DnWgnxGVYQchMlTFgZ+uGs
	rdhTPgg==
X-Google-Smtp-Source: AGHT+IGjhnQlyx60uwo4p9IkAZDT92KIybjWbIW3SuIDxmWBljHRgORYz+qbzqRTmwlk3UFalbtBGeNtiEp3
X-Received: from irogers.svl.corp.google.com ([2620:15c:2c5:11:acc7:bda:7167:18d8])
 (user=irogers job=sendgmr) by 2002:a25:8382:0:b0:e2b:ce2f:787a with SMTP id
 3f1490d57ef6-e3087a603e2mr94177276.3.1730996447029; Thu, 07 Nov 2024 08:20:47
 -0800 (PST)
Date: Thu,  7 Nov 2024 08:20:30 -0800
In-Reply-To: <20241107162035.52206-1-irogers@google.com>
Message-Id: <20241107162035.52206-4-irogers@google.com>
Mime-Version: 1.0
References: <20241107162035.52206-1-irogers@google.com>
X-Mailer: git-send-email 2.47.0.199.ga7371fff76-goog
Subject: [PATCH v2 3/8] perf header: Refactor get_cpuid to take a CPU for ARM
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
X-CRM114-CacheID: sfid-20241107_082049_231815_6F8BB000 
X-CRM114-Status: GOOD (  18.91  )
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

ARM BIG.little has no notion of a constant CPUID for both core
types. To reflect this reality, change the get_cpuid function to also
pass in a possibly unused logical cpu. If the dummy value (-1) is
passed in then ARM can, as currently happens, select the first logical
CPU's "CPUID". The changes to ARM getcpuid happen in a follow up
change.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/arch/arm64/util/header.c     | 2 +-
 tools/perf/arch/loongarch/util/header.c | 2 +-
 tools/perf/arch/powerpc/util/header.c   | 2 +-
 tools/perf/arch/riscv/util/header.c     | 2 +-
 tools/perf/arch/s390/util/header.c      | 2 +-
 tools/perf/arch/x86/util/auxtrace.c     | 3 ++-
 tools/perf/arch/x86/util/header.c       | 2 +-
 tools/perf/builtin-kvm.c                | 4 +++-
 tools/perf/util/env.c                   | 3 ++-
 tools/perf/util/header.c                | 9 +++++----
 tools/perf/util/header.h                | 2 +-
 11 files changed, 19 insertions(+), 14 deletions(-)

diff --git a/tools/perf/arch/arm64/util/header.c b/tools/perf/arch/arm64/util/header.c
index 741df3614a09..760c21784713 100644
--- a/tools/perf/arch/arm64/util/header.c
+++ b/tools/perf/arch/arm64/util/header.c
@@ -50,7 +50,7 @@ static int _get_cpuid(char *buf, size_t sz, struct perf_cpu_map *cpus)
 	return ret;
 }
 
-int get_cpuid(char *buf, size_t sz)
+int get_cpuid(char *buf, size_t sz, struct perf_cpu cpu __maybe_unused)
 {
 	struct perf_cpu_map *cpus = perf_cpu_map__new_online_cpus();
 	int ret;
diff --git a/tools/perf/arch/loongarch/util/header.c b/tools/perf/arch/loongarch/util/header.c
index d962dff55512..f1f0b116962d 100644
--- a/tools/perf/arch/loongarch/util/header.c
+++ b/tools/perf/arch/loongarch/util/header.c
@@ -70,7 +70,7 @@ static char *_get_cpuid(void)
 	return cpuid;
 }
 
-int get_cpuid(char *buffer, size_t sz)
+int get_cpuid(char *buffer, size_t sz, struct perf_cpu cpu __maybe_unused)
 {
 	int ret = 0;
 	char *cpuid = _get_cpuid();
diff --git a/tools/perf/arch/powerpc/util/header.c b/tools/perf/arch/powerpc/util/header.c
index 251cdbf58a4d..6d1a63a2922f 100644
--- a/tools/perf/arch/powerpc/util/header.c
+++ b/tools/perf/arch/powerpc/util/header.c
@@ -24,7 +24,7 @@ static bool is_compat_mode(void)
 }
 
 int
-get_cpuid(char *buffer, size_t sz)
+get_cpuid(char *buffer, size_t sz, struct perf_cpu cpu __maybe_unused)
 {
 	unsigned long pvr;
 	int nb;
diff --git a/tools/perf/arch/riscv/util/header.c b/tools/perf/arch/riscv/util/header.c
index 1b29030021ee..ebac294c877f 100644
--- a/tools/perf/arch/riscv/util/header.c
+++ b/tools/perf/arch/riscv/util/header.c
@@ -81,7 +81,7 @@ static char *_get_cpuid(void)
 	return cpuid;
 }
 
-int get_cpuid(char *buffer, size_t sz)
+int get_cpuid(char *buffer, size_t sz, struct perf_cpu cpu __maybe_unused)
 {
 	char *cpuid = _get_cpuid();
 	int ret = 0;
diff --git a/tools/perf/arch/s390/util/header.c b/tools/perf/arch/s390/util/header.c
index 7933f6871c81..2add1a561242 100644
--- a/tools/perf/arch/s390/util/header.c
+++ b/tools/perf/arch/s390/util/header.c
@@ -27,7 +27,7 @@
 #define SYSINFO		"/proc/sysinfo"
 #define SRVLVL		"/proc/service_levels"
 
-int get_cpuid(char *buffer, size_t sz)
+int get_cpuid(char *buffer, size_t sz, struct perf_cpu cpu __maybe_unused)
 {
 	char *cp, *line = NULL, *line2;
 	char type[8], model[33], version[8], manufacturer[32], authorization[8];
diff --git a/tools/perf/arch/x86/util/auxtrace.c b/tools/perf/arch/x86/util/auxtrace.c
index 354780ff1605..ecbf61a7eb3a 100644
--- a/tools/perf/arch/x86/util/auxtrace.c
+++ b/tools/perf/arch/x86/util/auxtrace.c
@@ -55,11 +55,12 @@ struct auxtrace_record *auxtrace_record__init(struct evlist *evlist,
 					      int *err)
 {
 	char buffer[64];
+	struct perf_cpu cpu = perf_cpu_map__min(evlist->core.all_cpus);
 	int ret;
 
 	*err = 0;
 
-	ret = get_cpuid(buffer, sizeof(buffer));
+	ret = get_cpuid(buffer, sizeof(buffer), cpu);
 	if (ret) {
 		*err = ret;
 		return NULL;
diff --git a/tools/perf/arch/x86/util/header.c b/tools/perf/arch/x86/util/header.c
index a51444a77a5f..690f86cbbb1c 100644
--- a/tools/perf/arch/x86/util/header.c
+++ b/tools/perf/arch/x86/util/header.c
@@ -58,7 +58,7 @@ __get_cpuid(char *buffer, size_t sz, const char *fmt)
 }
 
 int
-get_cpuid(char *buffer, size_t sz)
+get_cpuid(char *buffer, size_t sz, struct perf_cpu cpu __maybe_unused)
 {
 	return __get_cpuid(buffer, sz, "%s,%u,%u,%u$");
 }
diff --git a/tools/perf/builtin-kvm.c b/tools/perf/builtin-kvm.c
index 099ce3ebf67c..274568d712d1 100644
--- a/tools/perf/builtin-kvm.c
+++ b/tools/perf/builtin-kvm.c
@@ -1226,7 +1226,9 @@ static int cpu_isa_config(struct perf_kvm_stat *kvm)
 	int err;
 
 	if (kvm->live) {
-		err = get_cpuid(buf, sizeof(buf));
+		struct perf_cpu cpu = {-1};
+
+		err = get_cpuid(buf, sizeof(buf), cpu);
 		if (err != 0) {
 			pr_err("Failed to look up CPU type: %s\n",
 			       str_error_r(err, buf, sizeof(buf)));
diff --git a/tools/perf/util/env.c b/tools/perf/util/env.c
index ccb464026642..93cabdd7ff43 100644
--- a/tools/perf/util/env.c
+++ b/tools/perf/util/env.c
@@ -373,7 +373,8 @@ int perf_env__read_pmu_mappings(struct perf_env *env)
 int perf_env__read_cpuid(struct perf_env *env)
 {
 	char cpuid[128];
-	int err = get_cpuid(cpuid, sizeof(cpuid));
+	struct perf_cpu cpu = {-1};
+	int err = get_cpuid(cpuid, sizeof(cpuid), cpu);
 
 	if (err)
 		return err;
diff --git a/tools/perf/util/header.c b/tools/perf/util/header.c
index 55c28e4377ec..60b42ddc3dac 100644
--- a/tools/perf/util/header.c
+++ b/tools/perf/util/header.c
@@ -856,18 +856,19 @@ int __weak strcmp_cpuid_str(const char *mapcpuid, const char *cpuid)
  * default get_cpuid(): nothing gets recorded
  * actual implementation must be in arch/$(SRCARCH)/util/header.c
  */
-int __weak get_cpuid(char *buffer __maybe_unused, size_t sz __maybe_unused)
+int __weak get_cpuid(char *buffer __maybe_unused, size_t sz __maybe_unused,
+		     struct perf_cpu cpu __maybe_unused)
 {
 	return ENOSYS; /* Not implemented */
 }
 
-static int write_cpuid(struct feat_fd *ff,
-		       struct evlist *evlist __maybe_unused)
+static int write_cpuid(struct feat_fd *ff, struct evlist *evlist)
 {
+	struct perf_cpu cpu = perf_cpu_map__min(evlist->core.all_cpus);
 	char buffer[64];
 	int ret;
 
-	ret = get_cpuid(buffer, sizeof(buffer));
+	ret = get_cpuid(buffer, sizeof(buffer), cpu);
 	if (ret)
 		return -1;
 
diff --git a/tools/perf/util/header.h b/tools/perf/util/header.h
index e91e89d22537..b77f89de12dd 100644
--- a/tools/perf/util/header.h
+++ b/tools/perf/util/header.h
@@ -201,7 +201,7 @@ int build_caches_for_cpu(u32 cpu, struct cpu_cache_level caches[], u32 *cntp);
 /*
  * arch specific callback
  */
-int get_cpuid(char *buffer, size_t sz);
+int get_cpuid(char *buffer, size_t sz, struct perf_cpu cpu);
 
 char *get_cpuid_str(struct perf_pmu *pmu __maybe_unused);
 int strcmp_cpuid_str(const char *s1, const char *s2);
-- 
2.47.0.199.ga7371fff76-goog


