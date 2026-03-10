Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C83AFFD4F0B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 17:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jDrxMFBJUn2g56puKrDmYg9mR0DKWnk70nfDH3iJd0A=; b=Lf+bcGfKKKP/wjT04h1R5gi1J6
	vIuULhgHrIF/35nUJNrKJCXTTeuCDb8ifsIbXHybsqNHNMNR7c22SpfmTDE/ugGO50fXCYtV8aZuA
	qEg13qTzxab3ECb4IdeWzfR2PSnhbI8mwuEc21X0Q4jcLDpOCCzDKWDNgtP7tsI7suCUUyGaQmHil
	N60yt6OT9ZOfhNs/KmeTvy0ARVBCKAqDBvcPuieqs/TmGcHhLHgve1Z7Rtv3eu+ArQ/NOG1hlytwn
	ph9l0EioluoxUBZisAe+tP934L1rq6t6z4IaV0n7iYtruSYFclKz+47AcfqHylB/3Xpj4iGogyjHk
	R4ZjVMOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w00p9-00000009zG1-2kma;
	Tue, 10 Mar 2026 17:24:51 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w00p7-00000009zFe-0Nre
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 17:24:50 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5ECBE14BF;
	Tue, 10 Mar 2026 10:24:40 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C5D383F694;
	Tue, 10 Mar 2026 10:24:45 -0700 (PDT)
Date: Tue, 10 Mar 2026 17:24:42 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Reda CHERKAOUI <redacherkaoui67@gmail.com>
Cc: will@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] arm64/mm: harden ASID allocator against empty bitmap
 after rollover
Message-ID: <abBT2gV84-9uaHkJ@arm.com>
References: <20260219113715.8001-1-redacherkaoui67@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260219113715.8001-1-redacherkaoui67@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_102449_170743_01E35A2F 
X-CRM114-Status: GOOD (  20.47  )
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

On Thu, Feb 19, 2026 at 11:37:14AM +0000, Reda CHERKAOUI wrote:
> new_context() assumes that after incrementing asid_generation and calling
> flush_context(), find_next_zero_bit() will always find a free ASID.
> 
> If that invariant is ever violated, __set_bit(NUM_USER_ASIDS, asid_map)
> would write past the end of the bitmap. Add a defensive check so the
> kernel fails loudly instead of silently corrupting memory.
> Cc: stable@vger.kernel.org
> 
> Signed-off-by: Reda CHERKAOUI <redacherkaoui67@gmail.com>
> ---
>  arch/arm64/mm/context.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/mm/context.c b/arch/arm64/mm/context.c
> index b2ac06246327..74c1ece7db78 100644
> --- a/arch/arm64/mm/context.c
> +++ b/arch/arm64/mm/context.c
> @@ -160,6 +160,7 @@ static u64 new_context(struct mm_struct *mm)
>  	static u32 cur_idx = 1;
>  	u64 asid = atomic64_read(&mm->context.id);
>  	u64 generation = atomic64_read(&asid_generation);
> +	unsigned long idx;
>  
>  	if (asid != 0) {
>  		u64 newasid = asid2ctxid(ctxid2asid(asid), generation);
> @@ -194,9 +195,11 @@ static u64 new_context(struct mm_struct *mm)
>  	 * a reserved TTBR0 for the init_mm and we allocate ASIDs in even/odd
>  	 * pairs.
>  	 */
> -	asid = find_next_zero_bit(asid_map, NUM_USER_ASIDS, cur_idx);
> -	if (asid != NUM_USER_ASIDS)
> +	idx = find_next_zero_bit(asid_map, NUM_USER_ASIDS, cur_idx);
> +	if (idx != NUM_USER_ASIDS) {
> +		asid = idx;
>  		goto set_asid;
> +	}
>  
>  	/* We're out of ASIDs, so increment the global generation count */
>  	generation = atomic64_add_return_relaxed(ASID_FIRST_VERSION,
> @@ -204,7 +207,10 @@ static u64 new_context(struct mm_struct *mm)
>  	flush_context();
>  
>  	/* We have more ASIDs than CPUs, so this will always succeed */
> -	asid = find_next_zero_bit(asid_map, NUM_USER_ASIDS, 1);
> +	idx = find_next_zero_bit(asid_map, NUM_USER_ASIDS, 1);
> +	if (unlikely(idx == NUM_USER_ASIDS))
> +		panic("ASID allocator: no free ASIDs after rollover\n");
> +	asid = idx;

How do you even hit this? Is it if you have less ASIDs than the number
of CPUs? The kernel complains about this in asids_update_limit.

Anyway, given how you are not following up on maintainer's comments, I
assume these patches are automatically generated.

-- 
Catalin

