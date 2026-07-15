Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64590C44507
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 08:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kgjb/Dlau6gz2a6BF73NI/wLZdXG2I2yzYUaEi7NYI0=; b=jR335RpMUxNsMJFOR4sJ5CWqcF
	ZutyCP7Eagng2cef7/iwFtRKiWNwsEzhX6cIfVBn0DtuC/xfKT3Lt/r4A0HAX1TleIjivFzK9kkSb
	lCjVmSeE0AOYpg7TTYHymEJXERcQT0M3/BRVEGxdbjKUd8h73bxRd5yWn/pY5fnaQ59Kl1GfSjiZV
	U/PcvUSo2SFnaFb3Z0hXTLjEM50yAD2fdzOxo4dL/35IwZUWDE7yV/syoqb+IqpBXUG3TooxAl4eI
	sLpIrIIEI41KdNQzQmR3U493HrZRjhDUsO2EQH6E+b+vjNMLFiuu4WTm5nxmbZDpwIPuGDKgs5ICs
	2Qu2zMFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjvEp-0000000EBw4-2ewk;
	Wed, 15 Jul 2026 08:45:07 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjvEn-0000000EBtG-0Bnb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 08:45:06 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 184971477;
	Wed, 15 Jul 2026 01:44:58 -0700 (PDT)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 645093F7B4;
	Wed, 15 Jul 2026 01:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784105102; bh=1sybEJPLAgbVvCjAlxeTEX9l41vo0Yb+Tru9FMaLLEk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=a5elHshe13Z3UYuuG+sinQcs9xh5UvkOv/ogchW3GTpTfE1x/vtDGaMFIl5ZLz7E7
	 Z9NQbWHtL2l4FtMVnsfbc7MUjZEbR/Xl+zOtpa7d4BVA1YQ41AewLse/NC2V4vFpav
	 EhqXlmB2+nsbtVOtLMCL72DomM32+IIUVxsanqsE=
Message-ID: <0e4246f2-bcfc-4b08-9361-e87872c23672@arm.com>
Date: Wed, 15 Jul 2026 09:45:00 +0100
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
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <OS9PR01MB16920A90EC44010A30A79A4728BF82@OS9PR01MB16920.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_014505_194587_9CCA06C1 
X-CRM114-Status: GOOD (  18.85  )
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

On 7/15/26 08:49, Shaopeng Tan (Fujitsu) wrote:
> Hello Ben,
> 
>> When an MSC becomes inaccessible due to cpu offline CFG_MBWU_CTL is set to
>> zero in mpam_save_mbwu_state(). This is very likely to mean that the config
>> will mismatch when restoring and so the monitor will be reset. However, the
>> state may have been lost and so there are no guarantees. Ensure the reset
>> happens by setting the reset_on_next_read and remove the unnecessary writes
>>from mpam_save_mbwu_state().
>>
>> Fixes: 41e8a14950e1 ("arm_mpam: Track bandwidth counter state for power management")
>> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
>> ---
>>  drivers/resctrl/mpam_devices.c | 13 +++++++------
>>  1 file changed, 7 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
>> index b34e2a368516..222fc248067e 100644
>> --- a/drivers/resctrl/mpam_devices.c
>> +++ b/drivers/resctrl/mpam_devices.c
>> @@ -1648,10 +1648,13 @@ static int mpam_restore_mbwu_state(void *_ris)
>>          u64 val;
>>          struct mon_read mwbu_arg;
>>          struct mpam_msc_ris *ris = _ris;
>> +       struct msmon_mbwu_state *mbwu_state;
>>          struct mpam_msc *msc = ris->vmsc->msc;
>>          struct mpam_class *class = ris->vmsc->comp->class;
>>  
>>          for (i = 0; i < ris->props.num_mbwu_mon; i++) {
>> +               mbwu_state = &ris->mbwu_state[i];
>> +
>>                  if (WARN_ON_ONCE(!mpam_mon_sel_lock(msc)))
>>                          return -EIO;
>>  
>> @@ -1661,6 +1664,8 @@ static int mpam_restore_mbwu_state(void *_ris)
>>                          mwbu_arg.type = mpam_msmon_choose_counter(class);
>>                          mwbu_arg.val = &val;
>>  
>> +                       mbwu_state->reset_on_next_read = true;
>> +
>>                          mpam_mon_sel_unlock(msc);
> 
>         for (i = 0; i < ris->props.num_mbwu_mon; i++) {
> +               mbwu_state = &ris->mbwu_state[i];
> +
>                 if (WARN_ON_ONCE(!mpam_mon_sel_lock(msc)))
>                         return -EIO;
> 
> -               if (ris->mbwu_state[i].enabled) {
> +               if (mbwu_state->enabled) {  //this line might need refactoring

I'm unclear on what you are trying to point out in this email. Please can you explain.

Thanks,

Ben

>                         mwbu_arg.ris = ris;
> -                       mwbu_arg.ctx = &ris->mbwu_state[i].cfg;
> +                       mwbu_arg.ctx = &mbwu_state->cfg;  //and this line
>                         mwbu_arg.type = mpam_msmon_choose_counter(class);
>                         mwbu_arg.val = &val;
>  
> +                       mbwu_state->reset_on_next_read = true;
> +
>                         mpam_mon_sel_unlock(msc);
> 
> 
> Best regards,
> Shaopeng TAN
> 
>>                          __ris_msmon_read(&mwbu_arg);
>> @@ -1696,15 +1701,11 @@ static int mpam_save_mbwu_state(void *arg)
>>  
>>                  cur_flt = mpam_read_monsel_reg(msc, CFG_MBWU_FLT);
>>                  cur_ctl = mpam_read_monsel_reg(msc, CFG_MBWU_CTL);
>> -               mpam_write_monsel_reg(msc, CFG_MBWU_CTL, 0);
>>  
>> -               if (mpam_ris_has_mbwu_long_counter(ris)) {
>> +               if (mpam_ris_has_mbwu_long_counter(ris))
>>                          val = mpam_msc_read_mbwu_l(msc);
>> -                       mpam_msc_zero_mbwu_l(msc);
>> -               } else {
>> +               else
>>                          val = mpam_read_monsel_reg(msc, MBWU);
>> -                       mpam_write_monsel_reg(msc, MBWU, 0);
>> -               }
>>  
>>                  cfg->mon = i;
>>                  cfg->pmg = FIELD_GET(MSMON_CFG_x_FLT_PMG, cur_flt);
>> -- 
>> 2.43.0


