Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 088E9CD4F52
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 12:33:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Iw0gbgIgSebXvUGfQhR263rUammleT3+dcI2MU+rKYM=; b=Lmey+z2ArmfuavZrtXeAtgaHhz
	MTIcQGSvr0jJm/EVaOhogJ7X2aYzNxE5nQ2nrgtcFKebvm26Wy0Uxhoc55JMdk3d6kGEO7zhyY1kA
	QONfGdcK59r3Ps3fRHs0GWWOi+RX9ngYbF+kzWEXRR+txibIY3QmW9bhRZSgU5MHeEnlsXQuZ0eVN
	nL4BK/6Xiu0ZKHdar1UugaOAzj8mtAPhVl3aBbrXUrT9oyz0Q9aQ3Yl+uH1IUVnEageXLNJxh6b3+
	pPaIhlAUT1a0Ze6w8dReSnWp64uVUjLYc/qnY/2Kwq4a/k3R2i0WQAJV2cA2PgmXB4vnu3cYlTQSm
	p8H8kx3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOxAG-0000000FeKV-065w;
	Mon, 18 May 2026 12:33:44 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOxAF-0000000FeJr-0kmf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 12:33:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7296360055;
	Mon, 18 May 2026 12:33:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 534A8C2BCB8;
	Mon, 18 May 2026 12:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779107622;
	bh=qIjsom9bZAoeQ2Rimjo1anVHtnBVcomhLRxGciBa02g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z8b61GTy309/yJnxtCMygQx8FAFBnbAxOTCJnUyDA8aXCcdyuzNpmHwTv07a3OI9+
	 6xuBseVGr5BvXOLWpporsekZHIMbfbyM8ZCGvi384cKn+p5YugQmz56hKj0ANeQ+dX
	 qpkIUHbT0p2dGN5X2hYXHK/wAmAobBwyVSeM5rXpjFmirmZhvcsxr+4twg6uLyvFYj
	 hLOqcTXtA9o07kpvFUr1ZAz8Yq4bugXRZ4XAAGm3KU1FtWOodpm42+X7xJfJet9042
	 ToizkHaqW/ossLM1jwrTaugoWzcN+vqKyH+j8mnUPVXuQTQvzZBahfm0D2L8RLP7J1
	 nr4YHHMSi7znA==
Date: Mon, 18 May 2026 13:33:36 +0100
From: Will Deacon <will@kernel.org>
To: Muchun Song <songmuchun@bytedance.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, linux-mm@kvack.org,
	akpm@linux-foundation.org, Muchun Song <muchun.song@linux.dev>,
	Ryan Roberts <ryan.roberts@arm.com>,
	David Hildenbrand <david@kernel.org>,
	Kevin Brodsky <kevin.brodsky@arm.com>, Dev Jain <dev.jain@arm.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Yang Shi <yang@os.amperecomputing.com>,
	Chaitanya S Prakash <chaitanyas.prakash@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/5] arm64/mm: drop vmemmap_pmd helpers and use
 generic code
Message-ID: <agsHINLR-D-tRiGd@willie-the-truck>
References: <20260404122105.3989557-1-songmuchun@bytedance.com>
 <20260404122105.3989557-3-songmuchun@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260404122105.3989557-3-songmuchun@bytedance.com>
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

On Sat, Apr 04, 2026 at 08:20:55PM +0800, Muchun Song wrote:
> The generic implementations now suffice; remove the arm64 copies.
> 
> Signed-off-by: Muchun Song <songmuchun@bytedance.com>
> ---
>  arch/arm64/mm/mmu.c | 14 --------------
>  1 file changed, 14 deletions(-)
> 
> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> index ec1c6971a561..b87053452641 100644
> --- a/arch/arm64/mm/mmu.c
> +++ b/arch/arm64/mm/mmu.c
> @@ -1745,20 +1745,6 @@ static void free_empty_tables(unsigned long addr, unsigned long end,
>  }
>  #endif
>  
> -void __meminit vmemmap_set_pmd(pmd_t *pmdp, void *p, int node,
> -			       unsigned long addr, unsigned long next)
> -{
> -	pmd_set_huge(pmdp, __pa(p), __pgprot(PROT_SECT_NORMAL));
> -}
> -
> -int __meminit vmemmap_check_pmd(pmd_t *pmdp, int node,
> -				unsigned long addr, unsigned long next)
> -{
> -	vmemmap_verify((pte_t *)pmdp, node, addr, next);
> -
> -	return pmd_sect(READ_ONCE(*pmdp));
> -}

I think this is fine:

Acked-by: Will Deacon <will@kernel.org>

but note that, since c25c4aa3f79a ("arm64: mm: Add PTE_DIRTY back to
PAGE_KERNEL* to fix kexec/hibernation"), I think that using PAGE_KERNEL
(like the generic code does in the first patch of this series) means
that this change isn't a no-op -- it means that the huge entries will
now be marked as dirty. That's possibly a bug fix (?)

Will

