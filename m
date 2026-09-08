Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E064EC79FA1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 22:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LbRygIjj1UISKx3LvtxKvIim7ExfCkLiZ8qAFUjhHAw=; b=zL5m+Z3ESkd3ZLvxHgc4n90MR5
	vZLCgEN3KJskFKtIglh9CpRsJ9T2xR+RzxedfPfswuLZZ6LsjWUJIonfihfbggqFWqiz6GEOi5s4D
	Rd967UXfyKbEoykULxDN/c2VL6xYJvtdIPWxMcuyoLpZW1wuiHOZ6xYAeFjPoHF8yxOy74yLo3ohO
	c3LYQa6kTicZyX9ljD+JBz2Y/6dpNhCTFC3iT9GQ7QVez7D1utbriGyD4PLWgeCqDdssigLEpEYK+
	nQ5kbXdpy6lOWJxaZZljqwcQj6SQyYD4ONuTjYPK5DmAQK3RrOUlNmLp8ZS9XtpW0p+xrtxzwcIDT
	tiOpZRxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x44Vh-0000000APl9-3ld4;
	Tue, 08 Sep 2026 22:41:49 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x44Vc-0000000APk4-47jw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 22:41:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788907303;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LbRygIjj1UISKx3LvtxKvIim7ExfCkLiZ8qAFUjhHAw=;
	b=h3OHbzGmuB+iP3ZtwaVK1PJyt2f/KQhrl1UL7YkrWdrzY2QzqsbuGU1p3yYiWCDGS9a2mS
	TQ4CoOioJaXuTIxj21IDXvT5IBYdpGI5+84MRjBfFa+smwofmuK9eflUIFy48DvomSCPT3
	EPwPCUtVwRUEPMK7z1Fl8QD/0Hs54W8=
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-611--x4twWOyOHWftuqQPPQUQA-1; Tue, 08 Sep 2026 18:41:40 -0400
X-MC-Unique: -x4twWOyOHWftuqQPPQUQA-1
X-Mimecast-MFC-AGG-ID: -x4twWOyOHWftuqQPPQUQA_1788907299
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cbedbd182f5so4152482a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 15:41:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788907299; x=1789512099;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LbRygIjj1UISKx3LvtxKvIim7ExfCkLiZ8qAFUjhHAw=;
        b=s7SKkozZGqLJkZ+atrOd0eWcjlWz8gWktTF46LzqYu7Yo4MQkQ+SljRqesh0sFnqRQ
         X7gC8ooh1Ur9GDwNsv3ZSlq+10dujTaZWspO99pscyyAEwnnd0Qdt7Ax3DqLrBG71Ken
         OzegsmnMhnX+fRuwXUcdysT7XQiPVse90LVD6lAvNsN4npFixSgnRnf6tJp47loJ4Rf/
         DVIPyFtXONWTGY7UbJelfmeHtFrE/bdAMVtmbeyovEBoii8y1/ayveB2I0VE9ljty+5v
         jV+wA/m2TUvk98UxfmFBZvhL5zbqs18MbjwWpoSmDust9oINjzNMjKMWiFq380GWZqL3
         h7DQ==
X-Forwarded-Encrypted: i=1; AKwUvBydjZMquKiF5G5gkQwOuOl47rEIJU7IZGCN737rqjBnGLh9ZVmPoLN6IfS/IaSXt2FhZ+Leb2iRuCn1n01hE5bi@lists.infradead.org
X-Gm-Message-State: AFuF++lUCb2VeVpq+a/2IOGcnVQJ0dbHwv8vD43LHh9pKxlp4E4JNt30
	I1c/lqbOMs6A6elzy0llqjSjxeCP1mhS5siWeeeTvF8FrqP4faRRvExRyD9Zsc3RdZz3MTZfpm7
	2q+ortMvbRNpUYlMT0zU2/uGrbeEV3B0GiASRtS81C7C/K1sBrHBreOOvWXVzGlXdZKoZ20OcuU
	QP
