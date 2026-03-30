Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15EF91061B23
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 21:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k4ulZMJqd7PBJGU81/FmSCZAi29NBIixzf7evveSBJ8=; b=lSCKMt7jKsGpt5mk4AE8q/NPwk
	MnHA+3ZSVkOzxzI5bpKZH6ORn1B8qattOJeWTrCEqfn+W+8tIsntVSjGFhKIn+Xg1IsetobFL4D8Z
	YoV4ZftNLXdaOouM8oQjFOisiFgQe+rMCMG2VV8czlbCZ6J41vdxd7IY51O47BwGzBbZYfSbkqVmt
	DeArRLlMpC+eKk2/4NHFIEK5q0vLKiHQVCl3D6VNbPBYUYHLgXXhWJxrhTBLxBoPJM0GCgmcSpmCM
	MApXdN+pzsyqz1nZ435tfkKqW7wa/PZ4AmB/fpVJfs+L3iuIT+TpYvnc2f34h/i/KWwIJYHLq4D8l
	ZQyjxN3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Jr3-0000000Bt5t-0HHt;
	Mon, 30 Mar 2026 21:09:01 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Jr1-0000000Bt5U-36Az;
	Mon, 30 Mar 2026 21:08:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 74AFA60132;
	Mon, 30 Mar 2026 21:08:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45D42C4CEF7;
	Mon, 30 Mar 2026 21:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774904938;
	bh=LihhuuGe1wazeIERreGWoOQzwjMDxoaIwNu5UQf1i+4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BS+GTEim568F04dnhh9XAU5AQN7Q13SwG/8IuKUOtbOpW7onARby5I9+GrZZ767lU
	 nOat2vBN2MnxE7jpMej9shSQ16WGOcSkHLr8bv6yAqVfmifA4RhSASiCgEYwMzWpYY
	 gJl3EzxV0Ah9z/GucNJk55BIFq6maZQp+KFFJdX08vCKwjp39bc6u7cRJf9Kgl4598
	 hro1Pjwinda/adRsCCD2VvL+fp93QugQjq1QOjyqZnNZ1pBFWzOq5LM0LiZ+wi61J7
	 n/vvBsGd8sc0fAJD5ZsQ/ZmmPUbOQzJRNizfG5tgsLWTTu89QG1lg+EaLGkYX7bK1a
	 SKEGGGSJxvCrQ==
Date: Mon, 30 Mar 2026 18:08:53 -0300
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
Subject: Re: [PATCH v2 3/8] tools build: Deduplicate test-libunwind for
 different architectures
Message-ID: <acrmZbWi-uhXjIfU@x1>
References: <CAP-5=fWVU3ktkGAnZQrjQJf+Z5AtQo73BVUhj-nr3H95GdcEJQ@mail.gmail.com>
 <20260305221927.3237145-1-irogers@google.com>
 <20260305221927.3237145-4-irogers@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260305221927.3237145-4-irogers@google.com>
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

On Thu, Mar 05, 2026 at 02:19:22PM -0800, Ian Rogers wrote:
> The separate test files only exist to pass a different #include,
> instead have a single source file and pass -include to $(CC) to
> include the relevant header file for the architecture being
> tested. Generate the rules using a foreach loop. Include tests for all
> current libunwind architectures.

Clever :-)

- Arnaldo
 
