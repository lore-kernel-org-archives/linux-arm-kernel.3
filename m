Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F97CC44501
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 13:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lgPcoGmsOC9rLv37U3EN87lq4X7VZPTEZLuXqo8pSKY=; b=FRxRrj2Av7PuvkmEIQrpzEp83X
	XY+/IMk3zTKKvrhF/qvOPOsB1n4yTZhCsezWHL/E0qlPJhhpcXgJFzL2jC5nZVOVmksZmznYgC6he
	nz7vB7GchrkWnSk5JqHFmyj3NRt2864QwbhufHRM5SCYbrcTbRQLl6MKwjjOcoEgZlJmN971T2yb9
	2nwhB+/wT6j4jfZr4d3wANhELt6IJ/AK6l7GjbIEaTjcMo31qMhVybptld7nR+1NgYqaXo8+klvSW
	jCEeVmgfo8agIVEtq+QPsamJr0Gktm4Xuo4gG9gxLdGYcHaXMmTPNFSVCXOeufOi9XEQ3GwNMwoxl
	2uu4EWbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiBOh-000000051Zo-0aVi;
	Fri, 10 Jul 2026 13:36:07 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiBOe-000000051Yd-2XA3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 13:36:06 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 39421176A;
	Fri, 10 Jul 2026 06:35:56 -0700 (PDT)
Received: from arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B1F2B3F66F;
	Fri, 10 Jul 2026 06:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783690560; bh=O6yfiHmVjh++kj3mIFoELPTa5h6lT7CwpxKruuuvLMs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GOhfvWktQwk8Z6pT+9xg9fGgKpYRyGuz87RGFGcQRsoQU9yRQL/g8kW4uoBdmwIMj
	 9BcXC/cGWW13telbDkMt7/LPm4bToQIOMAo/WnFLixmG8wuOriEbn36MPX6ezToN8f
	 Gj4d3NcjYxIlNJ9i6dP1Kwu/VH91CgYwwxQ52VKk=
Date: Fri, 10 Jul 2026 15:35:48 +0200
From: Beata Michalska <beata.michalska@arm.com>
To: Jeremy Linton <jeremy.linton@arm.com>
Cc: Pengjie Zhang <zhangpengjie2@huawei.com>, catalin.marinas@arm.com,
	will@kernel.org, rafael@kernel.org, lenb@kernel.org,
	saket.dumbre@intel.com, zhenglifeng1@huawei.com, sumitg@nvidia.com,
	zhanjie9@hisilicon.com, geert+renesas@glider.be,
	cuiyunhui@bytedance.com, vanshikonda@os.amperecomputing.com,
	ionela.voinescu@arm.com, viresh.kumar@linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org, acpica-devel@lists.linux.dev,
	linuxarm@huawei.com, prime.zeng@hisilicon.com,
	wanghuiqiang@huawei.com, xuwei5@huawei.com, lihuisong@huawei.com,
	yubowen8@huawei.com, wangzhi12@huawei.com
Subject: Re: [PATCH v2 2/2] arm64: topology: read CPPC FFH feedback counters
 in one operation
Message-ID: <alD1NDEpHHLZtf9g@arm.com>
References: <20260708082818.808041-1-zhangpengjie2@huawei.com>
 <20260708082818.808041-3-zhangpengjie2@huawei.com>
 <fcf60ce5-7e8c-431d-aea9-218da5445fb5@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fcf60ce5-7e8c-431d-aea9-218da5445fb5@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_063604_718773_AC7C978E 
X-CRM114-Status: GOOD (  26.64  )
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

