Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C85F6C369A1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 03:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9XMr/eO0DdnkcMTouhh5uGqjIuVE+H+9lNMnsptGCrs=; b=XSML0H+56q6sXaUidwJZAS4yZ3
	2EmLY8/EQDmYABYD0LCTMmSMzvxmEqXxLTGpS5fHVMZnAXd+xAdh/gwAWFYOjwGQ+jocgbWpUM0Rb
	Y74peKh3lS6UYl7M0VPOdcWBf3cOIdm1W3mrPFx2MUs1rdiFBU95X/YO5oBllGd5wmin5t3n+m8LR
	JxpDGa61ysTLHGB3/H7uovyVrs4i2qRNl0BHxEOKAQTyRi+6avU3b2z4Atkd0SyU3ZLHsGAznrufD
	8XzFsz3A+SVY59avB5kbKbm2nz7Xfa6/Jv0D7qIuEMgFHx7TTRfLrJWZZKwQz+CZqCQqLj8yG96ts
	mVbpqyQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2iHK-000000096Dy-2LsV;
	Thu, 10 Apr 2025 03:08:34 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2iFX-0000000963N-2Ktm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Apr 2025 03:06:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744254402;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9XMr/eO0DdnkcMTouhh5uGqjIuVE+H+9lNMnsptGCrs=;
	b=SE5Wemepkq767cKZxrxC6mQBflshzA+XVbnI7Y8exDS9gMTVA1aVzwBez536UaZ9g3cQCU
	Va9kuALwIt5cD1dwXd/YP4psNlgOX1GiKqRDskfN9kxMrJuYr0Eu0yuD3N1sfV1VtR5/GE
	wZru7VGK33QTL8ppwSpGw2fV3OGrSEs=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-132-0wTAkblPMf-UgJ6ef_jH2w-1; Wed, 09 Apr 2025 23:06:39 -0400
X-MC-Unique: 0wTAkblPMf-UgJ6ef_jH2w-1
X-Mimecast-MFC-AGG-ID: 0wTAkblPMf-UgJ6ef_jH2w_1744254398
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-225505d1ca5so3145145ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Apr 2025 20:06:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744254398; x=1744859198;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9XMr/eO0DdnkcMTouhh5uGqjIuVE+H+9lNMnsptGCrs=;
        b=lX65+we+wl/1ViySAuMRy8MFhNL0YRw8KYhoNKGVG5b2KOE7om0f+8aQZDCepVTBdZ
         IRci9MhklsHhYEImRoZ7HEIX8zC+urUpxUmJnjJBdqxRMulv1pXaC9XFnGRx0jfw4fDQ
         HF80wHVjocbiS/AEy0Ei9UnhQeLq0vmKQJi9lM4itb2OiouPshIFVGNcj+1sN9wUCloJ
         DD2ZnjV768u+EtcPM2rB+Zi6PinTGwdZyZ3YUu0pSXMhbJVQ9F34PIkr9jGIaz+Zsm8k
         X8mTzYboOz75xwFoZG82JjaqfVMK8FGdIaffavA6pK7j3xbqgAJBlq70i1/Ya5OwWmFe
         cjvQ==
X-Forwarded-Encrypted: i=1; AJvYcCVjG+0gV/UCzA9/y/atAmuPveRdpLsl6w0B/Ue3hT+C4CIr+69MMC53IPKisRwxJPLNpP982VHisPTqmiDjZI+X@lists.infradead.org
X-Gm-Message-State: AOJu0Yysm+P+uDKvNseSQCH+wyeVrXpz2PJV6MQFd7i5v/rUC3uXCGpo
	TD4grNoyMomWvh84DYW/JZiuRKjrIEbAkbU7Owb88soocpNQfcSfEREJPQQRrf1tQU1K1+77SDs
	X7LlCHJo96zNZ0l1H4uxVN7w4yR4lfHs4blY4EFpjZL1XsKJcm0RiQbo8exoobmOjXKIjYRcS
X-Gm-Gg: ASbGnctsyIQQwBCzYd6zA9zFzqDqZIVMmjuU2XkgWlpr5PgP7/HyS5YBLee0wnaXMo0
	yded9n1GZSzh+EIO8ijc5pvR6SwiTx++q9UiHOiYm8u/hpP+YXobShhkLKA/+5ShErzA7TXjmIu
	SvN5w7akH0sT0XYKCPZWd1hBA/xN7YVi9AuX0nvuO2oCZ50hwxMtDB0j649iEIXQ4PGC9oxJJ38
	PqzLDslabJw9jjb1mVX7uTL/G/01ZHxlO6qhhTrU+zuExgzYxHgf9NynoD0olMuc4pGAZnQAfvM
	PY1UVQzcZJVP
