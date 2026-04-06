Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD1A1FB5168
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Apr 2026 21:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=REdg9oGBxbtYlBzrZT3ikKJfF2IDKrFyDR1UDvFouzI=; b=d54BC9yPDMYJqfZjkZTDwmrgb3
	/rknZz8M+xp9rDd8/1JW+kgdAhTwstoB76/mvADejcF8x0Ow8deOaOfuQynJEOB8gw/XgHB0/V7n0
	T7VnJW/raU99zoAR/KFSvVmpj0rJG6H1UayhKJZ0wjwJSw5v4MhoVmXnMZRtx3M7SPEoHwOwmJGCn
	GZYZYZRg7Mr5Nw3Uhgfu8qP7EJDqxLbnkBc/ZkDQL6eBQCJxBMuVnkixl7OLO48CDKFLlBQKvNEH6
	dkdDtsfFBkrAnSlTMeOktU/jmgbDTR9P+FPGDQZyYyHev1gS71ugh219ISD6EYt5RsPdh3PTQzT8R
	bDSe3p2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9rcx-00000005XAp-22wG;
	Mon, 06 Apr 2026 21:36:59 +0000
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9rcv-00000005XAd-0FNs;
	Mon, 06 Apr 2026 21:36:57 +0000
Message-ID: <99d9bb6f-443e-4cb2-9aa4-1eadf9ebbb7e@infradead.org>
Date: Mon, 6 Apr 2026 14:36:55 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/8] arm64, unwind: build kernel with sframe V3 info
To: Dylan Hatch <dylanbhatch@google.com>,
 Roman Gushchin <roman.gushchin@linux.dev>, Weinan Liu <wnliu@google.com>,
 Will Deacon <will@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>,
 Indu Bhagat <indu.bhagat@oracle.com>, Peter Zijlstra <peterz@infradead.org>,
 Steven Rostedt <rostedt@goodmis.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Jiri Kosina <jikos@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
 Prasanna Kumar T S M <ptsm@linux.microsoft.com>,
 Puranjay Mohan <puranjay@kernel.org>, Song Liu <song@kernel.org>,
 joe.lawrence@redhat.com, linux-toolchains@vger.kernel.org,
 linux-kernel@vger.kernel.org, live-patching@vger.kernel.org,
 Jens Remus <jremus@linux.ibm.com>, linux-arm-kernel@lists.infradead.org
References: <20260406185000.1378082-1-dylanbhatch@google.com>
 <20260406185000.1378082-3-dylanbhatch@google.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260406185000.1378082-3-dylanbhatch@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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



On 4/6/26 11:49 AM, Dylan Hatch wrote:
> Build with -Wa,--gsframe-3 flags to generate a .sframe section. This
> will be used for in-kernel reliable stacktrace in cases where the frame
> pointer alone is insufficient.
> 
> Currently, the sframe format only supports arm64, x86_64 and s390x
> architectures.
> 
> Signed-off-by: Weinan Liu <wnliu@google.com>
> Signed-off-by: Dylan Hatch <dylanbhatch@google.com>
> Reviewed-by: Prasanna Kumar T S M <ptsm@linux.microsoft.com>
> ---
>  MAINTAINERS                            |  1 +
>  Makefile                               |  8 ++++++++
>  arch/Kconfig                           |  7 +++++++
>  arch/arm64/Kconfig                     |  1 +
>  arch/arm64/Kconfig.debug               | 13 +++++++++++++
>  arch/arm64/include/asm/unwind_sframe.h | 12 ++++++++++++
>  arch/arm64/kernel/vdso/Makefile        |  2 +-
>  include/asm-generic/vmlinux.lds.h      | 15 +++++++++++++++
>  8 files changed, 58 insertions(+), 1 deletion(-)
>  create mode 100644 arch/arm64/include/asm/unwind_sframe.h
> 


> diff --git a/arch/Kconfig b/arch/Kconfig
> index 6695c222c728..c87e489fa978 100644
> --- a/arch/Kconfig
> +++ b/arch/Kconfig
> @@ -520,6 +520,13 @@ config SFRAME_VALIDATION
>  
>  	  If unsure, say N.
>  
> +config ARCH_SUPPORTS_SFRAME_UNWINDER
> +	bool
> +	help
> +	  An architecture can select this if it  enables the sframe (Simple

	                         drop one space^^    (if it)
	
> +	  Frame) unwinder for unwinding kernel stack traces. It uses unwind

	                                                             an unwind

> +	  table that is directly generatedby toolchain based on DWARF CFI information.

	                         generated by the toolchain

> +
>  config HAVE_PERF_REGS
>  	bool
>  	help


> index 265c4461031f..df291d64812f 100644
> --- a/arch/arm64/Kconfig.debug
> +++ b/arch/arm64/Kconfig.debug
> @@ -20,4 +20,17 @@ config ARM64_RELOC_TEST
>  	depends on m
>  	tristate "Relocation testing module"
>  
> +config SFRAME_UNWINDER
> +	bool "Sframe unwinder"
> +	depends on AS_SFRAME3
> +	depends on 64BIT
> +	depends on ARCH_SUPPORTS_SFRAME_UNWINDER
> +	select SFRAME_LOOKUP
> +	help
> +	  This option enables the sframe (Simple Frame) unwinder for unwinding
> +	  kernel stack traces. It uses unwind table that is directly generated

	                          uses an unwind table

> +	  by toolchain based on DWARF CFI information. In, practice this can

	  by the toolchain

> +	  provide more reliable stacktrace results than unwinding with frame
> +	  pointers alone.
> +
>  source "drivers/hwtracing/coresight/Kconfig"


-- 
~Randy


