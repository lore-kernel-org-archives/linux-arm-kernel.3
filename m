Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B408C4450A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 00:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A77kqTT6RG06qU9VfBbjIwsnkZcXnKT3rnXPGJRMQPg=; b=c/Mz5X9Q3xaDBqpwmpOgx8ijhc
	L7DLTgoLoQVp8SDOjPvqskCHcXYBJgvc6OrMWsZ6R+7QUA+PXe2RIOQIvwDMr1OQg7MdEXaJZyvOR
	nSI3p5As2XbkwaplzMYDoYgAjV1DppyCCLl2Ysg7s1ELxY7bH7dPpPQXsY4AyK1RXBVA6l/NaC+/0
	Zdb0M5MfOwq3tJsa8A6wVu394TYzhWdiSsnfZvsJXN9jzcKU2+XGfBstqP0sFS2VZoXPRZg/mYmzr
	qo9sJiuJU5NIvyBYeTgnIeReHxB+oiYZfF1J+yWiEAZVmnu7mORtpZxcHClJfCh43bT0JrFQKWy5P
	HcOgnabw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkWoo-00000000rHy-37NI;
	Fri, 17 Jul 2026 00:52:46 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkWom-00000000rH6-1NQW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 00:52:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784249563;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A77kqTT6RG06qU9VfBbjIwsnkZcXnKT3rnXPGJRMQPg=;
	b=SKxceqcMmw4AHiusTj7jU0WpnMXSrg07hrYBl8I0D362JgR7y5vjGRZi+JgbbIbiHymnjo
	nOlhoFBg4VBoFfWl2u+nsTaMk+6bnbym1VAJqhaGWIIUKvcx4eMV7NGkgNd1laaeCJ22Xm
	W8TZgIj4pYo6Q5RMlb94ds4lJuDZvTc=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-439-nAsWjAzOMaOW4X_RRXTJBg-1; Thu, 16 Jul 2026 20:52:40 -0400
X-MC-Unique: nAsWjAzOMaOW4X_RRXTJBg-1
X-Mimecast-MFC-AGG-ID: nAsWjAzOMaOW4X_RRXTJBg_1784249559
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38dc101287aso8359809a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jul 2026 17:52:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784249559; x=1784854359;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A77kqTT6RG06qU9VfBbjIwsnkZcXnKT3rnXPGJRMQPg=;
        b=Mne5OgYA5tHNKSzdTV4XDKq1ehInhQdXqQ61rf0oP7n2wjOYK3JQVk0glEkWHDorxd
         tCbN2kFLFJk/vmkwQyzVBcE7/L9d9dS5gjiHY9jAc098dy3kfByPvHp78HfxGJILmpwt
         R5OUK8oE+W3g2SV+DzhZm3hsyHgP9uFMJxcJV8Jn+90THjv7KYm7F0qlVED7kF+iDWTe
         BwNWpe7/TnWq30YdMeLq9BVW3hsjJs2iXwBdm7PtxanNSr2neYcxRyQ3xV3z2HEJm8dh
         Anl2cStX06tEvju35+x3gMH3tY9GfkfP8nZHLOCXSLbKuxOBcR03+mXkzqbZhhZTwkRC
         wogw==
X-Forwarded-Encrypted: i=1; AHgh+RoAE6GgJdZiIhLM1haQcdpy7xIsguSEOd+zZVgtdyTq9JNTP+q0IOeljRcyTHnflZCj5b4w3UmDrKI6bgDkDcqV@lists.infradead.org
X-Gm-Message-State: AOJu0Yzxo6Lo9NZr2Y7P5RO7+FX2/RYn2VQZ2DrGoBe8BehSmvhEmviI
	4AzH5Qq1OGAnqoJFsutrOFZ37ALAK1yJ6CjnbGFSwBNwxHOA7sMQ0KzWZ1w+JWjhp6Luztt4WHv
	eNR23HVv6LYj87CFEiFDJocFWXY5YEH/LI+z6ylQAlJXQ8YkxIyCPcWIf5ToGQgRqkVx1nS0ae3
	P4
X-Gm-Gg: AfdE7cl6HeywDZjfYgBKZxHGB+quqSBntiU87zrtxZzcJYW3mjNJqRtylY3FxmI15AZ
	2S53lIXLM6gB5roxTMVDrXoGQo4PsBUdSQzIgv93ENLkIif04UyNMMcbQ5pNr7XL+sCXiSpbdE3
	tr76jPNn+WNKzz6H4uJjwxxbLdMFMg97AqHeTL8oRw8bVA7gGg7uqMChT5IHMTHGo4R1fC3u7WI
	UEd+7Osdf7vgZlmZykapKZ+DtWUWCmSi3QP4EPW73FGj4mqYspSOEdSHbHgE8Febq1fZBEpP7Yy
	akQIO2RbXNaZMfNe/C7py/IirCnf400UPLN4eirARnq40tEhYcMHCiJ6OZVIDvw0kgqhHXHya/z
	MlvsCQoVG2528yLLcLKD4OkOxn5KnNMhjKIQ8kKhBUyI=
