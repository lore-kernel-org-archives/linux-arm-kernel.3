Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A1C5C79F8C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 08:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=slnjdRzKX3tkjReOK7vLXvPibZZqXgwez0wFvrkE3vA=; b=Xkqwy8t6I1AaFYN0E28ewBIXSi
	mdJ48MwLfnKCSFJTInI5lLjRyqZKe3q2Kgz6r7UNwQlL8952GJ+YasHlW0bI9p/tPVP71jneX09RC
	sA2z3VBKQFtgjLzCUVqbMSBeIccQTpBhkSEOTj/Tf4YZl2Nr/bjFvPIV1OdvsB7Id2JAZkM4cEplk
	DrBw7ZADjK8tpz6UqwCj9Z7tdBwQP/SIdrKOJJLSC9t3vz/08OWRRlxucUY+AwafEoj+6Db4NzB/9
	eaC0w6SX5ljf7KykfavlEWuc5aN/7e1Roobo5k4M+/k9/2ulhxkZYHGMvmoXraiP7KsNtZlmutrYF
	+svqi5TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4DqU-0000000B9DL-2nzU;
	Wed, 09 Sep 2026 08:39:54 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4DqR-0000000B9CE-1bud
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 08:39:53 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 550F91576;
	Wed,  9 Sep 2026 01:39:46 -0700 (PDT)
Received: from [10.2.197.99] (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EA4CB3F7B4;
	Wed,  9 Sep 2026 01:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788943190; bh=4AbRZtzIP0uW3AJ/+JRlRVpE4lXeH9HEYiTBXBQIq3Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NMyI6wZw/NCEboJ0abFf86U+oE5eeHU5OnDFOA34ZhcJmQgj2tu+TMkY/Jqa6vCAH
	 5WbTkaag4OZl2gI9STO3lNgNnp5ZZ0eiePe9zoh6YBfoHF4xNy4fOkfQeSMvbhWkJi
	 IXP4CYnGuUCfaiQU5p/mFXtnkEceufCppARjFk50=
Message-ID: <44f02c8c-db52-4f3e-b5d9-f25c1c8c5f0b@arm.com>
Date: Wed, 9 Sep 2026 09:39:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v17 1/7] firmware: arm_rmm: Add SMC definitions for
 calling the RMM
To: Gavin Shan <gshan@redhat.com>, kvm@vger.kernel.org, kvmarm@lists.linux.dev
Cc: maz@kernel.org, will@kernel.org, catalin.marinas@arm.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 steven.price@arm.com, aneesh.kumar@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
 linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
 sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
 WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com
References: <20260907095942.1140734-1-suzuki.poulose@arm.com>
 <20260907095942.1140734-2-suzuki.poulose@arm.com>
 <c9990440-acab-4c6c-b67f-8bde17feddce@redhat.com>
 <aca629b2-27a0-4c47-acac-87edb3b0d3d9@arm.com>
 <52e58930-8fa4-4c75-981c-25be42d83f2d@redhat.com>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <52e58930-8fa4-4c75-981c-25be42d83f2d@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_013951_506178_DA3A13A1 
X-CRM114-Status: GOOD (  19.78  )
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

