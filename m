Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B870F1091926
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 21:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Utk8QuL9U7rrfQmZu26ESAI3lqANTMx57bEHV01PWSw=; b=GkKga1faFPqL+HRgqE8fHOWLLu
	9kP0b0ww0yAsJMUZqk2wLYlZmT7aV90hGiWVa1/79YRu0b/GDoeovs1qUoHmLyDINSOotncYD/yNf
	B2SWV2dCZN3IWH5AhKx4VBJN4FOkWSBp8W4F/oc54Hm+7ttT0Vu/uvJYGuOh7L0XsOI57wDri57nC
	+QY4FXZn+b1fOHqIMeWdKl9N9f5YrU0qtqkTFTJYi0fG2LYNilFUvvd7sxaqeN/RgJqHb9CUWOiGO
	V6zw+5OqJBsPmQjf9bi7UCZ5NjKDhGBzOVBNxeamjjlyRjOdmFBRVgJzjeVaaJMmw/eIfWxL066vE
	sIC+QETA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3L5E-0000000BbBa-16oM;
	Thu, 19 Mar 2026 21:39:12 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3L5D-0000000BbBQ-02HW;
	Thu, 19 Mar 2026 21:39:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1322260053;
	Thu, 19 Mar 2026 21:39:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E942C2BCAF;
	Thu, 19 Mar 2026 21:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773956349;
	bh=qnM78Hg/1iF5vDCLJpfmfvc3l2bFyzopZG81qxHq1is=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FgVHdEcTjUc5umNk3wqbz2QlOhBPgjBSMqH0MXlHXcXeqXRFRdpqkwIH0+OzGYVkD
	 m34RReu7Sm+nCZzHKIINgZZX9TQhW0ksi1Hw5BIxDaicyuuNckjYk9bMpepKWaQDLS
	 2qEhBofqa77bRTsx8T+RT8cG6HuPiLP8pikS1tDXICEs7cbGBmDXOrOXOwpupqjMdg
	 PJQnYmeqxdx9gDriOZr6oA66dfz7lKf8QHgXAkEc+fwA8hE/4ZDWuTdaGY5JQGPX3p
	 6SOr46CEriuvGJlO8LjP8UTGdVdehsMW8ZkU7uWjuX/7avAH3a8mkyUiq9i/CUqLT/
	 ckZJsBPKbGkqQ==
Date: Thu, 19 Mar 2026 14:39:07 -0700
From: Namhyung Kim <namhyung@kernel.org>
To: Ian Rogers <irogers@google.com>
Cc: 9erthalion6@gmail.com, acme@kernel.org, adrian.hunter@intel.com,
	alex@ghiti.fr, alexander.shishkin@linux.intel.com,
	andrew.jones@oss.qualcomm.com, aou@eecs.berkeley.edu,
	atrajeev@linux.ibm.com, blakejones@google.com, ctshao@google.com,
	dapeng1.mi@linux.intel.com, howardchu95@gmail.com,
	james.clark@linaro.org, john.g.garry@oracle.com, jolsa@kernel.org,
	leo.yan@linux.dev, libunwind-devel@nongnu.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org,
	mingo@redhat.com, palmer@dabbelt.com, peterz@infradead.org,
	pjw@kernel.org, shimin.guo@skydio.com, tglozar@redhat.com,
	tmricht@linux.ibm.com, will@kernel.org, yuzhuo@google.com
Subject: Re: [PATCH v2 0/8] perf libunwind multiple remote support
Message-ID: <abxs-2rozL1tBEO1@google.com>
References: <CAP-5=fWVU3ktkGAnZQrjQJf+Z5AtQo73BVUhj-nr3H95GdcEJQ@mail.gmail.com>
 <20260305221927.3237145-1-irogers@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260305221927.3237145-1-irogers@google.com>
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

Hi Ian,

