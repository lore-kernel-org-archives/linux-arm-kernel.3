Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21AFBC3ABDD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 11:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N4L9qnis4sATAo1JSfQWB0FTWBo6YyBEgT3dui7yw7M=; b=GgKzre7pOOXOZwR3jZPjddeBRQ
	UBWc5SsnfJ+1vcDGqY+mHNuzX6C6tJSM//np3AHa/s6tqo5OsHPgThMrq+TKpSn63WHRuYcysTBz8
	A6UvmZemiKrFSVUitsFawOZvI/DPvBgIh/1pQBmL9OgnefINaJadDD6TATgox3Im6bMAh5jZCABzk
	chzGbuZTyEM8kgB2tSHNdL9O/DYBf0l6tQX8NALMoWj407mf19xM6up6bXU+SBEBvDVw02Od9cxPX
	GGV0r4+CyubdpY/wWfWqo3t/CztabSfQN0PyhG+thYggx8VvYi8C1Q9tAlH/VSbaoZutFqk8uP5qc
	IcvliWUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHKzj-0000000CbXr-1bb0;
	Tue, 20 May 2025 11:18:51 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHKmG-0000000CVcE-1cAz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 May 2025 11:04:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 387571516;
	Tue, 20 May 2025 04:04:42 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 397943F6A8;
	Tue, 20 May 2025 04:04:55 -0700 (PDT)
Date: Tue, 20 May 2025 12:04:50 +0100
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
Subject: Re: [PATCH 04/10] arm64/boot: Enable EL2 requirements for
 SPE_FEAT_FDS
Message-ID: <20250520110450.GN412060@e132581.arm.com>
References: <20250506-james-perf-feat_spe_eft-v1-0-dd480e8e4851@linaro.org>
 <20250506-james-perf-feat_spe_eft-v1-4-dd480e8e4851@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250506-james-perf-feat_spe_eft-v1-4-dd480e8e4851@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_040456_515419_F6578618 
X-CRM114-Status: GOOD (  19.20  )
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

On Tue, May 06, 2025 at 12:41:36PM +0100, James Clark wrote:
> SPE data source filtering (optional from Armv8.8) requires that traps to
> the filter register PMSDSFR be disabled. Document the requirements and
> disable the traps if the feature is present.
> 
> Signed-off-by: James Clark <james.clark@linaro.org>
> ---
>  Documentation/arch/arm64/booting.rst | 11 +++++++++++
>  arch/arm64/include/asm/el2_setup.h   | 14 ++++++++++++++
>  2 files changed, 25 insertions(+)
> 
> diff --git a/Documentation/arch/arm64/booting.rst b/Documentation/arch/arm64/booting.rst
> index dee7b6de864f..8da6801da9a0 100644
> --- a/Documentation/arch/arm64/booting.rst
> +++ b/Documentation/arch/arm64/booting.rst
> @@ -404,6 +404,17 @@ Before jumping into the kernel, the following conditions must be met:
>      - HDFGWTR2_EL2.nPMICFILTR_EL0 (bit 3) must be initialised to 0b1.
>      - HDFGWTR2_EL2.nPMUACR_EL1 (bit 4) must be initialised to 0b1.
>  
> +  For CPUs with SPE data source filtering (SPE_FEAT_FDS):

For alignment with Arm ARM:

s/SPE_FEAT_FDS/FEAT_SPE_FDS

> +
> +  - If EL3 is present:
> +
> +    - MDCR_EL3.EnPMS3 (bit 42) must be initialised to 0b1.
> +
> +  - If the kernel is entered at EL1 and EL2 is present:
> +
> +    - HDFGRTR2_EL2.nPMSDSFR_EL1 (bit 19) must be initialised to 0b1.
> +    - HDFGWTR2_EL2.nPMSDSFR_EL1 (bit 19) must be initialised to 0b1.
> +
>    For CPUs with Memory Copy and Memory Set instructions (FEAT_MOPS):
>  
>    - If the kernel is entered at EL1 and EL2 is present:
> diff --git a/arch/arm64/include/asm/el2_setup.h b/arch/arm64/include/asm/el2_setup.h
> index ebceaae3c749..155b45092f5e 100644
> --- a/arch/arm64/include/asm/el2_setup.h
> +++ b/arch/arm64/include/asm/el2_setup.h
> @@ -275,6 +275,20 @@
>  	orr	x0, x0, #HDFGRTR2_EL2_nPMICFILTR_EL0
>  	orr	x0, x0, #HDFGRTR2_EL2_nPMUACR_EL1
>  .Lskip_pmuv3p9_\@:
> +	mrs	x1, id_aa64dfr0_el1
> +	ubfx	x1, x1, #ID_AA64DFR0_EL1_PMSVer_SHIFT, #4
> +	/* If SPE is implemented, we can read PMSIDR and */
> +	cmp	x1, #ID_AA64DFR0_EL1_PMSVer_IMP
> +	b.lt	.Lskip_spefds_\@
> +
> +	mrs_s	x1, SYS_PMSIDR_EL1
> +	and	x1, x1, PMSIDR_EL1_FDS_SHIFT

Should be:

        and     x1, x1, #(1 << PMSIDR_EL1_FDS_SHIFT)

> +	/* if FEAT_SPE_FDS is implemented, */
> +	cbz	x1, .Lskip_spefds_\@
> +	/* disable traps to PMSDSFR. */
> +	orr	x0, x0, #HDFGRTR2_EL2_nPMSDSFR_EL1
> +
> +.Lskip_spefds_\@:
>  	msr_s   SYS_HDFGRTR2_EL2, x0
>  	msr_s   SYS_HDFGWTR2_EL2, x0
>  	msr_s   SYS_HFGRTR2_EL2, xzr
> 
> -- 
> 2.34.1
> 

