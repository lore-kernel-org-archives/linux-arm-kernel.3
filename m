Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EE16E77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 10:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AZLWPPKublXNhPBg34EaNBNy6TKJ9wneFJV35MDnpZc=; b=a2VH+4LnhkgmL7ZNpry4Qh69tN
	ptyUrip4hq+x4UyuxFu4/6ErZgSDUq/LyvlYRLU+ohK9BUPZz4ya2+0HVKhfJsGGnd4LkUGxH+w75
	YauwVq5u2fpXQyN5ylzEZmdm7rgQBMSRArqpzqysoOOTs/n5swN77qBtmZb2dJnTCPQ39MWdZKKfi
	23O1aOkzvz4svJA+uJKxpyY8XOKeNx8vizEGVamLqEcQRIN5yThvzJI70AfwaMmcEUciD8qNIQwH5
	SFRA/WBYbPwNh/OQ3DmwG79pOyfSxXjqcbElNeGzJDIexN2giwLIxEPCcmbJ3b2fKrKwhqI2PldVR
	VZoIGl3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUknY-00000000wPr-1fdc;
	Mon, 06 Jan 2025 10:57:28 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUkmM-00000000w8u-3lsn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jan 2025 10:56:16 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-2ee8e8e29f6so16486079a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jan 2025 02:56:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1736160974; x=1736765774; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AZLWPPKublXNhPBg34EaNBNy6TKJ9wneFJV35MDnpZc=;
        b=fevafSpgI8/t6QGUMhu2BkIUaGH/NKaGQWh583WH2Ee4NgV7+Q2M/lkV+k9IcyRCgN
         +Xn7NQ7vox5P7hQBKdkIgwpO8iLuBIQvVgoUW8a/kSrO4eWWJW0bjWtSUj3Y33YLKtlK
         wzhKS55j+6A+sy6eJr5QzAbVoGbuL5Xw66kUu9UTsok7kJrk0q5WRgnZ4HHxDB+rUfvy
         yEj97p48CuCJRm9qIBlpqUS21qznxYFDHqOovcMHjnE32bQC6oLbnhCo8Ty4fz3hXSrd
         KnlQyaMIWrkstmPv5awugog2cLAII6e94R/7iCiFhjsJGWDo2sGIWFq4GthmVh86xmGn
         pkfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736160974; x=1736765774;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AZLWPPKublXNhPBg34EaNBNy6TKJ9wneFJV35MDnpZc=;
        b=QjEZFLAUjdGgGt71is4Tsqpk3tFqLV7nvxeGsb1ZjE5i3T1MbHOwRiupHD7An/7Omy
         5WS8qd/upEjBS07W7zInTpMeW2QpJx7kBfvERRlTuUKM9+nU0t3c3Zf8t6tW66l/XbPx
         h/KrtmTS9DRPqtNlBG2A3tUQb/nsbx0PexTY5aRwLJJnkicPuhXkj2+xZAzJnGGEE4Te
         4Ym0mMfzyhbFpOfhNAu/GY+mBOIXYxvFkBI+NRs1MB2NwbpdYsytvV1q/glsclVxA+BE
         5XKaj8KvhP5PXntHgS51cMxyKRXsmHBhcEhDqxh9jqDtoiCCACtJBp5P7l2d2WTEMHyG
         o7kA==
X-Forwarded-Encrypted: i=1; AJvYcCVNOEx0v+MjiOzkxGr9jEClDVPmLdVMypWeA83vUcfvb+FBubMITeuzQi07UjntjHM0y68MjqR+cECfgpXmSx9c@lists.infradead.org
X-Gm-Message-State: AOJu0YyZZ0yNjWb5vZmqGog99n488rtG8B8JLZZ4w3BFMu8xwSefOXzz
	JLUr0l5tQ7vwMf4mCYUXrOHHkZYkv6YoRg5xSX2fAogRSn5lOSgk2wB775wihVI=
X-Gm-Gg: ASbGncsNv0J5vD4W7nYJZElrZQZs5m9z/u1VDomOYdVpXHiG1/DlhH1SdPq9a5yb9J3
	kPSOGYppouz0YHZKS30Pj+9NkuThwI+GnTAhz2hbNg5LfWoIF4GxUTmrmqfSlDew1wJgfzJmHY6
	SgHGplkI0ef7kyQsdj+GNarwJjf/DTP0cgl0u9ATGOlmEz1gerc8VUOlnG5Tdo04cR8whSw/uEq
	wU/xntUgX0UqtKdz8gDoHEwFSMy+13hktCedXhC7Iee73Br5dzvPo+Scx5p6FQk5I/7NmQmNQ5m
	4S+6sA==
