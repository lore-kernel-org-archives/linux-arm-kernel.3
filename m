Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8528FCCF9E9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 09:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rdHFlC8nvve3L+DygO7m6zYboTHN2Cj0QppHtISzmsw=; b=ZMqKjjLrAI3vtoITZiS5wVfnj8
	dNqR8Z64NgKdMPEFhX5nzmzuN5epnOL8uhgy9KfLXsNFrNpvucmrIG3yHL5yIjlh/YHaJl8DCMPul
	7w9noftXAdDjhizctqB7EqqxwwaWFrJTlitOj5B90cczlxX14RRIIup79O9YujFOvp67xLxoVdmWX
	YuQXZCe0VPJXOXz0GJNbSwc9HV9YgxRFbUQz1NZLwNc4a0a5uCMEddHjCdPKJtAS884QfyNAc1INt
	snN3xaOYyXZ4NnfWxVdUfuZDoFXWjVyzj3YDB90krRIWtuiwspESWiQnOPzAETLy/cOOiuYb6gS6k
	5j+pIR+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE2np-00000000ZM6-1kLJ;
	Wed, 29 Oct 2025 09:49:13 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE2nl-00000000ZL1-2Xao
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 09:49:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 20F561AC1;
	Wed, 29 Oct 2025 02:49:00 -0700 (PDT)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E22E53F673;
	Wed, 29 Oct 2025 02:49:05 -0700 (PDT)
Message-ID: <61e923d6-388b-4cc6-8c26-5581a1e1cc10@arm.com>
Date: Wed, 29 Oct 2025 09:49:04 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] KVM: arm64: support optional calls of FF-A v1.2
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com,
 suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com,
 will@kernel.org, perlarsen@google.com, ayrton@google.com,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20251027191729.1704744-1-yeoreum.yun@arm.com>
 <20251027191729.1704744-3-yeoreum.yun@arm.com>
 <f5aa3c19-fdea-4f62-9541-530e59b20a87@arm.com>
 <aQEwVe8+okm/Nmso@e129823.arm.com>
From: Ben Horgan <ben.horgan@arm.com>
Content-Language: en-US
In-Reply-To: <aQEwVe8+okm/Nmso@e129823.arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_024909_738306_B3C515FE 
X-CRM114-Status: GOOD (  29.23  )
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

Hi Levi,

On 10/28/25 21:06, Yeoreum Yun wrote:
> Hi Ben,
> 
>>> To use TPM drvier which uses CRB over FF-A with FFA_DIRECT_REQ2,
>>> support the FF-A v1.2's optinal calls by querying whether
>>> SPMC supports those.
>>>
>>> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
>>> ---
>>>  arch/arm64/kvm/hyp/nvhe/ffa.c | 19 ++++++++++++++++++-
>>>  1 file changed, 18 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
>>> index 0ae87ff61758..9ded1c6369b9 100644
>>> --- a/arch/arm64/kvm/hyp/nvhe/ffa.c
>>> +++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
>>> @@ -646,6 +646,22 @@ static void do_ffa_mem_reclaim(struct arm_smccc_1_2_regs *res,
>>>  		ffa_to_smccc_res(res, ret);
>>>  }
>>>
>>> +static bool ffa_1_2_optional_calls_supported(u64 func_id)
>>> +{
>>> +	struct arm_smccc_1_2_regs res;
>>> +
>>> +	if (!smp_load_acquire(&has_version_negotiated) ||
>>> +		(FFA_MINOR_VERSION(FFA_VERSION_1_2) < 2))
>>> +		return false;
>>> +
>>> +	arm_smccc_1_2_smc(&(struct arm_smccc_1_2_regs) {
>>> +		.a0 = FFA_FEATURES,
>>> +		.a1 = func_id,
>>> +	}, &res);
>>> +
>>> +	return res.a0 == FFA_SUCCESS;
>>> +}
>>> +
>>>  /*
>>>   * Is a given FFA function supported, either by forwarding on directly
>>>   * or by handling at EL2?
>>> @@ -678,12 +694,13 @@ static bool ffa_call_supported(u64 func_id)
>>>  	case FFA_NOTIFICATION_SET:
>>>  	case FFA_NOTIFICATION_GET:
>>>  	case FFA_NOTIFICATION_INFO_GET:
>>> +		return false;
>>>  	/* Optional interfaces added in FF-A 1.2 */
>>>  	case FFA_MSG_SEND_DIRECT_REQ2:		/* Optional per 7.5.1 */
>>>  	case FFA_MSG_SEND_DIRECT_RESP2:		/* Optional per 7.5.1 */
>>>  	case FFA_CONSOLE_LOG:			/* Optional per 13.1: not in Table 13.1 */
>>
>> Looking at table 13.54 in the FF-A 1.2 spec FFA_CONSOLE_LOG is only supported in secure FF-A
>> instances and not from the normal world.
> 
> Thanks. in that case, we can return false for FFA_CONSOLE_LOG
> unconditionally.
> 
>>
>>>  	case FFA_PARTITION_INFO_GET_REGS:	/* Optional for virtual instances per 13.1 */
>>> -		return false;
>>> +		return ffa_1_2_optional_calls_supported(func_id);
>>>  	}
>>
>> I don't think that an smc call here is the right thing to do. This changes this from a light
>> weight deny list to an extra smc call for each ffa_msg_send_direct_req2 from the driver.
>>
>> Instead, I would expect this patch just to remove FFA_MSG_SEND_DIRECT_REQ2 from the deny list
>> and rely on the TPM driver to use FFA_FEATURES to check whether it's supported.
>>
>> So, just this change:
>>
>> @@ -679,7 +679,6 @@ static bool ffa_call_supported(u64 func_id)
>>         case FFA_NOTIFICATION_GET:
>>         case FFA_NOTIFICATION_INFO_GET:
>>         /* Optional interfaces added in FF-A 1.2 */
>> -       case FFA_MSG_SEND_DIRECT_REQ2:          /* Optional per 7.5.1 */
>>         case FFA_MSG_SEND_DIRECT_RESP2:         /* Optional per 7.5.1 */
>>         case FFA_CONSOLE_LOG:                   /* Optional per 13.1: not in Table 13.1 */
>>         case FFA_PARTITION_INFO_GET_REGS:       /* Optional for virtual instances per 13.1 */
>>
>> Am I missing something?
> 
> Nope. I think you don't think you miss anything and
> I also think about it.
> 
> But, I'm not sure about "support" means in the pkvm about FF-A.
> Anyway unless the SPMC doesn't support the specific FF-A ABI,
> I don't know that's meaningful to return "TRUE" in here.
> IOW, suppose pkvm returns supports of  FFA_MSG_SEND_DIRECT_REQ2
> but user receive when it calls FFA_MSG_SEND_DIRECT_REQ2 with NOT SUPPORTED.

As I understand it, the ffa_call_supported() is used in two places:
1. To return NOT SUPPORTED to an FFA_FEATURE call for ffa calls that are
on the deny list.
2. To block ffa calls if they are on the deny list.

For both your patch and just removing FFA_MSG_SEND_DIRECT_REQ2 from the
denylist I think the behaviour is the same.

If FFA_MSG_SEND_DIRECT_REQ2 is not supported at the spmc then:
a) an FFA_FEATURE call will return not supported
b) an FFA_MSG_SEND_DIRECT_REQ2 will return not supported

> 
> I'm not sure this inconsistency is allowed or not so as a defensive
> perspective.
> 
> If that allows, I don't have a any special comment for this.
> 
> Thanks!
> 
> --
> Sincerely,
> Yeoreum Yun

-- 
Thanks,

Ben


