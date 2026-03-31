Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9533C10F92FC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 20:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vAQrIl51DPfK24QcFg5HbgFTMd8+gY6sfhiY8s8SunQ=; b=bf0JOEW33Jm7KtUgPKZMpo2OAq
	Y6boB/doMsf7Qgji3uSWSFk44Qz1TP5PNcuiwhXVK/t7FSl2XIHZcyFXRx/seo25x3Np2he/ROxa4
	o4xOuXaVTNbHayW9Hfn106hO95Y7dEL7o7v+bZ5qMKDUnjr+jhFYDWZbBv5tHTaIM1jKLkmjViJLq
	VHdJp83WYo5vYZ+ypo5ziJ6qljprVMo9a6JIKdLbLzOSjlOEBgStipHD5WfewJov2U3dHugAnLD/G
	Th4NQkec2sM8ThmezAGyfqiBSG1J8WUx7s7SGJDkpzR06IPrbKpR3r8BOglKRebdOKVAb9xIbsKBU
	Liu5eIuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7fre-0000000DXCz-3rmf;
	Tue, 31 Mar 2026 20:39:06 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7frc-0000000DXCb-1y9b;
	Tue, 31 Mar 2026 20:39:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C033243CDE;
	Tue, 31 Mar 2026 20:39:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFCBCC19423;
	Tue, 31 Mar 2026 20:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774989543;
	bh=UshFWwx0qjigZqehF4ng5XUMVtYphhYyBW0Ri1qyVZg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T4pC/ntyfTxVxy8aiC+/N8BGp6ZpEmpqTEUyjIbh6w86S2k0b3rTVrGTJn+nrnQd3
	 IxAYDk+PR4IwlCVpNcMX4k9im8PPbaQX0YcdwrB/fR9LXLcNFKjeU8faHyXcAbjG5v
	 dvKdW7Rp4aP5d9ICvFkxrLWORI8RZKAXMyAiZC0ZAXcs5Pk6HS11t3UbFjFr3qJfq0
	 YER4YtAyH9HdAqgKw3NYfGX5fd6hUuS0pg4AxoP0BFjf+al4fpGzHneMF3ePfPaK3e
	 PL6WorDgNJmO0LoqlUBxcSiNhK4i3ycNA8DzSwTIKaUkYdl0ZRDqWGMoqe+aShVfFt
	 YtCoXblOKIAgQ==
Date: Tue, 31 Mar 2026 17:38:59 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Ian Rogers <irogers@google.com>
Cc: 9erthalion6@gmail.com, adrian.hunter@intel.com, alex@ghiti.fr,
	alexander.shishkin@linux.intel.com, andrew.jones@oss.qualcomm.com,
	aou@eecs.berkeley.edu, atrajeev@linux.ibm.com,
	blakejones@google.com, ctshao@google.com,
	dapeng1.mi@linux.intel.com, howardchu95@gmail.com,
	james.clark@linaro.org, john.g.garry@oracle.com, jolsa@kernel.org,
	leo.yan@linux.dev, libunwind-devel@nongnu.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org,
	mingo@redhat.com, namhyung@kernel.org, palmer@dabbelt.com,
	peterz@infradead.org, pjw@kernel.org, shimin.guo@skydio.com,
	tglozar@redhat.com, tmricht@linux.ibm.com, will@kernel.org,
	yuzhuo@google.com
Subject: Re: [PATCH v2 1/8] perf unwind: Refactor get_entries to allow
 dynamic libdw/libunwind selection
Message-ID: <acww47MH3wdNvYxR@x1>
References: <CAP-5=fWVU3ktkGAnZQrjQJf+Z5AtQo73BVUhj-nr3H95GdcEJQ@mail.gmail.com>
 <20260305221927.3237145-1-irogers@google.com>
 <20260305221927.3237145-2-irogers@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260305221927.3237145-2-irogers@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_133904_560966_480CCB65 
X-CRM114-Status: GOOD (  20.22  )
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

