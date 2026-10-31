Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5454A606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Oct 2026 02:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=slCxJI0D;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=raUpYOFg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=nB4pM2ZJXpnwRA8pYcn66mc+0T+eg4LR6jSzacwN0sA=; b=slCxJI0DPPY9wX
	dopE7tNgrpiuUnxK5Jbj3nSowphwmjM3QHIqdFwNCf09HdjRZOXyz6HMJZr6Y23Boif9MjO9ss6Zq
	59tI1TZZxI+cUztiXs9z3HI4wx3O0ek6fw/7BBToHGoc+Hr8Otumq3utMsm6NZFfluOSdRxCa94gj
	vkhavvCUruwzvtT9CG8pFydrA56f6CRox+W8mUuAhwNFltBP/SusAvkkgTZHu/hMhs/Du4KLeCoFf
	tBS2KpOlcohz8QaBZH0keNQ7vAYkOtEgvp7lCwvFsMELt95tVsu1S93rR79CktCsiKwU80fzY0qev
	MT0aYkWVQQIA4AoA1KpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMymF-0000000Crp1-21ZO;
	Sat, 31 Oct 2026 02:25:03 +0000
Received: from [113.46.200.217] (helo=canpmsgout02.his.huawei.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMymB-0000000Cro8-34Lq;
	Sat, 31 Oct 2026 02:25:02 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=nB4pM2ZJXpnwRA8pYcn66mc+0T+eg4LR6jSzacwN0sA=;
	b=raUpYOFgQh9voYZCcg/OdijcaqglHGfZZNxTVqJS0LCtBGqRCcsPX7o9pBhQCMBGH31u4wfgw
	Qjfi6WZmlQEhgM12bST5N2B2vkEcfU3HyItBP3p/jVOytsN7ALvwk7SZvmfNA7YywyBpTgjsnuY
	HzdvuTsz24yzs1NokF/AV48=
Received: from mail.maildlp.com (unknown [172.19.162.144])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4jGhcR0LV4zcZyQ;
	Sat, 31 Oct 2026 10:24:23 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id DCCDF40538;
	Sat, 31 Oct 2026 10:24:41 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Sat, 31 Oct
 2026 10:24:40 +0800
Message-ID: <04b19a8f-72aa-4342-b5ec-a0bf8417b276@huawei.com>
Date: Sat, 31 Oct 2026 10:24:40 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 01/19] arm_mpam: resctrl: Leave CDP off when there
 are too few PARTIDs
To: Ben Horgan <ben.horgan@arm.com>, <reinette.chatre@intel.com>,
	<james.morse@arm.com>, <fenghuay@nvidia.com>, <catalin.marinas@arm.com>,
	<will@kernel.org>, <mark.rutland@arm.com>, <corbet@lwn.net>,
	<skhan@linuxfoundation.org>, <rdunlap@infradead.org>, <tony.luck@intel.com>,
	<Dave.Martin@arm.com>, <babu.moger@amd.com>, <tglx@kernel.org>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<hpa@zytor.com>, <tan.shaopeng@jp.fujitsu.com>, <jic23@kernel.org>,
	<zengheng4@huawei.com>, <gshan@redhat.com>, <x86@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
References: <20261029123611.1108424-1-ruanjinjie@huawei.com>
 <20261029123611.1108424-2-ruanjinjie@huawei.com>
 <bea9392d-a9d1-4683-ba2c-41139a1dca9d@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <bea9392d-a9d1-4683-ba2c-41139a1dca9d@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemk200008.china.huawei.com (7.202.194.74)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_192500_494769_39B81CBE 
X-CRM114-Status: GOOD (  29.34  )
X-Spam-Score: -1.3 (-)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



在 2026/10/31 0:38, Ben Horgan 写道:
> Hi Jinjie,
> 
> Thanks for this fix!
> 
> On 29/10/2026 12:35, Jinjie Ruan wrote:
>> Enabling CDP needs a second PARTID for the reserved closid.
> 
> I'm not sure what a 'reserved closid' is here but you could just say:

