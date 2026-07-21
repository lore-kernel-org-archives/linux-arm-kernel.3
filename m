Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 610FAC44529
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 08:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LLnIzjIXUZ+MTpd2UsuoMmOANYbVkHHufk+qKQQZgzI=; b=2JNJgBabAejVsMcJVm9Vk4s3c4
	a5nNFQBhPR/f8AIkUKoHguk2cvHTugShJXxRoOBOeeaRyJ4ktV28o7BHz5TrLQXHw9NFqL5WHl7mn
	mUEIvC55WvTmkYhu+7CpOCXGeaD+o4rCD+uSsRCGR6IqtJrfhD5oWTS+Kd1jeh6R6QSUP0A90m+uh
	Pko+E3BN9FjNIPf8t6kEukO9tTrXPvayna5tekXNkPWqNNmAVOulhTSP6wEA6P2RfNFnBdftJX3af
	wULcLrlYIi0s3H2/dCLMsspPeJvzXVVXYzQ9rPxTrkUmNvoCOeLYBRq8nyoNVRegkWN5y8H9CEeaH
	4s3gfGYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm625-00000008rIE-0WcR;
	Tue, 21 Jul 2026 08:40:57 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm621-00000008rHp-1HpY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 08:40:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C28351595;
	Tue, 21 Jul 2026 01:40:47 -0700 (PDT)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CFE233F66F;
	Tue, 21 Jul 2026 01:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784623251; bh=U2/ZgVzfkBXw9PNW1p1aK6bNd/TBhsvKFpUPyLgI8VM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=BPrHIgODqI7HpDaLwP++61j00cpszVF9l1evspNyEMAT3YKnkaBpJd5EMYo3d9DmP
	 DTack0Hp8lrQciFotK5c0j3wbgJxFgggHL7S9/bnMBU3y36zRzfgd90ml5xzLS5I/p
	 JKxB2euCWHHTQfITyQAxlAG2Mm/MvMeNsVNeW5oc=
Message-ID: <f154889e-5afc-4b9c-99f3-3da86f5e87cf@arm.com>
Date: Tue, 21 Jul 2026 09:40:49 +0100
MIME-Version: 1.0
User-Agent: Thunderbird Daily
Subject: Re: [PATCH v1 07/11] arm_mpam: Initialize all of struct mon_read in
 mpam_restore_mbwu_state()
To: Lee Trager <lee@trager.us>
Cc: james.morse@arm.com, reinette.chatre@intel.com, fenghuay@nvidia.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dave.martin@arm.com, andre.przywara@arm.com
References: <20260710115546.29644-1-ben.horgan@arm.com>
 <20260710115546.29644-8-ben.horgan@arm.com>
 <0e117330-36ed-4917-8a63-384d1e4f77fc@trager.us>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <0e117330-36ed-4917-8a63-384d1e4f77fc@trager.us>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_014053_607752_0F501BEA 
X-CRM114-Status: GOOD (  16.41  )
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

Hi Lee,

On 7/21/26 00:05, Lee Trager wrote:
> On 7/10/26 4:55 AM, Ben Horgan wrote:
> 
>> m->err may be read before initialization in __ris_msmon_read() when called
>> from mpam_restore_mbwu_state().
>>
>> Initialize the whole struct mon_read in mpam_restore_mbwu_state() and fix
>> the spelling of mbwu in the name.
>>
>> Fixes: 41e8a14950e1 ("arm_mpam: Track bandwidth counter state for power management")
>> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
>> ---
>>   drivers/resctrl/mpam_devices.c | 13 +++++++------
>>   1 file changed, 7 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
>> index a49f426aefc0..c9adc450f087 100644
>> --- a/drivers/resctrl/mpam_devices.c
>> +++ b/drivers/resctrl/mpam_devices.c
>> @@ -1640,7 +1640,6 @@ static int mpam_restore_mbwu_state(void *_ris)
>>   {
>>       int i;
>>       u64 val;
> val is still uninitialized. Its passed to to __ris_mon_read() below which does *m->val += now;

Ok, I don't think this causes any actual problems as an unitialized automatic variable has an
indeterminate value, we're just adding to it rather than making any decisions or persisting the
value. As it's unsigned the addition is defined even if it wraps around. Having said that, it's
clearer just to initialize it. I'll set it to 0.

Thanks,

Ben

>> -    struct mon_read mwbu_arg;
>>       struct mpam_msc_ris *ris = _ris;
>>       struct msmon_mbwu_state *mbwu_state;
>>       struct mpam_msc *msc = ris->vmsc->msc;
>> @@ -1653,16 +1652,18 @@ static int mpam_restore_mbwu_state(void *_ris)
>>               return -EIO;
>>             if (ris->mbwu_state[i].enabled) {
>> -            mwbu_arg.ris = ris;
>> -            mwbu_arg.ctx = &ris->mbwu_state[i].cfg;
>> -            mwbu_arg.type = mpam_msmon_choose_counter(class);
>> -            mwbu_arg.val = &val;
>> +            struct mon_read mbwu_arg = {
>> +                .ris = ris,
>> +                .ctx = &ris->mbwu_state[i].cfg,
>> +                .type = mpam_msmon_choose_counter(class),
>> +                .val = &val
>> +            };
>>                 mbwu_state->reset_on_next_read = true;
>>                 mpam_mon_sel_unlock(msc);
>>   -            __ris_msmon_read(&mwbu_arg);
>> +            __ris_msmon_read(&mbwu_arg);
>>           } else {
>>               mpam_mon_sel_unlock(msc);
>>           }