On Thu, Jul 09, 2026 at 01:11:13AM -0500, Jeremy Linton wrote:
> Hi,
> 
> On 7/8/26 3:28 AM, Pengjie Zhang wrote:
> > arm64 implements CPPC FFH feedback-counter reads using AMU counters.
> > Because those counters must be sampled on the target CPU, reading the
> > delivered and reference counters separately widens the observation window
> > between them.
> > 
> > Implement the paired FFH feedback-counter read hook on arm64 and sample
> > both AMU counters together before decoding the requested CPC register
> > values.
> > 
> > Also factor the FFH bitfield extraction logic into a helper and reuse
> > it from the existing single-counter FFH read path.
> > 
> > Tested-by: Sumit Gupta <sumitg@nvidia.com>
> > Reviewed-by: Sumit Gupta <sumitg@nvidia.com>
> > Tested-by: Vanshidhar Konda <vanshikonda@os.amperecomputing.com>
> > Reviewed-by: Vanshidhar Konda <vanshikonda@os.amperecomputing.com>
> > Signed-off-by: Pengjie Zhang <zhangpengjie2@huawei.com>
> > ---
> >   arch/arm64/kernel/topology.c | 92 ++++++++++++++++++++++++++++++++----
> >   1 file changed, 84 insertions(+), 8 deletions(-)
> > 
> > diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
> > index b32f13358fbb..d28438f8b83f 100644
> > --- a/arch/arm64/kernel/topology.c
> > +++ b/arch/arm64/kernel/topology.c
> > @@ -373,6 +373,16 @@ core_initcall(init_amu_fie);
> >   #ifdef CONFIG_ACPI_CPPC_LIB
> >   #include <acpi/cppc_acpi.h>
> > +struct amu_ffh_ctrs {
> > +	u64 corecnt;
> > +	u64 constcnt;
> > +};
> > +
> > +enum cpc_ffh_ctr_id {
> > +	CPC_FFH_CTR_CORE  = 0x0,
> > +	CPC_FFH_CTR_CONST = 0x1,
> > +};
> > +
> >   static void cpu_read_corecnt(void *val)
> >   {
> >   	/*
> > @@ -397,7 +407,7 @@ static void cpu_read_constcnt(void *val)
> >   }
> >   static inline
> > -int counters_read_on_cpu(int cpu, smp_call_func_t func, u64 *val)
> > +int counters_read_on_cpu(int cpu, smp_call_func_t func, void *val)
> >   {
> >   	/*
> >   	 * Abort call on counterless CPU.
> > @@ -447,24 +457,90 @@ bool cpc_ffh_supported(void)
> >   	return true;
> >   }
> > +static void amu_read_core_const_ctrs(void *val)
> > +{
> > +	struct amu_ffh_ctrs *ctrs = val;
> > +
> > +	/*
> > +	 * cpu_read_constcnt() incurs slight latency due to the
> > +	 * ARM64_WORKAROUND_2457168 check. Read it first to minimize
> > +	 * the sampling skew between the const and core counters.
> > +	 */
> > +	cpu_read_constcnt(&ctrs->constcnt);
> > +	cpu_read_corecnt(&ctrs->corecnt);
> > +}
> > +
> > +static u64 cpc_ffh_extract_bits(const struct cpc_reg *reg, u64 val)
> > +{
> > +	val &= GENMASK_ULL(reg->bit_offset + reg->bit_width - 1,
> > +			   reg->bit_offset);
> > +	val >>= reg->bit_offset;
> > +
> > +	return val;
> > +}
> > +
> > +static void cpc_ffh_ctr_value(const struct cpc_reg *reg,
> > +			      const struct amu_ffh_ctrs *ctrs, u64 *val)
> > +{
> > +	switch ((u64)reg->address) {
> > +	case CPC_FFH_CTR_CORE:
> > +		*val = ctrs->corecnt;
> > +		break;
> > +	case CPC_FFH_CTR_CONST:
> > +		*val = ctrs->constcnt;
> > +		break;
> > +	}
> > +
> > +	*val = cpc_ffh_extract_bits(reg, *val);
> > +}
> > +
> > +static bool is_amu_ctr_reg(const struct cpc_reg *reg)
> > +{
> > +	return reg->address == CPC_FFH_CTR_CORE ||
> > +		reg->address == CPC_FFH_CTR_CONST;
> > +}
> > +
> > +int cpc_read_ffh_fb_ctrs(int cpu, struct cpc_reg *reg1, u64 *val1,
> > +			 struct cpc_reg *reg2, u64 *val2)
> > +{
> > +	struct amu_ffh_ctrs ctrs;
> > +	int ret;
> > +
> > +	if (!is_amu_ctr_reg(reg1) || !is_amu_ctr_reg(reg2))
> > +		return -EINVAL;
> > +
> > +	ret = counters_read_on_cpu(cpu, amu_read_core_const_ctrs, &ctrs);
> > +	if (ret) {
> > +		/*
> > +		 * If AMU is unsupported (-EOPNOTSUPP), translate the error
> > +		 * to -ENODEV. This explicitly tells the generic CPPC layer
> > +		 * to abort immediately and avoid falling back to pointless
> > +		 * single-counter reads.
> > +		 */
> > +		return ret == -EOPNOTSUPP ? -ENODEV : ret;
> > +	}
> > +
> > +	cpc_ffh_ctr_value(reg1, &ctrs, val1);
> > +	cpc_ffh_ctr_value(reg2, &ctrs, val2);
> > +
> > +	return 0;
> > +}
> > +
> >   int cpc_read_ffh(int cpu, struct cpc_reg *reg, u64 *val)
> >   {
> >   	int ret = -EOPNOTSUPP;
> >   	switch ((u64)reg->address) {
> > -	case 0x0:
> > +	case CPC_FFH_CTR_CORE:
> >   		ret = counters_read_on_cpu(cpu, cpu_read_corecnt, val);
> >   		break;
> > -	case 0x1:
> > +	case CPC_FFH_CTR_CONST:
> >   		ret = counters_read_on_cpu(cpu, cpu_read_constcnt, val);
> >   		break;
> >   	}
> > -	if (!ret) {
> > -		*val &= GENMASK_ULL(reg->bit_offset + reg->bit_width - 1,
> > -				    reg->bit_offset);
> > -		*val >>= reg->bit_offset;
> > -	}
> > +	if (!ret)
> > +		*val = cpc_ffh_extract_bits(reg, *val);
> >   	return ret;
> >   }
> 
> 
> So, more a nitpik that only applies if this set gets respun, but:
> 
> I don't think this FFH counter logic belongs in the arm64 topology.c file,
> its not really topology related.

I agree. Those bits should be moved.
That said, I think it would be best to land this first,
as it addresses a rather long-standing issue.
We can do the cleanup later. If needed, I'd pick it up soon'ish.

---
BR
Beata
> 
> 
> 
> 
> 

