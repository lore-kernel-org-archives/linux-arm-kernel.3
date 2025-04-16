Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A5D5C369C5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 19:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zw1RTUf9P1O8DE2gBZDfX57XQ6qwlxNFLSDVWnPqgU8=; b=FrjCvkr/lSh9IndOGTfhkq7uVV
	uG4ZzDVw16A8ZmJkhdHBQAtqO1moljixQylP1ckYdFAWSmxpL5D/KZRU0txc5EfMmxpcYuaqvILGk
	Wb5UmpYX9Uw+GHZGkLXNj1gS/tkDx79B7dZnRrqfdjf6fAOS11cu+2ISFOVZVtK7Nxb7Dv+EiRxRq
	UiRITOQpTj/3n+Ey4IJOeurUsY+mY2UHBhAVhFMTObYRTvgqveiF1wxIzgMFLzf/9V+G/aZ7Zcdvg
	DRwfHWFO06O6TDI3BMeNUtGZVovPuB5uSg9rgE4zDYuvwevjhneZT1fC1bsQ8CDyYiHx/ww80cbUB
	iXKtX+1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u58rs-0000000Akjg-2oAM;
	Wed, 16 Apr 2025 19:56:20 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u58q1-0000000AkY9-2jYS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 19:54:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 75DC9A4A52D;
	Wed, 16 Apr 2025 19:48:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66A95C4CEE2;
	Wed, 16 Apr 2025 19:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744833264;
	bh=VOgmkXfdlWuIo4XkZejUC7sV2odScaUVZc1wtf1wTE4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lz8rnA0BHsADULNyL0KMwo4Act0zMwIUCn0nvTGvkBr6f8BjruW1ndqTE1Di5OZCi
	 UkuNKo0Nz4XpneU5MJdayxIwLU3YEjBnYSBSCoAUa2UG2FVMIgAkhLZ4tU9p7i/AMC
	 1U3q0RB0LdLEDHI4tzmJyG9bVWmyPD5T4sUixEk075h5/gOAwy9KDlG8VZDnnMaMFJ
	 Z8z51RMvOgos4Zn49+OoLoSFfn4hi48Rb/Gc8DESIxm8EMXA9WqIHo7LXyi0Y9N/Er
	 x4SBoCSP/h1DnaZawfgmSqpf0BZ2MCRdsdiRC0pVr9srZ2Ox+gDVgF03eAkKRLczqB
	 Ohal3WQ8xg/ew==
Date: Wed, 16 Apr 2025 12:54:21 -0700
From: Kees Cook <kees@kernel.org>
To: Mostafa Saleh <smostafa@google.com>
Cc: kvmarm@lists.linux.dev, kasan-dev@googlegroups.com,
	linux-hardening@vger.kernel.org, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	will@kernel.org, maz@kernel.org, oliver.upton@linux.dev,
	broonie@kernel.org, catalin.marinas@arm.com, tglx@linutronix.de,
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
	x86@kernel.org, hpa@zytor.com, elver@google.com,
	andreyknvl@gmail.com, ryabinin.a.a@gmail.com,
	akpm@linux-foundation.org, yuzenghui@huawei.com,
	suzuki.poulose@arm.com, joey.gouly@arm.com, masahiroy@kernel.org,
	nathan@kernel.org, nicolas.schier@linux.dev
Subject: Re: [PATCH 3/4] KVM: arm64: Introduce CONFIG_UBSAN_KVM_EL2
Message-ID: <202504161250.CC5C277A@keescook>
References: <20250416180440.231949-1-smostafa@google.com>
 <20250416180440.231949-4-smostafa@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416180440.231949-4-smostafa@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_125425_820914_8D1F5F19 
X-CRM114-Status: GOOD (  27.07  )
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

