Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F143BC43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 09:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vqg/or2t6S4Xxpzxo1JH2Zy8d9Y/cuzJQUA5XNGvMs4=; b=LotWe8TCYKmXATBU21t8VWD6j+
	lvdD0vzu242NrPjU+8hYGeHO3bwSwornY0shZmlKeXYoAKVfNODLm8XYX165jxvROvYeLVRsVse2Z
	M15sjdKMUNgi3KCN+k5MIkWTwTiv3KMg3bQ4OnEefyriKNocqI5cELrN9WXIAXn9Dr57yWLrZByWo
	BmbIBYHytyERYaXLoQH5h2w+zZHytZ6rVae/Z+HJxdODSY7WZyYuxthUnRiyDNHAg0cbloG4Vvopc
	Q0yoShzmZFtithB1/aH4d8FF8VWyZ3xxyWyOZaIgk7wY8W2RUGKn0lt5cCj/VEJpbFtV15LfE7eSc
	IVc9fXQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfZxk-00000006S5c-3hjw;
	Fri, 03 Jul 2026 09:13:32 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfZxi-00000006S59-3boc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 09:13:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 43C931EDB;
	Fri,  3 Jul 2026 02:13:23 -0700 (PDT)
Received: from arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B80683F673;
	Fri,  3 Jul 2026 02:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783070007; bh=vur8IvfQRfAoT74KzFHsz8I0LevL/nMjf/dA3BQpGTY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I9GjHP2gqKTZ7r7a2mrhbFtmXqz8GULYW6+SFi7Oj+w+EzsQjDqZjfoDEFMrZsnX2
	 WuGirvBwu8M5UlSU7yzIWZaU2iRjWQYH//gvNEFTpVAXJ9CyRUMnNDixfKmV3LRo8w
	 uOTvBZrKRnm4EwPf66ZrVwcZD3FfOsUDzqsiNLho=
Date: Fri, 3 Jul 2026 11:13:18 +0200
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
Subject: Re: [PATCH 2/2] arm64: topology: read CPPC FFH feedback counters in
 one operation
Message-ID: <akd9LkY5A97dbfYT@arm.com>
References: <20260410094145.4132082-1-zhangpengjie2@huawei.com>
 <20260410094145.4132082-3-zhangpengjie2@huawei.com>
 <akNxo5HzHARnrCT1@arm.com>
 <20631d1e-b7a0-4270-a69c-e07c420b1505@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20631d1e-b7a0-4270-a69c-e07c420b1505@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_021330_974431_C64C083F 
X-CRM114-Status: GOOD (  35.20  )
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

