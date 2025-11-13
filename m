Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E26CCD8CA8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 16:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=++5rjZ0PQeu1DPqtcc4G9gcTYjwBzO1LwjjGTumFNcg=; b=JzP7vv0TUo2RxhuIAq4eVZCkb7
	VanrkfC+P+LSgCWkmD/Ca0doMvbaDBBDH8AYw56QeHj51hh5heac+EHn7dDWxFOWwQh7WwnpOX0K7
	A8AC09yNOJJr2ME2y0rLq6axwJOd5e2y3pH+vQybx3gB3aF+MeoPIyR2lcMNXgC4kGaq8cv/yzsii
	PBF0+fCecexVSPW6Z18fsWdcwG9RlO+d2aUZ5dvQiUZBte9gmSGVioimuGjuNnySyK338SfUUMMXv
	ilFvBAFx0vuOnyJyyVINufiUojPLYNPqxOcquw+PWarKp7D0lg5Q3O1g6uaz53QXQz0BJoeDpEo0i
	a9IgIwtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJaQB-0000000Aojl-1snZ;
	Thu, 13 Nov 2025 16:43:43 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJaQ9-0000000AojF-07DW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Nov 2025 16:43:42 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 48D6412FC;
	Thu, 13 Nov 2025 08:43:31 -0800 (PST)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 405C93F63F;
	Thu, 13 Nov 2025 08:43:34 -0800 (PST)
Message-ID: <0b4e74a8-6a8a-429d-92a7-35df8ef04e9c@arm.com>
Date: Thu, 13 Nov 2025 16:43:32 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/33] arm_mpam: Probe hardware to find the supported
 partid/pmg values
To: Fenghua Yu <fenghuay@nvidia.com>, james.morse@arm.com
Cc: amitsinght@marvell.com, baisheng.gao@unisoc.com,
 baolin.wang@linux.alibaba.com, bobo.shaobowang@huawei.com,
 carl@os.amperecomputing.com, catalin.marinas@arm.com, dakr@kernel.org,
 dave.martin@arm.com, david@redhat.com, dfustini@baylibre.com,
 gregkh@linuxfoundation.org, gshan@redhat.com, guohanjun@huawei.com,
 jeremy.linton@arm.com, jonathan.cameron@huawei.com, kobak@nvidia.com,
 lcherian@marvell.com, lenb@kernel.org, linux-acpi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 lpieralisi@kernel.org, peternewman@google.com, quic_jiles@quicinc.com,
 rafael@kernel.org, robh@kernel.org, rohit.mathew@arm.com,
 scott@os.amperecomputing.com, sdonthineni@nvidia.com, sudeep.holla@arm.com,
 tan.shaopeng@fujitsu.com, will@kernel.org, xhao@linux.alibaba.com,
 Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
References: <20251107123450.664001-1-ben.horgan@arm.com>
 <20251107123450.664001-15-ben.horgan@arm.com>
 <90c483a2-a7e0-4c87-a3da-8643bec63879@nvidia.com>
From: Ben Horgan <ben.horgan@arm.com>
Content-Language: en-US
In-Reply-To: <90c483a2-a7e0-4c87-a3da-8643bec63879@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_084341_185673_B3E36A8F 
X-CRM114-Status: GOOD (  13.47  )
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

Hi Fenghua,

On 11/13/25 03:50, Fenghua Yu wrote:
> Hi, Ben and James,
> 
> On 11/7/25 04:34, Ben Horgan wrote:
>> From: James Morse <james.morse@arm.com>
> [SNIP]
> 
>> +static struct mpam_msc_ris *mpam_get_or_create_ris(struct mpam_msc *msc,
>> +                           u8 ris_idx)
>> +{
>> +    int err;
>> +    struct mpam_msc_ris *ris;
>> +
>> +    lockdep_assert_held(&mpam_list_lock);
>> +
>> +    if (!test_bit(ris_idx, &msc->ris_idxs)) {
>> +        err = mpam_ris_create_locked(msc, ris_idx, MPAM_CLASS_UNKNOWN,
>> +                         0, 0);
>> +        if (err)
>> +            return ERR_PTR(err);
>> +    }
>> +
>> +    list_for_each_entry(ris, &msc->ris, msc_list) {
>> +        if (ris->ris_idx == ris_idx)
>> +            return ris;
>> +    }
>> +
>> +    return ERR_PTR(-ENOENT);
>> +}
>> +
>>   static int mpam_msc_hw_probe(struct mpam_msc *msc)
>>   {
>>       u64 idr;
>> +    u16 partid_max;
>> +    u8 ris_idx, pmg_max;
>> +    struct mpam_msc_ris *ris;
>>       struct device *dev = &msc->pdev->dev;
>>         lockdep_assert_held(&msc->probe_lock);
>> @@ -464,6 +564,40 @@ static int mpam_msc_hw_probe(struct mpam_msc *msc)
>>           return -EIO;
>>       }
>>   +    /* Grab an IDR value to find out how many RIS there are */
>> +    mutex_lock(&msc->part_sel_lock);
>> +    idr = mpam_msc_read_idr(msc);
>> +    mutex_unlock(&msc->part_sel_lock);
>> +
>> +    msc->ris_max = FIELD_GET(MPAMF_IDR_RIS_MAX, idr);
>> +
>> +    /* Use these values so partid/pmg always starts with a valid
>> value */
>> +    msc->partid_max = FIELD_GET(MPAMF_IDR_PARTID_MAX, idr);
>> +    msc->pmg_max = FIELD_GET(MPAMF_IDR_PMG_MAX, idr);
>> +
>> +    for (ris_idx = 0; ris_idx <= msc->ris_max; ris_idx++) {
>> +        mutex_lock(&msc->part_sel_lock);
>> +        __mpam_part_sel(ris_idx, 0, msc);
>> +        idr = mpam_msc_read_idr(msc);
>> +        mutex_unlock(&msc->part_sel_lock);
>> +
>> +        partid_max = FIELD_GET(MPAMF_IDR_PARTID_MAX, idr);
>> +        pmg_max = FIELD_GET(MPAMF_IDR_PMG_MAX, idr);
>> +        msc->partid_max = min(msc->partid_max, partid_max);
>> +        msc->pmg_max = min(msc->pmg_max, pmg_max);
>> +
>> +        mutex_lock(&mpam_list_lock);
>> +        ris = mpam_get_or_create_ris(msc, ris_idx);
>> +        mutex_unlock(&mpam_list_lock);
>> +        if (IS_ERR(ris))
>> +            return PTR_ERR(ris);
> 
> It's better to destroy ris's that were previously created before this
> failed ris? Otherwise, there is a memory leak for those allocated ris's?

This should be handled by mpam_disable() which is run on probe failure.

> 
> Thanks.
> 
> -Fenghua


Thanks,

Ben


