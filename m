Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BF79D2ECF7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 12:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7kioe172RUEI57MBDFhxuJ9tK9fy7IOriL8j2SKp2Qw=; b=t6en+rCbseINFkEr4IPpCKyzkk
	sbkspb8ehxZJOO21Y0KjYF5ykEPtd9aT3/oLNVXO6RL95x+MTbkmtqHPESv9ZqsRUbnJTmx7i4+pq
	8nCb7AKKZrrtA0toOFC1NRxKI0UlnqIWplhdBI+n3L4XzTVzPCgaOaMX2BP1jvByN8kdXxBQGhPFk
	r69Gcyk7NkFHPP9Up+EPVDYItg+edos2h3baTogHgWDGkn6NaSnNrS8yvB41ttxFBqc0j73+WtfyM
	I9xeOtOudujM8T8z4hkBsvqrIANN/ZRbEwUdYRLkfOsGp6cPpXCaDBl+atvy1aOro2AXn4OBmbra/
	XWp2wBnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viApi-00000003q0c-2c3q;
	Tue, 20 Jan 2026 12:27:42 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viApg-00000003pzV-2J3E
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 12:27:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D94D66011F;
	Tue, 20 Jan 2026 12:27:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6533FC19423;
	Tue, 20 Jan 2026 12:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768912059;
	bh=b7Mbdz/B6k9B79H7XOHyXFan5oK4QyoZB2R8RyLKnA0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qyvATZaSrEe49sh1pTLv223SMZUXupyJ7AEH8b7OsfHEeQacfJO00Zf/WzAHWL9E4
	 YdtXc3YZVh9NSGcUhAD2bQvcACJ5PrjSRas0X6y7UOImj3QPKnx5QP1rSKYrFh5Mts
	 ukTURbyHiw+A+Kz5Vf26qHNwrORw2S4F45MPwEjPavVEHNIxp5dnd7uk7o0/DPXX7+
	 g73KWaKHxGDsX8vefv3wZzROajBumN3ybV4NMn2T3AnSa9jpAw36eCJjIuqT/JPkF0
	 Dt5GgYa0z7KnbSSkgeEZDb889qUkR918KJJZNX1gKKxnazEduQBZ+Q4614JxO2KCTn
	 WhoIppH/1oyUw==
Date: Tue, 20 Jan 2026 12:27:33 +0000
From: Will Deacon <will@kernel.org>
To: Barry Song <21cnbao@gmail.com>
Subject: Re: [PATCH v2 1/8] arm64: Provide dcache_by_myline_op_nosync helper
Message-ID: <aW90tXGtLVC0mKWP@willie-the-truck>
References: <20251226225254.46197-1-21cnbao@gmail.com>
 <20251226225254.46197-2-21cnbao@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251226225254.46197-2-21cnbao@gmail.com>
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
Cc: Tangquan Zheng <zhengtangquan@oppo.com>, Barry Song <baohua@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>, Leon Romanovsky <leon@kernel.org>, Anshuman Khandual <anshuman.khandual@arm.com>, catalin.marinas@arm.com, linux-kernel@vger.kernel.org, Suren Baghdasaryan <surenb@google.com>, iommu@lists.linux.dev, Marc Zyngier <maz@kernel.org>, xen-devel@lists.xenproject.org, robin.murphy@arm.com, Ard Biesheuvel <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Sat, Dec 27, 2025 at 11:52:41AM +1300, Barry Song wrote:
> From: Barry Song <baohua@kernel.org>
> 
> dcache_by_myline_op ensures completion of the data cache operations for a
> region, while dcache_by_myline_op_nosync only issues them without waiting.
> This enables deferred synchronization so completion for multiple regions
> can be handled together later.
> 
> Cc: Leon Romanovsky <leon@kernel.org>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Marek Szyprowski <m.szyprowski@samsung.com>
> Cc: Robin Murphy <robin.murphy@arm.com>
> Cc: Ada Couprie Diaz <ada.coupriediaz@arm.com>
> Cc: Ard Biesheuvel <ardb@kernel.org>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Anshuman Khandual <anshuman.khandual@arm.com>
> Cc: Ryan Roberts <ryan.roberts@arm.com>
> Cc: Suren Baghdasaryan <surenb@google.com>
> Cc: Tangquan Zheng <zhengtangquan@oppo.com>
> Signed-off-by: Barry Song <baohua@kernel.org>
> ---
>  arch/arm64/include/asm/assembler.h  | 24 +++++++++++++++++++-----
>  arch/arm64/kernel/relocate_kernel.S |  3 ++-
>  2 files changed, 21 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/assembler.h b/arch/arm64/include/asm/assembler.h
> index f0ca7196f6fa..b408ed61866f 100644
> --- a/arch/arm64/include/asm/assembler.h
> +++ b/arch/arm64/include/asm/assembler.h
> @@ -371,14 +371,13 @@ alternative_endif
>   * [start, end) with dcache line size explicitly provided.
>   *
>   * 	op:		operation passed to dc instruction
> - * 	domain:		domain used in dsb instruction
>   * 	start:          starting virtual address of the region
>   * 	end:            end virtual address of the region
>   *	linesz:		dcache line size
>   * 	fixup:		optional label to branch to on user fault
>   * 	Corrupts:       start, end, tmp
>   */
> -	.macro dcache_by_myline_op op, domain, start, end, linesz, tmp, fixup
> +	.macro raw_dcache_by_myline_op op, start, end, linesz, tmp, fixup
>  	sub	\tmp, \linesz, #1
>  	bic	\start, \start, \tmp
>  .Ldcache_op\@:
> @@ -402,14 +401,13 @@ alternative_endif
>  	add	\start, \start, \linesz
>  	cmp	\start, \end
>  	b.lo	.Ldcache_op\@
> -	dsb	\domain

Naming nit, but I'd prefer this to be dcache_by_myline_op_nosync() for
consistency with the other macros that you're adding. The 'raw' prefix
is used by raw_dcache_line_size() to indicate that we're getting the
value from the underlying hardware register.

>  
>  	_cond_uaccess_extable .Ldcache_op\@, \fixup
>  	.endm
>  
>  /*
>   * Macro to perform a data cache maintenance for the interval
> - * [start, end)
> + * [start, end) and wait for completion
>   *
>   * 	op:		operation passed to dc instruction
>   * 	domain:		domain used in dsb instruction
> @@ -420,7 +418,23 @@ alternative_endif
>   */
>  	.macro dcache_by_line_op op, domain, start, end, tmp1, tmp2, fixup
>  	dcache_line_size \tmp1, \tmp2
> -	dcache_by_myline_op \op, \domain, \start, \end, \tmp1, \tmp2, \fixup
> +	raw_dcache_by_myline_op \op, \start, \end, \tmp1, \tmp2, \fixup
> +	dsb \domain
> +	.endm

This could just be dcache_by_line_op_nosync() + dsb.

Will

