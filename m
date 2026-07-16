Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AED57C44501
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 09:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qDSG1OKbLw+oeJMVVni+UOTi5R3BJXEXb5NBTOVvoHo=; b=C63fJ8L41t6YB1SBJSLGypf4og
	PV1vvDcaSs5j+QewxMy3qB3pQUS67jFVzo9YuNem1qbmiUqHOHN31Lu3TndoTTAYtrt9At9p3JUYI
	ja94k//QG6vNZIsvnyokd7Uld7Ju9hr4x9Vnifpylag0ega4Ctd5/ciSRDpB45Ik98PrxUPKEnbVv
	xILo5aY3N/h7VD2wes5+4QRb2yOU66wB6oUNAtXc984mkCbabpo2NENbII65muHoIB3Q/TxUPATOq
	3n8eFiYrliXIOlEqGMKckg9IsrE3KN9oVi+JZNPQ58MKFyTaZKeKDZZOR3P+574C8J9W32QdDuWOz
	3Gt4Fd4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkIRU-0000000GsLN-2nnE;
	Thu, 16 Jul 2026 09:31:44 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkIRS-0000000GsKO-0eIG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 09:31:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F0F2C2F;
	Thu, 16 Jul 2026 02:31:36 -0700 (PDT)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DC27F3F905;
	Thu, 16 Jul 2026 02:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784194301; bh=JEcIu08VithIjzoyjCx134aiQ/C+mCAK2uMYCOenBiU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=l8OxbNCROkH+TLnhbhlwGvlFqEdoPRIRZJiWf5lR7t6Pzra6W4VYxN8P6YRScIHnb
	 8j85IK5SeifslnPFKi4BGbiyaeAORr9SIuA9lCgCm/ut8QwaPAsqSgvD02vmeXEK9R
	 Mdvq0r8wFmQ3uEqp9uGD7Y/7FU8/Rb4QCmhVzeLc=
Message-ID: <33654cc4-9b36-4255-b761-3249174a97d9@arm.com>
Date: Thu, 16 Jul 2026 10:31:38 +0100
MIME-Version: 1.0
User-Agent: Thunderbird Daily
Subject: Re: [PATCH v1 04/11] arm_mpam: Add missing mon_sel locking in MBWU
 restore
To: Gavin Shan <gshan@redhat.com>
Cc: james.morse@arm.com, reinette.chatre@intel.com, fenghuay@nvidia.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dave.martin@arm.com, andre.przywara@arm.com
References: <20260710115546.29644-1-ben.horgan@arm.com>
 <20260710115546.29644-5-ben.horgan@arm.com>
 <8e7f992c-db87-4b79-8d92-d9a44295a0a6@redhat.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <8e7f992c-db87-4b79-8d92-d9a44295a0a6@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_023142_286854_B765E161 
X-CRM114-Status: GOOD (  18.20  )
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

Hi Gavin,

On 7/16/26 05:29, Gavin Shan wrote:
> On 7/10/26 9:55 PM, Ben Horgan wrote:
>> The mon_sel_lock is used to protect the mbwu_state, as well as h/w accesses
>> that use MPAMCFG_MON_SEL. However, in mpam_restore_mbwu_state() mbwu_state
>> is accessed without holding the mon_sel_lock.
>>
>> Add the missing locking.
>>
>> Fixes: 41e8a14950e1 ("arm_mpam: Track bandwidth counter state for power management")
>> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
>> ---
>>   drivers/resctrl/mpam_devices.c | 8 ++++++++
>>   1 file changed, 8 insertions(+)
>>
>> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
>> index 11b10c3bc334..b34e2a368516 100644
>> --- a/drivers/resctrl/mpam_devices.c
>> +++ b/drivers/resctrl/mpam_devices.c
>> @@ -1648,16 +1648,24 @@ static int mpam_restore_mbwu_state(void *_ris)
>>       u64 val;
>>       struct mon_read mwbu_arg;
>>       struct mpam_msc_ris *ris = _ris;
>> +    struct mpam_msc *msc = ris->vmsc->msc;
>>       struct mpam_class *class = ris->vmsc->comp->class;
>>         for (i = 0; i < ris->props.num_mbwu_mon; i++) {
>> +        if (WARN_ON_ONCE(!mpam_mon_sel_lock(msc)))
>> +            return -EIO;
>> +
> 
> The code can be simplified by avoiding the unnecessary nested conditional statement,
> something like below:
> 
>         if (!ris->mbwu_state[i].enabled) {
>             mpam_mon_sel_unlock(msc);
>             continue;
>         }
> 
>         mwbu_arg.ris = ris;
>                 mwbu_arg.ctx = &ris->mbwu_state[i].cfg;
>         mwbu_arg.type = mpam_msmon_choose_counter(class);
>         mwbu_arg.val = &val;
> 
>                 mpam_mon_sel_unlock(msc);
> 
>                 __ris_msmon_read(&mwbu_arg);
> 
>>           if (ris->mbwu_state[i].enabled) {
>>               mwbu_arg.ris = ris;
>>               mwbu_arg.ctx = &ris->mbwu_state[i].cfg;
>>               mwbu_arg.type = mpam_msmon_choose_counter(class);
>>               mwbu_arg.val = &val;
>>   +            mpam_mon_sel_unlock(msc);
>> +
>>               __ris_msmon_read(&mwbu_arg);
>> +        } else {
>> +            mpam_mon_sel_unlock(msc);
>>           }
>>       }
>>   

Ok. I think it will be clearer what's best here once Andre's error propagation in his MPAM-Fb series
has crystalized.

Thanks,

Ben

> 
> Thanks,
> Gavin
> 


