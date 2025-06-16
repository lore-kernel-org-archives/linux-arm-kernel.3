Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D59D6C7115A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 17:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MblsDYTOzgLu/9U4Wm0K3LDmwhpLBb+6dKjuJ+bGvVw=; b=ei1WY1hBh9mHWQyMfEZvQq+VM6
	6Gc0SkRRw3EVxJE2e7Aoykv6JP/TGgEVpzYfCF5IEfJ8FutyXwd8coclppmVbJOXBC9MY4BxfKwPZ
	emjW3y1tMMYFeVWacIGuW0NLT5tmvm/w2rdV5lt1r9UEiWWQ15N923M7L2D4r37B3+2ba2kaNcW6V
	+LqlJ6iGUQKhanNHUoPaEaUzrMLgeSGDvs4n2xqY8x2J9kNpgwLwCGPwrcgVZ66rVwj0ZijH2oxEk
	RJPb6ARzwBa3T3uAgzwDPhFkRb7NTamzJSgBQDvrAF4Lm1N3f5tn6Z19FIjwsVMK9280AfIsSNPPq
	Bx41vzSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRDLr-000000055cz-0Uyf;
	Mon, 16 Jun 2025 17:10:31 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRBJs-00000004mZS-3kiu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 15:00:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750086019;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=MblsDYTOzgLu/9U4Wm0K3LDmwhpLBb+6dKjuJ+bGvVw=;
	b=AHV/QzeuypfV1CjDY0Fa1NsHd1ocjDf6XoI6A+SmTX8A0GnRdD0GYQBsO48U9bYhXDtfbK
	hisjyu0IPGH1ckmdS2ZT3tzSkZXPoaaMBJE3VXOeDCZZbxVVvNTM/yQAbRPZO6VDv3KCHC
	2+6NA6FcPDthPKsAcaEK+EF2MH6zIPs=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-517-OOprgzHjP9aYOw3-Rm0eDw-1; Mon, 16 Jun 2025 11:00:18 -0400
X-MC-Unique: OOprgzHjP9aYOw3-Rm0eDw-1
X-Mimecast-MFC-AGG-ID: OOprgzHjP9aYOw3-Rm0eDw_1750086017
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43eea5a5d80so27569565e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Jun 2025 08:00:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750086017; x=1750690817;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=MblsDYTOzgLu/9U4Wm0K3LDmwhpLBb+6dKjuJ+bGvVw=;
        b=IpbQ2PdRZKisVUxWnfaLHjA8EAeUpcyM3zto5b+GktgOjcG6+REf3D2/GfvbJe2Z+z
         qaRHOM+Kdh3V/+D/3AN8mMy4opgEYD/PyTqQtAdZmb4aXWDP8vyl66btA2TYo12X4aIc
         fjOR7NiTPrT9U2t4PGuwivZaSmcPpePAEssfqvw/a02Rx34xA4oDBSzWM4PZQ5strlDW
         J9xduyO0oaDsHLMGrNF+wJwpTo9fdciAPGv1VxWDKHT518oqgEv/MWTHWE7aJgMpSROl
         0MgPz3c4XxwfT4ztRmNU2bblstEvDlBJSMkLdxviY112bjXFq6/74s6lgrRyZ/u14e+y
         Od+w==
X-Forwarded-Encrypted: i=1; AJvYcCUGMGE7XojIxNF0YQPt9y+I0IudQIpt9egf3i71dsdVH6+Ga7m4GmXAznCXoXtDi31CTO+V1peJfYO9DJqPumV9@lists.infradead.org
X-Gm-Message-State: AOJu0YwVtysV7ihobpdrA/snnqrk3EFZlYQZQgNW4xIp7e4IB66v5d9M
	0SOcJd7VSX2JeIkI5LLswSitpWkhtOL0SId4S93w7SSvcQJke+sDqEFAk7sahB7xXa2vtO+dSIS
	aKCIsQtFsmJTUuFIwqoazD/NJmtWL99bEcS5jJUsEcVQuDG5FDuHYFEwSFRL6GKDXmJbxvsCaVk
	Sr
