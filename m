Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22719D6409C
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 Nov 2024 01:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:From:Subject
	:References:Mime-Version:Message-Id:In-Reply-To:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z84ih0aAhoAaq8vjhXS3ZyaKllov6tqU3A8Z8fQMmCg=; b=bC04Yq+150O2IxbLHpjnCBjMVD
	EaM53SmRUzc2tnC6UAjuChhP0tAokVVBto60Ah5BzK9SX9QfTVLiyoTACLYHguXyBNys+XMaiJlaX
	w5qjL12uaH9hIpaeC8iTIhKNXbyaxWvtHMrSkEMrtHMIL6MLjYlOkXVI8t28GX4+qOgJ0bN/J3j+K
	cGWcIYzHR4MOtp/0mJpwZJkcBut0ttJDfvZFegcAdzHR0TIT1soWTRXZNBbz5HvfS2RmD8Nz78wRB
	4LKHwzoImZYBQzHYItMOA4iVimJBbXGCbmj+O+HGkcuQ1Yfh96nXXpCG9Gip3LpXjocO0fEIf4kga
	TMGjKNNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9ZrT-0000000COVH-1jn0;
	Sat, 09 Nov 2024 01:01:59 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9YgB-0000000CExv-3f1r
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 23:46:18 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-6eaa08a6fdbso49350277b3.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 Nov 2024 15:46:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731109575; x=1731714375; darn=lists.infradead.org;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z84ih0aAhoAaq8vjhXS3ZyaKllov6tqU3A8Z8fQMmCg=;
        b=rWRCHv7MrGwOSxnfOfs4Y+Qi5zw4oXvON8XIEXIvPAwEcoPRzWq4qrppxwcxlAhNgS
         BIQkoxJV9TjcNsUL2Md8BqIDyGGCFETtcbhJvmBU4/kOxfc6mK8wuD/4PEmNDC3u+buB
         O46PQjXcRU7nPScaUXuay4aaMNQ4XGdTPBDj3h5GBE9TMAfpk0vEaRq0ck7rfsV0hKa2
         ESuWXrcSUnbpEFfEq+B3O+droBYAGTc8UzFKkowU8J+A0s0Yb7dIvnRShSmG1+m6Kj8n
         hnGIXd3nRE2VxN4CTD2DbD877Y9erMjyiA7MsmPxUykVLnS91Itw4stM8mYjvcwIWOY1
         XDVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731109575; x=1731714375;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z84ih0aAhoAaq8vjhXS3ZyaKllov6tqU3A8Z8fQMmCg=;
        b=oTTE9QcQmWoDmBmJqL8jGmgy1h7DZ/TyhnAAP9taU/JonQRCHoFJ4hm2ywS2RjgIJx
         wPKSv9KRvr77JoUTai3uAxJvE6m7SOOBGb7cFgv0d5alT3KGPtYs4+jdlrVRa5D0EuN1
         77JHfeE0POpA1lwDwGBGNyA+QheXsWxPxFCSfwIDA6K+syLyODMVxQQYNmAdqWwwyZno
         LgNVbBUo2z4oaCyn47I9PoLbrpwufFY71RcOJ/gdfByVK9vHoZrzKN/Rh90IUJ6XLWms
         xA10e5ERiNKpXZhyY36XXqEukBpaKyzlvUcVj3QZ8ecTOJmQZ9/xIUIzbpUxksPrsAUa
         TXkw==
X-Forwarded-Encrypted: i=1; AJvYcCWawXOx41AGY4kZQ/pGu5MeCFbVC0pnLifVtsEZH7wzcYGIXteZhUBSEvKxOg8RL+YosKJvC1D6ne6BXYER3WpB@lists.infradead.org
X-Gm-Message-State: AOJu0YyHYFy6U/XN27zxaTdASS+fHktbLa3d+OSNBZPAPNXhZZgk2qY9
	t8QoS7An8iAijHV2ieol9gFysInZ/t7VscOiFrAD4oLmdC4w4sAdWXMYh4P1tVopMXdrt3tZHLH
	3PG9+QA==
