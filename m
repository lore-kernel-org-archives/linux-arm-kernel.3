Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7306E77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 03:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M/CQCfwbCGmNbncAnjTVlLDBhrllfolDtdV4jFWfmgY=; b=26Mr8CCN2UdnBf1tQk11DlS9R9
	0nkgndKHyNkWfLEQro0Ss1g58UwWICZz1qZ81s96TpNllbO7dDIHRHHPgZFE7P4EnrPPujPGiDYu8
	hYSzhNFDtJSShaah6h3/dujfDDmTHp4H3qXvRhvDhXPox4LLssmRWbgW5ShyRTPcAjCK79iqJ8R00
	KdPo65PRqYe4jePJ1zCut2PXTJmQ9XL/9wtM27tbZK2gTBjvKJI7MNE8wcDg+kGH7qfa+2DDF/1j8
	28KD+JuVJ5fO8XrkaH4TYPIGC65AF5720G1xvtenOo9pJ1gXnkuLKgn4g90xk8wJV/byIPcL1j5DU
	BtQZLkXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUe9A-000000009vM-2jLN;
	Mon, 06 Jan 2025 03:51:20 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUe7w-000000009lx-2BIu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jan 2025 03:50:06 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-2eec9b3a1bbso15658635a91.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 05 Jan 2025 19:49:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1736135398; x=1736740198; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M/CQCfwbCGmNbncAnjTVlLDBhrllfolDtdV4jFWfmgY=;
        b=VTWjw4+E8suzl8KY7F/aL4w0g+nRgiS8BdE00CTrZ0MKJIZE5143ZlM6WEMQ6tdPTn
         g05g0uitwOBkCxOuv7TlqlySkjXFm+DhXloIvPOQbOkdQm1zreRUYDqc3dTwXkDnf5dp
         ew6d8TC1WJsQsnoMqdyzg9rhZwFS1MLBisrFsYN4DkoNDbQHepd39Q3mG1MLnV+5cVwv
         /L4HWBul2AXFDXYY0wc2pHmPUQvtnw76m/qRmaeQXOL6JlV0yUbaCKa4LBYhwBSsckkS
         yZKvAXIfTGTvSYtUPx2/bVIgU5Zl1AIpwmjD5sbGZzSHRrCx93weWJ9ZelUh3/UGH4I9
         BCxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736135398; x=1736740198;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M/CQCfwbCGmNbncAnjTVlLDBhrllfolDtdV4jFWfmgY=;
        b=sHBPWd4HxuehWKdOBTr0dRVOY0b2q6WHzKaXi6D5rWYz60CRoXPNhEFGYQmH/XXY5r
         ce85Pe6d+mfDFSoULtC3W0KhUPOM8DADsQyO2zEEl33AQ/3QVAh/CkrP73vB3LnHni7b
         zw9+b79fB6vfk/pa3rKYmq5U3YiqF3id1QMJrCr0zy0bUsNcacvajHPHOa98ptyFPs2E
         /qTQ0vA9G6UTu2eGMNLklH5DF2QdibSf/guYjff054LzrlgJTafXxJA5cBNJbV7ptLuf
         T5nLy/qj2n5ng9Sc4SvCH+udOUJ8xLN711ZtRnP+MmMthOB5lFi6JzOoKpMCABOTbf8s
         ioKw==
X-Forwarded-Encrypted: i=1; AJvYcCWWPtUAmolWDonBbD8G5bUvRCeFE+K/XzDpbq4GmgpV80yLdFIKZxRv1ypGs1a3hYqC16ebznHuYHOUJDhxBf3f@lists.infradead.org
X-Gm-Message-State: AOJu0YymvT6elA0drk8o8oQeLCoUBp4vqSLUpYph63BA8yfhks4aOpA2
	erufM/FVnen9SFC1jAy/zzx59Gh7+kzGt+brrdMxHmM3C6hpSYuwWXdIq0aQ7GM=
