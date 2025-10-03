Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA248CCA471
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Oct 2025 18:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2U2COw6dcwR34S+N0NCsvocG/Wh3zXSnTruMcIsjCDw=; b=X4sSRnvrkZGCff8R56zEQDJ0EZ
	XUvRuN/LiCmG9Jarj8Xm4De64vh7wrcUlT0ElWexcF1rYXVecdnPvW+fIB8w9H3yLhcn8jOY5UaXu
	rWtwDdCuKaMxxGymxRqaBlsk/eT1fKckaKeQDjIZeSvBUeJ6lZ1P6NOczbzHyQxSSh+tv79SzhFMv
	T7Sz+4TzK127faj9rtxNxWayYrdSJfgk7aA9eBVPMNzuDM9ppRhBPO7BQleM0pfd9sS2huSHxBhNL
	fJu4kXvw1cXOJo9hScU5KyxOzzs2NdnPu272rah2qHp1bRecXGzqRj6v9Ze7xQSuKaIghmELNoOHs
	QlRn52dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4k9Y-0000000CuHG-3ZVN;
	Fri, 03 Oct 2025 18:05:12 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4k9V-0000000CuFx-3Tbk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Oct 2025 18:05:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 987EA1596;
	Fri,  3 Oct 2025 11:05:00 -0700 (PDT)
Received: from [10.1.197.69] (eglon.cambridge.arm.com [10.1.197.69])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 44B9F3F5A1;
	Fri,  3 Oct 2025 11:05:03 -0700 (PDT)
Message-ID: <db5bff88-44d5-49ff-9460-f04e6e878bb1@arm.com>
Date: Fri, 3 Oct 2025 19:05:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 21/29] arm_mpam: Probe and reset the rest of the
 features
To: Jonathan Cameron <jonathan.cameron@huawei.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-acpi@vger.kernel.org,
 D Scott Phillips OS <scott@os.amperecomputing.com>,
 carl@os.amperecomputing.com, lcherian@marvell.com,
 bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com,
 baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>,
 Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com,
 dfustini@baylibre.com, amitsinght@marvell.com,
 David Hildenbrand <david@redhat.com>, Dave Martin <dave.martin@arm.com>,
 Koba Ko <kobak@nvidia.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
 fenghuay@nvidia.com, baisheng.gao@unisoc.com, Rob Herring <robh@kernel.org>,
 Rohit Mathew <rohit.mathew@arm.com>, Rafael Wysocki <rafael@kernel.org>,
 Len Brown <lenb@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Hanjun Guo <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Danilo Krummrich <dakr@kernel.org>, Zeng Heng <zengheng4@huawei.com>
References: <20250910204309.20751-1-james.morse@arm.com>
 <20250910204309.20751-22-james.morse@arm.com>
 <20250912140702.00000a5a@huawei.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <20250912140702.00000a5a@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251003_110509_997386_2F57BABA 
X-CRM114-Status: GOOD (  20.39  )
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

Hi Jonathan,

On 12/09/2025 14:07, Jonathan Cameron wrote:
> On Wed, 10 Sep 2025 20:43:01 +0000
> James Morse <james.morse@arm.com> wrote:
> 
>> MPAM supports more features than are going to be exposed to resctrl.
>> For partid other than 0, the reset values of these controls isn't
>> known.
>>
>> Discover the rest of the features so they can be reset to avoid any
>> side effects when resctrl is in use.
>>
>> PARTID narrowing allows MSC/RIS to support less configuration space than
>> is usable. If this feature is found on a class of device we are likely
>> to use, then reduce the partid_max to make it usable. This allows us
>> to map a PARTID to itself.

> A few trivial things inline.
> 
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>

Thanks!


>> @@ -667,10 +676,35 @@ static void mpam_ris_hw_probe(struct mpam_msc_ris *ris)
>>  	struct mpam_msc *msc = ris->vmsc->msc;
>>  	struct device *dev = &msc->pdev->dev;
>>  	struct mpam_props *props = &ris->props;
>> +	struct mpam_class *class = ris->vmsc->comp->class;
>>  
>>  	lockdep_assert_held(&msc->probe_lock);
>>  	lockdep_assert_held(&msc->part_sel_lock);
>>  
>> +	/* Cache Capacity Partitioning */
>> +	if (FIELD_GET(MPAMF_IDR_HAS_CCAP_PART, ris->idr)) {
>> +		u32 ccap_features = mpam_read_partsel_reg(msc, CCAP_IDR);
>> +
>> +		props->cmax_wd = FIELD_GET(MPAMF_CCAP_IDR_CMAX_WD, ccap_features);
>> +		if (props->cmax_wd &&
>> +		    FIELD_GET(MPAMF_CCAP_IDR_HAS_CMAX_SOFTLIM, ccap_features))
>> +			mpam_set_feature(mpam_feat_cmax_softlim, props);
>> +
>> +		if (props->cmax_wd &&
>> +		    !FIELD_GET(MPAMF_CCAP_IDR_NO_CMAX, ccap_features))
>> +			mpam_set_feature(mpam_feat_cmax_cmax, props);
>> +
>> +		if (props->cmax_wd &&
>> +		    FIELD_GET(MPAMF_CCAP_IDR_HAS_CMIN, ccap_features))
>> +			mpam_set_feature(mpam_feat_cmax_cmin, props);
>> +
>> +		props->cassoc_wd = FIELD_GET(MPAMF_CCAP_IDR_CASSOC_WD, ccap_features);
>> +

> Trivial but blank line here feels inconsistent with local style. I'd drop it.

Sure,


>> +		if (props->cassoc_wd &&
>> +		    FIELD_GET(MPAMF_CCAP_IDR_HAS_CASSOC, ccap_features))
>> +			mpam_set_feature(mpam_feat_cmax_cassoc, props);
>> +	}
>> +
> 
>> diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
>> index 17570d9aae9b..326ba9114d70 100644
>> --- a/drivers/resctrl/mpam_internal.h
>> +++ b/drivers/resctrl/mpam_internal.h
>> @@ -136,25 +136,34 @@ static inline void mpam_mon_sel_lock_init(struct mpam_msc *msc)
>>   * When we compact the supported features, we don't care what they are.
>>   * Storing them as a bitmap makes life easy.
>>   */
>> -typedef u16 mpam_features_t;
>> +typedef u32 mpam_features_t;

> This is strengthening my view that this should just be a DECLARE_BITMAP(MPAM_FEATURE_LAST)
> in the appropriate places.

I don't think this list is going to grow much. But sure.

Most stuff can be churned out, but this makes an utter mess of exposing the value to
debugfs.., I do need that exposed as "why didn't resctrl do what I wanted" is a very
common question - and being able to see what the hardware supports really helps.

Looks like exposing the first 'ulong' is the simplest - it kicks the can this creates
down the road. I experimented with u32_array - but its no better.


Thanks,

James

