Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5C78F557E6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 08:48:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9NOeHAESzNyoOLo2eS/PzuPuitQFv2Vq39LTbJUFR2o=; b=ZIN5ezpDXA5I89SYiKhvD0gk4o
	4EtEdXjOprq1HHfP6vkGUBzzRJKEaU5p7SLzcYs1eOLHMca0g+ZwfGn7HWcKRdFpGx4+n7N9D1DFM
	4abduAR8NmjpsMQPPL2WOlybWMivT1OLTEqqDtXTHBUw9MsleWayIwL+Y0fO942COgW9wtDsGKADR
	vQsLxGyUgC2hdqaRkQm3Ikbj9+B36/xD3+5W0Plu0TQQ1UY0cHz/ToEYSc5SYg7vAdMI/EaqR5gWn
	oa7lni7JzX52hi/GJj7icYc0fIpttZ9gROpL5obLE0sRMXUyARcNNvz5KEOlZt73bqtMxeTUgATmp
	+lMyInwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEkJG-00000006d4H-1NR3;
	Mon, 20 Apr 2026 08:48:50 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEkJE-00000006d3q-3lb6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Apr 2026 08:48:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E69F960055;
	Mon, 20 Apr 2026 08:48:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53FBCC19425;
	Mon, 20 Apr 2026 08:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776674927;
	bh=qLFgeQwJCkpSSOG98sxSdZSktT3hEJUY9FwxAEoEYcs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T9vRxeYxFL9cfHlFph+p4HZ7WoGh85kwA61pnA64hopb3JqkEUHIbig41QikVB0o8
	 prK8HkTDt/Ffs9L9+yWgpZ8m4vNtm2NtKgvqFrHGKZ0kSrCIaIWiX8XFRWTp4AuE0n
	 5rRHIYxhoMQxEg92Bznbq5kvvr9NtLFa1+jC88YbV/vcS5Nf256U/iPi/x0/kQMUif
	 dXVbGPzd1qJz/5dHW5nJNtqHKhuEzPHYOIDMMJ/zgr26bjAhEbAWxN1H9vUvNYGDeQ
	 R5c4ehGomLkv+Eu4Uh3VAGGXsphT6EG7QRTvQj3L+E424MFl6JzHADE8L5FH6Bs8l9
	 HaSyWBlFLIDsQ==
Date: Mon, 20 Apr 2026 09:48:35 +0100
From: Will Deacon <will@kernel.org>
To: Yin Tirui <yintirui@huawei.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org,
	linux-arm-kernel@lists.infradead.org, willy@infradead.org,
	david@kernel.org, catalin.marinas@arm.com, tglx@kernel.org,
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
	hpa@zytor.com, luto@kernel.org, peterz@infradead.org,
	akpm@linux-foundation.org, lorenzo.stoakes@oracle.com,
	ziy@nvidia.com, baolin.wang@linux.alibaba.com,
	Liam.Howlett@oracle.com, npache@redhat.com, ryan.roberts@arm.com,
	dev.jain@arm.com, baohua@kernel.org, lance.yang@linux.dev,
	vbabka@suse.cz, rppt@kernel.org, surenb@google.com, mhocko@suse.com,
	anshuman.khandual@arm.com, rmclure@linux.ibm.com,
	kevin.brodsky@arm.com, apopple@nvidia.com, ajd@linux.ibm.com,
	pasha.tatashin@soleen.com, bhe@redhat.com, thuth@redhat.com,
	coxu@redhat.com, dan.j.williams@intel.com, yu-cheng.yu@intel.com,
	yangyicong@hisilicon.com, baolu.lu@linux.intel.com, jgross@suse.com,
	conor.dooley@microchip.com, Jonathan.Cameron@huawei.com,
	riel@surriel.com, wangkefeng.wang@huawei.com, chenjun102@huawei.com
Subject: Re: [PATCH RFC v3 2/4] mm/pgtable: Make pfn_pte() filter out huge
 page attributes
Message-ID: <aeXoY7lrRJev0P83@willie-the-truck>
References: <20260228070906.1418911-1-yintirui@huawei.com>
 <20260228070906.1418911-3-yintirui@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260228070906.1418911-3-yintirui@huawei.com>
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

On Sat, Feb 28, 2026 at 03:09:04PM +0800, Yin Tirui wrote:
> A fundamental principle of page table type safety is that `pte_t` represents
> the lowest level page table entry and should never carry huge page attributes.
> 
> Currently, passing a pgprot with huge page bits (e.g., extracted via
> pmd_pgprot()) into pfn_pte() creates a malformed PTE that retains the huge
> attribute, leading to the necessity of the ugly `pte_clrhuge()` anti-pattern.
> 
> Enforce type safety by making `pfn_pte()` inherently filter out huge page
> attributes:
> - On x86: Strip the `_PAGE_PSE` bit.
> - On ARM64: Mask out the block descriptor bits in `PTE_TYPE_MASK` and
>   enforce the `PTE_TYPE_PAGE` format.
> - On RISC-V: No changes required, as RISC-V leaf PMDs and PTEs share the
>   exact same hardware format and do not use a distinct huge bit.
> 
> Signed-off-by: Yin Tirui <yintirui@huawei.com>
> ---
>  arch/arm64/include/asm/pgtable.h | 4 +++-
>  arch/x86/include/asm/pgtable.h   | 4 ++++
>  2 files changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
> index b3e58735c49b..f2a7a40106d2 100644
> --- a/arch/arm64/include/asm/pgtable.h
> +++ b/arch/arm64/include/asm/pgtable.h
> @@ -141,7 +141,9 @@ static inline pteval_t __phys_to_pte_val(phys_addr_t phys)
>  
>  #define pte_pfn(pte)		(__pte_to_phys(pte) >> PAGE_SHIFT)
>  #define pfn_pte(pfn,prot)	\
> -	__pte(__phys_to_pte_val((phys_addr_t)(pfn) << PAGE_SHIFT) | pgprot_val(prot))
> +	__pte(__phys_to_pte_val((phys_addr_t)(pfn) << PAGE_SHIFT) | \
> +		((pgprot_val(prot) & ~(PTE_TYPE_MASK & ~PTE_VALID)) | \
> +		(PTE_TYPE_PAGE & ~PTE_VALID)))

Why are you touching arch/arm64? We don't implement pte_clrhuge() afaict.
What does this actually fix?

Will