Hi Ben,


This means there are two copies: one for data and one for code.

> 
> Enabling CDP requires at least 2 PARTIDs.

OK.

> 
>> If firmware
>> reports too few PARTIDs, resctrl_arch_set_cdp_enabled() returns -EINVAL,
> 
> Not all systems are firmware backed. This can be:
> 
> If there are too few PARTIDs, ... .

Thank you! I will fix it.

> 
>> but only after it has recorded CDP as enabled, halved the monitor count
>> and turned off the mbw_max MBA control. 
> 
> 
>> resctrl then reports an error
>> and believes CDP is off, which leaves the two sides out of step and the
>> halved monitor count and the missing MBA control are not undone.
> 
> I think the 'reports an error part' can be dropped leaving 'resctrl then believes CDP is off...' as
> exactly what resctrl does is not important here.

Will update it.

> 
>>
>> Check the PARTID limit, and work out the CDP PARTIDs, before anything is
> 
> Why work out the CDP PARTIDs so early if they aren't going to be used?

Modified them together as a whole.

> 
>> changed so a failed enable has no effect.
>>
>> Fixes: 6789fb99282c ("arm_mpam: resctrl: Add CDP emulation")
>> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
>> ---
>>  drivers/resctrl/mpam_resctrl.c | 20 ++++++++++++--------
>>  1 file changed, 12 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
>> index 5468367776e2..886f0595d364 100644
>> --- a/drivers/resctrl/mpam_resctrl.c
>> +++ b/drivers/resctrl/mpam_resctrl.c
>> @@ -210,6 +210,18 @@ int resctrl_arch_set_cdp_enabled(enum resctrl_res_level rid, bool enable)
>>  	if (enable)
>>  		pr_warn("CDP is an expert feature and may cause MPAM to malfunction.\n");
>>  
>> +	/*
>> +	 * Check this before changing any state: if CDP can't be enabled the
>> +	 * caller must see CDP left off.
>> +	 */
> 
> I don't think this comment is needed. Failing early rather than failing late after some side effects
> have happened is clearly better.

Will delete it.

> 
>> +	if (enable) {
>> +		if (mpam_partid_max < 1)
>> +			return -EINVAL;
>> +
>> +		partid_d = resctrl_get_config_index(RESCTRL_RESERVED_CLOSID, CDP_DATA);
>> +		partid_i = resctrl_get_config_index(RESCTRL_RESERVED_CLOSID, CDP_CODE);
> 
> The partid_d/partid_i determination can stay below so it's close to the user.

Will put it back in its original place.

> 
> I think we can just have the check here:
> 
> if (enable && mpam_partid_max < 1)
>   	return -EINVAL;

That is fine.

> 
> Thanks,
> 
> Ben
> 
>> +	}
>> +
>>  	/*
>>  	 * resctrl_arch_set_cdp_enabled() is only called with enable set to
>>  	 * false on error and unmount.
>> @@ -238,14 +250,6 @@ int resctrl_arch_set_cdp_enabled(enum resctrl_res_level rid, bool enable)
>>  	if (!cdp_enabled && mpam_resctrl_controls[RDT_RESOURCE_MBA].class)
>>  		mpam_resctrl_controls[RDT_RESOURCE_MBA].resctrl_res.alloc_capable = true;
>>  
>> -	if (enable) {
>> -		if (mpam_partid_max < 1)
>> -			return -EINVAL;
>> -
>> -		partid_d = resctrl_get_config_index(RESCTRL_RESERVED_CLOSID, CDP_DATA);
>> -		partid_i = resctrl_get_config_index(RESCTRL_RESERVED_CLOSID, CDP_CODE);
>> -	}
>> -
>>  	mpam_set_task_partid_pmg(current, partid_d, partid_i, 0, 0);
>>  	WRITE_ONCE(arm64_mpam_global_default, mpam_get_regval(current));
>>  
> 

-- 
Best regards,
Jinjie


