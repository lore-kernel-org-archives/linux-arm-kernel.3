Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C54F1C5AC81
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 12:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b6ARJxBgnBxK+6NZln3mP3Z60UK181/qnNyKgABn96o=; b=bEfg4dQHl4iwhLUe4/cew/TmCn
	9/pVZq+rIUP8AbIWRNDOWqqAPvRr5K3GCVb8UaM0CXaE9QcSf2gEVNFb0v7kPFq4t8lkrt+J6prcW
	breoPc+4dGtXue9mk7hPG+8S3qA4ThpsTt9EiXlED0HLjK2z5Kec6zOvt0UW4LWkUBgVebZnCH+t6
	QQzG4ga8dmWRbmchOBb5nsv5FHu7/3Z+FJMidmy9L/qaeqg4rtDBxmvIT6z0h6lJLdZFhS1zFYIQY
	Usvk7t/lbtB4XhAFdWvXbxIgBDClLDbXymD/KFpzg6dH0nnblon1KI0s4W+gUKSOXDOb+uGUpbgGd
	BErtNPHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsJXU-000000080Q3-2ZVV;
	Fri, 07 Aug 2026 12:19:04 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsJXS-000000080PS-3ACD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 12:19:03 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-47fd4531020so2154738f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Aug 2026 05:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1786105141; x=1786709941; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b6ARJxBgnBxK+6NZln3mP3Z60UK181/qnNyKgABn96o=;
        b=lCfi7wG7cYKzER4zdirDV7qyP4uSXc1rbAfR4E2/zkJDiZmrBV/+ng20gTUtipswbt
         xhQNErgnr8bJMTi0S2v9ENdiDSYkgz+3X39bxJ2716VqbVCgOPOHa17/8hFczgEeCzzl
         Rtg0Z0Fe9Dp2bvXccAQQggOYdqZaKWbifS9Wzm9dq0HyTK67Vu0D4hNGrkqTZR6bU0Dl
         ncJuEGxu7p4WIH0r1ZQaI029uDUR/tMutU8s4PEd5tRLWqVnurLxlfIO4bJyQe8sGYdk
         5UTeXvOholErQW7/6xi0rkqxvxEoHYyR+EIKCs1C3mqGp8JW+8uefwAhxctBX9b7fRTS
         UMNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786105141; x=1786709941;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b6ARJxBgnBxK+6NZln3mP3Z60UK181/qnNyKgABn96o=;
        b=SIzMCa9HWVJnNlamMWw4/toieucHc9b1rC++K+jPtubmllUCsNFLVuNBl0cz9ZyNKA
         u7W3wcLmrogznYIgWAkGZoTtb4KBHYiXkSpzcpcp8pnpj6NCKWD0OxJ78PgyUOKgkQsN
         hzLdY9TBsKdGn+p09qlOSIgRK3XnRi+xEmx19KtFEeC+mHCUQIiB/+esHp+npWhjN+7u
         sskrMHK7Vc+2OreKq63eA6R3AEMXRH3OfFJVuR8bRRAdysSsmEnioqZcT+uG2WxISYQ6
         CmivQwwd8BjxyNoalLhY4k+qDlEw8r2yZJ3oglKKJuqxIzP5zYUzFb/DRLR9OQH6uSNS
         Fn6w==
X-Gm-Message-State: AOJu0YxjqFch4zoG0ZG/lIHQT5nEOqcnSfk1rdv1AsG6K6VlZ+Z+7LWy
	GIF5iTYrLSsPPMB7FXBA9K9EQYmyYabqKegj/VsSPtHvUkzWfcLbWgGg57KTBmF05bY=
X-Gm-Gg: AR+sD10EYbwuvqMmGgt8JhWiD6JhtEVnd/EA6BDhnowvYhFWt2slUjYHzU0UWmXd7bw
	KG4bSwEJFoqBCcrcyfdugQD+hosbjuj1XFBOXcZs+zgbprlwqK6/NhrpSci9Z3ZniGnQqOZajDn
	vElQxdsl76r6nhljn817MflWmZ60l2WrK960AKFN5bHXRhQV6O2VqLFTgb0uUfvq2YUCQ7vQow5
	TtdvyO7Hs1HomPt0vD2AYZUwHCDIg2go6IxLzyJSEp8k50/Xy6hYiawrFKt3naIYzBnofq6ELTt
	tLfm5Dw3NYf2ikK4LT8N0D8bgZzB3JOlmdjqBKk8+i4qYyoeUe86omEkiuX4I9gH49h/uEVf2rm
	ZqEga6Z2bJbQEwRobRNFQpSH/9c721Wt6GNwwFo+NS4ETfspoQifwyvBvL2MZYrHPLPSVd5LIVj
	u4A9+FooVv0K95Dp1XrpwocFYpxlQJD0GDlDubZ9cW82paDh8SJ2KZgd4m7UC/8dEJ9w==
