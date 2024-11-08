Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD18CD64085
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 20:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H/dZFJc2z5rUwKei0wy+VFYTSdoDIJrW66Yr1bcGuUw=; b=r5/zo9xD/KzQwIOTSZHa1YQQDP
	aQqsbAKGrxAtfdJdAuF2MbloqmHhG6Jn/FVfOyuaQkO5N8srpPx8gkDUI1LnUpG4ey+2DxatsP+mQ
	0/ceX8TuosHd4nSQIFzoYYNuM79Oruzd8P4OknbOa/JyKnjJNrso6lqJxKA2ub6fhbs+iNtjiZaO6
	vXhyEAGHhJB/nbu1ox5R/xGFRY1bb49T6TxDR1hjjpxxDjgNwRli5K7FXlCiuECpMmbDPgIBlUXtU
	RzbSnW2G9NMKQFiQ876GnLstUnkTBHT0rZHPjO2rvdspWTLa7VcUVVzgw8ASMjrMwoC03sixXDcHB
	7tnDDdLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9VE4-0000000Bp5A-0lo9;
	Fri, 08 Nov 2024 20:05:00 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9VCF-0000000Bofl-2RXp;
	Fri, 08 Nov 2024 20:03:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 67FFBA44D13;
	Fri,  8 Nov 2024 20:01:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 430B3C4CECD;
	Fri,  8 Nov 2024 20:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731096185;
	bh=xX7Im2UhKNKgBE416PaOdSNPECSfPWPArQu7YbQODCs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=epU1fQiNqfeFZdEM00F7vtSpMYwYfot9P71+GYdehpaxaLPDaCOqbKUsUO44+7y7Q
	 o3eR0G3nwWjdXG/LjOV4dfBN0fpiBTfQjkBTXyhZBNO+yusM5c1u7BaRCniZhMJtUc
	 q0LQVTzSXkt/xN//agdroW9fr4YtNwoqFZiNjQEOxO7G8ZsMBpZAqrwC/td1X3yVI6
	 ZSmmdmmc6CZDt6uatgD6LkqCfjjGv9p4sNMU/5ZgXRHd74jD11SoWcSVHFWVmpVipt
	 dxHX0hnw/IAilCJN1DmkNfFpwQXnl86vrupoNsuxdPy9xI7tSKuBpkU6HsTpd7/E8B
	 18HgSp7ZPgyRw==
Date: Fri, 8 Nov 2024 12:03:02 -0800
From: Namhyung Kim <namhyung@kernel.org>
To: Ian Rogers <irogers@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Kan Liang <kan.liang@linux.intel.com>,
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
	James Clark <james.clark@linaro.org>,
	Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>,
	Guo Ren <guoren@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Nick Terrell <terrelln@fb.com>,
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>,
	Changbin Du <changbin.du@huawei.com>,
	Guilherme Amadio <amadio@gentoo.org>,
	Yang Jihong <yangjihong@bytedance.com>,
	Aditya Gupta <adityag@linux.ibm.com>,
	Athira Rajeev <atrajeev@linux.vnet.ibm.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>,
	Kajol Jain <kjain@linux.ibm.com>, Atish Patra <atishp@rivosinc.com>,
	Shenlin Liang <liangshenlin@eswincomputing.com>,
	Anup Patel <anup@brainfault.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	"Steinar H. Gunderson" <sesse@google.com>,
	"Dr. David Alan Gilbert" <linux@treblig.org>,
	Chen Pei <cp0613@linux.alibaba.com>,
	Dima Kogan <dima@secretsauce.net>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	"David S. Miller" <davem@davemloft.net>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 10/20] perf dwarf-regs: Move csky dwarf-regs out of
 arch
Message-ID: <Zy5udmX6gZAg0wkS@google.com>
References: <20241017002520.59124-1-irogers@google.com>
 <20241017002520.59124-11-irogers@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241017002520.59124-11-irogers@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_120307_766813_031A2C5A 
X-CRM114-Status: GOOD (  20.83  )
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

