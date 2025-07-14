Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4198AC83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 14:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nZNLxJE5074iW2AdF0fYSL1uiuKPt3IvDV5Ff8wSngM=; b=j8TWAnwt/Jo64Ow/SaCNKsHiXu
	EZeuOfsFrPy24TGSCqJWcHiORq+KD1GOhcD4BcY3oUiZzJJiBMMdQ89MMEAc9jHhAmfndmx0WYGp4
	bgyx+K8j/wJy8VkfVSugVXxtwWE5g+AusX+WHNopIjGdgSmvfl7paKb1CADC/ziTY4P4FjrF8TKzF
	ZKHi48uf/yrwWZ552U/7/S6YViAUDK5eV+2IhsxRYUtWg54sR5jR3X9knLZnvJTQeqdspRD4UJj+E
	bMU3AKSXNW6kcpMziveZBGNj5O6jquAp0L8Tt8are0KSLB0WrYXFujt7KvXcmfB3HV0N/F6VEdL2z
	rYKm3CqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubJrb-00000002QLp-0FA8;
	Mon, 14 Jul 2025 14:09:03 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubJe6-00000002NVW-3CBa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 13:55:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 0CAF6A5713C;
	Mon, 14 Jul 2025 13:55:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6438C4CEED;
	Mon, 14 Jul 2025 13:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752501305;
	bh=SsDJZedGWgEi2BKmb66mOY5op0SJ42iRGSbd4YnIV8w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Kdl3S+vLRtZWBuqnyVvLDBGEiSQ8tPChA9ba9F6FokLDS+mmIPv17jkqYGxc7Qx2B
	 cD7S5UlGpnMsdqM0tkC/edGc2W+EBHd3o1Tw4nM4WFrM64PxIewSARZPHleeTtIUp5
	 1h1qC7duFHHetvOrGA1YcArcNWi4AJKfltmgQXcJkSkHibFhwUDdZoufD43GwEhYaN
	 sOVLKO4DanJ+LB+KnRbIPEl6YxXWXwdqB446mBP8IST/mMcHYjT2QBJLkQ7ubB40yn
	 hUbfva7GkltBHybjFJhHFvJagzFIbIm5JYxkbzic5uzE/JdgFQ3UgYObJqN4qCXr7Y
	 rjVxp5L6kZnyA==
Date: Mon, 14 Jul 2025 14:54:58 +0100
From: Will Deacon <will@kernel.org>
To: James Clark <james.clark@linaro.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>, leo.yan@arm.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org, linux-doc@vger.kernel.org,
	kvmarm@lists.linux.dev
Subject: Re: [PATCH v3 04/10] arm64/boot: Enable EL2 requirements for
 SPE_FEAT_FDS
Message-ID: <aHUMMk9JUdK6luLN@willie-the-truck>
References: <20250605-james-perf-feat_spe_eft-v3-0-71b0c9f98093@linaro.org>
 <20250605-james-perf-feat_spe_eft-v3-4-71b0c9f98093@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250605-james-perf-feat_spe_eft-v3-4-71b0c9f98093@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_065506_923710_81FC4299 
X-CRM114-Status: GOOD (  19.96  )
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

On Thu, Jun 05, 2025 at 11:49:02AM +0100, James Clark wrote:
> SPE data source filtering (optional from Armv8.8) requires that traps to
> the filter register PMSDSFR be disabled. Document the requirements and
> disable the traps if the feature is present.
> 
> Tested-by: Leo Yan <leo.yan@arm.com>
> Signed-off-by: James Clark <james.clark@linaro.org>
> ---
>  Documentation/arch/arm64/booting.rst | 11 +++++++++++
>  arch/arm64/include/asm/el2_setup.h   | 14 ++++++++++++++
>  2 files changed, 25 insertions(+)
> 
> diff --git a/Documentation/arch/arm64/booting.rst b/Documentation/arch/arm64/booting.rst
> index dee7b6de864f..abd75085a239 100644
> --- a/Documentation/arch/arm64/booting.rst
> +++ b/Documentation/arch/arm64/booting.rst
> @@ -404,6 +404,17 @@ Before jumping into the kernel, the following conditions must be met:
>      - HDFGWTR2_EL2.nPMICFILTR_EL0 (bit 3) must be initialised to 0b1.
>      - HDFGWTR2_EL2.nPMUACR_EL1 (bit 4) must be initialised to 0b1.
>  
> +  For CPUs with SPE data source filtering (FEAT_SPE_FDS):
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
> index 1e7c7475e43f..02b4a7fc016e 100644
> --- a/arch/arm64/include/asm/el2_setup.h
> +++ b/arch/arm64/include/asm/el2_setup.h
> @@ -279,6 +279,20 @@
>  	orr	x0, x0, #HDFGRTR2_EL2_nPMICFILTR_EL0
>  	orr	x0, x0, #HDFGRTR2_EL2_nPMUACR_EL1
>  .Lskip_pmuv3p9_\@:
> +	mrs	x1, id_aa64dfr0_el1
> +	ubfx	x1, x1, #ID_AA64DFR0_EL1_PMSVer_SHIFT, #4
> +	/* If SPE is implemented, */
> +	cmp	x1, #ID_AA64DFR0_EL1_PMSVer_IMP
> +	b.lt	.Lskip_spefds_\@
> +	/* we can read PMSIDR and */
> +	mrs_s	x1, SYS_PMSIDR_EL1
> +	and	x1, x1,  #PMSIDR_EL1_FDS
> +	/* if FEAT_SPE_FDS is implemented, */
> +	cbz	x1, .Lskip_spefds_\@
> +	/* disable traps to PMSDSFR. */
> +	orr	x0, x0, #HDFGRTR2_EL2_nPMSDSFR_EL1

Why is this being done here rather than alongside the existing SPE
configuration of HDFGRTR_EL2 and HDFGWTR_EL2 near the start of
__init_el2_fgt?

Will

