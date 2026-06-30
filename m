Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0A47C43327
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 07:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kYmrzxOEPvT3OyP0vhJQ5SKhqNCV3WJuMUtDoWrL/7Q=; b=i3ipl+1jNiUwQWMjLHvJLP1zRt
	MXc7kB7Mchx0/qGVIRVGpoSElamoF1qx7nc32sZLSFluOOluYxF8becxhfafN2OQYuKpAcZ7YcBsi
	HldNeYmEPno6zbwtjYCT/wmGRS1zcCsB/ESyzshUC2zeZJYR4+/pdSqx+UZU6IazMtyjIZGR1y+HR
	CputQppcecn5ojg+w4jJGubdAa7kRgdyFfWm467NR+pjF/kva4k6d9FWgWiS0sFBJGzhlXBcbeAvI
	IYvg7DbbwUd7aCfuSGCmzB/tnfUM5pGv1e7o6T6K95hFpcaZRCALt4oiIC/5qeCUEOXUKkTSvTgk9
	M8L9Y2BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weT2F-0000000G76V-35FP;
	Tue, 30 Jun 2026 07:37:35 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weT2D-0000000G768-1vaT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 07:37:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 78FA522D9;
	Tue, 30 Jun 2026 00:37:27 -0700 (PDT)
Received: from arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 520DC3F836;
	Tue, 30 Jun 2026 00:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782805051; bh=BN8eiYGkiyP6NpiAY3OQR1hcH4Jl3rwH7rluJn1WxMM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pBy091Hnfvv9l9mGlh0rKR/O/KLHwrySnnYrWgsKBCmu8d5WQ7YnVf/ly4RhFOTs6
	 asY+FaAV4h5C7VgAuTJf64k4sKcr4SbVGTDF8zkxqpWR+owxJxbNrIUh/qDjocXf6x
	 nDMmvgtjP4i3CXUyFvpqW7e06TVNLLaA7Yl15CxE=
Date: Tue, 30 Jun 2026 09:37:24 +0200
From: Beata Michalska <beata.michalska@arm.com>
To: Pengjie Zhang <zhangpengjie2@huawei.com>
Cc: catalin.marinas@arm.com, will@kernel.org, rafael@kernel.org,
	lenb@kernel.org, robert.moore@intel.com, zhenglifeng1@huawei.com,
	zhanjie9@hisilicon.com, sumitg@nvidia.com, cuiyunhui@bytedance.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org, acpica-devel@lists.linux.dev,
	linuxarm@huawei.com, jonathan.cameron@huawei.com,
	prime.zeng@hisilicon.com, wanghuiqiang@huawei.com,
	xuwei5@huawei.com, lihuisong@huawei.com, yubowen8@huawei.com,
	wangzhi12@huawei.com
Subject: Re: [PATCH 1/2] ACPI: CPPC: add paired FFH feedback-counter read hook
Message-ID: <akNyNKSGf5yKwtwN@arm.com>
References: <20260410094145.4132082-1-zhangpengjie2@huawei.com>
 <20260410094145.4132082-2-zhangpengjie2@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260410094145.4132082-2-zhangpengjie2@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_003733_594737_CB622F03 
X-CRM114-Status: GOOD (  28.63  )
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

Gonna be a bit picky with wording so do bear with me ...