X-Received: by 2002:a05:6000:4715:b0:47f:9752:3277 with SMTP id ffacd0b85a97d-47fec509a9fmr38796349f8f.2.1786105140913;
        Fri, 07 Aug 2026 05:19:00 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-480021f8b9bsm6038188f8f.25.2026.08.07.05.18.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Aug 2026 05:19:00 -0700 (PDT)
Message-ID: <66590828-a571-45eb-8e67-a55bebea1b97@linaro.org>
Date: Fri, 7 Aug 2026 13:18:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] perf: arm_pmuv3: Zero initialize hw_id branch stack field
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, "Rob Herring (Arm)" <robh@kernel.org>,
 Leo Yan <leo.yan@arm.com>, Suzuki Poulose <Suzuki.Poulose@arm.com>
References: <20260807-james-brbe-init-hw-idx-v1-1-009d1843960a@linaro.org>
 <a985a304-b399-4e84-99e3-0c6200ae518a@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <a985a304-b399-4e84-99e3-0c6200ae518a@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_051902_824599_5147AEF1 
X-CRM114-Status: GOOD (  26.25  )
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



On 07/08/2026 11:44, Anshuman Khandual wrote:
> On 07/08/26 2:44 PM, James Clark wrote:
>> PERF_SAMPLE_BRANCH_HW_INDEX is supported by BRBE so hw_id is passed to
>> userspace, but it's never set by the BRBE driver. Zero initialize it as
>> it should be according to the docs:
>>
>>     * For the architectures whose raw branch records are
>>     * already stored in age order, the hw_idx should be 0.
> 
> The in code documentation while defining perf_branch_stack.
> Probably a good idea to specify the same above.
> 
>   * For the architectures whose raw branch records are
>   * already stored in age order, the hw_idx should be 0.
>   */
> struct perf_branch_stack {
> 	u64				nr;
> 	u64				hw_idx;
> 	struct perf_branch_entry	entries[];
> };
> 

I found it easily enough. I wouldn't want to put the same comment in two 
places and risk one of them going stale. And if I take it away from one 
place and move it to the struct then it's just missing from somewhere 
else instead. So I think I'd rather leave this one.

>>
>> It's probably too risky to remove PERF_SAMPLE_BRANCH_HW_INDEX from BRBE
>> now in case anyone is setting it and reading the value, but zero
>> initializing the whole struct also protects against the same issue with
>> new fields that are added in the future.
> 
> Agreed. Because PERF_SAMPLE_BRANCH_HW_INDEX is supported in BRBE,
> hw_idx pushed to the userspace should be zero if HW never updates.
> This is definitely better than dropping PERF_SAMPLE_BRANCH_HW_INDEX
> flag all together to avoid breaking current users (if any).
>>
>> Fixes: 58074a0fce66 ("perf: arm_pmuv3: Add support for the Branch Record Buffer Extension (BRBE)")
>> Signed-off-by: James Clark <james.clark@linaro.org>
> 
> Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
> 

Thanks

>> ---
>> Very small fix spotted by Sashiko. It was probably always zero during
>> testing or never looked at.
>> ---
>>   drivers/perf/arm_pmuv3.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/perf/arm_pmuv3.c b/drivers/perf/arm_pmuv3.c
>> index 8014ff766cff..b9a8592bf112 100644
>> --- a/drivers/perf/arm_pmuv3.c
>> +++ b/drivers/perf/arm_pmuv3.c
>> @@ -1361,7 +1361,7 @@ static int branch_records_alloc(struct arm_pmu *armpmu)
>>   		struct pmu_hw_events *events_cpu;
>>   
>>   		events_cpu = per_cpu_ptr(armpmu->hw_events, cpu);
>> -		events_cpu->branch_stack = kmalloc(size, GFP_KERNEL);
>> +		events_cpu->branch_stack = kzalloc(size, GFP_KERNEL);
>>   		if (!events_cpu->branch_stack)
>>   			return -ENOMEM;
>>   	}
>>
>> ---
>> base-commit: f9a2394a23482bfd330911e9c8295b71724feacd
>> change-id: 20260807-james-brbe-init-hw-idx-53dec54fe266
>>
>> Best regards,
>> --
>> James Clark <james.clark@linaro.org>
>>
> 


