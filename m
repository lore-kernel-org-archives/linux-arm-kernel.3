Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76D1FC531C7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 10:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WoIFf8HoL9YR7fi53WqXEjeNDLvpI1tSCji/JSGFdGk=; b=HuMovWqNXeYV3fFzJq/e6H5bg+
	BbzemXH60/iZDSfgb4hWWXbeddlr2MYjzSLADTGoOssaQb2Ibp+z396byhfsKz5DmIfpkWZx31pvx
	qaSSbG6xVY+YXrbwpIlyrh1fGMZumrsCMqaEIQ3MY4IOJ6/zbSwRzzvuVKeJuN8u+sJ86rYiYWraZ
	l4/Y2JI4Olw4qGo0sRKf07nEQCX+EnTJbLbi+Vh4uEHFcNqRb6dEyj5FaX4EugSlIT+my+WRVLYkk
	AQv+baIn2Z/DXc3WRdnvKKIwGd4fHmFW9hC45p/S4vCo0aYgk9rZzNEWzgnWBYQ0ZHObwuKJF9AJQ
	kIynk8tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmqXa-0000000E0XU-2IIe;
	Thu, 23 Jul 2026 10:20:34 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmqXX-0000000E0Ww-3yxk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 10:20:33 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7CC361477;
	Thu, 23 Jul 2026 03:20:24 -0700 (PDT)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0419B3F86F;
	Thu, 23 Jul 2026 03:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784802028; bh=DEwZHcaCuIqEH85LWq1xXjbGMYiVUhbTerLFXP69HkQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KEDQDiaEKPA/TdWauC8U9sHV45XGgwSTYi9Ko6GB+pKc5mcgbBhBa45j3CkH9ouOK
	 WLB4mSl+c98YzV4FJ2+2In7xkEVwZYUxGQlL/+6A17rIB284TpDJ/2P0/LKqrLYZ5P
	 tXjil7qNGxzQQFWbwxaXIDq/XQ7WGrkOGbtUR3BY=
Message-ID: <e2db0e66-1d88-4501-a3cd-b805193fe5a9@arm.com>
Date: Thu, 23 Jul 2026 11:20:24 +0100
MIME-Version: 1.0
User-Agent: Thunderbird Daily
Subject: Re: [PATCH v3 07/16] arm_mpam: __ris_msmon_read(): get rid of nrdy
 special handling
To: Andre Przywara <andre.przywara@arm.com>,
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
References: <20260710144520.917375-1-andre.przywara@arm.com>
 <20260710144520.917375-8-andre.przywara@arm.com>
 <b5f54fad-b7a0-4949-b78a-fe684eeb4d75@arm.com>
 <c2c995a2-6834-4210-a9ee-60f8983be135@arm.com>
 <778a9fc1-cc11-4d7f-b5a5-78a1740520a1@arm.com>
 <e23ce4fe-6d6d-45e2-ab8e-5ec3a52af0e0@arm.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <e23ce4fe-6d6d-45e2-ab8e-5ec3a52af0e0@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_032032_082574_B32C2CE6 
X-CRM114-Status: GOOD (  35.42  )
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

Hi Andre,

On 7/23/26 10:45, Andre Przywara wrote:
> Hi Ben,
> 
> On 7/20/26 18:09, Ben Horgan wrote:
>> Hi Andre,
>>
>> On 7/20/26 16:58, Andre Przywara wrote:
>>> Hi Ben,
>>>
>>> thanks for having a look!
>>>
>>> On 7/15/26 15:39, Ben Horgan wrote:
>>>> Hi Andre,
>>>>
>>>> On 7/10/26 15:45, Andre Przywara wrote:
>>>>> Although so far MSC accesses couldn't fail, there is one special
>>>>> condition that would create an error: when the MBWU counter wouldn't be
>>>>> able to read a stable value, we were setting bit 63 to mark this value
>>>>> as unstable, and return this as an error later.
>>>>> Now since the functions can return a proper error value, we can get rid of
>>>>> this kludge and use the return value directly.
>>>>>
>>>>> Remove the "nrdy" error flag variable, and assign -EBUSY to "ret" to handle
>>>>> this case.
>>>>
>>>> I don't think we want this patch. The h/w can still return (as much as it ever could) and so we
>>>> still need to handle it even if we are no longer augmenting its meaning in software to also
>>>> indicate
>>>> an unstable 64 bit value.
>>>
>>> Mmh, not sure I understand your concern: to me it looks like nrdy is some kind of error flag, that
>>> we used in absence of a proper error return value. Now we have "int ret;", so can use that directly?
>>> But to me it looks like nothing really changes, or did I miss something?
>>>
>>> I have no really strong opinion of this patch, it was more an pportunity to consolidate the crude
>>> error handling in this function. I am happy to drop it, if you like, maybe we can revisit this
>>> later.
>>
>> What I was trying to say is that mpam_msc_read_mbwu_l() could previously return a value with bit 63,
>> MSMON__L_NRDY set in two cases, one set by s/w and one set by h/w. Either when it reads that
>> directly from the hardware or when it is set in the function to indicate an unstable value. The h/w
>> case is the same for 31 bit counters too except in that case the h/w sets bit 31, MSMON_NRDY. Using
>> 'ret' to directly return -EBUSY for the s/w case where a stable value is not reached for 44 or 63
>> bit counters doesn't mean that the h/w case won't happen.
> 
> I am not sure I see the problem, the idea of this patch was to use the opportunity of having now a
> proper return value, and to not hide that "nrdy" is actually an error flag. If I read the code
> correctly, then at the moment we flag the error early (using nrdy), but then continue with
> (potentially bogus?) "now" calculations, only to discard them towards the end of the function, to
> return an error when nrdy was set. So my idea was to just handle the error case early and return.
> Or do you mean I was just missing one case where NRDY was set?

