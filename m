Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF3F9C9830E
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Jan 2026 05:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:From:Subject
	:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZVnccFhyVIdPmX1GN08af1KDJO30zSaL9HTGsky0Apo=; b=ntJALRAl5tW0TwE4I3v0lNrZCR
	+O6qkiPZLMIi3Qvp5BDwrPxMCeFf6bFXJabQxKwodXdhB99Jm+RBwOwaAcpTM8j7cvn+5xefO6yCN
	TASISn1Y9vIi/FPygNb/2PY9nEtWYwFoUUiP4hmUqbq9/RdcD65wuZ54+bqwha2vSF6muUWnDbGLH
	Blccsg8zkhI2aLDC4O23SRskrHa6Tt2EDjGVhe/kdVHrVwgwgByVXkrJTLPTRm6JDkDO6jRsufi8t
	lc9WH14L2snX8oKm9slX/7UrkSl7HVeWhJ4kK+EhEie0ZIJscgm6c28+WwppejDlCM+NDWDi/TVl3
	8A5zl4TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgyt2-0000000FFD3-2me4;
	Sat, 17 Jan 2026 05:30:12 +0000
Received: from mail-dy1-x1349.google.com ([2607:f8b0:4864:20::1349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgysW-0000000FEYO-3Wn0
	for linux-arm-kernel@lists.infradead.org;
	Sat, 17 Jan 2026 05:29:41 +0000
Received: by mail-dy1-x1349.google.com with SMTP id 5a478bee46e88-2ae25c02e7bso5178906eec.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Jan 2026 21:29:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768627779; x=1769232579; darn=lists.infradead.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZVnccFhyVIdPmX1GN08af1KDJO30zSaL9HTGsky0Apo=;
        b=qlseyCsGXgrDdYdUl+gWspZW9PcPNLFjyXhnauCyh6ZL1HveiSqMNFYvr21CK4Uh8L
         gBk+UfHK3M0fq8dUUlY38nKlYxFzBzRLejP1HI4Zfujf1+1/OSwd3EIghdKgiHwwHeHh
         8MXGpxXNEEklvNOu2sre/JvJZVEBjYa3tHaudWjYCPUv7n80hN0O9LMGrFcY9kTZu8mu
         b2zobzTkKAa6k6AqAb92wystX4LpFOZ88/nNb9CpI/F669UlhUxsgFJJuGGJcec15lFi
         z+gmG606M3eWKa8jDjWkOwXCRJ0ei+RSar1XVxCseryzZTREXcTOoj8K101dIbcS7nmd
         MAGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768627779; x=1769232579;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZVnccFhyVIdPmX1GN08af1KDJO30zSaL9HTGsky0Apo=;
        b=YmYFwvLAGjyS4fQ6LikXwEX53A5ADBJKbhTpf173bqkk5gOOungIMOV06ZrpNXe7UK
         7D2gPfr9hTtlxNIpc3QV5ge3/IePvaete/k9wyKg/6iWuiZy5b/mZBDntNFBC2xtiKnN
         CAIsygkqrEjFoVV4IfHHXho09mtU2UqdXOVhpu7hkvUseNfnWYAqFeMQFfW2hS0IiucJ
         7/8bqkDTwFmAv+Ah8Jupev5Kum2jHWOVwK9iXtDe92Jk28fqe0uGpYInRbaSBG+H+f2q
         yn6KFdFwha0UboI68Fd+y7zEQg0o6eX3sUoQpxbleFf84P3zZyqorQFMpJliD8zgxpx+
         /TLg==
X-Forwarded-Encrypted: i=1; AJvYcCWGBgAasrpr7Z0jz/y2EA+39rwJRdla6Wml2MG7uR2w72NdtwtcZwXve9HnZg5rsBaGveGNpro8/1kEWSb2HFOv@lists.infradead.org
X-Gm-Message-State: AOJu0Yxf1MggJYGtP9TXYKbjca2lEzoZBsBDJ9R9hVuBitBEnAw5LJ+O
	pOWeBx0RCNbBJKPg7suyhMA47OFdT985FgF/qujDi57RkuIenAs2muMUYVAnoZvES2wCH7xSXRJ
	T5TvgsQBkPw==
X-Received: from dybqu3.prod.google.com ([2002:a05:7301:6583:b0:2b6:b139:8515])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:cc14:b0:2b0:5696:26c0
 with SMTP id 5a478bee46e88-2b6b4e28165mr5422981eec.2.1768627779350; Fri, 16
 Jan 2026 21:29:39 -0800 (PST)
Date: Fri, 16 Jan 2026 21:28:37 -0800
In-Reply-To: <20260117052849.2205545-1-irogers@google.com>
Mime-Version: 1.0
References: <20260117052849.2205545-1-irogers@google.com>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Message-ID: <20260117052849.2205545-12-irogers@google.com>
Subject: [PATCH v1 11/23] perf dwarf-regs: Clean up x86 dwarf_regnum code
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, John Garry <john.g.garry@oracle.com>, 
	Will Deacon <will@kernel.org>, Leo Yan <leo.yan@linux.dev>, Guo Ren <guoren@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Shimin Guo <shimin.guo@skydio.com>, 
	Athira Rajeev <atrajeev@linux.ibm.com>, Stephen Brennan <stephen.s.brennan@oracle.com>, 
	Howard Chu <howardchu95@gmail.com>, Thomas Falcon <thomas.falcon@intel.com>, 
	Andi Kleen <ak@linux.intel.com>, "Dr. David Alan Gilbert" <linux@treblig.org>, 
	Dmitry Vyukov <dvyukov@google.com>, 
	"=?UTF-8?q?Krzysztof=20=C5=81opatowski?=" <krzysztof.m.lopatowski@gmail.com>, Chun-Tse Shao <ctshao@google.com>, 
	Aditya Bodkhe <aditya.b1@linux.ibm.com>, Haibo Xu <haibo1.xu@intel.com>, 
	Sergei Trofimovich <slyich@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Mark Wielaard <mark@klomp.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_212940_914691_344E6EB0 
X-CRM114-Status: GOOD (  17.70  )
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

The i386 and x86-64 register numbers differ on x86, but previously x86
was a single arch string and so this couldn't be handled. The
transition to using ELF EM_* values means we can translate x86
registers correctly for either the x86-64 dwarf register mappings
(from the System V ABI) or i386 register mappings. Correct the mappings.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 .../util/dwarf-regs-arch/dwarf-regs-x86.c     | 133 ++++++++++++++++--
 tools/perf/util/dwarf-regs.c                  |   5 +-
 tools/perf/util/include/dwarf-regs.h          |   3 +-
 3 files changed, 129 insertions(+), 12 deletions(-)

diff --git a/tools/perf/util/dwarf-regs-arch/dwarf-regs-x86.c b/tools/perf/util/dwarf-regs-arch/dwarf-regs-x86.c
index 7a55c65e8da6..f0c42e4d7423 100644
--- a/tools/perf/util/dwarf-regs-arch/dwarf-regs-x86.c
+++ b/tools/perf/util/dwarf-regs-arch/dwarf-regs-x86.c
@@ -13,10 +13,65 @@
 
 struct dwarf_regs_idx {
 	const char *name;
-	int idx;
+	int dwarf_regnum;
 };
 
-static const struct dwarf_regs_idx x86_regidx_table[] = {
+static const struct dwarf_regs_idx i386_regidx_table[] = {
+	{ "eax", 0 }, { "ax", 0 }, { "al", 0 },
+	{ "ecx", 1 }, { "cx", 1 }, { "cl", 1 },
+	{ "edx", 2 }, { "dx", 2 }, { "dl", 2 },
+	{ "ebx", 3 }, { "bx", 3 }, { "bl", 3 },
+	{ "esp", 4 }, { "sp", 4 }, { "$stack", 4},
+	{ "ebp", 5 }, { "bp", 5 },
+	{ "esi", 6 }, { "si", 6 },
+	{ "edi", 7 }, { "di", 7 },
+	// 8 - Return Address RA
+	{ "eflags", 9}, { "flags", 9},
+	// 10 - reserved
+	{ "st0", 11},
+	{ "st1", 12},
+	{ "st2", 13},
+	{ "st3", 14},
+	{ "st4", 15},
+	{ "st5", 16},
+	{ "st6", 17},
+	{ "st7", 18},
+	// 19-20 - reserved
+	{ "xmm0", 21},
+	{ "xmm1", 22},
+	{ "xmm2", 23},
+	{ "xmm3", 24},
+	{ "xmm4", 25},
+	{ "xmm5", 26},
+	{ "xmm6", 27},
+	{ "xmm7", 28},
+	{ "mm0", 29},
+	{ "mm1", 30},
+	{ "mm2", 31},
+	{ "mm3", 32},
+	{ "mm4", 33},
+	{ "mm5", 34},
+	{ "mm6", 35},
+	{ "mm7", 36},
+	// 37-38 - unknown
+	{ "mxcsr", 39}, // 128-bit Media Control and Status
+	{ "es", 40},
+	{ "cs", 41},
+	{ "ss", 42},
+	{ "ds", 43},
+	{ "fs", 44},
+	{ "gs", 45},
+	// 46-47 - reserved
+	{ "tr", 48}, // Task Register
+	{ "ldtr", 49}, // LDT Register
+	// 50-92 - reserved
+	{ "fs.base", 92},
+	{ "gs.base", 93},
+	// End of regular dwarf registers.
+	{ "eip", DWARF_REG_PC }, { "ip", DWARF_REG_PC },
+};
+
+static const struct dwarf_regs_idx x86_64_regidx_table[] = {
 	{ "rax", 0 }, { "eax", 0 }, { "ax", 0 }, { "al", 0 },
 	{ "rdx", 1 }, { "edx", 1 }, { "dx", 1 }, { "dl", 1 },
 	{ "rcx", 2 }, { "ecx", 2 }, { "cx", 2 }, { "cl", 2 },
@@ -33,18 +88,78 @@ static const struct dwarf_regs_idx x86_regidx_table[] = {
 	{ "r13", 13 }, { "r13d", 13 }, { "r13w", 13 }, { "r13b", 13 },
 	{ "r14", 14 }, { "r14d", 14 }, { "r14w", 14 }, { "r14b", 14 },
 	{ "r15", 15 }, { "r15d", 15 }, { "r15w", 15 }, { "r15b", 15 },
-	{ "rip", DWARF_REG_PC },
+	// 16 - Return Address RA
+	{ "xmm0", 17},
+	{ "xmm1", 18},
+	{ "xmm2", 19},
+	{ "xmm3", 20},
+	{ "xmm4", 21},
+	{ "xmm5", 22},
+	{ "xmm6", 23},
+	{ "xmm7", 24},
+	{ "xmm8", 25},
+	{ "xmm9", 26},
+	{ "xmm10", 27},
+	{ "xmm11", 28},
+	{ "xmm12", 29},
+	{ "xmm13", 30},
+	{ "xmm14", 31},
+	{ "xmm15", 32},
+	{ "st0", 33},
+	{ "st1", 34},
+	{ "st2", 35},
+	{ "st3", 36},
+	{ "st4", 37},
+	{ "st5", 38},
+	{ "st6", 39},
+	{ "st7", 40},
+	{ "mm0", 41},
+	{ "mm1", 42},
+	{ "mm2", 43},
+	{ "mm3", 44},
+	{ "mm4", 45},
+	{ "mm5", 46},
+	{ "mm6", 47},
+	{ "mm7", 48},
+	{ "rflags", 49}, { "eflags", 49}, { "flags", 49},
+	{ "es", 50},
+	{ "cs", 51},
+	{ "ss", 52},
+	{ "ds", 53},
+	{ "fs", 54},
+	{ "gs", 55},
+	// 56-47 - reserved
+	{ "fs.base", 58},
+	{ "gs.base", 59},
+	// 60-61 - reserved
+	{ "tr", 62}, // Task Register
+	{ "ldtr", 63}, // LDT Register
+	{ "mxcsr", 64}, // 128-bit Media Control and Status
+	{ "fcw", 65}, // x87 Control Word
+	{ "fsw", 66}, // x87 Status Word
+	// End of regular dwarf registers.
+	{ "rip", DWARF_REG_PC }, { "eip", DWARF_REG_PC }, { "ip", DWARF_REG_PC },
 };
 
-int get_x86_regnum(const char *name)
+static int get_regnum(const struct dwarf_regs_idx *entries, size_t num_entries, const char *name)
 {
-	unsigned int i;
-
 	if (*name != '%')
 		return -EINVAL;
 
-	for (i = 0; i < ARRAY_SIZE(x86_regidx_table); i++)
-		if (!strcmp(x86_regidx_table[i].name, name + 1))
-			return x86_regidx_table[i].idx;
+	name++;
+	for (size_t i = 0; i < num_entries; i++) {
+		if (!strcmp(entries[i].name, name))
+			return entries[i].dwarf_regnum;
+	}
 	return -ENOENT;
 }
+
+int __get_dwarf_regnum_i386(const char *name)
+{
+	return get_regnum(i386_regidx_table, ARRAY_SIZE(i386_regidx_table), name);
+}
+
+int __get_dwarf_regnum_x86_64(const char *name)
+{
+	return get_regnum(x86_64_regidx_table, ARRAY_SIZE(x86_64_regidx_table), name);
+}
diff --git a/tools/perf/util/dwarf-regs.c b/tools/perf/util/dwarf-regs.c
index b2f37299147e..ef249dd589e3 100644
--- a/tools/perf/util/dwarf-regs.c
+++ b/tools/perf/util/dwarf-regs.c
@@ -92,9 +92,10 @@ int get_dwarf_regnum(const char *name, unsigned int machine, unsigned int flags
 	}
 	switch (machine) {
 	case EM_X86_64:
-		fallthrough;
+		reg = __get_dwarf_regnum_x86_64(name);
+		break;
 	case EM_386:
-		reg = get_x86_regnum(regname);
+		reg = __get_dwarf_regnum_i386(name);
 		break;
 	default:
 		pr_err("ELF MACHINE %x is not supported.\n", machine);
diff --git a/tools/perf/util/include/dwarf-regs.h b/tools/perf/util/include/dwarf-regs.h
index 015d1ade645f..bb5413b0fee4 100644
--- a/tools/perf/util/include/dwarf-regs.h
+++ b/tools/perf/util/include/dwarf-regs.h
@@ -99,7 +99,8 @@ const char *get_csky_regstr(unsigned int n, unsigned int flags);
  */
 const char *get_dwarf_regstr(unsigned int n, unsigned int machine, unsigned int flags);
 
-int get_x86_regnum(const char *name);
+int __get_dwarf_regnum_i386(const char *name);
+int __get_dwarf_regnum_x86_64(const char *name);
 
 /*
  * get_dwarf_regnum - Returns DWARF regnum from register name
-- 
2.52.0.457.g6b5491de43-goog


