Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BA2ACCF9FC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 13:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=auJLL78IWvyRiv8Z3SkGGwJVdNC/ugwPZHVGdPaUXw4=; b=v/UnriRPsIbLPckqsxx6VY7gAI
	RlnCcXUNm5+SC8HdTlGKh52ON7wCQTdu1/soiWYgUsUJOizo5QKBqUzQunY1p4BtXNElNTPsZwkdT
	4vJ6B+5Xu50XmrtyP+qpmHxaXtgEj/2nwAL8L9fqFTT0zW1eF+tn89XcVrkbeJ8EXidk4wgoT8MfF
	zmxEeWLsvj5wEBl30K7t5vtmW3m8XZGOnlCJ/ADK448mB5g61GrUhuIXkOEYVTn+reZefdji/ubMe
	Wo7Mvx/Y8EM/4zOj2QAuR6SP/U6sFJUAAd4/eYHjNeFkZNA4Vf6EbUTmW8iFW+5Ifcr8feiWo1LnJ
	Vld49o2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vESiL-00000004CVj-1jBJ;
	Thu, 30 Oct 2025 13:29:17 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vESiH-00000004CVM-3Rlz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 13:29:15 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-59310014b8eso1079841e87.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Oct 2025 06:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=immunant-com.20230601.gappssmtp.com; s=20230601; t=1761830951; x=1762435751; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=auJLL78IWvyRiv8Z3SkGGwJVdNC/ugwPZHVGdPaUXw4=;
        b=YdGWkF89Nb9jWCtmUX33jdBypTrBBuxtSul3Ta9kc/ZCjDmnOR/TBIir4QmDUKUx7Y
         yGNe08xPq3DE4s0HLaPo+R4ZD8223qdA+zSkTF/XY2u4bXF7rEgp84S066Qqg1uEHtbZ
         o0q1e8H0KOUaMVqGSCoYN9liZpknSDXpbwORAfMTGVBprIH1D2RpO1Sk2B35wjp1kx6T
         SCf4OL0ybR9kvxrhQKcqY9iXUj2lX3KDQjuOyDW79N2LHrIvykRrwdjUzb5pR2vEQ/mg
         3qQKm8n3yoSGx4MGsirrvv37Eq97YM8weUkEAT94733hQHXJrycnNFbeFKTfNIZaUVts
         SKmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761830951; x=1762435751;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=auJLL78IWvyRiv8Z3SkGGwJVdNC/ugwPZHVGdPaUXw4=;
        b=IxQM5qqMXW4ODg8YPThz/zLbqyv+hYuGJRNMgPj9BQO4ePeLtIx7B5WWXW15ikWG5y
         NH/K38WnNmWNvpNHq2yE2wJSIJVyNZDPQoGcEIaLWSBvgrTLLD1cv3pCg1AlX5qFqQJi
         xAp0Yzep04G3APC1XZIdDMzTmnMDfBvjwQUEO1S9gK+Mn8qcItyLHDjAWqsnMINaKvWU
         LL/B+G+jSM8DSIjtsn+8CNRF1EkcWukwhwV8lvd6H8QG2C+nCKO47VmjqkEyJEO93DvC
         51zRCXJFegZzX2+gVvSvS9fQ+Lly/ydrFw7YR+0teFArPqUk2+IDuf4pCIycmuVr8paJ
         rymw==
X-Forwarded-Encrypted: i=1; AJvYcCWoQ2DIzGYDLfM7tK+5e4zKosvC/ysMIb5PoHQPPVcvwaueOesyfXNckyCUP2R4NrS2gfyaVbft0v6+OTaExBkW@lists.infradead.org
X-Gm-Message-State: AOJu0YxDdERLn23Ecidzh5e23tYvq4HIReUNwBWFES6jOTELdqMF4yB7
	lXM+80sBiHeBnduncEp8QLGFGl+5leH0dZAgnQBK+f3ip3c+DxTbakL2vjTWYU9QNvc=
