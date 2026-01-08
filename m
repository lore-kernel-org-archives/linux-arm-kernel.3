Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 420A7D1D468
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 14:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zgibru7FXLj8OHfCf0TGIkt0KltiBiqhaxw50YMRyes=; b=o5eGFUXGN8BjK0eA0AVfe4D1Vu
	l/ufEHb08uvIC1EqtweV5vCrSy38fVoPQv5OmjZnQ6stPe0sM9uZYMSqlFrdDxKheX4XfjrGYVPaB
	OJKqPypD1jTBSiBuYoceE/nfagWH17vtFZ2t9r50PhMhPtm6wcxNWhEYKFjTLNKPYa8phd1sR/wRG
	5NDwlBJrlhXEiwCDkBnBz3CIeAJVTqmGg9BpvxozW+hsmUZL1OGnjwiE/9Z7JuNSpnIk3kik7pqcP
	TkTO/2LydDiEJ7GA4nFXk6E189kzokyfJVjNBKH10V7wOMra83auXWeQuaI/LGPcQRkqEiFRdmV+9
	fN518GCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdrOX-0000000HQ9y-1Lip;
	Thu, 08 Jan 2026 14:53:49 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdrOV-0000000HQ9R-2ilM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 14:53:48 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 964B81515;
	Thu,  8 Jan 2026 06:53:39 -0800 (PST)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 799983F6A8;
	Thu,  8 Jan 2026 06:53:39 -0800 (PST)
Message-ID: <5b7a66e2-7310-4770-bb7c-c7d7993cd6fe@arm.com>
Date: Thu, 8 Jan 2026 14:53:37 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 39/45] arm_mpam: resctrl: Call resctrl_init() on
 platforms that can support resctrl
To: Jonathan Cameron <jonathan.cameron@huawei.com>
Cc: amitsinght@marvell.com, baisheng.gao@unisoc.com,
 baolin.wang@linux.alibaba.com, carl@os.amperecomputing.com,
 dave.martin@arm.com, david@kernel.org, dfustini@baylibre.com,
 fenghuay@nvidia.com, gshan@redhat.com, james.morse@arm.com,
 kobak@nvidia.com, lcherian@marvell.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 peternewman@google.com, punit.agrawal@oss.qualcomm.com,
 quic_jiles@quicinc.com, reinette.chatre@intel.com, rohit.mathew@arm.com,
 scott@os.amperecomputing.com, sdonthineni@nvidia.com,
 tan.shaopeng@fujitsu.com, xhao@linux.alibaba.com, catalin.marinas@arm.com,
 will@kernel.org, corbet@lwn.net, maz@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, suzuki.poulose@arm.com, kvmarm@lists.linux.dev
References: <20251219181147.3404071-1-ben.horgan@arm.com>
 <20251219181147.3404071-40-ben.horgan@arm.com>
 <20260106145831.000055aa@huawei.com>
From: Ben Horgan <ben.horgan@arm.com>
Content-Language: en-US
In-Reply-To: <20260106145831.000055aa@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_065347_822164_44A12C7B 
X-CRM114-Status: GOOD (  20.42  )
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

On 1/6/26 14:58, Jonathan Cameron wrote:
> On Fri, 19 Dec 2025 18:11:41 +0000
> Ben Horgan <ben.horgan@arm.com> wrote:
> 
>> From: James Morse <james.morse@arm.com>
>>
>> Now that MPAM links against resctrl, call resctrl_init() to register the
>> filesystem and setup resctrl's structures.
>>
>> Signed-off-by: James Morse <james.morse@arm.com>
>> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> 
> Just minor suggestions inline.  I'm not sure the for loop macros
> are worth doing but that particular pair of loops feel awfully familiar
> at this point, so maybe. 
> 
> Either way..
> 
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
>  
>> diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
>> index 059148c38a38..bbb12b5dfd8c 100644
>> --- a/drivers/resctrl/mpam_resctrl.c
>> +++ b/drivers/resctrl/mpam_resctrl.c
> 
>> @@ -1840,11 +1861,70 @@ int mpam_resctrl_setup(void)
>>  		pr_warn("Number of PMG is not a power of 2! resctrl may misbehave");
>>  	}
>>  
>> -	/* TODO: call resctrl_init() */
>> +	err = resctrl_init();
>> +	if (!err)
>> +		WRITE_ONCE(resctrl_enabled, true);
> 
> Trivial but I'd prefer the error path out of line.
> 
> 	if (err)
> 		return err;
> 
> 	WRITE_ONCE(resctrl_enabled, true);
> 	
> 	return 0;

Ok, updated.

>>  
>>  	return err;
>>  }
> 
>> +
>> +/*
>> + * The driver is detaching an MSC from this class, if resctrl was using it,
>> + * pull on resctrl_exit().
>> + */
>> +void mpam_resctrl_teardown_class(struct mpam_class *class)
>> +{
>> +	int i;
>> +	struct mpam_resctrl_res *res;
>> +	struct mpam_resctrl_mon *mon;
>> +
>> +	might_sleep();
>> +
>> +	for (i = 0; i < RDT_NUM_RESOURCES; i++) {
> There are enough iterators over these that I wonder
> if it is worth some macros.
>  
> 	for_each_mpam_resctrl_control(res) {
> 	}
> and
> 	for_each_mpam_resctrl_counter(mon) {
> 	}

The index is often needed too so I changed to helpers that include it too:
for_each_mpam_resctrl_control(res, rid) and
for_each_mpam_resctrl_mon(mon, eventid).

> 
> 
>> +		res = &mpam_resctrl_controls[i];
>> +		if (res->class == class) {
>> +			res->class = NULL;
>> +			break;
>> +		}
>> +	}
>> +	for (i = 0; i < QOS_NUM_EVENTS; i++) {
>> +		mon = &mpam_resctrl_counters[i];
>> +		if (mon->class == class) {
>> +			mon->class = NULL;
>> +
>> +			mpam_resctrl_teardown_mon(mon, class);
>> +
>> +			break;
>> +		}
>> +	}
>> +}
>> +
>>  static int __init __cacheinfo_ready(void)
>>  {
>>  	cacheinfo_ready = true;
> 

Thanks,

Ben