X-Received: by 2002:a17:902:d4ca:b0:223:2630:6b82 with SMTP id d9443c01a7336-22b2edad4damr17421905ad.10.1744254398092;
        Wed, 09 Apr 2025 20:06:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHzlBkyEQFpu9vtQ/YjmuNT9je8xNQcOB1fjPDsW03Tq7GevZn8h8JQCXraYTcFA36FNyc+tA==
X-Received: by 2002:a17:902:d4ca:b0:223:2630:6b82 with SMTP id d9443c01a7336-22b2edad4damr17421675ad.10.1744254397748;
        Wed, 09 Apr 2025 20:06:37 -0700 (PDT)
Received: from [192.168.68.55] ([180.233.125.65])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7ccb57fsm19847395ad.229.2025.04.09.20.06.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Apr 2025 20:06:37 -0700 (PDT)
Message-ID: <343c26b4-285d-404b-a397-2b5785cfe18e@redhat.com>
Date: Thu, 10 Apr 2025 13:06:31 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] mm/contpte: Optimize loop to reduce redundant
 operations
To: Xavier <xavier_qy@163.com>
Cc: dev.jain@arm.com, akpm@linux-foundation.org, baohua@kernel.org,
 ryan.roberts@arm.com, catalin.marinas@arm.com, ioworker0@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 will@kernel.org
References: <027cc666-a562-46fa-bca5-1122ea00ec0e@arm.com>
 <20250408085809.2217618-1-xavier_qy@163.com>
 <20250408085809.2217618-2-xavier_qy@163.com>
 <34a4bf01-6324-482b-a011-32974d68e02f@redhat.com>
 <711cf430.b25d.1961b1a1b0e.Coremail.xavier_qy@163.com>
 <3a9c1db1-7598-4f71-be62-f6005e3fec72@redhat.com>
 <32828be7.3220.1961d9e3cc3.Coremail.xavier_qy@163.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <32828be7.3220.1961d9e3cc3.Coremail.xavier_qy@163.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: VN55anrB_ZJDjW8t_SfdsUEuvmP5qcUR1WzALt--32g_1744254398
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_200643_692899_B541B859 
X-CRM114-Status: GOOD (  32.99  )
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

Hi Xavier,