X-Google-Smtp-Source: AGHT+IHlsPt9pYdIG9jBIDnVKpaRoXyMLhPpV+57NhKoeUO2LAvW3yR62yJnDvVXGEniZiSDdAKKuOaW9cbs
X-Received: from irogers.svl.corp.google.com ([2620:15c:2c5:11:6fd2:1e36:6d8c:7c49])
 (user=irogers job=sendgmr) by 2002:a05:690c:620a:b0:6ea:e559:d69c with SMTP
 id 00721157ae682-6eae559d710mr163197b3.5.1731109574732; Fri, 08 Nov 2024
 15:46:14 -0800 (PST)
Date: Fri,  8 Nov 2024 15:45:47 -0800
In-Reply-To: <20241108234606.429459-1-irogers@google.com>
Message-Id: <20241108234606.429459-3-irogers@google.com>
Mime-Version: 1.0
References: <20241108234606.429459-1-irogers@google.com>
X-Mailer: git-send-email 2.47.0.277.g8800431eea-goog
Subject: [PATCH v4 02/20] perf dwarf-regs: Remove PERF_HAVE_ARCH_REGS_QUERY_REGISTER_OFFSET
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, John Garry <john.g.garry@oracle.com>, 
	Will Deacon <will@kernel.org>, James Clark <james.clark@linaro.org>, 
	Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>, Guo Ren <guoren@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Nick Terrell <terrelln@fb.com>, 
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>, Changbin Du <changbin.du@huawei.com>, 
	Guilherme Amadio <amadio@gentoo.org>, Yang Jihong <yangjihong@bytedance.com>, 
	Aditya Gupta <adityag@linux.ibm.com>, Athira Rajeev <atrajeev@linux.vnet.ibm.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Kajol Jain <kjain@linux.ibm.com>, 
	Atish Patra <atishp@rivosinc.com>, Shenlin Liang <liangshenlin@eswincomputing.com>, 
	Anup Patel <anup@brainfault.org>, Oliver Upton <oliver.upton@linux.dev>, 
	"Steinar H. Gunderson" <sesse@google.com>, "Dr. David Alan Gilbert" <linux@treblig.org>, 
	Chen Pei <cp0613@linux.alibaba.com>, Dima Kogan <dima@secretsauce.net>, 
	Przemek Kitszel <przemyslaw.kitszel@intel.com>, "David S. Miller" <davem@davemloft.net>, 
	Alexander Lobakin <aleksander.lobakin@intel.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_154615_999792_634C59A9 
X-CRM114-Status: GOOD (  20.92  )
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

