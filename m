Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07F72C5AC7C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 11:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bilPv4vNqhyKLaddPOoCIRutSih88yAAt4BHUIGsS9M=; b=0iw2GmLCWZ75+5NH/rjGOq+fCd
	Kz4VvifZ3EHcsHghgswv9Ac3p6cbBo7SjNjfDA7xJS0/Yu182fbUTRGaQxB3rGfiq6w91C7i1y3OH
	jGJHgU09j0kRGOmG+n4DtxMxP2kK2wgVZ9ogOtPNGmSIP/0JhF4V3Ukae1BzRO5gpkdkVyv5CxgYr
	2+RtMHQPc8lJI7vj3XhjKpjJWehD/BOum0F/EErHJXgs+eUtT7HCByXVDjU720LGKwk9cezHS7oRT
	q+xrFucrHllq2nfvUvAmv6p232PB2hAteE4LPg/MSt7dUMYiNJ395TdUpR4/gdvyREsGJirM05pms
	dfpN7tWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsJ2M-00000007yFM-3Haq;
	Fri, 07 Aug 2026 11:46:54 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsJ2L-00000007yF4-1b69
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 11:46:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id AE80560A5C;
	Fri,  7 Aug 2026 11:46:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABA001F000E9;
	Fri,  7 Aug 2026 11:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786103211;
	bh=bilPv4vNqhyKLaddPOoCIRutSih88yAAt4BHUIGsS9M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HCpugcR71onLMkdJPcNHQOu2krRWgO3cP7bphLbb7RUaCjLYeuggKDL65YAKZUbfZ
	 0m4JUJvfeIJIpGGPawUAeBGR/k75nPjU4UnrMcO27BvuPHulSgHuMDc75thTrx6sTh
	 b/A9s75dmzOL250NVrU9QqLQiW1mfNWijUH7GbwzpkQ15MFJrPfGFd4U03W/KUEHWg
	 L1PTAliQLZd7fOZnG4Qadiffmdiw8nJnxpbxZgNwv/rx4VSDMtAY4V4S8dMircmVbQ
	 T3GZHWr3d2XDuf4FkC6WOcEKPHqNXxVvluL2JJp14pAsOvlbELX92u8sOQrCDVzv0l
	 +ZaIEryqJat8g==
Date: Fri, 7 Aug 2026 12:46:43 +0100
From: Will Deacon <will@kernel.org>
To: Wei-Lin Chang <weilin.chang@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>, Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
	"David Hildenbrand (Arm)" <david@kernel.org>,
	Matt Fleming <matt@codeblueprint.co.uk>,
	Ard Biesheuvel <ardb@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Sebastian Ene <sebastianene@google.com>,
	Vincent Donnefort <vdonnefort@google.com>
Subject: Re: [PATCH v2 1/2] arm64: ptdump: Make note_page_flush() range aware
Message-ID: <anXFo-igVdqrCogQ@willie-the-truck>
References: <20260724185431.2990395-1-weilin.chang@arm.com>
 <20260724185431.2990395-2-weilin.chang@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260724185431.2990395-2-weilin.chang@arm.com>
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

On Fri, Jul 24, 2026 at 07:54:30PM +0100, Wei-Lin Chang wrote:
> note_page_flush() calls note_page() with addr == 0 and level == -1 to
> dump the last row of a ptdump. addr == 0 (1 << 64 wrapped around)
> renders a huge region with enormous size for address spaces with
> IA bits < 64. For example the stage-2 page tables and the EFI runtime
> page table.
> 
> More importantly, the last region of the address space and everything
> after the address space up to 1 << 64 are merged into one row of
> output. If the last region within the address space is valid, it will
> appear to remain valid up to 1 << 64 with the same attributes.
> 
> Currently only the EFI runtime ptdump is affected by this, but KVM will
> soon fix its stage-2 ptdump by using note_page_flush(). Here is an
> example of an EFI runtime ptdump (last row):
> 
> 0x0000008000000000-0x0000000000000000   17179868672G PGD
> 
> With this patch:
> 
> 0x0000008000000000-0x0001000000000000      261632G PGD
> 
> To fix this, use ptdump_state.range[] to figure out where the address
> space ends, and call note_page() with that.
> 
> Fixes: 9d80448ac92b ("efi/arm64: Add debugfs node to dump UEFI runtime page tables")
> Signed-off-by: Wei-Lin Chang <weilin.chang@arm.com>
> ---
>  arch/arm64/mm/ptdump.c | 17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/mm/ptdump.c b/arch/arm64/mm/ptdump.c
> index 1c20144700d7..5b34060ceb96 100644
> --- a/arch/arm64/mm/ptdump.c
> +++ b/arch/arm64/mm/ptdump.c
> @@ -278,9 +278,24 @@ void note_page_pgd(struct ptdump_state *pt_st, unsigned long addr, pgd_t pgd)
>  
>  void note_page_flush(struct ptdump_state *pt_st)
>  {
> +	const struct ptdump_range *range = pt_st->range;
> +	unsigned long end = 0;
>  	pte_t pte_zero = {0};
>  
> -	note_page(pt_st, 0, -1, pte_val(pte_zero));
> +	while (range->start != range->end) {
> +		end = range->end;
> +		range++;
> +	}

This seems to be duplicating some of what the core code does already in
ptdump_walk_pgd(). Can we retrieve the information we need from the
containing 'struct ptdump_pg_state' structure instead of recomputing
the address?

Will