X-Google-Smtp-Source: AGHT+IHHEGVNBdeeeMKsfSrtRayn5rgDW+sVv93AHdkC2kua4+TBudPLJJX1AZ3o0AE+Wq0oFkgydg==
X-Received: by 2002:a17:90b:5347:b0:2ee:3fa7:ef4d with SMTP id 98e67ed59e1d1-2f452ec37bamr85837306a91.24.1736160973647;
        Mon, 06 Jan 2025 02:56:13 -0800 (PST)
Received: from [10.84.148.23] ([203.208.167.150])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc96ead1sm290125115ad.91.2025.01.06.02.56.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jan 2025 02:56:13 -0800 (PST)
Message-ID: <e1de887c-6193-48ee-a9b3-04c8a0cdda45@bytedance.com>
Date: Mon, 6 Jan 2025 18:55:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 07/15] mm: pgtable: introduce pagetable_dtor()
Content-Language: en-US
To: Alexander Gordeev <agordeev@linux.ibm.com>
Cc: peterz@infradead.org, kevin.brodsky@arm.com, palmer@dabbelt.com,
 tglx@linutronix.de, david@redhat.com, jannh@google.com, hughd@google.com,
 yuzhao@google.com, willy@infradead.org, muchun.song@linux.dev,
 vbabka@kernel.org, lorenzo.stoakes@oracle.com, akpm@linux-foundation.org,
 rientjes@google.com, vishal.moola@gmail.com, arnd@arndb.de, will@kernel.org,
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
 <8ada95453180c71b7fca92b9a9f11fa0f92d45a6.1735549103.git.zhengqi.arch@bytedance.com>
 <Z3uxwiEhYHDqdTh3@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <Z3uxwiEhYHDqdTh3@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_025614_954586_49805DE4 
X-CRM114-Status: GOOD (  16.56  )
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



On 2025/1/6 18:34, Alexander Gordeev wrote:
> On Mon, Dec 30, 2024 at 05:07:42PM +0800, Qi Zheng wrote:
>> The pagetable_p*_dtor() are exactly the same except for the handling of
>> ptlock. If we make ptlock_free() handle the case where ptdesc->ptl is
>> NULL and remove VM_BUG_ON_PAGE() from pmd_ptlock_free(), we can unify
>> pagetable_p*_dtor() into one function. Let's introduce pagetable_dtor()
>> to do this.
>>
>> Later, pagetable_dtor() will be moved to tlb_remove_ptdesc(), so that
>> ptlock and page table pages can be freed together (regardless of whether
>> RCU is used). This prevents the use-after-free problem where the ptlock
>> is freed immediately but the page table pages is freed later via RCU.
>>
>> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
>> Originally-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> ...
>> diff --git a/include/linux/mm.h b/include/linux/mm.h
>> index 5d82f42ddd5cc..cad11fa10c192 100644
>> --- a/include/linux/mm.h
>> +++ b/include/linux/mm.h
>> @@ -2992,6 +2992,15 @@ static inline bool ptlock_init(struct ptdesc *ptdesc) { return true; }
>>   static inline void ptlock_free(struct ptdesc *ptdesc) {}
>>   #endif /* defined(CONFIG_SPLIT_PTE_PTLOCKS) */
>>   
>> +static inline void pagetable_dtor(struct ptdesc *ptdesc)
>> +{
>> +	struct folio *folio = ptdesc_folio(ptdesc);
>> +
>> +	ptlock_free(ptdesc);
>> +	__folio_clear_pgtable(folio);
>> +	lruvec_stat_sub_folio(folio, NR_PAGETABLE);
>> +}
>> +
> 
> If I am not mistaken, it is just pagetable_pte_dtor() rename.
> What is the point in moving the code around?

No, this is to unify pagetable_p*_dtor() into pagetable_dtor(), so
that we can move pagetable_dtor() to __tlb_remove_table(), and then
ptlock and PTE page can be freed together through RCU, which is
also the main purpose of this patch series.

Thanks!

> 
>>   static inline bool pagetable_pte_ctor(struct ptdesc *ptdesc)
>>   {
>>   	struct folio *folio = ptdesc_folio(ptdesc);
>> @@ -3003,15 +3012,6 @@ static inline bool pagetable_pte_ctor(struct ptdesc *ptdesc)
>>   	return true;
>>   }
>>   
>> -static inline void pagetable_pte_dtor(struct ptdesc *ptdesc)
>> -{
>> -	struct folio *folio = ptdesc_folio(ptdesc);
>> -
>> -	ptlock_free(ptdesc);
>> -	__folio_clear_pgtable(folio);
>> -	lruvec_stat_sub_folio(folio, NR_PAGETABLE);
>> -}
>> -
>>   pte_t *___pte_offset_map(pmd_t *pmd, unsigned long addr, pmd_t *pmdvalp);
>>   static inline pte_t *__pte_offset_map(pmd_t *pmd, unsigned long addr,
>>   			pmd_t *pmdvalp)