On 08/09/2026 23:41, Gavin Shan wrote:
> On 9/8/26 8:37 PM, Suzuki K Poulose wrote:
>> On 08/09/2026 07:19, Gavin Shan wrote:
>>> On 9/7/26 7:59 PM, Suzuki K Poulose wrote:
>>>> From: Steven Price <steven.price@arm.com>
>>>>
>>>> The RMM (Realm Management Monitor) provides functionality that can be
>>>> accessed by SMC calls from the host.
>>>>
>>>> The SMC definitions are based on DEN0137[1] version 2.0-bet3
>>>>
>>>> [1] https://developer.arm.com/documentation/den0137/2-0bet3/
>>>>
>>>> Signed-off-by: Steven Price <steven.price@arm.com>
>>>> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
>>
>> ...
>>
>>>> ---
>>>>   include/linux/arm-smccc-rmi.h | 494 ++++++++++++++++++++++++++++++ 
>>>> ++++
>>>>   1 file changed, 494 insertions(+)
>>>>   create mode 100644 include/linux/arm-smccc-rmi.h
>>>>
>>>
>>> Some nitpicks below, please pick up the commits that look reasonable :)
>>>
>>
>>
>>>> +
>>>> +#define RMI_RETURN_STATUS_MASK        (0xFFUL)
>>>> +#define RMI_RETURN_INDEX_MASK        (0xFFUL << 8)
>>>> +#define RMI_RETURN_MEMREQ_MASK        (0x3UL << 8)
>>>> +#define RMI_RETURN_CAN_CANCEL_MASK    (0x1UL << 10)
>>>> +
>>>> +#define RMI_RETURN_STATUS(ret) FIELD_GET(RMI_RETURN_STATUS_MASK, ret)
>>>> +#define RMI_RETURN_INDEX(ret)        
>>>> FIELD_GET(RMI_RETURN_INDEX_MASK, ret)
>>>> +#define RMI_RETURN_MEMREQ(ret) FIELD_GET(RMI_RETURN_MEMREQ_MASK, ret)
>>>> +#define RMI_RETURN_CAN_CANCEL(ret) 
>>>> FIELD_GET(RMI_RETURN_CAN_CANCEL_MASK, ret)
>>>> +
>>>
>>> If I'm correct enough, RMI_RETURN_{STATUS, INDEX, MEMREQ, CAN_CANEL} 
>>> _MASK are used
>>> for once in this header file. So we needn't explicitly expose them 
>>> and combine their
>>> definitions with users to fetch the corresponding fields, as below.
>>>
>>> #define RMI_RETURN_STATUS(ret)        FIELD_GET(GENMASK(7, 0), ret)
>>> #define RMI_RETURN_INDEX(ret)        FIELD_GET(GENMASK(15, 8), ret)
>>> #define RMI_RETURN_MEMREQ(ret)        FIELD_GET(GENMASK(10, 8), ret)
>>> #define RMI_RETURN_CAN_CANCEL(ret)    FIELD_GEt(GENMASK(10, 10), ret)
>>
>> I belive the header files were generated from a tool (by Steven) and
>> these would make it easier to compare with the generated header file for
>> any deviation from the spec. So, I am a bit reluctant make these
>> changes.
>>
>> That said, I am happy to convert the mask definitions to GENMASK() for
>> consistency and readability. i.e., something like:
>>
>> diff --git a/include/linux/arm-smccc-rmi.h b/include/linux/arm-smccc- 
>> rmi.h
>> index 3eb88caf40964..078197284415e 100644
>> --- a/include/linux/arm-smccc-rmi.h
>> +++ b/include/linux/arm-smccc-rmi.h
>> @@ -139,10 +139,10 @@
>>   #define RMI_ABI_VERSION_GET_MINOR(version) ((version) & 0xFFFF)
>>   #define RMI_ABI_VERSION(major, minor)      (((major) << 16) | (minor))
>>
>> -#define RMI_RETURN_STATUS_MASK         (0xFFUL)
>> -#define RMI_RETURN_INDEX_MASK          (0xFFUL << 8)
>> -#define RMI_RETURN_MEMREQ_MASK         (0x3UL << 8)
>> -#define RMI_RETURN_CAN_CANCEL_MASK     (0x1UL << 10)
>> +#define RMI_RETURN_STATUS_MASK         GENMASK(7, 0)
>> +#define RMI_RETURN_INDEX_MASK          GENMASK(15, 8)
>> +#define RMI_RETURN_MEMREQ_MASK         GENMASK(10, 8)
>> +#define RMI_RETURN_CAN_CANCEL_MASK     BIT(10)
>>
> 
> Ok.
> 
>>>
>>>> +#define RMI_SUCCESS            0
>>>> +#define RMI_ERROR_INPUT            1
>>>> +#define RMI_ERROR_REALM            2
>>>> +#define RMI_ERROR_REC            3
>>>> +#define RMI_ERROR_RTT            4
>>>> +#define RMI_ERROR_NOT_SUPPORTED        5
>>>> +#define RMI_ERROR_DEVICE        6
>>>> +#define RMI_ERROR_RTT_AUX        7
>>>> +#define RMI_ERROR_PSMMU_ST        8
>>>> +#define RMI_ERROR_DPT            9
>>>> +#define RMI_BUSY            10
>>>> +#define RMI_ERROR_GLOBAL        11
>>>> +#define RMI_ERROR_TRACKING        12
>>>> +#define RMI_INCOMPLETE            13
>>>> +#define RMI_BLOCKED            14
>>>> +#define RMI_ERROR_GPT            15
>>>> +#define RMI_ERROR_GRANULE        16
>>>> +
>>>> +#define RMI_CONTINUE_KEEP_GOING        0
>>>> +#define RMI_CONTINUE_STOP        1
>>>> +
>>>> +#define RMI_OP_MEM_REQ_NONE        0
>>>> +#define RMI_OP_MEM_REQ_DONATE        1
>>>> +#define RMI_OP_MEM_REQ_RECLAIM        2
>>>> +
>>>> +#define RMI_DONATE_SIZE_MASK        3UL
>>>> +#define RMI_DONATE_COUNT_MASK        GENMASK(15, 2)
>>>> +#define RMI_DONATE_CONTIG_MASK        BIT(16)
>>>> +#define RMI_DONATE_STATE_MASK        GENMASK(18, 17)
>>>> +
>>>> +#define RMI_DONATE_SIZE(req)        FIELD_GET(RMI_DONATE_SIZE_MASK, 
>>>> req)
>>>> +#define RMI_DONATE_COUNT(req)        
>>>> FIELD_GET(RMI_DONATE_COUNT_MASK, req)
>>>> +#define RMI_DONATE_CONTIG(req) FIELD_GET(RMI_DONATE_CONTIG_MASK, req)
>>>> +#define RMI_DONATE_STATE(req)        
>>>> FIELD_GET(RMI_DONATE_STATE_MASK, req)
>>>> +
>>>
>>> As above, RMI_DONATE_{SIZE, COUNT, CONTIG, STATE}_MASK are used for 
>>> once in this
>>> header file. So their definitions can be dropped by modifying the 
>>> followup macros,
>>> as below. Some enhancements are also applicable: (a) Use 'BLOCK' to 
>>> indicate the
>>> unit encoded in the request. (b) The macros are put into order from 
>>> MSB to LSB.
>>>
>>> #define RMI_DONATE_STATE(req)        FIELD_GET(GENMASK(18, 17), req)
>>> #define RMI_DONATE_CONTIG(req)        FIELD_GET(GENMASK(16, 16), req)
>>> #define RMI_DONATE_BLOCK_COUNT(req)    FIELD_GET(GENMASK(15, 2), req)
>>> #define RMI_DONATE_BLOCK_SIZE(req)    FIELD_GET(GENMASK(1, 0), req)
>>
>> Same as above.
>>
> 
> Please rename RMI_DONATE_{SIZE, COUNT} to RMI_DONATE_BLOCK_{SIZE, COUNT} 
> if possible.