On Fri, Apr 10, 2026 at 05:41:44PM +0800, Pengjie Zhang wrote:
> cppc_get_perf_ctrs() reads the delivered and reference performance
> counters one at a time.
> 
> Allow architectures to provide both FFH feedback counters in one
> operation when that either narrows the sampling window or avoids extra
> cross-CPU reads. Add a small FFH-specific hook for that case and fall
> back to the existing per-register reads when unsupported.
> 
> Signed-off-by: Pengjie Zhang <zhangpengjie2@huawei.com>
> ---
>  drivers/acpi/cppc_acpi.c | 58 ++++++++++++++++++++++++++++++++++++----
>  include/acpi/cppc_acpi.h |  7 +++++
>  2 files changed, 60 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/acpi/cppc_acpi.c b/drivers/acpi/cppc_acpi.c
> index 2e91c5a97761..7b3e8b0597dc 100644
> --- a/drivers/acpi/cppc_acpi.c
> +++ b/drivers/acpi/cppc_acpi.c
> @@ -988,6 +988,23 @@ int __weak cpc_read_ffh(int cpunum, struct cpc_reg *reg, u64 *val)
>  	return -ENOTSUPP;
>  }
>  
> +/**
> + * cpc_read_ffh_fb_ctrs() - Read FFH feedback counters together
> + * @cpunum:	CPU number to read
This reads bit awkward. Target CPU maybe ?
> + * @reg1:	first CPPC register information
> + * @val1:	place holder for first return value
> + * @reg2:	second CPPC register information
> + * @val2:	place holder for second return value
> + *
> + * Return: 0 for success and error code
0 on success, error code otherwise ?
> + */
> +int __weak cpc_read_ffh_fb_ctrs(int cpunum, struct cpc_reg *reg1,
> +				u64 *val1, struct cpc_reg *reg2, u64 *val2)
> +{
> +	return -EOPNOTSUPP;
> +}
> +
> +
>  /**
>   * cpc_write_ffh() - Write FFH register
>   * @cpunum:	CPU number to write
> @@ -1504,6 +1521,40 @@ bool cppc_perf_ctrs_in_pcc(void)
>  }
>  EXPORT_SYMBOL_GPL(cppc_perf_ctrs_in_pcc);
>  
> +static int cppc_read_perf_fb_ctrs(int cpunum,
> +				  struct cpc_register_resource *delivered_reg,
> +				  struct cpc_register_resource *reference_reg,
> +				  u64 *delivered, u64 *reference)
The signature here differs from cpc_read_ffh_fb_ctrs.
It's not an issue but it might be good idea to stay consistent maybe ?
Also ... was about to suggest to stick to either perf_ctrs or feedback_ctrs
in naming but it seems the is no clear pattern  withint the file
...
> +{
> +	int ret;
> +
> +	/*
> +	 * For FFH feedback counters, try a paired read first to reduce
> +	 * sampling skew between delivered and reference counters. Fall
> +	 * back to the existing per-register reads if unsupported.
> +	 */
> +	if (CPC_IN_FFH(delivered_reg) && CPC_IN_FFH(reference_reg)) {
> +		ret = cpc_read_ffh_fb_ctrs(cpunum,
> +					&delivered_reg->cpc_entry.reg, delivered,
> +					&reference_reg->cpc_entry.reg, reference);
> +		if (!ret)
> +			return 0;
> +
> +		if (ret != -EOPNOTSUPP)
> +			return ret;
Shouldn't this one be enough ? Don't think you need the first condition.
> +	}
> +
> +	ret = cpc_read(cpunum, delivered_reg, delivered);
> +	if (ret)
> +		return ret;
> +
> +	ret = cpc_read(cpunum, reference_reg, reference);
> +	if (ret)
> +		return ret;
As you are not doing anything with 'ret' this could just be:
	ret = cpc_read(cpunum, delivered_reg, delivered);
	if (ret) return ret;
	return cpc_read(cpunum, reference_reg, reference);

Though that's minor.

---
BR
Beata
> +
> +	return 0;
> +}
> +
>  /**
>   * cppc_get_perf_ctrs - Read a CPU's performance feedback counters.
>   * @cpunum: CPU from which to read counters.
> @@ -1547,11 +1598,8 @@ int cppc_get_perf_ctrs(int cpunum, struct cppc_perf_fb_ctrs *perf_fb_ctrs)
>  		}
>  	}
>  
> -	ret = cpc_read(cpunum, delivered_reg, &delivered);
> -	if (ret)
> -		goto out_err;
> -
> -	ret = cpc_read(cpunum, reference_reg, &reference);
> +	ret = cppc_read_perf_fb_ctrs(cpunum, delivered_reg, reference_reg,
> +				     &delivered, &reference);
>  	if (ret)
>  		goto out_err;
>  
> diff --git a/include/acpi/cppc_acpi.h b/include/acpi/cppc_acpi.h
> index d1f02ceec4f9..006b42dbbd4b 100644
> --- a/include/acpi/cppc_acpi.h
> +++ b/include/acpi/cppc_acpi.h
> @@ -172,6 +172,8 @@ extern int cppc_get_transition_latency(int cpu);
>  extern bool cpc_ffh_supported(void);
>  extern bool cpc_supported_by_cpu(void);
>  extern int cpc_read_ffh(int cpunum, struct cpc_reg *reg, u64 *val);
> +extern int cpc_read_ffh_fb_ctrs(int cpu, struct cpc_reg *reg1, u64 *val1,
> +				struct cpc_reg *reg2, u64 *val2);
>  extern int cpc_write_ffh(int cpunum, struct cpc_reg *reg, u64 val);
>  extern int cppc_get_epp_perf(int cpunum, u64 *epp_perf);
>  extern int cppc_set_epp_perf(int cpu, struct cppc_perf_ctrls *perf_ctrls, bool enable);
> @@ -246,6 +248,11 @@ static inline int cpc_read_ffh(int cpunum, struct cpc_reg *reg, u64 *val)
>  {
>  	return -EOPNOTSUPP;
>  }
> +static inline int cpc_read_ffh_fb_ctrs(int cpu, struct cpc_reg *reg1, u64 *val1,
> +				       struct cpc_reg *reg2, u64 *val2)
> +{
> +	return -EOPNOTSUPP;
> +}
>  static inline int cpc_write_ffh(int cpunum, struct cpc_reg *reg, u64 val)
>  {
>  	return -EOPNOTSUPP;
> -- 
> 2.33.0
> 

