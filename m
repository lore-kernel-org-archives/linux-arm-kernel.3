Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCC21C55184
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 13:18:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I/xJUBIsf5tc/tiVs7VEOF8KlHKQaO0v8ZsALjsK6og=; b=RnxKVbcg1Bdds4WqCZ/5pbijhU
	7WkA0vOB5TPlzB31U3YAVLfp9sGMK25pIzxXBnmpH4KwIWdaekm6XVS7buwkjXee8aI6o8keK2ogN
	E7WpkiS7efVSDJ9P7ajDocNP9E9VkIR55m5IpHVM+nxskgrlLMpc+4jV7+fgCzE2vjGQotqDr0ybc
	go3SKkVPsj3DdRQGla1+Oqkra7nyG+bSooo+JTlFTtMXdyle9Pagq4Ltre/tsBCRCd3jxHs4JoOev
	xURupkwUCQ5o6Po/fFvMWs2KoVnQ0Cn8WVDvxE2cvdV8vrZ4I76LPO6ry9RfgqvCaGmMRi68q9yLj
	Qr9hacQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrF1s-00000001u28-2bgF;
	Tue, 04 Aug 2026 13:18:00 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrF1q-00000001u1p-42oQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 13:17:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 68ACB429EC;
	Tue,  4 Aug 2026 13:17:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 588A91F000E9;
	Tue,  4 Aug 2026 13:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785849477;
	bh=I/xJUBIsf5tc/tiVs7VEOF8KlHKQaO0v8ZsALjsK6og=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=a+2tuoyCeQfldI1lbv6MGEskpRSxVFaek1rvE5zs6SOcwXL9xKDw+tEuVnDiHDdIR
	 NVgUel9QhOsqPS5SwqYlDWQzIg2OJxf/DPJYni3VAS/5jGCzOqmUT8+0qNmAfJnWgy
	 9q25hWpEjcOSni+DpEOYl15ZC6B7IMkcwjMPxBk79qp1y4MwpdvCnGP0jbJeUWOK5v
	 DJROoZnm7RyRJ4TqD60ij4VYaSGdXUAw8INMu7IL7uXe5lN9KLC/OgRe2UjD4e2pD1
	 YsHiWuGiL8wZ9Urqq686JdnSV7/X3NJfIPbwGcywnuYVXrlFwEvozsWvugkbxCBFAK
	 qtCcGxIv1B8sA==
Date: Tue, 4 Aug 2026 14:17:52 +0100
From: Will Deacon <will@kernel.org>
To: Bradley Morgan <include@grrlz.net>
Cc: catalin.marinas@arm.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: sleep: factor sleep_save_stash slot lookup
 into a macro
Message-ID: <anHmgJgrPbd31Il8@willie-the-truck>
References: <20260717114746.15109-1-include@grrlz.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260717114746.15109-1-include@grrlz.net>
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

