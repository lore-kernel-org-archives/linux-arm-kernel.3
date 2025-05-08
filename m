Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8856CC3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 15:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R1wmYSav2qZSDgQyX4eumip0E6l48i1TqxULdFIMR+w=; b=IYkz5ITJyAOpMOybrKE6zLIAsK
	nih5LmRGTmUL5fKiiTNQFV8gtGHNIAQhX5Wu8xUTjc7sTmXd4myD1yPoM5a647YGNAmv/YrXBl/dX
	PoLON67LNkC4czDAJfn0GYmjPrcdIdckqVKHRmCN/ht5ge0X+tw7TvqLjihaoKkU37KWbaXzEMe+Y
	3Dv4IdSPXL1XxtaTYNszQZRr37kcKaBhDR2+xB/8CPgbwTwHcDXSfFy6t8as2m9Z6hAbFO+LpA89F
	V29/dV2l1QicFEWL2nHtWqh2bLKenhHbFqiohWRYTG8yBr2i1TXX5/tVtaICCKmC7qOqfyX8CUqbQ
	Xyv9JsJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD2vA-000000015Bd-0mDq;
	Thu, 08 May 2025 15:12:24 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD2KT-00000000wfx-4BTV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 14:34:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6EFE3629DC;
	Thu,  8 May 2025 14:34:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB0C4C4CEE7;
	Thu,  8 May 2025 14:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746714869;
	bh=4f4Ke7iTNV69FxQ9ETQePo+JdHzLJJDI+2CXrm9j0sk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DXWkr0+ACJYT4u8HdGgqH4JrUEDzs0wtxbT6FYfC7NG07J5vrtrh344MrEFJ2/hUt
	 ZaTPhkKZijKZhcyNo+boBkd4Mp9vZ2dUXg7KXvaxrcRN5oIPBaGHV7CYn0iruplEDs
	 aU5/60aTQ4Dk6w/DjPYM9AWOYcfWt/Hu5CIibJNK63VKSU/FFp3ChH1uEuoTu+V0ZI
	 SSqThaN05HNsxaiSb2NCYx/wPr5XzGsqeJsYYRDc8EAgMXSpprrvKgqjFMD0dFIR5v
	 Ayn4U+6btmIgtqBOEstP5DGorjNTZ1aKfgcSY6D0v6iGons1IWwbWIqbisFEw4QmkL
	 69QB7cUHZr+Pg==
Date: Thu, 8 May 2025 15:34:23 +0100
From: Will Deacon <will@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, broonie@kernel.org,
	catalin.marinas@arm.com, daniel.kiss@arm.com,
	david.spickett@arm.com, luis.machado@arm.com, maz@kernel.org,
	richard.sandiford@arm.com, sander.desmalen@arm.com,
	tabba@google.com, tamas.petz@arm.com, tkjos@google.com,
	yury.khrustalev@arm.com
Subject: Re: [PATCH v2 04/24] arm64/fpsimd: signal: Consistently read FPSIMD
 context
Message-ID: <20250508143422.GA4189@willie-the-truck>
References: <20250508132644.1395904-1-mark.rutland@arm.com>
 <20250508132644.1395904-5-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250508132644.1395904-5-mark.rutland@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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

On Thu, May 08, 2025 at 02:26:24PM +0100, Mark Rutland wrote:
> For historical reasons, restore_sve_fpsimd_context() has an open-coded
> copy of the logic from read_fpsimd_context(), which is used to either
> restore an FPSIMD-only context, or to merge FPSIMD state into an
> SVE state when restoring an SVE+FPSIMD context. The logic is *almost*
> identical.
> 
> Refactor the logic to avoid duplication and make this clearer.
> 
> This comes with two functional changes that I do not believe will be
> problematic in practice:
> 
> * The user_fpsimd_state::size field will be checked in all restore paths
>   that consume it user_fpsimd_state. The kernel always populates this
>   field when delivering a signal, and so this should contain the
>   expected value unless it has been corrupted.
> 
> * If a read of user_fpsimd_state fails, we will return early without
>   modifying TIF_SVE, the saved SVCR, or the save fp_type. This will
>   leave the task in a consistent state, without potentially resurrecting
>   stale FPSIMD state. A read of user_fpsimd_state should never fail
>   unless the structure has been corrupted or the stack has been
>   unmapped.
> 
> Suggested-by: Will Deacon <will@kernel.org>
> Signed-off-by: Mark Rutland <mark.rutland@arm.com>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Will Deacon <will@kernel.org>
> ---
>  arch/arm64/kernel/signal.c | 57 +++++++++++++++++++-------------------
>  1 file changed, 29 insertions(+), 28 deletions(-)
> 
> diff --git a/arch/arm64/kernel/signal.c b/arch/arm64/kernel/signal.c
> index e898948a31b65..87890d7be8de3 100644
> --- a/arch/arm64/kernel/signal.c
> +++ b/arch/arm64/kernel/signal.c
> @@ -264,30 +264,40 @@ static int preserve_fpsimd_context(struct fpsimd_context __user *ctx)
>  	return err ? -EFAULT : 0;
>  }
>  
> -static int restore_fpsimd_context(struct user_ctxs *user)
> +static int read_fpsimd_context(struct user_fpsimd_state *fpsimd,
> +			       struct user_ctxs *user)
>  {
> -	struct user_fpsimd_state fpsimd;
> -	int err = 0;
> +	int err;
>  
>  	/* check the size information */
>  	if (user->fpsimd_size != sizeof(struct fpsimd_context))
>  		return -EINVAL;
>  
>  	/* copy the FP and status/control registers */
> -	err = __copy_from_user(fpsimd.vregs, &(user->fpsimd->vregs),
> -			       sizeof(fpsimd.vregs));
> -	__get_user_error(fpsimd.fpsr, &(user->fpsimd->fpsr), err);
> -	__get_user_error(fpsimd.fpcr, &(user->fpsimd->fpcr), err);
> +	err = __copy_from_user(fpsimd->vregs, &(user->fpsimd->vregs),
> +			       sizeof(fpsimd->vregs));
> +	__get_user_error(fpsimd->fpsr, &(user->fpsimd->fpsr), err);
> +	__get_user_error(fpsimd->fpcr, &(user->fpsimd->fpcr), err);
> +
> +	return err;

I think this should return -EFAULT if 'err' is non-zero, otherwise we
can probably propagate the number of bytes not copied from
__copy_from_user().

I'll fix that up when applying.

Cheers,

Will

