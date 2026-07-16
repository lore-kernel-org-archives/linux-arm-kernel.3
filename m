Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30FE9C4450A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 09:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/yzyjJfJJ35ZrPl/8R6qcfhZ6LLlXQeeE3uto34jM3c=; b=g6Aoz8TEbgBfqPTfPIYHk2Telt
	S1Scf+XKKTS/ktWxn/ii5ZTz2MXb0MUIQ7mI7+zaa2PTAfnrsBpKPk9t6uSVJsjjVosW1AkugHArq
	6HbIUQ3Iugsa9SiF8baW6hF936c9Sg1hi0kN9p48CQ8NtfI5Ns6VJ27zap2kEv2Ehbp9xevqNd71R
	T89sIf/YNaOK41mbYE7iy9zYaeJXzTqNdTmDZjeHyTqGEkeJJTEV5ykxaKkut+YTR2h6LKmv9epdT
	GbUQpazC6OEUkGKiVXZ0UEtqkzFj6NwvJ3pp24L/rPgn+ULg674LxMgJJ1CzTpLQ1/sGxBiWraiZf
	gUKnVkzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkIU6-0000000Gsqi-0UUG;
	Thu, 16 Jul 2026 09:34:26 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkITw-0000000GslM-2DwB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 09:34:18 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 919301477;
	Thu, 16 Jul 2026 02:34:11 -0700 (PDT)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AC28A3F905;
	Thu, 16 Jul 2026 02:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784194455; bh=L3G9pEGnDef+XM1NJskG1lgqT4AANyJCxj8DHi3YY0o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kkA3xNDlwVXFsQq1qzebhPlVPNp9oIdaYNTkwk326RvWEWhzgNNm/7CkwJxJTfoQC
	 2dVJWo3Y3rM6vBWv/avgrblw7yi7ZcvLZhA7RPGZeIXcY2vPUAw0rTRYx0wPCEgJ3d
	 4gZq7Wisequ+me/e+HKyMfron/ua0UIRIkX6AIUo=
Message-ID: <aa0d9daf-95c8-4479-91a7-87eefa86f2b4@arm.com>
Date: Thu, 16 Jul 2026 10:34:13 +0100
MIME-Version: 1.0
User-Agent: Thunderbird Daily
Subject: Re: [PATCH v1 05/11] arm_mpam: Ensure MBWU counters are reset on
 restore
To: "Shaopeng Tan (Fujitsu)" <tan.shaopeng@fujitsu.com>
Cc: "james.morse@arm.com" <james.morse@arm.com>,
 "reinette.chatre@intel.com" <reinette.chatre@intel.com>,
 "fenghuay@nvidia.com" <fenghuay@nvidia.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "dave.martin@arm.com" <dave.martin@arm.com>,
 "andre.przywara@arm.com" <andre.przywara@arm.com>
References: <20260710115546.29644-6-ben.horgan@arm.com>
 <OS9PR01MB16920A90EC44010A30A79A4728BF82@OS9PR01MB16920.jpnprd01.prod.outlook.com>
 <0e4246f2-bcfc-4b08-9361-e87872c23672@arm.com>
 <TY4PR01MB16930674F986639651CEE6C4A8BC72@TY4PR01MB16930.jpnprd01.prod.outlook.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <TY4PR01MB16930674F986639651CEE6C4A8BC72@TY4PR01MB16930.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_023416_655603_9828BBFF 
X-CRM114-Status: GOOD (  17.83  )
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

Hi Shaopeng,

