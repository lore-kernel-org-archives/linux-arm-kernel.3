Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD6B9C79FB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 09:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2yXvhB+OP5CUFg1TBMcZH6iusQjFBNo5HCOtIhY7hZE=; b=Xhl91napARNsAFe02phrY5oBuX
	TKFIg8dgdqsjOC+feZi/ouYGdQigeNMY0B9cOo00CJJ+2dC2eCizhnz7Z8WIudvMR9qOCuQ3a8uSC
	jZVaFGRWokm0gjjqKDnr95Pc43Cevz7Pg6/KKzVV05k17Rh00s2oF393LX7E+y2ZSEnriF+kKOPk1
	j6KaCG2yRt5Q+luwt412Zr3WZiRCC+6Y9xGoMSl99RuvUi7d/2HB6T/Is14hxMh7jam6hKIaagOCz
	CQm+sofXW0qW6fV8mN7Q21M87ZTK+NrNV65e3Gygl5QGK9R1DZAd6hGEhZL2FrnXEXYZkwnjefiiv
	Hx9ektJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4bOp-0000000Dvmm-08H1;
	Thu, 10 Sep 2026 09:48:55 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4bOm-0000000DvlY-0Mzk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 09:48:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789033730;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2yXvhB+OP5CUFg1TBMcZH6iusQjFBNo5HCOtIhY7hZE=;
	b=hHjWlcLanKgJcl+ATAlKHSH0+MQaRRDg8CQGUCs8o/qqxc2spPffi7MTrNbjtoIIPsG76s
	mDdZtSSGP0vukTL+iC0KEJY+HLhIyka3MUDCvColJIxqEdT8Lc3Ra3Jey0WsIhMlTOQqyf
	pTOYroBR3FaJz58pbP8wR49ZSJF8kUc=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-34-S2yaWUGCNcCBP5n6iBERlQ-1; Thu, 10 Sep 2026 05:47:15 -0400
X-MC-Unique: S2yaWUGCNcCBP5n6iBERlQ-1
X-Mimecast-MFC-AGG-ID: S2yaWUGCNcCBP5n6iBERlQ_1789033634
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2d02df2bf09so62047475ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Sep 2026 02:47:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789033634; x=1789638434;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2yXvhB+OP5CUFg1TBMcZH6iusQjFBNo5HCOtIhY7hZE=;
        b=g+ylpIM1OnG+pMhXhp3GUXeSmaNFw//YuoglvJ+Ndj3MzvAnO6Y7omnD71dqC5hmET
         hkVZwXtLjyyb4moOguAyjYawFhCiO+ylYk0xajPdFkibjMDP3q1XRGvwcpzQ5sT9+d1i
         NOonWgHjhCYUaU/0MKCyaE1kVKBUpxfDETOVZC/O+cbS6e3svk+5nFZqBFKvbwOx/j7w
         6DK4Xee4IqvVFKqqlByOwS5CjyAXarT2TP7yG8aD1KX643SU9TonWXJZTk1wslaZEOQW
         HJU1RuxBYIukcI8VdNZu2/lV9nEcP0BDIH+HfmWmLs9YaJI2eMFBKSQVlzHk0waDZH3Z
         mc9Q==
X-Forwarded-Encrypted: i=1; AKwUvByibWlGGcFRfmSJkzz+KFh9a2UYXeMS4IqWmkbTgPlXlGvkbP5aHGJWBe44rXj7NJA1+TPGMp9xKWz1Clyg0mZ0@lists.infradead.org
X-Gm-Message-State: AFuF++kqYObFHFHbOCweIQaaVFMVpapLtiWTOQOsCSzQDIrzj9w/K7uM
	fatB31UvA3wI7fSNfFYwXQ/EvUVflGuMLUyc/RLrkjvFuJHvHmlmeCIlPoAUe2yNifpoJlulu6w
	QoCn8rHDomKHXNtP6iyPD9dFNXXAe0X05nObuWsZsvzHAbIgno7Kkm17UVzQEqnxdwtdi24kmE+
	gv
