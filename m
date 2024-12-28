Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3840CE77188
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Dec 2024 06:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xz9+aZKFL34BZ+QKJapn5mhTQ8zZC8UnFG8XP+zHLMo=; b=MKoToDvj20tQL1aRQoo3ybN0dP
	Qe4w1V9lJslQf4jpjf9upSi4vgqHgonSmwg3/IoxL8MwqO6WoZWE4KrtNuVmr+bk5QwdlHA3Ury36
	FrV1kGaaOeQ5XoaVw8ORLXfLqRoNwB2YIyuhEBR2dc+ZU34V5DLyHgdjJGolQusYrERDQargGYVLf
	0je7vIZ3ksKSr835YoDo6O892xLTi3BDGbpqigWBr5KOY24HBihXBySfsQNJMuuAFstcr3Ar4xf1x
	VMOHKulkz3UJ9PKwYMxSJdyilbv8PBYnSCshkhUd3uceT0pTC7KN4vvq/3b5jdVnO5K8GU6xVDyfX
	V9aWQ6hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRQSN-00000001Ufj-0qDR;
	Sat, 28 Dec 2024 06:37:51 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tRQRA-00000001UVH-0mHh
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Dec 2024 06:36:37 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2165448243fso115095995ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Dec 2024 22:36:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1735367791; x=1735972591; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xz9+aZKFL34BZ+QKJapn5mhTQ8zZC8UnFG8XP+zHLMo=;
        b=hkwicBqicDZLILKL8fAFrt0HtnX7eDgJe/87hs4QaBfvjX88BuYu8cNfYb8egmFVJy
         JDxjpqMbz+adCItTBQ2eUUp5vxliJHsUnD4+2690clzyKUUHpyKVKFxkl9HkJ46/s7XH
         AUotsDf08kIu9EgE1mpM+UqAv13iVuB+pY0BxylHh7u5utCCk29kEPartkXgMyQDe1Bu
         ORduJ4bqLDMtjR8bnxjUOYzIN7MwcgnjygrCcvJ31xLX+w6+sv+GtRis0hyMSmdyfQ4e
         80weXbavWhf9q8RQZz4uZMOc4D5iRUQe/QO/kVTS+wnz3714KopjhFBXxwxNTFr6orql
         NNsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735367791; x=1735972591;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xz9+aZKFL34BZ+QKJapn5mhTQ8zZC8UnFG8XP+zHLMo=;
        b=sWgFTD24yKlIDhqg/+Y8e9hSacE5/cPRe4+0wyRLNz1ptbk9F18b13hJgjJZKBGbZc
         P5rQSBINkketdoilh2lJvw/ARnzM0ppNolvO87j1s3foh49Iz/KI0fIu37etxJu2oTQA
         EIQweo4APYQOXAaFddGIehaEsGJ/omDRjnSdEPmoOR90dtrUMW1/JlCimeNTmZ7+9pnh
         r5Kr0PNGgbTY9oJrvA1t+OFdDFkWl4cPxKUcudy2DxVhIV4eVuoxdypklUCRfV4WXdYO
         sr/aWidgyecvdtFI57XYjnGwcTejwkP8AwDxqn8zuRFiFmsx4QwMPlGgxZ+wSkE7DfUW
         bYzA==
X-Forwarded-Encrypted: i=1; AJvYcCU+lFg0Ks3kJdLaBQ2H5MQ/xvHZQfUMBAUY5+EAPZ2shVx8ikWYuzlaBeqXKYrmvIj2TbimEKj58QPQkq84/dK/@lists.infradead.org
X-Gm-Message-State: AOJu0YwMFIytSz0kuVqi6Tm9I58oKjfbDTLNPT6Sk5aR9owQRUigiXKM
	hpCrAqrAIY0xjTu7tKC7iTdZjCoZZebmPy5l43DNykHJhBIasAwwEVVknLAG/XM=
X-Gm-Gg: ASbGncsq/KhYD7/PfNpFfa2GTDFkxm4wF/z7GvA/eVYUeHcOgNFN0r7zjconTs/3CYk
	8VKUKaodtBB2NTwR/O1qUfhmTfAUcYDanS3Evxjp/Zxdi8COPZHAc6+CXb3Nh9Ktmopq8OoEM3O
	ajQamnKOMEa78rvmaziLd5gI+sAqUhuZ8MsyW9Za9qLTaor3K0OGsblykl8y7WkfUWnmi/baq5q
	aQNa9ixDgLcjYci4PMpC/7s5fCd/wlSPclazdY5L67VLMpvzPvZh7w1rSAOUl+7KrEjedaXKjWf
	sILW5f1wkqLdvqzZ0QpDxtR9jfLzqIM7Yca4wcbbKZZi0fnTOrYo3A4=
X-Google-Smtp-Source: AGHT+IHJr5/cBm7VE4sKmfeyqyU+nR3KXMBrwpgTBQUiz/94ds3IGaVh/bhouU9p0WQ7mj1Jxu9Qtg==
X-Received: by 2002:a17:902:f682:b0:215:f1c2:fcc4 with SMTP id d9443c01a7336-219e6f1480cmr399252455ad.41.1735367791634;
        Fri, 27 Dec 2024 22:36:31 -0800 (PST)
