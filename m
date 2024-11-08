Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2743D64097
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 Nov 2024 00:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:From:Subject
	:References:Mime-Version:Message-Id:In-Reply-To:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mQRPvLF54EMjS0fZBHCrPGIISSwDJSkkZI6lor/m+jQ=; b=dgpdoYMnM0xY/wy9rpyFF6jFjH
	U+lPzjGBPQLK89g0p+TbTuzzVaLL9RKQp6y05njH3MDPC+BWLyNpk6jmrPUKDFitF5zD07SoO+R1A
	uSOyFrAqUM4cs5+raopiFfmFCHXiOmmliMrIkR0r1Jkv7fTYD3yRsiki1SG1fvj/b7xGixBrE/wU5
	zz5otmmO3Q+1QZBMMLOh7AAaXn4Gu5KDJhuw3I5ztumaUO3psObj6iB3vOSExvvwNukIvd/TJi2bC
	jlDkRWDeb2qWTz6aWKxHqtipu2L+v1CsYmPDoQntqPrWkzuejww3SvGo/YtQcS1kwtMpyihhkuIIv
	tAVyHDyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9ZDp-0000000CKSv-0Xkn;
	Sat, 09 Nov 2024 00:21:01 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Ygq-0000000CFL4-0G9k
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 23:46:57 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-e02fff66a83so4601231276.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 Nov 2024 15:46:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731109615; x=1731714415; darn=lists.infradead.org;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mQRPvLF54EMjS0fZBHCrPGIISSwDJSkkZI6lor/m+jQ=;
        b=4yGh3Handy8wJn2kXlVw1RsSS17LWlEKtuBxTR4Umv3PUTdC9GJn0ppHlZb3VsHrIz
         NgYAWWRE7sXUOSHIjDfdJ41f+uuSq99MSwfBamCVUYLvSkwf7/z3JeO1GrORBbZsAPpz
         R05vXULHFE8PEYl3aBNKbrGnM5l4D26HvSO18bZnZlEYHjdv8A6SRUcVL27DCujx6hE+
         tm4eyKZuEZlwjWRUUKnfdp3LLoZfuZCGCAaOl9i1WdZ8frn19AcVZ2zeHqeK65lXCOXH
         3hUn6bhlLBB5Uv/eN8tcPbjnlmbjLHthckavkeXaL+Mri+UoF5viXW0IWFvNuraXnTbX
         Y/0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731109615; x=1731714415;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mQRPvLF54EMjS0fZBHCrPGIISSwDJSkkZI6lor/m+jQ=;
        b=q6Eqq9k0YWSGVsUzVXi4t0QoGdaEQjyZ5pm6wDbwKRixzYTsnSuU6dNmKPKyKFhHLn
         2JhIEvGAdljMgckDdPxVDQZ7EtQxzBQDoec7JEEViqc0qwayrPhpNYulRFIAob/3X8iN
         j6kE57asjqQ0kctQBxAFzm+6pDxTxNl/1CgLpMOPsEgkNbS5CTQP3KLdGXgK+hAGsWPs
         roEOzzMlkZzulditqnWEU3HK8mZFoBargFBFj+aVXjoOb4YzPJFjJVQrV1VG2uLCp+WO
         5YLXxnPWdXr379aA4NVxnQhnSkFVaX/aOjGhB0p+e404e4AiBbkqjqlZkjqTHxk3C5z1
         Ggzw==
X-Forwarded-Encrypted: i=1; AJvYcCUJKO0Tbz4hkNueUN3nOKq+eGSZ+ZYjSNrfJhSGx+nT0d5YqVA7PASQywRHhKV1q0Mu0re0TPSTwm0caLtdDQUq@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+uaKdEVK8jY+BkLbRDxGAdX54xPcsCOJcvrnTOriWFiBynNzl
	hfu/Px2EW09xrgbcBz4BN5Mbvk6C1irnlMrIyzBWVbeeZtWjdbo47wYdkuvGmdyrlmscawxxKzK
	lszKKFw==
X-Google-Smtp-Source: AGHT+IGsk9VYrw3QfDO3eDsFvs4Q9nFhi7SGEsHvVXxeM2FcQ1VTtH8rj7jQkOX7hcCXvoTVKKB7//tdZThy
X-Received: from irogers.svl.corp.google.com ([2620:15c:2c5:11:6fd2:1e36:6d8c:7c49])
 (user=irogers job=sendgmr) by 2002:a25:a289:0:b0:e33:9110:27fd with SMTP id
 3f1490d57ef6-e33911028b7mr868276.9.1731109614446; Fri, 08 Nov 2024 15:46:54
 -0800 (PST)
