Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D2CBC4450A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 14:36:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KZ2Jay0loDqW4iEYRBZiTsQd8X5ZUn23JYIMxwnq18M=; b=Hl0BYCwovUv3FWpWiixA9pkqxI
	nhy0mcWhllJrwab1AoEpxSscCqRn1pgfxGBUU/LpWPyqxh0lqePNfy8OQwCeGKjn+IinBK9Wzgq6O
	vXn4vQl7bKs7LuttPacBA1txA8qmgsSfB0KihmeF8hZsnbr/9RboAo2q1Qg1rqDphIzdja83kcgVV
	NkTLx+ifnpd1l+oQM+vwnw0joVizxoB14oXalkmLMlfe3Puo9VHk5b1c4Z3BsGmkyNJC4EIscl6fZ
	acHzfga81ZoyllAVXv6XlP1U38VgOikwcOR9e8njUbgeowdIO/vP2cED8M7o7KdhauEb7lC2S5HfJ
	9boZko8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkNBr-0000000HVgC-16me;
	Thu, 16 Jul 2026 14:35:55 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkNBp-0000000HVfp-3k5F
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 14:35:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 95CF560A5A;
	Thu, 16 Jul 2026 14:35:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5973D1F000E9;
	Thu, 16 Jul 2026 14:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784212552;
	bh=KZ2Jay0loDqW4iEYRBZiTsQd8X5ZUn23JYIMxwnq18M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KFC5xmL2MtWypHwbA6buxOKY9HEtSEdHzfu24pmWP6h2HrFLPf2lujKqpqGXA96Np
	 T/kolpeW9AOmW1xCzEYHweRfAgFaQ9IjJkl9KxLL3F8XftO/irqT2zrrC/oF7Qoc0l
	 pv3AFbU/u9h8ILqaXbivkxE8x8siaxLgdcQVl9UkPEDG84DWHkSlz/fbSYH45FLHvR
	 iebXW+jO5AqRaPMBgf45KKs5/bs3cXtHLOkx2Lafp9ly1V57X2848bFu0BQMuTiDu5
	 YJqnVKSu2l79w2+CPNN1h0gj2S9GpIVkva7duBNqiw5xbbFvF2fepFp1NhfCbXMen+
	 qqL7ABdWr+0xg==
Date: Thu, 16 Jul 2026 15:35:48 +0100
From: Will Deacon <will@kernel.org>
To: Bradley Morgan <include@grrlz.net>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: sleep: dedup the sleep_save_stash slot lookup
Message-ID: <aljsRBIEzeNVdzvn@willie-the-truck>
References: <20260705192331.23150-1-include@grrlz.net>
 <20260705192331.23150-3-include@grrlz.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260705192331.23150-3-include@grrlz.net>
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

On Sun, Jul 05, 2026 at 07:23:31PM +0000, Bradley Morgan wrote:
> Both __cpu_suspend_enter() and _cpu_resume() open code the same MPIDR
> hash lookup. Factor it into a get_sleep_stash_slot macro.
> 
> Signed-off-by: Bradley Morgan <include@grrlz.net>
> ---
>  arch/arm64/kernel/sleep.S | 55 +++++++++++++++++++++------------------
>  1 file changed, 30 insertions(+), 25 deletions(-)
> 
> diff --git a/arch/arm64/kernel/sleep.S b/arch/arm64/kernel/sleep.S
> index e112b8537f10..8820a131aef7 100644
> --- a/arch/arm64/kernel/sleep.S
> +++ b/arch/arm64/kernel/sleep.S
> @@ -64,6 +64,31 @@
>  	lsr	\mask ,\mask, \rs3
>  	orr	\dst, \dst, \mask		// dst|=(aff3>>rs3)
>  	.endm
> +
> +/*
> + * Compute the address of the current CPU's entry in sleep_save_stash,
> + * i.e. &sleep_save_stash[hash(MPIDR_EL1)].
> + *
> + * @slot: output register
> + *
> + * Clobbers: x2 - x8
> + */
> +	.macro get_sleep_stash_slot slot
> +	mpidr_hash_assert_distinct \slot, x2
> +	mrs	x3, mpidr_el1
> +	adr_l	x2, mpidr_hash
> +	ldr	x8, [x2, #MPIDR_HASH_MASK]
> +	/*
> +	 * Following code relies on the struct mpidr_hash
> +	 * members size.
> +	 */
> +	ldp	w4, w5, [x2, #MPIDR_HASH_SHIFTS]
> +	ldp	w6, w7, [x2, #(MPIDR_HASH_SHIFTS + 8)]
> +	compute_mpidr_hash x2, x4, x5, x6, x7, x3, x8
> +	ldr_l	\slot, sleep_save_stash
> +	add	\slot, \slot, x2, lsl #3
> +	.endm

I think this would now be the only user of compute_mpidr_hash, so it's
probably better to inline that macro here and then we don't need to
bother with mpidr_hash_assert_distinct at all (i.e. your first patch
isn't needed).

Will