X-Received: by 2002:a17:90b:4fc3:b0:38d:dfd1:7c1 with SMTP id 98e67ed59e1d1-38e4b418a20mr419359a91.2.1784249559036;
        Thu, 16 Jul 2026 17:52:39 -0700 (PDT)
X-Received: by 2002:a17:90b:4fc3:b0:38d:dfd1:7c1 with SMTP id 98e67ed59e1d1-38e4b418a20mr419337a91.2.1784249558530;
        Thu, 16 Jul 2026 17:52:38 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a20bf96sm637961eec.28.2026.07.16.17.52.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jul 2026 17:52:37 -0700 (PDT)
Message-ID: <6f5ac6c5-1779-496a-ac3d-c5f7a23c55ca@redhat.com>
Date: Fri, 17 Jul 2026 10:52:32 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 03/11] arm_mpam: Set mpam_feat_msmon_mbwu_31counter
 when there are bandwidth counters
To: Ben Horgan <ben.horgan@arm.com>
Cc: james.morse@arm.com, reinette.chatre@intel.com, fenghuay@nvidia.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dave.martin@arm.com, andre.przywara@arm.com
References: <20260710115546.29644-1-ben.horgan@arm.com>
 <20260710115546.29644-4-ben.horgan@arm.com>
 <c1779945-2ad1-48c7-9b13-1eea8afed687@redhat.com>
 <45d93047-9f11-468a-bee9-777089fd4bb8@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <45d93047-9f11-468a-bee9-777089fd4bb8@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Xf0xpYBlvLVtzGY9CFmcG3848On6BKFs7qIo3vdc78Y_1784249559
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_175244_443841_FC544214 
X-CRM114-Status: GOOD (  17.32  )
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

On 7/16/26 7:26 PM, Ben Horgan wrote:
> On 7/16/26 05:18, Gavin Shan wrote:
>> On 7/10/26 9:55 PM, Ben Horgan wrote:
>>> If there are memory bandwidth counters then there are 31 bit counters even
>>> if there are also 44 bit counters or 63 bit counters.
>>>
>>> Set the 31 bit bandwidth counter feature bit whenever there are bandwidth
>>> counters.
>>>
>>> Fixes: fdc29a141d63 ("arm_mpam: Probe for long/lwd mbwu counters")
>>> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
>>> ---
>>>    drivers/resctrl/mpam_devices.c | 4 ++--
>>>    1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>
>> It might be worthwhile to put some context in the commit log helping readers
>> to correlate to the specification. What I found is something like below in
>> section 8.2.1.2 Long MBWU counter and capture of ARM IHI 0099A.a:
>>
>> In MSMON_MBWU, the VALUE field is always 31 bits. If MSMON_MBWU_L is implemented,
>> the length of the VALUE field is either 63 or 44 bits as set by MPAMF_MBWUMON_IDR.LWD.
> 
> How about?
> 
> When MPAMF_MSMON_IDR.MSMON_MBWU is 1, MSMON_MBWU is present and has a VALUE field of 31 bits. If
> additionally, MPAMF_MBWUMON_IDR.HAS_LONG is 1, then MSMON_MBWU_L is also present and has a VALUE
> field of 44 or 63 bits as indicated by MPAMF_MBWUMON_IDR.LWD.
> 

Looks good to me, thanks!

> Thanks,
> 
> Ben
> 

Thanks,
Gavin

>>
>>> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
>>> index acfa9a4dc2fc..11b10c3bc334 100644
>>> --- a/drivers/resctrl/mpam_devices.c
>>> +++ b/drivers/resctrl/mpam_devices.c
>>> @@ -930,9 +930,9 @@ static void mpam_ris_hw_probe(struct mpam_msc_ris *ris)
>>>                            mpam_set_feature(mpam_feat_msmon_mbwu_63counter, props);
>>>                        else
>>>                            mpam_set_feature(mpam_feat_msmon_mbwu_44counter, props);
>>> -                } else {
>>> -                    mpam_set_feature(mpam_feat_msmon_mbwu_31counter, props);
>>>                    }
>>> +
>>> +                mpam_set_feature(mpam_feat_msmon_mbwu_31counter, props);
>>>                }
>>>            }
>>>        }
>>
>> Thanks,
>> Gavin
>>
> 


