Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA212606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 10:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tRZFhfHW;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=H87Iowrz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=xVoPvZV32EnV3nhq+nvsH8tkgnbU6lXXBkfpvhV3RiQ=; b=tRZFhfHWGWSoWt707hbJo0pwFV
	3GxmsprFUMZtEli+X/39s9mn1D+412VSB2oO8m3Tk4t8YNldpQj0eRCwZdvSERhKRQRcKJAppTuSU
	VxJTfEx0WASLQwDMjbRkqemQOxDL+fgkYX93+8rmqtd3qRAahe8Rc5NnsCx5hpw/DmzO4D7DJw5Ls
	IXcwTKtUxKgb5pxUdYbbmG63WOFMxocVGC1oQg1nRTgD6UpcJtxVBFbZd2sfNaEJ2U9JU+AjQQ8Fc
	Qv8lMBx2j7PFhiMYoHEzL/Kyip7L7D4JsEEWeMipU4ZUShI9nMa+gRNs7AjjjtqnZMhPbq5l0IeR2
	Yafx1WYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKCMd-0000000G8oO-3Tur;
	Fri, 23 Oct 2026 10:19:07 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKCMb-0000000G8mV-0Dvr;
	Fri, 23 Oct 2026 10:19:06 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3502A1650;
	Fri, 23 Oct 2026 03:19:00 -0700 (PDT)
Received: from localhost (a085714.arm.com [10.164.19.28])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6AFBD3F7B4;
	Fri, 23 Oct 2026 03:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792750743; bh=cTejc6vMr58Bc8gk6KW2BncO0y2Cvz1clpAKwoF7/Ic=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H87IowrzP0rj9C3cOW7Vzu9QCUMfiSLZ0/G+PHAGddRwpJrTeToyiptqu8vx7+3pH
	 w8RG+x0XddtHFphc6crHsU1gk8O6PWmj3qeZaN0M0Ly+45BVp2wb77l+7WxSJLLoTm
	 DUEPs9U6xhyWQsEoNRpuxhalPnHIewHnLwfzo0Zw=
Date: Fri, 23 Oct 2026 15:48:59 +0530
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: Muchun Song <songmuchun@bytedance.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, Oscar Salvador <osalvador@suse.de>, 
	Dave Hansen <dave.hansen@intel.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Kevin Brodsky <kevin.brodsky@arm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Alistair Popple <apopple@nvidia.com>, linux-mm@kvack.org, 
	linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, Muchun Song <muchun.song@linux.dev>
Subject: Re: [PATCH v3 4/4] arm64/mm: fix destructor for unconstructed
 hotplug page tables
Message-ID: <4vrj226au2t5cyjsgqem7bami3tsgn57zcbw6cbedhkutknnh3@p4hngiltvm6j>
References: <20261023063428.3658761-1-songmuchun@bytedance.com>
 <20261023063428.3658761-5-songmuchun@bytedance.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261023063428.3658761-5-songmuchun@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_031905_174108_2C6E29D9 
X-CRM114-Status: GOOD (  19.41  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 23, 2026 at 02:34:28PM +0800, Muchun Song wrote:
> Commit c594b83457cc ("arm64: mm: call pagetable dtor when freeing
> hot-removed page tables") made free_hotplug_pgtable_page()
> unconditionally run the page-table destructor. This matches page tables
> allocated by the arm64 mapping code, which runs the corresponding
> constructors.
> 
> However, arm64 also uses the generic sparse-vmemmap population code.
> Runtime intermediate page tables allocated by that code do not run a
> page-table constructor. Freeing one during memory hot-remove therefore
> runs a destructor without a matching constructor and corrupts
> NR_PAGETABLE accounting.
> 
> Free intermediate page-table pages through pagetable_free(). It runs the
> destructor only for constructor-backed pages and then releases the page
> through the page-table freeing path.
> 
> Fixes: c594b83457cc ("arm64: mm: call pagetable dtor when freeing hot-removed page tables")
> Cc: stable@vger.kernel.org
> Assisted-by: LLM
> Signed-off-by: Muchun Song <songmuchun@bytedance.com>
> Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>
> Acked-by: David Hildenbrand (Arm) <david@kernel.org>

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>

> ---
> v3:
> - Collect Acked-by from David Hildenbrand
> - Collect Reviewed-by from Kevin Brodsky
> 
> v2:
> - Free intermediate tables through pagetable_free() (suggested by David
>   Hildenbrand)
> - Update the commit message for the page-table freeing path
> ---
>  arch/arm64/mm/mmu.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> index 79d90226fd5d..4dce8fa227c3 100644
> --- a/arch/arm64/mm/mmu.c
> +++ b/arch/arm64/mm/mmu.c
> @@ -1495,8 +1495,7 @@ static void free_hotplug_page_range(struct page *page, size_t size,
>  
>  static void free_hotplug_pgtable_page(struct page *page)
>  {
> -	pagetable_dtor(page_ptdesc(page));
> -	free_hotplug_page_range(page, PAGE_SIZE, NULL);
> +	pagetable_free(page_ptdesc(page));
>  }
>  
>  static bool pgtable_range_aligned(unsigned long start, unsigned long end,
> -- 
> 2.54.0
> 

