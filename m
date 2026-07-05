Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC777C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jul 2026 08:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:Message-Id:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=baTotMMHSOM5O4gBj8/uxAAtb6QXbZ9I7HQpeImF9RI=; b=LNLlTtpz4HWmJ+MajY2G0HqyOh
	WgERpHTBsyk4IusmkpfVfMMRMsR6LW/L3XqrUt0FBEH30qZrBfgfcycz9B7dq6TluCeWBr1Mm8mdj
	ycbMlRGZa2IRshtfaLXxCZZtiq/kWrM1uHwc9ptROWRBJpoBpx93crLt6pGBrH9pmzOny7djX23Co
	frFNK6QP8yjRj+2DowGd33t0PcqLhE/nGHxO3kvtJBJQNzTj7/lQM61jwrw3OQAe7w0i75YoSRCJr
	0lRbbsVuQrKHT4GwCRuWNRCa2yaBNTuauPx7LcTDH0Nd4havPices2ILMiLqzelTZWVtNo/txMN94
	JmD3FaLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgIII-000000098kd-0dmJ;
	Sun, 05 Jul 2026 08:33:42 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgIIG-000000098kJ-1N25
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Jul 2026 08:33:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A24F643A71;
	Sun,  5 Jul 2026 08:33:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 742221F000E9;
	Sun,  5 Jul 2026 08:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1783240418;
	bh=baTotMMHSOM5O4gBj8/uxAAtb6QXbZ9I7HQpeImF9RI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=eNPPFp5qbKoJvjUdtGg8w3IZMg0vNZv6+vkTJLLSWou52vAtg3PDH+YXoVUKkouG2
	 Tp5I1zPHI6skDu0RSAecz1Q5bIQEjW4D5u6sgFWBLlB3ZBkSkoh5xEUlGn3n1eSJGK
	 peEKGToSl+aX/tl3OJYA18f9PnOfG4kNUughduRc=
Date: Sun, 5 Jul 2026 01:33:37 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Dev Jain <dev.jain@arm.com>
Cc: muchun.song@linux.dev, osalvador@suse.de, ljs@kernel.org,
 david@kernel.org, liam@infradead.org, riel@surriel.com, vbabka@kernel.org,
 harry@kernel.org, jannh@google.com, lance.yang@linux.dev, kas@kernel.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, apopple@nvidia.com,
 rcampbell@nvidia.com, ziy@nvidia.com, matthew.brost@intel.com,
 joshua.hahnjy@gmail.com, rakie.kim@sk.com, byungchul@sk.com,
 gourry@gourry.net, ying.huang@linux.alibaba.com, ak@linux.intel.com,
 nao.horiguchi@gmail.com, mel@csn.ul.ie, j-nomura@ce.jp.nec.com,
 pfalcato@suse.de, tglx@kernel.org, dave.hansen@intel.com,
 jpoimboe@kernel.org, catalin.marinas@arm.com, will@kernel.org,
 linux-arm-kernel@lists.infradead.org, ryan.roberts@arm.com,
 anshuman.khandual@arm.com
Subject: Re: [PATCH v3 6/6] mm/mprotect: use huge_ptep_get() for hugetlb
Message-Id: <20260705013337.2bbc075b508b5db36b954051@linux-foundation.org>
In-Reply-To: <20260703114202.365553-7-dev.jain@arm.com>
References: <20260703114202.365553-1-dev.jain@arm.com>
	<20260703114202.365553-7-dev.jain@arm.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Fri,  3 Jul 2026 11:41:59 +0000 Dev Jain <dev.jain@arm.com> wrote:

> prot_none_hugetlb_entry() is the hugetlb callback for the early
> mprotect(PROT_NONE) PFN permission walk on x86.
> 
> The callback passes the decoded PFN to pfn_modify_allowed(). For a
> hugetlb callback, the pte pointer refers to a hugetlb entry. On
> architectures where hugetlb entries need huge_ptep_get(), reading that
> entry with ptep_get() can make the permission check use the wrong PFN.
> 
> Use huge_ptep_get() before decoding the hugetlb PFN.
> 
> Currently there is no path which can trigger a bug: huge_ptep_get() is a
> simple ptep_get() for x86, and the prot_none walk occurs only for x86.
> 
> So no need to backport - use the correct helper anyways.
> 
> ...
>
> --- a/mm/mprotect.c
> +++ b/mm/mprotect.c
> @@ -699,14 +699,20 @@ static int prot_none_pte_entry(pte_t *pte, unsigned long addr,
>  		0 : -EACCES;
>  }
>  
> +#ifdef CONFIG_HUGETLB_PAGE
>  static int prot_none_hugetlb_entry(pte_t *pte, unsigned long hmask,
>  				   unsigned long addr, unsigned long next,
>  				   struct mm_walk *walk)
>  {
> -	return pfn_modify_allowed(pte_pfn(ptep_get(pte)),
> -				  *(pgprot_t *)(walk->private)) ?
> -		0 : -EACCES;
> +	const pte_t entry = huge_ptep_get(walk->mm, addr, pte);
> +
> +	if (pfn_modify_allowed(pte_pfn(entry), *(pgprot_t *)(walk->private)))
> +		return 0;
> +	return -EACCESS;

"EACCES".

>  }
> +#else
> +#define prot_none_hugetlb_entry	NULL
> +#endif

Presumably your .config resulted in this change not being tested...

