Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A64EECA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 14:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1reho69nUF+kdSehk4siYojJssv+Dw0ygWX/hVVwBmc=; b=ymN+fZnecKu+eY29UenlUJZjcb
	DoYLk0Z0IIO7QdDCuqotFy4ZASUSS9/ZJ5C95CXPEPIpQDMCMzLaLrXZUf9FjkngoIzS2SihdKJeF
	mXy2miTRTPF3JBu1GrDEtvjrtS3XZ58Fe2VHpQlJ+NgHYrcQmhWjo3t36IGF1D8JZd1d2Q3vfD7+A
	rurUxr7Fzfib1mHCtrSibqIffnsHVcD38JglfeccIdvcwNI3jtkaUiou1HwVMPJJQpWAxCBWOqtPZ
	l6unm3m02Fi0HvbKd8GAnQghevEqJ+ghnXevlZi0ex49qXoUz7KlPL8EjEqyrWAAHwUs0iu+w/hq2
	qtk/ON5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBYiF-00000003m1f-08b1;
	Tue, 29 Sep 2026 14:21:43 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBYiE-00000003m1R-037L
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 14:21:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6F3844403F;
	Tue, 29 Sep 2026 14:21:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A3271F000FF;
	Tue, 29 Sep 2026 14:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790691701;
	bh=1reho69nUF+kdSehk4siYojJssv+Dw0ygWX/hVVwBmc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ik499Jek/zqilrnYYC+EvqJwQBrSy6MYHjOwwTEhZvk9cxhOU0fVBL1jzHil2Ctmk
	 ZXANQlTwLWcQH4Z7CBSf51lnzpoxWZkVRymSm3AR1zv6S4/kSruSIZ0aoJgnPd03Mg
	 /sJOzDQo0hjKnq0dLUaQCleH+y6GnvJBa3YDHfMXWVncN/3Q63uEaYc49tssjC9MV4
	 YrlGfnqNOQ1PA6Igd2zHZxrJ3MOr4XEbTsCqqlnRCK3S3rReRRbnsM78yR3gOeAiNk
	 zzFE8erNTYp4rT9ItW9xbeljW1+o9Q4cNoPSAweosy34U2S6OnBIn2I7Nbd/ZmO+rl
	 nKhYg9U4pW7Lg==
Date: Tue, 29 Sep 2026 15:21:33 +0100
From: Will Deacon <will@kernel.org>
To: Xueyuan Chen <xueyuan.chen21@gmail.com>
Cc: akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org,
	usama.arif@linux.dev, ziy@nvidia.com, baolin.wang@linux.alibaba.com,
	liam@infradead.org, nico.pache@linux.dev, ryan.roberts@arm.com,
	dev.jain@arm.com, baohua@kernel.org, lance.yang@linux.dev,
	kas@kernel.org, rppt@kernel.org, catalin.marinas@arm.com,
	mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org,
	tglx@kernel.org, mingo@redhat.com, bp@alien8.de,
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
	luto@kernel.org, peterz@infradead.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 2/3] arm64/mm: add set_direct_map_ro()
Message-ID: <arvJbQmr9GwToA8R@willie-the-truck>
References: <20260901151818.3191443-1-xueyuan.chen21@gmail.com>
 <20260901151818.3191443-3-xueyuan.chen21@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901151818.3191443-3-xueyuan.chen21@gmail.com>
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

On Tue, Sep 01, 2026 at 11:18:17PM +0800, Xueyuan Chen wrote:
> Implement set_direct_map_ro() for arm64 and flush the TLB internally.
> 
> Co-developed-by: Lance Yang <lance.yang@linux.dev>
> Signed-off-by: Lance Yang <lance.yang@linux.dev>
> Signed-off-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
> ---
>  arch/arm64/include/asm/set_memory.h |  2 ++
>  arch/arm64/mm/pageattr.c            | 12 ++++++++++++
>  2 files changed, 14 insertions(+)
> 
> diff --git a/arch/arm64/include/asm/set_memory.h b/arch/arm64/include/asm/set_memory.h
> index 0091ba12200e..1be86dc11543 100644
> --- a/arch/arm64/include/asm/set_memory.h
> +++ b/arch/arm64/include/asm/set_memory.h
> @@ -13,6 +13,8 @@ int set_memory_valid(unsigned long addr, int numpages, int enable);
>  
>  int set_direct_map_invalid_noflush(struct page *page, unsigned int numpages);
>  int set_direct_map_default_noflush(struct page *page, unsigned int numpages);
> +int set_direct_map_ro(struct page *page, unsigned int nr);
> +#define set_direct_map_ro set_direct_map_ro
>  bool kernel_page_present(struct page *page);
>  
>  int set_memory_encrypted(unsigned long addr, int numpages);
> diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
> index 132938b32eb1..0e95cd904ccb 100644
> --- a/arch/arm64/mm/pageattr.c
> +++ b/arch/arm64/mm/pageattr.c
> @@ -355,6 +355,18 @@ int realm_register_memory_enc_ops(void)
>  	return arm64_mem_crypt_ops_register(&realm_crypt_ops);
>  }
>  
> +int set_direct_map_ro(struct page *page, unsigned int nr)
> +{
> +	unsigned long addr = (unsigned long)page_address(page);
> +
> +	if (!can_set_direct_map())
> +		return 0;
> +
> +	return __change_memory_common(addr, PAGE_SIZE * nr,
> +				      __pgprot(PTE_RDONLY),
> +				      __pgprot(PTE_WRITE));
> +}

I haven't quite followed whether or not you intend to send a v8
making set_memory_ro() handle linear addresses, but fwiw the
implementation you have here at least looks correct to me, so:

Acked-by: Will Deacon <will@kernel.org>

Will