X-Gm-Gg: AYBFou2HBJGDdu6x+sb/JfW7f7nn7sbs8+aBMl8hxHYAtMFGnWH18s3pbGnFS1QzkEb
	sZ5txcVtpPQxZlbpSi/v4aGq/byTxl8eOdP5AkIs8qcN6jgyCuYWX0Fpm/KwTdEGCPEMzcLCwhL
	pYENXlveqb56dPG+Lpe5G6ZjcuWKCl2/u3prE5M/H/+YXly81BvXSfBQZgudwzHbC83FxKTwE12
	j12Qc17ETLru9Wu/xO+M/q0KseWH7BNgrJ7TjRhzW2N93qVI35TpA08JI4ZkxPV9QMtes+EuZAb
	hmeBR/2BLkHcoBX63GNSybHyvEySprQJ3BpQcMLN5zpy5CnAoviWDqPkGhW7Mg1k2v9vyuLBvw4
	9kAemcvbVFeIPyjcP3fJ+I748smNdGZTo8GQKfXHplg==
X-Received: by 2002:a17:903:1a26:b0:2ca:9d5a:8b6c with SMTP id d9443c01a7336-2dd0780d5cdmr98391575ad.5.1789033633859;
        Thu, 10 Sep 2026 02:47:13 -0700 (PDT)
X-Received: by 2002:a17:903:1a26:b0:2ca:9d5a:8b6c with SMTP id d9443c01a7336-2dd0780d5cdmr98390555ad.5.1789033633331;
        Thu, 10 Sep 2026 02:47:13 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db1495acf7sm86197935ad.25.2026.09.10.02.47.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 02:47:11 -0700 (PDT)
Message-ID: <7223aeec-b269-4ef5-b5b9-693d4d12afd1@redhat.com>
Date: Thu, 10 Sep 2026 19:47:00 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v17 1/7] firmware: arm_rmm: Add SMC definitions for
 calling the RMM
To: Suzuki K Poulose <suzuki.poulose@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
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
 <44f02c8c-db52-4f3e-b5d9-f25c1c8c5f0b@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <44f02c8c-db52-4f3e-b5d9-f25c1c8c5f0b@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: GO9CYOu4CB0Lq73VVmbb380Hx9zXr0XcKXTXVwRLG5Q_1789033634
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_024852_202832_690FD559 
X-CRM114-Status: GOOD (  23.85  )
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

