Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02C3BC88E5C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 11:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=94ot/NkUW9As5MJhkTwENc7dewwxKgZK/8SOm5fAzho=; b=zCWais3GEpJLCj52qHKw2KRLX4
	7o+oHRnqUNoE/sg2A2BNyq7Cx89E6DvZEAaSgOH1oW5to07yq4u2o+XNtNoOm46z1/do2UrpUHuPN
	RxobbLLoge0AGWjyiar00QLTq6xoLG3m/3r+AMXr7NGUbW0kTmpM440V1ashzzDePMp0ubrc9HC9g
	CVyPe7HaT/0VOuTl4rd7y78c1s/qkBtKBB1ymhXQUHIH0v5nmmG937iZnZKn3StXragU73uIM4D7z
	2c2KWlOh5qSI5amTHOZO1+CHSypSRvnDdhW6aoTGMSJ3sB6PfPEipwWC3WYARrugp9Gw4jshKpXZ6
	JG1GDeEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6nkT-000000094b2-20nD;
	Wed, 16 Sep 2026 11:24:21 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6nkP-000000094a7-48hw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 11:24:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789557855;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=94ot/NkUW9As5MJhkTwENc7dewwxKgZK/8SOm5fAzho=;
	b=GFVe+g7Bk+mtcemQJm8oi98J0ezhK69GhTdnODJAQsYdOb8+eUlAEA+NI/DG6das4uhZH5
	Pklo+RoCKZYUki4OgrarT9tVitWZdyg0gcUAszy4LWmkHk7g/6jm8hsq06ibVLE4zntJTN
	vUIAHyNvexVtRt+/cBxZwzTqnHUbJWY=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-206-moBKHy-FNWyZELn8EdXpSQ-1; Wed, 16 Sep 2026 07:24:13 -0400
X-MC-Unique: moBKHy-FNWyZELn8EdXpSQ-1
X-Mimecast-MFC-AGG-ID: moBKHy-FNWyZELn8EdXpSQ_1789557853
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cbb92868263so4613181a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 04:24:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789557852; x=1790162652;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=94ot/NkUW9As5MJhkTwENc7dewwxKgZK/8SOm5fAzho=;
        b=CyQdiUAqGwgOu0dhG5wYsCZ8dLtpjI2HmKasjOELSLg9xkOPYZTQKbTEEE1eRM1cw0
         MXzuUgUqqaUehugsr4G/Uovyftlkny7H0A1gDsa3DF60SO6jSOcsrHQyct/ZBfA+zR06
         j+XyP4Zgurd0jmUjiAnO9Z0CBNMjOkhUQ43dYBJuXVEN8r7iOjfvB5tIlGbBtaJUqjkB
         NNx3ymOPMtMoHTVShucsRhudffKD8zRGirCjSFk/K6SYNqjUDxAE80wxHhqNXJmLrwyO
         NrigP+ooCa4dQ24pq/FfW+hI+3PmRaFgLdlEI6oKMh65akepLhkY3lF11iLHpL/teIor
         mCrw==
X-Forwarded-Encrypted: i=1; AKwUvBy0k5wWT436vJ5Bgtt9gKTa86mDKI5k4VKeZXba4keueSNRckzoYbMn2BqDiLle3edUuPtmTJ+Q5rfo2uVxo1w3@lists.infradead.org
X-Gm-Message-State: AFuF++mSopnCgU82BstJI/ofMeqD9cBphwtQBoD7RCfMNYZ2DVpUpI1k
	+V7vpp+wQ8QFaFUfoTcHoIqcZ4OksyUYXSXojo/6lbweEe11kO62L8BT6er3mMbaVFqCyi4fNjO
	GRdO+r31qPe2z8idAIFigRGKubXiBTgt1rlyCusweDvOjNqs9oUcWMxptvSvaeWa/Kto1dcJN6G
	Mc
X-Gm-Gg: AYBFou3c77BwL96QRwBUnreOe3w8JI67+yofXGRWAn0hRPlQmqPfmocjdfl8tKIHMiu
	OjffT6RNqTsAzKfhny7I0RZWFHKrfCVfjEOfA4mRUCN+evZ/pJc2YxMKKrKEpDQnOEAL5K4BT9R
	W/JwLmHgOqXhag7yYFzuM1GBiGG7wyheIbaWoG4/rXgb4mN5UxLhozYPe+J3zh+e2kx72Kq3ROd
	TIXtx4jLzok4u3mOPGYorhR/GPUpcP3eLFFp/TAElW0d9s2I3e+qNUMoxmzjAzcOyiMoEy+CXh4
	UiwAoNEAWNjieWp3GFQ97daOMcMG7iPy+leUjBfSeWslfRCXTWVUFdnv2whmQUDu52Q2TE6ooTF
	ZaYQgzcNc9ChXrhGh84yUqjp0hC3Siltvkft0T34j6Q==