Date: Fri,  8 Nov 2024 15:46:04 -0800
In-Reply-To: <20241108234606.429459-1-irogers@google.com>
Message-Id: <20241108234606.429459-20-irogers@google.com>
Mime-Version: 1.0
References: <20241108234606.429459-1-irogers@google.com>
X-Mailer: git-send-email 2.47.0.277.g8800431eea-goog
Subject: [PATCH v4 19/20] perf dwarf-regs: Remove get_arch_regstr code
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
X-CRM114-CacheID: sfid-20241108_154656_129531_A8C2644C 
X-CRM114-Status: GOOD (  12.05  )
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

get_arch_regstr no longer exists so remove declaration. Associated ifs
and switches are made unconditional.

Reviewed-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/dwarf-regs.c         | 12 ------------
 tools/perf/util/include/dwarf-regs.h |  7 -------
 2 files changed, 19 deletions(-)

diff --git a/tools/perf/util/dwarf-regs.c b/tools/perf/util/dwarf-regs.c
index 05fff75a8f59..28a1cfdf26d4 100644
--- a/tools/perf/util/dwarf-regs.c
+++ b/tools/perf/util/dwarf-regs.c
@@ -32,23 +32,11 @@
 /* Return architecture dependent register string (for kprobe-tracer) */
 const char *get_dwarf_regstr(unsigned int n, unsigned int machine, unsigned int flags)
 {
-#if EM_HOST == EM_X86_64 || EM_HOST == EM_386 || EM_HOST == EM_AARCH64 || EM_HOST == EM_ARM \
-    || EM_HOST == EM_CSKY || EM_HOST == EM_LOONGARCH || EM_HOST == EM_MIPS || EM_HOST == EM_PPC \
-    || EM_HOST == EM_PPC64 || EM_HOST == EM_RISCV || EM_HOST == EM_S390 || EM_HOST == EM_SH \
-    || EM_HOST == EM_SPARC || EM_HOST == EM_SPARCV9 || EM_HOST == EM_XTENSA
 	if (machine == EM_NONE) {
 		/* Generic arch - use host arch */
 		machine = EM_HOST;
 	}
-#endif
 	switch (machine) {
-#if EM_HOST != EM_X86_64 && EM_HOST != EM_386 && EM_HOST != EM_AARCH64 && EM_HOST != EM_ARM \
-    && EM_HOST != EM_CSKY && EM_HOST != EM_LOONGARCH && EM_HOST != EM_MIPS && EM_HOST != EM_PPC \
-    && EM_HOST != EM_PPC64 && EM_HOST != EM_RISCV && EM_HOST != EM_S390 && EM_HOST != EM_SH \
-    && EM_HOST != EM_SPARC && EM_HOST != EM_SPARCV9 && EM_HOST != EM_XTENSA
-	case EM_NONE:	/* Generic arch - use host arch */
-		return get_arch_regstr(n);
-#endif
 	case EM_386:
 		return __get_dwarf_regstr(x86_32_regstr_tbl, n);
 	case EM_X86_64:
diff --git a/tools/perf/util/include/dwarf-regs.h b/tools/perf/util/include/dwarf-regs.h
index e0f1d65895f5..6f1b9f6b2466 100644
--- a/tools/perf/util/include/dwarf-regs.h
+++ b/tools/perf/util/include/dwarf-regs.h
@@ -89,13 +89,6 @@
 #define DWARF_REG_FB  0xd3affb /* random number */
 
 #ifdef HAVE_LIBDW_SUPPORT
-#if !defined(__x86_64__) && !defined(__i386__) && !defined(__aarch64__) && !defined(__arm__) \
-    && !defined(__loongarch__) && !defined(__mips__) && !defined(__powerpc__) \
-    && !defined(__powerpc64__) && !defined(__riscv__) && !defined(__s390x__) && !defined(__sh__) \
-    && !defined(__sparc64__) && !defined(__sparc__) && !defined(__xtensa__)
-const char *get_arch_regstr(unsigned int n);
-#endif
-
 const char *get_csky_regstr(unsigned int n, unsigned int flags);
 
 /**
-- 
2.47.0.277.g8800431eea-goog