On 9/9/26 6:39 PM, Suzuki K Poulose wrote:
> On 08/09/2026 23:41, Gavin Shan wrote:
>> On 9/8/26 8:37 PM, Suzuki K Poulose wrote:
>>> On 08/09/2026 07:19, Gavin Shan wrote:
>>>> On 9/7/26 7:59 PM, Suzuki K Poulose wrote:
>>>>> From: Steven Price <steven.price@arm.com>
>>>>>
>>>>> The RMM (Realm Management Monitor) provides functionality that can be
>>>>> accessed by SMC calls from the host.
>>>>>
>>>>> The SMC definitions are based on DEN0137[1] version 2.0-bet3
>>>>>
>>>>> [1] https://developer.arm.com/documentation/den0137/2-0bet3/
>>>>>
>>>>> Signed-off-by: Steven Price <steven.price@arm.com>
>>>>> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
>>>
>>> ...
>>>
>>>>> ---
>>>>>   include/linux/arm-smccc-rmi.h | 494 ++++++++++++++++++++++++++++++ ++++
>>>>>   1 file changed, 494 insertions(+)
>>>>>   create mode 100644 include/linux/arm-smccc-rmi.h
>>>>>
>>>>
>>>> Some nitpicks below, please pick up the commits that look reasonable :)
>>>>
>>>
>>>
>>>>> +
>>>>> +#define RMI_RETURN_STATUS_MASK        (0xFFUL)
>>>>> +#define RMI_RETURN_INDEX_MASK        (0xFFUL << 8)
>>>>> +#define RMI_RETURN_MEMREQ_MASK        (0x3UL << 8)
>>>>> +#define RMI_RETURN_CAN_CANCEL_MASK    (0x1UL << 10)
>>>>> +
>>>>> +#define RMI_RETURN_STATUS(ret) FIELD_GET(RMI_RETURN_STATUS_MASK, ret)
>>>>> +#define RMI_RETURN_INDEX(ret) FIELD_GET(RMI_RETURN_INDEX_MASK, ret)
>>>>> +#define RMI_RETURN_MEMREQ(ret) FIELD_GET(RMI_RETURN_MEMREQ_MASK, ret)
>>>>> +#define RMI_RETURN_CAN_CANCEL(ret) FIELD_GET(RMI_RETURN_CAN_CANCEL_MASK, ret)
>>>>> +
>>>>
>>>> If I'm correct enough, RMI_RETURN_{STATUS, INDEX, MEMREQ, CAN_CANEL} _MASK are used
>>>> for once in this header file. So we needn't explicitly expose them and combine their
>>>> definitions with users to fetch the corresponding fields, as below.
>>>>
>>>> #define RMI_RETURN_STATUS(ret)        FIELD_GET(GENMASK(7, 0), ret)
>>>> #define RMI_RETURN_INDEX(ret)        FIELD_GET(GENMASK(15, 8), ret)
>>>> #define RMI_RETURN_MEMREQ(ret)        FIELD_GET(GENMASK(10, 8), ret)
>>>> #define RMI_RETURN_CAN_CANCEL(ret)    FIELD_GEt(GENMASK(10, 10), ret)
>>>
>>> I belive the header files were generated from a tool (by Steven) and
>>> these would make it easier to compare with the generated header file for
>>> any deviation from the spec. So, I am a bit reluctant make these
>>> changes.
>>>
>>> That said, I am happy to convert the mask definitions to GENMASK() for
>>> consistency and readability. i.e., something like:
>>>
>>> diff --git a/include/linux/arm-smccc-rmi.h b/include/linux/arm-smccc- rmi.h
>>> index 3eb88caf40964..078197284415e 100644
>>> --- a/include/linux/arm-smccc-rmi.h
>>> +++ b/include/linux/arm-smccc-rmi.h
>>> @@ -139,10 +139,10 @@
>>>   #define RMI_ABI_VERSION_GET_MINOR(version) ((version) & 0xFFFF)
>>>   #define RMI_ABI_VERSION(major, minor)      (((major) << 16) | (minor))
>>>
>>> -#define RMI_RETURN_STATUS_MASK         (0xFFUL)
>>> -#define RMI_RETURN_INDEX_MASK          (0xFFUL << 8)
>>> -#define RMI_RETURN_MEMREQ_MASK         (0x3UL << 8)
>>> -#define RMI_RETURN_CAN_CANCEL_MASK     (0x1UL << 10)
>>> +#define RMI_RETURN_STATUS_MASK         GENMASK(7, 0)
>>> +#define RMI_RETURN_INDEX_MASK          GENMASK(15, 8)
>>> +#define RMI_RETURN_MEMREQ_MASK         GENMASK(10, 8)
>>> +#define RMI_RETURN_CAN_CANCEL_MASK     BIT(10)
>>>
>>
>> Ok.
>>
>>>>
>>>>> +#define RMI_SUCCESS            0
>>>>> +#define RMI_ERROR_INPUT            1
>>>>> +#define RMI_ERROR_REALM            2
>>>>> +#define RMI_ERROR_REC            3
>>>>> +#define RMI_ERROR_RTT            4
>>>>> +#define RMI_ERROR_NOT_SUPPORTED        5
>>>>> +#define RMI_ERROR_DEVICE        6
>>>>> +#define RMI_ERROR_RTT_AUX        7
>>>>> +#define RMI_ERROR_PSMMU_ST        8
>>>>> +#define RMI_ERROR_DPT            9
>>>>> +#define RMI_BUSY            10
>>>>> +#define RMI_ERROR_GLOBAL        11
>>>>> +#define RMI_ERROR_TRACKING        12
>>>>> +#define RMI_INCOMPLETE            13
>>>>> +#define RMI_BLOCKED            14
>>>>> +#define RMI_ERROR_GPT            15
>>>>> +#define RMI_ERROR_GRANULE        16
>>>>> +
>>>>> +#define RMI_CONTINUE_KEEP_GOING        0
>>>>> +#define RMI_CONTINUE_STOP        1
>>>>> +
>>>>> +#define RMI_OP_MEM_REQ_NONE        0
>>>>> +#define RMI_OP_MEM_REQ_DONATE        1
>>>>> +#define RMI_OP_MEM_REQ_RECLAIM        2
>>>>> +
>>>>> +#define RMI_DONATE_SIZE_MASK        3UL
>>>>> +#define RMI_DONATE_COUNT_MASK        GENMASK(15, 2)
>>>>> +#define RMI_DONATE_CONTIG_MASK        BIT(16)
>>>>> +#define RMI_DONATE_STATE_MASK        GENMASK(18, 17)
>>>>> +
>>>>> +#define RMI_DONATE_SIZE(req)        FIELD_GET(RMI_DONATE_SIZE_MASK, req)
>>>>> +#define RMI_DONATE_COUNT(req) FIELD_GET(RMI_DONATE_COUNT_MASK, req)
>>>>> +#define RMI_DONATE_CONTIG(req) FIELD_GET(RMI_DONATE_CONTIG_MASK, req)
>>>>> +#define RMI_DONATE_STATE(req) FIELD_GET(RMI_DONATE_STATE_MASK, req)
>>>>> +
>>>>
>>>> As above, RMI_DONATE_{SIZE, COUNT, CONTIG, STATE}_MASK are used for once in this
>>>> header file. So their definitions can be dropped by modifying the followup macros,
>>>> as below. Some enhancements are also applicable: (a) Use 'BLOCK' to indicate the
>>>> unit encoded in the request. (b) The macros are put into order from MSB to LSB.
>>>>
>>>> #define RMI_DONATE_STATE(req)        FIELD_GET(GENMASK(18, 17), req)
>>>> #define RMI_DONATE_CONTIG(req)        FIELD_GET(GENMASK(16, 16), req)
>>>> #define RMI_DONATE_BLOCK_COUNT(req)    FIELD_GET(GENMASK(15, 2), req)
>>>> #define RMI_DONATE_BLOCK_SIZE(req)    FIELD_GET(GENMASK(1, 0), req)
>>>
>>> Same as above.
>>>
>>
>> Please rename RMI_DONATE_{SIZE, COUNT} to RMI_DONATE_BLOCK_{SIZE, COUNT} if possible.
> 
> Sorry, forgot to add that, I have renamed RMI_{DONATE,ADDR_RANGE}_SIZE
> => RMI_{*}_BLOCK_SIZE, left  the _COUNT as it is.
> 

