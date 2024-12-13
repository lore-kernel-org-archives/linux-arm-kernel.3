Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 659BDE77180
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Dec 2024 23:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+VnoE8kjhhknG67/cyGbgYIuFLpdcq1ew1rIJBez+r8=; b=Xg0RRsqHL++BPVEMepKChykgF5
	YIff3Kkz5VihaxB/EfoF2pZGFp8pvekSmSDsBDWrGPuVRlQKcZXoKnRZV0dO5WdaaxvrmbSc044wQ
	9ElfaOS/e13XIXf4wkKI0NYQKENcM8u+FlnbkIxnSctXjyEl/1RtwGeSrXdzMxdSfAoWYtzPvlXhx
	TiaUpe759loazXZsYXOOIcv//msnaY4Upr5gF9W5VTgR+PSDW98duWpicSOKX09BFLy1AatA5o8RV
	Ds8tfR6ksGAqPS2wUSF1CVoLippdL4+zWrCFd8CuhgYyggTdrSUxKX3ohb5DMMjQ2LUTlwyldTlzi
	0Wk3gNdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMFSs-00000005KIa-46X5;
	Fri, 13 Dec 2024 23:52:58 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tMFRn-00000005KBP-41RI;
	Fri, 13 Dec 2024 23:51:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C82B5A4040C;
	Fri, 13 Dec 2024 23:49:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94490C4CED0;
	Fri, 13 Dec 2024 23:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734133910;
	bh=LBl8bC14OQtqtIKs1HukcWT3y7YKXmSmDiIE/yMGSmc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XtbDPPlZbvqi8CN6Oxf/cp0n+oSr7ObvLvF/U2VDgAChn1LmY9vPTTrZPXt16xhat
	 inbTnXZlRscl4snJJ6UgFlEeSj8INrtWj3w+kY5Zw6Xwg/PSii2l0HnKE9BmyS9OVT
	 8N0rE6al1xzB6jamo6faQdVxRpqtjSmRmiAwfcJhnFdx0fBBSN910Mi1qMJ5n+kktQ
	 5hNIUPaZXmQiXX9jVYYu5/7CRPAvUoy2K6AFHWYU/z5bFe44BQV9tOCZxs16Vn8N4x
	 pKammezScSiU7mB84NioErtAEA5PzW9kkj2h4m+pmdJm0TyG9CjJqpZAVG7w4/b+7Y
	 1sa1Hb94hlvOw==
Date: Fri, 13 Dec 2024 15:51:48 -0800
From: Namhyung Kim <namhyung@kernel.org>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	=?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>,
	=?utf-8?Q?G=C3=BCnther?= Noack <gnoack@google.com>,
	Christian Brauner <brauner@kernel.org>, Guo Ren <guoren@kernel.org>,
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
	James Clark <james.clark@linaro.org>,
	Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>,
	=?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>,
	Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-security-module@vger.kernel.org, bpf@vger.kernel.org,
	linux-csky@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 02/16] perf tools: arc: Support generic syscall headers
Message-ID: <Z1zIlKq19lAXMoGs@google.com>
References: <20241212-perf_syscalltbl-v2-0-f8ca984ffe40@rivosinc.com>
 <20241212-perf_syscalltbl-v2-2-f8ca984ffe40@rivosinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241212-perf_syscalltbl-v2-2-f8ca984ffe40@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_155152_114390_402A3D8C 
X-CRM114-Status: GOOD (  16.79  )
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

On Thu, Dec 12, 2024 at 04:32:52PM -0800, Charlie Jenkins wrote:
> Arc uses the generic syscall table, use that in perf instead of
> requiring libaudit.
> 
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> ---
>  tools/perf/Makefile.config                           | 2 +-
>  tools/perf/Makefile.perf                             | 2 +-
>  tools/perf/arch/arc/entry/syscalls/Kbuild            | 2 ++
>  tools/perf/arch/arc/entry/syscalls/Makefile.syscalls | 3 +++
>  tools/perf/arch/arc/include/syscall_table.h          | 2 ++
>  5 files changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/perf/Makefile.config b/tools/perf/Makefile.config
> index a72f25162714f0117a88d94474da336814d4f030..3959a9c9972999f6d1bb85e8c1d7dc5dce92fd09 100644
> --- a/tools/perf/Makefile.config
> +++ b/tools/perf/Makefile.config
> @@ -36,7 +36,7 @@ ifneq ($(NO_SYSCALL_TABLE),1)
>    endif
>  
>    # architectures that use the generic syscall table scripts
> -  ifeq ($(SRCARCH),riscv)
> +  ifeq ($(SRCARCH),$(filter $(SRCARCH),riscv arc))

This might work as well.

  ifneq ($(filter $(SRCARCH), riscv arc),)

And maybe you can add a variable for supported archs.

Thanks,
Namhyung


>      NO_SYSCALL_TABLE := 0
>      CFLAGS += -DGENERIC_SYSCALL_TABLE
>      CFLAGS += -I$(OUTPUT)/tools/perf/arch/$(SRCARCH)/include/generated
> diff --git a/tools/perf/Makefile.perf b/tools/perf/Makefile.perf
> index f5278ed9f778f928436693a14e016c5c3c5171c1..3b463b42b0e3982e74056e672b2ee6adad5a3f0e 100644
> --- a/tools/perf/Makefile.perf
> +++ b/tools/perf/Makefile.perf
> @@ -311,7 +311,7 @@ FEATURE_TESTS := all
>  endif
>  endif
>  # architectures that use the generic syscall table
> -ifeq ($(SRCARCH),riscv)
> +ifeq ($(SRCARCH),$(filter $(SRCARCH),riscv arc))
>  include $(srctree)/tools/perf/scripts/Makefile.syscalls
>  endif
>  include Makefile.config
> diff --git a/tools/perf/arch/arc/entry/syscalls/Kbuild b/tools/perf/arch/arc/entry/syscalls/Kbuild
> new file mode 100644
> index 0000000000000000000000000000000000000000..11707c481a24ecf4e220e51eb1aca890fe929a13
> --- /dev/null
> +++ b/tools/perf/arch/arc/entry/syscalls/Kbuild
> @@ -0,0 +1,2 @@
> +# SPDX-License-Identifier: GPL-2.0
> +syscall-y += syscalls_32.h
> diff --git a/tools/perf/arch/arc/entry/syscalls/Makefile.syscalls b/tools/perf/arch/arc/entry/syscalls/Makefile.syscalls
> new file mode 100644
> index 0000000000000000000000000000000000000000..391d30ab7a831b72d2ed3f2e7966fdbf558a9ed7
> --- /dev/null
> +++ b/tools/perf/arch/arc/entry/syscalls/Makefile.syscalls
> @@ -0,0 +1,3 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +syscall_abis_32 += arc time32 renameat stat64 rlimit
> diff --git a/tools/perf/arch/arc/include/syscall_table.h b/tools/perf/arch/arc/include/syscall_table.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..4c942821662d95216765b176a84d5fc7974e1064
> --- /dev/null
> +++ b/tools/perf/arch/arc/include/syscall_table.h
> @@ -0,0 +1,2 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#include <asm/syscalls_32.h>
> 
> -- 
> 2.34.1
> 

