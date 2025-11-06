Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 348B3CCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 11:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v34V6UOuAW4algEbYefyR7s7Tf+M59sk/X8aCBcGIPc=; b=YWhnOrSrpUolzYKKyG/5Q9T7Lp
	PU6am0HwSdDq+geTPCUM7oyCyG85iZnoQKYdXviETqQqUdCdwoz71Zn9e6X/WvZpEnOaBKBXUy7oB
	vrv1c1vzLsRwrnCsKWr4b60kA0bDau+LKF3DvsHQ5sWeAetRrkSlT4tXeH5dTUigIko2/4k0VvkwW
	ibsTsLEOtv1Rpw8J1fXu/vKtZ6xAkyF/dYK02gaBJuQNcM8vXRiogg//DzY7gL+MDXcwqRmojO69y
	TrJL0ITq9dZ5bQmI8sR1YtyOzyYgbmfauPZd+MnpwIR/ufXc3u+nAbFmlYURlLDyT9jJS78oKo+cW
	2GY/pphg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGy9k-0000000FOLh-1Ji9;
	Thu, 06 Nov 2025 11:27:56 +0000
Received: from mail-lf1-x144.google.com ([2a00:1450:4864:20::144])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGy9h-0000000FOKy-2zux
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 11:27:55 +0000
Received: by mail-lf1-x144.google.com with SMTP id 2adb3069b0e04-59390875930so1258185e87.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Nov 2025 03:27:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762428471; x=1763033271; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v34V6UOuAW4algEbYefyR7s7Tf+M59sk/X8aCBcGIPc=;
        b=cNEUCGzTIy/6+/cnfCSQqO1ocXsyJHNdVJYLlT7Jk/qmA62ENOautdlp1OT1Ioav0d
         MifEfWTaHzmhrE77tbuy72qZ8MrHbXVB+f/73/le2BKT4Tg3LtUZ4usYcKShOZik49Oi
         MmOHsJrC0vUmoBBpqcz6oRYWNyT9/Mtg7gRiK+T6ICekuF/u1J6+CbWLGTJEc9kLF69x
         reHzPWAWXCRKKt11d9yQMuavrgRZNeHl+a6E3UtS0sE2iVZh/tQysnafV8/y0s62ZwrJ
         LH5K8KreRRtnAscclv7d0vE/nnx4xHM1Ae9MRbTw4QKOKV1TKkiwKUNOrqm73a4mnLO8
         Cqqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762428471; x=1763033271;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v34V6UOuAW4algEbYefyR7s7Tf+M59sk/X8aCBcGIPc=;
        b=O0geafDLpEOpt7mV/vA5vlzRMkDGX0H1REAPRtt/ZfsfWOwfbJtxoP68oMB0JO6Q0K
         wRlf+w2dYbj93s4BH+Ywf7B5VQ1annxnRW3B5nVewpzNE/Hh4j4IEais8Vw3qUIdOpZn
         +GjdMMxs3BjnT3oAIw5kaxd6syTtKrMNTF781kDBdbLEZw57PJlRiHjeV5i7GIHaAvWA
         Q3j7dbm56to2GCxq+2i14ZSxA552+zqYzgw+BPppJnt2ID88aaLThe0sY+R6bq2PRK41
         JyiJ1/OViKhRSLQo3pGH1fIzOO62bLQyD4L5locXCoZqPHE47UTJFFF/dwDmNjDYcgya
         IGNQ==
X-Forwarded-Encrypted: i=1; AJvYcCUI4zTEBTojvfID3MacRTDQAfkE4zCPrcb13p2hSBYAMTlhGH6hzkE3eOcFTzBYgorAEIUVSrZ8APUyAbGKynKt@lists.infradead.org
X-Gm-Message-State: AOJu0YxIE+LTTyLD447Fr8LsWxtHjggXX82s7cGfaXmctl3oVM2xXHTB
	EE9DNm2/5G6PmhWpfnCuhid63uiA4LBf7O+FwI7fLGyXGg1T6SQWex+BYUfrqhtt