On Wed, Apr 16, 2025 at 06:04:33PM +0000, Mostafa Saleh wrote:
> Add a new Kconfig CONFIG_UBSAN_KVM_EL2 for KVM which enables
> UBSAN for EL2 code (in protected/nvhe/hvhe) modes.
> This will re-use the same checks enabled for the kernel for
> the hypervisor. The only difference is that for EL2 it always
> emits a "brk" instead of implementing hooks as the hypervisor
> can't print reports.
> 
> The KVM code will re-use the same code for the kernel
> "report_ubsan_failure()" so #ifdefs are changed to also have this
> code for CONFIG_UBSAN_KVM_EL2
> 
> Signed-off-by: Mostafa Saleh <smostafa@google.com>
> ---
>  arch/arm64/kvm/hyp/nvhe/Makefile | 6 ++++++
>  include/linux/ubsan.h            | 2 +-
>  lib/Kconfig.ubsan                | 9 +++++++++
>  lib/ubsan.c                      | 6 ++++--
>  scripts/Makefile.ubsan           | 5 ++++-
>  5 files changed, 24 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/kvm/hyp/nvhe/Makefile b/arch/arm64/kvm/hyp/nvhe/Makefile
> index b43426a493df..cbe7e12752bc 100644
> --- a/arch/arm64/kvm/hyp/nvhe/Makefile
> +++ b/arch/arm64/kvm/hyp/nvhe/Makefile
> @@ -99,3 +99,9 @@ KBUILD_CFLAGS := $(filter-out $(CC_FLAGS_FTRACE) $(CC_FLAGS_SCS), $(KBUILD_CFLAG
>  # causes a build failure. Remove profile optimization flags.
>  KBUILD_CFLAGS := $(filter-out -fprofile-sample-use=% -fprofile-use=%, $(KBUILD_CFLAGS))
>  KBUILD_CFLAGS += -fno-asynchronous-unwind-tables -fno-unwind-tables
> +
> +ifeq ($(CONFIG_UBSAN_KVM_EL2),y)
> +UBSAN_SANITIZE := y
> +# Always use brk and not hooks
> +ccflags-y += $(CFLAGS_UBSAN_FOR_TRAP)
> +endif
> diff --git a/include/linux/ubsan.h b/include/linux/ubsan.h
> index c843816f5f68..3ab8d38aedb8 100644
> --- a/include/linux/ubsan.h
> +++ b/include/linux/ubsan.h
> @@ -2,7 +2,7 @@
>  #ifndef _LINUX_UBSAN_H
>  #define _LINUX_UBSAN_H
>  
> -#ifdef CONFIG_UBSAN_TRAP
> +#if defined(CONFIG_UBSAN_TRAP) || defined(CONFIG_UBSAN_KVM_EL2)
>  const char *report_ubsan_failure(u32 check_type);
>  #else
>  static inline const char *report_ubsan_failure(u32 check_type)
> diff --git a/lib/Kconfig.ubsan b/lib/Kconfig.ubsan
> index 4216b3a4ff21..3878858eb473 100644
> --- a/lib/Kconfig.ubsan
> +++ b/lib/Kconfig.ubsan
> @@ -166,4 +166,13 @@ config TEST_UBSAN
>  	  This is a test module for UBSAN.
>  	  It triggers various undefined behavior, and detect it.
>  
> +config UBSAN_KVM_EL2
> +	bool "UBSAN for KVM code at EL2"
> +	depends on ARM64
> +	help
> +	  Enable UBSAN when running on ARM64 with KVM in a split mode
> +	  (nvhe/hvhe/protected) for the hypervisor code running in EL2.
> +	  In this mode, any UBSAN violation in EL2 would panic the kernel
> +	  and information similar to UBSAN_TRAP would be printed.
> +
>  endif	# if UBSAN
> diff --git a/lib/ubsan.c b/lib/ubsan.c
> index 17993727fc96..a6ca235dd714 100644
> --- a/lib/ubsan.c
> +++ b/lib/ubsan.c
> @@ -19,7 +19,7 @@
>  
>  #include "ubsan.h"
>  
> -#ifdef CONFIG_UBSAN_TRAP
> +#if defined(CONFIG_UBSAN_TRAP) || defined(CONFIG_UBSAN_KVM_EL2)
>  /*
>   * Only include matches for UBSAN checks that are actually compiled in.
>   * The mappings of struct SanitizerKind (the -fsanitize=xxx args) to
> @@ -97,7 +97,9 @@ const char *report_ubsan_failure(u32 check_type)
>  	}
>  }
>  
> -#else
> +#endif
> +
> +#ifndef CONFIG_UBSAN_TRAP
>  static const char * const type_check_kinds[] = {
>  	"load of",
>  	"store to",
> diff --git a/scripts/Makefile.ubsan b/scripts/Makefile.ubsan
> index 9e35198edbf0..68af6830af0f 100644
> --- a/scripts/Makefile.ubsan
> +++ b/scripts/Makefile.ubsan
> @@ -1,5 +1,8 @@
>  # SPDX-License-Identifier: GPL-2.0
>  
> +#Shared with KVM/arm64

Nitpick: Please add a space between "#" and "Shared", and end the line
with "."

> +export CFLAGS_UBSAN_FOR_TRAP := $(call cc-option,-fsanitize-trap=undefined,-fsanitize-undefined-trap-on-error)
> +
>  # Enable available and selected UBSAN features.
>  ubsan-cflags-$(CONFIG_UBSAN_ALIGNMENT)		+= -fsanitize=alignment
>  ubsan-cflags-$(CONFIG_UBSAN_BOUNDS_STRICT)	+= -fsanitize=bounds-strict
> @@ -10,7 +13,7 @@ ubsan-cflags-$(CONFIG_UBSAN_DIV_ZERO)		+= -fsanitize=integer-divide-by-zero
>  ubsan-cflags-$(CONFIG_UBSAN_UNREACHABLE)	+= -fsanitize=unreachable
>  ubsan-cflags-$(CONFIG_UBSAN_BOOL)		+= -fsanitize=bool
>  ubsan-cflags-$(CONFIG_UBSAN_ENUM)		+= -fsanitize=enum
> -ubsan-cflags-$(CONFIG_UBSAN_TRAP)		+= $(call cc-option,-fsanitize-trap=undefined,-fsanitize-undefined-trap-on-error)
> +ubsan-cflags-$(CONFIG_UBSAN_TRAP)		+= $(CFLAGS_UBSAN_FOR_TRAP)

Another minor style request: please name this "CFLAGS_UBSAN_TRAP"
(nothing else in Kconfig uses "FOR" like this, and leaving it off sounds
more declarative).

>  
>  export CFLAGS_UBSAN := $(ubsan-cflags-y)

Otherwise, yes, looks good.

-- 
Kees Cook

