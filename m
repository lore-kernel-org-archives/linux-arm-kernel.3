Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AF27CA5FDD
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 15:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MHlKzNAPro0S9foA3OTCrVJh3W1A5LHqqR3KlsGjnC0=; b=HcUT2qeVQSg+AdBI9lO01FhYax
	qWnlUQwTY8DtxSeCurfsDLrjX0ngvVFI3PO+DMg+isPbtsbUokiVmYkX2HOzlAppFyo2VoTo/OQFt
	JO7OIspwazFXuR7ftHVFcIN0C/5PEhpIkOkl3QRa86GQn8j99lzHzagEGAbYqzxjkJJxsP7d8nVRB
	fS+X+h9jSbyuy0QfFUHDsye814qhhFZO4E/vW5z9/CNdxwoABY7yDV2x3eLlbdmvuqwlv1i4iPczx
	13QTlW9Gx2SgfzA4VmF6AxO5MbIAbMUkESIfKrPH0ZHw2Paw+6jW18vfIh7jZD+O4jFFT1BOC3D/v
	l16+mynw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCfBd-0000000Bv4v-02qc;
	Fri, 02 Oct 2026 15:28:37 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCfBa-0000000Bv3P-2wXI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 15:28:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5F443143D;
	Fri,  2 Oct 2026 08:28:30 -0700 (PDT)
Received: from [10.211.55.3] (unknown [10.57.85.160])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 581163F85F;
	Fri,  2 Oct 2026 08:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790954913; bh=mWlakmQeAEHAxCyfTFzDD2sX8g/O0kmImYyWq4OWRdI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=s4H/32F1Tge5KkVec4bqAj9n+avPy6smGF5sQ3cbOd7m1iWtkHMeO5sndO8AR6QcD
	 PPwMmgBOAQGZ4eDAOw4nPE9uXiVxM6Bw2dIeSUgo58vjqTRlopNKX3uo/RkRDC343F
	 RFYgoczL1x/4Gp96AOjoN04LPuoGEIlmxgb0+l1s=
Message-ID: <0d687b69-ef99-4d55-83c1-231a844743d1@arm.com>
Date: Fri, 2 Oct 2026 16:28:30 +0100
MIME-Version: 1.0
User-Agent: Thunderbird Daily
Subject: Re: [PATCH v2 04/12] arm_mpam: Add missing mon_sel locking in MBWU
 save and restore
To: James Morse <james.morse@arm.com>
Cc: reinette.chatre@intel.com, fenghuay@nvidia.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dave.martin@arm.com, andre.przywara@arm.com, Gavin Shan <gshan@redhat.com>
References: <20260917145617.2202986-1-ben.horgan@arm.com>
 <20260917145617.2202986-5-ben.horgan@arm.com>
 <4efe1c1e-5fef-410f-90c7-6638486706d0@arm.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <4efe1c1e-5fef-410f-90c7-6638486706d0@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_082834_840260_2A91A449 
X-CRM114-Status: GOOD (  27.96  )
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

Hi James,

On 02/10/2026 16:01, James Morse wrote:
> Hi Ben,
> 
> On 17/09/2026 15:56, Ben Horgan wrote:
>> The mon_sel_lock is used to protect the mbwu_state, as well as h/w accesses
>> that use MPAMCFG_MON_SEL. However, in mpam_restore/save_mbwu_state(),
>> mbwu_state is accessed without holding the mon_sel_lock.
> 
> This is me being sloppy - I was only worried about concurrent writers, not
> use of the array itself. But this is clearly better!
> 
> 
>> Add the missing locking.
> 
> 
>> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
>> index e349db525882..d39d210574a6 100644
>> --- a/drivers/resctrl/mpam_devices.c
>> +++ b/drivers/resctrl/mpam_devices.c
>> @@ -1652,17 +1652,26 @@ static int mpam_restore_mbwu_state(void *_ris)
>>  	u64 val;
>>  	struct mon_read mwbu_arg;
>>  	struct mpam_msc_ris *ris = _ris;
>> +	struct mpam_msc *msc = ris->vmsc->msc;
>>  	struct mpam_class *class = ris->vmsc->comp->class;
>>  
>>  	for (i = 0; i < ris->props.num_mbwu_mon; i++) {
>> -		if (ris->mbwu_state[i].enabled) {
>> -			mwbu_arg.ris = ris;
>> -			mwbu_arg.ctx = &ris->mbwu_state[i].cfg;
>> -			mwbu_arg.type = mpam_msmon_choose_counter(class);
>> -			mwbu_arg.val = &val;
>> +		if (WARN_ON_ONCE(!mpam_mon_sel_lock(msc)))
>> +			return -EIO;
>>  
>> -			__ris_msmon_read(&mwbu_arg);
>> +		if (!ris->mbwu_state[i].enabled) {
>> +			mpam_mon_sel_unlock(msc);
>> +			continue;
>>  		}
>> +
>> +		mwbu_arg.ris = ris;
>> +		mwbu_arg.ctx = &ris->mbwu_state[i].cfg;
>> +		mwbu_arg.type = mpam_msmon_choose_counter(class);
>> +		mwbu_arg.val = &val;
> 
>> +		mpam_mon_sel_unlock(msc);
>> +
>> +		__ris_msmon_read(&mwbu_arg);
> 
> Dropping and re-taking the lock in __ris_msmon_read() means everything we cached
> in mbwu_arg could in principle change. I don't think it does - but if we're trying
> to be robust/unsurprising: we probably need a __ris_msmon_read_locked(), or because of
> that cfg pointer - always get the caller to take the lock.
> 
> This is better - so we shouldn't let perfect be the enemy of good.
> 
> ~
> 
> Turns out you clean this up in a few patches time. It's theoretical, so the order
> doesn't matter.
> 
> 
>>  	}
>>  
>>  	return 0;
>> @@ -1680,12 +1689,12 @@ static int mpam_save_mbwu_state(void *arg)
>>  	struct mpam_msc *msc = ris->vmsc->msc;
>>  
>>  	for (i = 0; i < ris->props.num_mbwu_mon; i++) {
>> -		mbwu_state = &ris->mbwu_state[i];
>> -		cfg = &mbwu_state->cfg;
> 
> Yeah, I was only worried about concurrent writes. But this is clearly better.
> 
> 
>>  		if (WARN_ON_ONCE(!mpam_mon_sel_lock(msc)))
>>  			return -EIO;
>>  
>> +		mbwu_state = &ris->mbwu_state[i];
>> +		cfg = &mbwu_state->cfg;
> To check - do you agree we don't need to worry about the array being free()d?
> Because the first thing teardown does is disable the static-key and unregister
> the cpuhp callbacks, it shouldn't be possible to reach this code before the
> array gets freed...

Yeah, fine for now. We'll have to think more when we fix the unbinding.

Thanks,

Ben

> 
> 
>>  		mon_sel = FIELD_PREP(MSMON_CFG_MON_SEL_MON_SEL, i) |
>>  			  FIELD_PREP(MSMON_CFG_MON_SEL_RIS, ris->ris_idx);
>>  		mpam_write_monsel_reg(msc, CFG_MON_SEL, mon_sel);
> 
> 
> Reviewed-by: James Morse <james.morse@arm.com>
> 
> 
> Thanks,
> 
> James