Received: from ?IPV6:2409:8a28:f44:d7c4:e49d:ee0a:5f86:d7bd? ([2409:8a28:f44:d7c4:e49d:ee0a:5f86:d7bd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc97182dsm144536075ad.82.2024.12.27.22.36.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Dec 2024 22:36:31 -0800 (PST)
Message-ID: <2434dfdf-d4a0-4f81-9b65-51be86487fd2@bytedance.com>
Date: Sat, 28 Dec 2024 14:36:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/17] riscv: mm: Skip pgtable level check in
 {pud,p4d}_alloc_one
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: peterz@infradead.org, agordeev@linux.ibm.com, kevin.brodsky@arm.com,
 tglx@linutronix.de, david@redhat.com, jannh@google.com, hughd@google.com,
 yuzhao@google.com, willy@infradead.org, muchun.song@linux.dev,
 vbabka@kernel.org, lorenzo.stoakes@oracle.com, akpm@linux-foundation.org,
 rientjes@google.com, vishal.moola@gmail.com, Arnd Bergmann <arnd@arndb.de>,
 Will Deacon <will@kernel.org>, aneesh.kumar@kernel.org, npiggin@gmail.com,
 dave.hansen@linux.intel.com, rppt@kernel.org, ryan.roberts@arm.com,
 linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-kernel@vger.kernel.org, x86@kernel.org, linux-arch@vger.kernel.org,
 linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
 loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org,
 linux-sh@vger.kernel.org, linux-um@lists.infradead.org
References: <mhng-3d6d3e65-b264-4033-b985-fa7763cacf9e@palmer-ri-x1c9a>
From: Qi Zheng <zhengqi.arch@bytedance.com>
Content-Language: en-US
In-Reply-To: <mhng-3d6d3e65-b264-4033-b985-fa7763cacf9e@palmer-ri-x1c9a>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241227_223636_484351_F7531357 
X-CRM114-Status: GOOD (  15.81  )
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

Hi Palmer,

On 2024/12/28 00:40, Palmer Dabbelt wrote:
> On Mon, 23 Dec 2024 01:40:48 PST (-0800), zhengqi.arch@bytedance.com wrote:
>> From: Kevin Brodsky <kevin.brodsky@arm.com>
>>
>> {pmd,pud,p4d}_alloc_one() is never called if the corresponding page
>> table level is folded, as {pmd,pud,p4d}_alloc() already does the
>> required check. We can therefore remove the runtime page table level
>> checks in {pud,p4d}_alloc_one. The PUD helper becomes equivalent to
>> the generic version, so we remove it altogether.
>>
>> This is consistent with the way arm64 and x86 handle this situation
>> (runtime check in p4d_free() only).
>>
>> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
>> Acked-by: Dave Hansen <dave.hansen@linux.intel.com>
>> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
>> ---
>>  arch/riscv/include/asm/pgalloc.h | 22 ++++------------------
>>  1 file changed, 4 insertions(+), 18 deletions(-)
>>
>> diff --git a/arch/riscv/include/asm/pgalloc.h 
>> b/arch/riscv/include/asm/pgalloc.h
>> index f52264304f772..8ad0bbe838a24 100644
>> --- a/arch/riscv/include/asm/pgalloc.h
>> +++ b/arch/riscv/include/asm/pgalloc.h
>> @@ -12,7 +12,6 @@
>>  #include <asm/tlb.h>
>>
>>  #ifdef CONFIG_MMU
>> -#define __HAVE_ARCH_PUD_ALLOC_ONE
>>  #define __HAVE_ARCH_PUD_FREE
>>  #include <asm-generic/pgalloc.h>
>>
>> @@ -88,15 +87,6 @@ static inline void pgd_populate_safe(struct 
>> mm_struct *mm, pgd_t *pgd,
>>      }
>>  }
>>
>> -#define pud_alloc_one pud_alloc_one
>> -static inline pud_t *pud_alloc_one(struct mm_struct *mm, unsigned 
>> long addr)
>> -{
>> -    if (pgtable_l4_enabled)
>> -        return __pud_alloc_one(mm, addr);
>> -
>> -    return NULL;
>> -}
>> -
>>  #define pud_free pud_free
>>  static inline void pud_free(struct mm_struct *mm, pud_t *pud)
>>  {
>> @@ -118,15 +108,11 @@ static inline void __pud_free_tlb(struct 
>> mmu_gather *tlb, pud_t *pud,
>>  #define p4d_alloc_one p4d_alloc_one
>>  static inline p4d_t *p4d_alloc_one(struct mm_struct *mm, unsigned 
>> long addr)
>>  {
>> -    if (pgtable_l5_enabled) {
>> -        gfp_t gfp = GFP_PGTABLE_USER;
>> -
>> -        if (mm == &init_mm)
>> -            gfp = GFP_PGTABLE_KERNEL;
>> -        return (p4d_t *)get_zeroed_page(gfp);
>> -    }
>> +    gfp_t gfp = GFP_PGTABLE_USER;
>>
>> -    return NULL;
>> +    if (mm == &init_mm)
>> +        gfp = GFP_PGTABLE_KERNEL;
>> +    return (p4d_t *)get_zeroed_page(gfp);
>>  }
>>
>>  static inline void __p4d_free(struct mm_struct *mm, p4d_t *p4d)
> 
> Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

Thank you for reviewing the patch!

> 
> Are you trying to keep these together, or do you want me to try and pick 
> up the RISC-V bits on their own?

I prefer to keep them together because later patches depend on this one.
And this patch series has been merged into mm-unstable branch.

Thanks!