X-Gm-Gg: AYBFou0Q7F+qasq54MwqepuCqZ4OMQ3gA6Aj4OV+e8EbeK/VUIwqUQ8JrDCgG0hvcWC
	LCHzz0mgVAXCd/L6V4Uk9u43E8u6kSIcHn8UIu9V8bx/XzxbmS/iBKSbGYpZRhRCnyIp8RWc7BE
	vchQusI/GpRA9dTXanOfrwj+bN9BIouaX9/WBbNvGOR3VuXUv4IVTeWSKhTdDt4cYUXBzQCsp51
	Gvv6nDL0G1N+4G5bVkEcEec8VibM+AxuHU6xhDWkwug7Q8WHHlSvWkhD0O+ZnMBYXb8IxTbBS4V
	tvrASB6lAS3eRvVStlmSMDB7uatucXee4+5GI61q2l8g6lSVtnqVlhFJeSxhfuDsq0h0AwkUZOV
	nG0BMBEhYTuisUOuUOnHI7RUW5LYAoXTOWivens0p3w==
X-Received: by 2002:a17:90b:5743:b0:38e:c232:9d2c with SMTP id 98e67ed59e1d1-39b8bc9422emr7157578a91.2.1788907298735;
        Tue, 08 Sep 2026 15:41:38 -0700 (PDT)
X-Received: by 2002:a17:90b:5743:b0:38e:c232:9d2c with SMTP id 98e67ed59e1d1-39b8bc9422emr7157553a91.2.1788907298136;
        Tue, 08 Sep 2026 15:41:38 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39cd20641e2sm204402a91.3.2026.09.08.15.41.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 15:41:36 -0700 (PDT)
Message-ID: <52e58930-8fa4-4c75-981c-25be42d83f2d@redhat.com>
Date: Wed, 9 Sep 2026 08:41:23 +1000
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
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <aca629b2-27a0-4c47-acac-87edb3b0d3d9@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: K0LW0nBqk5D-upx-lUq2G5E8HUGQY6LU3POyvYsepuE_1788907299
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_154145_779464_99E02A67 
X-CRM114-Status: GOOD (  32.13  )
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

On 9/8/26 8:37 PM, Suzuki K Poulose wrote:
> On 08/09/2026 07:19, Gavin Shan wrote:
>> On 9/7/26 7:59 PM, Suzuki K Poulose wrote:
>>> From: Steven Price <steven.price@arm.com>
>>>
>>> The RMM (Realm Management Monitor) provides functionality that can be
>>> accessed by SMC calls from the host.
>>>
>>> The SMC definitions are based on DEN0137[1] version 2.0-bet3
>>>
>>> [1] https://developer.arm.com/documentation/den0137/2-0bet3/
>>>
>>> Signed-off-by: Steven Price <steven.price@arm.com>
>>> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> 
> ...
> 
>>> ---
>>>   include/linux/arm-smccc-rmi.h | 494 ++++++++++++++++++++++++++++++++++
>>>   1 file changed, 494 insertions(+)
>>>   create mode 100644 include/linux/arm-smccc-rmi.h
>>>
>>
>> Some nitpicks below, please pick up the commits that look reasonable :)
>>
> 
> 
>>> +
>>> +#define RMI_RETURN_STATUS_MASK        (0xFFUL)
>>> +#define RMI_RETURN_INDEX_MASK        (0xFFUL << 8)
>>> +#define RMI_RETURN_MEMREQ_MASK        (0x3UL << 8)
>>> +#define RMI_RETURN_CAN_CANCEL_MASK    (0x1UL << 10)
>>> +
>>> +#define RMI_RETURN_STATUS(ret) FIELD_GET(RMI_RETURN_STATUS_MASK, ret)
>>> +#define RMI_RETURN_INDEX(ret)        FIELD_GET(RMI_RETURN_INDEX_MASK, ret)
>>> +#define RMI_RETURN_MEMREQ(ret) FIELD_GET(RMI_RETURN_MEMREQ_MASK, ret)
>>> +#define RMI_RETURN_CAN_CANCEL(ret) FIELD_GET(RMI_RETURN_CAN_CANCEL_MASK, ret)
>>> +
>>
>> If I'm correct enough, RMI_RETURN_{STATUS, INDEX, MEMREQ, CAN_CANEL} _MASK are used
>> for once in this header file. So we needn't explicitly expose them and combine their
>> definitions with users to fetch the corresponding fields, as below.
>>
>> #define RMI_RETURN_STATUS(ret)        FIELD_GET(GENMASK(7, 0), ret)
>> #define RMI_RETURN_INDEX(ret)        FIELD_GET(GENMASK(15, 8), ret)
>> #define RMI_RETURN_MEMREQ(ret)        FIELD_GET(GENMASK(10, 8), ret)
>> #define RMI_RETURN_CAN_CANCEL(ret)    FIELD_GEt(GENMASK(10, 10), ret)
> 
> I belive the header files were generated from a tool (by Steven) and
> these would make it easier to compare with the generated header file for
> any deviation from the spec. So, I am a bit reluctant make these
> changes.
> 
> That said, I am happy to convert the mask definitions to GENMASK() for
> consistency and readability. i.e., something like:
> 
> diff --git a/include/linux/arm-smccc-rmi.h b/include/linux/arm-smccc-rmi.h
> index 3eb88caf40964..078197284415e 100644
> --- a/include/linux/arm-smccc-rmi.h
> +++ b/include/linux/arm-smccc-rmi.h
> @@ -139,10 +139,10 @@
>   #define RMI_ABI_VERSION_GET_MINOR(version) ((version) & 0xFFFF)
>   #define RMI_ABI_VERSION(major, minor)      (((major) << 16) | (minor))
> 
> -#define RMI_RETURN_STATUS_MASK         (0xFFUL)
> -#define RMI_RETURN_INDEX_MASK          (0xFFUL << 8)
> -#define RMI_RETURN_MEMREQ_MASK         (0x3UL << 8)
> -#define RMI_RETURN_CAN_CANCEL_MASK     (0x1UL << 10)
> +#define RMI_RETURN_STATUS_MASK         GENMASK(7, 0)
> +#define RMI_RETURN_INDEX_MASK          GENMASK(15, 8)
> +#define RMI_RETURN_MEMREQ_MASK         GENMASK(10, 8)
> +#define RMI_RETURN_CAN_CANCEL_MASK     BIT(10)
> 