I think the problem comes in patch 4 actually. Where you remove the checking for L_NRDY, which can
still be read from h/w. Both long and 31 bit counters would need to be considered for this kind of
cleanup.

> 
> In any case, to not jeopardise the whole series over this rather opportunistic patch, I will just
> drop any changes to nrdy handling. This makes the remaining patches easier to understand, I guess,
> since they are now more or less schematic "if (err) return err;" changes.
> 
> I think we can clean this up later if needed, in a follow up patch.

Sure.

Thanks,

Ben

> 
> Thanks,
> Andre
> 
>>>>>
>>>>> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
>>>>> ---
>>>>>    drivers/resctrl/mpam_devices.c | 38 +++++++++++++++-------------------
>>>>>    1 file changed, 17 insertions(+), 21 deletions(-)
>>>>>
>>>>> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
>>>>> index 84a8715464be..530ac0fe97b5 100644
>>>>> --- a/drivers/resctrl/mpam_devices.c
>>>>> +++ b/drivers/resctrl/mpam_devices.c
>>>>> @@ -1306,7 +1306,6 @@ static void __ris_msmon_read(void *arg)
>>>>>        u64 now;
>>>>>        int ret;
>>>>>        u32 now32;
>>>>> -    bool nrdy = false;
>>>>>        bool config_mismatch;
>>>>>        bool overflow = false;
>>>>>        struct mon_read *m = arg;
>>>>> @@ -1371,14 +1370,18 @@ static void __ris_msmon_read(void *arg)
>>>>>        switch (m->type) {
>>>>>        case mpam_feat_msmon_csu:
>>>>>            ret = mpam_read_monsel_reg(msc, CSU, &now32);
>>>>> +        if (!ret) {
>>>>> +            if ((now32 & MSMON___NRDY))
>>>>> +                ret = -EBUSY;
>>>>> +
>>>>> +            if (mpam_has_quirk(IGNORE_CSU_NRDY, msc) &&
>>>>> +                m->waited_timeout)
>>>>> +                ret = 0;
>>>>> +        }
>>>>>            if (ret)
>>>>>                goto out_unlock;
>>>>> -        nrdy = now32 & MSMON___NRDY;
>>>>> -        now = FIELD_GET(MSMON___VALUE, now32);
>>>>> -
>>>>> -        if (mpam_has_quirk(IGNORE_CSU_NRDY, msc) && m->waited_timeout)
>>>>> -            nrdy = false;
>>>>>    +        now = FIELD_GET(MSMON___VALUE, now32);
>>>>>            break;
>>>>>        case mpam_feat_msmon_mbwu_31counter:
>>>>>        case mpam_feat_msmon_mbwu_44counter:
>>>>> @@ -1394,9 +1397,11 @@ static void __ris_msmon_read(void *arg)
>>>>>                    now = FIELD_GET(MSMON___L_VALUE, now);
>>>>>            } else {
>>>>>                ret = mpam_read_monsel_reg(msc, MBWU, &now32);
>>>>> +            if (!ret && (now32 & MSMON___NRDY))
>>>>> +                ret = -EBUSY;
>>>>>                if (ret)
>>>>>                    goto out_unlock;
>>>>> -            nrdy = now32 & MSMON___NRDY;
>>>>> +
>>>>>                now = FIELD_GET(MSMON___VALUE, now32);
>>>>>            }
>>>>>    @@ -1404,9 +1409,6 @@ static void __ris_msmon_read(void *arg)
>>>>>                m->type != mpam_feat_msmon_mbwu_63counter)
>>>>>                now *= 64;
>>>>>    -        if (nrdy)
>>>>> -            break;
>>>>> -
>>>>>            mbwu_state = &ris->mbwu_state[ctx->mon];
>>>>>              if (overflow)
>>>>> @@ -1419,22 +1421,16 @@ static void __ris_msmon_read(void *arg)
>>>>>            now += mbwu_state->correction;
>>>>>            break;
>>>>>        default:
>>>>> -        m->err = -EINVAL;
>>>>> +        ret = -EINVAL;
>>>>>        }
>>>>> -    mpam_mon_sel_unlock(msc);
>>>>> -
>>>>> -    if (nrdy)
>>>>> -        m->err = -EBUSY;
>>>>> -
>>>>> -    if (!m->err)
>>>>> -        *m->val += now;
>>>>> -
>>>>> -    return;
>>>>>      out_unlock:
>>>>>        mpam_mon_sel_unlock(msc);
>>>>>    -    m->err = ret;
>>>>> +    if (ret)
>>>>> +        m->err = ret;
>>>>> +    else
>>>>> +        *m->val += now;
>>>>>    }
>>>>>      static int _msmon_read(struct mpam_component *comp, struct mon_read *arg)
>>>>
>>>
>>
> 


