Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA7A9C3ABBF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 17:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eoTdOE6Y83kPr+c6SXhSvGb+cg/4NCXlFWGNkt8Pb9k=; b=lhM6BDEGsUrpZ8vAJ+XwsslEbJ
	bXv/0QA+E35M6thbt+wKTQgQedHtPAA/fIwuJjLbLtOGNzjyBl9IBeNRc6DDEUPEIyDUvx8IZciNQ
	MK1/vlZNfqdOwduVPkW8hV2ZxVk0fQ/d60VGv4/rk2pWUSX593jVuUYfxLlJ1O2SkpqDLnLeQrDJu
	GFF7N6q+y9TnoDryrrMTjmbI7d7LI10y5LVZd4wLak/aOETGUcdr9OaDPOVxNHt+gDWJFymmvJFOs
	W4sySsltbX5522UZjUEumlhSTRUt3500BsQzzoap1/mhR0BZqAEbJExj/seeweBIke6PXDL91mPKQ
	k4zixH0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCiXG-0000000GJAs-02yY;
	Wed, 07 May 2025 17:26:22 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uChQ8-0000000G7cB-12Jj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 16:14:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 77D67A4DB48;
	Wed,  7 May 2025 16:14:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A959FC4CEEB;
	Wed,  7 May 2025 16:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746634495;
	bh=/VcoQnSnLjiwWZ0bYe5FmYR+ob26DBvPPRNvFAaqiHg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SE9po98Z8SJ2Xx6KtQsvjaBvpYqTgOrO/VnuSJdMVSlfRB0ZiWXC90ZjwLERYCD/6
	 yuO/lTAoYmjIajelr7pe/WzL4/2wsJar9NTD5Ms6GE+iSCaSF8r0nI6/GzAyxUjZTM
	 9xoQ6J24Z44uOF/vYCkZ1zc3FOFnnqkEhVYS+ETRzYkaWz8RBkmTT+GLIls5GmwqIO
	 t6MaRZcJv0Yqly989ARNBtSmBoYw7kYIVZqohF5RlU7gFtBIgsLmG7KyEK2lBzp8mg
	 im/lj3yyzsz6oCbhIIo97MlbNqtZlWYy39dYFTT3N3kGd3vNPX7PVFJFBkvVuMaDzb
	 Gugycdv9hHOFw==
Date: Wed, 7 May 2025 17:14:49 +0100
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
Message-ID: <20250507161448.GC2580@willie-the-truck>
References: <20250506152523.1107431-1-mark.rutland@arm.com>
 <20250506152523.1107431-5-mark.rutland@arm.com>
 <20250507125915.GB2227@willie-the-truck>
 <aBtsesMtp299EWaR@J2N7QTR9R3>
 <20250507142937.GA2475@willie-the-truck>
 <aBt2EJA42RegStj9@J2N7QTR9R3>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBt2EJA42RegStj9@J2N7QTR9R3>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_091456_423314_C19991D9 
X-CRM114-Status: GOOD (  29.47  )
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

On Wed, May 07, 2025 at 04:02:40PM +0100, Mark Rutland wrote:
> On Wed, May 07, 2025 at 03:29:39PM +0100, Will Deacon wrote:
> > On Wed, May 07, 2025 at 03:21:46PM +0100, Mark Rutland wrote:
> > > On Wed, May 07, 2025 at 01:59:16PM +0100, Will Deacon wrote:
> > > > On Tue, May 06, 2025 at 04:25:07PM +0100, Mark Rutland wrote:
> > > > > @@ -416,7 +418,16 @@ static int restore_sve_fpsimd_context(struct user_ctxs *user)
> > > > >  	if (user_vl != vl)
> > > > >  		return -EINVAL;
> > > > >  
> > > > > -	if (user->sve_size == sizeof(*user->sve)) {
> > > > > +	/*
> > > > > +	 * Non-streaming SVE state may be preserved without an SVE payload, in
> > > > > +	 * which case the SVE context only has a header with VL==0, and all
> > > > > +	 * state can be restored from the FPSIMD context.
> > > > > +	 *
> > > > > +	 * Streaming SVE state is always preserved with an SVE payload. For
> > > > > +	 * consistency and robustness, reject restoring streaming SVE state
> > > > > +	 * without an SVE payload.
> > > > > +	 */
> > > > > +	if (!sm && user->sve_size == sizeof(*user->sve)) {
> > > > >  		clear_thread_flag(TIF_SVE);
> > > > >  		current->thread.svcr &= ~SVCR_SM_MASK;
> > > > >  		current->thread.fp_type = FP_STATE_FPSIMD;
> > > > 
> > > > This (along with the 'fpsimd_only:' block) is now practically identical
> > > > to restore_fpsimd_context(). I think that's a sign that we're doing the
> > > > right thing, but can we move that into a shared helper function?
> > > 
> > > Largely yes, but there's a subtlety.
> > > 
> > > We can call restore_fpsimd_context() directly for the block above, since
> > > that's equivalent as of the prior patch.
> > > 
> > > The "fpsimd_only" label is misleading, and is used in two distinct
> > > cases:
> > > 
> > > (1) When the SVE context has no register state, that's used to resrtore
> > >     an FPSIMD-only context, and is (now) equivalent to
> > >     restore_fpsimd_context().
> > > 
> > > (2) When the SVE context has register state, we restore the SVE state,
> > >     then fall through to the "fpsimd_only" block to merge the the FPSIMD
> > >     registers into the SVE registers, preserving the upper bits.
> > > 
> > >     The merging is hidden opaquely in fpsimd_update_current_state().
> > > 
> > > So we can call restore_fpsimd_context() directly for the !SVE case, and
> > > we can factor out reading the user_fpsimd_state, but for case 2 we MUST
> > > NOT mess with TIF_SVE, SVCR, or fp_type, and MUST merge the register
> > > contents.
> > 
> > Right, all I'm suggesting here is to remove the 'fpsimd_only:' label and
> > call into a restore_fpsimd_context()-like helper function in the
> > FPSIMD-only case. We can leave the SVE case as-is (and potentially
> > de-duplicate the copying later on if we want to).
> 
> Yep, that makes sense to me.
> 
> I reckon that either makes sense to fold that into the prior patch
> rather than this one, or to do that as a separate patch.
> 
> Any preference?

Totally up to you.

Will