On Thu, Mar 05, 2026 at 02:19:19PM -0800, Ian Rogers wrote:
> Fix the libunwind build for when libdw and libunwind are feature
> detected, currently failing with a duplicate symbol.
> 
> Refactor the libunwind support so that whenever a remote target is
> available, perf functions using the ELF machine can use that remote
> target regardless of what the host/local machine is. Migrate existing
> libunwind supported architectures like powerpc, arm64 and loongarch so
> that they can work in a cross-architecture way. Add support for
> RISC-V. Make the code more regular in function names, etc. and avoid
> including a C-file. This increases the lines of code. It is similar in
> style to the unwind-libdw implementation. It is hoped that the more
> uniform nature of the code with help with refactoring the perf
> registers for SIMD/APX support.
> 
> Aside from local host testing these patches are under tested, in part
> as I'm failing to see how to build libunwind with support for multiple
> remote targets. Please could I get help in testing.

It seems libunwind project is not actively maintained.  Assuming libdw
unwinding is performant enough, we may want to get rid of libunwind
support.

Thanks,
Namhyung

> 
> v2: Move two fixes patches to position 1 and 2 in the series. Fix
>     struct naming inconsistency, Andrew Jones
>     <andrew.jones@oss.qualcomm.com>. Fix other inconsistencies and
>     potential non-x86 build issues.
> 
> v1: https://lore.kernel.org/lkml/20260224142938.26088-1-irogers@google.com/
> 
> Ian Rogers (8):
>   perf unwind: Refactor get_entries to allow dynamic libdw/libunwind
>     selection
>   perf build loongarch: Remove reference to missing file
>   tools build: Deduplicate test-libunwind for different architectures
>   perf build: Be more programmatic when setting up libunwind variables
>   perf unwind-libunwind: Make libunwind register reading cross platform
>   perf unwind-libunwind: Move flush/finish access out of local
>   perf unwind-libunwind: Remove libunwind-local
>   perf unwind-libunwind: Add RISC-V libunwind support
> 
>  tools/build/feature/Makefile                  |  38 +-
>  tools/build/feature/test-libunwind-aarch64.c  |  27 -
>  tools/build/feature/test-libunwind-arm.c      |  28 -
>  .../test-libunwind-debug-frame-aarch64.c      |  17 -
>  .../feature/test-libunwind-debug-frame-arm.c  |  17 -
>  .../feature/test-libunwind-debug-frame.c      |   1 -
>  tools/build/feature/test-libunwind-x86.c      |  28 -
>  tools/build/feature/test-libunwind-x86_64.c   |  28 -
>  tools/build/feature/test-libunwind.c          |   1 -
>  tools/perf/Makefile.config                    | 215 ++---
>  tools/perf/arch/arm/util/Build                |   2 -
>  tools/perf/arch/arm/util/unwind-libunwind.c   |  50 --
>  tools/perf/arch/arm64/util/Build              |   1 -
>  tools/perf/arch/arm64/util/unwind-libunwind.c |  17 -
>  tools/perf/arch/loongarch/util/Build          |   3 -
>  .../arch/loongarch/util/unwind-libunwind.c    |  82 --
>  tools/perf/arch/mips/Build                    |   1 -
>  tools/perf/arch/mips/util/Build               |   1 -
>  tools/perf/arch/mips/util/unwind-libunwind.c  |  22 -
>  tools/perf/arch/powerpc/util/Build            |   1 -
>  .../perf/arch/powerpc/util/unwind-libunwind.c |  92 --
>  tools/perf/arch/x86/util/Build                |   3 -
>  tools/perf/arch/x86/util/unwind-libunwind.c   | 115 ---
>  tools/perf/builtin-inject.c                   |   4 +
>  tools/perf/builtin-report.c                   |   4 +
>  tools/perf/builtin-script.c                   |   4 +
>  tools/perf/util/Build                         |   5 +-
>  tools/perf/util/libunwind-arch/Build          |  11 +
>  .../perf/util/libunwind-arch/libunwind-arch.c | 319 +++++++
>  .../perf/util/libunwind-arch/libunwind-arch.h | 296 +++++++
>  .../perf/util/libunwind-arch/libunwind-arm.c  | 290 ++++++
>  .../util/libunwind-arch/libunwind-arm64.c     | 289 ++++++
>  .../perf/util/libunwind-arch/libunwind-i386.c | 312 +++++++
>  .../util/libunwind-arch/libunwind-loongarch.c | 297 +++++++
>  .../perf/util/libunwind-arch/libunwind-mips.c | 299 +++++++
>  .../util/libunwind-arch/libunwind-ppc32.c     | 301 +++++++
>  .../util/libunwind-arch/libunwind-ppc64.c     | 303 +++++++
>  .../util/libunwind-arch/libunwind-riscv.c     | 297 +++++++
>  .../perf/util/libunwind-arch/libunwind-s390.c | 299 +++++++
>  .../util/libunwind-arch/libunwind-x86_64.c    | 320 +++++++
>  tools/perf/util/libunwind/arm64.c             |  40 -
>  tools/perf/util/libunwind/x86_32.c            |  41 -
>  tools/perf/util/maps.c                        |  29 +-
>  tools/perf/util/maps.h                        |   4 +-
>  tools/perf/util/symbol_conf.h                 |  15 +
>  tools/perf/util/thread.c                      |  29 +-
>  tools/perf/util/unwind-libdw.c                |   2 +-
>  tools/perf/util/unwind-libunwind-local.c      | 832 ------------------
>  tools/perf/util/unwind-libunwind.c            | 679 ++++++++++++--
>  tools/perf/util/unwind.c                      | 102 +++
>  tools/perf/util/unwind.h                      |  56 +-
>  51 files changed, 4536 insertions(+), 1733 deletions(-)
>  delete mode 100644 tools/build/feature/test-libunwind-aarch64.c
>  delete mode 100644 tools/build/feature/test-libunwind-arm.c
>  delete mode 100644 tools/build/feature/test-libunwind-debug-frame-aarch64.c
>  delete mode 100644 tools/build/feature/test-libunwind-debug-frame-arm.c
>  delete mode 100644 tools/build/feature/test-libunwind-x86.c
>  delete mode 100644 tools/build/feature/test-libunwind-x86_64.c
>  delete mode 100644 tools/perf/arch/arm/util/unwind-libunwind.c
>  delete mode 100644 tools/perf/arch/arm64/util/unwind-libunwind.c
>  delete mode 100644 tools/perf/arch/loongarch/util/unwind-libunwind.c
>  delete mode 100644 tools/perf/arch/mips/Build
>  delete mode 100644 tools/perf/arch/mips/util/Build
>  delete mode 100644 tools/perf/arch/mips/util/unwind-libunwind.c
>  delete mode 100644 tools/perf/arch/powerpc/util/unwind-libunwind.c
>  delete mode 100644 tools/perf/arch/x86/util/unwind-libunwind.c
>  create mode 100644 tools/perf/util/libunwind-arch/Build
>  create mode 100644 tools/perf/util/libunwind-arch/libunwind-arch.c
>  create mode 100644 tools/perf/util/libunwind-arch/libunwind-arch.h
>  create mode 100644 tools/perf/util/libunwind-arch/libunwind-arm.c
>  create mode 100644 tools/perf/util/libunwind-arch/libunwind-arm64.c
>  create mode 100644 tools/perf/util/libunwind-arch/libunwind-i386.c
>  create mode 100644 tools/perf/util/libunwind-arch/libunwind-loongarch.c
>  create mode 100644 tools/perf/util/libunwind-arch/libunwind-mips.c
>  create mode 100644 tools/perf/util/libunwind-arch/libunwind-ppc32.c
>  create mode 100644 tools/perf/util/libunwind-arch/libunwind-ppc64.c
>  create mode 100644 tools/perf/util/libunwind-arch/libunwind-riscv.c
>  create mode 100644 tools/perf/util/libunwind-arch/libunwind-s390.c
>  create mode 100644 tools/perf/util/libunwind-arch/libunwind-x86_64.c
>  delete mode 100644 tools/perf/util/libunwind/arm64.c
>  delete mode 100644 tools/perf/util/libunwind/x86_32.c
>  delete mode 100644 tools/perf/util/unwind-libunwind-local.c
>  create mode 100644 tools/perf/util/unwind.c
> 
> -- 
> 2.53.0.473.g4a7958ca14-goog
> 