> Signed-off-by: Ian Rogers <irogers@google.com>
> ---
>  tools/build/feature/Makefile                  | 38 +++++++++----------
>  tools/build/feature/test-libunwind-aarch64.c  | 27 -------------
>  tools/build/feature/test-libunwind-arm.c      | 28 --------------
>  .../test-libunwind-debug-frame-aarch64.c      | 17 ---------
>  .../feature/test-libunwind-debug-frame-arm.c  | 17 ---------
>  .../feature/test-libunwind-debug-frame.c      |  1 -
>  tools/build/feature/test-libunwind-x86.c      | 28 --------------
>  tools/build/feature/test-libunwind-x86_64.c   | 28 --------------
>  tools/build/feature/test-libunwind.c          |  1 -
>  9 files changed, 19 insertions(+), 166 deletions(-)
>  delete mode 100644 tools/build/feature/test-libunwind-aarch64.c
>  delete mode 100644 tools/build/feature/test-libunwind-arm.c
>  delete mode 100644 tools/build/feature/test-libunwind-debug-frame-aarch64.c
>  delete mode 100644 tools/build/feature/test-libunwind-debug-frame-arm.c
>  delete mode 100644 tools/build/feature/test-libunwind-x86.c
>  delete mode 100644 tools/build/feature/test-libunwind-x86_64.c
> 
> diff --git a/tools/build/feature/Makefile b/tools/build/feature/Makefile
> index 1fbcb3ce74d2..a0b40e826688 100644
> --- a/tools/build/feature/Makefile
> +++ b/tools/build/feature/Makefile
> @@ -204,27 +204,27 @@ $(OUTPUT)test-numa_num_possible_cpus.bin:
>  	$(BUILD) -lnuma
>  
>  $(OUTPUT)test-libunwind.bin:
> -	$(BUILD) -lelf -llzma
> +	$(BUILD) -include libunwind.h -lelf -llzma -lunwind
>  
>  $(OUTPUT)test-libunwind-debug-frame.bin:
> -	$(BUILD) -lelf -llzma
> -$(OUTPUT)test-libunwind-x86.bin:
> -	$(BUILD) -lelf -llzma -lunwind-x86
> -
> -$(OUTPUT)test-libunwind-x86_64.bin:
> -	$(BUILD) -lelf -llzma -lunwind-x86_64
> -
> -$(OUTPUT)test-libunwind-arm.bin:
> -	$(BUILD) -lelf -llzma -lunwind-arm
> -
> -$(OUTPUT)test-libunwind-aarch64.bin:
> -	$(BUILD) -lelf -llzma -lunwind-aarch64
> -
> -$(OUTPUT)test-libunwind-debug-frame-arm.bin:
> -	$(BUILD) -lelf -llzma -lunwind-arm
> -
> -$(OUTPUT)test-libunwind-debug-frame-aarch64.bin:
> -	$(BUILD) -lelf -llzma -lunwind-aarch64
> +	$(BUILD) -include libunwind.h -lelf -llzma -lunwind
> +
> +LIBUNWIND_ARCHS:=aarch64 arm loongarch64 mips ppc32 ppc64 riscv s390x x86 x86_64
> +define LIBUNWIND_RULE
> +$$(OUTPUT)test-libunwind-$(1).bin:
> +	$$(CC) $$(CFLAGS) -MD -Wall -Werror -include libunwind-$(1).h -o $$@ \
> +		test-libunwind.c $$(LDFLAGS) -lelf -llzma -lunwind-$(1) \
> +		> $$(@:.bin=.make.output) 2>&1
> +
> +$$(OUTPUT)test-libunwind-debug-frame-$(1).bin:
> +	$$(CC) $$(CFLAGS) -MD -Wall -Werror -include libunwind-$(1).h -o $$@ \
> +		test-libunwind-debug-frame.c $$(LDFLAGS) -lelf -llzma -lunwind-$(1) \
> +		> $$(@:.bin=.make.output) 2>&1
> +
> +endef
> +$(foreach arch,$(LIBUNWIND_ARCHS), \
> +    $(eval $(call LIBUNWIND_RULE,$(arch))) \
> +)
>  
>  $(OUTPUT)test-libslang.bin:
>  	$(BUILD) -lslang
> diff --git a/tools/build/feature/test-libunwind-aarch64.c b/tools/build/feature/test-libunwind-aarch64.c
> deleted file mode 100644
> index 323803f49212..000000000000
> --- a/tools/build/feature/test-libunwind-aarch64.c
> +++ /dev/null
> @@ -1,27 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0
> -#include <libunwind-aarch64.h>
> -#include <stdlib.h>
> -
> -extern int UNW_OBJ(dwarf_search_unwind_table) (unw_addr_space_t as,
> -					       unw_word_t ip,
> -					       unw_dyn_info_t *di,
> -					       unw_proc_info_t *pi,
> -					       int need_unwind_info, void *arg);
> -
> -#define dwarf_search_unwind_table UNW_OBJ(dwarf_search_unwind_table)
> -
> -static unw_accessors_t accessors;
> -
> -int main(void)
> -{
> -	unw_addr_space_t addr_space;
> -
> -	addr_space = unw_create_addr_space(&accessors, 0);
> -	if (addr_space)
> -		return 0;
> -
> -	unw_init_remote(NULL, addr_space, NULL);
> -	dwarf_search_unwind_table(addr_space, 0, NULL, NULL, 0, NULL);
> -
> -	return 0;
> -}
> diff --git a/tools/build/feature/test-libunwind-arm.c b/tools/build/feature/test-libunwind-arm.c
> deleted file mode 100644
> index cb378b7d6866..000000000000
> --- a/tools/build/feature/test-libunwind-arm.c
> +++ /dev/null
> @@ -1,28 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0
> -#include <libunwind-arm.h>
> -#include <stdlib.h>
> -
> -extern int UNW_OBJ(dwarf_search_unwind_table) (unw_addr_space_t as,
> -					       unw_word_t ip,
> -					       unw_dyn_info_t *di,
> -					       unw_proc_info_t *pi,
> -					       int need_unwind_info, void *arg);
> -
> -
> -#define dwarf_search_unwind_table UNW_OBJ(dwarf_search_unwind_table)
> -
> -static unw_accessors_t accessors;
> -
> -int main(void)
> -{
> -	unw_addr_space_t addr_space;
> -
> -	addr_space = unw_create_addr_space(&accessors, 0);
> -	if (addr_space)
> -		return 0;
> -
> -	unw_init_remote(NULL, addr_space, NULL);
> -	dwarf_search_unwind_table(addr_space, 0, NULL, NULL, 0, NULL);
> -
> -	return 0;
> -}
> diff --git a/tools/build/feature/test-libunwind-debug-frame-aarch64.c b/tools/build/feature/test-libunwind-debug-frame-aarch64.c
> deleted file mode 100644
> index 36d6646c185e..000000000000
> --- a/tools/build/feature/test-libunwind-debug-frame-aarch64.c
> +++ /dev/null
> @@ -1,17 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0
> -#include <libunwind-aarch64.h>
> -#include <stdlib.h>
> -
> -extern int
> -UNW_OBJ(dwarf_find_debug_frame) (int found, unw_dyn_info_t *di_debug,
> -				 unw_word_t ip, unw_word_t segbase,
> -				 const char *obj_name, unw_word_t start,
> -				 unw_word_t end);
> -
> -#define dwarf_find_debug_frame UNW_OBJ(dwarf_find_debug_frame)
> -
> -int main(void)
> -{
> -	dwarf_find_debug_frame(0, NULL, 0, 0, NULL, 0, 0);
> -	return 0;
> -}
> diff --git a/tools/build/feature/test-libunwind-debug-frame-arm.c b/tools/build/feature/test-libunwind-debug-frame-arm.c
> deleted file mode 100644
> index 8696e48e1268..000000000000
> --- a/tools/build/feature/test-libunwind-debug-frame-arm.c
> +++ /dev/null
> @@ -1,17 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0
> -#include <libunwind-arm.h>
> -#include <stdlib.h>
> -
> -extern int
> -UNW_OBJ(dwarf_find_debug_frame) (int found, unw_dyn_info_t *di_debug,
> -				 unw_word_t ip, unw_word_t segbase,
> -				 const char *obj_name, unw_word_t start,
> -				 unw_word_t end);
> -
> -#define dwarf_find_debug_frame UNW_OBJ(dwarf_find_debug_frame)
> -
> -int main(void)
> -{
> -	dwarf_find_debug_frame(0, NULL, 0, 0, NULL, 0, 0);
> -	return 0;
> -}
> diff --git a/tools/build/feature/test-libunwind-debug-frame.c b/tools/build/feature/test-libunwind-debug-frame.c
> index efb55cdd8d01..4c57e37004b3 100644
> --- a/tools/build/feature/test-libunwind-debug-frame.c
> +++ b/tools/build/feature/test-libunwind-debug-frame.c
> @@ -1,5 +1,4 @@
>  // SPDX-License-Identifier: GPL-2.0
> -#include <libunwind.h>
>  #include <stdlib.h>
>  
>  extern int
> diff --git a/tools/build/feature/test-libunwind-x86.c b/tools/build/feature/test-libunwind-x86.c
> deleted file mode 100644
> index e5e0f6c89637..000000000000
> --- a/tools/build/feature/test-libunwind-x86.c
> +++ /dev/null
> @@ -1,28 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0
> -#include <libunwind-x86.h>
> -#include <stdlib.h>
> -
> -extern int UNW_OBJ(dwarf_search_unwind_table) (unw_addr_space_t as,
> -					       unw_word_t ip,
> -					       unw_dyn_info_t *di,
> -					       unw_proc_info_t *pi,
> -					       int need_unwind_info, void *arg);
> -
> -
> -#define dwarf_search_unwind_table UNW_OBJ(dwarf_search_unwind_table)
> -
> -static unw_accessors_t accessors;
> -
> -int main(void)
> -{
> -	unw_addr_space_t addr_space;
> -
> -	addr_space = unw_create_addr_space(&accessors, 0);
> -	if (addr_space)
> -		return 0;
> -
> -	unw_init_remote(NULL, addr_space, NULL);
> -	dwarf_search_unwind_table(addr_space, 0, NULL, NULL, 0, NULL);
> -
> -	return 0;
> -}
> diff --git a/tools/build/feature/test-libunwind-x86_64.c b/tools/build/feature/test-libunwind-x86_64.c
> deleted file mode 100644
> index 62ae4db597dc..000000000000
> --- a/tools/build/feature/test-libunwind-x86_64.c
> +++ /dev/null
> @@ -1,28 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0
> -#include <libunwind-x86_64.h>
> -#include <stdlib.h>
> -
> -extern int UNW_OBJ(dwarf_search_unwind_table) (unw_addr_space_t as,
> -					       unw_word_t ip,
> -					       unw_dyn_info_t *di,
> -					       unw_proc_info_t *pi,
> -					       int need_unwind_info, void *arg);
> -
> -
> -#define dwarf_search_unwind_table UNW_OBJ(dwarf_search_unwind_table)
> -
> -static unw_accessors_t accessors;
> -
> -int main(void)
> -{
> -	unw_addr_space_t addr_space;
> -
> -	addr_space = unw_create_addr_space(&accessors, 0);
> -	if (addr_space)
> -		return 0;
> -
> -	unw_init_remote(NULL, addr_space, NULL);
> -	dwarf_search_unwind_table(addr_space, 0, NULL, NULL, 0, NULL);
> -
> -	return 0;
> -}
> diff --git a/tools/build/feature/test-libunwind.c b/tools/build/feature/test-libunwind.c
> index 53fd26614ff0..5af5dc3a73d4 100644
> --- a/tools/build/feature/test-libunwind.c
> +++ b/tools/build/feature/test-libunwind.c
> @@ -1,5 +1,4 @@
>  // SPDX-License-Identifier: GPL-2.0
> -#include <libunwind.h>
>  #include <stdlib.h>
>  
>  extern int UNW_OBJ(dwarf_search_unwind_table) (unw_addr_space_t as,
> -- 
> 2.53.0.473.g4a7958ca14-goog
> 