X-Gm-Gg: ASbGncsI23vA0sHFwAS4cA3UWk8S52on52B9+qLy/xKAP4w3b6YFQ14FmirAuY5+ze7
	qsSPJlVrRu+2tqBdasRXCEeDOWlHttQj4a3cSxubhMk9oabmoNaD3YWtvFWwYZN0KrQ217N1xtO
	Wsx2/mE8Ps2OBgKVWpIQ3Z/1W24LUwORutgj3jdK79NwFYSnD66KXqNhQYZyCyUX4J44R+ch4bJ
	WL9vOLCXZoqvkqPNsxVdWgxE4a1t71aMG8QwlaHCIh9bMkz1GFZXEi2hFXGayiwKG+0QRwRc0iU
	YY73HnUdPVPmb1+/IlKIiEadDFbpVExscEnf2WXVA9yUPNyBabjDat/AaeCy1r3BX+vFSGwFfos
	46NNOYVBhkEWllz332ZHw6QiXRQkrQmBu1ZpigTZ256BpZOY=
X-Received: by 2002:a05:600c:4fc3:b0:453:9bf:6f79 with SMTP id 5b1f17b1804b1-4533caecdb4mr83888655e9.26.1750086016784;
        Mon, 16 Jun 2025 08:00:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEnFzhqwlFGMFEPfwXZcgSbuKx4tA+r2jOTPmCmb63LqsrLK2Arxoh+vvMh/1hpPH0j9GhIeQ==
X-Received: by 2002:a05:600c:4fc3:b0:453:9bf:6f79 with SMTP id 5b1f17b1804b1-4533caecdb4mr83888345e9.26.1750086016325;
        Mon, 16 Jun 2025 08:00:16 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f25:bd00:949:b5a9:e02a:f265? (p200300d82f25bd000949b5a9e02af265.dip0.t-ipconnect.de. [2003:d8:2f25:bd00:949:b5a9:e02a:f265])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e243e59sm145543385e9.19.2025.06.16.08.00.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jun 2025 08:00:15 -0700 (PDT)
Message-ID: <4a90e7b1-7592-4dea-9225-40c8e3b597d8@redhat.com>
Date: Mon, 16 Jun 2025 17:00:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm64: Enable vmalloc-huge with ptdump
To: Dev Jain <dev.jain@arm.com>, catalin.marinas@arm.com, will@kernel.org
Cc: anshuman.khandual@arm.com, quic_zhenhuah@quicinc.com,
 ryan.roberts@arm.com, kevin.brodsky@arm.com, yangyicong@hisilicon.com,
 joey.gouly@arm.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250616103310.17625-1-dev.jain@arm.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250616103310.17625-1-dev.jain@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: GQHcGYYeOhAi9gQ3dllsXwMyYR_8tj4WNQTnuX2jggw_1750086017
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_080021_015259_4DDCE3C8 
X-CRM114-Status: GOOD (  30.41  )
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