On Fri, Jul 17, 2026 at 11:47:46AM +0000, Bradley Morgan wrote:
> Both __cpu_suspend_enter() and _cpu_resume() open code the same
> MPIDR_EL1 hash lookup to find the current CPU's slot in
> sleep_save_stash. Factor it into a get_sleep_stash_slot
> macro.
> 
> Since that macro would be the only remaining user of
> compute_mpidr_hash, inline the hash computation into
> get_sleep_stash_slot and just remove compute_mpidr_hash
> altogether.
> 
> No functional change intended.
> 
> Signed-off-by: Bradley Morgan <include@grrlz.net>
> ---
> Changes since V1:
> - Inline the macro, there only is one user. (Will)
> - Also change the C psuedocode to be correct
> 
>  arch/arm64/kernel/sleep.S | 103 +++++++++++++++-----------------------
>  1 file changed, 41 insertions(+), 62 deletions(-)
> 
> diff --git a/arch/arm64/kernel/sleep.S b/arch/arm64/kernel/sleep.S
> index f093cdf71be1..dcf00a4d6233 100644
> --- a/arch/arm64/kernel/sleep.S
> +++ b/arch/arm64/kernel/sleep.S
> @@ -7,48 +7,48 @@
>  
>  	.text
>  /*
> - * Implementation of MPIDR_EL1 hash algorithm through shifting
> + * Compute the address of the current CPU's entry in sleep_save_stash,
> + * i.e. &sleep_save_stash[hash(MPIDR_EL1)], where the hash is an
> + * implementation of the MPIDR_EL1 hash algorithm through shifting
>   * and OR'ing.
>   *
> - * @dst: register containing hash result
> - * @rs0: register containing affinity level 0 bit shift
> - * @rs1: register containing affinity level 1 bit shift
> - * @rs2: register containing affinity level 2 bit shift
> - * @rs3: register containing affinity level 3 bit shift
> - * @mpidr: register containing MPIDR_EL1 value
> - * @mask: register containing MPIDR mask
> - *
>   * Pseudo C-code:
>   *
> - *u32 dst;
> + *	u64 mpidr = MPIDR_EL1 & mpidr_hash.mask;
> + *	u32 hash = ((mpidr & 0xff) >> mpidr_hash.shift_aff[0]) |
> + *		   ((mpidr & 0xff00) >> mpidr_hash.shift_aff[1]) |
> + *		   ((mpidr & 0xff0000) >> mpidr_hash.shift_aff[2]) |
> + *		   ((mpidr & 0xff00000000) >> mpidr_hash.shift_aff[3]);
> + *	slot = &sleep_save_stash[hash];
> + *
> + * @slot: output register
>   *
> - *compute_mpidr_hash(u32 rs0, u32 rs1, u32 rs2, u32 rs3, u64 mpidr, u64 mask) {
> - *	u32 aff0, aff1, aff2, aff3;
> - *	u64 mpidr_masked = mpidr & mask;
> - *	aff0 = mpidr_masked & 0xff;
> - *	aff1 = mpidr_masked & 0xff00;
> - *	aff2 = mpidr_masked & 0xff0000;
> - *	aff3 = mpidr_masked & 0xff00000000;
> - *	dst = (aff0 >> rs0 | aff1 >> rs1 | aff2 >> rs2 | aff3 >> rs3);
> - *}
> - * Input registers: rs0, rs1, rs2, rs3, mpidr, mask
> - * Output register: dst
> - * Note: input and output registers must be disjoint register sets
> -         (eg: a macro instance with mpidr = x1 and dst = x1 is invalid)
> + * Clobbers: x2 - x8
>   */
> -	.macro compute_mpidr_hash dst, rs0, rs1, rs2, rs3, mpidr, mask
> -	and	\mpidr, \mpidr, \mask		// mask out MPIDR bits
> -	and	\dst, \mpidr, #0xff		// mask=aff0
> -	lsr	\dst ,\dst, \rs0		// dst=aff0>>rs0
> -	and	\mask, \mpidr, #0xff00		// mask = aff1
> -	lsr	\mask ,\mask, \rs1
> -	orr	\dst, \dst, \mask		// dst|=(aff1>>rs1)
> -	and	\mask, \mpidr, #0xff0000	// mask = aff2
> -	lsr	\mask ,\mask, \rs2
> -	orr	\dst, \dst, \mask		// dst|=(aff2>>rs2)
> -	and	\mask, \mpidr, #0xff00000000	// mask = aff3
> -	lsr	\mask ,\mask, \rs3
> -	orr	\dst, \dst, \mask		// dst|=(aff3>>rs3)
> +	.macro get_sleep_stash_slot slot
> +	mrs	x3, mpidr_el1
> +	adr_l	x2, mpidr_hash
> +	ldr	x8, [x2, #MPIDR_HASH_MASK]
> +	/*
> +	 * Following code relies on the struct mpidr_hash
> +	 * members size.
> +	 */
> +	ldp	w4, w5, [x2, #MPIDR_HASH_SHIFTS]
> +	ldp	w6, w7, [x2, #(MPIDR_HASH_SHIFTS + 8)]
> +	and	x3, x3, x8			// mask out MPIDR bits
> +	and	x2, x3, #0xff			// aff0
> +	lsr	x2, x2, x4			// hash = aff0 >> rs0
> +	and	x8, x3, #0xff00			// aff1
> +	lsr	x8, x8, x5
> +	orr	x2, x2, x8			// hash |= aff1 >> rs1
> +	and	x8, x3, #0xff0000		// aff2
> +	lsr	x8, x8, x6
> +	orr	x2, x2, x8			// hash |= aff2 >> rs2
> +	and	x8, x3, #0xff00000000		// aff3
> +	lsr	x8, x8, x7
> +	orr	x2, x2, x8			// hash |= aff3 >> rs3
> +	ldr_l	\slot, sleep_save_stash
> +	add	\slot, \slot, x2, lsl #3	// slot = &sleep_save_stash[hash]

nit: In the old code, rs0-rs3 were arguments to the macro. Now that you've
removed those, the comments are stale.

Will