Sorry, forgot to add that, I have renamed RMI_{DONATE,ADDR_RANGE}_SIZE
=> RMI_{*}_BLOCK_SIZE, left  the _COUNT as it is.

> 
>>>
>>>> +#define RMI_OP_MEM_DELEGATED        0
>>>> +#define RMI_OP_MEM_UNDELEGATED        1
>>>> +#define RMI_OP_MEM_CONDITIONAL        2
>>>> +
>>>
>>> B4.6.40 RmiOpMemContig type is missed here and they should be used in 
>>> the c code.
>>>
>>> #define RMI_OP_MEM_NON_CONTIG    0
>>> #define RMI_OP_MEM_CONTIG    1
>>>
>>> In the c code, we shall have:
>>>
>>> if (RMI_DONATE_CONTIG(req) == RMI_OP_MEM_CONTIG)) {
>>>     ...
>>> } else {
>>>     ...
>>> }
>>>
>>
>> Does it make much sense though ? I prefer
>>
>> if (RMI_DONATE_CONTIG(req))
>>
>> to
>>
>>
>> if (RMI_DONATE_CONTIG(req) == RMI_OP_MEM_CONTIG)) {
>>
>>
>> than having a field for a single bit values. I am happy to change
>> this if there is strong preference to the other.
>>
> 
> The point is RMM-v2.0-bet3 expose RMI_OP_{MEM, MEM_NON}_CONTIG instead 
> of true/false
> to indicate if the requested memory blocks are physically contiguous or 
> not. So the
> expression 'if (RMI_DONATE_CONTIG(req) == RMI_OP_MEM_CONTIG)' is 
> consistent to the
> RMM-v2.0-bet3 spec.

Agree, but the values are intuitively assigned to indicate whether it is
1/0. I personally think if (RMI_DONATE_CONTIG(req)) is good enough. But
to be consistent with the spec, I will change them.


Cheers
Suzuki