X-Gm-Gg: ASbGnctqVGuOQkwMoLRh22PyYzX3W2J6xJcGEZq2fRhMC+Qh7CravEiZMFESsm3ktXk
	zbf3OZ2jqqq6DmMn8YXhB0Y1KKm4PsL4lwzO7xdZXSIqdnoP9iBX3rfZH14HFySrqqzFhbwGpSn
	eqhH72ujZVftHVNAh0/ZCbwBjT5SyMeIrq+iJFg6grTdldFH9GSAelYn9vYN4LhHcFZQ39P5TJz
	lSgGkHtrw52WDD4zXc8QcVspRUcocWdEkTdiVAPLYy+UoYII/rxixhBP9OacPHzcoNApJTYXZea
	KJAzoe4UXStBIUNSCnn7piwY4FQChn74LFupkWV5rODPVLqA1z2hmf0UG8Pr7YYqSeZ9UPFTvrE
	sy19nVKb0Wb2MJa+qOqqoG6NuuMSIYAKiabBbz5qZVlNcDUtrN+YQMWsZ5TD1LUDEitWrYopvsM
	JnRielZpzksMVOS2UZzlAL5tE8JRymYqDJkZ0vmurnq1ceTNYPbsAf+F/74nQXW+53Zg==
X-Google-Smtp-Source: AGHT+IH+7r03/reqlDO5F/xWopHhAZmJ6AzdE8dl2+vnGjXgF+KVVuZqJNmKyiG5BCz+kU/FitGyxg==
X-Received: by 2002:a05:6512:2312:b0:591:d903:4384 with SMTP id 2adb3069b0e04-594128df108mr2867146e87.51.1761830950729;
        Thu, 30 Oct 2025 06:29:10 -0700 (PDT)
Received: from [192.168.1.11] (0x5da5f0d7.static.cust.fastspeed.dk. [93.165.240.215])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59301f48bc5sm4562968e87.30.2025.10.30.06.29.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Oct 2025 06:29:09 -0700 (PDT)
Message-ID: <96171283-6f2a-45b5-b889-be1bee91678c@immunant.com>
Date: Thu, 30 Oct 2025 14:29:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] KVM: arm64: support optional calls of FF-A v1.2
To: Yeoreum Yun <yeoreum.yun@arm.com>, Ben Horgan <ben.horgan@arm.com>
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com,
 suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com,
 will@kernel.org, perlarsen@google.com, ayrton@google.com,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20251027191729.1704744-1-yeoreum.yun@arm.com>
 <20251027191729.1704744-3-yeoreum.yun@arm.com>
 <f5aa3c19-fdea-4f62-9541-530e59b20a87@arm.com>
 <aQEwVe8+okm/Nmso@e129823.arm.com>
 <61e923d6-388b-4cc6-8c26-5581a1e1cc10@arm.com>
 <aQIYZoP5iKcwtXwW@e129823.arm.com>
Content-Language: en-US
From: Per Larsen <perl@immunant.com>
In-Reply-To: <aQIYZoP5iKcwtXwW@e129823.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_062914_136652_6C46501B 
X-CRM114-Status: GOOD (  26.86  )
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

Hi Yeoreum,

