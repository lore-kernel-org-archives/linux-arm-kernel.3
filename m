Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E145D64099
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 23:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:From:Subject
	:References:Mime-Version:Message-Id:In-Reply-To:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g82RToWDBgAxXg56Q2NaJKBXk5A1APOL73D1eJS6XJQ=; b=ZwvTVYkTL1vmrqRF0CFXZmcLif
	OD2/Yaw31FjqqRtZJd2owDWyTcrX86PmJH9px/XDBhWtTLtttEI0A6Fa3Q6e1bNOj36pKwc1Tvv3h
	Uy/CW/3clIZFcz4bn69Gjww3tL+e1mqwHyyGmxBlXUKId9IoOMumuFP60/FVW39+2vFwqfXUW05A8
	RozQzD9MMO6C1brFGVybV4UbwpFbAuKZqAyT4iQahLOuLlYyYCXvuqqP19OTKS07tSSVQr6lkC+0s
	s6F4Yr78KHie7XUF4LK7DA0qXhRcIfw+INLj4NYwi/Jortw0fBkOSkNWmRDnZ+mlZFAfcfNgOqNRW
	0LO5vIkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9YnT-0000000CGud-0Jlv;
	Fri, 08 Nov 2024 23:53:47 +0000
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9YgE-0000000CEzA-0gud
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 23:46:19 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-6ea95f530fdso51639067b3.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 Nov 2024 15:46:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731109577; x=1731714377; darn=lists.infradead.org;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g82RToWDBgAxXg56Q2NaJKBXk5A1APOL73D1eJS6XJQ=;
        b=03x+JYIbeBGXBuNuBo4fCgUBnFXOe0Se5ROEZPU85QlKyNzMGwzfDayTurh3Ic3Wl7
         g6t5RkUZKp9YTbw2tsbOUMwMqXAe9ElWEU0NqQVaeNm1eHvxqOTMec2wjAk/WXtCrLXs
         fjk9z9LN+3X4f3JtJocjzvakkBlpJvxPSBrXOaULxczw20DY7+ACzVhhCavzX1edKX5T
         GTzlbnn8WEqQ1bvGoJGrPVsDlgZGAFfOof5pjGLt3xtx1Wa9wutgnXrPquSv+QEH/G1E
         RjKaHM0iO92O4bZHBfQPRB8ENm9Bro4oiqV5qP46A+cpoZFom5AxCZkq6cjC8n21YzS2
         IXbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731109577; x=1731714377;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g82RToWDBgAxXg56Q2NaJKBXk5A1APOL73D1eJS6XJQ=;
        b=BoBe2hHrDiF80XlEI7nfK4PEGr7JzUiMtHyhy/8R08EcS0Ycu4fy6uRSYjmP9AyhWI
         hWd54bsVCy9X79lgTOdkQVaBsLv4pUVcFRsXZ/mHDv9xATSAgAEFEd4ucyuQXe0W6FW5
         2axclqwZgdrYeim/sLf3IaD+NKRTEOnG701/yzoFAyuYCJnoa41XOmyRaxaKWlxMpl4Q
         ScPIDcecEsM3WTe7b8NHCmvXlCZKIl9AeHoPUEl4pLZnU3r+BAmlaoH2X4ChBLa1fgtz
         t82zvp/fqwprW/HDELupIhS7Lg6rhNFJb20rQXKnJ5njAPUSy9PxfGmjyaj64lUehJNu
         w4vA==
X-Forwarded-Encrypted: i=1; AJvYcCWidcbmXXdDW5SDtbJ+Ip4B0W2sEtu8VR34ml7YUZW46rfC+mdy3UKztU0pk+/+EAkT9pgMRaLWjDwgzFP57aKY@lists.infradead.org
X-Gm-Message-State: AOJu0YyjC7rtEueKnbdkED2CDlzKurQjeIimLhN52fWPvXgDvdwcrK9X
	oW52GDnuiPFoUX9gVPB2u+NixIgDjhnhXV1ckOQGz8TF1Nvxw3FeynDgNKToUXE1qwd9AMEZESL
	+yzvQ7g==
X-Google-Smtp-Source: AGHT+IElDJGck4lM83rJ1PEL9nymEB4MsWS2o56lAC0eXJqXdZF9OIb7Wse2J+4ISIY+n+Ta53vUnbF5wBR0
X-Received: from irogers.svl.corp.google.com ([2620:15c:2c5:11:6fd2:1e36:6d8c:7c49])
 (user=irogers job=sendgmr) by 2002:a5b:142:0:b0:e29:6df8:ef58 with SMTP id
 3f1490d57ef6-e337f861ec6mr5903276.4.1731109576800; Fri, 08 Nov 2024 15:46:16
 -0800 (PST)
Date: Fri,  8 Nov 2024 15:45:48 -0800
In-Reply-To: <20241108234606.429459-1-irogers@google.com>
Message-Id: <20241108234606.429459-4-irogers@google.com>
Mime-Version: 1.0
References: <20241108234606.429459-1-irogers@google.com>
X-Mailer: git-send-email 2.47.0.277.g8800431eea-goog
Subject: [PATCH v4 03/20] perf dwarf-regs: Add EM_HOST and EF_HOST defines
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
X-CRM114-CacheID: sfid-20241108_154618_284946_0FDB852D 
X-CRM114-Status: GOOD (  15.76  )
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

Computed from the build architecture defines, EM_HOST and EF_HOST give
values that can be used in dwarf register lookup. Place in
dwarf-regs.h so the value can be shared. Move some dwarf-regs.c
constants used for EM_HOST to dwarf-regs.h. Add CSky constants that
may be missing.