X-Gm-Gg: ASbGncuq0L3ZEUpdGRfmP4wIwfpYj5SWh2unB79Fov1ahqL7NbTDD8SELH3j/AIE43f
	pvyZ0eILuJrLmDbg9nzp6lHIp0gdfOMY3XqO4aGCcAFgLOLTsptgnUr1hbDCbnUrXpcNYDEUqXM
	/ED1FD65xZ95M3ym+T2DxeQz0F5SYNbotKx7vjOEjBUiRm1f2wvgu6BTHkf75jYMS9PsFdbYD/E
	Qj3GGRFuv7WJu0ELnSfOeQi3QVTb7KJbS86rHU5GtoK/XJsYtMmDVYYl5VQlafQDu0nNEJsSoYe
	tZFxSA==
X-Google-Smtp-Source: AGHT+IHpHJsHb9mpdlPf1WMyDHeUmOQ71xKKXnSQB+gdiLoxCAO6i7uhLAJzOXuDIN6Nxvn4zgv7zA==
X-Received: by 2002:a17:90b:53c8:b0:2ee:c2df:5d30 with SMTP id 98e67ed59e1d1-2f452eb11e2mr54849162a91.26.1736135398510;
        Sun, 05 Jan 2025 19:49:58 -0800 (PST)
Received: from [10.84.148.23] ([203.208.167.150])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f447799048sm32821110a91.10.2025.01.05.19.49.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Jan 2025 19:49:58 -0800 (PST)
Message-ID: <de8756aa-dbf7-4f6f-91f0-934270397192@bytedance.com>
Date: Mon, 6 Jan 2025 11:49:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 10/15] riscv: pgtable: move pagetable_dtor() to
 __tlb_remove_table()
Content-Language: en-US
To: Kevin Brodsky <kevin.brodsky@arm.com>, peterz@infradead.org,
 akpm@linux-foundation.org
Cc: agordeev@linux.ibm.com, palmer@dabbelt.com, tglx@linutronix.de,
 david@redhat.com, jannh@google.com, hughd@google.com, yuzhao@google.com,
 willy@infradead.org, muchun.song@linux.dev, vbabka@kernel.org,
 lorenzo.stoakes@oracle.com, rientjes@google.com, vishal.moola@gmail.com,
 arnd@arndb.de, will@kernel.org, aneesh.kumar@kernel.org, npiggin@gmail.com,
 dave.hansen@linux.intel.com, rppt@kernel.org, ryan.roberts@arm.com,
 linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-kernel@vger.kernel.org, x86@kernel.org, linux-arch@vger.kernel.org,
 linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
 loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org,
 linux-sh@vger.kernel.org, linux-um@lists.infradead.org
References: <cover.1735549103.git.zhengqi.arch@bytedance.com>
 <0e8f0b3835c15e99145e0006ac1020ae45a2b166.1735549103.git.zhengqi.arch@bytedance.com>
 <1b09335c-f0b6-4ccb-9800-5fb22f7e8083@arm.com>
 <ebce5e05-5e46-4c6e-94a0-bcf3655a862b@bytedance.com>
 <7e2c26c8-f5df-4833-a93f-3409b00b58fd@arm.com>
 <e9fe97d4-99d5-443e-b722-43903655a76e@bytedance.com>
 <31e1a033-00a7-4953-81e7-0caedd0227a9@bytedance.com>
 <d9a14211-4bbd-4fb6-ba87-a555a40bb67a@arm.com>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <d9a14211-4bbd-4fb6-ba87-a555a40bb67a@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250105_195004_560529_E2545E92 
X-CRM114-Status: GOOD (  30.09  )
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

Hi Kevin,

