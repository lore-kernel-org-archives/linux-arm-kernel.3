Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8539E7718F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jan 2025 09:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cWtjK5g4BM/SvEXkEBPomhMpQ0cOqD61cD7+kwN1xqo=; b=qYhfnvpc6Gdye+3XO8HjK74N5r
	gDaSEyoLnl1d78sDDY1f4JqFAZj4I0h45UHzdVTtrCOq3psJIL+vbEc80FETIx7XeD0TfHa8IFh/j
	/TMM+XbYy8hw1RgF6qohT8PG+fKp7f8VFKeAgLkxtwSZYukMNPaZXRD7s7GBRMF4EOuR9b53sB6J0
	u4S82CYBMOtEKw7fVOvYm8q+nV5FgEubHBTQuZ1GM3uysWO40ko7YtmEUzbP4ILJPQfc1ZoqHZRgi
	ZDF32FsB7RHUmtmN46Ca/HmBaHQIsaoBvZ1Dcczfc08Im8T4WU3dgRN+6zL+rZ//OwQ0Oql1wqxiz
	3/YQHyaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTe75-0000000CdcW-2NAg;
	Fri, 03 Jan 2025 09:37:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTe5u-0000000CdRx-3VFM
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 03 Jan 2025 09:35:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=cWtjK5g4BM/SvEXkEBPomhMpQ0cOqD61cD7+kwN1xqo=; b=Y7Fw5v52Z8e413d8xi3tnbPEig
	lzF/iOa5DNnSJSXM8Z1BfxUdkG3IO8HRy12cqLNbIpLj2q2e7QRZsmjCs+CxCqp618cxa/aCMNbnr
	RdxvvZi1IomDYK7QdrGRLUd9pBkqT4hnK8pJF4aCku/jP1DemnmltYes9fGUD5SIB6NM8988pxpG5
	oa3NORyoW9R6rx3pP7QMtikGWU3ifcaYeKKCo4D0FY1GsIvBaLkBYKmu67suYRvcnDqQTZZTkDTzC
	IHppxnn67WHV/B+ZBJsxAHUA7B7BVCVlmYlY+vYv/4myyt/wuvVQVxtfqbVcK3wnVLQ9Z2xPgzYQy
	24p0JdFA==;
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTe5r-00000008LxK-2koL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jan 2025 09:35:49 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-21669fd5c7cso169431655ad.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Jan 2025 01:35:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1735896946; x=1736501746; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cWtjK5g4BM/SvEXkEBPomhMpQ0cOqD61cD7+kwN1xqo=;
        b=bLp/K5ME/RyzMxLI53y6vRZrs/+LuPtrzQNRbIgHsHKh56fOjsn9stgNG0mZLqTVGE
         l3whKzFg5b5WHR23nu9/QUT34kMLnU326OgKuYstPDs7AvAyvZ2OzRwGY/XpkGPtf3d+
         xL51GkTLkUZfq3RDeKMOIApzs74z09gaNapiGQmhyp/kV4bSi2ziSfUIHznfr7ntY0cS
         fqbkuKyKfXEtPyGCmimCV8X6TvU07Vdtbvt1fyju3hjWFTDMD5P1L12M/b2qAhY0SEWZ
         VkEMQRJd988eDzl92qMGBVIniE+LsttfeYZwTkE8flDSZ5tFP0xa0y6Yuv9eCpM1qVln
         uh9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735896946; x=1736501746;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cWtjK5g4BM/SvEXkEBPomhMpQ0cOqD61cD7+kwN1xqo=;
        b=TlGif1EFDPV2pvoHUQcm66RHofMSkHwsnf3/lqMZ03IS/BflecxsRuy22Ok1NdYVNi
         PHYUHjTKXjv1DsvV4iNdxhVnQzEtGwDGYumwet10TtO/yqNdScYmQo9CRaLf+HLB71Ax
         V7zKVBcNdvYIXEv/YjyKZIjHBj6IgBHJonbzQi4ZJs/XTG2YOCvRFO4uUe7Xe8WNJsRi
         oKv1yy5GaC40rSPt3I7kHw4Ee7rrI0Dbu+Wdd0/rVTVkwsv8/SA4AG/WvOK1U6wdmO+r
         /vs0BNjOS7icvliS6BZu5TyF45yYiEjjvicYQwDOIwaoUZ7nuJbAjrSgJDAu/6FRkvm6
         GMgQ==