Ok.

>>
>>> +#define RMI_SUCCESS            0
>>> +#define RMI_ERROR_INPUT            1
>>> +#define RMI_ERROR_REALM            2
>>> +#define RMI_ERROR_REC            3
>>> +#define RMI_ERROR_RTT            4
>>> +#define RMI_ERROR_NOT_SUPPORTED        5
>>> +#define RMI_ERROR_DEVICE        6
>>> +#define RMI_ERROR_RTT_AUX        7
>>> +#define RMI_ERROR_PSMMU_ST        8
>>> +#define RMI_ERROR_DPT            9
>>> +#define RMI_BUSY            10
>>> +#define RMI_ERROR_GLOBAL        11
>>> +#define RMI_ERROR_TRACKING        12
>>> +#define RMI_INCOMPLETE            13
>>> +#define RMI_BLOCKED            14
>>> +#define RMI_ERROR_GPT            15
>>> +#define RMI_ERROR_GRANULE        16
>>> +
>>> +#define RMI_CONTINUE_KEEP_GOING        0
>>> +#define RMI_CONTINUE_STOP        1
>>> +
>>> +#define RMI_OP_MEM_REQ_NONE        0
>>> +#define RMI_OP_MEM_REQ_DONATE        1
>>> +#define RMI_OP_MEM_REQ_RECLAIM        2
>>> +
>>> +#define RMI_DONATE_SIZE_MASK        3UL
>>> +#define RMI_DONATE_COUNT_MASK        GENMASK(15, 2)
>>> +#define RMI_DONATE_CONTIG_MASK        BIT(16)
>>> +#define RMI_DONATE_STATE_MASK        GENMASK(18, 17)
>>> +
>>> +#define RMI_DONATE_SIZE(req)        FIELD_GET(RMI_DONATE_SIZE_MASK, req)
>>> +#define RMI_DONATE_COUNT(req)        FIELD_GET(RMI_DONATE_COUNT_MASK, req)
>>> +#define RMI_DONATE_CONTIG(req) FIELD_GET(RMI_DONATE_CONTIG_MASK, req)
>>> +#define RMI_DONATE_STATE(req)        FIELD_GET(RMI_DONATE_STATE_MASK, req)
>>> +
>>
>> As above, RMI_DONATE_{SIZE, COUNT, CONTIG, STATE}_MASK are used for once in this
>> header file. So their definitions can be dropped by modifying the followup macros,
>> as below. Some enhancements are also applicable: (a) Use 'BLOCK' to indicate the
>> unit encoded in the request. (b) The macros are put into order from MSB to LSB.
>>
>> #define RMI_DONATE_STATE(req)        FIELD_GET(GENMASK(18, 17), req)
>> #define RMI_DONATE_CONTIG(req)        FIELD_GET(GENMASK(16, 16), req)
>> #define RMI_DONATE_BLOCK_COUNT(req)    FIELD_GET(GENMASK(15, 2), req)
>> #define RMI_DONATE_BLOCK_SIZE(req)    FIELD_GET(GENMASK(1, 0), req)
> 
> Same as above.
> 

