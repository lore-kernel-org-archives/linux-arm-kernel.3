Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 473A8C4451B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 08:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AsOZ7XfSvbIf3BMwD/e9SnYeGyYjuUGA0WNws0sPDDo=; b=FcQ7fMTDQAigy0fgswKgKVG83j
	PlrnyR5xlGrmD0bWOP1gpS4pULppbIL4Evhki+asfKumF6fTr3y8Easmz8bwhmUkQPxG/6J36v1Dv
	6cTq1rw2k0qQirxd0S/YoTRaTrn035kPlDNM70j5HCh49bCBJR/IA30QMJbOFedF5A+qkgJcGAA70
	980k/nnKC4kXA2S6LlKFFdoTYafmDXDSSPdA4a2IQMX5+id1keUGg5GZZueEpnM+gO2D/0tbPxy2E
	vFBNf7BiYGTF/lgGpxwddXpbtjk0nsdQG7PN2TnxHxFJ8t3a7AypXbe289uPJNaD7Lz/Jg69Jpt7/
	HWtvOUEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wljT2-00000006D3v-0OCb;
	Mon, 20 Jul 2026 08:35:16 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wljSz-00000006D2o-1jgN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 08:35:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ABA102B;
	Mon, 20 Jul 2026 01:35:05 -0700 (PDT)
Received: from J2N7QTR9R3.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F01EE3F66F;
	Mon, 20 Jul 2026 01:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784536509; bh=Zd1wpy6j5eslq7JRXhCnn94i7JTqW6/xMDM1ttvsk3g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VUn7VLZzdIMhGN3GGLPkKrxXQfjuWBcPIW477yxizdTHNbmLa/OZf+x0wuxuItp02
	 QNyX7iMqH/Pn3VO1oTNTKDwZgmsnJilYT38hOOR/cYKWtWg/Q1CVC2D8Jrx3xhmDak
	 Btdy42sgXTdxHVr1o7vv5WzoU0Ldc0ZrIxc07c8A=
Date: Mon, 20 Jul 2026 09:35:01 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Wei-Lin Chang <weilin.chang@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>, Fuad Tabba <tabba@google.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Dev Jain <dev.jain@arm.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Sebastian Ene <sebastianene@google.com>,
	Vincent Donnefort <vdonnefort@google.com>
Subject: Re: [PATCH] KVM: arm64: ptdump: Flush the last region
Message-ID: <al3dtUVPxBXY0AJP@J2N7QTR9R3.cambridge.arm.com>
References: <20260717231233.2299068-1-weilin.chang@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260717231233.2299068-1-weilin.chang@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_013513_622020_A9D00D12 
X-CRM114-Status: GOOD (  27.50  )
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

On Sat, Jul 18, 2026 at 12:12:33AM +0100, Wei-Lin Chang wrote:
> Currently the stage-2 ptdump calls note_page() at each leaf entry visit.
> This simply misses the output of the last region, because note_page()
> only dumps output when it detects a change in level/prot, or when the
> walk enters a next marker section. The last region in the guest IPA
> space with the same level/prot is not dumped since there is no change
> after it.
> 
> To dump the final region, manually issue a note_page() call with address
> BIT(ia_bits) (end of guest IPA space) and level == -1 to trigger a level
> change after the last region. Additionally treat level == -1 as a last
> flushing note_page() call and avoid dumping the name of the next marker
> for this case.

I think you can use note_page_flush() rather than doing that manually.

> Fixes: 7c4f73548ed1 ("KVM: arm64: Register ptdump with debugfs on guest creation")
> Reported-by: Sashiko AI <sashiko-bot@kernel.org>
> Closes: https://lore.kernel.org/kvmarm/20260630122758.891011F00A3A@smtp.kernel.org/
> Signed-off-by: Wei-Lin Chang <weilin.chang@arm.com>
> ---
>  arch/arm64/kvm/ptdump.c | 8 +++++---
>  arch/arm64/mm/ptdump.c  | 5 +++--
>  2 files changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm64/kvm/ptdump.c b/arch/arm64/kvm/ptdump.c
> index c9140e22abcf..4096e4a92fae 100644
> --- a/arch/arm64/kvm/ptdump.c
> +++ b/arch/arm64/kvm/ptdump.c
> @@ -155,11 +155,13 @@ static int kvm_ptdump_guest_show(struct seq_file *m, void *unused)
>  		.seq		= m,
>  	};
>  
> -	write_lock(&kvm->mmu_lock);
> +	guard(write_lock)(&kvm->mmu_lock);
>  	ret = kvm_pgtable_walk(mmu->pgt, 0, BIT(mmu->pgt->ia_bits), &walker);
> -	write_unlock(&kvm->mmu_lock);
> +	if (ret)
> +		return ret;
> +	note_page(&st->parser_state.ptdump, BIT(mmu->pgt->ia_bits), -1, 0);

This can be:

	note_page_flush(&st->parser_state.ptdump);

The level change alone should trigger the dump, so the address doesn't
need to be at the end of the guest IPA space.

Importantly, note_page_flush() will pass 0 as the address, which won't
trigger the checks you try to suppress below.

Please use note_page_flush() here, and drop the changes to
arch/arm64/mm/ptdump.c.

>  
> -	return ret;
> +	return 0;
>  }
>  
>  static int kvm_ptdump_guest_open(struct inode *m, struct file *file)
> diff --git a/arch/arm64/mm/ptdump.c b/arch/arm64/mm/ptdump.c
> index ab9899ca1e5f..fed4e4407e0e 100644
> --- a/arch/arm64/mm/ptdump.c
> +++ b/arch/arm64/mm/ptdump.c
> @@ -194,6 +194,7 @@ void note_page(struct ptdump_state *pt_st, unsigned long addr, int level,
>  	struct ptdump_pg_state *st = container_of(pt_st, struct ptdump_pg_state, ptdump);
>  	struct ptdump_pg_level *pg_level = st->pg_level;
>  	static const char units[] = "KMGTPE";
> +	bool flush = level == -1;
>  	ptdesc_t prot = 0;
>  
>  	/* check if the current level has been folded dynamically */
> @@ -234,7 +235,7 @@ void note_page(struct ptdump_state *pt_st, unsigned long addr, int level,
>  				  pg_level[st->level].num);
>  		pt_dump_seq_puts(st->seq, "\n");
>  
> -		if (addr >= st->marker[1].start_address) {
> +		if (addr >= st->marker[1].start_address && !flush) {
>  			st->marker++;
>  			pt_dump_seq_printf(st->seq, "---[ %s ]---\n", st->marker->name);
>  		}

If you use note_page_flush(), addr will be 0. As the final marker is at
BIT(pgtable->ia_bits), this condition cannot fire.

> @@ -244,7 +245,7 @@ void note_page(struct ptdump_state *pt_st, unsigned long addr, int level,
>  		st->level = level;
>  	}
>  
> -	if (addr >= st->marker[1].start_address) {
> +	if (addr >= st->marker[1].start_address && !flush) {
>  		st->marker++;
>  		pt_dump_seq_printf(st->seq, "---[ %s ]---\n", st->marker->name);
>  	}

Likewise here.

Mark.