X-Forwarded-Encrypted: i=1; AJvYcCVn5EqpQBOCRM4joFvH9ZFRy8BFjdPH00/y+7wh3c4MbzvLDl4ozRD8yhOGrfBOddxITO1rRp8OFdTxT/AwsDlO@lists.infradead.org
X-Gm-Message-State: AOJu0YzYLj4XNUAKp8JVr48Xfcnd2gxV9owB731VvaopszNGAN0Gs/jl
	q0KF6zzusPK5P+ItP/haYHCwAkqfIO4jvrl0RSAHymDx8ONiSUkLFazG+gP5T3w=
X-Gm-Gg: ASbGncuvfQWjOUXTBVn1nn9CKuMS5r6sMh7FnSTCgaQpFbeCrOF91XvWUcRxuglWmi+
	HKwdzgEHfyQiHiBVKvShc5eXVXje4wurZ5SPcL0c0BDO48uNcRvMfQ12jk1R8sM7tynb3wK8wcZ
	tCpBfH3JglilPTnuOVSIGGqp2mOwrm0/1MrGJ0/5Wm2j98AcENyO57Eyv8nXmVPlGqW04QUFSFn
	hMAY1WXnNBV7264TaNs8CpPzkA1JGJLZWWq+QbZ4d36zgrPMHCUCxfh39Ii66Nx1jlZRpK0QBos
	aUBOig==
X-Google-Smtp-Source: AGHT+IE9O96BS3RyGLgD9ozZE9cvlEJyEf8vCWPZNZOt2fNtD1RyepOtwaueaYCtTF24hvZZQqYEyw==
X-Received: by 2002:a17:902:d481:b0:215:6fcd:6cd1 with SMTP id d9443c01a7336-219e6e8c508mr551854195ad.7.1735896945927;
        Fri, 03 Jan 2025 01:35:45 -0800 (PST)
Received: from [10.84.148.23] ([203.208.167.150])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9cddf2sm241537305ad.166.2025.01.03.01.35.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jan 2025 01:35:45 -0800 (PST)
Message-ID: <31e1a033-00a7-4953-81e7-0caedd0227a9@bytedance.com>
Date: Fri, 3 Jan 2025 17:35:30 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 10/15] riscv: pgtable: move pagetable_dtor() to
 __tlb_remove_table()
Content-Language: en-US
From: Qi Zheng <zhengqi.arch@bytedance.com>
To: Kevin Brodsky <kevin.brodsky@arm.com>, peterz@infradead.org
Cc: agordeev@linux.ibm.com, palmer@dabbelt.com, tglx@linutronix.de,
 david@redhat.com, jannh@google.com, hughd@google.com, yuzhao@google.com,
 willy@infradead.org, muchun.song@linux.dev, vbabka@kernel.org,
 lorenzo.stoakes@oracle.com, akpm@linux-foundation.org, rientjes@google.com,
 vishal.moola@gmail.com, arnd@arndb.de, will@kernel.org,
 aneesh.kumar@kernel.org, npiggin@gmail.com, dave.hansen@linux.intel.com,
 rppt@kernel.org, ryan.roberts@arm.com, linux-mm@kvack.org,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-kernel@vger.kernel.org, x86@kernel.org,
 linux-arch@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-openrisc@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-um@lists.infradead.org
References: <cover.1735549103.git.zhengqi.arch@bytedance.com>
 <0e8f0b3835c15e99145e0006ac1020ae45a2b166.1735549103.git.zhengqi.arch@bytedance.com>
 <1b09335c-f0b6-4ccb-9800-5fb22f7e8083@arm.com>
 <ebce5e05-5e46-4c6e-94a0-bcf3655a862b@bytedance.com>
 <7e2c26c8-f5df-4833-a93f-3409b00b58fd@arm.com>
 <e9fe97d4-99d5-443e-b722-43903655a76e@bytedance.com>
In-Reply-To: <e9fe97d4-99d5-443e-b722-43903655a76e@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_093547_975825_68BF5B1B 
X-CRM114-Status: GOOD (  37.05  )
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



