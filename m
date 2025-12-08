Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E9CBD3B7E2
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Dec 2025 16:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GA/VYlEoGLkOcN0CPKzR9OLBT5QzOpZXf6zx91UqWu4=; b=ZrMlKUKC7w9F0mLK7xux220FvH
	AKX/PA76myCA6Nb6VRV6QusbXxt1lKEB2djndVbk6qEealkwp4EGlCn3gaWRg2VFf/K5P5g9FRKxt
	gKlZKGaWzkx+lUKB6CCZmo+hbe23eY6y63tXwFiPqsFuMjetwXNOh1K+xCidcOIL6ejkhvsWF4FN8
	uiu5rPyCl1Kxq16Uxql9PFBHB2jQXYRBV2BbVsYd8DaMzr5oeDQ8/eiN5tuRkjFmkyQZMggdTq3Vp
	WGDcMA9B9H1IN95CCrAW32/KW/Vl6g12b0raIOVFYn9pF27DXVjMvAKuyX9f11guKLoPg48Y2z3Ko
	9OO6Kq8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSdvj-0000000DIM3-0Q2a;
	Mon, 08 Dec 2025 16:17:43 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSdvg-0000000DIKz-0KC9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Dec 2025 16:17:41 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C0FD41691;
	Mon,  8 Dec 2025 08:17:28 -0800 (PST)
Received: from arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 80E0D3F740;
	Mon,  8 Dec 2025 08:17:32 -0800 (PST)
Date: Mon, 8 Dec 2025 17:17:30 +0100
From: Beata Michalska <beata.michalska@arm.com>
To: Jie Zhan <zhanjie9@hisilicon.com>
Cc: viresh.kumar@linaro.org, rafael@kernel.org, ionela.voinescu@arm.com,
	pierre.gondois@arm.com, zhenglifeng1@huawei.com,
	linux-pm@vger.kernel.org, linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linuxarm@huawei.com,
	jonathan.cameron@huawei.com, prime.zeng@hisilicon.com,
	yubowen8@huawei.com, lihuisong@huawei.com, zhangpengjie2@huawei.com,
	wangzhi12@huawei.com
Subject: Re: [PATCH v4 1/3] ACPI: CPPC: Factor out and export per-cpu
 cppc_perf_ctrs_in_pcc_cpu()
Message-ID: <aTb6Gvzvc9C7vnVP@arm.com>
References: <20251203032422.3232957-1-zhanjie9@hisilicon.com>
 <20251203032422.3232957-2-zhanjie9@hisilicon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251203032422.3232957-2-zhanjie9@hisilicon.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251208_081740_246491_FBE3EBD3 
X-CRM114-Status: GOOD (  21.98  )
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

On Wed, Dec 03, 2025 at 11:24:20AM +0800, Jie Zhan wrote:
> Factor out cppc_perf_ctrs_in_pcc_cpu() for checking whether per-cpu CPC
> regs are defined in PCC channels, and export it out for further use.
> 
> Signed-off-by: Jie Zhan <zhanjie9@hisilicon.com>
> ---
>  drivers/acpi/cppc_acpi.c | 45 +++++++++++++++++++++-------------------
>  include/acpi/cppc_acpi.h |  5 +++++
>  2 files changed, 29 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/acpi/cppc_acpi.c b/drivers/acpi/cppc_acpi.c
> index 3bdeeee3414e..aa80dbcf42c0 100644
> --- a/drivers/acpi/cppc_acpi.c
> +++ b/drivers/acpi/cppc_acpi.c
> @@ -1422,6 +1422,29 @@ int cppc_get_perf_caps(int cpunum, struct cppc_perf_caps *perf_caps)
>  }
>  EXPORT_SYMBOL_GPL(cppc_get_perf_caps);
>  
> +bool cppc_perf_ctrs_in_pcc_cpu(unsigned int cpu)
> +{
> +	struct cpc_desc *cpc_desc = per_cpu(cpc_desc_ptr, cpu);
> +	struct cpc_register_resource *ref_perf_reg;
> +
> +	/*
> +	 * If reference perf register is not supported then we should use the
> +	 * nominal perf value
> +	 */
> +	ref_perf_reg = &cpc_desc->cpc_regs[REFERENCE_PERF];
> +	if (!CPC_SUPPORTED(ref_perf_reg))
> +		ref_perf_reg = &cpc_desc->cpc_regs[NOMINAL_PERF];
> +
> +	if (CPC_IN_PCC(&cpc_desc->cpc_regs[DELIVERED_CTR]) ||
> +	    CPC_IN_PCC(&cpc_desc->cpc_regs[REFERENCE_CTR]) ||
> +	    CPC_IN_PCC(&cpc_desc->cpc_regs[CTR_WRAP_TIME]) ||
> +	    CPC_IN_PCC(ref_perf_reg))
> +		return true;
> +
> +	return false;
> +}
> +EXPORT_SYMBOL_GPL(cppc_perf_ctrs_in_pcc_cpu);
It is minor, but I would prefer the earlier version when we grab the reference
performance reg only when none of the other regs is in the PCC.