It's ok to me. The point is to have "BLOCK", indicating it's related to
a block. In rmi.c, 'unit' is also used and needs to be replaced with 'block',
consistent with the spec.

>>
>>>>
>>>>> +#define RMI_OP_MEM_DELEGATED        0
>>>>> +#define RMI_OP_MEM_UNDELEGATED        1
>>>>> +#define RMI_OP_MEM_CONDITIONAL        2
>>>>> +
>>>>
>>>> B4.6.40 RmiOpMemContig type is missed here and they should be used in the c code.
>>>>
>>>> #define RMI_OP_MEM_NON_CONTIG    0
>>>> #define RMI_OP_MEM_CONTIG    1
>>>>
>>>> In the c code, we shall have:
>>>>
>>>> if (RMI_DONATE_CONTIG(req) == RMI_OP_MEM_CONTIG)) {
>>>>     ...
>>>> } else {
>>>>     ...
>>>> }
>>>>
>>>
>>> Does it make much sense though ? I prefer
>>>
>>> if (RMI_DONATE_CONTIG(req))
>>>
>>> to
>>>
>>>
>>> if (RMI_DONATE_CONTIG(req) == RMI_OP_MEM_CONTIG)) {
>>>
>>>
>>> than having a field for a single bit values. I am happy to change
>>> this if there is strong preference to the other.
>>>
>>
>> The point is RMM-v2.0-bet3 expose RMI_OP_{MEM, MEM_NON}_CONTIG instead of true/false
>> to indicate if the requested memory blocks are physically contiguous or not. So the
>> expression 'if (RMI_DONATE_CONTIG(req) == RMI_OP_MEM_CONTIG)' is consistent to the
>> RMM-v2.0-bet3 spec.
> 
> Agree, but the values are intuitively assigned to indicate whether it is
> 1/0. I personally think if (RMI_DONATE_CONTIG(req)) is good enough. But
> to be consistent with the spec, I will change them.
> 

Ok.

Thanks,
Gavin

> 
> Cheers
> Suzuki
> 


