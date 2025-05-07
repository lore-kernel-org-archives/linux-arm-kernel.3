Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01D59C3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 13:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PTmTxu5G7BgiMXW/wo9QwHzkJTGUF9YeKognJlcuK04=; b=mXA3smJoN6VG3dE8bCMfVEHivH
	u+j6IJ9HnXqSeoBudy1RVnQzCCZ2/bg/E9khju7qeOSxCKS9mXI3Tm3WUFyPa29RlQzNfPmjZWtfU
	SOVxClx9KA0YxCi4baPVEPPo6xU+oB7ojzzkPlJiuvF+kiJCOznZ6rWulTtwJLLv17T0KM5tIR2GB
	b6fpo1XUht38cY5g0FIoXTVepLil4GMkBLRTWTFW+xlh4aHvvhyAXXxFkfxRpqyv80IaESgytHrz6
	WLyKjJA4ecQUbVjU4ayc8LvWtI0gCYvHjEIGGxDAbwf2MwiUpkd5ZLUJEs3nvZwmhNj0XFJObSYWu
	vJV0I86w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCeOr-0000000FUq5-1BzQ;
	Wed, 07 May 2025 13:01:25 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCeMt-0000000FUcY-058M
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 12:59:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6C3E94362F;
	Wed,  7 May 2025 12:59:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D708EC4CEE7;
	Wed,  7 May 2025 12:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746622762;
	bh=vvGHvomAzJFTzglASz0P6OSbJgoN6xFF6DskBbMGfLY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jv7Xbep+FxEgg4Ze7bfKFT8Y7W7cnjKbnbRTT64xwbdj1lejUkj+iIq8d08PINCVS
	 UnbNFYtiIp+sLy3DyEb3AahfBxhAfKYI/EAZDCw8hLr1rSKiqCnvq7YPl/FpcOlLbe
	 zyoyLSZ8uyx3CLfr+pONkUaPrYYM2FjyJCgDVq5NFib1M1NVJwE6dKafcnorBaoQ6R
	 DhpGweJPUjZ2ZE/ssolkha0FuRox+c2shMmgv2I1DG9jBDOioHxS1OTyVEd48V/L6b
	 thCx50NrNfok4k+7E0v35xByeEuquVzZyYqzjPRAMc81vsr/YfSJKLy4CuAQFOUciV
	 yrLKQv4kLsuuA==
Date: Wed, 7 May 2025 13:59:16 +0100
From: Will Deacon <will@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, broonie@kernel.org,
	catalin.marinas@arm.com, daniel.kiss@arm.com,
	david.spickett@arm.com, luis.machado@arm.com, maz@kernel.org,
	richard.sandiford@arm.com, sander.desmalen@arm.com,
	tabba@google.com, tamas.petz@arm.com, tkjos@google.com,
	yury.khrustalev@arm.com
Subject: Re: [PATCH 04/20] arm64/fpsimd: signal: Mandate SVE payload for
 streaming-mode state
Message-ID: <20250507125915.GB2227@willie-the-truck>
References: <20250506152523.1107431-1-mark.rutland@arm.com>
 <20250506152523.1107431-5-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250506152523.1107431-5-mark.rutland@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_055923_094327_35301772 
X-CRM114-Status: GOOD (  26.72  )
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

On Tue, May 06, 2025 at 04:25:07PM +0100, Mark Rutland wrote:
> Non-streaming SVE state may be preserved without an SVE payload, in
> which case the SVE context only has a header with VL==0, and all state
> can be restored from the FPSIMD context. Streaming SVE state is always
> preserved with an SVE payload, where the SVE context header has VL!=0,
> and the SVE_SIG_FLAG_SM flag is set.
> 
> The kernel never preserves an SVE context where SVE_SIG_FLAG_SM is set
> without an SVE payload. However, restore_sve_fpsimd_context() doesn't
> forbid restoring such a context, and will handle this case by clearing
> PSTATE.SM and restoring the FPSIMD context into non-streaming mode,
> which isn't consistent with the SVE_SIG_FLAG_SM flag.
> 
> Forbid this case, and mandate an SVE payload when the SVE_SIG_FLAG_SM
> flag is set. This avoids an awkward ABI quirk and reduces the risk that
> later rework to this code permits configuring a task with PSTATE.SM==1
> and fp_type==FP_STATE_FPSIMD.
> 
> I've marked this as a fix given that we never intended to support this
> case, and we don't want anyone to start relying upon the old behaviour
> once we re-enable SME.
> 
> Fixes: 85ed24dad290 ("arm64/sme: Implement streaming SVE signal handling")
> Signed-off-by: Mark Rutland <mark.rutland@arm.com>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Will Deacon <will@kernel.org>
> ---
>  arch/arm64/kernel/signal.c | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/kernel/signal.c b/arch/arm64/kernel/signal.c
> index fdce1b856f498..e898948a31b65 100644
> --- a/arch/arm64/kernel/signal.c
> +++ b/arch/arm64/kernel/signal.c
> @@ -387,6 +387,7 @@ static int restore_sve_fpsimd_context(struct user_ctxs *user)
>  	unsigned int vl, vq;
>  	struct user_fpsimd_state fpsimd;
>  	u16 user_vl, flags;
> +	bool sm;
>  
>  	if (user->sve_size < sizeof(*user->sve))
>  		return -EINVAL;
> @@ -396,7 +397,8 @@ static int restore_sve_fpsimd_context(struct user_ctxs *user)
>  	if (err)
>  		return err;
>  
> -	if (flags & SVE_SIG_FLAG_SM) {
> +	sm = flags & SVE_SIG_FLAG_SM;
> +	if (sm) {
>  		if (!system_supports_sme())
>  			return -EINVAL;
>  
> @@ -416,7 +418,16 @@ static int restore_sve_fpsimd_context(struct user_ctxs *user)
>  	if (user_vl != vl)
>  		return -EINVAL;
>  
> -	if (user->sve_size == sizeof(*user->sve)) {
> +	/*
> +	 * Non-streaming SVE state may be preserved without an SVE payload, in
> +	 * which case the SVE context only has a header with VL==0, and all
> +	 * state can be restored from the FPSIMD context.
> +	 *
> +	 * Streaming SVE state is always preserved with an SVE payload. For
> +	 * consistency and robustness, reject restoring streaming SVE state
> +	 * without an SVE payload.
> +	 */
> +	if (!sm && user->sve_size == sizeof(*user->sve)) {
>  		clear_thread_flag(TIF_SVE);
>  		current->thread.svcr &= ~SVCR_SM_MASK;
>  		current->thread.fp_type = FP_STATE_FPSIMD;

This (along with the 'fpsimd_only:' block) is now practically identical
to restore_fpsimd_context(). I think that's a sign that we're doing the
right thing, but can we move that into a shared helper function?

Will

