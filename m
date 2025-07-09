Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 571ECC83F09
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 11:32:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MMWv5xacfm3MGUvSWT0MxW0DxvOuVb5A21JgnyqTAQw=; b=MH8KQ1KjDz3bJRARMER3YWUkmb
	pikrfhtrRH5kHO2y1v2jCO/z/syTXLoXLBlFgx9rD4jjQZNlvkEDbvCC2DbfwiU66eocX7hN1qW7b
	JyQRJgAEIJXY0LZMs5uAdVyQb5H0nMv17EDcHIB/n3bQGytejrbr+0SB7ds2fTf3TArbx0pn0ykUx
	bKUFP7KyALs0bfwCHIpImqirBdDprn8v7czPI1YYSfmYHmsEE6Gh+q80xV0ufTy03p2WAqE5/R/4u
	CBNu83y3LP9VS1QlFT3mEQU3G9g/mT5vd4aSRWL4QCDakv+o0lPO1kQiUmL6wHn7oW7VnD/syDPkb
	XGCnKM4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZT2B-00000008Vgj-18yd;
	Wed, 09 Jul 2025 11:32:19 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZRVu-00000008BuV-2Ak6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 09:54:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1CB3B153B;
	Wed,  9 Jul 2025 02:54:40 -0700 (PDT)
Received: from e124191.cambridge.arm.com (e124191.cambridge.arm.com [10.1.197.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 17D243F694;
	Wed,  9 Jul 2025 02:54:47 -0700 (PDT)
Date: Wed, 9 Jul 2025 10:53:57 +0100
From: Joey Gouly <joey.gouly@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
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
Subject: Re: [PATCH v3 05/10] KVM: arm64: Add trap configs for PMSDSFR_EL1
Message-ID: <20250709095357.GA2715835@e124191.cambridge.arm.com>
References: <20250605-james-perf-feat_spe_eft-v3-0-71b0c9f98093@linaro.org>
 <20250605-james-perf-feat_spe_eft-v3-5-71b0c9f98093@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250605-james-perf-feat_spe_eft-v3-5-71b0c9f98093@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_025454_641606_4B3A1A66 
X-CRM114-Status: GOOD (  18.21  )
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

Hi James!

On Thu, Jun 05, 2025 at 11:49:03AM +0100, James Clark wrote:
> SPE data source filtering (SPE_FEAT_FDS) adds a new register
> PMSDSFR_EL1, add the trap configs for it. PMSNEVFR_EL1 was also missing
> its VNCR offset so add it along with PMSDSFR_EL1.
> 

A (well behaving) guest won't try access this because:
The presence of PMSDSFR_EL1 is checked by accessing PMSDSFR_EL1.FDS, which is
currently `undef_access` and we hide SPE from the guest in
read_sanitised_id_aa64dfr0_el1().

So makes sense it is just undef!

Reviewed-by: Joey Gouly <joey.gouly@arm.com>

Thanks,
Joey

> Tested-by: Leo Yan <leo.yan@arm.com>
> Signed-off-by: James Clark <james.clark@linaro.org>
> ---
>  arch/arm64/include/asm/vncr_mapping.h | 2 ++
>  arch/arm64/kvm/emulate-nested.c       | 1 +
>  arch/arm64/kvm/sys_regs.c             | 1 +
>  3 files changed, 4 insertions(+)
> 
> diff --git a/arch/arm64/include/asm/vncr_mapping.h b/arch/arm64/include/asm/vncr_mapping.h
> index 6f556e993644..dba0e58a5fac 100644
> --- a/arch/arm64/include/asm/vncr_mapping.h
> +++ b/arch/arm64/include/asm/vncr_mapping.h
> @@ -92,6 +92,8 @@
>  #define VNCR_PMSICR_EL1         0x838
>  #define VNCR_PMSIRR_EL1         0x840
>  #define VNCR_PMSLATFR_EL1       0x848
> +#define VNCR_PMSNEVFR_EL1       0x850
> +#define VNCR_PMSDSFR_EL1        0x858
>  #define VNCR_TRFCR_EL1          0x880
>  #define VNCR_MPAM1_EL1          0x900
>  #define VNCR_MPAMHCR_EL2        0x930
> diff --git a/arch/arm64/kvm/emulate-nested.c b/arch/arm64/kvm/emulate-nested.c
> index 3a384e9660b8..60bd8b7f0e5b 100644
> --- a/arch/arm64/kvm/emulate-nested.c
> +++ b/arch/arm64/kvm/emulate-nested.c
> @@ -1174,6 +1174,7 @@ static const struct encoding_to_trap_config encoding_to_cgt[] __initconst = {
>  	SR_TRAP(SYS_PMSIRR_EL1,		CGT_MDCR_TPMS),
>  	SR_TRAP(SYS_PMSLATFR_EL1,	CGT_MDCR_TPMS),
>  	SR_TRAP(SYS_PMSNEVFR_EL1,	CGT_MDCR_TPMS),
> +	SR_TRAP(SYS_PMSDSFR_EL1,	CGT_MDCR_TPMS),
>  	SR_TRAP(SYS_TRFCR_EL1,		CGT_MDCR_TTRF),
>  	SR_TRAP(SYS_TRBBASER_EL1,	CGT_MDCR_E2TB),
>  	SR_TRAP(SYS_TRBLIMITR_EL1,	CGT_MDCR_E2TB),
> diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
> index a6cf2888d150..4a88ba15c7df 100644
> --- a/arch/arm64/kvm/sys_regs.c
> +++ b/arch/arm64/kvm/sys_regs.c
> @@ -3008,6 +3008,7 @@ static const struct sys_reg_desc sys_reg_descs[] = {
>  	{ SYS_DESC(SYS_PMBLIMITR_EL1), undef_access },
>  	{ SYS_DESC(SYS_PMBPTR_EL1), undef_access },
>  	{ SYS_DESC(SYS_PMBSR_EL1), undef_access },
> +	{ SYS_DESC(SYS_PMSDSFR_EL1), undef_access },
>  	/* PMBIDR_EL1 is not trapped */
>  
>  	{ PMU_SYS_REG(PMINTENSET_EL1),
> 
> -- 
> 2.34.1
> 

