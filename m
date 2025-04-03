Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95262C3600C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 20:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iepe52Rf+3tYFzTMzqzuimF3WTgoE75H145Hmb0tl0Q=; b=rNUi4ivhEo8rv2au0G5CKHcmvH
	lj894R/wVrUACZCtZrps8i3GuOnTE4J88WXjL12kmAiaP+hsF2ckj2z2EC5knabhk/j1ja07VlPyO
	eB9QnBxwwd0GxLMd4SLJI+MgKbgzJKWJWppv0B3Pw6z/f8ArHIN4Ztv0k140+zoCGGkr18yTeyEjH
	nM5gjyPgWOu8ngW4p0aHXHpmX0kLDe6ekaQeJv+xb9MpRmAATE3RdX6XACGk0YbIZvbB2RIbBEJ8M
	Imr6OpjrlZNBmXs0am08obNzGDgsQ5f9O+CHDkBtDePgbVAnL+6BntWcJ4Vf/Tuf2hjghVbF1JR/G
	ahfJAvLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0RXV-0000000A2NU-0Xs7;
	Thu, 03 Apr 2025 20:51:53 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0RSd-0000000A1P4-0lrX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Apr 2025 20:46:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8DE18A446DC;
	Thu,  3 Apr 2025 20:41:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D979BC4CEE3;
	Thu,  3 Apr 2025 20:46:46 +0000 (UTC)
Date: Thu, 3 Apr 2025 21:46:44 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Will Deacon <will@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Christoph Hellwig <hch@infradead.org>,
	David Hildenbrand <david@redhat.com>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 06/11] arm64/mm: Hoist barriers out of
 set_ptes_anysz() loop
Message-ID: <Z-68yPBh1FbRvCoS@arm.com>
References: <20250304150444.3788920-1-ryan.roberts@arm.com>
 <20250304150444.3788920-7-ryan.roberts@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250304150444.3788920-7-ryan.roberts@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_134651_285362_C09734B5 
X-CRM114-Status: GOOD (  20.23  )
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

On Tue, Mar 04, 2025 at 03:04:36PM +0000, Ryan Roberts wrote:
> set_ptes_anysz() previously called __set_pte() for each PTE in the
> range, which would conditionally issue a DSB and ISB to make the new PTE
> value immediately visible to the table walker if the new PTE was valid
> and for kernel space.
> 
> We can do better than this; let's hoist those barriers out of the loop
> so that they are only issued once at the end of the loop. We then reduce
> the cost by the number of PTEs in the range.
> 
> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
> ---
>  arch/arm64/include/asm/pgtable.h | 16 +++++++++++-----
>  1 file changed, 11 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
> index e255a36380dc..1898c3069c43 100644
> --- a/arch/arm64/include/asm/pgtable.h
> +++ b/arch/arm64/include/asm/pgtable.h
> @@ -317,13 +317,11 @@ static inline void __set_pte_nosync(pte_t *ptep, pte_t pte)
>  	WRITE_ONCE(*ptep, pte);
>  }
>  
> -static inline void __set_pte(pte_t *ptep, pte_t pte)
> +static inline void __set_pte_complete(pte_t pte)
>  {
> -	__set_pte_nosync(ptep, pte);
> -
>  	/*
>  	 * Only if the new pte is valid and kernel, otherwise TLB maintenance
> -	 * or update_mmu_cache() have the necessary barriers.
> +	 * has the necessary barriers.

Thanks for removing the stale comment.

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