On 16.06.25 12:33, Dev Jain wrote:
> arm64 disables vmalloc-huge when kernel page table dumping is enabled,
> because an intermediate table may be removed, potentially causing the
> ptdump code to dereference an invalid address. We want to be able to
> analyze block vs page mappings for kernel mappings with ptdump, so to
> enable vmalloc-huge with ptdump, synchronize between page table removal in
> pmd_free_pte_page()/pud_free_pmd_page() and ptdump pagetable walking. We
> use mmap_read_lock and not write lock because we don't need to synchronize
> between two different vm_structs; two vmalloc objects running this same
> code path will point to different page tables, hence there is no race.
> 
> For pud_free_pmd_page(), we isolate the PMD table to avoid taking the lock
> 512 times again via pmd_free_pte_page().
> 
> We implement the locking mechanism using static keys, since the chance
> of a race is very small. Observe that the synchronization is needed
> to avoid the following race:
> 
> CPU1							CPU2
> 						take reference of PMD table
> pud_clear()
> pte_free_kernel()
> 						walk freed PMD table
> 
> and similar race between pmd_free_pte_page and ptdump_walk_pgd.
> 
> Therefore, there are two cases: if ptdump sees the cleared PUD, then
> we are safe. If not, then the patched-in read and write locks help us
> avoid the race.
> 
> To implement the mechanism, we need the static key access from mmu.c and
> ptdump.c. Note that in case !CONFIG_PTDUMP_DEBUGFS, ptdump.o won't be a
> target in the Makefile, therefore we cannot initialize the key there, as
> is being done, for example, in the static key implementation of
> hugetlb-vmemmap. Therefore, include asm/cpufeature.h, which includes
> the jump_label mechanism. Declare the key there and define the key to false
> in mmu.c.
> 
> No issues were observed with mm-selftests. No issues were observed while
> parallelly running test_vmalloc.sh and dumping the kernel pagetable through
> sysfs in a loop.
> 
> v2->v3:
>   - Use static key mechanism
> 
> v1->v2:
>   - Take lock only when CONFIG_PTDUMP_DEBUGFS is on
>   - In case of pud_free_pmd_page(), isolate the PMD table to avoid taking
>     the lock 512 times again via pmd_free_pte_page()
> 
> Signed-off-by: Dev Jain <dev.jain@arm.com>
> ---
>   arch/arm64/include/asm/cpufeature.h |  1 +
>   arch/arm64/mm/mmu.c                 | 51 ++++++++++++++++++++++++++---
>   arch/arm64/mm/ptdump.c              |  5 +++
>   3 files changed, 53 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/cpufeature.h b/arch/arm64/include/asm/cpufeature.h
> index c4326f1cb917..3e386563b587 100644
> --- a/arch/arm64/include/asm/cpufeature.h
> +++ b/arch/arm64/include/asm/cpufeature.h
> @@ -26,6 +26,7 @@
>   #include <linux/kernel.h>
>   #include <linux/cpumask.h>
>   
> +DECLARE_STATIC_KEY_FALSE(ptdump_lock_key);
>   /*
>    * CPU feature register tracking
>    *
> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> index 8fcf59ba39db..e242ba428820 100644
> --- a/arch/arm64/mm/mmu.c
> +++ b/arch/arm64/mm/mmu.c
> @@ -41,11 +41,14 @@
>   #include <asm/tlbflush.h>
>   #include <asm/pgalloc.h>
>   #include <asm/kfence.h>
> +#include <asm/cpufeature.h>
>   
>   #define NO_BLOCK_MAPPINGS	BIT(0)
>   #define NO_CONT_MAPPINGS	BIT(1)
>   #define NO_EXEC_MAPPINGS	BIT(2)	/* assumes FEAT_HPDS is not used */
>   
> +DEFINE_STATIC_KEY_FALSE(ptdump_lock_key);
> +
>   enum pgtable_type {
>   	TABLE_PTE,
>   	TABLE_PMD,
> @@ -1267,8 +1270,9 @@ int pmd_clear_huge(pmd_t *pmdp)
>   	return 1;
>   }
>   
> -int pmd_free_pte_page(pmd_t *pmdp, unsigned long addr)
> +static int __pmd_free_pte_page(pmd_t *pmdp, unsigned long addr, bool lock)
>   {
> +	bool lock_taken = false;
>   	pte_t *table;
>   	pmd_t pmd;
>   
> @@ -1279,15 +1283,29 @@ int pmd_free_pte_page(pmd_t *pmdp, unsigned long addr)
>   		return 1;
>   	}
>   
> +	/* See comment in pud_free_pmd_page for static key logic */
>   	table = pte_offset_kernel(pmdp, addr);
>   	pmd_clear(pmdp);
>   	__flush_tlb_kernel_pgtable(addr);
> +	if (static_branch_unlikely(&ptdump_lock_key) && lock) {
> +		mmap_read_lock(&init_mm);
> +		lock_taken = true;
> +	}
> +	if (unlikely(lock_taken))
> +		mmap_read_unlock(&init_mm);
> +

I'm missing something important: why not

if (static_branch_unlikely(&ptdump_lock_key) && lock) {
	mmap_read_lock(&init_mm);
	mmap_read_unlock(&init_mm);
}

-- 
Cheers,

David / dhildenb


