Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01379C531D0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 08:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZWjh26X8GUvxqy5FL5PAIbouaQ0ap31b7UOammsriX4=; b=uUNDdHjWO2bZNivd7D0igu4JQ2
	aaXFyJOXyLSUMcLA8FKz7OPI9YthBJZcGneupsjwg9tJzoeDqxNmlgeZdjSJu2eXLVb5JJU5gw7Qi
	/EjgqAM1pQbXpUSs9gkp4Pv9DgXraC2GmKINE9YC6EI56qQv5W4JARH/WAYp8osy2JvBB1xRojohh
	cWx1oOIyUPJp5w7L8fEn+HxOKbg8ofG7VCXSKI0tR7k3BTs2pDPQoJ/Vtfbuw4fECtYR5MF1yYQtv
	5QZcB4CqvnHgi8E9H2yIMtlKDIcE1wNmNWd44/Ilcz72C3/KPoizhoIkQQrB4XrEOfhHwyTbgoJrM
	pf3of+Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpM0h-00000009q8P-2xVm;
	Thu, 30 Jul 2026 08:20:59 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpM0e-00000009q7b-1TCT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 08:20:58 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 073551684;
	Thu, 30 Jul 2026 01:20:51 -0700 (PDT)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C96CB3F86F;
	Thu, 30 Jul 2026 01:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785399655; bh=gjMRVfef1r4KhAEKV+k1umJxEPmgMMO1pW4mplg8FBU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=AiYTkj1T3SFCOBI7G0897c9RQPdqjZKJfYQXsp0rMC8Qn6/0oZz9bPc/O4Hsd+MNn
	 qCaFLu1feAyj1qenpNSEfBBUBVUk92IvMRjAWrt+SpumIKsWgckK44zZdXm/fCQwUJ
	 fs+jq04f3Fqgsx3BXzZqT9XPshEX/hyx+pjl6X2w=
Message-ID: <1d600f7c-4654-4b93-b4a3-8e76730d8151@arm.com>
Date: Thu, 30 Jul 2026 09:20:51 +0100
MIME-Version: 1.0
User-Agent: Thunderbird Daily
Subject: Re: [PATCH v5 03/10] arm_mpam: propagate MSC access errors for MBWU
 counters
To: Lee Trager <lee@trager.us>, Andre Przywara <andre.przywara@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Hanjun Guo
 <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@kernel.org>,
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
References: <20260729134124.2506269-1-andre.przywara@arm.com>
 <20260729134124.2506269-4-andre.przywara@arm.com>
 <2228a2be-96b1-4c8a-9786-6ba07fd302c0@trager.us>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <2228a2be-96b1-4c8a-9786-6ba07fd302c0@trager.us>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_012056_554262_13A0D77F 
X-CRM114-Status: GOOD (  13.50  )
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

On 7/30/26 02:33, Lee Trager wrote:
> On 7/29/26 6:41 AM, Andre Przywara wrote:
> 
>> @@ -1767,6 +1781,7 @@ static int mpam_save_mbwu_state(void *arg)
>>   {
>>       int i;
>>       u64 val;
>> +    int ret;
>>       struct mon_cfg *cfg;
>>       u32 cur_flt, cur_ctl, mon_sel;
>>       struct mpam_msc_ris *ris = arg;
>> @@ -1777,7 +1792,8 @@ static int mpam_save_mbwu_state(void *arg)
>>           mbwu_state = &ris->mbwu_state[i];
>>           cfg = &mbwu_state->cfg;
>>   -        if (WARN_ON_ONCE(!mpam_mon_sel_lock(msc)))
>> +        ACQUIRE(mon_sel_lock, guard)(msc);
>> +        if (ACQUIRE_ERR(mon_sel_lock, &guard))
>>               return -EIO;
>>             mon_sel = FIELD_PREP(MSMON_CFG_MON_SEL_MON_SEL, i) |
>> @@ -1788,7 +1804,9 @@ static int mpam_save_mbwu_state(void *arg)
>>           mpam_write_monsel_reg(msc, CFG_MBWU_CTL, 0);
>>             if (mpam_ris_has_mbwu_long_counter(ris)) {
>> -            val = mpam_msc_read_mbwu_l(msc);
>> +            ret = mpam_msc_read_mbwu_l(msc, &val);
>> +            if (ret)
>> +                return ret;
>>               mpam_msc_zero_mbwu_l(msc);
>>           } else {
>>               u32 val32;
> I think checking for (val & MSMON____L_NRDRY) is still required before updating the saved state.
> mpam_msc_read_mbw_l() can return 0 while setting val to MSMON___L_NRDY when it cannot obtain a
> stable value. The state saving path later adds val to mbwu_state->correction, so the sentinel would
> corrupt the saved correction. Additionally, as Ben noted during the v3 review, hardware may also set
> the NRDY bit.

This is an existing issue which I address in this patch:
https://lore.kernel.org/linux-arm-kernel/20260710115546.29644-7-ben.horgan@arm.com/

Please can you check and see if that looks good to you.

Thanks,

Ben

>> @@ -1804,7 +1822,6 @@ static int mpam_save_mbwu_state(void *arg)
>>           cfg->partid = FIELD_GET(MSMON_CFG_x_FLT_PARTID, cur_flt);
>>           mbwu_state->correction += val;
>>           mbwu_state->enabled = FIELD_GET(MSMON_CFG_x_CTL_EN, cur_ctl);
>> -        mpam_mon_sel_unlock(msc);
>>       }
>>         return 0;


