Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49D59EC1459
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 14:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hbaDA7zodNsC03m2YRT/5186yF34iRBmBDfxrNm/kgc=; b=F3tjDQBD/q+zRQcE3SHnqI2O/r
	B6a4f4b8AcB2lAyLlRT8ZbpvWAmvSME8Ak+h0gvs8/m4mczTBxmMlUXIpow3NvhpuJwsZi5TjngiB
	n9kIdQ+IqRqvU1RZoz4eMNGYSIO40DU1oGUnsimTp3t+LRJUwuG498V3W0QtZrzthh7GxEfTwAe4l
	oAoNQwC1A25L/EHNVHoMy9FOrU3fU/IVyhckPoMp2OwLc9JBuyCWXvAHUiNncMRfdpZHApkAm3wfZ
	vyGUrtEFcBvl6OhCb+mdj3erqb+wWnHU3rNmaGxJZPBAyljnEEvMqDP3jqaYSx7sxWpx+cdwtbaIB
	Jsncz0Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxR1I-0000000FM59-1J6R;
	Tue, 03 Mar 2026 14:46:44 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxR1G-0000000FM51-0Alb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Mar 2026 14:46:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 26EAA60134;
	Tue,  3 Mar 2026 14:46:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EEDDC116C6;
	Tue,  3 Mar 2026 14:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772549200;
	bh=5N3GIFyMf7g9ROpn76FZcGfVAbZybQizP11Q7edG8BA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jYQdEcajuovMGbp7zLlWU24vyzuFu163Dk/b/w2hBQNzbwVl3CCH7IKa2n4FVpoUf
	 l8g8CVUh+73us28YeyLMKEXrQzNZXHiCN2rS0/sj6WXhsuzNbAbDJYK1LSI1z2ncCB
	 iGuWghWscUcydVVNGajp+0vaabtOSW3F3P213x4F+CUlm8Pg5EBsNafWOCb4FEcNWO
	 +OvnZUSRRBt745+4fpnZFLY7Ripo0TIjxujxJkO5pwwitT6JGocq+llQAgsJ+zqzFt
	 syN0yXKMSfj/ADx/HaRGAYgrZGiWTSQAK6I8HxUPUTQfK2QJtzxQ7pWo2r2XSxvc06
	 FZbKxVKaX+k+Q==
Date: Tue, 3 Mar 2026 14:46:34 +0000
From: Will Deacon <will@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Ankur Arora <ankur.a.arora@oracle.com>,
	David Hildenbrand <david@kernel.org>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	James Clark <james.clark2@arm.com>
Subject: Re: [PATCH] arm64: Implement clear_pages()
Message-ID: <aab0SvA0dU0R0pnl@willie-the-truck>
References: <20260303-aarch64-clear-pages-v1-1-ad0c3ee9a555@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260303-aarch64-clear-pages-v1-1-ad0c3ee9a555@kernel.org>
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

On Tue, Mar 03, 2026 at 11:06:13AM +0100, Linus Walleij wrote:
> A recent patch introduced clear_pages() and made it possible to
> provide assembly optimizations like for clear_page().
> 
> This augments the existing clear_page() optimization in arm64
> to accept any number of pages the following way:
> 
> - Make clear_page() a static inline special case of clear_pages()
> 
> - Implement clear_pages() as a static inline that just calculate
>   the number of total bytes in the page set and passes this number
>   to the assembly routine clear_pages_asm.
> 
> - The old clear_pages assembly is rewritten to clear_pages_asm
>   which will take a start address (at an even page) and a number
>   of bytes to clear from that address.
> 
> This is similar to the optimization provided for x86.
> 
> Performance improvements:
> 
> The baseline is the current v7.0-rc1 which calls the existing
> clear_page() assembly optimization in a loop, see <linux/mm.h>.
> Any improvements are about avoiding the outer loop, in most cases
> the clearing will be linear and the savings will be small and
> only noticeable on really big clearing operations.
> 
> We boot the kernel with cmdline like this:
> "default_hugepagesz=1G hugepagesz=1G hugepages=32" to make sure
> we have ample hugepages. This was then tested with the same
> cmdline as the original series:
> 
> perf bench mem mmap -p 1GB -f demand -s 32GB -l 5
> 
> The first run was discarded as the memory hierarchy is cold on
> the first run. Then I ran the above command 5 times and averaged
> the throughput, which sees a small but consistent improvement in
> the throughput:
> 
> On QEMU:
> 
> Before this patch:     After this patch:
> 2.38 GB/s              2.41 GB/s

I really don't think we should pay attention to performance under QEMU
as it doesn't necessarily have any correlation with real hardware.

> On hardware Radxa Orion O6 we see this on *some* cores and no
> change on others:
> 
> Before this patch:     After this patch:
> 43.3 GB/s              45.3 GB/s
> 
> There is a small but consistent improvement in throughput, as
> expected.
> 
> Tested-by: James Clark <james.clark2@arm.com>
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---
>  arch/arm64/include/asm/page.h                  | 13 ++++++++++++-
>  arch/arm64/kernel/image-vars.h                 |  2 +-
>  arch/arm64/kvm/hyp/nvhe/Makefile               |  2 +-
>  arch/arm64/lib/Makefile                        |  2 +-
>  arch/arm64/lib/{clear_page.S => clear_pages.S} | 18 +++++++++---------
>  5 files changed, 24 insertions(+), 13 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/page.h b/arch/arm64/include/asm/page.h
> index b39cc1127e1f..916a3e7c9a19 100644
> --- a/arch/arm64/include/asm/page.h
> +++ b/arch/arm64/include/asm/page.h
> @@ -20,7 +20,18 @@ struct page;
>  struct vm_area_struct;
>  
>  extern void copy_page(void *to, const void *from);
> -extern void clear_page(void *to);
> +extern void clear_pages_asm(void *addr, unsigned int nbytes);
> +
> +static inline void clear_pages(void *addr, unsigned int npages)
> +{
> +	clear_pages_asm(addr, npages * PAGE_SIZE);
> +}
> +#define clear_pages clear_pages

Hmm. From what I can tell, this just turns a branch in C code into a
branch in assembly, so it's hard to correlate that meaningfully with
the performance improvement you see.

If we have CPUs that are this sensitive to branches, perhaps we'd be
better off taking the opposite approach and moving more code into C
so that the compiler can optimise the control flow for us?

Will