---
BR
Beata
> +
>  /**
>   * cppc_perf_ctrs_in_pcc - Check if any perf counters are in a PCC region.
>   *
> @@ -1436,27 +1459,7 @@ bool cppc_perf_ctrs_in_pcc(void)
>  	int cpu;
>  
>  	for_each_online_cpu(cpu) {
> -		struct cpc_register_resource *ref_perf_reg;
> -		struct cpc_desc *cpc_desc;
> -
> -		cpc_desc = per_cpu(cpc_desc_ptr, cpu);
> -
> -		if (CPC_IN_PCC(&cpc_desc->cpc_regs[DELIVERED_CTR]) ||
> -		    CPC_IN_PCC(&cpc_desc->cpc_regs[REFERENCE_CTR]) ||
> -		    CPC_IN_PCC(&cpc_desc->cpc_regs[CTR_WRAP_TIME]))
> -			return true;
> -
> -
> -		ref_perf_reg = &cpc_desc->cpc_regs[REFERENCE_PERF];
> -
> -		/*
> -		 * If reference perf register is not supported then we should
> -		 * use the nominal perf value
> -		 */
> -		if (!CPC_SUPPORTED(ref_perf_reg))
> -			ref_perf_reg = &cpc_desc->cpc_regs[NOMINAL_PERF];
> -
> -		if (CPC_IN_PCC(ref_perf_reg))
> +		if (cppc_perf_ctrs_in_pcc_cpu(cpu))
>  			return true;
>  	}
>  
> diff --git a/include/acpi/cppc_acpi.h b/include/acpi/cppc_acpi.h
> index 13fa81504844..4bcdcaf8bf2c 100644
> --- a/include/acpi/cppc_acpi.h
> +++ b/include/acpi/cppc_acpi.h
> @@ -154,6 +154,7 @@ extern int cppc_get_perf_ctrs(int cpu, struct cppc_perf_fb_ctrs *perf_fb_ctrs);
>  extern int cppc_set_perf(int cpu, struct cppc_perf_ctrls *perf_ctrls);
>  extern int cppc_set_enable(int cpu, bool enable);
>  extern int cppc_get_perf_caps(int cpu, struct cppc_perf_caps *caps);
> +extern bool cppc_perf_ctrs_in_pcc_cpu(unsigned int cpu);
>  extern bool cppc_perf_ctrs_in_pcc(void);
>  extern unsigned int cppc_perf_to_khz(struct cppc_perf_caps *caps, unsigned int perf);
>  extern unsigned int cppc_khz_to_perf(struct cppc_perf_caps *caps, unsigned int freq);
> @@ -204,6 +205,10 @@ static inline int cppc_get_perf_caps(int cpu, struct cppc_perf_caps *caps)
>  {
>  	return -EOPNOTSUPP;
>  }
> +static inline bool cppc_perf_ctrs_in_pcc_cpu(unsigned int cpu)
> +{
> +	return false;
> +}
>  static inline bool cppc_perf_ctrs_in_pcc(void)
>  {
>  	return false;
> -- 
> 2.33.0
> 

