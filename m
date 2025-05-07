Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B081C3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 14:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=itiAKH/qyzk2G1rxsfsMZTesmMe+S0RmGndga1TUm2g=; b=B/tMCn62npyXbNG6H3gUvReDeR
	w/qwQ3lnpr4Yji/m9nYJJtYCSfpRIQqWDVANyXTvGokt2bf7Vthj6KVBE8tL2Fi5971jvwbu7nv6+
	ga6q0F9DxyVKaV8Hf2UyFg/tLC3CTJu58KGdBtBN785FjRvuRaDFpW+XeZoJkFvzNJr2M+FiCowHD
	MUIA6s6JJRBQYmE1XohTZl7xE1TFW5OQJyvNXznFC+xvvRK8EW8kfsU4BX9/DI6Wj5Ap1/o3Iakz2
	mplWtMGaBISox4u+lvPGXcCfJnhAJbLmGoTIv0DOfPIQh851tYPBvcbmn0QKmjPnKAUxCgrucyPUL
	22r143qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCgAu-0000000Frij-21qT;
	Wed, 07 May 2025 14:55:08 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCfej-0000000FkXF-36tG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 14:21:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CC76816F2;
	Wed,  7 May 2025 07:21:41 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 25A383F5A1;
	Wed,  7 May 2025 07:21:48 -0700 (PDT)
Date: Wed, 7 May 2025 15:21:46 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, broonie@kernel.org,
	catalin.marinas@arm.com, daniel.kiss@arm.com,
	david.spickett@arm.com, luis.machado@arm.com, maz@kernel.org,
	richard.sandiford@arm.com, sander.desmalen@arm.com,
	tabba@google.com, tamas.petz@arm.com, tkjos@google.com,
	yury.khrustalev@arm.com
Subject: Re: [PATCH 04/20] arm64/fpsimd: signal: Mandate SVE payload for
 streaming-mode state
Message-ID: <aBtsesMtp299EWaR@J2N7QTR9R3>
References: <20250506152523.1107431-1-mark.rutland@arm.com>
 <20250506152523.1107431-5-mark.rutland@arm.com>
 <20250507125915.GB2227@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250507125915.GB2227@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_072153_902472_33D80877 
X-CRM114-Status: GOOD (  20.27  )
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

On Wed, May 07, 2025 at 01:59:16PM +0100, Will Deacon wrote:
> On Tue, May 06, 2025 at 04:25:07PM +0100, Mark Rutland wrote:
> > @@ -416,7 +418,16 @@ static int restore_sve_fpsimd_context(struct user_ctxs *user)
> >  	if (user_vl != vl)
> >  		return -EINVAL;
> >  
> > -	if (user->sve_size == sizeof(*user->sve)) {
> > +	/*
> > +	 * Non-streaming SVE state may be preserved without an SVE payload, in
> > +	 * which case the SVE context only has a header with VL==0, and all
> > +	 * state can be restored from the FPSIMD context.
> > +	 *
> > +	 * Streaming SVE state is always preserved with an SVE payload. For
> > +	 * consistency and robustness, reject restoring streaming SVE state
> > +	 * without an SVE payload.
> > +	 */
> > +	if (!sm && user->sve_size == sizeof(*user->sve)) {
> >  		clear_thread_flag(TIF_SVE);
> >  		current->thread.svcr &= ~SVCR_SM_MASK;
> >  		current->thread.fp_type = FP_STATE_FPSIMD;
> 
> This (along with the 'fpsimd_only:' block) is now practically identical
> to restore_fpsimd_context(). I think that's a sign that we're doing the
> right thing, but can we move that into a shared helper function?

Largely yes, but there's a subtlety.

We can call restore_fpsimd_context() directly for the block above, since
that's equivalent as of the prior patch.

The "fpsimd_only" label is misleading, and is used in two distinct
cases:

(1) When the SVE context has no register state, that's used to resrtore
    an FPSIMD-only context, and is (now) equivalent to
    restore_fpsimd_context().

(2) When the SVE context has register state, we restore the SVE state,
    then fall through to the "fpsimd_only" block to merge the the FPSIMD
    registers into the SVE registers, preserving the upper bits.

    The merging is hidden opaquely in fpsimd_update_current_state().

So we can call restore_fpsimd_context() directly for the !SVE case, and
we can factor out reading the user_fpsimd_state, but for case 2 we MUST
NOT mess with TIF_SVE, SVCR, or fp_type, and MUST merge the register
contents.

If we do that, I'd want to have restore_fpsimd_context() directly assign
to current->thread.uw.fpsimd_state, and replace
restore_sve_fpsimd_context() with a new fpsimd_merge_into_sve() helper
or similar.

If that makes sense, I can go prep tha as a follow-up?

Mark.

