Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D8FAC44501
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 07:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+IUzkoDTo8ryJAbWgSPaFMbWYYZ4BmqlEHKHtTm8xic=; b=cNTqlAEv2avcbmVc6kfmLQtIw8
	0GsdQ2LSTu5ULu2CVrf05OiJq/9Buo6uOdj0d9+dkwX/z5NjCgUW/FgKZE49w5CwIPOnEeEDgYKqq
	xPBIQ8pl0jlFM5eefoIvKk/apokY7ZNDZfKV8bwn5VJeJw0nh0q8wVfpPrfWbK3kSxC5Bu2VeeIgW
	altVcda8VcocnFWdU6KlZDTCMhSRYyAkwEFLbcbpH//3nnBS6uYI3lBhU+xPKb98Ts/DqPL5YnZYI
	Hytsk7zDc7cpBlidarah2kx/49/RsnOcOptbl6RBiiFdEYvbGU7Us6kA5kEKm70IbKjpu4uauGkUm
	OMIa20Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whjQQ-00000001LXG-1Fyy;
	Thu, 09 Jul 2026 07:44:02 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whjQN-00000001LWW-3UWl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 07:44:01 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 78B09168F;
	Thu,  9 Jul 2026 00:43:54 -0700 (PDT)
Received: from [10.41.150.148] (e142021.arm.com [10.41.150.148])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 061383F66F;
	Thu,  9 Jul 2026 00:43:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783583038; bh=IgdTSArHQ8oteKx5khmzg/wtXtBIJn8DUtYY+BXoEMY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ZofewIXyrEbVv1Dz0DDeV2p7J/CuvpU/Q9ZDTKY27/4tAhvAG8rKCaYqonSW0Ytu2
	 WiwySDPCzw0ipoQ679VApyzY5O6PapengItCRYzO3n/5gtu0FdxHeS/xaM4yF7/DJj
	 DKcJQu1mJG/2FrF+1mhkNsISAwa3ZQn53/Kk6Vkw=
Message-ID: <29e02d92-b294-40e2-8d85-eb62bcb8ae17@arm.com>
Date: Thu, 9 Jul 2026 09:43:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/15] arm_mpam: propagate MSC read errors for
 __ris_msmon_read()
To: Ben Horgan <ben.horgan@arm.com>, Lorenzo Pieralisi
 <lpieralisi@kernel.org>, Hanjun Guo <guohanjun@huawei.com>,
 Sudeep Holla <sudeep.holla@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 James Morse <james.morse@arm.com>,
 Reinette Chatre <reinette.chatre@intel.com>, Fenghua Yu <fenghuay@nvidia.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
 Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
 Ganapatrao Kulkarni <ganapatrao.kulkarni@oss.qualcomm.com>,
 Trilok Soni <tsoni@quicinc.com>, Srinivas Ramana <sramana@qti.qualcomm.com>,
 Niyas Sait <niyas.sait@arm.com>, linux-acpi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260702162229.4008659-1-andre.przywara@arm.com>
 <20260702162229.4008659-7-andre.przywara@arm.com>
 <332b1348-285f-4b4a-9d3d-97f040739703@arm.com>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <332b1348-285f-4b4a-9d3d-97f040739703@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_004359_958355_C86CCC6D 
X-CRM114-Status: GOOD (  22.37  )
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

Hi Ben,