On 2025/1/3 17:13, Qi Zheng wrote:
> 
> 
> On 2025/1/3 16:02, Kevin Brodsky wrote:
>> On 03/01/2025 04:48, Qi Zheng wrote:
>>> Hi Kevin,
>>>
>>> On 2025/1/3 00:53, Kevin Brodsky wrote:
>>>> On 30/12/2024 10:07, Qi Zheng wrote:
>>>>>    static inline void riscv_tlb_remove_ptdesc(struct mmu_gather *tlb,
>>>>> void *pt)
>>>>>    {
>>>>> -    if (riscv_use_sbi_for_rfence())
>>>>> +    if (riscv_use_sbi_for_rfence()) {
>>>>>            tlb_remove_ptdesc(tlb, pt);
>>>>> -    else
>>>>> +    } else {
>>>>> +        pagetable_dtor(pt);
>>>>>            tlb_remove_page_ptdesc(tlb, pt);
>>>>
>>>> I find the imbalance pretty confusing: pagetable_dtor() is called
>>>> explicitly before using tlb_remove_page() but not tlb_remove_ptdesc().
>>>> Doesn't that assume that CONFIG_MMU_GATHER_HAVE_TABLE_FREE is selected?
>>>> Could we not call pagetable_dtor() from 
>>>> __tlb_batch_free_encoded_pages()
>>>> to ensure that the dtor is always called just before freeing, and 
>>>> remove
>>>
>>> In __tlb_batch_free_encoded_pages(), we can indeed detect PageTable()
>>> and call pagetable_dtor() to dtor the page table pages.
>>> But __tlb_batch_free_encoded_pages() is also used to free normal pages
>>> (not page table pages), so I don't want to add overhead there.
>>
>> Interesting, can a tlb batch refer to pages than are not PTPs then?
> 
> Yes, you can see the caller of __tlb_remove_folio_pages() or 
> tlb_remove_page_size().
> 
>>
>>>
>>> But now I think maybe we can do this in tlb_remove_page_ptdesc(), like
>>> this:
>>>
>>> diff --git a/arch/csky/include/asm/pgalloc.h
>>> b/arch/csky/include/asm/pgalloc.h
>>> index f1ce5b7b28f22..e45c7e91dcbf9 100644
>>> --- a/arch/csky/include/asm/pgalloc.h
>>> +++ b/arch/csky/include/asm/pgalloc.h
>>> @@ -63,7 +63,6 @@ static inline pgd_t *pgd_alloc(struct mm_struct *mm)
>>>
>>>   #define __pte_free_tlb(tlb, pte, address)              \
>>>   do {                                                   \
>>> -       pagetable_dtor(page_ptdesc(pte));               \
>>>          tlb_remove_page_ptdesc(tlb, page_ptdesc(pte));  \
>>>   } while (0)
>>>
>>> [...]
>>>
>>> diff --git a/include/asm-generic/tlb.h b/include/asm-generic/tlb.h
>>> index a96d4b440f3da..a59205863f431 100644
>>> --- a/include/asm-generic/tlb.h
>>> +++ b/include/asm-generic/tlb.h
>>> @@ -506,6 +506,7 @@ static inline void tlb_remove_ptdesc(struct
>>> mmu_gather *tlb, void *pt)
>>>   /* Like tlb_remove_ptdesc, but for page-like page directories. */
>>>   static inline void tlb_remove_page_ptdesc(struct mmu_gather *tlb,
>>> struct ptdesc *pt)
>>>   {
>>> +       pagetable_dtor(pt);
>>>          tlb_remove_page(tlb, ptdesc_page(pt));
>>>   }
>>
>> I think this is an interesting idea, it does make arch code easier to
>> follow. OTOH it would have been more natural to me to call
>> pagetable_dtor() from tlb_remove_page(). I can however see that this
>> doesn't work, because tlb_remove_table() is defined as tlb_remove_page()
>> if CONFIG_MMU_GATHER_HAVE_TABLE_FREE isn't selected. Which brings me
>> back to my earlier question: in that case, aren't we missing a call to
>> pagetable_dtor() when using tlb_remove_table() (or tlb_remove_ptdesc())?
> 
> Thank you for pointing this out!
> 
> Now, there are the following architectures selected 
> CONFIG_MMU_GATHER_RCU_TABLE_FREE:
> 
> 1. arm: select MMU_GATHER_RCU_TABLE_FREE if SMP && ARM_LPAE
> 2. arm64: select MMU_GATHER_RCU_TABLE_FREE
> 3. powerpc: select MMU_GATHER_RCU_TABLE_FREE
> 4. riscv: select MMU_GATHER_RCU_TABLE_FREE if SMP && MMU
> 5. s390: select MMU_GATHER_RCU_TABLE_FREE
> 6. sparc: select MMU_GATHER_RCU_TABLE_FREE if SMP
> 7. x86: select MMU_GATHER_RCU_TABLE_FREE    if PARAVIRT
> 
> If CONFIG_MMU_GATHER_TABLE_FREE is selected, an architecture is expected
> to provide __tlb_remove_table(). This patch series modifies the
> __tlb_remove_table() in arm, arm64, riscv, s390 and x86. Among them,
> arm64 and s390 unconditionally select MMU_GATHER_RCU_TABLE_FREE, so we
> only need to double-check arm, riscv and x86.
> 
> For x86, it was called tlb_remove_page() in the non-PARAVIRT case, and I
> added pagetable_dtor() for it explicitly (see patch #11), so this should
> be no problem.
> 
> For riscv, it will only call tlb_remove_ptdesc() in the case of
> SMP && MMU, so this should be no problem.
> 
> For arm, the call to pagetable_dtor() is indeed missed in the
> non-MMU_GATHER_RCU_TABLE_FREE case. This needs to be fixed. But we
> can't fix this by adding pagetable_dtor() to tlb_remove_table(),
> because some architectures call tlb_remove_table() but don't support
> page table statistics, like sparc.
> 
> So a more direct fix might be:
> 
> diff --git a/include/asm-generic/tlb.h b/include/asm-generic/tlb.h
> index a59205863f431..0a131444a18ca 100644
> --- a/include/asm-generic/tlb.h
> +++ b/include/asm-generic/tlb.h
> @@ -500,6 +500,9 @@ static inline void tlb_remove_page(struct mmu_gather 
> *tlb, struct page *page)
> 
>   static inline void tlb_remove_ptdesc(struct mmu_gather *tlb, void *pt)
>   {
> +#ifndef CONFIG_MMU_GATHER_TABLE_FREE
> +       pagetable_dtor(pt);
> +#endif
>          tlb_remove_table(tlb, pt);
>   }
> 
> Or fix it directly in arm? Like the following:
> 
> diff --git a/arch/arm/include/asm/tlb.h b/arch/arm/include/asm/tlb.h
> index ea4fbe7b17f6f..cf5d0ca021440 100644
> --- a/arch/arm/include/asm/tlb.h
> +++ b/arch/arm/include/asm/tlb.h
> @@ -43,6 +43,9 @@ __pte_free_tlb(struct mmu_gather *tlb, pgtable_t pte, 
> unsigned long addr)
>          __tlb_adjust_range(tlb, addr - PAGE_SIZE, 2 * PAGE_SIZE);
>   #endif
> 
> +#ifndef CONFIG_MMU_GATHER_TABLE_FREE
> +       pagetable_dtor(ptdesc);
> +#endif
>          tlb_remove_ptdesc(tlb, ptdesc);
>   }

Or can we just not let tlb_remove_table() fall back to
tlb_remove_page()? Like the following:

diff --git a/include/asm-generic/tlb.h b/include/asm-generic/tlb.h
index a59205863f431..354ffaa4bd120 100644
--- a/include/asm-generic/tlb.h
+++ b/include/asm-generic/tlb.h
@@ -195,8 +195,6 @@
   *  various ptep_get_and_clear() functions.
   */

-#ifdef CONFIG_MMU_GATHER_TABLE_FREE
-
  struct mmu_table_batch {
  #ifdef CONFIG_MMU_GATHER_RCU_TABLE_FREE
         struct rcu_head         rcu;
@@ -219,16 +217,6 @@ static inline void __tlb_remove_table(void *table)

  extern void tlb_remove_table(struct mmu_gather *tlb, void *table);

-#else /* !CONFIG_MMU_GATHER_HAVE_TABLE_FREE */
-
-/*
- * Without MMU_GATHER_TABLE_FREE the architecture is assumed to have 
page based
- * page directories and we can use the normal page batching to free them.
- */
-#define tlb_remove_table(tlb, page) tlb_remove_page((tlb), (page))
-
-#endif /* CONFIG_MMU_GATHER_TABLE_FREE */
-
  #ifdef CONFIG_MMU_GATHER_RCU_TABLE_FREE
  /*
   * This allows an architecture that does not use the linux page-tables for

> 
> Thanks,
> Qi
> 
>>
>> - Kevin

