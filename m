Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82C0FC3DA6D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 10:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z9bj0pK/36YxFSeDnQKdvUzzS+P61NQjbOaVJiyLB9k=; b=gubNzRPPqfS2Qy9KuWC4N0fFqH
	w00WesVcWrouQCFmApfqwiw2uHXPpozsud10nje93n0I0xbsMzk+KZyToqbiyA/tTRRVWVbOjlCRe
	cpd624ON8FrK4S7cGBrF4IlH7lyfwxhLkEsWMVcnRVpniGsqV+/M/AkoOvckiJ+p+q+O3bFpJ1IF/
	i5un/dQrZKfYG/nS446NIMSrCxMi/6NJ4+Ixe23Vl26SjxhfVtkxGTBHTzZW0/E7upOj/mFbaYw1F
	4qMbIilOnP5u6in+M+MxjTJWgDIRe5JLqrhtL0gQzzqEU+INK8E1tpBlioT2pCogG4tf+5xfSxv6a
	+pTpwomQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHKE5-0000000CM0X-12b8;
	Tue, 20 May 2025 10:29:37 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHJsI-0000000CHtB-1JEf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 May 2025 10:07:07 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0354E1BC0;
	Tue, 20 May 2025 03:06:52 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0246C3F6A8;
	Tue, 20 May 2025 03:07:05 -0700 (PDT)
Date: Tue, 20 May 2025 11:07:01 +0100
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org, linux-doc@vger.kernel.org,
	kvmarm@lists.linux.dev
Subject: Re: [PATCH 02/10] perf: arm_spe: Support FEAT_SPEv1p4 filters
Message-ID: <20250520100701.GL412060@e132581.arm.com>
References: <20250506-james-perf-feat_spe_eft-v1-0-dd480e8e4851@linaro.org>
 <20250506-james-perf-feat_spe_eft-v1-2-dd480e8e4851@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250506-james-perf-feat_spe_eft-v1-2-dd480e8e4851@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_030706_401778_10D057E8 
X-CRM114-Status: GOOD (  20.71  )
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

On Tue, May 06, 2025 at 12:41:34PM +0100, James Clark wrote:
> FEAT_SPEv1p4 (optional from Armv8.8) adds some new filter bits, so
> remove them from the previous version's RES0 bits using
> PMSEVFR_EL1_RES0_V1P4_EXCL. It also makes some previously available bits
> unavailable again, so add those back using PMSEVFR_EL1_RES0_V1P4_INCL.
> E.g:
> 
>   E[30], bit [30]
>   When FEAT_SPEv1p4 is _not_ implemented ...

Yes, that's the case. I reviewed the bits below one by one, and they
all look correct to me.

> FEAT_SPE_V1P3 has the same filters as V1P2 so explicitly add it to the
> switch.
> 
> Signed-off-by: James Clark <james.clark@linaro.org>

Reviewed-by: Leo Yan <leo.yan@arm.com>

> ---
>  arch/arm64/include/asm/sysreg.h | 7 +++++++
>  drivers/perf/arm_spe_pmu.c      | 5 ++++-
>  2 files changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/include/asm/sysreg.h b/arch/arm64/include/asm/sysreg.h
> index 2639d3633073..e24042e914a4 100644
> --- a/arch/arm64/include/asm/sysreg.h
> +++ b/arch/arm64/include/asm/sysreg.h
> @@ -354,6 +354,13 @@
>  	(PMSEVFR_EL1_RES0_IMP & ~(BIT_ULL(18) | BIT_ULL(17) | BIT_ULL(11)))
>  #define PMSEVFR_EL1_RES0_V1P2	\
>  	(PMSEVFR_EL1_RES0_V1P1 & ~BIT_ULL(6))
> +#define PMSEVFR_EL1_RES0_V1P4_EXCL \
> +	(BIT_ULL(2) | BIT_ULL(4) | GENMASK_ULL(10, 8) | GENMASK_ULL(23, 19))
> +#define PMSEVFR_EL1_RES0_V1P4_INCL \
> +	(GENMASK_ULL(31, 26))
> +#define PMSEVFR_EL1_RES0_V1P4	\
> +	(PMSEVFR_EL1_RES0_V1P4_INCL | \
> +	(PMSEVFR_EL1_RES0_V1P2 & ~PMSEVFR_EL1_RES0_V1P4_EXCL))
>  
>  /* Buffer error reporting */
>  #define PMBSR_EL1_FAULT_FSC_SHIFT	PMBSR_EL1_MSS_SHIFT
> diff --git a/drivers/perf/arm_spe_pmu.c b/drivers/perf/arm_spe_pmu.c
> index 3efed8839a4e..d9f6d229dce8 100644
> --- a/drivers/perf/arm_spe_pmu.c
> +++ b/drivers/perf/arm_spe_pmu.c
> @@ -701,9 +701,12 @@ static u64 arm_spe_pmsevfr_res0(u16 pmsver)
>  	case ID_AA64DFR0_EL1_PMSVer_V1P1:
>  		return PMSEVFR_EL1_RES0_V1P1;
>  	case ID_AA64DFR0_EL1_PMSVer_V1P2:
> +	case ID_AA64DFR0_EL1_PMSVer_V1P3:
> +		return PMSEVFR_EL1_RES0_V1P2;
> +	case ID_AA64DFR0_EL1_PMSVer_V1P4:
>  	/* Return the highest version we support in default */
>  	default:
> -		return PMSEVFR_EL1_RES0_V1P2;
> +		return PMSEVFR_EL1_RES0_V1P4;
>  	}
>  }
>  
> 
> -- 
> 2.34.1
> 

