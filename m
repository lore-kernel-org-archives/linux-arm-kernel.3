Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2253CE88D87
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  4 Apr 2026 05:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g924aB07abUjt2qM0inH+SjTzydsVlP57tK6YtzR+iU=; b=Dj9i9SL8jDall22xj/74ru22BE
	RXShhdUXkwOFMBNi/StAl/O0JXW25czJOPyvSPWSFQGvXlZ0eZ8HwTxIBSshkr7/APED0EOuVlgK8
	XEm34YO4wHQMljW6HeWqAkPX07VCHYbpigeHGKEJPuxAG0vW9GfJvBOzgnXtaVZV3Bn/97ncZE8MV
	cqEg0vPDij/JOo647c80BUaICnMAAFFzq/jo/k7UBni88ih9mKaIcuHmQu7CvF8hQsGMozLpasoiX
	B7ms+UQ+0km0Hz8JFEbKaGIBIGkUVVVLWwDFpLVhaqLkaSm2EEJWP0K3Po2oWaGaheDe3kvIfk1+b
	ngeqpzbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8tkb-00000003ACF-2lW0;
	Sat, 04 Apr 2026 05:40:53 +0000
Received: from mail-dy1-x1349.google.com ([2607:f8b0:4864:20::1349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8tkX-00000003A9v-3QqB
	for linux-arm-kernel@lists.infradead.org;
	Sat, 04 Apr 2026 05:40:51 +0000
Received: by mail-dy1-x1349.google.com with SMTP id 5a478bee46e88-2c0f6593ef5so3128070eec.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Apr 2026 22:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775281248; x=1775886048; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=g924aB07abUjt2qM0inH+SjTzydsVlP57tK6YtzR+iU=;
        b=Y/l7q5IskpuOQrpTaM1oA63uOPoLgumaGOdERQ0Wf0+u81ZKzPK/Vif75TFDRGuO9G
         18GlCaKu8TemqEgUPHycHk56gp46R64TEX1r8/6LKwLtBsPjtMlGTlGCf3uhglV2/SwM
         jLJdXYYFXRThbsioxF4ybGS8okayO4mY4/SvCODlwxb5b5RD4oMlstjj6jvy/WtmYpaf
         5smigV3KbtSZy7mrcDUWqvQJ+2P1EW5GEOlnrA68C9s9A1G7bVdooweew8QcNXPfzTG7
         xJ1NChuaTEDmbBkSPokOJHQdpqp0zgJSxHVmd3Aw8tJMFHdyxmw7tF2mWAxpVTp71LKi
         KV3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775281248; x=1775886048;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g924aB07abUjt2qM0inH+SjTzydsVlP57tK6YtzR+iU=;
        b=Ca1nb5gWtLWRURrS3IfEamIIGR3CnaQNRjMghp6HcrqDxHzd4d1k5J5OM9CBvMonud
         DAXpGZj3T8AaMXVxkg35luKZpWyvnCbJCxqNM/tY0twKq2HlEX2LGFMDOIf8G3Nvp9Ea
         TVlbRokwHUQQ/qt25eDZ8yGrlEyH7WnrRqIr0T8ZLIGijt40aflnDgWZsQ6B+41XNPA5
         o62+tZp1GjFk/m1gtz8uXez2h60tCx67Ga/GYgFgsxjj5IR2IiPF3VB0gQhTkPP2KPIu
         FPRQQfI1KAhmSpx+8YZjq1iZLLLU/QXmCj0Kac/VZAoT9EjdfDf0C+8Opnfwxr9RcH1H
         +ecA==
X-Forwarded-Encrypted: i=1; AJvYcCVVJjAC4XT6vhYV3zz4E91dh5tmHD/rBVPwJXs7Bta/RQ8NN1Z2i02KxqOrEueFA1SuNt5NhV9zN8ezXfTIEh3O@lists.infradead.org
X-Gm-Message-State: AOJu0YwNvD8ejHBVY1tpawcrK/iMI3ATUwiWhhqHjyE+o7+8dRgtmadT
	dixnje98yyT7NedBX099yvblK36y0y2NVz6EZgVDeME8vAVOa7y2AVAU29HfOfG1awyYgFq5OSj
	v9MvW4O+zlA==
X-Received: from dyff26.prod.google.com ([2002:a05:693c:805a:b0:2c3:cfb2:1036])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:a287:b0:2be:d6e:6ba3
 with SMTP id 5a478bee46e88-2cbfc764f36mr2574888eec.24.1775281248135; Fri, 03
 Apr 2026 22:40:48 -0700 (PDT)
Date: Fri,  3 Apr 2026 22:40:25 -0700
In-Reply-To: <20260404054032.1538095-1-irogers@google.com>
Mime-Version: 1.0
References: <20260305221927.3237145-1-irogers@google.com> <20260404054032.1538095-1-irogers@google.com>
X-Mailer: git-send-email 2.53.0.1213.gd9a14994de-goog
Message-ID: <20260404054032.1538095-2-irogers@google.com>
Subject: [PATCH v3 1/8] perf unwind: Refactor get_entries to allow dynamic
 libdw/libunwind selection
From: Ian Rogers <irogers@google.com>
To: acme@kernel.org
Cc: irogers@google.com, 9erthalion6@gmail.com, adrian.hunter@intel.com, 
	alex@ghiti.fr, alexander.shishkin@linux.intel.com, 
	andrew.jones@oss.qualcomm.com, aou@eecs.berkeley.edu, atrajeev@linux.ibm.com, 
	blakejones@google.com, ctshao@google.com, dapeng1.mi@linux.intel.com, 
	howardchu95@gmail.com, james.clark@linaro.org, john.g.garry@oracle.com, 
	jolsa@kernel.org, leo.yan@linux.dev, libunwind-devel@nongnu.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org, 
	mingo@redhat.com, namhyung@kernel.org, palmer@dabbelt.com, 
	peterz@infradead.org, pjw@kernel.org, shimin.guo@skydio.com, 
	tglozar@redhat.com, tmricht@linux.ibm.com, will@kernel.org, yuzhuo@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_224049_864268_C4039A1A 
X-CRM114-Status: GOOD (  27.41  )
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

Currently, both libdw and libunwind define 'unwind__get_entries'. This
causes a duplicate symbol build failure when both are compiled into
perf.

This commit refactors the DWARF unwind post-processing to be
configurable at runtime via the .perfconfig file option
'unwind.style', or using the argument '--unwind-style' in the commands
'perf report', 'perf script' and 'perf inject', in a similar manner to
the addr2line or the disassembler style.

The file 'tools/perf/util/unwind.c' adds the top-level dispatch
function 'unwind__get_entries'. The backend implementations are
renamed to 'libdw__get_entries' and 'libunwind__get_entries'. Both are
attempted as fallbacks if not configured, or if the primary backend
fails.

Fixes: 2e9191573a69 ("perf build: Remove NO_LIBDW_DWARF_UNWIND option")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/builtin-inject.c        |  4 ++
 tools/perf/builtin-report.c        |  4 ++
 tools/perf/builtin-script.c        |  4 ++
 tools/perf/util/Build              |  1 +
 tools/perf/util/symbol_conf.h      | 10 +++
 tools/perf/util/unwind-libdw.c     |  2 +-
 tools/perf/util/unwind-libunwind.c |  2 +-
 tools/perf/util/unwind.c           | 98 ++++++++++++++++++++++++++++++
 tools/perf/util/unwind.h           | 63 ++++++++++++-------
 9 files changed, 163 insertions(+), 25 deletions(-)
 create mode 100644 tools/perf/util/unwind.c

diff --git a/tools/perf/builtin-inject.c b/tools/perf/builtin-inject.c
index 5b29f4296861..9ad681b3c0dc 100644
--- a/tools/perf/builtin-inject.c
+++ b/tools/perf/builtin-inject.c
@@ -26,6 +26,7 @@
 #include "util/synthetic-events.h"
 #include "util/thread.h"
 #include "util/namespaces.h"
+#include "util/unwind.h"
 #include "util/util.h"
 #include "util/tsc.h"
 
@@ -2539,6 +2540,9 @@ int cmd_inject(int argc, const char **argv)
 		OPT_STRING(0, "guestmount", &symbol_conf.guestmount, "directory",
 			   "guest mount directory under which every guest os"
 			   " instance has a subdir"),
+		OPT_CALLBACK(0, "unwind-style", NULL, "unwind style",
+			     "unwind styles (libdw,libunwind)",
+			     unwind__option),
 		OPT_BOOLEAN(0, "convert-callchain", &inject.convert_callchain,
 			    "Generate callchains using DWARF and drop register/stack data"),
 		OPT_END()
diff --git a/tools/perf/builtin-report.c b/tools/perf/builtin-report.c
index 95c0bdba6b11..0b0966d94128 100644
--- a/tools/perf/builtin-report.c
+++ b/tools/perf/builtin-report.c
@@ -48,6 +48,7 @@
 #include "util/time-utils.h"
 #include "util/auxtrace.h"
 #include "util/units.h"
+#include "util/unwind.h"
 #include "util/util.h" // perf_tip()
 #include "ui/ui.h"
 #include "ui/progress.h"
@@ -1449,6 +1450,9 @@ int cmd_report(int argc, const char **argv)
 	OPT_CALLBACK(0, "addr2line-style", NULL, "addr2line style",
 		     "addr2line styles (libdw,llvm,libbfd,addr2line)",
 		     report_parse_addr2line_config),
+	OPT_CALLBACK(0, "unwind-style", NULL, "unwind style",
+		     "unwind styles (libdw,libunwind)",
+		     unwind__option),
 	OPT_BOOLEAN(0, "demangle", &symbol_conf.demangle,
 		    "Symbol demangling. Enabled by default, use --no-demangle to disable."),
 	OPT_BOOLEAN(0, "demangle-kernel", &symbol_conf.demangle_kernel,
diff --git a/tools/perf/builtin-script.c b/tools/perf/builtin-script.c
index 622130d3aed4..ee6131315f96 100644
--- a/tools/perf/builtin-script.c
+++ b/tools/perf/builtin-script.c
@@ -63,6 +63,7 @@
 #include <linux/err.h>
 #include "util/dlfilter.h"
 #include "util/record.h"
+#include "util/unwind.h"
 #include "util/util.h"
 #include "util/cgroup.h"
 #include "util/annotate.h"
@@ -4155,6 +4156,9 @@ int cmd_script(int argc, const char **argv)
 			"Enable symbol demangling"),
 	OPT_BOOLEAN(0, "demangle-kernel", &symbol_conf.demangle_kernel,
 			"Enable kernel symbol demangling"),
+	OPT_CALLBACK(0, "unwind-style", NULL, "unwind style",
+		     "unwind styles (libdw,libunwind)",
+		     unwind__option),
 	OPT_STRING(0, "addr2line", &symbol_conf.addr2line_path, "path",
 			"addr2line binary to use for line numbers"),
 	OPT_STRING(0, "time", &script.time_str, "str",
diff --git a/tools/perf/util/Build b/tools/perf/util/Build
index 70cc91d00804..01edfccebb88 100644
--- a/tools/perf/util/Build
+++ b/tools/perf/util/Build
@@ -216,6 +216,7 @@ ifndef CONFIG_SETNS
 perf-util-y += setns.o
 endif
 
+perf-util-y += unwind.o
 perf-util-$(CONFIG_LIBDW) += probe-finder.o
 perf-util-$(CONFIG_LIBDW) += dwarf-aux.o
 perf-util-$(CONFIG_LIBDW) += dwarf-regs.o
diff --git a/tools/perf/util/symbol_conf.h b/tools/perf/util/symbol_conf.h
index ac1b444a8fd8..004c472cdfb1 100644
--- a/tools/perf/util/symbol_conf.h
+++ b/tools/perf/util/symbol_conf.h
@@ -9,6 +9,15 @@
 struct strlist;
 struct intlist;
 
+enum unwind_style {
+	UNWIND_STYLE_UNKNOWN = 0,
+	UNWIND_STYLE_LIBDW,
+	UNWIND_STYLE_LIBUNWIND,
+};
+
+#define MAX_UNWIND_STYLE (UNWIND_STYLE_LIBUNWIND + 1)
+
+
 enum a2l_style {
 	A2L_STYLE_UNKNOWN = 0,
 	A2L_STYLE_LIBDW,
@@ -80,6 +89,7 @@ struct symbol_conf {
 			*bt_stop_list_str;
 	const char		*addr2line_path;
 	enum a2l_style	addr2line_style[MAX_A2L_STYLE];
+	enum unwind_style unwind_style[MAX_UNWIND_STYLE];
 	unsigned long	time_quantum;
        struct strlist	*dso_list,
 			*comm_list,
diff --git a/tools/perf/util/unwind-libdw.c b/tools/perf/util/unwind-libdw.c
index 05e8e68bd49c..d8a5b7d54192 100644
--- a/tools/perf/util/unwind-libdw.c
+++ b/tools/perf/util/unwind-libdw.c
@@ -339,7 +339,7 @@ frame_callback(Dwfl_Frame *state, void *arg)
 	       DWARF_CB_ABORT : DWARF_CB_OK;
 }
 
-int unwind__get_entries(unwind_entry_cb_t cb, void *arg,
+int libdw__get_entries(unwind_entry_cb_t cb, void *arg,
 			struct thread *thread,
 			struct perf_sample *data,
 			int max_stack,
diff --git a/tools/perf/util/unwind-libunwind.c b/tools/perf/util/unwind-libunwind.c
index cb8be6acfb6f..a0016b897dae 100644
--- a/tools/perf/util/unwind-libunwind.c
+++ b/tools/perf/util/unwind-libunwind.c
@@ -79,7 +79,7 @@ void unwind__finish_access(struct maps *maps)
 		ops->finish_access(maps);
 }
 
-int unwind__get_entries(unwind_entry_cb_t cb, void *arg,
+int libunwind__get_entries(unwind_entry_cb_t cb, void *arg,
 			 struct thread *thread,
 			 struct perf_sample *data, int max_stack,
 			 bool best_effort)
diff --git a/tools/perf/util/unwind.c b/tools/perf/util/unwind.c
new file mode 100644
index 000000000000..86c2d1692d08
--- /dev/null
+++ b/tools/perf/util/unwind.c
@@ -0,0 +1,98 @@
+// SPDX-License-Identifier: GPL-2.0
+#include "debug.h"
+#include "symbol_conf.h"
+#include "unwind.h"
+#include <linux/string.h>
+#include <string.h>
+#include <stdlib.h>
+
+int unwind__get_entries(unwind_entry_cb_t cb __maybe_unused, void *arg __maybe_unused,
+			struct thread *thread __maybe_unused,
+			struct perf_sample *data __maybe_unused,
+			int max_stack __maybe_unused,
+			bool best_effort __maybe_unused)
+{
+	int ret = 0;
+
+#if defined(HAVE_LIBDW_SUPPORT) || defined(HAVE_LIBUNWIND_SUPPORT)
+	if (symbol_conf.unwind_style[0] == UNWIND_STYLE_UNKNOWN) {
+		int i = 0;
+#ifdef HAVE_LIBDW_SUPPORT
+		symbol_conf.unwind_style[i++] = UNWIND_STYLE_LIBDW;
+#endif
+#ifdef HAVE_LIBUNWIND_SUPPORT
+		symbol_conf.unwind_style[i++] = UNWIND_STYLE_LIBUNWIND;
+#endif
+	}
+#endif //defined(HAVE_LIBDW_SUPPORT) || defined(HAVE_LIBUNWIND_SUPPORT)
+
+	for (size_t i = 0; i < ARRAY_SIZE(symbol_conf.unwind_style); i++) {
+		switch (symbol_conf.unwind_style[i]) {
+		case UNWIND_STYLE_LIBDW:
+			ret = libdw__get_entries(cb, arg, thread, data, max_stack, best_effort);
+			break;
+		case UNWIND_STYLE_LIBUNWIND:
+			ret = libunwind__get_entries(cb, arg, thread, data, max_stack, best_effort);
+			break;
+		case UNWIND_STYLE_UNKNOWN:
+		default:
+#if !defined(HAVE_LIBDW_SUPPORT) && !defined(HAVE_LIBUNWIND_SUPPORT)
+			pr_warning_once(
+				"Error: dwarf unwinding not supported, build perf with libdw or libunwind.\n");
+#endif
+			ret = -1;
+			break;
+		}
+		if (ret == 0)
+			break;
+	}
+	return ret;
+}
+
+int unwind__configure(const char *var, const char *value, void *cb __maybe_unused)
+{
+	static const char * const unwind_style_names[] = {
+		[UNWIND_STYLE_LIBDW] = "libdw",
+		[UNWIND_STYLE_LIBUNWIND] = "libunwind",
+		NULL
+	};
+	char *s, *p, *saveptr;
+	size_t i = 0;
+
+	if (strcmp(var, "unwind.style"))
+		return 0;
+
+	if (!value)
+		return -1;
+
+	s = strdup(value);
+	if (!s)
+		return -1;
+
+	p = strtok_r(s, ",", &saveptr);
+	while (p && i < ARRAY_SIZE(symbol_conf.unwind_style)) {
+		bool found = false;
+		char *q = strim(p);
+
+		for (size_t j = UNWIND_STYLE_LIBDW; j < MAX_UNWIND_STYLE; j++) {
+			if (!strcasecmp(q, unwind_style_names[j])) {
+				symbol_conf.unwind_style[i++] = j;
+				found = true;
+				break;
+			}
+		}
+		if (!found)
+			pr_warning("Unknown unwind style: %s\n", q);
+		p = strtok_r(NULL, ",", &saveptr);
+	}
+
+	free(s);
+	return 0;
+}
+
+int unwind__option(const struct option *opt __maybe_unused,
+		   const char *arg,
+		   int unset __maybe_unused)
+{
+	return unwind__configure("unwind.style", arg, NULL);
+}
diff --git a/tools/perf/util/unwind.h b/tools/perf/util/unwind.h
index 9f7164c6d9aa..ac0776e39f84 100644
--- a/tools/perf/util/unwind.h
+++ b/tools/perf/util/unwind.h
@@ -4,9 +4,10 @@
 
 #include <linux/compiler.h>
 #include <linux/types.h>
-#include "util/map_symbol.h"
+#include "map_symbol.h"
 
 struct maps;
+struct option;
 struct perf_sample;
 struct thread;
 
@@ -26,7 +27,9 @@ struct unwind_libunwind_ops {
 			   struct perf_sample *data, int max_stack, bool best_effort);
 };
 
-#ifdef HAVE_DWARF_UNWIND_SUPPORT
+int unwind__configure(const char *var, const char *value, void *cb);
+int unwind__option(const struct option *opt, const char *arg, int unset);
+
 /*
  * When best_effort is set, don't report errors and fail silently. This could
  * be expanded in the future to be more permissive about things other than
@@ -36,8 +39,31 @@ int unwind__get_entries(unwind_entry_cb_t cb, void *arg,
 			struct thread *thread,
 			struct perf_sample *data, int max_stack,
 			bool best_effort);
-/* libunwind specific */
+
+#ifdef HAVE_LIBDW_SUPPORT
+int libdw__get_entries(unwind_entry_cb_t cb, void *arg,
+		       struct thread *thread,
+		       struct perf_sample *data, int max_stack,
+		       bool best_effort);
+#else
+#include "debug.h"
+static inline int libdw__get_entries(unwind_entry_cb_t cb __maybe_unused, void *arg __maybe_unused,
+				     struct thread *thread __maybe_unused,
+				     struct perf_sample *data __maybe_unused,
+				     int max_stack __maybe_unused,
+				     bool best_effort __maybe_unused)
+{
+	pr_err("Error: libdw dwarf unwinding not built into perf\n");
+	return -1;
+}
+#endif
+
 #ifdef HAVE_LIBUNWIND_SUPPORT
+/* libunwind specific */
+int libunwind__get_entries(unwind_entry_cb_t cb, void *arg,
+			   struct thread *thread,
+			   struct perf_sample *data, int max_stack,
+			   bool best_effort);
 #ifndef LIBUNWIND__ARCH_REG_ID
 #define LIBUNWIND__ARCH_REG_ID(regnum) libunwind__arch_reg_id(regnum)
 #endif
@@ -47,26 +73,16 @@ int unwind__prepare_access(struct maps *maps, struct map *map, bool *initialized
 void unwind__flush_access(struct maps *maps);
 void unwind__finish_access(struct maps *maps);
 #else
-static inline int unwind__prepare_access(struct maps *maps __maybe_unused,
-					 struct map *map __maybe_unused,
-					 bool *initialized __maybe_unused)
-{
-	return 0;
-}
-
-static inline void unwind__flush_access(struct maps *maps __maybe_unused) {}
-static inline void unwind__finish_access(struct maps *maps __maybe_unused) {}
-#endif
-#else
-static inline int
-unwind__get_entries(unwind_entry_cb_t cb __maybe_unused,
-		    void *arg __maybe_unused,
-		    struct thread *thread __maybe_unused,
-		    struct perf_sample *data __maybe_unused,
-		    int max_stack __maybe_unused,
-		    bool best_effort __maybe_unused)
+#include "debug.h"
+static inline int libunwind__get_entries(unwind_entry_cb_t cb __maybe_unused,
+					 void *arg __maybe_unused,
+					 struct thread *thread __maybe_unused,
+					 struct perf_sample *data __maybe_unused,
+					 int max_stack __maybe_unused,
+					 bool best_effort __maybe_unused)
 {
-	return 0;
+	pr_err("Error: libunwind dwarf unwinding not built into perf\n");
+	return -1;
 }
 
 static inline int unwind__prepare_access(struct maps *maps __maybe_unused,
@@ -78,5 +94,6 @@ static inline int unwind__prepare_access(struct maps *maps __maybe_unused,
 
 static inline void unwind__flush_access(struct maps *maps __maybe_unused) {}
 static inline void unwind__finish_access(struct maps *maps __maybe_unused) {}
-#endif /* HAVE_DWARF_UNWIND_SUPPORT */
+#endif
+
 #endif /* __UNWIND_H */
-- 
2.53.0.1213.gd9a14994de-goog