X-Gm-Gg: ASbGncuRZKl72RUZ4xcoiBpCE2+rWOwxr2qxNKg4PZBbK44Uob1ApBvUqCBgUksGx/P
	PqSYavg+I6xEywBGu612a8DZ7ozhK0CMRXTxiZFih0ddRoeyzVB/GFCJknGJqAUdZdfY/B46f3I
	JlbO43oEE2uQbcjJ8Pu5uS64Go2j7eiQbARH/bM2+kTEXTUrR02NlxPD+OIXigWENgdaF0n+dJ9
	f7zCiML/znbGJRb89cCIWf4NrubmFPg/PcN/UzZFIqJja6Y5dgsKFBtkZuPzQhjXRkfLnFFYu8m
	o4iB84NHP4d4WLOL1K8QlvngChKwIgV3PxLxQpkuiOr1ZEeYURVUGyFJEOCrUGnF2YemD9We55Z
	dt8Zk3QBXjIiWb0cmNSXpgYFATILHmagJFaKTuS2R5k1l8TOHejLhKK/IkCiwGdKxAo59Yudmt5
	UN7a3WmWpE11F+16LQPNoeTnNQLd4Dj93y5eU0ex26xbpcbqokUixHTDAzPYNKW0bzAyWXNUz8q
	ca7tuPyBXMThcIAK0yp19XncRL498w=
X-Google-Smtp-Source: AGHT+IGIIzFUbwr8Yw2DpY4lrZQbFJ3COc7ijCkphFraNz8s3Ec0LQ/U2ePs+7AxsxoZH31PQrgUNQ==
X-Received: by 2002:a05:600c:46ce:b0:477:1af2:f40a with SMTP id 5b1f17b1804b1-4775cdc9053mr58862025e9.17.1762422432751;
        Thu, 06 Nov 2025 01:47:12 -0800 (PST)