In disasm.c add an include of dwarf-regs.h as the included
arch/*/annotate/instructions.c files make use of the constants and we
want the elf.h/dwarf-regs.h dependency to be explicit.

Reviewed-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/disasm.c             |  1 +
 tools/perf/util/dwarf-regs.c         |  8 ---
 tools/perf/util/include/dwarf-regs.h | 82 ++++++++++++++++++++++++++++
 3 files changed, 83 insertions(+), 8 deletions(-)

diff --git a/tools/perf/util/disasm.c b/tools/perf/util/disasm.c
index bd98fec903f7..a525b80b934f 100644
--- a/tools/perf/util/disasm.c
+++ b/tools/perf/util/disasm.c
@@ -18,6 +18,7 @@
 #include "disasm.h"
 #include "disasm_bpf.h"
 #include "dso.h"
+#include "dwarf-regs.h"
 #include "env.h"
 #include "evsel.h"
 #include "map.h"
diff --git a/tools/perf/util/dwarf-regs.c b/tools/perf/util/dwarf-regs.c
index 5b7f86c0063f..7c01bc4d7e5b 100644
--- a/tools/perf/util/dwarf-regs.c
+++ b/tools/perf/util/dwarf-regs.c
@@ -13,14 +13,6 @@
 #include <errno.h>
 #include <linux/kernel.h>
 
-#ifndef EM_AARCH64
-#define EM_AARCH64	183  /* ARM 64 bit */
-#endif
-
-#ifndef EM_LOONGARCH
-#define EM_LOONGARCH	258 /* LoongArch */
-#endif
-
 /* Define const char * {arch}_register_tbl[] */
 #define DEFINE_DWARF_REGSTR_TABLE
 #include "../arch/x86/include/dwarf-regs-table.h"
diff --git a/tools/perf/util/include/dwarf-regs.h b/tools/perf/util/include/dwarf-regs.h
index fbdd7307e0c2..ce9f10b3282d 100644
--- a/tools/perf/util/include/dwarf-regs.h
+++ b/tools/perf/util/include/dwarf-regs.h
@@ -2,6 +2,88 @@
 #ifndef _PERF_DWARF_REGS_H_
 #define _PERF_DWARF_REGS_H_
 #include "annotate.h"
+#include <elf.h>
+
+#ifndef EM_AARCH64
+#define EM_AARCH64	183  /* ARM 64 bit */
+#endif
+
+#ifndef EM_CSKY
+#define EM_CSKY		252  /* C-SKY */
+#endif
+#ifndef EF_CSKY_ABIV1
+#define EF_CSKY_ABIV1	0X10000000
+#endif
+#ifndef EF_CSKY_ABIV2
+#define EF_CSKY_ABIV2	0X20000000
+#endif
+
+#ifndef EM_LOONGARCH
+#define EM_LOONGARCH	258 /* LoongArch */
+#endif
+
+/* EM_HOST gives the ELF machine for host, EF_HOST gives additional flags. */
+#if defined(__x86_64__)
+  #define EM_HOST EM_X86_64
+#elif defined(__i386__)
+  #define EM_HOST EM_386
+#elif defined(__aarch64__)
+  #define EM_HOST EM_AARCH64
+#elif defined(__arm__)
+  #define EM_HOST EM_ARM
+#elif defined(__alpha__)
+  #define EM_HOST EM_ALPHA
+#elif defined(__arc__)
+  #define EM_HOST EM_ARC
+#elif defined(__AVR__)
+  #define EM_HOST EM_AVR
+#elif defined(__AVR32__)
+  #define EM_HOST EM_AVR32
+#elif defined(__bfin__)
+  #define EM_HOST EM_BLACKFIN
+#elif defined(__csky__)
+  #define EM_HOST EM_CSKY
+  #if defined(__CSKYABIV2__)
+    #define EF_HOST EF_CSKY_ABIV2
+  #else
+    #define EF_HOST EF_CSKY_ABIV1
+  #endif
+#elif defined(__cris__)
+  #define EM_HOST EM_CRIS
+#elif defined(__hppa__) // HP PA-RISC
+  #define EM_HOST EM_PARISC
+#elif defined(__loongarch__)
+  #define EM_HOST EM_LOONGARCH
+#elif defined(__mips__)
+  #define EM_HOST EM_MIPS
+#elif defined(__m32r__)
+  #define EM_HOST EM_M32R
+#elif defined(__microblaze__)
+  #define EM_HOST EM_MICROBLAZE
+#elif defined(__MSP430__)
+  #define EM_HOST EM_MSP430
+#elif defined(__powerpc64__)
+  #define EM_HOST EM_PPC64
+#elif defined(__powerpc__)
+  #define EM_HOST EM_PPC
+#elif defined(__riscv)
+  #define EM_HOST EM_RISCV
+#elif defined(__s390x__)
+  #define EM_HOST EM_S390
+#elif defined(__sh__)
+  #define EM_HOST EM_SH
+#elif defined(__sparc64__) || defined(__sparc__)
+  #define EM_HOST EM_SPARC
+#elif defined(__xtensa__)
+  #define EM_HOST EM_XTENSA
+#else
+  /* Unknown host ELF machine type. */
+  #define EM_HOST EM_NONE
+#endif
+
+#if !defined(EF_HOST)
+  #define EF_HOST 0
+#endif
 
 #define DWARF_REG_PC  0xd3af9c /* random number */
 #define DWARF_REG_FB  0xd3affb /* random number */
-- 
2.47.0.277.g8800431eea-goog


