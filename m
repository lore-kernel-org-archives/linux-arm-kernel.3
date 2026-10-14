Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02B9CCC6B1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 08:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YZHQeVBPNU6rc5illaISM5DptVONwmd53i/boebMGqQ=; b=euoNnIY8wVnavAtb+IJVKdDDHK
	5eDCQ7dhzvxD5cEhFel9TLm9apA5cxZ2clYQCgJ3Do8vx/OXAK2cjv3903B9na+ZHTi3Sh/6DwVOX
	BbxyLmQvimgpHc1GQQ9JUQvsvtG9DTk0rPduoLh9KqnAt4l5mX4w+EeAZstPpg1N/DF6qyUlV2LFj
	HAtHUJUV/aPgFjGkHVJuMMlG5G0IYI4k3FAM5x4mT9Q9Yw/1/Lye8Nz7xuqdKgOptdSXxdpocC+Sm
	zlN6meMTPhf3yN9gKU6LLRokAlMUZPdpS8uxBOQ7yUOsw4rKLbDt0XuxUXoUlozs7rtJsyxoqKumI
	QuA/fngw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGu1u-0000000Eqk8-418v;
	Wed, 14 Oct 2026 08:08:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGu1s-0000000Eqja-1rQN
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 14 Oct 2026 08:08:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=YZHQeVBPNU6rc5illaISM5DptVONwmd53i/boebMGqQ=; b=FJBtaPICyJFpBqNWKDB8+V3vlJ
	JB9lOrVQSGedMKrd4Rht/u0xn507hISH5zynKOH2BtO4QHABR+OEeJGUZ7b6TEgCoZOsr1GZFp624
	9HkwFr+wehbCIvJ5uFkEeRLbWSxK16pxoF+SkLd//o7mkpIE7WpxUzkN3ZdRfMjNBoe4WtE4JCf+g
	25/Cu+S20CBhWdEpgwGQVp9Gw+tyo6yEzUBr+C38zOaKB0VkYlckllnYmYXK8suv4fOS/91i14DD4
	tNYuojijBOn8sMTd/IJsBa3zRpytRWM/R3/Fe9ztBJs2cihhB8KbaK6Bz8tym+QaafjXPpkuPhBF1
	0Wnr6t0Q==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xGu1p-0000000GU5o-1Tvh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 08:08:03 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 56E2F1576;
	Wed, 14 Oct 2026 01:07:55 -0700 (PDT)
Received: from [10.164.19.62] (unknown [10.164.19.62])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 28C6B3F7B4;
	Wed, 14 Oct 2026 01:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791965278; bh=MUie6VSnW5OquybNhX7YpynpIviFja/SPKRkeO/X0wM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=D36suGIDWLUtoLdWoMaoApXTyWb2dzsEOXw/86kfMa+KgI93jY3cyZhzJ4faej4Sh
	 JoeimUdc+OnzEu/p97k/KVlKyD++ribIOtPYH/XLmQ5DbwSBE4LVzCjncH4gY/3l/L
	 763i0DKSevsHZIg/cPifkmIZayELI65poLThF0W0=
Message-ID: <1a34d980-4520-464a-b8d9-7720136bdacf@arm.com>
Date: Wed, 14 Oct 2026 13:37:50 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 04/10] arm64/hugetlb: drop the init_mm special case in
 clear_flush()
To: Wen Jiang <jiangwenxiaomi@gmail.com>, akpm@linux-foundation.org,
 catalin.marinas@arm.com, linux-mm@kvack.org, urezki@gmail.com,
 will@kernel.org
Cc: Xueyuan.chen21@gmail.com, ajd@linux.ibm.com, anshuman.khandual@arm.com,
 baohua@kernel.org, chleroy@kernel.org, david@kernel.org,
 jiangwen6@xiaomi.com, leo.yan@arm.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, rppt@kernel.org,
 ryan.roberts@arm.com
References: <20261002090947.869220-1-jiangwen6@xiaomi.com>
 <20261002090947.869220-5-jiangwen6@xiaomi.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <20261002090947.869220-5-jiangwen6@xiaomi.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_090801_736351_7D5BB1A1 
X-CRM114-Status: GOOD (  14.52  )
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



On 02/10/26 2:39 pm, Wen Jiang wrote:
> clear_flush() calls flush_tlb_kernel_range() when mm is &init_mm. This
> was added by commit 06fc959fcff7 ("arm64/mm: Support huge pte-mapped
> pages in vmap") because vmap called set_huge_pte_at(&init_mm, ...).
> 
> Now that vmap uses pte_set_huge()/pte_clear_huge(), mm/vmalloc.c is no
> longer a caller of set_huge_pte_at() on arm64. The only remaining
> callers passing &init_mm are in arch/powerpc, which uses its own
> implementation. Remove the dead branch.
> 
> No functional change.
> 
> Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
> Reviewed-by: Barry Song <baohua@kernel.org>
> ---

Reviewed-by: Dev Jain <dev.jain@arm.com>


>  arch/arm64/mm/hugetlbpage.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/mm/hugetlbpage.c b/arch/arm64/mm/hugetlbpage.c
> index 8e799c1fe0aa6..ce247b06fe03d 100644
> --- a/arch/arm64/mm/hugetlbpage.c
> +++ b/arch/arm64/mm/hugetlbpage.c
> @@ -206,10 +206,7 @@ static void clear_flush(struct mm_struct *mm,
>  	for (i = 0; i < ncontig; i++, addr += pgsize, ptep++)
>  		__ptep_get_and_clear_anysz(mm, addr, ptep, pgsize);
>  
> -	if (mm == &init_mm)
> -		flush_tlb_kernel_range(saddr, addr);
> -	else
> -		__flush_hugetlb_tlb_range(&vma, saddr, addr, pgsize, TLBF_NOWALKCACHE);
> +	__flush_hugetlb_tlb_range(&vma, saddr, addr, pgsize, TLBF_NOWALKCACHE);
>  }
>  
>  void set_huge_pte_at(struct mm_struct *mm, unsigned long addr,


