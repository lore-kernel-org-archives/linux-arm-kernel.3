Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F71ECA5FC4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 16:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=py97cNYaBxybrUzKejoJroLpoNrWH+tTWDC6cmMrstA=; b=MFfH8gvq5eAs1g69D6YRmopsQB
	piCLxCRXGoxCaFLXDCXriyYC5SllUx/QByauqSmB27R3c1mbp8MeVnjXL0bJca4mjyVEMcR/ZPYPn
	m57BLcEa+EpvfJU75KDZ5rsK5cES/jMdS3oLGAVr1nuWFFgdY+QxoaBlv5x1153otbkyHYuJugseQ
	Ab8BlKPw/gsdrW10uABZ3LgI6Eo11auTCfi9hwsDuACuWNqH+PWo9l7Lmx+iNm/5tTaKhUU5u5ihj
	95wVvlYCsd2OrQmexjdBK1cATMb3lIe2bxIgCMshHXJTcXT2LwP0K2HHyOLb2KcSTe3mot/Z5k467
	qV4QhBkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCg0l-0000000C1R3-1ZSg;
	Fri, 02 Oct 2026 16:21:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCg0j-0000000C1QL-0a0i
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 16:21:26 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3F72E1476;
	Fri,  2 Oct 2026 09:21:21 -0700 (PDT)
Received: from [10.2.212.14] (eglon.cambridge.arm.com [10.2.212.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 88BDF3F86F;
	Fri,  2 Oct 2026 09:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790958084; bh=j1DFrVvkAJ4S9bitcuONPXMtVWgkwbXYGjzS42/w7KM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=n9floJgmfPUb5Bme9WMaDoAKs81Jr8Mw9/iuNlcX8oODjn9uETbcVSUUVrWykXrkx
	 l5tVmrXnYlYB3DsCpB4aqtIXmz/zTplFulaO7Fid7jhK4kpz0hmFLdchxDE3PhhGr/
	 +I+4d1l8fxq1VDpgV+eCTTO3e2vYPlLXDtGL2EeU=
Message-ID: <922325b0-97ee-46b3-af6d-5ce0fb4076e4@arm.com>
Date: Fri, 2 Oct 2026 17:21:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/12] arm_mpam: Use __ris_msmon_read() for saving MBWU
 state
To: Ben Horgan <ben.horgan@arm.com>
Cc: reinette.chatre@intel.com, fenghuay@nvidia.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dave.martin@arm.com, andre.przywara@arm.com, Gavin Shan <gshan@redhat.com>
References: <20260917145617.2202986-1-ben.horgan@arm.com>
 <20260917145617.2202986-7-ben.horgan@arm.com>
 <32c85a0b-48f3-407f-bc60-a58255806683@arm.com>
 <e1bb7833-c6f5-4582-9769-19a6437d07fd@arm.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <e1bb7833-c6f5-4582-9769-19a6437d07fd@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_092125_265970_762A0921 
X-CRM114-Status: GOOD (  19.41  )
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

On 02/10/2026 16:22, Ben Horgan wrote:
> Hi James,
> 
> On 02/10/2026 16:15, James Morse wrote:
>> Hi Ben,
>>
>> On 17/09/2026 15:56, Ben Horgan wrote:
>>> mbwu_save_mbwu_state() reads the MBWU counters and adds that to a saved
>>> correction value. However, the type of counter to read is determined by the
>>> RIS rather than the class and overflow is not taken into account. Fix this
>>> and mitigate against further divergence by using a locked variant of the
>>> same helper used for user monitor reads, __ris_msmon_read(). Using the
>>> locked variant avoids having to drop and retake the mon_sel lock. If the
>>> lock was dropped, an interleaved monitor read which detects overflow would
>>> cause the overflow not to be accounted for in the saved value of
>>> mbwu_state->correction. The correction is no longer updated for disabled
>>> counters but this has no effect as the saved values are not expected to be
>>> useful for disabled counters.
>>
>>> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
>>> index 6cba3ef21cc8..62562ce2f9aa 100644
>>> --- a/drivers/resctrl/mpam_devices.c
>>> +++ b/drivers/resctrl/mpam_devices.c
>>
>>
>>> @@ -1688,10 +1693,12 @@ static int mpam_save_mbwu_state(void *arg)
>>>  	int i;
>>>  	u64 val;
>>>  	struct mon_cfg *cfg;
>>> +	struct mon_read mbwu_arg;
>>>  	u32 cur_flt, cur_ctl, mon_sel;
>>>  	struct mpam_msc_ris *ris = arg;
>>>  	struct msmon_mbwu_state *mbwu_state;
>>>  	struct mpam_msc *msc = ris->vmsc->msc;
>>> +	struct mpam_class *class = ris->vmsc->comp->class;
>>>  
>>>  	for (i = 0; i < ris->props.num_mbwu_mon; i++) {
>>>  		if (WARN_ON_ONCE(!mpam_mon_sel_lock(msc)))
>>> @@ -1707,17 +1714,31 @@ static int mpam_save_mbwu_state(void *arg)
>>>  		cur_flt = mpam_read_monsel_reg(msc, CFG_MBWU_FLT);
>>>  		cur_ctl = mpam_read_monsel_reg(msc, CFG_MBWU_CTL);
>>
>>>  		cfg->mon = i;
>>>  		cfg->pmg = FIELD_GET(MSMON_CFG_x_FLT_PMG, cur_flt);
>>>  		cfg->match_pmg = FIELD_GET(MSMON_CFG_x_CTL_MATCH_PMG, cur_ctl);
>>>  		cfg->partid = FIELD_GET(MSMON_CFG_x_FLT_PARTID, cur_flt);
>>>  		mbwu_state->enabled = FIELD_GET(MSMON_CFG_x_CTL_EN, cur_ctl);
>>> +
>>> +		if (!mbwu_state->enabled) {
>>> +			mpam_mon_sel_unlock(msc);
>>> +			continue;
>>> +		}
>>> +
>>> +		val = 0;
>>> +		mbwu_arg = (struct mon_read) {
>>> +			.ris = ris,
>>> +			.ctx = cfg,
>>> +			.type = mpam_msmon_choose_counter(class),
>>> +			.val = &val,
>>> +		};
>>> +
>>> +		__ris_msmon_read_locked(&mbwu_arg);
>>> +
>>> +		mbwu_state->reset_on_next_read = true;
>>> +		if (!mbwu_arg.err)
>>> +			mbwu_state->correction = val;
>>
>> += val?
>>
>> If the same CPU is offlined twice, the correction should hold the sum of both values.
>> The idea is the 'correction' is anything that has been consumed, and isn't in the hardware
>> register. (e.g. due to overflow or reset)
> 
> I agree with your definition of correction but isn't that taken into
> account in __ris_msmon_read_locked().
> 
> Surely +=val here would lead to double counting.

Yes - I missed that.

I'll add a comment to that effect as (to me at least) this looks like a reset of that
correction value, which shouldn't happen while the counter is allocated.



Thanks!

James