On 10/29/25 2:36 PM, Yeoreum Yun wrote:
> Hi Ben,
> 
>>
>> On 10/28/25 21:06, Yeoreum Yun wrote:
>>> Hi Ben,
>>>
>>>>> To use TPM drvier which uses CRB over FF-A with FFA_DIRECT_REQ2,
>>>>> support the FF-A v1.2's optinal calls by querying whether
>>>>> SPMC supports those.
>>>>>
>>>>> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
>>>>> ---
>>>>>   arch/arm64/kvm/hyp/nvhe/ffa.c | 19 ++++++++++++++++++-
>>>>>   1 file changed, 18 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
>>>>> index 0ae87ff61758..9ded1c6369b9 100644
>>>>> --- a/arch/arm64/kvm/hyp/nvhe/ffa.c
>>>>> +++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
>>>>> @@ -646,6 +646,22 @@ static void do_ffa_mem_reclaim(struct arm_smccc_1_2_regs *res,
>>>>>   		ffa_to_smccc_res(res, ret);
>>>>>   }
>>>>>
>>>>> +static bool ffa_1_2_optional_calls_supported(u64 func_id)
>>>>> +{
>>>>> +	struct arm_smccc_1_2_regs res;
>>>>> +
>>>>> +	if (!smp_load_acquire(&has_version_negotiated) ||
>>>>> +		(FFA_MINOR_VERSION(FFA_VERSION_1_2) < 2))
>>>>> +		return false;
>>>>> +
>>>>> +	arm_smccc_1_2_smc(&(struct arm_smccc_1_2_regs) {
>>>>> +		.a0 = FFA_FEATURES,
>>>>> +		.a1 = func_id,
>>>>> +	}, &res);
>>>>> +
>>>>> +	return res.a0 == FFA_SUCCESS;
>>>>> +}
>>>>> +
>>>>>   /*
>>>>>    * Is a given FFA function supported, either by forwarding on directly
>>>>>    * or by handling at EL2?
>>>>> @@ -678,12 +694,13 @@ static bool ffa_call_supported(u64 func_id)
>>>>>   	case FFA_NOTIFICATION_SET:
>>>>>   	case FFA_NOTIFICATION_GET:
>>>>>   	case FFA_NOTIFICATION_INFO_GET:
>>>>> +		return false;
>>>>>   	/* Optional interfaces added in FF-A 1.2 */
>>>>>   	case FFA_MSG_SEND_DIRECT_REQ2:		/* Optional per 7.5.1 */
>>>>>   	case FFA_MSG_SEND_DIRECT_RESP2:		/* Optional per 7.5.1 */
>>>>>   	case FFA_CONSOLE_LOG:			/* Optional per 13.1: not in Table 13.1 */
>>>>
>>>> Looking at table 13.54 in the FF-A 1.2 spec FFA_CONSOLE_LOG is only supported in secure FF-A
>>>> instances and not from the normal world.
>>>
>>> Thanks. in that case, we can return false for FFA_CONSOLE_LOG
>>> unconditionally.
>>>
>>>>
>>>>>   	case FFA_PARTITION_INFO_GET_REGS:	/* Optional for virtual instances per 13.1 */
>>>>> -		return false;
>>>>> +		return ffa_1_2_optional_calls_supported(func_id);
>>>>>   	}
>>>>
>>>> I don't think that an smc call here is the right thing to do. This changes this from a light
>>>> weight deny list to an extra smc call for each ffa_msg_send_direct_req2 from the driver.
>>>>
>>>> Instead, I would expect this patch just to remove FFA_MSG_SEND_DIRECT_REQ2 from the deny list
>>>> and rely on the TPM driver to use FFA_FEATURES to check whether it's supported.
>>>>
>>>> So, just this change:
>>>>
>>>> @@ -679,7 +679,6 @@ static bool ffa_call_supported(u64 func_id)
>>>>          case FFA_NOTIFICATION_GET:
>>>>          case FFA_NOTIFICATION_INFO_GET:
>>>>          /* Optional interfaces added in FF-A 1.2 */
>>>> -       case FFA_MSG_SEND_DIRECT_REQ2:          /* Optional per 7.5.1 */
>>>>          case FFA_MSG_SEND_DIRECT_RESP2:         /* Optional per 7.5.1 */
>>>>          case FFA_CONSOLE_LOG:                   /* Optional per 13.1: not in Table 13.1 */
>>>>          case FFA_PARTITION_INFO_GET_REGS:       /* Optional for virtual instances per 13.1 */
>>>>
>>>> Am I missing something?
>>>
>>> Nope. I think you don't think you miss anything and
>>> I also think about it.
>>>
>>> But, I'm not sure about "support" means in the pkvm about FF-A.
>>> Anyway unless the SPMC doesn't support the specific FF-A ABI,
>>> I don't know that's meaningful to return "TRUE" in here.
>>> IOW, suppose pkvm returns supports of  FFA_MSG_SEND_DIRECT_REQ2
>>> but user receive when it calls FFA_MSG_SEND_DIRECT_REQ2 with NOT SUPPORTED.
>>
>> As I understand it, the ffa_call_supported() is used in two places:
>> 1. To return NOT SUPPORTED to an FFA_FEATURE call for ffa calls that are
>> on the deny list.
>> 2. To block ffa calls if they are on the deny list.
>>
>> For both your patch and just removing FFA_MSG_SEND_DIRECT_REQ2 from the
>> denylist I think the behaviour is the same.
>>
>> If FFA_MSG_SEND_DIRECT_REQ2 is not supported at the spmc then:
>> a) an FFA_FEATURE call will return not supported
>> b) an FFA_MSG_SEND_DIRECT_REQ2 will return not supported
>>
> 
> Right! I've missed the FFA_FEATURE handles via default_host_smc_handler().
> As you said, it just a deny list.
> 
> Thanks. I'll change it.
Sorry to jump into the discussion very late. I uploaded a patch set 
which adds support for the FFA_MSG_SEND_DIRECT_REQ2 interface which was 
originally developed for the Android common kernels:

https://lore.kernel.org/all/20251030-host-direct-messages-v1-0-463e57871c8f@google.com/T/#t 


Since there appears to be an upstream use case for this functionality, 
it might be a good building block for the present patch set.

Thanks,
Per