Received: from ?IPV6:2003:d8:2f30:b00:cea9:dee:d607:41d? (p200300d82f300b00cea90deed607041d.dip0.t-ipconnect.de. [2003:d8:2f30:b00:cea9:dee:d607:41d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4775ce32653sm97818805e9.13.2025.11.06.01.47.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Nov 2025 01:47:12 -0800 (PST)
Message-ID: <2b9fa85b-54ff-415c-9163-461e28b6d660@gmail.com>
Date: Thu, 6 Nov 2025 10:47:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -v4 2/2] arm64, tlbflush: don't TLBI broadcast if page
 reused in write fault
To: Huang Ying <ying.huang@linux.alibaba.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Ryan Roberts <ryan.roberts@arm.com>, Barry Song <baohua@kernel.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Zi Yan <ziy@nvidia.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Yang Shi <yang@os.amperecomputing.com>,
 "Christoph Lameter (Ampere)" <cl@gentwo.org>, Dev Jain <dev.jain@arm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Kefeng Wang <wangkefeng.wang@huawei.com>,
 Kevin Brodsky <kevin.brodsky@arm.com>,
 Yin Fengwei <fengwei_yin@linux.alibaba.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org
References: <20251104095516.7912-1-ying.huang@linux.alibaba.com>
 <20251104095516.7912-3-ying.huang@linux.alibaba.com>
From: "David Hildenbrand (Red Hat)" <davidhildenbrandkernel@gmail.com>
Content-Language: en-US
In-Reply-To: <20251104095516.7912-3-ying.huang@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_032753_807907_701C019C 
X-CRM114-Status: GOOD (  27.63  )
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

On 04.11.25 10:55, Huang Ying wrote:
> A multi-thread customer workload with large memory footprint uses
> fork()/exec() to run some external programs every tens seconds.  When
> running the workload on an arm64 server machine, it's observed that
> quite some CPU cycles are spent in the TLB flushing functions.  While
> running the workload on the x86_64 server machine, it's not.  This
> causes the performance on arm64 to be much worse than that on x86_64.
> 
> During the workload running, after fork()/exec() write-protects all
> pages in the parent process, memory writing in the parent process
> will cause a write protection fault.  Then the page fault handler
> will make the PTE/PDE writable if the page can be reused, which is
> almost always true in the workload.  On arm64, to avoid the write
> protection fault on other CPUs, the page fault handler flushes the TLB
> globally with TLBI broadcast after changing the PTE/PDE.  However, this
> isn't always necessary.  Firstly, it's safe to leave some stale
> read-only TLB entries as long as they will be flushed finally.
> Secondly, it's quite possible that the original read-only PTE/PDEs
> aren't cached in remote TLB at all if the memory footprint is large.
> In fact, on x86_64, the page fault handler doesn't flush the remote
> TLB in this situation, which benefits the performance a lot.
> 
> To improve the performance on arm64, make the write protection fault
> handler flush the TLB locally instead of globally via TLBI broadcast
> after making the PTE/PDE writable.  If there are stale read-only TLB
> entries in the remote CPUs, the page fault handler on these CPUs will
> regard the page fault as spurious and flush the stale TLB entries.
> 
> To test the patchset, make the usemem.c from
> vm-scalability (https://git.kernel.org/pub/scm/linux/kernel/git/wfg/vm-scalability.git).
> support calling fork()/exec() periodically.  To mimic the behavior of
> the customer workload, run usemem with 4 threads, access 100GB memory,
> and call fork()/exec() every 40 seconds.  Test results show that with
> the patchset the score of usemem improves ~40.6%.  The cycles% of TLB
> flush functions reduces from ~50.5% to ~0.3% in perf profile.
> 

All makes sense to me.

Some smaller comments below.

[...]

> +
> +static inline void local_flush_tlb_page_nonotify(
> +	struct vm_area_struct *vma, unsigned long uaddr)

NIT: "struct vm_area_struct *vma" fits onto the previous line.

> +{
> +	__local_flush_tlb_page_nonotify_nosync(vma->vm_mm, uaddr);
> +	dsb(nsh);
> +}
> +
> +static inline void local_flush_tlb_page(struct vm_area_struct *vma,
> +					unsigned long uaddr)
> +{
> +	__local_flush_tlb_page_nonotify_nosync(vma->vm_mm, uaddr);
> +	mmu_notifier_arch_invalidate_secondary_tlbs(vma->vm_mm, uaddr & PAGE_MASK,
> +						(uaddr & PAGE_MASK) + PAGE_SIZE);
> +	dsb(nsh);
> +}
> +
>   static inline void __flush_tlb_page_nosync(struct mm_struct *mm,
>   					   unsigned long uaddr)
>   {
> @@ -472,6 +512,22 @@ static inline void __flush_tlb_range(struct vm_area_struct *vma,
>   	dsb(ish);
>   }
>   
> +static inline void local_flush_tlb_contpte(struct vm_area_struct *vma,
> +					   unsigned long addr)
> +{
> +	unsigned long asid;
> +
> +	addr = round_down(addr, CONT_PTE_SIZE);
> +
> +	dsb(nshst);
> +	asid = ASID(vma->vm_mm);
> +	__flush_tlb_range_op(vale1, addr, CONT_PTES, PAGE_SIZE, asid,
> +			     3, true, lpa2_is_enabled());
> +	mmu_notifier_arch_invalidate_secondary_tlbs(vma->vm_mm, addr,
> +						    addr + CONT_PTE_SIZE);
> +	dsb(nsh);
> +}
> +
>   static inline void flush_tlb_range(struct vm_area_struct *vma,
>   				   unsigned long start, unsigned long end)
>   {
> diff --git a/arch/arm64/mm/contpte.c b/arch/arm64/mm/contpte.c
> index c0557945939c..589bcf878938 100644
> --- a/arch/arm64/mm/contpte.c
> +++ b/arch/arm64/mm/contpte.c
> @@ -622,8 +622,7 @@ int contpte_ptep_set_access_flags(struct vm_area_struct *vma,
>   			__ptep_set_access_flags(vma, addr, ptep, entry, 0);
>   
>   		if (dirty)
> -			__flush_tlb_range(vma, start_addr, addr,
> -							PAGE_SIZE, true, 3);
> +			local_flush_tlb_contpte(vma, start_addr);

In this case, we now flush a bigger range than we used to, no?

Probably I am missing something (should this change be explained in more 
detail in the cover letter), but I'm wondering why this contpte handling 
wasn't required before on this level.

>   	} else {
>   		__contpte_try_unfold(vma->vm_mm, addr, ptep, orig_pte);
>   		__ptep_set_access_flags(vma, addr, ptep, entry, dirty);
> diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
> index d816ff44faff..22f54f5afe3f 100644
> --- a/arch/arm64/mm/fault.c
> +++ b/arch/arm64/mm/fault.c
> @@ -235,7 +235,7 @@ int __ptep_set_access_flags(struct vm_area_struct *vma,
>   
>   	/* Invalidate a stale read-only entry */

I would expand this comment to also explain how remote TLBs are handled 
very briefly -> flush_tlb_fix_spurious_fault().

>   	if (dirty)
> -		flush_tlb_page(vma, address);
> +		local_flush_tlb_page(vma, address);
>   	return 1;
>   }
>   


