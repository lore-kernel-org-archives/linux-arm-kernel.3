Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F848C3ABBF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 14:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qDl53n7Dnmn6h7P9wfqGR7ews7Vn6hfnteSyPmua2KA=; b=UMshXlItTBqBIYTGhNCuz97y0m
	gCMFyGi2WWtF3qaP+qs9nZ10aIr6qHQ5TMY7rn6pfzFe4vtdrQ8fJ7m6EwTeAB1ySvdz7TQdijG1S
	RYxp55e5jEbQLByi8vNxBPK8ElHYkGXOrAfJEg6IGkouiscAE/Hbzmu1xoYiZmBwZcNx40hOGJ/X+
	TBxu01LelXy2M2wZ81Cbf1WBlMlbkm174QreIemncb5t65+xapcJXfbUkZxZSZ4dUlKeEV3PCQqYP
	lQKADXjUgz4Jv9pmYw+Od/bQMSKAHT3wrn32eLbgyX+xyJaXYwaehyu5qCCdSYPdinqoHV14dXZ+0
	uJMDxl3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCgCq-0000000Fs4q-0opS;
	Wed, 07 May 2025 14:57:08 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCfmN-0000000FmDz-03uR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 14:29:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A325B5C5E40;
	Wed,  7 May 2025 14:27:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E4A4C4CEE2;
	Wed,  7 May 2025 14:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746628185;
	bh=6sISiQBCChg13SNjMqNDZmHnepNRO/PsVHQbc4omQzU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q80/am+X2SVW1T9QqjaNXUKMWMuQ2QjPdpz/VEuHYUFNsvlldR4MyaCdEDyjWIwOH
	 XTZoY226Wttv8NXwZWwL0GM7H11bEhAfXAgGSunHxcsagzUtF+p568RtGrQ2wNSdYt
	 UjneAeXvvns4rdIYgFbevux4JG7Lkd46JgTtlxv13MaxxGqIHwPE3nfewajRDDxd9H
	 7dvigkwjDhuK3QiipbwpoiyPtNnY4cQrz++qotPpFTHIxLVD18qY+wKYTHhbTfHHLh
	 KvgG5rHY6cQGBCJvQ0i+ZIlbBfou/OfwaqxM5c3Ft4fd8bMCi4Ij/TmGZw93pDn1HD
	 Nr1wyhpPVK5bg==
Date: Wed, 7 May 2025 15:29:39 +0100
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
Message-ID: <20250507142937.GA2475@willie-the-truck>
References: <20250506152523.1107431-1-mark.rutland@arm.com>
 <20250506152523.1107431-5-mark.rutland@arm.com>
 <20250507125915.GB2227@willie-the-truck>
 <aBtsesMtp299EWaR@J2N7QTR9R3>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBtsesMtp299EWaR@J2N7QTR9R3>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_072947_168738_44913039 
X-CRM114-Status: GOOD (  24.85  )
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

On Wed, May 07, 2025 at 03:21:46PM +0100, Mark Rutland wrote:
> On Wed, May 07, 2025 at 01:59:16PM +0100, Will Deacon wrote:
> > On Tue, May 06, 2025 at 04:25:07PM +0100, Mark Rutland wrote:
> > > @@ -416,7 +418,16 @@ static int restore_sve_fpsimd_context(struct user_ctxs *user)
> > >  	if (user_vl != vl)
> > >  		return -EINVAL;
> > >  
> > > -	if (user->sve_size == sizeof(*user->sve)) {
> > > +	/*
> > > +	 * Non-streaming SVE state may be preserved without an SVE payload, in
> > > +	 * which case the SVE context only has a header with VL==0, and all
> > > +	 * state can be restored from the FPSIMD context.
> > > +	 *
> > > +	 * Streaming SVE state is always preserved with an SVE payload. For
> > > +	 * consistency and robustness, reject restoring streaming SVE state
> > > +	 * without an SVE payload.
> > > +	 */
> > > +	if (!sm && user->sve_size == sizeof(*user->sve)) {
> > >  		clear_thread_flag(TIF_SVE);
> > >  		current->thread.svcr &= ~SVCR_SM_MASK;
> > >  		current->thread.fp_type = FP_STATE_FPSIMD;
> > 
> > This (along with the 'fpsimd_only:' block) is now practically identical
> > to restore_fpsimd_context(). I think that's a sign that we're doing the
> > right thing, but can we move that into a shared helper function?
> 
> Largely yes, but there's a subtlety.
> 
> We can call restore_fpsimd_context() directly for the block above, since
> that's equivalent as of the prior patch.
> 
> The "fpsimd_only" label is misleading, and is used in two distinct
> cases:
> 
> (1) When the SVE context has no register state, that's used to resrtore
>     an FPSIMD-only context, and is (now) equivalent to
>     restore_fpsimd_context().
> 
> (2) When the SVE context has register state, we restore the SVE state,
>     then fall through to the "fpsimd_only" block to merge the the FPSIMD
>     registers into the SVE registers, preserving the upper bits.
> 
>     The merging is hidden opaquely in fpsimd_update_current_state().
> 
> So we can call restore_fpsimd_context() directly for the !SVE case, and
> we can factor out reading the user_fpsimd_state, but for case 2 we MUST
> NOT mess with TIF_SVE, SVCR, or fp_type, and MUST merge the register
> contents.

Right, all I'm suggesting here is to remove the 'fpsimd_only:' label and
call into a restore_fpsimd_context()-like helper function in the
FPSIMD-only case. We can leave the SVE case as-is (and potentially
de-duplicate the copying later on if we want to).

Will