On Wed, Oct 16, 2024 at 05:25:10PM -0700, Ian Rogers wrote:
> Move arch/csky/util/dwarf-regs.c to util/dwarf-regs-csky.c and compile
> in unconditionally. To avoid get_arch_regstr being duplicated, rename
> to get_csky_regstr and add to get_dwarf_regstr switch.
> 
> Update #ifdefs to allow ABI V1 and V2 tables at the same
> time. Determine the table from the ELF flags.
> 
> Signed-off-by: Ian Rogers <irogers@google.com>
> ---
>  tools/perf/arch/csky/util/Build               |  1 -
>  tools/perf/util/Build                         |  1 +
>  .../dwarf-regs.c => util/dwarf-regs-csky.c}   | 19 ++++++++++---------
>  tools/perf/util/dwarf-regs.c                  | 11 +++++++----
>  tools/perf/util/include/dwarf-regs.h          |  2 ++
>  5 files changed, 20 insertions(+), 14 deletions(-)
>  rename tools/perf/{arch/csky/util/dwarf-regs.c => util/dwarf-regs-csky.c} (74%)
> 
> diff --git a/tools/perf/arch/csky/util/Build b/tools/perf/arch/csky/util/Build
> index 1325310cab6a..5e6ea82c4202 100644
> --- a/tools/perf/arch/csky/util/Build
> +++ b/tools/perf/arch/csky/util/Build
> @@ -1,4 +1,3 @@
>  perf-util-y += perf_regs.o
>  
> -perf-util-$(CONFIG_LIBDW) += dwarf-regs.o
>  perf-util-$(CONFIG_LIBDW_DWARF_UNWIND) += unwind-libdw.o
> diff --git a/tools/perf/util/Build b/tools/perf/util/Build
> index 4c615611b9d7..99ae4e2802b8 100644
> --- a/tools/perf/util/Build
> +++ b/tools/perf/util/Build
> @@ -203,6 +203,7 @@ endif
>  perf-util-$(CONFIG_LIBDW) += probe-finder.o
>  perf-util-$(CONFIG_LIBDW) += dwarf-aux.o
>  perf-util-$(CONFIG_LIBDW) += dwarf-regs.o
> +perf-util-$(CONFIG_LIBDW) += dwarf-regs-csky.o
>  perf-util-$(CONFIG_LIBDW) += dwarf-regs-x86.o
>  perf-util-$(CONFIG_LIBDW) += debuginfo.o
>  perf-util-$(CONFIG_LIBDW) += annotate-data.o
> diff --git a/tools/perf/arch/csky/util/dwarf-regs.c b/tools/perf/util/dwarf-regs-csky.c
> similarity index 74%
> rename from tools/perf/arch/csky/util/dwarf-regs.c
> rename to tools/perf/util/dwarf-regs-csky.c
> index ca86ecaeacbb..d38ef1f07f3e 100644
> --- a/tools/perf/arch/csky/util/dwarf-regs.c
> +++ b/tools/perf/util/dwarf-regs-csky.c
> @@ -5,9 +5,8 @@
>  #include <stddef.h>
>  #include <dwarf-regs.h>
>  
> -#if defined(__CSKYABIV2__)
> -#define CSKY_MAX_REGS 73
> -const char *csky_dwarf_regs_table[CSKY_MAX_REGS] = {
> +#define CSKY_ABIV2_MAX_REGS 73
> +const char *csky_dwarf_regs_table_abiv2[CSKY_ABIV2_MAX_REGS] = {
>  	/* r0 ~ r8 */
>  	"%a0", "%a1", "%a2", "%a3", "%regs0", "%regs1", "%regs2", "%regs3",
>  	/* r9 ~ r15 */
> @@ -26,9 +25,9 @@ const char *csky_dwarf_regs_table[CSKY_MAX_REGS] = {
>  	NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,
>  	"%epc",
>  };
> -#else
> -#define CSKY_MAX_REGS 57
> -const char *csky_dwarf_regs_table[CSKY_MAX_REGS] = {
> +
> +#define CSKY_ABIV1_MAX_REGS 57
> +const char *csky_dwarf_regs_table_abiv1[CSKY_ABIV1_MAX_REGS] = {
>  	/* r0 ~ r8 */
>  	"%sp", "%regs9", "%a0", "%a1", "%a2", "%a3", "%regs0", "%regs1",
>  	/* r9 ~ r15 */
> @@ -41,9 +40,11 @@ const char *csky_dwarf_regs_table[CSKY_MAX_REGS] = {
>  	NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,
>  	"%epc",
>  };
> -#endif
>  
> -const char *get_arch_regstr(unsigned int n)
> +const char *get_csky_regstr(unsigned int n, unsigned int flags)
>  {
> -	return (n < CSKY_MAX_REGS) ? csky_dwarf_regs_table[n] : NULL;
> +	if (flags & EF_CSKY_ABIV2)

Hmm.. you need it here as well.


> +		return (n < CSKY_ABIV2_MAX_REGS) ? csky_dwarf_regs_table_abiv2[n] : NULL;
> +
> +	return (n < CSKY_ABIV1_MAX_REGS) ? csky_dwarf_regs_table_abiv1[n] : NULL;
>  }
> diff --git a/tools/perf/util/dwarf-regs.c b/tools/perf/util/dwarf-regs.c
> index fd21f9e90e40..9a76f83af62c 100644
> --- a/tools/perf/util/dwarf-regs.c
> +++ b/tools/perf/util/dwarf-regs.c
> @@ -29,17 +29,18 @@
>  #define __get_dwarf_regstr(tbl, n) (((n) < ARRAY_SIZE(tbl)) ? (tbl)[(n)] : NULL)
>  
>  /* Return architecture dependent register string (for kprobe-tracer) */
> -const char *get_dwarf_regstr(unsigned int n, unsigned int machine,
> -			     unsigned int flags __maybe_unused)
> +const char *get_dwarf_regstr(unsigned int n, unsigned int machine, unsigned int flags)
>  {
> -#if EM_HOST == EM_X86_64 || EM_HOST == EM_386 || EM_HOST == EM_AARCH64 || EM_HOST == EM_ARM
> +#if EM_HOST == EM_X86_64 || EM_HOST == EM_386 || EM_HOST == EM_AARCH64 || EM_HOST == EM_ARM \
> +    || EM_HOST == EM_CSKY

And here too.  It seems you also need a rebase.

At this point, I'm giving up.  Can you please refresh the series with
a fix?

Thanks,
Namhyung


>  	if (machine == EM_NONE) {
>  		/* Generic arch - use host arch */
>  		machine = EM_HOST;
>  	}
>  #endif
>  	switch (machine) {
> -#if EM_HOST != EM_X86_64 && EM_HOST != EM_386 && EM_HOST != EM_AARCH64 && EM_HOST != EM_ARM
> +#if EM_HOST != EM_X86_64 && EM_HOST != EM_386 && EM_HOST != EM_AARCH64 && EM_HOST != EM_ARM \
> +    && EM_HOST != EM_CSKY
>  	case EM_NONE:	/* Generic arch - use host arch */
>  		return get_arch_regstr(n);
>  #endif
> @@ -51,6 +52,8 @@ const char *get_dwarf_regstr(unsigned int n, unsigned int machine,
>  		return __get_dwarf_regstr(arm_regstr_tbl, n);
>  	case EM_AARCH64:
>  		return __get_dwarf_regstr(aarch64_regstr_tbl, n);
> +	case EM_CSKY:
> +		return get_csky_regstr(n, flags);
>  	case EM_SH:
>  		return __get_dwarf_regstr(sh_regstr_tbl, n);
>  	case EM_S390:
> diff --git a/tools/perf/util/include/dwarf-regs.h b/tools/perf/util/include/dwarf-regs.h
> index 0b533409d82a..b72d9d308ce4 100644
> --- a/tools/perf/util/include/dwarf-regs.h
> +++ b/tools/perf/util/include/dwarf-regs.h
> @@ -83,6 +83,8 @@
>  const char *get_arch_regstr(unsigned int n);
>  #endif
>  
> +const char *get_csky_regstr(unsigned int n, unsigned int flags);
> +
>  /**
>   * get_dwarf_regstr() - Returns ftrace register string from DWARF regnum.
>   * @n: DWARF register number.
> -- 
> 2.47.0.105.g07ac214952-goog
> 