Please rename RMI_DONATE_{SIZE, COUNT} to RMI_DONATE_BLOCK_{SIZE, COUNT} if possible.

>>
>>> +#define RMI_OP_MEM_DELEGATED        0
>>> +#define RMI_OP_MEM_UNDELEGATED        1
>>> +#define RMI_OP_MEM_CONDITIONAL        2
>>> +
>>
>> B4.6.40 RmiOpMemContig type is missed here and they should be used in the c code.
>>
>> #define RMI_OP_MEM_NON_CONTIG    0
>> #define RMI_OP_MEM_CONTIG    1
>>
>> In the c code, we shall have:
>>
>> if (RMI_DONATE_CONTIG(req) == RMI_OP_MEM_CONTIG)) {
>>     ...
>> } else {
>>     ...
>> }
>>
> 
> Does it make much sense though ? I prefer
> 
> if (RMI_DONATE_CONTIG(req))
> 
> to
> 
> 
> if (RMI_DONATE_CONTIG(req) == RMI_OP_MEM_CONTIG)) {
> 
> 
> than having a field for a single bit values. I am happy to change
> this if there is strong preference to the other.
> 

The point is RMM-v2.0-bet3 expose RMI_OP_{MEM, MEM_NON}_CONTIG instead of true/false
to indicate if the requested memory blocks are physically contiguous or not. So the
expression 'if (RMI_DONATE_CONTIG(req) == RMI_OP_MEM_CONTIG)' is consistent to the
RMM-v2.0-bet3 spec.

  
>> Similarly, B4.6.39 RmiOpCanCancel type is missed here and they should be used in
>> the c code.
>>
>> #define RMI_OP_CANNOT_CANCEL    0
>> #define RMI_OP_CAN_CANCEL    1
>>
>> In the c code, we shall have:
>>
>> if (RMI_RETURN_CAN_CANCEL(ret) == RMI_OP_CAN_CANCEL) {
>>      ...
>> } else {
>>      ...
>> }
>>
> 
> Same as above.
> 

Please see above explanation.

>>> +#define RMI_ADDR_TYPE_NONE        0
>>> +#define RMI_ADDR_TYPE_SINGLE        1
>>> +#define RMI_ADDR_TYPE_LIST        2
>>> +
>>> +#define RMI_ADDR_RANGE_SIZE_MASK    GENMASK(1, 0)
>>> +#define RMI_ADDR_RANGE_COUNT_MASK    GENMASK(PAGE_SHIFT - 1, 2)
>>> +#define RMI_ADDR_RANGE_ADDR_MASK    (PAGE_MASK & GENMASK(51, 0))
>>> +#define RMI_ADDR_RANGE_STATE_MASK    GENMASK(63, 62)
>>> +
>>> +#define RMI_ADDR_RANGE_SIZE(ar) (FIELD_GET(RMI_ADDR_RANGE_SIZE_MASK, \
>>> +                           (ar)))
>>> +#define RMI_ADDR_RANGE_COUNT(ar) (FIELD_GET(RMI_ADDR_RANGE_COUNT_MASK, \
>>> +                           (ar)))
>>> +#define RMI_ADDR_RANGE_ADDR(ar)        ((ar) & RMI_ADDR_RANGE_ADDR_MASK)
>>> +#define RMI_ADDR_RANGE_STATE(ar) (FIELD_GET(RMI_ADDR_RANGE_STATE_MASK, \
>>> +                           (ar)))
>>> +
>>
>> I guess it wouldn't a bad idea to explictly indicate 'BLOCK' in the definitions, as
>> below. Some improvements are applicated either: (a) 'ar' is renamed to 'r'; (b) The
>> excessive parentheses are dropped to follow the patterns we already had; (c) For
>> RMI_ADDR_RANGE_ADDR(r), FIELD_GET() is used.
>>
>> #define RMI_ADDR_RANGE_BLOCK_SIZE_MASK        GENMASK(1, 0)
>> #define RMI_ADDR_RANGE_BLOCK_COUNT_MASK        GENMASK(PAGE_SHIFT - 1, 2)
>> #define RMI_ADDR_RANGE_ADDR_MASK        (PAGE_MASK & GENMASK(51, 0))
>> #define RMI_ADDR_RANGE_STATE_MASK        GENMASK(63, 62)
>>
>> #define RMI_ADDR_RANGE_BLOCK_SIZE(r) FIELD_GET(RMI_ADDR_RANGE_SIZE_MASK, r)
>> #define RMI_ADDR_RANGE_BLOCK_COUNT(r) FIELD_GET(RMI_ADDR_RANGE_COUNT_MASK, r)
>> #define RMI_ADDR_RANGE_ADDR(r) FIELD_GET(RMI_ADDR_RANGE_ADDR_MASK, r)
>> #define RMI_ADDR_RANGE_STATE(r) FIELD_GET(RMI_ADDR_RANGE_STATE_MASK, r)
> 
> Ack
> 
>>
>>> +enum rmi_ripas {
>>> +    RMI_EMPTY = 0,
>>> +    RMI_RAM = 1,
>>> +    RMI_DESTROYED = 2,
>>> +    RMI_DEV = 3,
>>> +};
> 
>>> +#define RMI_FEATURE_REGISTER_1_RMI_GRAN_SZ_4KB    BIT(0)
>>> +#define RMI_FEATURE_REGISTER_1_RMI_GRAN_SZ_16KB    BIT(1)
>>> +#define RMI_FEATURE_REGISTER_1_RMI_GRAN_SZ_64KB    BIT(2)
>>> +#define RMI_FEATURE_REGISTER_1_HASH_SHA_256    BIT(3)
>>> +#define RMI_FEATURE_REGISTER_1_HASH_SHA_384    BIT(4)
>>> +#define RMI_FEATURE_REGISTER_1_HASH_SHA_512    BIT(5)
>>> +#define RMI_FEATURE_REGISTER_1_MAX_RECS_ORDER    GENMASK(9, 6)
>>> +#define RMI_FEATURE_REGISTER_1_L0GPTSZ        GENMASK(13, 10)
>>> +#define RMI_FEATURE_REGISTER_1_PPS        GENMASK(16, 14)
>>> +
>>> +#define RMI_FEATURE_REGISTER_2_DA        BIT(0)
>>> +#define RMI_FEATURE_REGISTER_2_DA_COH        BIT(1)
>>> +#define RMI_FEATURE_REGISTER_2_VSMMU        BIT(2)
>>> +#define RMI_FEATURE_REGISTER_2_ATS        BIT(3)
>>> +#define RMI_FEATURE_REGISTER_2_PDEV_MAX_VDEVS_ORDER    GENMASK(7, 4)
>>> +#define RMI_FEATURE_REGISTER_2_VDEV_KROU    BIT(8)
>>> +#define RMI_FEATURE_REGISTER_2_NON_TEE_STREAM    BIT(9)
>>> +#define RMI_FEATURE_REGISTER_2_REALM_MAX_VDEVS_ORDER    GENMASK(14, 10)
>>> +
>>> +#define RMI_FEATURE_REGISTER_3_MAX_NUM_AUX_PLANES    GENMASK(3, 0)
>>> +#define RMI_FEATURE_REGISTER_3_RTT_PLANE        GENMASK(5, 4)
>>> +#define RMI_FEATURE_REGISTER_3_RTT_S2AP_INDIRECT    BIT(6)
>>> +
>>> +#define RMI_FEATURE_REGISTER_4_MEC_COUNT        GENMASK(63, 0)
>>> +
>>
>> We would reorder those feature register definitions from MSB ro LSB :-)
> 
> Ack
> 
> Thanks for your review.
> 
> Cheers
> Suzuki
> 

Thanks,
Gavin