PERF_HAVE_ARCH_REGS_QUERY_REGISTER_OFFSET was used for BPF prologue
support which was removed in Commit 3d6dfae88917 ("perf parse-events:
Remove BPF event support"). The code is no longer used so remove.

Remove the offset from various dwarf-regs.c tables and the dependence
on ptrace.h. Rename structs starting pt_ as the ptrace derived offset is
now removed.

Reviewed-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/Makefile.config                  |   4 -
 tools/perf/arch/arm64/Makefile              |   1 -
 tools/perf/arch/arm64/util/dwarf-regs.c     |  20 +---
 tools/perf/arch/loongarch/Makefile          |   1 -
 tools/perf/arch/loongarch/util/dwarf-regs.c |  10 --
 tools/perf/arch/powerpc/Makefile            |   1 -
 tools/perf/arch/powerpc/util/dwarf-regs.c   |  26 ++---
 tools/perf/arch/riscv/Makefile              |   1 -
 tools/perf/arch/riscv/util/dwarf-regs.c     |  14 +--
 tools/perf/arch/s390/Makefile               |   1 -
 tools/perf/arch/s390/util/dwarf-regs.c      |  27 -----
 tools/perf/arch/x86/Makefile                |   1 -
 tools/perf/arch/x86/util/dwarf-regs.c       | 109 +++-----------------
 tools/perf/util/include/dwarf-regs.h        |   8 --
 14 files changed, 27 insertions(+), 197 deletions(-)

diff --git a/tools/perf/Makefile.config b/tools/perf/Makefile.config
index 80bf06e828f0..52a216df9e2a 100644
--- a/tools/perf/Makefile.config
+++ b/tools/perf/Makefile.config
@@ -211,10 +211,6 @@ FEATURE_CHECK_CFLAGS-bpf = -I. -I$(srctree)/tools/include -I$(srctree)/tools/arc
 # include ARCH specific config
 -include $(src-perf)/arch/$(SRCARCH)/Makefile
 
-ifdef PERF_HAVE_ARCH_REGS_QUERY_REGISTER_OFFSET
-  CFLAGS += -DHAVE_ARCH_REGS_QUERY_REGISTER_OFFSET
-endif
-
 include $(srctree)/tools/scripts/utilities.mak
 
 ifeq ($(call get-executable,$(FLEX)),)
diff --git a/tools/perf/arch/arm64/Makefile b/tools/perf/arch/arm64/Makefile
index 8a5ffbfe809f..ca2e35961287 100644
--- a/tools/perf/arch/arm64/Makefile
+++ b/tools/perf/arch/arm64/Makefile
@@ -3,7 +3,6 @@ ifndef NO_LIBDW
 PERF_HAVE_DWARF_REGS := 1
 endif
 PERF_HAVE_JITDUMP := 1
-PERF_HAVE_ARCH_REGS_QUERY_REGISTER_OFFSET := 1
 HAVE_KVM_STAT_SUPPORT := 1
 
 #
diff --git a/tools/perf/arch/arm64/util/dwarf-regs.c b/tools/perf/arch/arm64/util/dwarf-regs.c
index 917b97d7c5d3..343a62fa4199 100644
--- a/tools/perf/arch/arm64/util/dwarf-regs.c
+++ b/tools/perf/arch/arm64/util/dwarf-regs.c
@@ -9,10 +9,9 @@
 #include <stddef.h>
 #include <string.h>
 #include <dwarf-regs.h>
-#include <linux/ptrace.h> /* for struct user_pt_regs */
 #include <linux/stringify.h>
 
-struct pt_regs_dwarfnum {
+struct regs_dwarfnum {
 	const char *name;
 	unsigned int dwarfnum;
 };
@@ -21,14 +20,12 @@ struct pt_regs_dwarfnum {
 #define GPR_DWARFNUM_NAME(num) \
 	{.name = __stringify(%x##num), .dwarfnum = num}
 #define REG_DWARFNUM_END {.name = NULL, .dwarfnum = 0}
-#define DWARFNUM2OFFSET(index) \
-	(index * sizeof((struct user_pt_regs *)0)->regs[0])
 
 /*
  * Reference:
  * http://infocenter.arm.com/help/topic/com.arm.doc.ihi0057b/IHI0057B_aadwarf64.pdf
  */
-static const struct pt_regs_dwarfnum regdwarfnum_table[] = {
+static const struct regs_dwarfnum regdwarfnum_table[] = {
 	GPR_DWARFNUM_NAME(0),
 	GPR_DWARFNUM_NAME(1),
 	GPR_DWARFNUM_NAME(2),
@@ -74,19 +71,10 @@ static const struct pt_regs_dwarfnum regdwarfnum_table[] = {
  */
 const char *get_arch_regstr(unsigned int n)
 {
-	const struct pt_regs_dwarfnum *roff;
+	const struct regs_dwarfnum *roff;
+
 	for (roff = regdwarfnum_table; roff->name != NULL; roff++)
 		if (roff->dwarfnum == n)
 			return roff->name;
 	return NULL;
 }
-
-int regs_query_register_offset(const char *name)
-{
-	const struct pt_regs_dwarfnum *roff;
-
-	for (roff = regdwarfnum_table; roff->name != NULL; roff++)
-		if (!strcmp(roff->name, name))
-			return DWARFNUM2OFFSET(roff->dwarfnum);
-	return -EINVAL;
-}
diff --git a/tools/perf/arch/loongarch/Makefile b/tools/perf/arch/loongarch/Makefile
index 1cc5eb01f32b..79b432744296 100644
--- a/tools/perf/arch/loongarch/Makefile
+++ b/tools/perf/arch/loongarch/Makefile
@@ -2,7 +2,6 @@
 ifndef NO_LIBDW
 PERF_HAVE_DWARF_REGS := 1
 endif
-PERF_HAVE_ARCH_REGS_QUERY_REGISTER_OFFSET := 1
 PERF_HAVE_JITDUMP := 1
 HAVE_KVM_STAT_SUPPORT := 1
 
diff --git a/tools/perf/arch/loongarch/util/dwarf-regs.c b/tools/perf/arch/loongarch/util/dwarf-regs.c
index 0f6ebc387463..bee08fdcf2fd 100644
--- a/tools/perf/arch/loongarch/util/dwarf-regs.c
+++ b/tools/perf/arch/loongarch/util/dwarf-regs.c
@@ -32,13 +32,3 @@ const char *get_arch_regstr(unsigned int n)
 	n %= 32;
 	return loongarch_gpr_table[n].name;
 }
-
-int regs_query_register_offset(const char *name)
-{
-	const struct pt_regs_dwarfnum *roff;
-
-	for (roff = loongarch_gpr_table; roff->name != NULL; roff++)
-		if (!strcmp(roff->name, name))
-			return roff->dwarfnum;
-	return -EINVAL;
-}
diff --git a/tools/perf/arch/powerpc/Makefile b/tools/perf/arch/powerpc/Makefile
index 7672d555f6cd..ae05727835d8 100644
--- a/tools/perf/arch/powerpc/Makefile
+++ b/tools/perf/arch/powerpc/Makefile
@@ -4,7 +4,6 @@ PERF_HAVE_DWARF_REGS := 1
 endif
 
 HAVE_KVM_STAT_SUPPORT := 1
-PERF_HAVE_ARCH_REGS_QUERY_REGISTER_OFFSET := 1
 PERF_HAVE_JITDUMP := 1
 
 #
diff --git a/tools/perf/arch/powerpc/util/dwarf-regs.c b/tools/perf/arch/powerpc/util/dwarf-regs.c
index 104c7ae5c433..23846c59a522 100644
--- a/tools/perf/arch/powerpc/util/dwarf-regs.c
+++ b/tools/perf/arch/powerpc/util/dwarf-regs.c
@@ -9,29 +9,25 @@
 #include <errno.h>
 #include <string.h>
 #include <dwarf-regs.h>
-#include <linux/ptrace.h>
 #include <linux/kernel.h>
 #include <linux/stringify.h>
 
-struct pt_regs_dwarfnum {
+struct regs_dwarfnum {
 	const char *name;
 	unsigned int dwarfnum;
-	unsigned int ptregs_offset;
 };
 
 #define REG_DWARFNUM_NAME(r, num)					\
-		{.name = __stringify(%)__stringify(r), .dwarfnum = num,			\
-		.ptregs_offset = offsetof(struct pt_regs, r)}
+	{.name = __stringify(%)__stringify(r), .dwarfnum = num}
 #define GPR_DWARFNUM_NAME(num)						\
-		{.name = __stringify(%gpr##num), .dwarfnum = num,		\
-		.ptregs_offset = offsetof(struct pt_regs, gpr[num])}
-#define REG_DWARFNUM_END {.name = NULL, .dwarfnum = 0, .ptregs_offset = 0}
+	{.name = __stringify(%gpr##num), .dwarfnum = num}
+#define REG_DWARFNUM_END {.name = NULL, .dwarfnum = 0}
 
 /*
  * Reference:
  * http://refspecs.linuxfoundation.org/ELF/ppc64/PPC-elf64abi-1.9.html
  */
-static const struct pt_regs_dwarfnum regdwarfnum_table[] = {
+static const struct regs_dwarfnum regdwarfnum_table[] = {
 	GPR_DWARFNUM_NAME(0),
 	GPR_DWARFNUM_NAME(1),
 	GPR_DWARFNUM_NAME(2),
@@ -83,22 +79,14 @@ static const struct pt_regs_dwarfnum regdwarfnum_table[] = {
  */
 const char *get_arch_regstr(unsigned int n)
 {
-	const struct pt_regs_dwarfnum *roff;
+	const struct regs_dwarfnum *roff;
+
 	for (roff = regdwarfnum_table; roff->name != NULL; roff++)
 		if (roff->dwarfnum == n)
 			return roff->name;
 	return NULL;
 }
 
-int regs_query_register_offset(const char *name)
-{
-	const struct pt_regs_dwarfnum *roff;
-	for (roff = regdwarfnum_table; roff->name != NULL; roff++)
-		if (!strcmp(roff->name, name))
-			return roff->ptregs_offset;
-	return -EINVAL;
-}
-
 #define PPC_OP(op)	(((op) >> 26) & 0x3F)
 #define PPC_RA(a)	(((a) >> 16) & 0x1f)
 #define PPC_RT(t)	(((t) >> 21) & 0x1f)
diff --git a/tools/perf/arch/riscv/Makefile b/tools/perf/arch/riscv/Makefile
index 00573af87a68..d83e0f32f3a8 100644
--- a/tools/perf/arch/riscv/Makefile
+++ b/tools/perf/arch/riscv/Makefile
@@ -1,7 +1,6 @@
 ifndef NO_LIBDW
 PERF_HAVE_DWARF_REGS := 1
 endif
-PERF_HAVE_ARCH_REGS_QUERY_REGISTER_OFFSET := 1
 PERF_HAVE_JITDUMP := 1
 HAVE_KVM_STAT_SUPPORT := 1
 
diff --git a/tools/perf/arch/riscv/util/dwarf-regs.c b/tools/perf/arch/riscv/util/dwarf-regs.c
index cd0504c02e2e..a9c4402ae57e 100644
--- a/tools/perf/arch/riscv/util/dwarf-regs.c
+++ b/tools/perf/arch/riscv/util/dwarf-regs.c
@@ -9,7 +9,7 @@
 #include <string.h> /* for strcmp */
 #include <dwarf-regs.h>
 
-struct pt_regs_dwarfnum {
+struct regs_dwarfnum {
 	const char *name;
 	unsigned int dwarfnum;
 };
@@ -17,7 +17,7 @@ struct pt_regs_dwarfnum {
 #define REG_DWARFNUM_NAME(r, num) {.name = r, .dwarfnum = num}
 #define REG_DWARFNUM_END {.name = NULL, .dwarfnum = 0}
 
-struct pt_regs_dwarfnum riscv_dwarf_regs_table[] = {
+struct regs_dwarfnum riscv_dwarf_regs_table[] = {
 	REG_DWARFNUM_NAME("%zero", 0),
 	REG_DWARFNUM_NAME("%ra", 1),
 	REG_DWARFNUM_NAME("%sp", 2),
@@ -60,13 +60,3 @@ const char *get_arch_regstr(unsigned int n)
 {
 	return (n < RISCV_MAX_REGS) ? riscv_dwarf_regs_table[n].name : NULL;
 }
-
-int regs_query_register_offset(const char *name)
-{
-	const struct pt_regs_dwarfnum *roff;
-
-	for (roff = riscv_dwarf_regs_table; roff->name; roff++)
-		if (!strcmp(roff->name, name))
-			return roff->dwarfnum;
-	return -EINVAL;
-}
diff --git a/tools/perf/arch/s390/Makefile b/tools/perf/arch/s390/Makefile
index 3f66e2ede3f7..58e79f5b67a4 100644
--- a/tools/perf/arch/s390/Makefile
+++ b/tools/perf/arch/s390/Makefile
@@ -3,7 +3,6 @@ ifndef NO_LIBDW
 PERF_HAVE_DWARF_REGS := 1
 endif
 HAVE_KVM_STAT_SUPPORT := 1
-PERF_HAVE_ARCH_REGS_QUERY_REGISTER_OFFSET := 1
 PERF_HAVE_JITDUMP := 1
 
 #
diff --git a/tools/perf/arch/s390/util/dwarf-regs.c b/tools/perf/arch/s390/util/dwarf-regs.c
index dfddb3099bfa..5bcf3192623a 100644
--- a/tools/perf/arch/s390/util/dwarf-regs.c
+++ b/tools/perf/arch/s390/util/dwarf-regs.c
@@ -7,37 +7,10 @@
  *
  */
 
-#include <errno.h>
-#include <stddef.h>
-#include <stdlib.h>
 #include <linux/kernel.h>
-#include <asm/ptrace.h>
-#include <string.h>
-#include <dwarf-regs.h>
 #include "dwarf-regs-table.h"
 
 const char *get_arch_regstr(unsigned int n)
 {
 	return (n >= ARRAY_SIZE(s390_dwarf_regs)) ? NULL : s390_dwarf_regs[n];
 }
-
-/*
- * Convert the register name into an offset to struct pt_regs (kernel).
- * This is required by the BPF prologue generator.  The BPF
- * program is called in the BPF overflow handler in the perf
- * core.
- */
-int regs_query_register_offset(const char *name)
-{
-	unsigned long gpr;
-
-	if (!name || strncmp(name, "%r", 2))
-		return -EINVAL;
-
-	errno = 0;
-	gpr = strtoul(name + 2, NULL, 10);
-	if (errno || gpr >= 16)
-		return -EINVAL;
-
-	return offsetof(user_pt_regs, gprs) + 8 * gpr;
-}
diff --git a/tools/perf/arch/x86/Makefile b/tools/perf/arch/x86/Makefile
index 9aa58acb5564..51cf267f4d85 100644
--- a/tools/perf/arch/x86/Makefile
+++ b/tools/perf/arch/x86/Makefile
@@ -3,7 +3,6 @@ ifndef NO_LIBDW
 PERF_HAVE_DWARF_REGS := 1
 endif
 HAVE_KVM_STAT_SUPPORT := 1
-PERF_HAVE_ARCH_REGS_QUERY_REGISTER_OFFSET := 1
 PERF_HAVE_JITDUMP := 1
 
 ###
diff --git a/tools/perf/arch/x86/util/dwarf-regs.c b/tools/perf/arch/x86/util/dwarf-regs.c
index 399c4a0a29d8..530905118cd4 100644
--- a/tools/perf/arch/x86/util/dwarf-regs.c
+++ b/tools/perf/arch/x86/util/dwarf-regs.c
@@ -6,112 +6,31 @@
  * Written by Masami Hiramatsu <mhiramat@redhat.com>
  */
 
-#include <stddef.h>
 #include <errno.h> /* for EINVAL */
 #include <string.h> /* for strcmp */
-#include <linux/ptrace.h> /* for struct pt_regs */
-#include <linux/kernel.h> /* for offsetof */
+#include <linux/kernel.h> /* for ARRAY_SIZE */
 #include <dwarf-regs.h>
 
-/*
- * See arch/x86/kernel/ptrace.c.
- * Different from it:
- *
- *  - Since struct pt_regs is defined differently for user and kernel,
- *    but we want to use 'ax, bx' instead of 'rax, rbx' (which is struct
- *    field name of user's pt_regs), we make REG_OFFSET_NAME to accept
- *    both string name and reg field name.
- *
- *  - Since accessing x86_32's pt_regs from x86_64 building is difficult
- *    and vise versa, we simply fill offset with -1, so
- *    get_arch_regstr() still works but regs_query_register_offset()
- *    returns error.
- *    The only inconvenience caused by it now is that we are not allowed
- *    to generate BPF prologue for a x86_64 kernel if perf is built for
- *    x86_32. This is really a rare usecase.
- *
- *  - Order is different from kernel's ptrace.c for get_arch_regstr(). Use
- *    the order defined by dwarf.
- */
+#define DEFINE_DWARF_REGSTR_TABLE 1
+#include "dwarf-regs-table.h"
 
-struct pt_regs_offset {
-	const char *name;
-	int offset;
-};
-
-#define REG_OFFSET_END {.name = NULL, .offset = 0}
-
-#ifdef __x86_64__
-# define REG_OFFSET_NAME_64(n, r) {.name = n, .offset = offsetof(struct pt_regs, r)}
-# define REG_OFFSET_NAME_32(n, r) {.name = n, .offset = -1}
+/* Return architecture dependent register string (for kprobe-tracer) */
+const char *get_arch_regstr(unsigned int n)
+{
+#if defined(__i386__)
+	size_t len = ARRAY_SIZE(x86_32_regstr_tbl);
 #else
-# define REG_OFFSET_NAME_64(n, r) {.name = n, .offset = -1}
-# define REG_OFFSET_NAME_32(n, r) {.name = n, .offset = offsetof(struct pt_regs, r)}
+	size_t len = ARRAY_SIZE(x86_64_regstr_tbl);
 #endif
 
-/* TODO: switching by dwarf address size */
-#ifndef __x86_64__
-static const struct pt_regs_offset x86_32_regoffset_table[] = {
-	REG_OFFSET_NAME_32("%ax",	eax),
-	REG_OFFSET_NAME_32("%cx",	ecx),
-	REG_OFFSET_NAME_32("%dx",	edx),
-	REG_OFFSET_NAME_32("%bx",	ebx),
-	REG_OFFSET_NAME_32("$stack",	esp),	/* Stack address instead of %sp */
-	REG_OFFSET_NAME_32("%bp",	ebp),
-	REG_OFFSET_NAME_32("%si",	esi),
-	REG_OFFSET_NAME_32("%di",	edi),
-	REG_OFFSET_END,
-};
+	if (n >= len)
+		return NULL;
 
-#define regoffset_table x86_32_regoffset_table
+#if defined(__i386__)
+	return x86_32_regstr_tbl[n];
 #else
-static const struct pt_regs_offset x86_64_regoffset_table[] = {
-	REG_OFFSET_NAME_64("%ax",	rax),
-	REG_OFFSET_NAME_64("%dx",	rdx),
-	REG_OFFSET_NAME_64("%cx",	rcx),
-	REG_OFFSET_NAME_64("%bx",	rbx),
-	REG_OFFSET_NAME_64("%si",	rsi),
-	REG_OFFSET_NAME_64("%di",	rdi),
-	REG_OFFSET_NAME_64("%bp",	rbp),
-	REG_OFFSET_NAME_64("%sp",	rsp),
-	REG_OFFSET_NAME_64("%r8",	r8),
-	REG_OFFSET_NAME_64("%r9",	r9),
-	REG_OFFSET_NAME_64("%r10",	r10),
-	REG_OFFSET_NAME_64("%r11",	r11),
-	REG_OFFSET_NAME_64("%r12",	r12),
-	REG_OFFSET_NAME_64("%r13",	r13),
-	REG_OFFSET_NAME_64("%r14",	r14),
-	REG_OFFSET_NAME_64("%r15",	r15),
-	REG_OFFSET_END,
-};
-
-#define regoffset_table x86_64_regoffset_table
+	return x86_64_regstr_tbl[n];
 #endif
-
-/* Minus 1 for the ending REG_OFFSET_END */
-#define ARCH_MAX_REGS ((sizeof(regoffset_table) / sizeof(regoffset_table[0])) - 1)
-
-/* Return architecture dependent register string (for kprobe-tracer) */
-const char *get_arch_regstr(unsigned int n)
-{
-	return (n < ARCH_MAX_REGS) ? regoffset_table[n].name : NULL;
-}
-
-/* Reuse code from arch/x86/kernel/ptrace.c */
-/**
- * regs_query_register_offset() - query register offset from its name
- * @name:	the name of a register
- *
- * regs_query_register_offset() returns the offset of a register in struct
- * pt_regs from its name. If the name is invalid, this returns -EINVAL;
- */
-int regs_query_register_offset(const char *name)
-{
-	const struct pt_regs_offset *roff;
-	for (roff = regoffset_table; roff->name != NULL; roff++)
-		if (!strcmp(roff->name, name))
-			return roff->offset;
-	return -EINVAL;
 }
 
 struct dwarf_regs_idx {
diff --git a/tools/perf/util/include/dwarf-regs.h b/tools/perf/util/include/dwarf-regs.h
index 29a7d0546b82..fbdd7307e0c2 100644
--- a/tools/perf/util/include/dwarf-regs.h
+++ b/tools/perf/util/include/dwarf-regs.h
@@ -42,12 +42,4 @@ static inline void get_powerpc_regs(u32 raw_insn __maybe_unused, int is_source _
 void get_powerpc_regs(u32 raw_insn, int is_source, struct annotated_op_loc *op_loc);
 #endif
 
-#ifdef HAVE_ARCH_REGS_QUERY_REGISTER_OFFSET
-/*
- * Arch should support fetching the offset of a register in pt_regs
- * by its name. See kernel's regs_query_register_offset in
- * arch/xxx/kernel/ptrace.c.
- */
-int regs_query_register_offset(const char *name);
-#endif
 #endif
-- 
2.47.0.277.g8800431eea-goog