On 4/10/25 12:53 PM, Xavier wrote:
> At 2025-04-10 08:58:46, "Gavin Shan" <gshan@redhat.com> wrote:
>>
>> On 4/10/25 1:10 AM, Xavier wrote:
>>>
>>> Thank you for carefully reviewing this patch and raising your questions.
>>> I'll try to explain and answer them below.
>>>
>>
>> Not a problem :)
>>
>>>
>>> At 2025-04-09 12:09:48, "Gavin Shan" <gshan@redhat.com> wrote:
>>>> Hi Xavier,
>>>>
>>>> On 4/8/25 6:58 PM, Xavier wrote:
>>>>> This commit optimizes the contpte_ptep_get function by adding early
>>>>>     termination logic. It checks if the dirty and young bits of orig_pte
>>>>>     are already set and skips redundant bit-setting operations during
>>>>>     the loop. This reduces unnecessary iterations and improves performance.
>>>>>
>>>>> Signed-off-by: Xavier <xavier_qy@163.com>
>>>>> ---
>>>>>     arch/arm64/mm/contpte.c | 22 ++++++++++++++++++++--
>>>>>     1 file changed, 20 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/arch/arm64/mm/contpte.c b/arch/arm64/mm/contpte.c
>>>>> index bcac4f55f9c1..034d153d7d19 100644
>>>>> --- a/arch/arm64/mm/contpte.c
>>>>> +++ b/arch/arm64/mm/contpte.c
>>>>> @@ -152,6 +152,18 @@ void __contpte_try_unfold(struct mm_struct *mm, unsigned long addr,
>>>>>     }
>>>>>     EXPORT_SYMBOL_GPL(__contpte_try_unfold);
>>>>>     
>>>>
>>>> I'm wandering how it can work. More details are given below.
>>>>
>>>>> +#define CHECK_CONTPTE_FLAG(start, ptep, orig_pte, flag) \
>>>>> +	do { \
>>>>> +		int _start = start; \
>>>>> +		pte_t *_ptep = ptep; \
>>>>> +		while (_start++ < CONT_PTES) { \
>>>>> +			if (pte_##flag(__ptep_get(_ptep++))) { \
>>>>> +				orig_pte = pte_mk##flag(orig_pte); \
>>>>> +				break; \
>>>>> +			} \
>>>>> +		} \
>>>>> +	} while (0)
>>>>> +
>>
>> nit: the variable _start and _ptep can be dropped since the caller is going to
>> bail after CHECK_CONTPTE_FLAG(). However, I'm wandering it's going to introduce
>> burden to contpte_ptep_get() for its readability, much more complex than I
>> thought.
> 
> Not adding these two variables in the current code has no impact. The main purpose
> of adding them is to improve maintainability and prevent the external code from
> continuing operations unknowingly after the macro has modified the variables.
> 
>>
>>>>
>>>> CONT_PTES is 16 with the assumption of 4KB base page size. CHECK_CONTPTE_FLAG()
>>>> collects the flag for ptep[start, CONT_PTES].
>>>>
>>>>>     pte_t contpte_ptep_get(pte_t *ptep, pte_t orig_pte)
>>>>>     {
>>>>>     	/*
>>>>> @@ -169,11 +181,17 @@ pte_t contpte_ptep_get(pte_t *ptep, pte_t orig_pte)
>>>>>     	for (i = 0; i < CONT_PTES; i++, ptep++) {
>>>>>     		pte = __ptep_get(ptep);
>>>>>     
>>>>> -		if (pte_dirty(pte))
>>>>> +		if (pte_dirty(pte)) {
>>>>>     			orig_pte = pte_mkdirty(orig_pte);
>>>>> +			CHECK_CONTPTE_FLAG(i, ptep, orig_pte, young);
>>>>> +			break;
>>>>> +		}
>>>>>     
>>>>> -		if (pte_young(pte))
>>>>> +		if (pte_young(pte)) {
>>>>>     			orig_pte = pte_mkyoung(orig_pte);
>>>>> +			CHECK_CONTPTE_FLAG(i, ptep, orig_pte, dirty);
>>>>> +			break;
>>>>> +		}
>>>>>     	}
>>>>>     
>>>>>     	return orig_pte;
>>>>
>>>> There are two issues as I can see: (1) The loop stops on any dirty or young flag. Another
>>>> flag can be missed when one flag is seen. For example, when ptep[0] has both dirty/young
>>>> flag, only the dirty flag is collected. (2) CHECK_CONTPTE_FLAG() iterates ptep[i, CONT_PTES],
>>>> conflicting to the outer loop, which iterates ptep[0, CONT_PTES].
>>>
>>> No flags will be missed. The outer loop is used to check for the first flag,
>>> which could be either the dirty or young flag.
>>> Once this flag (let's assume it's the dirty flag) is found in the i-th PTE,
>>> the dirty flag of orig_pte will be set, and the code will immediately enter
>>> the inner loop, namely CHECK_CONTPTE_FLAG. This inner loop will continue
>>> to check only for the young flag starting from the i-th position, and we needn't
>>> concern about the dirty flag anymore.
>>> If CHECK_CONTPTE_FLAG finds the young flag in the j-th PTE, the young flag
>>> of orig_pte will be set. At this point, both the young and dirty flags of
>>> orig_pte have been set, and there's no need for further loop judgments, so
>>> the both the inner and outer loops can be exited directly. This approach
>>> reduces unnecessary repeated traversals and judgments.
>>>
>>
>> Thanks for the explanation. I missed that the subsequent young bit is collected
>> on pte_dirty(). Similarly, the subsequent dirty bit is collected on pte_young().
>> Now I can see all (dirty | young) bits are collected with a lost.
>>
>>>>
>>>> Besides, I also doubt how much performance can be gained by bailing early on (dirty | young).
>>>> However, it's avoided to cross the L1D cache line boundary if possible. With 4KB base page
>>>> size, 128 bytes are needed for ptep[CONT_PTES], equal to two cache lines. If we can bail
>>>> early with luck, we don't have to step into another cache line. Note that extra checks needs
>>>> more CPU cycles.
>>>
>>> Compared to the previous function, this code doesn't add any extra checks.
>>> Even in the worst-case scenario, where neither a dirty nor a young flag is
>>> found among the 16 PTEs, the number of checks is the same as in the original
>>> function. If any flag is found earlier, the optimized patch will reduce the
>>> number of subsequent checks for that flag compared to the original code.
>>>
>>
>> There are 32 checks in the original code (assuming we have 4kb base page size
>> and CONT_PTES == 16) and the number of checks is fixed. With your patch applied,
>> the number becomes 32 + (number from CHECK_CONTPTE_FLAG) if all PTEs have
>> pte_dirty() and none of them has pte_young(), if I don't miss anything here.
>>
> 
> If all PTEs are dirty and none are young, the code will enter CHECK_CONTPTE_FLAG
> when it encounters the first dirty PTE. Inside CHECK_CONTPTE_FLAG, it only checks
> for the young bit (16 - 0) times and then exits all loops. In this case, the total number
> of checks is 1 + 16, which is less than the original 32.
> 

You're correct. The outer loop is going to stop on pte_dirty() or pte_young(). Well,
you can see the code becomes hard to be understood, at least to me :)

[...]

Thanks,
Gavin


