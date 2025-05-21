Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C167C54E71
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 May 2025 14:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QHuoR3XP5lX/bIA++zJtABwVX85H/0XxuGqP4qcFsk8=; b=znB50DpmzTcyil69IYyJ1+3Mnu
	nkIfPqGhaF8rGJm8PUxowZM92QjGEAuBWRnx9W0zUvT0+Q06WvB5XejN48defajeNzRbWw9LSp797
	fpZ6Ocwfyb7K9RWIKE4QlkOl+cHyGOz/JmC9uj30t6JoHmbsFBrqd6V0w8cv5zZPsXCjDvJ+i+49s
	cG3Sv+M2fmYlIu4gjBZ3BrzXR2FTzyx+cP5a4fl3/pHo0/nbOV4K7fXG9lk0amo9yt9T/kPkEdoLL
	SEPx0cGB7DLZ5C8Tau32ApjX79U+UzPuaFF2Z0SJB1Y6KtxekXEjCLtINLWPyFHNo5zLdWXnAURfB
	LQy11hlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHkTx-0000000G7IG-22yI;
	Wed, 21 May 2025 14:31:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHkFu-0000000G5Gi-3YSR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 May 2025 14:17:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DBD9F1515;
	Wed, 21 May 2025 07:16:58 -0700 (PDT)
Received: from [10.57.94.227] (unknown [10.57.94.227])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0A7823F5A1;
	Wed, 21 May 2025 07:17:08 -0700 (PDT)
Message-ID: <4d4b7d91-8ed9-4fc2-9079-267ffcbebb12@arm.com>
Date: Wed, 21 May 2025 15:17:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] arm64: Add batched version of
 ptep_modify_prot_commit
Content-Language: en-GB
To: Dev Jain <dev.jain@arm.com>, akpm@linux-foundation.org
Cc: david@redhat.com, willy@infradead.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, catalin.marinas@arm.com, will@kernel.org,
 Liam.Howlett@oracle.com, lorenzo.stoakes@oracle.com, vbabka@suse.cz,
 jannh@google.com, anshuman.khandual@arm.com, peterx@redhat.com,
 joey.gouly@arm.com, ioworker0@gmail.com, baohua@kernel.org,
 kevin.brodsky@arm.com, quic_zhenhuah@quicinc.com,
 christophe.leroy@csgroup.eu, yangyicong@hisilicon.com,
 linux-arm-kernel@lists.infradead.org, hughd@google.com,
 yang@os.amperecomputing.com, ziy@nvidia.com
References: <20250519074824.42909-1-dev.jain@arm.com>
 <20250519074824.42909-6-dev.jain@arm.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20250519074824.42909-6-dev.jain@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_071714_922976_14B49627 
X-CRM114-Status: GOOD (  14.33  )
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

On 19/05/2025 08:48, Dev Jain wrote:
> Override the generic definition to simply use set_ptes() to map the new
> ptes into the pagetable.
> 
> Signed-off-by: Dev Jain <dev.jain@arm.com>

Let's squash this into the previous patch; it doesn't make sense for an arch to
implement one without the other. Otherwise, LGTM.

Thanks,
Ryan

> ---
>  arch/arm64/include/asm/pgtable.h | 5 +++++
>  arch/arm64/mm/mmu.c              | 9 ++++++++-
>  2 files changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
> index 8872ea5f0642..0b13ca38f80c 100644
> --- a/arch/arm64/include/asm/pgtable.h
> +++ b/arch/arm64/include/asm/pgtable.h
> @@ -1558,6 +1558,11 @@ extern pte_t modify_prot_start_ptes(struct vm_area_struct *vma,
>  				    unsigned long addr, pte_t *ptep,
>  				    unsigned int nr);
>  
> +#define modify_prot_commit_ptes modify_prot_commit_ptes
> +extern void modify_prot_commit_ptes(struct vm_area_struct *vma, unsigned long addr,
> +				    pte_t *ptep, pte_t old_pte, pte_t pte,
> +				    unsigned int nr);
> +
>  #ifdef CONFIG_ARM64_CONTPTE
>  
>  /*
> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> index fe60be8774f4..5f04bcdcd946 100644
> --- a/arch/arm64/mm/mmu.c
> +++ b/arch/arm64/mm/mmu.c
> @@ -1543,10 +1543,17 @@ pte_t ptep_modify_prot_start(struct vm_area_struct *vma, unsigned long addr, pte
>  	return modify_prot_start_ptes(vma, addr, ptep, 1);
>  }
>  
> +void modify_prot_commit_ptes(struct vm_area_struct *vma, unsigned long addr,
> +			     pte_t *ptep, pte_t old_pte, pte_t pte,
> +			     unsigned int nr)
> +{
> +	set_ptes(vma->vm_mm, addr, ptep, pte, nr);
> +}
> +
>  void ptep_modify_prot_commit(struct vm_area_struct *vma, unsigned long addr, pte_t *ptep,
>  			     pte_t old_pte, pte_t pte)
>  {
> -	set_pte_at(vma->vm_mm, addr, ptep, pte);
> +	modify_prot_commit_ptes(vma, addr, ptep, old_pte, pte, 1);
>  }
>  
>  /*