On 2025/1/3 21:27, Kevin Brodsky wrote:
> On 03/01/2025 10:35, Qi Zheng wrote:
>> On 2025/1/3 17:13, Qi Zheng wrote:
>>> On 2025/1/3 16:02, Kevin Brodsky wrote:
>>>> On 03/01/2025 04:48, Qi Zheng wrote:
>>>>> [...]
>>>>>
>>>>> In __tlb_batch_free_encoded_pages(), we can indeed detect PageTable()
>>>>> and call pagetable_dtor() to dtor the page table pages.
>>>>> But __tlb_batch_free_encoded_pages() is also used to free normal pages
>>>>> (not page table pages), so I don't want to add overhead there.
>>>>
>>>> Interesting, can a tlb batch refer to pages than are not PTPs then?
>>>
>>> Yes, you can see the caller of __tlb_remove_folio_pages() or
>>> tlb_remove_page_size().
> 
> I had a brief look but clearly not a good enough one! I hadn't realised
> that "table" in tlb_remove_table() means PTP, while "page" in
> tlb_remove_page() can mean any page, and it's making more sense now.
> 
> [...]
> 
>>>
>>> For arm, the call to pagetable_dtor() is indeed missed in the
>>> non-MMU_GATHER_RCU_TABLE_FREE case. This needs to be fixed. But we
>>> can't fix this by adding pagetable_dtor() to tlb_remove_table(),
>>> because some architectures call tlb_remove_table() but don't support
>>> page table statistics, like sparc.
> 
> When I investigated this for my own series, I found that the only case
> where ctor/dtor are not called for page-sized page tables is 32-bit
> sparc (see table at the end of [1]). However only 64-bit sparc makes use
> of tlb_remove_table() (at PTE level, where ctor/dtor are already called).

Thanks for providing this information.

> 
> So really calling pagetable_dtor() from tlb_remove_table() in the
> non-MMU_GATHER_TABLE_FREE case seems to be the obvious thing to do.

Right. Currently, only powerpc, sparc and x86 will directly call
tlb_remove_table(), and all of them are in the MMU_GATHER_TABLE_FREE
case. Therefore, I think the modification you mentioned below is
feasible.

In summary, currently only arm calls tlb_remove_table() in the
non-MMU_GATHER_RCU_TABLE_FREE case. So I think we can add this fix
directly to patch #8. If I haven't missed anything, I'll send an
updated patch #8.

> 
> Once this is done, we should be able to replace all those confusing
> calls to tlb_remove_page() on PTPs with tlb_remove_table() and remove
> the explicit call to pagetable_dtor(). AIUI this is essentially what
> Peter suggested on v3 [2].

Since this patch series is mainly for bug fix, I think that these things
can be done in separate patch series later.

> 
> [1]
> https://lore.kernel.org/linux-mm/20241219164425.2277022-1-kevin.brodsky@arm.com/
> [2]
> https://lore.kernel.org/linux-mm/20250103111457.GC22934@noisy.programming.kicks-ass.net/
> 
> [...]
> 
>> Or can we just not let tlb_remove_table() fall back to
>> tlb_remove_page()? Like the following:
>>
>> diff --git a/include/asm-generic/tlb.h b/include/asm-generic/tlb.h
>> index a59205863f431..354ffaa4bd120 100644
>> --- a/include/asm-generic/tlb.h
>> +++ b/include/asm-generic/tlb.h
>> @@ -195,8 +195,6 @@
>>    *  various ptep_get_and_clear() functions.
>>    */
>>
>> -#ifdef CONFIG_MMU_GATHER_TABLE_FREE
>> -
>>   struct mmu_table_batch {
>>   #ifdef CONFIG_MMU_GATHER_RCU_TABLE_FREE
>>          struct rcu_head         rcu;
>> @@ -219,16 +217,6 @@ static inline void __tlb_remove_table(void *table)
>>
>>   extern void tlb_remove_table(struct mmu_gather *tlb, void *table);
>>
>> -#else /* !CONFIG_MMU_GATHER_HAVE_TABLE_FREE */
>> -
>> -/*
>> - * Without MMU_GATHER_TABLE_FREE the architecture is assumed to have
>> page based
>> - * page directories and we can use the normal page batching to free
>> them.
>> - */
>> -#define tlb_remove_table(tlb, page) tlb_remove_page((tlb), (page))
> 
> We still need a different implementation of tlb_remove_table() in this
> case. We could define it inline here:
> 
> static inline void tlb_remove_table(struct mmu_gather *tlb, void *table)
> {
>      struct page *page = table;
> 
>      pagetable_dtor(page_ptdesc(page));
>      tlb_remove_page(page);
> }

Right. As I said above, will add this to the updated patch #8.

Thanks!

> 
> - Kevin