On 7/1/26 22:14, Ben Horgan wrote:
> Hi Andre,
> 
> On 7/2/26 17:22, Andre Przywara wrote:
>> Allow the function for RIS accesses to return an error, and propagate
>> read errors from the lower level up.
>>
>> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
>> ---
>>   drivers/resctrl/mpam_devices.c | 35 +++++++++++++++++++++++++++-------
>>   1 file changed, 28 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
>> index b259fe20a614..d18c7be86aaa 100644
>> --- a/drivers/resctrl/mpam_devices.c
>> +++ b/drivers/resctrl/mpam_devices.c
>> @@ -1285,9 +1285,14 @@ static u64 mpam_msmon_overflow_val(enum mpam_device_features type,
>>   	return overflow_val;
>>   }
>>   
>> +/*
>> + * This function might be called via smp_call_function_any(), so propagate
>> + * errors inside the arg struct.
>> + */
>>   static void __ris_msmon_read(void *arg)
>>   {
>>   	u64 now;
>> +	int ret;
>>   	u32 now32;
>>   	bool nrdy = false;
>>   	bool config_mismatch;
>> @@ -1326,7 +1331,9 @@ static void __ris_msmon_read(void *arg)
>>   	 * Read the existing configuration to avoid re-writing the same values.
>>   	 * This saves waiting for 'nrdy' on subsequent reads.
>>   	 */
>> -	read_msmon_ctl_flt_vals(m, &cur_ctl, &cur_flt);
>> +	ret = read_msmon_ctl_flt_vals(m, &cur_ctl, &cur_flt);
>> +	if (ret)
>> +		goto out_unlock;
>>   
>>   	if (mpam_feat_msmon_mbwu_31counter == m->type)
>>   		overflow = cur_ctl & MSMON_CFG_x_CTL_OFLOW_STATUS;
>> @@ -1351,7 +1358,9 @@ static void __ris_msmon_read(void *arg)
>>   
>>   	switch (m->type) {
>>   	case mpam_feat_msmon_csu:
>> -		mpam_read_monsel_reg(msc, CSU, &now32);
>> +		ret = mpam_read_monsel_reg(msc, CSU, &now32);
>> +		if (ret)
>> +			goto out_unlock;
>>   		nrdy = now32 & MSMON___NRDY;
>>   		now = FIELD_GET(MSMON___VALUE, now32);
>>   
>> @@ -1371,7 +1380,9 @@ static void __ris_msmon_read(void *arg)
>>   			else
>>   				now = FIELD_GET(MSMON___L_VALUE, now);
>>   		} else {
>> -			mpam_read_monsel_reg(msc, MBWU, &now32);
>> +			ret = mpam_read_monsel_reg(msc, MBWU, &now32);
>> +			if (ret)
>> +				goto out_unlock;
>>   			nrdy = now32 & MSMON___NRDY;
>>   			now = FIELD_GET(MSMON___VALUE, now32);
>>   		}
>> @@ -1402,10 +1413,15 @@ static void __ris_msmon_read(void *arg)
>>   	if (nrdy)
>>   		m->err = -EBUSY;
>>   
>> -	if (m->err)
>> -		return;
>> +	if (!m->err)
>> +		*m->val += now;
> 
> Why does this change? Can't you keep this the 'if' statement as before
> and more the 'return' after the '*m->val += now;'?

Because I need to explicitly return now anyway, since the error path 
below would just unlock again otherwise. So it would look like:

	if (m->err)
		return;

	*m->val += now;

	return;
out_unlock:
	mpam_mon_sel_unlock(msc);
...

which seemed like one return would be enough, and just conditionally do 
the assignment instead. I'd prefer to keep it like in this patch, but 
let me know if you disagree and I would change it to the one sketched above.

Cheers,
Andre

> 
> Thanks,
> 
> Ben
> 
>> +
>> +	return;
>>   
>> -	*m->val += now;
>> +out_unlock:
>> +	mpam_mon_sel_unlock(msc);
>> +
>> +	m->err = ret;
>>   }
>>   
>>   static int _msmon_read(struct mpam_component *comp, struct mon_read *arg)
>> @@ -1729,6 +1745,7 @@ static int mpam_restore_mbwu_state(void *_ris)
>>   {
>>   	int i;
>>   	u64 val;
>> +	int ret = 0;
>>   	struct mon_read mwbu_arg;
>>   	struct mpam_msc_ris *ris = _ris;
>>   	struct mpam_class *class = ris->vmsc->comp->class;
>> @@ -1741,10 +1758,14 @@ static int mpam_restore_mbwu_state(void *_ris)
>>   			mwbu_arg.val = &val;
>>   
>>   			__ris_msmon_read(&mwbu_arg);
>> +			if (mwbu_arg.err) {
>> +				ret = mwbu_arg.err;
>> +				break;
>> +			}
>>   		}
>>   	}
>>   
>> -	return 0;
>> +	return ret;
>>   }
>>   
>>   /* Call with MSC cfg_lock held */
> 