On Wed, Jul 01, 2026 at 08:21:41PM +0800, Pengjie Zhang wrote:
> 
> On 6/30/2026 3:34 PM, Beata Michalska wrote:
> > On Fri, Apr 10, 2026 at 05:41:45PM +0800, Pengjie Zhang wrote:
> > > arm64 implements CPPC FFH feedback-counter reads using AMU counters.
> > > Because those counters must be sampled on the target CPU, reading the
> > > delivered and reference counters separately widens the observation window
> > > between them.
> > > 
> > > Implement the paired FFH feedback-counter read hook on arm64 and sample
> > > both AMU counters together before decoding the requested CPC register
> > > values.
> > > 
> > > Also factor the FFH bitfield extraction logic into a helper and reuse
> > > it from the existing single-counter FFH read path.
> > > 
> > > Signed-off-by: Pengjie Zhang <zhangpengjie2@huawei.com>
> > > ---
> > >   arch/arm64/kernel/topology.c | 75 ++++++++++++++++++++++++++++++++----
> > >   1 file changed, 67 insertions(+), 8 deletions(-)
> > > 
> > > diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
> > > index b32f13358fbb..b90a767b2a1f 100644
> > > --- a/arch/arm64/kernel/topology.c
> > > +++ b/arch/arm64/kernel/topology.c
> > > @@ -50,6 +50,16 @@ struct amu_cntr_sample {
> > >   	unsigned long	last_scale_update;
> > >   };
> > > +struct amu_ffh_ctrs {
> > > +	u64 corecnt;
> > > +	u64 constcnt;
> > > +};
> > > +
> > > +enum cpc_ffh_ctr_id {
> > > +	CPC_FFH_CTR_CORE  = 0x0,
> > > +	CPC_FFH_CTR_CONST = 0x1,
> > > +};
> > > +
> > Those should probably go under the #ifdef CONFIG_ACPI_CPPC_LIB section.
> 
> yes
> 
> > >   static DEFINE_PER_CPU_SHARED_ALIGNED(struct amu_cntr_sample, cpu_amu_samples);
> > >   void update_freq_counters_refs(void)
> > > @@ -397,7 +407,7 @@ static void cpu_read_constcnt(void *val)
> > >   }
> > >   static inline
> > > -int counters_read_on_cpu(int cpu, smp_call_func_t func, u64 *val)
> > > +int counters_read_on_cpu(int cpu, smp_call_func_t func, void *val)
> > >   {
> > >   	/*
> > >   	 * Abort call on counterless CPU.
> > > @@ -447,24 +457,73 @@ bool cpc_ffh_supported(void)
> > >   	return true;
> > >   }
> > > +static void amu_read_core_const_ctrs(void *val)
> > > +{
> > > +	struct amu_ffh_ctrs *ctrs = val;
> > > +
> > > +	cpu_read_constcnt(&ctrs->constcnt);
> > > +	cpu_read_corecnt(&ctrs->corecnt);
> > > +}
> > > +
> > > +static u64 cpc_ffh_extract_bits(const struct cpc_reg *reg, u64 val)
> > > +{
> > > +	val &= GENMASK_ULL(reg->bit_offset + reg->bit_width - 1,
> > > +			   reg->bit_offset);
> > > +	val >>= reg->bit_offset;
> > > +
> > > +	return val;
> > > +}
> > > +
> > > +static bool cpc_ffh_ctr_value(const struct cpc_reg *reg,
> > > +			      const struct amu_ffh_ctrs *ctrs, u64 *val)
> > > +{
> > > +	switch ((u64)reg->address) {
> > > +	case CPC_FFH_CTR_CORE:
> > > +		*val = ctrs->corecnt;
> > > +		break;
> > > +	case CPC_FFH_CTR_CONST:
> > > +		*val = ctrs->constcnt;
> > > +		break;
> > > +	default:
> > > +		return false;
> > > +	}
> > > +
> > > +	*val = cpc_ffh_extract_bits(reg, *val);
> > > +	return true;
> > > +}
> > > +
> > > +int cpc_read_ffh_fb_ctrs(int cpu, struct cpc_reg *reg1, u64 *val1,
> > > +			 struct cpc_reg *reg2, u64 *val2)
> > > +{
> > > +	struct amu_ffh_ctrs ctrs;
> > > +	int ret;
> > > +
> > > +	ret = counters_read_on_cpu(cpu, amu_read_core_const_ctrs, &ctrs);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	if (!cpc_ffh_ctr_value(reg1, &ctrs, val1) ||
> > > +	    !cpc_ffh_ctr_value(reg2, &ctrs, val2))
> > > +		return -EOPNOTSUPP;
> > Right, so there might be an issues with that:
> > If you return EOPNOTSUPP here, that would trigger reading the registers again,
> > this time one by one. Is that intentional ?
> > Also counters_read_on_cpu might also return EOPNOTSUPP, in which case trying
> > again to read the counters is pointless.
> > 
> > I'm not entirely sure I understand the condition itself though.
> > This will fail if either of the requested registers in not really expected.
> > And that should probably be verified upfront ?
> > 
> > 
> > ---
> > BR
> > Beata
> 
> Right. The following code may be more appropriate.
> 
> static bool is_valid_cpc_ffh_reg(const struct cpc_reg *reg)
SO that is all fine, though the naming here somehow doesn't sit with me.
Maybe is_amu_ctr_reg ?
Anyways - you can ignore that, that might be just me.
> {
>     return reg->address == CPC_FFH_CTR_CORE ||
>         reg->address == CPC_FFH_CTR_CONST;
> }
> 
> int cpc_read_ffh_fb_ctrs(int cpu, struct cpc_reg *reg1, u64 *val1,
>              struct cpc_reg *reg2, u64 *val2)
> {
>     struct amu_ffh_ctrs ctrs;
>     int ret;
> 
>     if (!is_valid_cpc_ffh_reg(reg1) || !is_valid_cpc_ffh_reg(reg2))
>         return -EINVAL;
> 
>     ret = counters_read_on_cpu(cpu, amu_read_core_const_ctrs, &ctrs);
>     if (ret)
>         return ret == -EOPNOTSUPP ? -ENODEV : ret;
> 
>     cpc_ffh_ctr_value(reg1, &ctrs, val1);
>     cpc_ffh_ctr_value(reg2, &ctrs, val2);
> 
>     return 0;
> }
> 
> thanks,
> 
>    Pengjie
> 
That does look better - thank you.
I'd just also add a comment why the error code flip is here.

---
BR
Beata
> > > +
> > > +	return 0;
> > > +}
> > > +
> > >   int cpc_read_ffh(int cpu, struct cpc_reg *reg, u64 *val)
> > >   {
> > >   	int ret = -EOPNOTSUPP;
> > >   	switch ((u64)reg->address) {
> > > -	case 0x0:
> > > +	case CPC_FFH_CTR_CORE:
> > >   		ret = counters_read_on_cpu(cpu, cpu_read_corecnt, val);
> > >   		break;
> > > -	case 0x1:
> > > +	case CPC_FFH_CTR_CONST:
> > >   		ret = counters_read_on_cpu(cpu, cpu_read_constcnt, val);
> > >   		break;
> > >   	}
> > > -	if (!ret) {
> > > -		*val &= GENMASK_ULL(reg->bit_offset + reg->bit_width - 1,
> > > -				    reg->bit_offset);
> > > -		*val >>= reg->bit_offset;
> > > -	}
> > > +	if (!ret)
> > > +		*val = cpc_ffh_extract_bits(reg, *val);
> > >   	return ret;
> > >   }
> > > -- 
> > > 2.33.0
> > > 