X-Received: by 2002:a17:902:ebd2:b0:2dd:7ede:4c0e with SMTP id d9443c01a7336-2dd8e402c96mr56049545ad.12.1789557852596;
        Wed, 16 Sep 2026 04:24:12 -0700 (PDT)
X-Received: by 2002:a17:902:ebd2:b0:2dd:7ede:4c0e with SMTP id d9443c01a7336-2dd8e402c96mr56048745ad.12.1789557852161;
        Wed, 16 Sep 2026 04:24:12 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd89ebc548sm9967905ad.37.2026.09.16.04.24.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 04:24:11 -0700 (PDT)
Message-ID: <ea703546-3871-42f9-840b-3fe38b9dc67f@redhat.com>
Date: Wed, 16 Sep 2026 21:24:05 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm_mpam: resctrl: Catch and propagate error from
 get_cpu_cacheinfo_id()
To: Ben Horgan <ben.horgan@arm.com>, Andre Przywara <andre.przywara@arm.com>,
 James Morse <james.morse@arm.com>
Cc: Reinette Chatre <reinette.chatre@intel.com>,
 Fenghua Yu <fenghuay@nvidia.com>, Tony Luck <tony.luck@intel.com>,
 Dave Martin <Dave.Martin@arm.com>, Yin Li <yin.li@oss.qualcomm.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260902143757.3469690-1-andre.przywara@arm.com>
 <ea42f2a7-f4f7-46ab-a5e0-239c74174499@arm.com>
 <2c682691-3037-4d62-a941-bc41baca35aa@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <2c682691-3037-4d62-a941-bc41baca35aa@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: IA9vLnk3edHsmnadzYlMMDqjBsgp6TZqGbtzu5S-8qk_1789557853
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_042418_197937_D36F32FE 
X-CRM114-Status: GOOD (  23.04  )
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

On 9/16/26 7:49 PM, Ben Horgan wrote:
> Hi Andre,
> 
> On 07/09/2026 13:59, Ben Horgan wrote:
>> Hi Andre,
>>
>> On 02/09/2026 15:37, Andre Przywara wrote:
>>> get_cpu_cacheinfo_id() can fail, in which case it returns a negative
>>> error value.
>>>
>>> Check the returned value for this error condition, before passing the
>>> value on to other code, which would hide the negative number in some high
>>> value in the unsigned type.
>>>
>>> Fixes: 36528c7681b8 ("arm_mpam: resctrl: Add support for 'MB' resource")
>>> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
>>
>> This looks good to me. Out of interest what led you to find this?
>>
>> Reviewed-by: Ben Horgan <ben.horgan@arm.com>
> 
> I seem to have been a bit hasty here.
> 
> Sashiko points out at [1] that 0xFFFFFFFF is the only value we were previously considering invalid
> and that the value coming from dt or acpi can provid other valid values that would after this patch
> be considered invalid.
> 
> [1] https://sashiko.dev/#/patchset/20260902143757.3469690-1-andre.przywara%40arm.com
> 

I think Sashiko is correct that the check 'if (cache_id < 0) return -ENOENT' is incorrect
because only -1 is a invalid ID. The correct check would be:

	u32 cache_id = get_cpu_cacheinfo_id(cpu, 3);

	if (cache_id = UINT_MAX)
		return -ENOENT;

Or

	int cache_id = get_cpu_cacheinfo_id(cpu, 3);

	if (cache_id == -1)
		return -ENOENT;

Thanks,
Gavin

> Thanks,
> 
> Ben>
>> Thanks,
>>
>> Ben
>>
>>> ---
>>>   drivers/resctrl/mpam_resctrl.c | 5 ++++-
>>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
>>> index 9d223057953ab..a5e661eff86d7 100644
>>> --- a/drivers/resctrl/mpam_resctrl.c
>>> +++ b/drivers/resctrl/mpam_resctrl.c
>>> @@ -786,7 +786,10 @@ static u32 get_mba_min(struct mpam_props *cprops)
>>>   /* Find the L3 cache that has affinity with this CPU */
>>>   static int find_l3_equivalent_bitmask(int cpu, cpumask_var_t tmp_cpumask)
>>>   {
>>> -	u32 cache_id = get_cpu_cacheinfo_id(cpu, 3);
>>> +	int cache_id = get_cpu_cacheinfo_id(cpu, 3);
>>> +
>>> +	if (cache_id < 0)
>>> +		return -ENOENT;
>>>   
>>>   	lockdep_assert_cpus_held();
>>>   
>>
>>
> 
> 


