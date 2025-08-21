Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A73E3CA0EF8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 15:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ila5bll8MhOiMSF1Nht+/z5/qspQgR3e9SBmqR69s4k=; b=il7+Od6DFiZbcfclyp9g+AYSqx
	aJtqVHG1kgWK1yKHial7sS2k/T8JZVoP4rDB68SB4qGKCFDceMYbMEB1++pb22MOYO9AHGAKZ4m90
	7E+Bm5hkWE1DuatJbqQlLzRScl032lYC+AsYzFk0sjvmbbEdWQtMt5lLL/wAkOH2rIdqJIXHh1RSC
	Pu00RnGgYyxRAG+H8nTk4tErZtkDyjbGectlWKVs6kmkM/KFai38du/Yh/KpPTNxgSWU+9z9kYhHc
	6BRsTsvInNQYE0aZ8PJuOuKMY4zYI4+YfnhYQWwNKCOZeQFpNiPFncFP6xrSzFXdi+YWh1m6zHexB
	lBZ1nmtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up7FY-0000000HNQE-22en;
	Thu, 21 Aug 2025 15:30:48 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up3cj-0000000Gmdt-3pWH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 11:38:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 26002152B;
	Thu, 21 Aug 2025 04:38:19 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EF6043F58B;
	Thu, 21 Aug 2025 04:38:26 -0700 (PDT)
Date: Thu, 21 Aug 2025 12:38:25 +0100
From: Leo Yan <leo.yan@arm.com>
To: Yunseong Kim <ysk@kzalloc.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
	James Clark <james.clark@linaro.org>,
	Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	"Liang, Kan" <kan.liang@linux.intel.com>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] perf: arm64: Sync ESR_ELx_EC_* macros in
 arm64_exception_types.h with esr.h
Message-ID: <20250821113825.GA745271@e132581.arm.com>
References: <20250814151452.618765-2-ysk@kzalloc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250814151452.618765-2-ysk@kzalloc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_043829_995935_9A5B1B2C 
X-CRM114-Status: GOOD (  17.92  )
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

Hi,

On Thu, Aug 14, 2025 at 03:14:53PM +0000, Yunseong Kim wrote:
> Update perf util arm64_exception_types.h to match the exception class
> macros defined in tools/arch/arm64/include/asm/esr.h. This ensures
> consistency between perf tooling and the kernel header definitions for
> ESR_ELx_EC_* values.
> 
> Signed-off-by: Yunseong Kim <ysk@kzalloc.com>

Thanks for working on this.

This patch still misses couple macros, please see below.

> ---
>  tools/perf/arch/arm64/util/arm64_exception_types.h | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/tools/perf/arch/arm64/util/arm64_exception_types.h b/tools/perf/arch/arm64/util/arm64_exception_types.h
> index 27c981ebe401..29931bf19062 100644
> --- a/tools/perf/arch/arm64/util/arm64_exception_types.h
> +++ b/tools/perf/arch/arm64/util/arm64_exception_types.h
> @@ -33,7 +33,7 @@
>  #define ESR_ELx_EC_PAC		(0x09)	/* EL2 and above */
>  /* Unallocated EC: 0x0A - 0x0B */

#define ESR_ELx_EC_OTHER	(0x0A)

>  #define ESR_ELx_EC_CP14_64	(0x0C)
> -/* Unallocated EC: 0x0d */
> +#define ESR_ELx_EC_BTI		(0x0D)
>  #define ESR_ELx_EC_ILL		(0x0E)
>  /* Unallocated EC: 0x0F - 0x10 */
>  #define ESR_ELx_EC_SVC32	(0x11)
> @@ -46,7 +46,10 @@
>  #define ESR_ELx_EC_SYS64	(0x18)
>  #define ESR_ELx_EC_SVE		(0x19)
>  #define ESR_ELx_EC_ERET		(0x1a)	/* EL2 only */
> -/* Unallocated EC: 0x1b - 0x1E */
> +/* Unallocated EC: 0x1B */
> +#define ESR_ELx_EC_FPAC		(0x1C)	/* EL1 and above */
> +#define ESR_ELx_EC_SME		(0x1D)
> +/* Unallocated EC: 0x1E */
>  #define ESR_ELx_EC_IMP_DEF	(0x1f)	/* EL3 only */
>  #define ESR_ELx_EC_IABT_LOW	(0x20)
>  #define ESR_ELx_EC_IABT_CUR	(0x21)
> @@ -55,7 +58,7 @@
>  #define ESR_ELx_EC_DABT_LOW	(0x24)
>  #define ESR_ELx_EC_DABT_CUR	(0x25)
>  #define ESR_ELx_EC_SP_ALIGN	(0x26)
> -/* Unallocated EC: 0x27 */
> +#define ESR_ELx_EC_MOPS		(0x27)
>  #define ESR_ELx_EC_FP_EXC32	(0x28)
>  /* Unallocated EC: 0x29 - 0x2B */
>  #define ESR_ELx_EC_FP_EXC64	(0x2C)

#define ESR_ELx_EC_GCS		(0x2D)

Thanks,
Leo

> -- 
> 2.50.0
> 