On Thu, Mar 05, 2026 at 02:19:20PM -0800, Ian Rogers wrote:
> Currently, both libdw and libunwind define 'unwind__get_entries'. This
> causes a duplicate symbol build failure when both are compiled into
> perf.
> 
> This commit refactors the DWARF unwind post-processing to be
> configurable at runtime via the .perfconfig file option
> 'unwind.style', or using the argument '--unwind-style' in the commands
> 'perf report', 'perf script' and 'perf inject', in a similar manner to
> the addr2line or the disassembler style.
> 
> The file 'tools/perf/util/unwind.c' adds the top-level dispatch
> function 'unwind__get_entries'. The backend implementations are
> renamed to 'libdw__get_entries' and 'libunwind__get_entries'. Both are
> attempted as fallbacks if not configured, or if the primary backend
> fails.
> 
> Fixes: 2e9191573a69 ("perf build: Remove NO_LIBDW_DWARF_UNWIND option")
> Signed-off-by: Ian Rogers <irogers@google.com>
> ---
>  tools/perf/builtin-inject.c        |   4 ++
>  tools/perf/builtin-report.c        |   4 ++
>  tools/perf/builtin-script.c        |   4 ++
>  tools/perf/util/Build              |   1 +
>  tools/perf/util/symbol_conf.h      |  15 +++++
>  tools/perf/util/unwind-libdw.c     |   2 +-
>  tools/perf/util/unwind-libunwind.c |   2 +-
>  tools/perf/util/unwind.c           | 102 +++++++++++++++++++++++++++++
>  tools/perf/util/unwind.h           |  40 +++++------
>  9 files changed, 149 insertions(+), 25 deletions(-)
>  create mode 100644 tools/perf/util/unwind.c
> 
> diff --git a/tools/perf/builtin-inject.c b/tools/perf/builtin-inject.c
> index 5b29f4296861..9ad681b3c0dc 100644
> --- a/tools/perf/builtin-inject.c
> +++ b/tools/perf/builtin-inject.c
> @@ -26,6 +26,7 @@
>  #include "util/synthetic-events.h"
>  #include "util/thread.h"
>  #include "util/namespaces.h"
> +#include "util/unwind.h"
>  #include "util/util.h"
>  #include "util/tsc.h"
>  
> @@ -2539,6 +2540,9 @@ int cmd_inject(int argc, const char **argv)
>  		OPT_STRING(0, "guestmount", &symbol_conf.guestmount, "directory",
>  			   "guest mount directory under which every guest os"
>  			   " instance has a subdir"),
> +		OPT_CALLBACK(0, "unwind-style", NULL, "unwind style",
> +			     "unwind styles (libdw,libunwind)",
> +			     unwind__option),
>  		OPT_BOOLEAN(0, "convert-callchain", &inject.convert_callchain,
>  			    "Generate callchains using DWARF and drop register/stack data"),
>  		OPT_END()
> diff --git a/tools/perf/builtin-report.c b/tools/perf/builtin-report.c
> index 3b81f4b3dc49..ae20c0679990 100644
> --- a/tools/perf/builtin-report.c
> +++ b/tools/perf/builtin-report.c
> @@ -48,6 +48,7 @@
>  #include "util/time-utils.h"
>  #include "util/auxtrace.h"
>  #include "util/units.h"
> +#include "util/unwind.h"
>  #include "util/util.h" // perf_tip()
>  #include "ui/ui.h"
>  #include "ui/progress.h"
> @@ -1455,6 +1456,9 @@ int cmd_report(int argc, const char **argv)
>  	OPT_CALLBACK(0, "addr2line-style", NULL, "addr2line style",
>  		     "addr2line styles (libdw,llvm,libbfd,addr2line)",
>  		     report_parse_addr2line_config),
> +	OPT_CALLBACK(0, "unwind-style", NULL, "unwind style",
> +		     "unwind styles (libdw,libunwind)",
> +		     unwind__option),
>  	OPT_BOOLEAN(0, "demangle", &symbol_conf.demangle,
>  		    "Symbol demangling. Enabled by default, use --no-demangle to disable."),
>  	OPT_BOOLEAN(0, "demangle-kernel", &symbol_conf.demangle_kernel,
> diff --git a/tools/perf/builtin-script.c b/tools/perf/builtin-script.c
> index 9f8b0fd27a0a..b6c7c164d02d 100644
> --- a/tools/perf/builtin-script.c
> +++ b/tools/perf/builtin-script.c
> @@ -63,6 +63,7 @@
>  #include <linux/err.h>
>  #include "util/dlfilter.h"
>  #include "util/record.h"
> +#include "util/unwind.h"
>  #include "util/util.h"
>  #include "util/cgroup.h"
>  #include "util/annotate.h"
> @@ -4164,6 +4165,9 @@ int cmd_script(int argc, const char **argv)
>  			"Enable symbol demangling"),
>  	OPT_BOOLEAN(0, "demangle-kernel", &symbol_conf.demangle_kernel,
>  			"Enable kernel symbol demangling"),
> +	OPT_CALLBACK(0, "unwind-style", NULL, "unwind style",
> +		     "unwind styles (libdw,libunwind)",
> +		     unwind__option),
>  	OPT_STRING(0, "addr2line", &symbol_conf.addr2line_path, "path",
>  			"addr2line binary to use for line numbers"),
>  	OPT_STRING(0, "time", &script.time_str, "str",
> diff --git a/tools/perf/util/Build b/tools/perf/util/Build
> index bcccad7487a9..6190a8f5b0fa 100644
> --- a/tools/perf/util/Build
> +++ b/tools/perf/util/Build
> @@ -218,6 +218,7 @@ ifndef CONFIG_SETNS
>  perf-util-y += setns.o
>  endif
>  
> +perf-util-y += unwind.o
>  perf-util-$(CONFIG_LIBDW) += probe-finder.o
>  perf-util-$(CONFIG_LIBDW) += dwarf-aux.o
>  perf-util-$(CONFIG_LIBDW) += dwarf-regs.o
> diff --git a/tools/perf/util/symbol_conf.h b/tools/perf/util/symbol_conf.h
> index 71bb17372a6c..25d92bbbfee7 100644
> --- a/tools/perf/util/symbol_conf.h
> +++ b/tools/perf/util/symbol_conf.h
> @@ -9,6 +9,19 @@
>  struct strlist;
>  struct intlist;
>  
> +enum unwind_style {
> +
> +	UNWIND_STYLE_UNKNOWN = 0,
> +
> +	UNWIND_STYLE_LIBDW,
> +
> +	UNWIND_STYLE_LIBUNWIND,
> +

Please remove the blank lines.

- Arnaldo