On 7/16/26 01:26, Shaopeng Tan (Fujitsu) wrote:
> Hello Ben,
> 
>>>> When an MSC becomes inaccessible due to cpu offline CFG_MBWU_CTL is set to
>>>> zero in mpam_save_mbwu_state(). This is very likely to mean that the config
>>>> will mismatch when restoring and so the monitor will be reset. However, the
>>>> state may have been lost and so there are no guarantees. Ensure the reset
>>>> happens by setting the reset_on_next_read and remove the unnecessary writes
>>> >from mpam_save_mbwu_state().
>>>>
>>>> Fixes: 41e8a14950e1 ("arm_mpam: Track bandwidth counter state for power management")
>>>> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
>>>> ---
>>>>  drivers/resctrl/mpam_devices.c | 13 +++++++------
>>>>  1 file changed, 7 insertions(+), 6 deletions(-)
>>>>
>>>> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
>>>> index b34e2a368516..222fc248067e 100644
>>>> --- a/drivers/resctrl/mpam_devices.c
>>>> +++ b/drivers/resctrl/mpam_devices.c
>>>> @@ -1648,10 +1648,13 @@ static int mpam_restore_mbwu_state(void *_ris)
>>>>          u64 val;
>>>>          struct mon_read mwbu_arg;
>>>>          struct mpam_msc_ris *ris = _ris;
>>>> +       struct msmon_mbwu_state *mbwu_state;
>>>>          struct mpam_msc *msc = ris->vmsc->msc;
>>>>          struct mpam_class *class = ris->vmsc->comp->class;
>>>>  
>>>>          for (i = 0; i < ris->props.num_mbwu_mon; i++) {
>>>> +               mbwu_state = &ris->mbwu_state[i];
>>>> +
>>>>                  if (WARN_ON_ONCE(!mpam_mon_sel_lock(msc)))
>>>>                          return -EIO;
>>>>  
>>>> @@ -1661,6 +1664,8 @@ static int mpam_restore_mbwu_state(void *_ris)
>>>>                          mwbu_arg.type = mpam_msmon_choose_counter(class);
>>>>                          mwbu_arg.val = &val;
>>>>  
>>>> +                       mbwu_state->reset_on_next_read = true;
>>>> +
>>>>                          mpam_mon_sel_unlock(msc);
>>>
>>>         for (i = 0; i < ris->props.num_mbwu_mon; i++) {
>>> +               mbwu_state = &ris->mbwu_state[i];
>>> +
>>>                 if (WARN_ON_ONCE(!mpam_mon_sel_lock(msc)))
>>>                         return -EIO;
>>>
>>> -               if (ris->mbwu_state[i].enabled) {
>>> +               if (mbwu_state->enabled) {  //this line might need refactoring
>>
>> I'm unclear on what you are trying to point out in this email. Please can you explain.
>>
>> Thanks,
>>
>> Ben
> 
> Inside the for loop, you introduced `mbwu_state = &ris->mbwu_state[i];` a few lines earlier, 
> and then used `mbwu_state->reset_on_next_read = true;` shortly after.
> Therefore, using mbwu_state->enabled and mbwu_state->cfg keeps 
> the whole block consistent and avoids repeating ris->mbwu_state[i] multiple times. 

Thanks for explaining. Indeed, continuing to use the ris->mbwu_state[i] once it's assigned to a
local variable does make this a bit messy.

Ben

> 
> Best regards,
> Shaopeng TAN
> 
>>>                         mwbu_arg.ris = ris;
>>> -                       mwbu_arg.ctx = &ris->mbwu_state[i].cfg;
>>> +                       mwbu_arg.ctx = &mbwu_state->cfg;  //and this line
>>>                         mwbu_arg.type = mpam_msmon_choose_counter(class);
>>>                         mwbu_arg.val = &val;
>>>
>>> +                       mbwu_state->reset_on_next_read = true;
>>> +
>>>                         mpam_mon_sel_unlock(msc);
>>>
>>>
>>> Best regards,
>>> Shaopeng TAN
>>>
>>>>                          __ris_msmon_read(&mwbu_arg);
>>>> @@ -1696,15 +1701,11 @@ static int mpam_save_mbwu_state(void *arg)
>>>>  
>>>>                  cur_flt = mpam_read_monsel_reg(msc, CFG_MBWU_FLT);
>>>>                  cur_ctl = mpam_read_monsel_reg(msc, CFG_MBWU_CTL);
>>>> -               mpam_write_monsel_reg(msc, CFG_MBWU_CTL, 0);
>>>>  
>>>> -               if (mpam_ris_has_mbwu_long_counter(ris)) {
>>>> +               if (mpam_ris_has_mbwu_long_counter(ris))
>>>>                          val = mpam_msc_read_mbwu_l(msc);
>>>> -                       mpam_msc_zero_mbwu_l(msc);
>>>> -               } else {
>>>> +               else
>>>>                          val = mpam_read_monsel_reg(msc, MBWU);
>>>> -                       mpam_write_monsel_reg(msc, MBWU, 0);
>>>> -               }
>>>>  
>>>>                  cfg->mon = i;
>>>>                  cfg->pmg = FIELD_GET(MSMON_CFG_x_FLT_PMG, cur_flt);
>>>> --
>>>> 2.43.0
>>
>>


